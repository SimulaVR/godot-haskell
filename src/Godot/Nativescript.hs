{-# LANGUAGE RecursiveDo, RecordWildCards, AllowAmbiguousTypes #-}
module Godot.Nativescript where

import Data.Typeable
import Data.Text (Text)
import Data.Vector (Vector)
import qualified Data.Vector as V

import Foreign
import Foreign.C

import Godot.Gdnative.Internal
import Godot.Gdnative.Types

type GdnativeHandle = Ptr ()

-- | typeclass for types that are bound to godot
class GodotClass a where
  godotClassName :: String

registerClass :: forall a. GodotClass a
              => GdnativeHandle
              -> String -- ^ base class
              -> (GodotObject -> IO a) -- ^ create action
              -> (GodotObject -> a -> IO ()) -- ^ destroy action
              -> IO ()
registerClass pHandle base create destroy = do
  createFun <- mkInstanceCreateFunPtr $
    \ins _ -> create ins >>= newStablePtr >>= (return . castStablePtrToPtr)
  destroyFun <- mkInstanceDestroyFunPtr $
    \ins _ objPtr -> do
      let stPtr = castPtrToStablePtr objPtr
      obj <- deRefStablePtr stPtr
      freeStablePtr stPtr
      destroy ins obj
  rec 
    createFreeFun <- mkInstanceFreeFunPtr $
      \_ -> freeHaskellFunPtr createFun >> freeHaskellFunPtr createFreeFun
    destroyFreeFun <- mkInstanceFreeFunPtr $
      \_ -> freeHaskellFunPtr destroyFun >> freeHaskellFunPtr destroyFreeFun
      
  let createFunObj = GodotInstanceCreateFunc createFun nullPtr createFreeFun
  let destroyFunObj = GodotInstanceDestroyFunc destroyFun nullPtr destroyFreeFun

  let name = godotClassName @a
  withCString name $ \namePtr -> withCString base $ \basePtr ->
    godot_nativescript_register_class pHandle namePtr basePtr createFunObj destroyFunObj

copyVariant :: Ptr GodotVariant -- ^ destination
            -> Ptr GodotVariant -- ^ source
            -> IO ()
copyVariant dest src = copyBytes dest src (opaqueSizeOf @GodotVariant)            
            
  
registerMethod :: forall a. GodotClass a
               => GdnativeHandle
               -> String -- ^ method name
               -> GodotMethodRpcMode
               -> (GodotObject -> a -> Vector GodotVariant -> IO GodotVariant)
               -> IO ()
registerMethod pHandle mtdName rpc method  = do
  methodFun <- mkInstanceMethodFunPtr $ \outPtr ins _ objPtr numArgs argsPtr -> do
    obj <- deRefStablePtr $ castPtrToStablePtr objPtr
    ptrs <- V.fromList <$> peekArray (fromIntegral numArgs) argsPtr
    args <- V.forM ptrs $
      \ptr -> do
        oldVar <- GodotVariant <$> newForeignPtr_ ptr
        godot_variant_new_copy oldVar
    res <- method ins obj args
    withGodotVariant res $ copyVariant outPtr
    return outPtr
    
  rec
    methodFreeFun <- mkInstanceFreeFunPtr $
      \_ -> freeHaskellFunPtr methodFun >> freeHaskellFunPtr methodFreeFun

  let methodObj = GodotInstanceMethod methodFun nullPtr methodFreeFun

  let clsName = godotClassName @a
  withCString clsName $ \clsNamePtr -> withCString mtdName $
    \mtdNamePtr -> godot_nativescript_register_method pHandle clsNamePtr mtdNamePtr (GodotMethodAttributes rpc) methodObj

data PropertyAttributes = PropertyAttributes
  { propertySetType :: !GodotMethodRpcMode
  , propertyType :: !GodotVariantType
  , propertyHint :: !GodotPropertyHint
  , propertyHintString :: !Text
  , propertyUsage :: !GodotPropertyUsageFlags
  , propertyDefaultValue :: !(Variant 'GodotTy)
  }

asGodotPropertyAttributes :: PropertyAttributes -> IO GodotPropertyAttributes
asGodotPropertyAttributes PropertyAttributes {..} = do
  hintStr <- toLowLevel propertyHintString
  def <- toLowLevel propertyDefaultValue
  let ty = fromIntegral $ fromEnum propertyType
  return $ GodotPropertyAttributes propertySetType ty propertyHint hintStr propertyUsage def

registerProperty :: forall a. GodotClass a
                 => GdnativeHandle
                 -> String -- ^ property path
                 -> PropertyAttributes
                 -> (GodotObject -> a -> GodotVariant -> IO ()) -- ^ set func. godot variants destroyed at end of call
                 -> (GodotObject -> a -> IO GodotVariant) -- ^ get func
                 -> IO ()
registerProperty pHandle path attr setter getter = do
  setFun <- mkPropertySetFunPtr $ \ins _ objPtr valPtr -> do
    obj <- deRefStablePtr $ castPtrToStablePtr objPtr
    val <- newForeignPtr_ valPtr
    setter ins obj (GodotVariant val)
  getFun <- mkPropertyGetFunPtr $ \outPtr ins _ objPtr -> do
    obj <- deRefStablePtr $ castPtrToStablePtr objPtr
    res <- getter ins obj
    withGodotVariant res $ copyVariant outPtr
    return outPtr
  rec
    setFreeFun <- mkInstanceFreeFunPtr $ \_ ->
      freeHaskellFunPtr setFun >> freeHaskellFunPtr setFreeFun
    getFreeFun <- mkInstanceFreeFunPtr $ \_ ->
      freeHaskellFunPtr getFun >> freeHaskellFunPtr getFreeFun

  let clsName = godotClassName @a

  godotAttr <- asGodotPropertyAttributes attr
  withCString clsName $ \clsNamePtr -> withCString path $ \pathPtr ->
    godot_nativescript_register_property pHandle clsNamePtr pathPtr godotAttr
      (GodotPropertySetFunc setFun nullPtr setFreeFun)
      (GodotPropertyGetFunc getFun nullPtr getFreeFun)

data SignalArgument = SignalArgument
  { signalArgumentName :: !Text
  , signalArgumentType :: !GodotVariantType
  , signalArgumentHint :: !GodotPropertyHint
  , signalArgumentHintString :: !Text
  , signalArgumentUsage :: !GodotPropertyUsageFlags
  , signalArgumentDefaultValue :: !(Variant 'GodotTy)
  }

asGodotSignalArgument :: SignalArgument -> IO GodotSignalArgument
asGodotSignalArgument SignalArgument{..} = do
  name <- toLowLevel signalArgumentName
  let ty = fromIntegral $ fromEnum signalArgumentType
  hintStr <- toLowLevel signalArgumentHintString
  def <- toLowLevel signalArgumentDefaultValue
  return $ GodotSignalArgument name ty signalArgumentHint hintStr signalArgumentUsage def
  

withVariantArray' :: [Variant 'GodotTy] -> ((Ptr GodotVariant, CInt) -> IO a) -> IO a
withVariantArray' vars mtd =  allocaBytes (opaqueSizeOf @GodotVariant * length vars) $
  \arrPtr ->  withVars vars 0 arrPtr mtd
  where
    withVars (x:xs) n arrPtr mtd = do
      vt <- toLowLevel x
      withGodotVariant vt $ \vtPtr -> do
        copyVariant (arrPtr `plusPtr` (n * opaqueSizeOf @GodotVariant)) vtPtr 
        withVars xs (n+1) arrPtr mtd
    withVars [] n arrPtr mtd = mtd (arrPtr, fromIntegral n)

registerSignal :: forall a. GodotClass a
               => GdnativeHandle
               -> Proxy a
               -> Text -- ^ signal name
               -> [SignalArgument] -- ^ args
               -> [Variant 'GodotTy] -- ^ default args
               -> IO ()
registerSignal pHandle _ sigName args defaultArgs = do
  gdArgs <- mapM asGodotSignalArgument args
  let clsName = godotClassName @a
  
  withArrayLen gdArgs $ \gdArgsLen gdArgsPtr -> withVariantArray' defaultArgs $ \(defArgsPtr, defArgsLen) ->
    withCString clsName $ \clsNamePtr -> do
    gdSigName <- toLowLevel sigName
    godot_nativescript_register_signal pHandle clsNamePtr (GodotSignal gdSigName (fromIntegral gdArgsLen) gdArgsPtr (fromIntegral defArgsLen) defArgsPtr)
