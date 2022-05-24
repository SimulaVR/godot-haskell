{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE RecursiveDo #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE LambdaCase #-}
module Godot.Nativescript
  ( ClassName
  , GFunc
  , GdnativeHandle
  , NativeScript(..)
  , ClassMethod(..)
  , ClassProperty(..)
  , ClassSignal(..)
  , RPC(..)
  , Registerer(..)
  , PropertyAttributes(..)
  , SignalArgument(..)
  , deriveBase
  , func
  , method
  , method0
  , method1
  , method2
  , method3
  , method4
  , method5
  , nameOf
  , registerClass
  , registerProperty
  , registerSignal
  , registerMethod
  , signal
  , tryCast
  , tryCast'
  , tryObjectCast
  , asNativeScript
  , convertClassName
  , unConvertClassName
  , getNode
  , getNodeNativeScript
  , new
  , newNativeScript
  , getSingleton
  , getEngine
  , copyVariant
  , scriptDesc
  , defaultExports
  , await
  , WrapperStablePtr(..)
  , createMVarProperty
  , guardError
  , getError
  , GodotError(..)
  )
where

import           Control.Monad

import           Data.Typeable
import           Data.Text                                ( Text )
import qualified Data.Text                     as T
import           Data.Vector                              ( Vector )
import qualified Data.Vector                   as Vec
import qualified Data.Vector                   as V
import           Data.Function                            ( (&) )

import qualified Data.Set                      as S
import           Control.Concurrent.MVar

import           Foreign                           hiding (void,new)
import           Foreign.C                         hiding (new)

import           System.Environment
import           System.IO.Unsafe

import qualified Godot.Gdnative.Internal as GNI
import           Godot.Gdnative
import           Godot.Internal.Dispatch
import           Data.Maybe                               ( fromMaybe )
import qualified Foreign.Marshal as F
import qualified Foreign.Marshal.Utils as F
import qualified Foreign.C                     as Foreign

import qualified Godot.Api                     as Api
import qualified Data.Map.Strict as M
import           Data.Coerce
import qualified Godot.Core.NativeScript as NativeScript
import           Godot.Core.GlobalConstants
import           Godot.Core.ClassDB
import           Godot.Core.Engine
import           Godot.Core.Node
import           Godot.Core.Object as Object
import           Godot.Core.Reference
import           Data.IORef
import           Foreign.StablePtr
import           Control.Monad.Extra
import           Control.Exception
import           Data.Maybe

type GdnativeHandle = Ptr ()

data GodotError = GFailed -- ^ Generic error.
                | GUnavailable -- ^ Unavailable error.
                | GUnconfigured -- ^ Unconfigured error.
                | GUnauthorized -- ^ Unauthorized error.
                | GParameterRangeError -- ^ Parameter range error.
                | GOutOfMemory -- ^ Out of memory (OOM) error.
                | GFileNotFound -- ^ File: Not found error.
                | GFileBadDrive -- ^ File: Bad drive error.
                | GFileBadPath -- ^ File: Bad path error.
                | GFileNoPermission -- ^ File: No permission error.
                | GFileAlreadyInUse -- ^ File: Already in use error.
                | GFileCantOpen -- ^ File: Can't open error.
                | GFileCantWrite -- ^ File: Can't write error.
                | GFileCantRead -- ^ File: Can't read error.
                | GFileUnrecognized -- ^ File: Unrecognized error.
                | GFileCorrupt -- ^ File: Corrupt error.
                | GFileMissingDependencies -- ^ File: Missing dependencies error.
                | GFileEof -- ^ File: End of file (EOF) error.
                | GCantOpen -- ^ Can't open error.
                | GCantCreate -- ^ Can't create error.
                | GQueryFailed -- ^ Query failed error.
                | GAlreadyInUse -- ^ Already in use error.
                | GLocked -- ^ Locked error.
                | GTimeout -- ^ Timeout error.
                | GCantConnect -- ^ Can't connect error.
                | GCantResolve -- ^ Can't resolve error.
                | GConnectionError -- ^ Connection error.
                | GCantAcquireResource -- ^ Can't acquire resource error.
                | GCantFork -- ^ Can't fork process error.
                | GInvalidData -- ^ Invalid data error.
                | GInvalidParameter -- ^ Invalid parameter error.
                | GAlreadyExists -- ^ Already exists error.
                | GDoesNotExist -- ^ Does not exist error.
                | GDatabaseCantRead -- ^ Database: Read error.
                | GDatabaseCantWrite -- ^ Database: Write error.
                | GCompilationFailed -- ^ Compilation failed error.
                | GMethodNotFound -- ^ Method not found error.
                | GLinkFailed -- ^ Linking failed error.
                | GScriptFailed -- ^ Script failed error.
                | GCyclicLink -- ^ Cycling link (import cycle) error.
                | GInvalidDeclaration -- ^ Invalid declaration error.
                | GDuplicateSymbol -- ^ Duplicate symbol error.
                | GParseError -- ^ Parse error.
                | GBusy -- ^ Busy error.
                | GSkip -- ^ Skip error.
                | GHelp -- ^ Help error.
                | GBug -- ^ Bug error.
                | GPrinterOnFire -- ^ Printer on fire error. (This is an easter egg, no engine methods return this error code.)
                deriving (Show, Eq, Typeable)

instance Exception GodotError

getError :: Int -> Maybe GodotError
getError e | e == _OK                             = Nothing
           | e == _FAILED                         = Just GFailed                   
           | e == _ERR_UNAVAILABLE                = Just GUnavailable              
           | e == _ERR_UNCONFIGURED               = Just GUnconfigured             
           | e == _ERR_UNAUTHORIZED               = Just GUnauthorized             
           | e == _ERR_PARAMETER_RANGE_ERROR      = Just GParameterRangeError      
           | e == _ERR_OUT_OF_MEMORY              = Just GOutOfMemory              
           | e == _ERR_FILE_NOT_FOUND             = Just GFileNotFound             
           | e == _ERR_FILE_BAD_DRIVE             = Just GFileBadDrive             
           | e == _ERR_FILE_BAD_PATH              = Just GFileBadPath              
           | e == _ERR_FILE_NO_PERMISSION         = Just GFileNoPermission         
           | e == _ERR_FILE_ALREADY_IN_USE        = Just GFileAlreadyInUse         
           | e == _ERR_FILE_CANT_OPEN             = Just GFileCantOpen             
           | e == _ERR_FILE_CANT_WRITE            = Just GFileCantWrite            
           | e == _ERR_FILE_CANT_READ             = Just GFileCantRead             
           | e == _ERR_FILE_UNRECOGNIZED          = Just GFileUnrecognized         
           | e == _ERR_FILE_CORRUPT               = Just GFileCorrupt              
           | e == _ERR_FILE_MISSING_DEPENDENCIES  = Just GFileMissingDependencies  
           | e == _ERR_FILE_EOF                   = Just GFileEof                  
           | e == _ERR_CANT_OPEN                  = Just GCantOpen                 
           | e == _ERR_CANT_CREATE                = Just GCantCreate               
           | e == _ERR_QUERY_FAILED               = Just GQueryFailed              
           | e == _ERR_ALREADY_IN_USE             = Just GAlreadyInUse             
           | e == _ERR_LOCKED                     = Just GLocked                   
           | e == _ERR_TIMEOUT                    = Just GTimeout                  
           | e == _ERR_CANT_CONNECT               = Just GCantConnect              
           | e == _ERR_CANT_RESOLVE               = Just GCantResolve              
           | e == _ERR_CONNECTION_ERROR           = Just GConnectionError          
           | e == _ERR_CANT_ACQUIRE_RESOURCE      = Just GCantAcquireResource      
           | e == _ERR_CANT_FORK                  = Just GCantFork                 
           | e == _ERR_INVALID_DATA               = Just GInvalidData              
           | e == _ERR_INVALID_PARAMETER          = Just GInvalidParameter         
           | e == _ERR_ALREADY_EXISTS             = Just GAlreadyExists            
           | e == _ERR_DOES_NOT_EXIST             = Just GDoesNotExist             
           | e == _ERR_DATABASE_CANT_READ         = Just GDatabaseCantRead         
           | e == _ERR_DATABASE_CANT_WRITE        = Just GDatabaseCantWrite        
           | e == _ERR_COMPILATION_FAILED         = Just GCompilationFailed        
           | e == _ERR_METHOD_NOT_FOUND           = Just GMethodNotFound           
           | e == _ERR_LINK_FAILED                = Just GLinkFailed               
           | e == _ERR_SCRIPT_FAILED              = Just GScriptFailed             
           | e == _ERR_CYCLIC_LINK                = Just GCyclicLink               
           | e == _ERR_INVALID_DECLARATION        = Just GInvalidDeclaration       
           | e == _ERR_DUPLICATE_SYMBOL           = Just GDuplicateSymbol          
           | e == _ERR_PARSE_ERROR                = Just GParseError               
           | e == _ERR_BUSY                       = Just GBusy                     
           | e == _ERR_SKIP                       = Just GSkip                     
           | e == _ERR_HELP                       = Just GHelp                     
           | e == _ERR_BUG                        = Just GBug                      
           | e == _ERR_PRINTER_ON_FIRE            = Just GPrinterOnFire            
           | otherwise                            = error $ "Unknown Godot error; this is a bug in the Haskell bindings: " ++ show e

guardError :: Int -> ()
guardError = maybe () throw . getError

{-| 'NativeScript' defines a new Godot class.
First you must create an instance of 'HasBaseClass' for inheritance and
upcasting to parent class. Then you'll need an instance of 'NativeScript'.
Finally, the splice 'deriveBase' handles creating all the parent-child
relationships. To actually use your class, you'll need to register it with
'registerClass'.

TODO Check that this example still works

Example usage:

@
data MyClass1 = MyClass1
  { _mc1Obj :: Node
  , _mc1Time :: MVar Float
  }

instance HasBaseClass MyClass1 where
  type BaseClass MyClass1 = Node
  super (MyClass1 p _) = p
instance NativeScript MyClass1 where
  classInit p = MyClass1 p <$> newMVar 0
  classMethods =
    [ func NoRPC "_ready" $ \self [] -> do
        sigName <- toLowLevel "on_MyClass1_ready" :: IO GodotString
        msg     <- toLowLevel ("MyClass1 is ready" :: Text) :: IO GodotString
        let msgVt = toVariant msg
        G.emit_signal (upcast self :: Object) sigName [msgVt]
    , func NoRPC "_process" $ \self [deltaVt] -> do
        delta <- fromVariant deltaVt
        atomically $ modifyMVar' (_mc1Time self) $ \t -> t + delta
    ]
  classSignals =
    [ signal "on_MyClass1_ready" [("msg", VariantTypeString)]
    ]
deriveBase ''Myclass1
@
-}
class (HasBaseClass cls, Typeable cls, Typeable (BaseClass cls), Object :< cls)
  => NativeScript cls where
  classInit :: BaseClass cls -> IO cls
  className :: ClassName cls
  className = nameOf @cls
  classMethods :: [ClassMethod cls]
  classSignals :: [ClassSignal]
  classSignals = []
  classProperties :: [ClassProperty cls]
  classProperties = []
  asObj :: cls -> Object
  asObj = upcast

type ClassSignal = (Text, [SignalArgument])

type ClassName a = Text
nameOf :: forall a . Typeable a => ClassName a
nameOf = T.pack
    $ convertClassName
    $ show
    $ typeRep
    $ Proxy @a


type GFunc cls = cls -> Vector GodotVariant -> IO GodotVariant

data ClassMethod cls where
  ClassMethod
    :: { methodRPCMode :: RPC
       , methodName :: Text
       , methodFunc :: GFunc cls
       }
    -> ClassMethod cls


data RPC
  = NoRPC
  | Remote
  | Sync
  | Master
  | Slave


data RegTy
  = GClass
  | GMethod
  | GSignal
  | GProperty

data family Registerer (x :: RegTy) cls

data instance Registerer 'GClass cls = NativeScript cls =>
  RegClass
    GdnativeHandle
    (BaseClass cls -> IO cls)

data instance Registerer 'GMethod cls = NativeScript cls =>
  RegMethod
    GdnativeHandle
    (ClassMethod cls)

data instance Registerer 'GSignal cls = NativeScript cls =>
  RegSignal
    GdnativeHandle
    (Text, [SignalArgument])

data instance Registerer 'GProperty cls = NativeScript cls =>
  RegProperty
    GdnativeHandle
    (ClassProperty cls)


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
  forM_ (classProperties @a) regProperty
 where
  clsInit :: Object -> IO a
  clsInit obj = tryObjectCast obj >>= \(Just a) -> constr (a :: BaseClass a)
  clsName = className @a

  regMtd mtd@ClassMethod {..} = do
    registerMethod (RegMethod desc mtd :: Registerer 'GMethod a)
    d <- isJust <$> lookupEnv "HS_GODOT_DEBUG"
    when d $ putStrLn $ T.unpack $ T.unwords
      ["Registering method", methodName, "to class", clsName]

  regSignal sgn@(signalName, _) = do
    registerSignal (RegSignal desc sgn :: Registerer 'GSignal a)
    d <- isJust <$> lookupEnv "HS_GODOT_DEBUG"
    when d $ putStrLn $ T.unpack $ T.unwords
      ["Registering signal", signalName, "to class", clsName]

  regProperty prp = do
    registerProperty (RegProperty desc prp :: Registerer 'GProperty a)
    d <- isJust <$> lookupEnv "HS_GODOT_DEBUG"
    when d $ putStrLn $ T.unpack $ T.unwords
      ["Registering property", propertyName prp, "to class", clsName]

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

    let createFunObj = InstanceCreateFunc createFun nullPtr createFreeFun
    let destroyFunObj =
          InstanceDestroyFunc destroyFun nullPtr destroyFreeFun

    let tyFingerprint = typeRepFingerprint $ typeRep (Proxy @a)
    tyPtr <- F.new tyFingerprint

    d <- isJust <$> lookupEnv "HS_GODOT_DEBUG"
    when d $ putStrLn $ T.unpack $ T.unwords ["Registering class", clsName]
    withCString (T.unpack clsName)
      $ \namePtr -> withCString (T.unpack base) $ \basePtr -> do
          godot_nativescript_register_class pHandle
                                            namePtr
                                            basePtr
                                            createFunObj
                                            destroyFunObj
          godot_nativescript_set_type_tag pHandle
                                          namePtr
                                          (castPtr tyPtr)

tryCast
  :: forall b a. (Object :< a, a :< b, Typeable b, AsVariant b) => a -> IO (Maybe b)
tryCast = tryObjectCast . upcast

tryCast' :: forall out x. (Typeable out, AsVariant out, Object :< x, x :< out) => x -> IO out
tryCast' o = fromJust <$> tryCast o

convertClassName name =
  case name of
    -- TODO Derive these automatically. Don't think we store if a
    -- class is a singleton anywhere.
    "ClassDB" -> "_ClassDB"
    "Marshalls" -> "_Marshalls"
    "VisualScriptEditor" -> "_VisualScriptEditor"
    "OS" -> "_OS"
    "Engine" -> "_Engine"
    "Geometry" -> "_Geometry"
    "JSON" -> "_JSON"
    "ResourceLoader" -> "_ResourceLoader"
    "ResourceSaver" -> "_ResourceSaver"
    x -> x

unConvertClassName name =
  case name of
    -- TODO Derive these automatically. Don't think we store if a
    -- class is a singleton anywhere.
    "_ClassDB" -> "ClassDB"
    "_Marshalls" -> "Marshalls"
    "_VisualScriptEditor" -> "VisualScriptEditor"
    "_OS" -> "OS"
    "_Engine" -> "Engine"
    "_Geometry" -> "Geometry"
    "_JSON" -> "JSON"
    "_ResourceLoader" -> "ResourceLoader"
    "_ResourceSaver" -> "ResourceSaver"
    x -> x

singletonTable :: MVar (M.Map Text Object)
singletonTable = unsafePerformIO $ newMVar M.empty

-- | Godot exposes some functionality through singletons. You'll often need to
-- talk to the GodotInput singeton for example. Use this as 'getSingleton @GodotInput'.
getSingleton
  :: forall a . (Typeable a, AsVariant a, Object :< a) => IO (Maybe a)
getSingleton = do
  let name = unConvertClassName $ nameOf @a
  table <- readMVar singletonTable
  case M.lookup name table of
    Just o -> tryCast o
    Nothing -> do
      ge <- getEngine
      -- FIXME ANDREI I don't understand what convertClassName is doing here? It seems wrong.
      -- o <- get_singleton ge =<< toLowLevel (convertClassName name)
      o <- get_singleton ge =<< toLowLevel name
      modifyMVar_ singletonTable (\m -> pure (M.insert name o m))
      tryCast o

getEngine :: IO Api.Engine
getEngine =
  GNI.godot_global_get_singleton
    &   Foreign.withCString "Engine"
    >>= \o -> tryCast o >>= \case
          Just ge -> return ge
          Nothing ->
            (get_class o :: IO GodotString)
              >>= fromLowLevel
              >>= error
              .   ("Couldn't get Engine singleton :( got: " ++)
              .   T.unpack
  
tryObjectCast :: forall a . (Typeable a, AsVariant a) => Object -> IO (Maybe a)
tryObjectCast obj = do
  isCls <- Object.is_class obj =<< toLowLevel (nameOf @a)
  if isCls
    then do
      asGVt <- toLowLevel $ toVariant obj :: IO GodotVariant
      Just <$> fromGodotVariant asGVt
    else return Nothing


asNativeScript :: forall a . NativeScript a => Object -> IO (Maybe a)
asNativeScript obj = do
  tyPtr <- godot_nativescript_get_type_tag obj
  tyFingerprint <- peek (castPtr tyPtr)
  if tyFingerprint == typeRepFingerprint (typeRep (Proxy @a)) then
    Just <$> (godot_nativescript_get_userdata obj
               >>= (deRefStablePtr . castPtrToStablePtr))
    else
    pure Nothing

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
  (fromVariant evObj :: IO Object)
    >>= asClass InputEventKey "InputEventKey"
    >>= flip whenJust (handleInputKey self)
@
-}
func
  :: (NativeScript cls, AsVariant a)
  => RPC
  -> Text
  -> (cls -> [GodotVariant] -> IO a)
  -> ClassMethod cls
func rpc mthdName fn = ClassMethod rpc mthdName
  $ \self args -> toLowLevel . toVariant =<< fn self (Vec.toList args)

-- | Quick shortcut to make a new local method with arguments passed as
-- 'Variant's in a list.
method :: (NativeScript cls, AsVariant a)
       => Text -> (cls -> [GodotVariant] -> IO a) -> ClassMethod cls
method = func NoRPC

-- | Quick shortcut to make a new local method with no argumnets.
method0 :: (NativeScript cls, AsVariant a)
       => Text -> (cls -> IO a) -> ClassMethod cls
method0 name fn = func NoRPC name (\s [] -> fn s)

-- | Quick shortcut to make a new local method that takes 1 argument, 'Variant's
-- are unwrapped into their types before being passed in.
method1 :: (NativeScript cls, AsVariant a, AsVariant o1, Typeable o1)
        => Text -> (cls -> o1 -> IO a) -> ClassMethod cls
method1 name fn = func NoRPC name (\s [o1] -> do
                                      a1 <- fromGodotVariant o1
                                      fn s a1)

-- | Quick shortcut to make a new local method that takes 2 arguments, 'Variant's
-- are unwrapped into their types before being passed in.
method2 :: (NativeScript cls, AsVariant a, AsVariant o1, Typeable o1, AsVariant o2, Typeable o2)
        => Text -> (cls -> o1 -> o2 -> IO a) -> ClassMethod cls
method2 name fn = func NoRPC name (\s [o1,o2] -> do
                                      a1 <- fromGodotVariant o1
                                      a2 <- fromGodotVariant o2
                                      fn s a1 a2)

-- | Quick shortcut to make a new local method that takes 3 arguments, 'Variant's
-- are unwrapped into their types before being passed in.
method3 :: (NativeScript cls, AsVariant a, AsVariant o1, Typeable o1, AsVariant o2, Typeable o2, AsVariant o3, Typeable o3)
        => Text -> (cls -> o1 -> o2 -> o3 -> IO a) -> ClassMethod cls
method3 name fn = func NoRPC name (\s [o1,o2,o3] -> do
                                      a1 <- fromGodotVariant o1
                                      a2 <- fromGodotVariant o2
                                      a3 <- fromGodotVariant o3
                                      fn s a1 a2 a3)

-- | Quick shortcut to make a new local method that takes 4 arguments, 'Variant's
-- are unwrapped into their types before being passed in.
method4 :: (NativeScript cls, AsVariant a, AsVariant o1, Typeable o1, AsVariant o2, Typeable o2
          , AsVariant o3, Typeable o3, AsVariant o4, Typeable o4)
        => Text -> (cls -> o1 -> o2 -> o3 -> o4 -> IO a) -> ClassMethod cls
method4 name fn = func NoRPC name (\s [o1,o2,o3,o4] -> do
                                      a1 <- fromGodotVariant o1
                                      a2 <- fromGodotVariant o2
                                      a3 <- fromGodotVariant o3
                                      a4 <- fromGodotVariant o4
                                      fn s a1 a2 a3 a4)

-- | Quick shortcut to make a new local method that takes 5 arguments, 'Variant's
-- are unwrapped into their types before being passed in.
method5 :: (NativeScript cls, AsVariant a, AsVariant o1, Typeable o1, AsVariant o2, Typeable o2
          , AsVariant o3, Typeable o3, AsVariant o4, Typeable o4, AsVariant o5, Typeable o5)
        => Text -> (cls -> o1 -> o2 -> o3 -> o4 -> o5 -> IO a) -> ClassMethod cls
method5 name fn = func NoRPC name (\s [o1,o2,o3,o4,o5] -> do
                                      a1 <- fromGodotVariant o1
                                      a2 <- fromGodotVariant o2
                                      a3 <- fromGodotVariant o3
                                      a4 <- fromGodotVariant o4
                                      a5 <- fromGodotVariant o5
                                      fn s a1 a2 a3 a4 a5)


registerMethod :: forall a . NativeScript a => Registerer 'GMethod a -> IO ()
registerMethod (RegMethod desc ClassMethod {..}) = do
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

  let methodObj = InstanceMethod methodFun nullPtr methodFreeFun
  withCString (T.unpack $ nameOf @a) $ \clsNamePtr ->
    withCString (T.unpack methodName)
      $ \mtdNamePtr -> godot_nativescript_register_method
          desc
          clsNamePtr
          mtdNamePtr
          (MethodAttributes rpcMode)
          methodObj
 where
  rpcMode = case methodRPCMode of
    NoRPC  -> MethodRpcModeDisabled
    Remote -> MethodRpcModeRemote
    Sync   -> MethodRpcModeSync
    Master -> MethodRpcModeMaster
    Slave  -> MethodRpcModeSlave

asPropertyAttributes :: PropertyAttributes -> IO GNI.PropertyAttributes
asPropertyAttributes PropertyAttributes {..} = do
  hintStr <- toLowLevel propertyHintString
  def     <- toLowLevel propertyDefaultValue
  return $ GNI.PropertyAttributes
    { godotPropertyAttributesRsetType     = propertySetType
    , godotPropertyAttributesType         = fromIntegral $ fromEnum propertyType
    , godotPropertyAttributesHint         = propertyHint
    , godotPropertyAttributesHintString   = hintStr
    , godotPropertyAttributesUsage        = propertyUsage
    , godotPropertyAttributesDefaultValue = def
    }

registerProperty :: forall a . NativeScript a => Registerer 'GProperty a -> IO ()
registerProperty (RegProperty desc (ClassProperty path attr setter getter)) = do
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
  godotAttr <- asPropertyAttributes attr
  withCString (T.unpack $ nameOf @a) $ \clsNamePtr ->
    withCString (T.unpack path) $ \pathPtr -> godot_nativescript_register_property
      desc
      clsNamePtr
      pathPtr
      godotAttr
      (PropertySetFunc setFun nullPtr setFreeFun)
      (PropertyGetFunc getFun nullPtr getFreeFun)

createMVarProperty :: (Typeable v, AsVariant v) =>
     Text
     -> (t -> MVar v)
     -- ^ We typically can't do IO (for initialisation) when calling this, in
     -- which case we need to annotate the type without providing a value.
     -> Either VariantType v
     -> ClassProperty t
createMVarProperty name fieldName tyOrVal = ClassProperty
  { propertyName = name
  , propertyAttrs = PropertyAttributes
      MethodRpcModeDisabled
      (fst vTyVt)
      PropertyHintNone
      ""
      godotPropertyUsageDefault
      (snd vTyVt)
  , propertySetter = \_ c (var :: GodotVariant) -> do
        variant <- fromLowLevel var
        -- TODO This is required to avoid memory corruption. Haskell cannot hold
        -- pointers to Godot objects unless the runtime already has a live
        -- reference to that object. It will otherwise be freed at some point!
        --
        -- This solution works, but only for most Godot Objects. We could add
        -- more cases here, but a much better way would be to implement a Ref
        -- type to hold such objects. Coming soon to stores near you.
        case variant of
          VariantObject o -> onRefObj reference o
          _ -> pure False
        obj <- fromGodotVariant var
        let mvar = fieldName c
        isEmpty <- isEmptyMVar mvar
        if isEmpty
          then putMVar mvar obj
          else toVariant <$> swapMVar mvar obj >>= \case
            VariantObject oldObj@(Object ptr) -> do
              unreffed <- onRefObj unreference oldObj -- lazy evaluation ftw
              when (nullPtr /= ptr && unreffed) $
                Object.free oldObj
            _ -> pure ()
  , propertyGetter = \_ c -> toLowLevel . toVariant =<< readMVar (fieldName c)
  }
 where
   onRefObj :: (Api.Reference -> IO a) -> Object -> IO a
   onRefObj f o = tryObjectCast @Api.Reference o >>= \case
      Just ref -> f ref
      Nothing -> error "Variant object not a reference"
   vTyVt :: (VariantType, Variant 'GodotTy)
   vTyVt = case tyOrVal of
     Left VariantTypeObject -> (VariantTypeObject, VariantObject (Object nullPtr))
     Left vTy -> (vTy, VariantNil)
     Right val -> (variantType val, toVariant val)

data SignalArgument = SignalArgument
  { signalArgumentName :: !Text
  , signalArgumentType :: !VariantType
  , signalArgumentHint :: !PropertyHint
  , signalArgumentHintString :: !Text
  , signalArgumentUsage :: !PropertyUsageFlags
  , signalArgumentDefaultValue :: !(Variant 'GodotTy)
  }

asSignalArgument :: SignalArgument -> IO GNI.SignalArgument
asSignalArgument SignalArgument {..} = do
  name <- toLowLevel signalArgumentName
  let ty = fromIntegral $ fromEnum signalArgumentType
  hintStr <- toLowLevel signalArgumentHintString
  def     <- toLowLevel signalArgumentDefaultValue
  return $ GNI.SignalArgument name
                               ty
                               signalArgumentHint
                               hintStr
                               signalArgumentUsage
                               def


-- | Example usage:
-- @
-- signal "on_pulse" [("source", VariantTypeVector3), ("affected", VariantTypeObject)]
-- @
signal :: Text -> [(Text, VariantType)] -> (Text, [SignalArgument])
signal sigName sigArgs = (sigName, uncurry toSigArg <$> sigArgs)
 where
  toSigArg :: Text -> VariantType -> SignalArgument
  toSigArg argName ty = do
    SignalArgument
      { signalArgumentName         = argName
      , signalArgumentType         = ty
      , signalArgumentHint         = PropertyHintNone
      , signalArgumentHintString   = T.pack ""
      , signalArgumentUsage        = godotPropertyUsageDefault
      , signalArgumentDefaultValue = VariantNil
      }

-- TODO: Also allow hints and default args?
registerSignal :: forall a . NativeScript a => Registerer 'GSignal a -> IO ()
registerSignal (RegSignal desc (signalName, signalArgs)) = do
  gdArgs <- mapM asSignalArgument signalArgs
  let defaultArgs = []
  withArrayLen gdArgs $ \gdArgsLen gdArgsPtr ->
    withVariantArray' defaultArgs $ \(defArgsPtr, defArgsLen) ->
      withCString (T.unpack $ nameOf @a) $ \clsNamePtr -> do
        gdSigName <- toLowLevel signalName
        godot_nativescript_register_signal desc clsNamePtr $ GNI.Signal
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

foreign import ccall "dynamic"
  call_godot_class_constructor_ :: FunPtr (IO (Object)) -> IO (Object)

-- | Instantiate an object
new :: forall o. (Object :< o, Typeable o, AsVariant o) => IO (Maybe o)
new = do
  con <- Foreign.withCString (T.unpack $ nameOf @o) godot_get_class_constructor
  if con == nullFunPtr then
    pure Nothing else
    tryCast =<< call_godot_class_constructor_ con

newNativeScript :: forall a. NativeScript a => IO (Maybe a)
newNativeScript = do
  let name = nameOf @a
  Just nativescript <- new @Api.NativeScript
  Just gdnlib <- tryCast @Api.GDNativeLibrary =<< readIORef gdnativeLibraryRef
  NativeScript.set_library nativescript gdnlib
  NativeScript.set_class_name nativescript =<< toLowLevel name
  no <- fromGodotVariant =<< NativeScript.new nativescript []
  asNativeScript no

getNode :: forall b cls. (Object :< cls, Api.Node :< cls,
                    Api.Node :< b, Typeable b, AsVariant b)
        => cls -> Text -> IO b
getNode self name = do
  n :: Api.Node <- get_node_or_null self =<< toLowLevel name
  x <- tryCast n
  case x of
    Just r -> pure r
    _ -> error "Error, getNode failed"

getNodeNativeScript :: forall b child. (NativeScript b, Api.Node :< child, Object :< child)
         => child -> Text -> IO b
getNodeNativeScript self name = do
  n <- get_node self =<< toLowLevel name
  x <- asNativeScript $ upcast @Object n
  case x of
    Just r -> pure r
    _ -> error "Error, getNode' failed"

-- | The descriptor, Godot file resource path, of the current script. Some
-- GNative API functions need access to this.
scriptDesc :: MVar GodotString
{-# NOINLINE scriptDesc #-}
scriptDesc = unsafePerformIO newEmptyMVar

-- | Sometimes we really have to pass in a Haskell pointer to Godot,
-- particularly for callbacks.
data WrapperStablePtr = WrapperStablePtr { _wrapperStablePtrBase :: Object
                                , _wrapperStablePtr :: MVar (StablePtr ()) }
instance HasBaseClass WrapperStablePtr where
  type BaseClass WrapperStablePtr = Object
  super = _wrapperStablePtrBase
deriveBase ''WrapperStablePtr
instance NativeScript WrapperStablePtr where
  classInit base = WrapperStablePtr base <$> newEmptyMVar
  classMethods = []

-- | Called for you in the setup code.
defaultExports :: GdnativeHandle -> IO ()
defaultExports desc = do
  desc' <- newForeignPtr_ desc
  cpy <- godot_string_new_copy (coerce desc' :: GodotString)
  putMVar scriptDesc cpy
  registerClass $ RegClass desc $ classInit @WrapperStablePtr
  pure ()

-- | Ask an object to wait for a signal on a target. When the signal is trigged call the given function
-- For example, to get a callback when a timer fires you could do something like
-- @ await self timer "timeout" (\self -> print "Timer fired!") @
await :: forall cls source target a. (NativeScript cls, Object :< cls, Object :< target, AsVariant a)
      => cls -> target -> Text -> (cls -> IO a) -> IO ()
await self target signal fn = do
  desc <- readMVar scriptDesc
  (Just w) <- newNativeScript @WrapperStablePtr
  unlessM (has_method self =<< toLowLevel "__script_callback") $ do
    withForeignPtr (coerce desc)
      (\rawDesc ->
       registerMethod
        (RegMethod (coerce rawDesc)
         (method1 "__script_callback"
          (\self o -> do
              (Just w) <- asNativeScript @WrapperStablePtr o
              sptr <- takeMVar $ _wrapperStablePtr w
              fn :: (cls -> IO a) <- deRefStablePtr (castPtrToStablePtr (castStablePtrToPtr sptr))
              fn self
              freeStablePtr sptr))))
  fnptr <- newStablePtr fn
  putMVar (_wrapperStablePtr w) (castPtrToStablePtr (castStablePtrToPtr fnptr))
  fnBind <- toGodotVariant (upcast @Object w)
  guardError <$> (join $ connect target
    <$> toLowLevel signal
    <*> pure (upcast self)
    <*> toLowLevel "__script_callback"
    <*> (Just <$> toLowLevel (V.singleton fnBind))
    <*> pure (Just _CONNECT_ONESHOT))
