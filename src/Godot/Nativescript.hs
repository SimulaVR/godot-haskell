{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE GADTs #-}
module Godot.Nativescript
  ( ClassName
  , GFunc
  , GdnativeHandle
  , NativeScript(..)
  , GodotMethod
  , RPC(..)
  , Registerer(..)
  , func
  , nameOf
  , registerClass
  , signal
  , tryCast
  , tryObjectCast
  , asNativeScript
  )
where

import           Control.Monad

import           Data.Typeable
import           Data.Text                                ( Text )
import qualified Data.Text                     as T
import           Data.Vector                              ( Vector )
import qualified Data.Vector                   as Vec
import qualified Data.Vector                   as V

import qualified Data.Set                      as S
import           Control.Concurrent.STM.TVar
import           Control.Monad.STM

import           Foreign                           hiding ( void )
import           Foreign.C

import           System.IO.Unsafe

import           Godot.Gdnative.Internal
import           Godot.Gdnative.Types
import           Godot.Internal.Dispatch
import           Godot.Methods                            ( is_class )
import           Data.Maybe                               ( fromMaybe )

type GdnativeHandle = Ptr ()

-- TODO: Add property registering


{-| 'GodotClass' defines a new Godot class.
First you must create an instance of 'HasBaseClass' for inheritance and
downcasting to parent class.

Example usage:

@
data MyClass1 = MyClass1
  { _mc1Obj :: GodotNode
  , _mc1Time :: TVar Float
  }

instance HasBaseClass MyClass1 where
  type BaseClass MyClass1 = GodotNode
  super (MyClass1 p _) = p
instance NativeScript MyClass1 where
  classInit p = MyClass1 p <$> newTVarIO 0
  classMethods =
    [ func NoRPC "_ready" $ \self [] -> do
        sigName <- toLowLevel "on_MyClass1_ready" :: IO GodotString
        msg     <- toLowLevel ("MyClass1 is ready" :: Text) :: IO GodotString
        let msgVt = toVariant msg
        G.emit_signal (safeCast self :: GodotObject) sigName [msgVt]

    , func NoRPC "_process" $ \self [deltaVt] -> do
        delta <- fromGodotVariant deltaVt
        atomically $ modifyTVar' (_mc1Time self) $ \t -> t + delta
    ]
  classSignals =
    [ signal "on_MyClass1_ready" [("msg", GodotVariantTypeString)]
    ]
@
-}
class (HasBaseClass cls, Typeable cls, Typeable (BaseClass cls), GodotObject :< cls)
  => NativeScript cls where
  classInit :: BaseClass cls -> IO cls
  className :: ClassName cls
  className = nameOf @cls
  classMethods :: [GodotMethod cls]
  classSignals :: [(Text, [SignalArgument])]
  classSignals = []
  asObj :: cls -> GodotObject
  asObj = safeCast


type ClassName a = Text
nameOf :: forall a . Typeable a => ClassName a
nameOf =
  (\txt -> fromMaybe txt $ T.stripPrefix "Godot" txt)
    . T.pack
    $ show
    $ typeRep
    $ Proxy @a


type GFunc cls = cls -> Vector GodotVariant -> IO GodotVariant

data GodotMethod cls where
  GodotMethod
    :: { methodRPCMode :: RPC
       , methodName :: Text
       , methodFunc :: GFunc cls
       }
    -> GodotMethod cls


data RPC
  = NoRPC
  | Remote
  | Sync
  | Master
  | Slave


data RegTy
  = GClass
  | GMethod
  | GSig

data family Registerer (x :: RegTy) cls

data instance Registerer 'GClass cls = NativeScript cls =>
  RegClass
    GdnativeHandle
    (BaseClass cls -> IO cls)

data instance Registerer 'GMethod cls = NativeScript cls =>
  RegMethod
    GdnativeHandle
    (GodotMethod cls)

data instance Registerer 'GSig cls = NativeScript cls =>
  RegSignal
    GdnativeHandle
    ((Text, [SignalArgument]))


-- | Convenient way of registering a class with all its methods.
-- Used like: @registerClass $ RegClass desc $ classInit \\@MyClass@
registerClass
  :: forall a
   . (NativeScript a, Typeable (BaseClass a), AsVariant (BaseClass a))
  => Registerer 'GClass a
  -> IO ()
registerClass (RegClass desc constr) = do
  regClass desc (nameOf @(BaseClass a)) clsInit $ \_ _ -> return ()
  forM_ (classMethods @a) regMtd
  forM_ (classSignals @a) regSignal
 where
  clsInit :: GodotObject -> IO a
  clsInit obj = tryObjectCast obj >>= \(Just a) -> constr (a :: BaseClass a)
  clsName = className @a

  regMtd mtd@GodotMethod {..} = do
    registerMethod (RegMethod desc mtd :: Registerer 'GMethod a)
    putStrLn $ T.unpack $ T.unwords
      ["Registering method", methodName, "to class", clsName]
    return methodName

  regSignal sgn@(signalName, _) = do
    registerSignal (RegSignal desc sgn :: Registerer 'GSig a)
    putStrLn $ T.unpack $ T.unwords
      ["Registering signal", signalName, "to class", clsName]
    return signalName

  regClass pHandle base create destroy = do
    createFun <- mkInstanceCreateFunPtr
      $ \ins _ -> create ins >>= newStablePtr >>= (return . castStablePtrToPtr)
    destroyFun <- mkInstanceDestroyFunPtr $ \ins _ objPtr -> do
      let stPtr = castPtrToStablePtr objPtr
      obj <- deRefStablePtr stPtr
      freeStablePtr stPtr
      destroy ins obj
    rec createFreeFun <- mkInstanceFreeFunPtr $ \_ ->
          freeHaskellFunPtr createFun >> freeHaskellFunPtr createFreeFun
        destroyFreeFun <- mkInstanceFreeFunPtr $ \_ ->
          freeHaskellFunPtr destroyFun >> freeHaskellFunPtr destroyFreeFun

    let createFunObj = GodotInstanceCreateFunc createFun nullPtr createFreeFun
    let destroyFunObj =
          GodotInstanceDestroyFunc destroyFun nullPtr destroyFreeFun

    let tyr = typeRep $ Proxy @a
    tyPtr <- newStablePtr tyr

    atomically $ modifyTVar' typeTags (S.insert $ castStablePtrToPtr tyPtr)

    putStrLn $ T.unpack $ T.unwords ["Registering class", clsName]
    withCString (T.unpack clsName)
      $ \namePtr -> withCString (T.unpack base) $ \basePtr -> do
          godot_nativescript_register_class pHandle
                                            namePtr
                                            basePtr
                                            createFunObj
                                            destroyFunObj
          godot_nativescript_set_type_tag pHandle
                                          namePtr
                                          (castStablePtrToPtr tyPtr)


typeTags :: TVar (S.Set (Ptr ()))
typeTags = unsafePerformIO $ newTVarIO mempty
{-# NOINLINE typeTags #-}


tryCast
  :: (GodotObject :< a, a :< b, Typeable b, AsVariant b) => a -> IO (Maybe b)
tryCast = tryObjectCast . safeCast

-- unsafeCast :: (GodotObject :< a, a :< b, Typeable b, AsVariant b) => a -> b
-- unsafeCast a = unsafePerformIO $ tryCast a >>= \(Just b) -> return b
-- {-# NOINLINE unsafeCast #-}

tryObjectCast
  :: forall a . (Typeable a, AsVariant a) => GodotObject -> IO (Maybe a)
tryObjectCast obj = do
  isCls <- is_class obj =<< toLowLevel (nameOf @a)
  if isCls
    then do
      asGVt <- toLowLevel $ toVariant obj :: IO GodotVariant
      Just <$> fromGodotVariant asGVt
    else return Nothing


asNativeScript :: forall a . NativeScript a => GodotObject -> IO (Maybe a)
asNativeScript obj = do
  tyPtr <- godot_nativescript_get_type_tag obj
  ttags <- atomically $ readTVar typeTags
  if tyPtr == nullPtr || tyPtr `S.notMember` ttags
    then return Nothing
    else do

      let tySPtr = castPtrToStablePtr tyPtr
      tyrep <- deRefStablePtr tySPtr

      if tyrep == typeRep (Proxy :: Proxy a)
        then
          Just
            <$> (   godot_nativescript_get_userdata obj
                >>= (deRefStablePtr . castPtrToStablePtr)
                )
        else return Nothing

-- unsafeObjectCastNS :: NativeScript a => GodotObject -> a
-- unsafeObjectCastNS obj =
--   unsafePerformIO
--     $   godot_nativescript_get_userdata obj
--     >>= deRefStablePtr
--     .   castPtrToStablePtr
-- {-# NOINLINE unsafeObjectCastNS #-}

copyVariant
  :: Ptr GodotVariant -- ^ destination
  -> Ptr GodotVariant -- ^ source
  -> IO ()
copyVariant dest src = copyBytes dest src (opaqueSizeOf @GodotVariant)


{-| This makes defining class member methods much easier and similar to GDScript.
Without dependent types we can't enforce that the right number of arguments are
passed. The pattern-match below is non-total for syntactic simplicity.

Example usage:
@
func NoRPC "_unhandled_input" $ \self [evObj] ->
  (fromGodotVariant evObj :: IO GodotObject)
    >>= asClass GodotInputEventKey "InputEventKey"
    >>= flip whenJust (handleInputKey self)
@
-}
func
  :: (NativeScript cls, AsVariant a)
  => RPC
  -> Text
  -> (cls -> [GodotVariant] -> IO a)
  -> GodotMethod cls
func rpc mthdName fn = GodotMethod rpc mthdName
  $ \self args -> toLowLevel . toVariant =<< fn self (Vec.toList args)


registerMethod :: forall a . NativeScript a => Registerer 'GMethod a -> IO ()
registerMethod (RegMethod desc GodotMethod {..}) = do
  methodFun <-
    mkInstanceMethodFunPtr $ \outPtr _ins _ objPtr numArgs argsPtr -> do
      obj  <- deRefStablePtr $ castPtrToStablePtr objPtr
      ptrs <- V.fromList <$> peekArray (fromIntegral numArgs) argsPtr
      args <- V.forM ptrs $ \ptr -> do
        oldVar <- GodotVariant <$> newForeignPtr_ ptr
        godot_variant_new_copy oldVar
      res <- methodFunc obj args
      withGodotVariant res $ copyVariant outPtr
      return outPtr

  rec methodFreeFun <- mkInstanceFreeFunPtr
        $ \_ -> freeHaskellFunPtr methodFun >> freeHaskellFunPtr methodFreeFun

  let methodObj = GodotInstanceMethod methodFun nullPtr methodFreeFun

  withCString (T.unpack $ nameOf @a) $ \clsNamePtr ->
    withCString (T.unpack methodName)
      $ \mtdNamePtr -> godot_nativescript_register_method
          desc
          clsNamePtr
          mtdNamePtr
          (GodotMethodAttributes rpcMode)
          methodObj
 where
  rpcMode = case methodRPCMode of
    NoRPC  -> GodotMethodRpcModeDisabled
    Remote -> GodotMethodRpcModeRemote
    Sync   -> GodotMethodRpcModeSync
    Master -> GodotMethodRpcModeMaster
    Slave  -> GodotMethodRpcModeSlave

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
  def     <- toLowLevel propertyDefaultValue
  return $ GodotPropertyAttributes
    { godotPropertyAttributesRsetType     = propertySetType
    , godotPropertyAttributesType         = fromIntegral $ fromEnum propertyType
    , godotPropertyAttributesHint         = propertyHint
    , godotPropertyAttributesHintString   = hintStr
    , godotPropertyAttributesUsage        = propertyUsage
    , godotPropertyAttributesDefaultValue = def
    }

registerProperty
  :: forall a
   . NativeScript a
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
  rec setFreeFun <- mkInstanceFreeFunPtr
        $ \_ -> freeHaskellFunPtr setFun >> freeHaskellFunPtr setFreeFun
      getFreeFun <- mkInstanceFreeFunPtr
        $ \_ -> freeHaskellFunPtr getFun >> freeHaskellFunPtr getFreeFun
  godotAttr <- asGodotPropertyAttributes attr
  withCString (show $ Proxy @(BaseClass a)) $ \clsNamePtr ->
    withCString path $ \pathPtr -> godot_nativescript_register_property
      pHandle
      clsNamePtr
      pathPtr
      godotAttr
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
asGodotSignalArgument SignalArgument {..} = do
  name <- toLowLevel signalArgumentName
  let ty = fromIntegral $ fromEnum signalArgumentType
  hintStr <- toLowLevel signalArgumentHintString
  def     <- toLowLevel signalArgumentDefaultValue
  return $ GodotSignalArgument name
                               ty
                               signalArgumentHint
                               hintStr
                               signalArgumentUsage
                               def


-- | Example usage:
-- signal "on_pulse" [("source", GodotVariantTypeVector3), ("affected", GodotVariantTypeObject)]
signal :: Text -> [(Text, GodotVariantType)] -> (Text, [SignalArgument])
signal sigName sigArgs = (sigName, uncurry toSigArg <$> sigArgs)
 where
  toSigArg :: Text -> GodotVariantType -> SignalArgument
  toSigArg argName ty = do
    SignalArgument
      { signalArgumentName         = argName
      , signalArgumentType         = ty
      , signalArgumentHint         = GodotPropertyHintNone
      , signalArgumentHintString   = T.pack ""
      , signalArgumentUsage        = godotPropertyUsageDefault
      , signalArgumentDefaultValue = VariantNil
      }

-- TODO: Also allow hints and default args?
registerSignal :: forall a . NativeScript a => Registerer 'GSig a -> IO ()
registerSignal (RegSignal desc (signalName, signalArgs)) = do
  gdArgs <- mapM asGodotSignalArgument signalArgs
  let clsName     = show $ Proxy @(BaseClass a)
  let defaultArgs = []
  withArrayLen gdArgs $ \gdArgsLen gdArgsPtr ->
    withVariantArray' defaultArgs $ \(defArgsPtr, defArgsLen) ->
      withCString clsName $ \clsNamePtr -> do
        gdSigName <- toLowLevel signalName
        godot_nativescript_register_signal desc clsNamePtr $ GodotSignal
          gdSigName
          (fromIntegral gdArgsLen)
          gdArgsPtr
          (fromIntegral defArgsLen)
          defArgsPtr
 where
  withVariantArray'
    :: [Variant 'GodotTy] -> ((Ptr GodotVariant, CInt) -> IO b) -> IO b
  withVariantArray' vars mtd =
    allocaBytes (opaqueSizeOf @GodotVariant * length vars)
      $ \arrPtr -> withVars vars 0 arrPtr mtd

  withVars (x : xs) n arrPtr mtd = do
    vt <- toLowLevel x
    withGodotVariant vt $ \vtPtr -> do
      copyVariant (arrPtr `plusPtr` (n * opaqueSizeOf @GodotVariant)) vtPtr
      withVars xs (n + 1) arrPtr mtd
  withVars [] n arrPtr mtd = mtd (arrPtr, fromIntegral n)
