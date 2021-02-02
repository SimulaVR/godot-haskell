{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE AllowAmbiguousTypes, ScopedTypeVariables, GADTs #-}
{-# LANGUAGE UnboxedTuples, MagicHash #-}
{-# LANGUAGE PatternSynonyms, RecordWildCards #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}
module Godot.Gdnative.Internal.Gdnative where
import Control.Exception
import Control.Monad
import Data.Bits
import Data.Coerce
import Data.IORef
import Foreign
import Foreign.C
import System.IO.Unsafe

#include "util.h"
#include "gdnative_api_struct.gen.h"

{#context prefix = "godot_" #}

{#enum godot_error as Error {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_variant_type as VariantType {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_variant_call_error_error as VariantCallErrorError {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_vector3_axis as Vector3Axis {underscoreToCase}
 deriving (Show, Eq, Ord, Bounded)#}

{#enum godot_variant_operator as VariantOperator {underscoreToCase} 
 deriving (Show, Eq, Ord, Bounded)#}
  
{#typedef godot_bool Bool #}
type GodotBool = {#type godot_bool#}
{#typedef godot_int CInt #}
type GodotInt = {#type godot_int#}
{#typedef godot_real CFloat #}
type GodotReal = {#type godot_real#}
{#typedef godot_char_type CWchar #}
type CharType = {#type godot_char_type #}

{#pointer *godot_aabb as Aabb foreign newtype #}
deriving newtype instance Eq Aabb

{#pointer *godot_array as Array foreign newtype #}
deriving newtype instance Eq Array

{#pointer *godot_basis as Basis foreign newtype #}
deriving newtype instance Eq Basis

{#pointer *godot_char_string as CharString foreign newtype #}
deriving newtype instance Eq CharString

{#pointer *godot_color as Color foreign newtype #}
deriving newtype instance Eq Color

{#pointer *godot_dictionary as Dictionary foreign newtype #}
deriving newtype instance Eq Dictionary

{#pointer *godot_method_bind as MethodBind foreign newtype #}
deriving newtype instance Eq MethodBind

{#pointer *godot_node_path as NodePath foreign newtype #}
deriving newtype instance Eq NodePath

{#pointer *godot_plane as Plane foreign newtype #}
deriving newtype instance Eq Plane

{#pointer *godot_pool_array_read_access as PoolArrayReadAccess foreign newtype #}
deriving newtype instance Eq PoolArrayReadAccess

{#pointer *godot_pool_array_write_access as PoolArrayWriteAccess foreign newtype #}
deriving newtype instance Eq PoolArrayWriteAccess

{#pointer *godot_pool_byte_array as PoolByteArray foreign newtype #}
deriving newtype instance Eq PoolByteArray

{#pointer *godot_pool_color_array as PoolColorArray foreign newtype #}
deriving newtype instance Eq PoolColorArray

{#pointer *godot_pool_int_array as PoolIntArray foreign newtype #}
deriving newtype instance Eq PoolIntArray

{#pointer *godot_pool_real_array as PoolRealArray foreign newtype #}
deriving newtype instance Eq PoolRealArray

{#pointer *godot_pool_string_array as PoolStringArray foreign newtype #}
deriving newtype instance Eq PoolStringArray

{#pointer *godot_pool_vector2_array as PoolVector2Array foreign newtype #}
deriving newtype instance Eq PoolVector2Array

{#pointer *godot_pool_vector3_array as PoolVector3Array foreign newtype #}
deriving newtype instance Eq PoolVector3Array

{#pointer *godot_quat as Quat foreign newtype #}
deriving newtype instance Eq Quat

{#pointer *godot_rect2 as Rect2 foreign newtype #}
deriving newtype instance Eq Rect2

{#pointer *godot_rid as Rid foreign newtype #}
deriving newtype instance Eq Rid

{#pointer *godot_string as GodotString foreign newtype #}
deriving newtype instance Eq GodotString

{#pointer *godot_string_name as StringName foreign newtype #}
deriving newtype instance Eq StringName

{#pointer *godot_transform as Transform foreign newtype #}
deriving newtype instance Eq Transform

{#pointer *godot_transform2d as Transform2d foreign newtype #}
deriving newtype instance Eq Transform2d

{#pointer *godot_variant as GodotVariant foreign newtype #}
deriving newtype instance Eq GodotVariant

{#pointer *godot_vector2 as Vector2 foreign newtype #}
deriving newtype instance Eq Vector2

{#pointer *godot_vector3 as Vector3 foreign newtype #}
deriving newtype instance Eq Vector3


type PoolByteArrayReadAccess = PoolArrayReadAccess
type PoolByteArrayWriteAccess = PoolArrayWriteAccess
type PoolColorArrayReadAccess = PoolArrayReadAccess
type PoolColorArrayWriteAccess = PoolArrayWriteAccess
type PoolIntArrayReadAccess = PoolArrayReadAccess
type PoolIntArrayWriteAccess = PoolArrayWriteAccess
type PoolRealArrayReadAccess = PoolArrayReadAccess
type PoolRealArrayWriteAccess = PoolArrayWriteAccess
type PoolStringArrayReadAccess = PoolArrayReadAccess
type PoolStringArrayWriteAccess = PoolArrayWriteAccess
type PoolVector2ArrayReadAccess = PoolArrayReadAccess
type PoolVector2ArrayWriteAccess = PoolArrayWriteAccess
type PoolVector3ArrayReadAccess = PoolArrayReadAccess
type PoolVector3ArrayWriteAccess = PoolArrayWriteAccess

class OpaqueStorable a where
  opaqueSizeOf :: Int
instance OpaqueStorable Aabb where
  opaqueSizeOf = {#sizeof godot_aabb#}


instance OpaqueStorable Array where
  opaqueSizeOf = {#sizeof godot_array#}


instance OpaqueStorable Basis where
  opaqueSizeOf = {#sizeof godot_basis#}


instance OpaqueStorable CharString where
  opaqueSizeOf = {#sizeof godot_char_string#}


instance OpaqueStorable Color where
  opaqueSizeOf = {#sizeof godot_color#}


instance OpaqueStorable Dictionary where
  opaqueSizeOf = {#sizeof godot_dictionary#}


instance OpaqueStorable MethodBind where
  opaqueSizeOf = {#sizeof godot_method_bind#}


instance OpaqueStorable NodePath where
  opaqueSizeOf = {#sizeof godot_node_path#}


instance OpaqueStorable Plane where
  opaqueSizeOf = {#sizeof godot_plane#}


instance OpaqueStorable PoolArrayReadAccess where
  opaqueSizeOf = {#sizeof godot_pool_array_read_access#}


instance OpaqueStorable PoolArrayWriteAccess where
  opaqueSizeOf = {#sizeof godot_pool_array_write_access#}


instance OpaqueStorable PoolByteArray where
  opaqueSizeOf = {#sizeof godot_pool_byte_array#}


instance OpaqueStorable PoolColorArray where
  opaqueSizeOf = {#sizeof godot_pool_color_array#}


instance OpaqueStorable PoolIntArray where
  opaqueSizeOf = {#sizeof godot_pool_int_array#}


instance OpaqueStorable PoolRealArray where
  opaqueSizeOf = {#sizeof godot_pool_real_array#}


instance OpaqueStorable PoolStringArray where
  opaqueSizeOf = {#sizeof godot_pool_string_array#}


instance OpaqueStorable PoolVector2Array where
  opaqueSizeOf = {#sizeof godot_pool_vector2_array#}


instance OpaqueStorable PoolVector3Array where
  opaqueSizeOf = {#sizeof godot_pool_vector3_array#}


instance OpaqueStorable Quat where
  opaqueSizeOf = {#sizeof godot_quat#}


instance OpaqueStorable Rect2 where
  opaqueSizeOf = {#sizeof godot_rect2#}


instance OpaqueStorable Rid where
  opaqueSizeOf = {#sizeof godot_rid#}


instance OpaqueStorable GodotString where
  opaqueSizeOf = {#sizeof godot_string#}


instance OpaqueStorable StringName where
  opaqueSizeOf = {#sizeof godot_string_name#}


instance OpaqueStorable Transform where
  opaqueSizeOf = {#sizeof godot_transform#}


instance OpaqueStorable Transform2d where
  opaqueSizeOf = {#sizeof godot_transform2d#}


instance OpaqueStorable GodotVariant where
  opaqueSizeOf = {#sizeof godot_variant#}


instance OpaqueStorable Vector2 where
  opaqueSizeOf = {#sizeof godot_vector2#}


instance OpaqueStorable Vector3 where
  opaqueSizeOf = {#sizeof godot_vector3#}


data VariantCallError = VariantCallError
  { variantCallErrorError :: !VariantCallErrorError
  , variantCallErrorArgument :: !(Maybe CInt)
  , variantCallErrorExpected :: !(Maybe VariantType)
  } deriving (Show, Eq, Ord)

instance Exception VariantCallError

{#pointer *godot_variant_call_error as VariantCallErrorPtr -> VariantCallError#}

instance Storable VariantCallError where
  sizeOf _ = {#sizeof godot_variant_call_error#}
  alignment _ = {#alignof godot_variant_call_error#}
  peek ptr = do
    err <- (toEnum . fromIntegral) <$> {#get godot_variant_call_error->error #} ptr
    case err of
      CallErrorCallErrorInvalidArgument ->
        VariantCallError err 
             <$> (Just <$> {#get godot_variant_call_error->argument #} ptr)
             <*> ((Just . toEnum . fromIntegral) <$> {#get godot_variant_call_error->expected #} ptr)
      _ -> return $ VariantCallError err Nothing Nothing
  poke ptr a = error "can't poke VariantCallError"

{#pointer *godot_gdnative_api_struct as GdnativeApiStruct newtype#}
deriving newtype instance Eq GdnativeApiStruct
deriving newtype instance Storable GdnativeApiStruct

{#pointer *godot_gdnative_core_api_struct as GdnativeCoreApiStruct newtype#}
deriving newtype instance Eq GdnativeCoreApiStruct
deriving newtype instance Storable GdnativeCoreApiStruct

{#pointer *godot_gdnative_core_1_1_api_struct as GdnativeCore11ApiStruct newtype#}
deriving newtype instance Eq GdnativeCore11ApiStruct
deriving newtype instance Storable GdnativeCore11ApiStruct

{#pointer *godot_gdnative_ext_nativescript_api_struct as GdnativeExtNativescriptApiStruct newtype#}
deriving newtype instance Eq GdnativeExtNativescriptApiStruct
deriving newtype instance Storable GdnativeExtNativescriptApiStruct

{#pointer *godot_gdnative_ext_nativescript_1_1_api_struct as GdnativeExtNativescript11ApiStruct newtype#}
deriving newtype instance Eq GdnativeExtNativescript11ApiStruct
deriving newtype instance Storable GdnativeExtNativescript11ApiStruct

{#pointer *godot_gdnative_ext_pluginscript_api_struct as GdnativeExtPluginscriptApiStruct newtype#}
deriving newtype instance Eq GdnativeExtPluginscriptApiStruct
deriving newtype instance Storable GdnativeExtPluginscriptApiStruct

{#pointer *godot_gdnative_ext_arvr_api_struct as GdnativeExtArvrApiStruct newtype#}
deriving newtype instance Eq GdnativeExtArvrApiStruct
deriving newtype instance Storable GdnativeExtArvrApiStruct

{#pointer *godot_gdnative_ext_videodecoder_api_struct as GdnativeExtVideodecoderApiStruct newtype#}
deriving newtype instance Eq GdnativeExtVideodecoderApiStruct
deriving newtype instance Storable GdnativeExtVideodecoderApiStruct

{#pointer *godot_gdnative_ext_net_api_struct as GdnativeExtNetApiStruct newtype#}
deriving newtype instance Eq GdnativeExtNetApiStruct
deriving newtype instance Storable GdnativeExtNetApiStruct


type ReportVersionMismatchFunc = Object -> CString -> Word64 -> Word64 -> IO ()
type ReportLoadingErrorFunc = Object -> CString -> IO ()


{#pointer *godot_object as Object newtype #}
deriving newtype instance Show  Object
deriving newtype instance Eq Object
deriving newtype instance Storable Object


data GdnativeInitOptions = GdnativeInitOptions
  { gdnativeInitOptionsInEditor :: !Bool
  , gdnativeInitOptionsCoreApiHash :: !Word64
  , gdnativeInitOptionsEditorApiHash :: !Word64
  , gdnativeInitOptionsNoApiHash :: !Word64
  , gdnativeInitOptionsReportVersionMismatch :: !ReportVersionMismatchFunc
  , gdnativeInitOptionsReportLoadingError :: !ReportLoadingErrorFunc
  , gdnativeInitOptionsGdNativeLibrary :: !Object
  , gdnativeInitOptionsApiStruct :: !GdnativeCoreApiStruct
  , gdnativeInitOptionsActiveLibraryPath :: !GodotString
  }

foreign import ccall "dynamic" mkReportVersionMismatchFunc :: FunPtr ReportVersionMismatchFunc -> ReportVersionMismatchFunc

foreign import ccall "dynamic" mkReportLoadingErrorFunc :: FunPtr ReportLoadingErrorFunc -> ReportLoadingErrorFunc

instance Storable GdnativeInitOptions where
  sizeOf _ = {#sizeof godot_gdnative_init_options#}
  alignment _ = {#alignof godot_gdnative_init_options#}
  peek ptr = GdnativeInitOptions
             <$> {#get godot_gdnative_init_options->in_editor#} ptr
             <*> (fromIntegral <$> {#get godot_gdnative_init_options->core_api_hash#} ptr)
             <*> (fromIntegral <$> {#get godot_gdnative_init_options->editor_api_hash#} ptr)
             <*> (fromIntegral <$> {#get godot_gdnative_init_options->no_api_hash#} ptr)
             <*> ((mkReportVersionMismatchFunc . castFunPtrVersion) <$> {#get godot_gdnative_init_options->report_version_mismatch#} ptr)
             <*> (mkReportLoadingErrorFunc <$> {#get godot_gdnative_init_options->report_loading_error#} ptr)
             <*> {#get godot_gdnative_init_options->gd_native_library#} ptr
             <*> {#get godot_gdnative_init_options->api_struct#} ptr
             <*> (GodotString <$> ({#get godot_gdnative_init_options->active_library_path#} ptr >>= newForeignPtr_))
    where
      castFunPtrVersion :: FunPtr (Object -> Ptr CChar -> Ptr () -> Ptr () -> IO ()) -> FunPtr ReportVersionMismatchFunc
      castFunPtrVersion = castFunPtr
  poke _ _ = error "Poking GdNativeInitOptions is unsupported"

{#pointer *godot_gdnative_init_options as GdnativeInitOptionsPtr -> GdnativeInitOptions#}

data GdnativeTerminateOptions = GdnativeTerminateOptions
  { gdnativeTerminateOptionsInEditor :: Bool
  } deriving (Show, Eq, Ord)

instance Storable GdnativeTerminateOptions where
  sizeOf _ = {#sizeof godot_gdnative_terminate_options#}
  alignment _ = {#alignof godot_gdnative_terminate_options#}
  peek ptr = GdnativeTerminateOptions
             <$> {#get godot_gdnative_terminate_options->in_editor#} ptr
  poke ptr a = {#set godot_gdnative_terminate_options->in_editor#} ptr (gdnativeTerminateOptionsInEditor a)

{#pointer *godot_gdnative_terminate_options as GdnativeTerminateOptionsPtr -> GdnativeTerminateOptions#}


-- ok so:
-- on both SysV x64 and Win64, structs larger than 64bits are passed by pointer
-- i.e. the following two are equivalent:
{-
godot_variant test() {
    godot_variant var;
    godot_variant_new_nil(&var);
    return var;
}

godot_variant* test2(godot_variant* ret) {
    godot_variant_new_nil(ret);
    return ret;
}
-}
-- we're abusing this. remember to return the godotvariant!!
type NativeCallCb = FunPtr (Ptr GodotVariant -> Ptr () -> Array -> IO (Ptr GodotVariant))
-- funptrs
type ClassConstructor = FunPtr (IO Object)

-- stuff that's not opaque (i.e. needs to be Storable'd) but i don't want to deal w/ rn

-- pluginscript
-- TODO: we don't support pluginscript right now
data PluginscriptLanguageDesc
instance Storable PluginscriptLanguageDesc where
  sizeOf _ = {#sizeof godot_pluginscript_language_desc#}
  alignment _ = {#alignof godot_pluginscript_language_desc#}
  peek = error "PluginscriptLanguageDesc peek not implemented"
  poke = error "PluginscriptLanguageDesc poke not implemented"

{#pointer *godot_pluginscript_language_desc as PluginscriptLanguageDescPtr -> PluginscriptLanguageDesc#}

-- nativescript
{#enum godot_property_hint as PropertyHint {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_method_rpc_mode as MethodRpcMode {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

newtype PropertyUsageFlags = PropertyUsageFlags { unPropertyUsageFlags :: CInt }
  deriving newtype (Show, Eq, Ord, Bits, Storable)

pattern PropertyUsageStorage :: PropertyUsageFlags
pattern PropertyUsageStorage = PropertyUsageFlags 1

pattern PropertyUsageEditor :: PropertyUsageFlags
pattern PropertyUsageEditor = PropertyUsageFlags 2

pattern PropertyUsageNetwork :: PropertyUsageFlags
pattern PropertyUsageNetwork = PropertyUsageFlags 4

pattern PropertyUsageEditorHelper :: PropertyUsageFlags
pattern PropertyUsageEditorHelper = PropertyUsageFlags 8

pattern PropertyUsageCheckable :: PropertyUsageFlags
pattern PropertyUsageCheckable = PropertyUsageFlags 16

pattern PropertyUsageChecked :: PropertyUsageFlags
pattern PropertyUsageChecked = PropertyUsageFlags 32

pattern PropertyUsageInternationalized :: PropertyUsageFlags
pattern PropertyUsageInternationalized = PropertyUsageFlags 64

pattern PropertyUsageGroup :: PropertyUsageFlags
pattern PropertyUsageGroup = PropertyUsageFlags 128

pattern PropertyUsageCategory :: PropertyUsageFlags
pattern PropertyUsageCategory = PropertyUsageFlags 256

pattern PropertyUsageStoreIfNonzero :: PropertyUsageFlags
pattern PropertyUsageStoreIfNonzero = PropertyUsageFlags 512

pattern PropertyUsageStoreIfNonone :: PropertyUsageFlags
pattern PropertyUsageStoreIfNonone = PropertyUsageFlags 1024

pattern PropertyUsageNoInstanceState :: PropertyUsageFlags
pattern PropertyUsageNoInstanceState = PropertyUsageFlags 2048

pattern PropertyUsageRestartIfChanged :: PropertyUsageFlags
pattern PropertyUsageRestartIfChanged = PropertyUsageFlags 4096

pattern PropertyUsageScriptVariable :: PropertyUsageFlags
pattern PropertyUsageScriptVariable = PropertyUsageFlags 8192

pattern PropertyUsageStoreIfNull :: PropertyUsageFlags
pattern PropertyUsageStoreIfNull = PropertyUsageFlags 16384

pattern PropertyUsageAnimateAsTrigger :: PropertyUsageFlags
pattern PropertyUsageAnimateAsTrigger = PropertyUsageFlags 32768

pattern PropertyUsageUpdateAllIfModified :: PropertyUsageFlags
pattern PropertyUsageUpdateAllIfModified = PropertyUsageFlags 65536

godotPropertyUsageDefault :: PropertyUsageFlags
godotPropertyUsageDefault = PropertyUsageStorage .|. PropertyUsageEditor .|. PropertyUsageNetwork

godotPropertyUsageDefaultIntl :: PropertyUsageFlags
godotPropertyUsageDefaultIntl = godotPropertyUsageDefault .|. PropertyUsageInternationalized

godotPropertyUsageNoeditor :: PropertyUsageFlags
godotPropertyUsageNoeditor = PropertyUsageStorage .|. PropertyUsageNetwork

type InstanceCreateFun = Object -> Ptr () -> IO (Ptr ())
type InstanceDestroyFun = Object -> Ptr ()  -> Ptr () -> IO ()
type InstanceFreeFun = Ptr () -> IO ()

foreign import ccall "wrapper" mkInstanceCreateFunPtr :: InstanceCreateFun -> IO (FunPtr InstanceCreateFun)
foreign import ccall "wrapper" mkInstanceDestroyFunPtr :: InstanceDestroyFun -> IO (FunPtr InstanceDestroyFun)
foreign import ccall "wrapper" mkInstanceFreeFunPtr :: InstanceFreeFun -> IO (FunPtr InstanceFreeFun)

data InstanceCreateFunc = InstanceCreateFunc
  { godotInstanceCreateFunc :: !(FunPtr InstanceCreateFun)
  , godotInstanceCreateMethodData :: !(Ptr ())
  , godotInstanceCreateFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)
instance Storable InstanceCreateFunc where
  sizeOf _ = {#sizeof godot_instance_create_func#}
  alignment _ = {#alignof godot_instance_create_func#}
  peek ptr = InstanceCreateFunc
             <$> {#get godot_instance_create_func->create_func#} ptr
             <*> {#get godot_instance_create_func->method_data#} ptr
             <*> {#get godot_instance_create_func->free_func#} ptr
  poke ptr InstanceCreateFunc{..} = do
    {#set godot_instance_create_func->create_func#} ptr godotInstanceCreateFunc
    {#set godot_instance_create_func->method_data#} ptr godotInstanceCreateMethodData
    {#set godot_instance_create_func->free_func#} ptr godotInstanceCreateFreeFunc

{#pointer *godot_instance_create_func as InstanceCreateFuncPtr -> InstanceCreateFunc #}

data InstanceDestroyFunc = InstanceDestroyFunc
  { godotInstanceDestroyFunc :: !(FunPtr InstanceDestroyFun)
  , godotInstanceDestroyMethodData :: !(Ptr ())
  , godotInstanceDestroyFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)
instance Storable InstanceDestroyFunc where
  sizeOf _ = {#sizeof godot_instance_destroy_func#}
  alignment _ = {#alignof godot_instance_destroy_func#}
  peek ptr = InstanceDestroyFunc
             <$> {#get godot_instance_destroy_func->destroy_func#} ptr
             <*> {#get godot_instance_destroy_func->method_data#} ptr
             <*> {#get godot_instance_destroy_func->free_func#} ptr
  poke ptr InstanceDestroyFunc{..} = do
    {#set godot_instance_destroy_func->destroy_func#} ptr godotInstanceDestroyFunc
    {#set godot_instance_destroy_func->method_data#} ptr godotInstanceDestroyMethodData
    {#set godot_instance_destroy_func->free_func#} ptr godotInstanceDestroyFreeFunc

{#pointer *godot_instance_destroy_func as InstanceDestroyFuncPtr -> InstanceDestroyFunc #}

type InstanceMethodFun = Ptr GodotVariant -> Object -> Ptr () -> Ptr () -> CInt 
                      -> Ptr (Ptr GodotVariant) -> IO (Ptr GodotVariant)

foreign import ccall "wrapper" mkInstanceMethodFunPtr :: InstanceMethodFun -> IO (FunPtr InstanceMethodFun)

data InstanceMethod = InstanceMethod
  { godotInstanceMethod :: !(FunPtr InstanceMethodFun)
  , godotInstanceMethodData :: !(Ptr ())
  , godotInstanceMethodFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)
instance Storable InstanceMethod where
    sizeOf _ = {#sizeof godot_instance_method#}
    alignment _ = {#alignof godot_instance_method#}
    peek ptr = InstanceMethod
               <$> (castFunPtr <$> {#get godot_instance_method->method#} ptr)
               <*> {#get godot_instance_method->method_data#} ptr
               <*> {#get godot_instance_method->free_func#} ptr
    poke ptr InstanceMethod{..} = do
      {#set godot_instance_method->method#} ptr (castFunPtr godotInstanceMethod)
      {#set godot_instance_method->method_data#} ptr godotInstanceMethodData
      {#set godot_instance_method->free_func#} ptr godotInstanceMethodFreeFunc

{#pointer *godot_instance_method as InstanceMethodPtr -> InstanceMethod #}

newtype MethodAttributes = MethodAttributes MethodRpcMode
  deriving newtype (Show, Eq)

instance Storable MethodAttributes where
  sizeOf _ = {#sizeof godot_method_attributes#}
  alignment _ = {#alignof godot_method_attributes#}
  peek ptr = (MethodAttributes . toEnum . fromIntegral) <$> {#get godot_method_attributes->rpc_type#} ptr
  poke ptr (MethodAttributes rpcType) = {#set godot_method_attributes->rpc_type#} ptr (fromIntegral $ fromEnum rpcType)

{#pointer *godot_method_attributes as MethodAttributesPtr -> MethodAttributes #}

type PropertyGetFun = Ptr GodotVariant -> Object -> Ptr () -> Ptr () -> IO (Ptr GodotVariant)

foreign import ccall "wrapper" mkPropertyGetFunPtr :: PropertyGetFun -> IO (FunPtr PropertyGetFun)

data PropertyGetFunc = PropertyGetFunc
  { godotPropertyGetFunc :: !(FunPtr PropertyGetFun)
  , godotPropertyGetMethodData :: !(Ptr ())
  , godotPropertyGetFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)

instance Storable PropertyGetFunc where
  sizeOf _ = {#sizeof godot_property_get_func#}
  alignment _ = {#alignof godot_property_get_func#}
  peek ptr = PropertyGetFunc
             <$> (castFunPtr <$> {#get godot_property_get_func->get_func#} ptr)
             <*> {#get godot_property_get_func->method_data#} ptr
             <*> {#get godot_property_get_func->free_func#} ptr
  poke ptr PropertyGetFunc{..} = do
    {#set godot_property_get_func->get_func#} ptr (castFunPtr godotPropertyGetFunc)
    {#set godot_property_get_func->method_data#} ptr godotPropertyGetMethodData
    {#set godot_property_get_func->free_func#} ptr godotPropertyGetFreeFunc

{#pointer *godot_property_get_func as PropertyGetFuncPtr -> PropertyGetFunc #}

type PropertySetFun = Object -> Ptr () -> Ptr () -> Ptr GodotVariant -> IO ()

foreign import ccall "wrapper" mkPropertySetFunPtr :: PropertySetFun -> IO (FunPtr PropertySetFun)

data PropertySetFunc = PropertySetFunc
  { godotPropertySetFunc :: !(FunPtr PropertySetFun)
  , godotPropertySetMethodData :: !(Ptr ())
  , godotPropertySetFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)

instance Storable PropertySetFunc where
    sizeOf _ = {#sizeof godot_property_set_func#}
    alignment _ = {#alignof godot_property_set_func#}
    peek ptr = PropertySetFunc
               <$> {#get godot_property_set_func->set_func#} ptr
               <*> {#get godot_property_set_func->method_data#} ptr
               <*> {#get godot_property_set_func->free_func#} ptr
    poke ptr PropertySetFunc{..} = do
      {#set godot_property_set_func->set_func#} ptr godotPropertySetFunc
      {#set godot_property_set_func->method_data#} ptr godotPropertySetMethodData
      {#set godot_property_set_func->free_func#} ptr godotPropertySetFreeFunc

{#pointer *godot_property_set_func as PropertySetFuncPtr -> PropertySetFunc #}

getOpaqueFromStruct :: forall a b. OpaqueStorable a => (ForeignPtr a -> a) -> Ptr b -> Int -> IO a
getOpaqueFromStruct con structPtr offset = do
  let start = structPtr `plusPtr` offset
  let size = opaqueSizeOf @a
  (fptr :: ForeignPtr a) <- mallocForeignPtrBytes size
  withForeignPtr fptr $ \ptr -> copyBytes ptr start size
  return $ con fptr

setOpaqueFromStruct :: forall a b. (Coercible a (ForeignPtr a), OpaqueStorable a) => Ptr b -> a -> Int -> IO ()
setOpaqueFromStruct structPtr fptr offset = do
    let start = structPtr `plusPtr` offset
    let size = opaqueSizeOf @a
    withForeignPtr (coerce fptr :: ForeignPtr a) $ \ptr -> copyBytes start ptr size

data PropertyAttributes = PropertyAttributes
  { godotPropertyAttributesRsetType :: !MethodRpcMode
  , godotPropertyAttributesType :: !GodotInt
  , godotPropertyAttributesHint :: !PropertyHint
  , godotPropertyAttributesHintString :: !GodotString
  , godotPropertyAttributesUsage :: !PropertyUsageFlags
  , godotPropertyAttributesDefaultValue :: !GodotVariant
  }
instance Storable PropertyAttributes where
  sizeOf _ = {#sizeof godot_property_attributes#}
  alignment _ = {#alignof godot_property_attributes#}
  peek ptr = do
    godotPropertyAttributesRsetType <- (toEnum . fromIntegral) <$> {#get godot_property_attributes->rset_type#} ptr
    godotPropertyAttributesType <- {#get godot_property_attributes->type#} ptr
    godotPropertyAttributesHint <- (toEnum . fromIntegral) <$> {#get godot_property_attributes->hint#} ptr 
    godotPropertyAttributesHintString <- getOpaqueFromStruct GodotString ptr {#offsetof godot_property_attributes->hint_string#}
    godotPropertyAttributesUsage <- PropertyUsageFlags <$> {#get godot_property_attributes->usage#} ptr
    godotPropertyAttributesDefaultValue <- getOpaqueFromStruct GodotVariant ptr {#offsetof godot_property_attributes->default_value#}
    return PropertyAttributes{..}
  poke ptr PropertyAttributes{..} = do
    {#set godot_property_attributes->rset_type#} ptr (fromIntegral . fromEnum $ godotPropertyAttributesRsetType)
    {#set godot_property_attributes->type#} ptr godotPropertyAttributesType
    {#set godot_property_attributes->hint#} ptr (fromIntegral . fromEnum $ godotPropertyAttributesHint)
    setOpaqueFromStruct ptr godotPropertyAttributesHintString {#offsetof godot_property_attributes->hint_string#}
    {#set godot_property_attributes->usage#} ptr (unPropertyUsageFlags godotPropertyAttributesUsage)
    setOpaqueFromStruct ptr godotPropertyAttributesDefaultValue {#offsetof godot_property_attributes->default_value#}

{#pointer *godot_property_attributes as PropertyAttributesPtr -> PropertyAttributes #}


data SignalArgument = SignalArgument
  { godotSignalArgumentName :: !GodotString
  , godotSignalArgumentType :: !GodotInt
  , godotSignalArgumentHint :: !PropertyHint
  , godotSignalArgumentHintString :: !GodotString
  , godotSignalArgumentUsage :: !PropertyUsageFlags
  , godotSignalArgumentDefaultValue :: !GodotVariant
  }
instance Storable SignalArgument where
  sizeOf _ = {#sizeof godot_signal_argument#}
  alignment _ = {#alignof godot_signal_argument#}
  peek ptr = do
    godotSignalArgumentName <- getOpaqueFromStruct GodotString ptr {#offsetof godot_signal_argument->name#} 
    godotSignalArgumentType <- {#get godot_signal_argument->type#} ptr
    godotSignalArgumentHint <- (toEnum . fromIntegral) <$> {#get godot_signal_argument->hint#} ptr 
    godotSignalArgumentHintString <- getOpaqueFromStruct GodotString ptr {#offsetof godot_signal_argument->hint_string#}
    godotSignalArgumentUsage <- PropertyUsageFlags <$> {#get godot_signal_argument->usage#} ptr
    godotSignalArgumentDefaultValue <- getOpaqueFromStruct GodotVariant ptr {#offsetof godot_signal_argument->default_value#}
    return SignalArgument{..}
  poke ptr SignalArgument{..} = do
    setOpaqueFromStruct ptr godotSignalArgumentName {#offsetof godot_signal_argument->name#}
    {#set godot_signal_argument->type#} ptr godotSignalArgumentType
    {#set godot_signal_argument->hint#} ptr (fromIntegral . fromEnum $ godotSignalArgumentHint)
    setOpaqueFromStruct ptr godotSignalArgumentHintString {#offsetof godot_signal_argument->hint_string#}
    {#set godot_signal_argument->usage#} ptr (unPropertyUsageFlags godotSignalArgumentUsage)
    setOpaqueFromStruct ptr godotSignalArgumentDefaultValue {#offsetof godot_signal_argument->default_value#}
{#pointer *godot_signal_argument as SignalArgumentPtr -> SignalArgument#}

data Signal = Signal
  { godotSignalName :: !GodotString
  , godotSignalNumArgs :: !CInt
  , godotSignalArgs :: !(Ptr SignalArgument)
  , godotSignalNumDefaultArgs :: !CInt
  , godotSignalDefaultArgs :: !(Ptr GodotVariant)
  }
instance Storable Signal where
  sizeOf _ = {#sizeof godot_signal#}
  alignment _ = {#alignof godot_signal#}
  peek ptr = do
    godotSignalName <- getOpaqueFromStruct GodotString ptr {#offsetof godot_signal->name#} 
    godotSignalNumArgs <- {#get godot_signal->num_args#} ptr
    godotSignalArgs <- {#get godot_signal->args#} ptr
    godotSignalNumDefaultArgs <- {#get godot_signal->num_default_args#} ptr
    godotSignalDefaultArgs <- {#get godot_signal->default_args#} ptr
    return Signal{..}
  poke ptr Signal{..} = do
    setOpaqueFromStruct ptr godotSignalName {#offsetof godot_signal->name#}
    {#set godot_signal->num_args#} ptr godotSignalNumArgs
    {#set godot_signal->args#} ptr godotSignalArgs
    {#set godot_signal->num_default_args#} ptr godotSignalNumDefaultArgs
    {#set godot_signal->default_args#} ptr godotSignalDefaultArgs
    
{#pointer *godot_signal as SignalPtr -> Signal#}



data InstanceBindingFunctions
instance Storable InstanceBindingFunctions where
  sizeOf _ = {#sizeof godot_instance_binding_functions#}
  alignment _ = {#sizeof godot_instance_binding_functions#}
  peek = error "InstanceBindingFunctions peek not implemented"
  poke = error "InstanceBindingFunctions poke not implemented"
{#pointer *godot_instance_binding_functions as InstanceBindingFunctionsPtr -> InstanceBindingFunctions #}


data MethodArg
instance Storable MethodArg where
  sizeOf _ = {#sizeof godot_method_arg#}
  alignment _ = {#sizeof godot_method_arg#}
  peek = error "MethodArg peek not implemented"
  poke = error "MethodArg poke not implemented"
{#pointer *godot_method_arg as MethodArgPtr -> MethodArg #}


--net

data NetStreamPeer
instance Storable NetStreamPeer where
  sizeOf _ = {#sizeof godot_net_stream_peer#}
  alignment _ = {#sizeof godot_net_stream_peer#}
  peek = error "NetStreamPeer peek not implemented"
  poke = error "NetStreamPeer poke not implemented"
{#pointer *godot_net_stream_peer as NetStreamPeerPtr -> NetStreamPeer #}

data NetPacketPeer
instance Storable NetPacketPeer where
  sizeOf _ = {#sizeof godot_net_packet_peer#}
  alignment _ = {#sizeof godot_net_packet_peer#}
  peek = error "NetPacketPeer peek not implemented"
  poke = error "NetPacketPeer poke not implemented"
{#pointer *godot_net_packet_peer as NetPacketPeerPtr -> NetPacketPeer #}

data NetMultiplayerPeer
instance Storable NetMultiplayerPeer where
  sizeOf _ = {#sizeof godot_net_multiplayer_peer#}
  alignment _ = {#sizeof godot_net_multiplayer_peer#}
  peek = error "NetMultiplayerPeer peek not implemented"
  poke = error "NetMultiplayerPeer poke not implemented"
{#pointer *godot_net_multiplayer_peer as NetMultiplayerPeerPtr -> NetMultiplayerPeer #}


--videodecoder

data VideodecoderInterfaceGdnative
instance Storable VideodecoderInterfaceGdnative where
  sizeOf _ = {#sizeof godot_videodecoder_interface_gdnative#}
  alignment _ = {#sizeof godot_videodecoder_interface_gdnative#}
  peek = error "VideodecoderInterfaceGdnative peek not implemented"
  poke = error "VideodecoderInterfaceGdnative poke not implemented"
{#pointer *godot_videodecoder_interface_gdnative as VideodecoderInterfaceGdnativePtr -> VideodecoderInterfaceGdnative #}


--arvr

data ArvrInterfaceGdnative
instance Storable ArvrInterfaceGdnative where
  sizeOf _ = {#sizeof godot_arvr_interface_gdnative#}
  alignment _ = {#sizeof godot_arvr_interface_gdnative#}
  peek = error "ArvrInterfaceGdnative peek not implemented"
  poke = error "ArvrInterfaceGdnative poke not implemented"
{#pointer *godot_arvr_interface_gdnative as ArvrInterfaceGdnativePtr -> ArvrInterfaceGdnative #}




gdnativeCoreApiStructRef :: IORef GdnativeCoreApiStruct
gdnativeCoreApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get gdnativeCoreApiStructRef too early"
{-# NOINLINE gdnativeCoreApiStructRef #-}

gdnativeCore11ApiStructRef :: IORef GdnativeCore11ApiStruct
gdnativeCore11ApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get gdnativeCore11ApiStructRef too early"
{-# NOINLINE gdnativeCore11ApiStructRef #-}

gdNativeLibraryRef :: IORef Object
gdNativeLibraryRef = unsafePerformIO $ newIORef $ 
  error "attempted to get gdnativeCoreApiStructRef too early"

gdnativeExtNativescriptApiStructRef :: IORef GdnativeExtNativescriptApiStruct
gdnativeExtNativescriptApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get gdnativeExtNativescriptApiStructRef too early"
{-# NOINLINE gdnativeExtNativescriptApiStructRef #-}

gdnativeExtNativescript11ApiStructRef :: IORef GdnativeExtNativescript11ApiStruct
gdnativeExtNativescript11ApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get gdnativeExtNativescript11ApiStructRef too early"
{-# NOINLINE gdnativeExtNativescript11ApiStructRef #-}

gdnativeExtPluginscriptApiStructRef :: IORef GdnativeExtPluginscriptApiStruct
gdnativeExtPluginscriptApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get gdnativeExtPluginscriptApiStructRef too early"
{-# NOINLINE gdnativeExtPluginscriptApiStructRef #-}

gdnativeExtArvrApiStructRef :: IORef GdnativeExtArvrApiStruct
gdnativeExtArvrApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get gdnativeExtArvrApiStructRef too early"
{-# NOINLINE gdnativeExtArvrApiStructRef #-}

gdnativeExtVideodecoderApiStructRef :: IORef GdnativeExtVideodecoderApiStruct
gdnativeExtVideodecoderApiStructRef = unsafePerformIO $ newIORef $
  error "attempted to get gdnativeExtVideodecoderApiStructRef too early"
{-# NOINLINE gdnativeExtVideodecoderApiStructRef #-}

gdnativeExtNetApiStructRef :: IORef GdnativeExtNetApiStruct
gdnativeExtNetApiStructRef = unsafePerformIO $ newIORef $
  error "attempted to get gdnativeExtNetApiStructRef too early"
{-# NOINLINE gdnativeExtNetApiStructRef #-}


initApiStructs :: GdnativeInitOptions -> IO ()
initApiStructs opts = do
  let coreApi = gdnativeInitOptionsApiStruct opts
  writeIORef gdnativeCoreApiStructRef coreApi
  findCoreExt (coerce coreApi)
  let gdnLib = gdnativeInitOptionsGdNativeLibrary opts
  writeIORef gdNativeLibraryRef gdnLib

  numExt <- {#get godot_gdnative_core_api_struct->num_extensions #} coreApi
  extsPtr <- {#get godot_gdnative_core_api_struct->extensions #} coreApi
  exts <- peekArray (fromIntegral numExt) (castPtr extsPtr :: Ptr GdnativeApiStruct)
  forM_ exts $ \ext -> do
    ty <- {#get godot_gdnative_api_struct->type #} ext
    -- HACK
    case ty of
      1 -> do -- nativescript
        writeIORef gdnativeExtNativescriptApiStructRef (coerce ext)
        findNativescriptExt ext
      2 -> do -- pluginscript
        writeIORef gdnativeExtPluginscriptApiStructRef (coerce ext)
      3 -> return () -- android
      4 -> do -- arvr
        writeIORef gdnativeExtArvrApiStructRef (coerce ext)
      5 -> do -- videodecoder
        writeIORef gdnativeExtVideodecoderApiStructRef (coerce ext)
      6 -> do -- net
        writeIORef gdnativeExtNetApiStructRef (coerce ext)
      _ -> error $ "Unknown API struct type " ++ show ty
  where
    findCoreExt = findExt GdnativeCore11ApiStruct gdnativeCore11ApiStructRef
    findNativescriptExt = findExt GdnativeExtNativescript11ApiStruct gdnativeExtNativescript11ApiStructRef
    findExt con ref ext = do
      next <- {#get godot_gdnative_api_struct->next #} ext
      when (next /= coerce nullPtr) $ do

        major <- {#get godot_gdnative_api_struct->version.major #} next
        minor <- {#get godot_gdnative_api_struct->version.minor #} next
        if major == 1 && minor == 1 then writeIORef ref (con $ coerce next)
        else findExt con ref next


