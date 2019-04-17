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

{#enum godot_error as GodotError {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_variant_type as GodotVariantType {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_variant_call_error_error as GodotVariantCallErrorError {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_vector3_axis as GodotVector3Axis {underscoreToCase}
 deriving (Show, Eq, Ord, Bounded)#}

{#enum godot_variant_operator as GodotVariantOperator {underscoreToCase} 
 deriving (Show, Eq, Ord, Bounded)#}
  
{#typedef godot_bool Bool #}
type GodotBool = {#type godot_bool#}
{#typedef godot_int CInt #}
type GodotInt = {#type godot_int#}
{#typedef godot_real CFloat #}
type GodotReal = {#type godot_real#}
{#typedef godot_char_type CWchar #}
type GodotCharType = {#type godot_char_type #}

{#pointer *godot_aabb as GodotAabb foreign newtype #}
deriving newtype instance Eq GodotAabb

{#pointer *godot_array as GodotArray foreign newtype #}
deriving newtype instance Eq GodotArray

{#pointer *godot_basis as GodotBasis foreign newtype #}
deriving newtype instance Eq GodotBasis

{#pointer *godot_char_string as GodotCharString foreign newtype #}
deriving newtype instance Eq GodotCharString

{#pointer *godot_color as GodotColor foreign newtype #}
deriving newtype instance Eq GodotColor

{#pointer *godot_dictionary as GodotDictionary foreign newtype #}
deriving newtype instance Eq GodotDictionary

{#pointer *godot_method_bind as GodotMethodBind foreign newtype #}
deriving newtype instance Eq GodotMethodBind

{#pointer *godot_node_path as GodotNodePath foreign newtype #}
deriving newtype instance Eq GodotNodePath

{#pointer *godot_plane as GodotPlane foreign newtype #}
deriving newtype instance Eq GodotPlane

{#pointer *godot_pool_array_read_access as GodotPoolArrayReadAccess foreign newtype #}
deriving newtype instance Eq GodotPoolArrayReadAccess

{#pointer *godot_pool_array_write_access as GodotPoolArrayWriteAccess foreign newtype #}
deriving newtype instance Eq GodotPoolArrayWriteAccess

{#pointer *godot_pool_byte_array as GodotPoolByteArray foreign newtype #}
deriving newtype instance Eq GodotPoolByteArray

{#pointer *godot_pool_color_array as GodotPoolColorArray foreign newtype #}
deriving newtype instance Eq GodotPoolColorArray

{#pointer *godot_pool_int_array as GodotPoolIntArray foreign newtype #}
deriving newtype instance Eq GodotPoolIntArray

{#pointer *godot_pool_real_array as GodotPoolRealArray foreign newtype #}
deriving newtype instance Eq GodotPoolRealArray

{#pointer *godot_pool_string_array as GodotPoolStringArray foreign newtype #}
deriving newtype instance Eq GodotPoolStringArray

{#pointer *godot_pool_vector2_array as GodotPoolVector2Array foreign newtype #}
deriving newtype instance Eq GodotPoolVector2Array

{#pointer *godot_pool_vector3_array as GodotPoolVector3Array foreign newtype #}
deriving newtype instance Eq GodotPoolVector3Array

{#pointer *godot_quat as GodotQuat foreign newtype #}
deriving newtype instance Eq GodotQuat

{#pointer *godot_rect2 as GodotRect2 foreign newtype #}
deriving newtype instance Eq GodotRect2

{#pointer *godot_rid as GodotRid foreign newtype #}
deriving newtype instance Eq GodotRid

{#pointer *godot_string as GodotString foreign newtype #}
deriving newtype instance Eq GodotString

{#pointer *godot_string_name as GodotStringName foreign newtype #}
deriving newtype instance Eq GodotStringName

{#pointer *godot_transform as GodotTransform foreign newtype #}
deriving newtype instance Eq GodotTransform

{#pointer *godot_transform2d as GodotTransform2d foreign newtype #}
deriving newtype instance Eq GodotTransform2d

{#pointer *godot_variant as GodotVariant foreign newtype #}
deriving newtype instance Eq GodotVariant

{#pointer *godot_vector2 as GodotVector2 foreign newtype #}
deriving newtype instance Eq GodotVector2

{#pointer *godot_vector3 as GodotVector3 foreign newtype #}
deriving newtype instance Eq GodotVector3


type GodotPoolByteArrayReadAccess = GodotPoolArrayReadAccess
type GodotPoolByteArrayWriteAccess = GodotPoolArrayWriteAccess
type GodotPoolColorArrayReadAccess = GodotPoolArrayReadAccess
type GodotPoolColorArrayWriteAccess = GodotPoolArrayWriteAccess
type GodotPoolIntArrayReadAccess = GodotPoolArrayReadAccess
type GodotPoolIntArrayWriteAccess = GodotPoolArrayWriteAccess
type GodotPoolRealArrayReadAccess = GodotPoolArrayReadAccess
type GodotPoolRealArrayWriteAccess = GodotPoolArrayWriteAccess
type GodotPoolStringArrayReadAccess = GodotPoolArrayReadAccess
type GodotPoolStringArrayWriteAccess = GodotPoolArrayWriteAccess
type GodotPoolVector2ArrayReadAccess = GodotPoolArrayReadAccess
type GodotPoolVector2ArrayWriteAccess = GodotPoolArrayWriteAccess
type GodotPoolVector3ArrayReadAccess = GodotPoolArrayReadAccess
type GodotPoolVector3ArrayWriteAccess = GodotPoolArrayWriteAccess

class OpaqueStorable a where
  opaqueSizeOf :: Int
instance OpaqueStorable GodotAabb where
  opaqueSizeOf = {#sizeof godot_aabb#}


instance OpaqueStorable GodotArray where
  opaqueSizeOf = {#sizeof godot_array#}


instance OpaqueStorable GodotBasis where
  opaqueSizeOf = {#sizeof godot_basis#}


instance OpaqueStorable GodotCharString where
  opaqueSizeOf = {#sizeof godot_char_string#}


instance OpaqueStorable GodotColor where
  opaqueSizeOf = {#sizeof godot_color#}


instance OpaqueStorable GodotDictionary where
  opaqueSizeOf = {#sizeof godot_dictionary#}


instance OpaqueStorable GodotMethodBind where
  opaqueSizeOf = {#sizeof godot_method_bind#}


instance OpaqueStorable GodotNodePath where
  opaqueSizeOf = {#sizeof godot_node_path#}


instance OpaqueStorable GodotPlane where
  opaqueSizeOf = {#sizeof godot_plane#}


instance OpaqueStorable GodotPoolArrayReadAccess where
  opaqueSizeOf = {#sizeof godot_pool_array_read_access#}


instance OpaqueStorable GodotPoolArrayWriteAccess where
  opaqueSizeOf = {#sizeof godot_pool_array_write_access#}


instance OpaqueStorable GodotPoolByteArray where
  opaqueSizeOf = {#sizeof godot_pool_byte_array#}


instance OpaqueStorable GodotPoolColorArray where
  opaqueSizeOf = {#sizeof godot_pool_color_array#}


instance OpaqueStorable GodotPoolIntArray where
  opaqueSizeOf = {#sizeof godot_pool_int_array#}


instance OpaqueStorable GodotPoolRealArray where
  opaqueSizeOf = {#sizeof godot_pool_real_array#}


instance OpaqueStorable GodotPoolStringArray where
  opaqueSizeOf = {#sizeof godot_pool_string_array#}


instance OpaqueStorable GodotPoolVector2Array where
  opaqueSizeOf = {#sizeof godot_pool_vector2_array#}


instance OpaqueStorable GodotPoolVector3Array where
  opaqueSizeOf = {#sizeof godot_pool_vector3_array#}


instance OpaqueStorable GodotQuat where
  opaqueSizeOf = {#sizeof godot_quat#}


instance OpaqueStorable GodotRect2 where
  opaqueSizeOf = {#sizeof godot_rect2#}


instance OpaqueStorable GodotRid where
  opaqueSizeOf = {#sizeof godot_rid#}


instance OpaqueStorable GodotString where
  opaqueSizeOf = {#sizeof godot_string#}


instance OpaqueStorable GodotStringName where
  opaqueSizeOf = {#sizeof godot_string_name#}


instance OpaqueStorable GodotTransform where
  opaqueSizeOf = {#sizeof godot_transform#}


instance OpaqueStorable GodotTransform2d where
  opaqueSizeOf = {#sizeof godot_transform2d#}


instance OpaqueStorable GodotVariant where
  opaqueSizeOf = {#sizeof godot_variant#}


instance OpaqueStorable GodotVector2 where
  opaqueSizeOf = {#sizeof godot_vector2#}


instance OpaqueStorable GodotVector3 where
  opaqueSizeOf = {#sizeof godot_vector3#}


data GodotVariantCallError = GodotVariantCallError
  { variantCallErrorError :: !GodotVariantCallErrorError
  , variantCallErrorArgument :: !(Maybe CInt)
  , variantCallErrorExpected :: !(Maybe GodotVariantType)
  } deriving (Show, Eq, Ord)

instance Exception GodotVariantCallError

{#pointer *godot_variant_call_error as GodotVariantCallErrorPtr -> GodotVariantCallError#}

instance Storable GodotVariantCallError where
  sizeOf _ = {#sizeof godot_variant_call_error#}
  alignment _ = {#alignof godot_variant_call_error#}
  peek ptr = do
    err <- (toEnum . fromIntegral) <$> {#get godot_variant_call_error->error #} ptr
    case err of
      GodotCallErrorCallErrorInvalidArgument ->
        GodotVariantCallError err 
             <$> (Just <$> {#get godot_variant_call_error->argument #} ptr)
             <*> ((Just . toEnum . fromIntegral) <$> {#get godot_variant_call_error->expected #} ptr)
      _ -> return $ GodotVariantCallError err Nothing Nothing
  poke ptr a = error "can't poke GodotVariantCallError"

{#pointer *godot_gdnative_api_struct as GodotGdnativeApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeApiStruct
deriving newtype instance Storable GodotGdnativeApiStruct

{#pointer *godot_gdnative_core_api_struct as GodotGdnativeCoreApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeCoreApiStruct
deriving newtype instance Storable GodotGdnativeCoreApiStruct

{#pointer *godot_gdnative_core_1_1_api_struct as GodotGdnativeCore11ApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeCore11ApiStruct
deriving newtype instance Storable GodotGdnativeCore11ApiStruct

{#pointer *godot_gdnative_ext_nativescript_api_struct as GodotGdnativeExtNativescriptApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeExtNativescriptApiStruct
deriving newtype instance Storable GodotGdnativeExtNativescriptApiStruct

{#pointer *godot_gdnative_ext_nativescript_1_1_api_struct as GodotGdnativeExtNativescript11ApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeExtNativescript11ApiStruct
deriving newtype instance Storable GodotGdnativeExtNativescript11ApiStruct

{#pointer *godot_gdnative_ext_pluginscript_api_struct as GodotGdnativeExtPluginscriptApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeExtPluginscriptApiStruct
deriving newtype instance Storable GodotGdnativeExtPluginscriptApiStruct

{#pointer *godot_gdnative_ext_arvr_api_struct as GodotGdnativeExtArvrApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeExtArvrApiStruct
deriving newtype instance Storable GodotGdnativeExtArvrApiStruct

{#pointer *godot_gdnative_ext_videodecoder_api_struct as GodotGdnativeExtVideodecoderApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeExtVideodecoderApiStruct
deriving newtype instance Storable GodotGdnativeExtVideodecoderApiStruct

{#pointer *godot_gdnative_ext_net_api_struct as GodotGdnativeExtNetApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeExtNetApiStruct
deriving newtype instance Storable GodotGdnativeExtNetApiStruct


type ReportVersionMismatchFunc = GodotObject -> CString -> Word64 -> Word64 -> IO ()
type ReportLoadingErrorFunc = GodotObject -> CString -> IO ()


{#pointer *godot_object as GodotObject newtype #}
deriving newtype instance Show  GodotObject
deriving newtype instance Eq GodotObject
deriving newtype instance Storable GodotObject


data GodotGdnativeInitOptions = GodotGdnativeInitOptions
  { gdnativeInitOptionsInEditor :: !Bool
  , gdnativeInitOptionsCoreApiHash :: !Word64
  , gdnativeInitOptionsEditorApiHash :: !Word64
  , gdnativeInitOptionsNoApiHash :: !Word64
  , gdnativeInitOptionsReportVersionMismatch :: !ReportVersionMismatchFunc
  , gdnativeInitOptionsReportLoadingError :: !ReportLoadingErrorFunc
  , gdnativeInitOptionsGdNativeLibrary :: !GodotObject
  , gdnativeInitOptionsApiStruct :: !GodotGdnativeCoreApiStruct
  , gdnativeInitOptionsActiveLibraryPath :: !GodotString
  }

foreign import ccall "dynamic" mkReportVersionMismatchFunc :: FunPtr ReportVersionMismatchFunc -> ReportVersionMismatchFunc

foreign import ccall "dynamic" mkReportLoadingErrorFunc :: FunPtr ReportLoadingErrorFunc -> ReportLoadingErrorFunc

instance Storable GodotGdnativeInitOptions where
  sizeOf _ = {#sizeof godot_gdnative_init_options#}
  alignment _ = {#alignof godot_gdnative_init_options#}
  peek ptr = GodotGdnativeInitOptions
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
      castFunPtrVersion :: FunPtr (GodotObject -> Ptr CChar -> Ptr () -> Ptr () -> IO ()) -> FunPtr ReportVersionMismatchFunc
      castFunPtrVersion = castFunPtr
  poke _ _ = error "Poking GodotGdNativeInitOptions is unsupported"

{#pointer *godot_gdnative_init_options as GodotGdnativeInitOptionsPtr -> GodotGdnativeInitOptions#}

data GodotGdnativeTerminateOptions = GodotGdnativeTerminateOptions
  { gdnativeTerminateOptionsInEditor :: Bool
  } deriving (Show, Eq, Ord)

instance Storable GodotGdnativeTerminateOptions where
  sizeOf _ = {#sizeof godot_gdnative_terminate_options#}
  alignment _ = {#alignof godot_gdnative_terminate_options#}
  peek ptr = GodotGdnativeTerminateOptions
             <$> {#get godot_gdnative_terminate_options->in_editor#} ptr
  poke ptr a = {#set godot_gdnative_terminate_options->in_editor#} ptr (gdnativeTerminateOptionsInEditor a)

{#pointer *godot_gdnative_terminate_options as GodotGdnativeTerminateOptionsPtr -> GodotGdnativeTerminateOptions#}


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
type NativeCallCb = FunPtr (Ptr GodotVariant -> Ptr () -> GodotArray -> IO (Ptr GodotVariant))
-- funptrs
type GodotClassConstructor = FunPtr (IO GodotObject)

-- stuff that's not opaque (i.e. needs to be Storable'd) but i don't want to deal w/ rn

-- pluginscript
-- TODO: we don't support pluginscript right now
data GodotPluginscriptLanguageDesc
instance Storable GodotPluginscriptLanguageDesc where
  sizeOf _ = {#sizeof godot_pluginscript_language_desc#}
  alignment _ = {#alignof godot_pluginscript_language_desc#}
  peek = error "GodotPluginscriptLanguageDesc peek not implemented"
  poke = error "GodotPluginscriptLanguageDesc poke not implemented"

{#pointer *godot_pluginscript_language_desc as GodotPluginscriptLanguageDescPtr -> GodotPluginscriptLanguageDesc#}

-- nativescript
{#enum godot_property_hint as GodotPropertyHint {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_method_rpc_mode as GodotMethodRpcMode {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

newtype GodotPropertyUsageFlags = GodotPropertyUsageFlags { unGodotPropertyUsageFlags :: CInt }
  deriving newtype (Show, Eq, Ord, Bits, Storable)

pattern GodotPropertyUsageStorage :: GodotPropertyUsageFlags
pattern GodotPropertyUsageStorage = GodotPropertyUsageFlags 1

pattern GodotPropertyUsageEditor :: GodotPropertyUsageFlags
pattern GodotPropertyUsageEditor = GodotPropertyUsageFlags 2

pattern GodotPropertyUsageNetwork :: GodotPropertyUsageFlags
pattern GodotPropertyUsageNetwork = GodotPropertyUsageFlags 4

pattern GodotPropertyUsageEditorHelper :: GodotPropertyUsageFlags
pattern GodotPropertyUsageEditorHelper = GodotPropertyUsageFlags 8

pattern GodotPropertyUsageCheckable :: GodotPropertyUsageFlags
pattern GodotPropertyUsageCheckable = GodotPropertyUsageFlags 16

pattern GodotPropertyUsageChecked :: GodotPropertyUsageFlags
pattern GodotPropertyUsageChecked = GodotPropertyUsageFlags 32

pattern GodotPropertyUsageInternationalized :: GodotPropertyUsageFlags
pattern GodotPropertyUsageInternationalized = GodotPropertyUsageFlags 64

pattern GodotPropertyUsageGroup :: GodotPropertyUsageFlags
pattern GodotPropertyUsageGroup = GodotPropertyUsageFlags 128

pattern GodotPropertyUsageCategory :: GodotPropertyUsageFlags
pattern GodotPropertyUsageCategory = GodotPropertyUsageFlags 256

pattern GodotPropertyUsageStoreIfNonzero :: GodotPropertyUsageFlags
pattern GodotPropertyUsageStoreIfNonzero = GodotPropertyUsageFlags 512

pattern GodotPropertyUsageStoreIfNonone :: GodotPropertyUsageFlags
pattern GodotPropertyUsageStoreIfNonone = GodotPropertyUsageFlags 1024

pattern GodotPropertyUsageNoInstanceState :: GodotPropertyUsageFlags
pattern GodotPropertyUsageNoInstanceState = GodotPropertyUsageFlags 2048

pattern GodotPropertyUsageRestartIfChanged :: GodotPropertyUsageFlags
pattern GodotPropertyUsageRestartIfChanged = GodotPropertyUsageFlags 4096

pattern GodotPropertyUsageScriptVariable :: GodotPropertyUsageFlags
pattern GodotPropertyUsageScriptVariable = GodotPropertyUsageFlags 8192

pattern GodotPropertyUsageStoreIfNull :: GodotPropertyUsageFlags
pattern GodotPropertyUsageStoreIfNull = GodotPropertyUsageFlags 16384

pattern GodotPropertyUsageAnimateAsTrigger :: GodotPropertyUsageFlags
pattern GodotPropertyUsageAnimateAsTrigger = GodotPropertyUsageFlags 32768

pattern GodotPropertyUsageUpdateAllIfModified :: GodotPropertyUsageFlags
pattern GodotPropertyUsageUpdateAllIfModified = GodotPropertyUsageFlags 65536

godotPropertyUsageDefault :: GodotPropertyUsageFlags
godotPropertyUsageDefault = GodotPropertyUsageStorage .|. GodotPropertyUsageEditor .|. GodotPropertyUsageNetwork

godotPropertyUsageDefaultIntl :: GodotPropertyUsageFlags
godotPropertyUsageDefaultIntl = godotPropertyUsageDefault .|. GodotPropertyUsageInternationalized

godotPropertyUsageNoeditor :: GodotPropertyUsageFlags
godotPropertyUsageNoeditor = GodotPropertyUsageStorage .|. GodotPropertyUsageNetwork

type InstanceCreateFun = GodotObject -> Ptr () -> IO (Ptr ())
type InstanceDestroyFun = GodotObject -> Ptr ()  -> Ptr () -> IO ()
type InstanceFreeFun = Ptr () -> IO ()

foreign import ccall "wrapper" mkInstanceCreateFunPtr :: InstanceCreateFun -> IO (FunPtr InstanceCreateFun)
foreign import ccall "wrapper" mkInstanceDestroyFunPtr :: InstanceDestroyFun -> IO (FunPtr InstanceDestroyFun)
foreign import ccall "wrapper" mkInstanceFreeFunPtr :: InstanceFreeFun -> IO (FunPtr InstanceFreeFun)

data GodotInstanceCreateFunc = GodotInstanceCreateFunc
  { godotInstanceCreateFunc :: !(FunPtr InstanceCreateFun)
  , godotInstanceCreateMethodData :: !(Ptr ())
  , godotInstanceCreateFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)
instance Storable GodotInstanceCreateFunc where
  sizeOf _ = {#sizeof godot_instance_create_func#}
  alignment _ = {#alignof godot_instance_create_func#}
  peek ptr = GodotInstanceCreateFunc
             <$> {#get godot_instance_create_func->create_func#} ptr
             <*> {#get godot_instance_create_func->method_data#} ptr
             <*> {#get godot_instance_create_func->free_func#} ptr
  poke ptr GodotInstanceCreateFunc{..} = do
    {#set godot_instance_create_func->create_func#} ptr godotInstanceCreateFunc
    {#set godot_instance_create_func->method_data#} ptr godotInstanceCreateMethodData
    {#set godot_instance_create_func->free_func#} ptr godotInstanceCreateFreeFunc

{#pointer *godot_instance_create_func as GodotInstanceCreateFuncPtr -> GodotInstanceCreateFunc #}

data GodotInstanceDestroyFunc = GodotInstanceDestroyFunc
  { godotInstanceDestroyFunc :: !(FunPtr InstanceDestroyFun)
  , godotInstanceDestroyMethodData :: !(Ptr ())
  , godotInstanceDestroyFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)
instance Storable GodotInstanceDestroyFunc where
  sizeOf _ = {#sizeof godot_instance_destroy_func#}
  alignment _ = {#alignof godot_instance_destroy_func#}
  peek ptr = GodotInstanceDestroyFunc
             <$> {#get godot_instance_destroy_func->destroy_func#} ptr
             <*> {#get godot_instance_destroy_func->method_data#} ptr
             <*> {#get godot_instance_destroy_func->free_func#} ptr
  poke ptr GodotInstanceDestroyFunc{..} = do
    {#set godot_instance_destroy_func->destroy_func#} ptr godotInstanceDestroyFunc
    {#set godot_instance_destroy_func->method_data#} ptr godotInstanceDestroyMethodData
    {#set godot_instance_destroy_func->free_func#} ptr godotInstanceDestroyFreeFunc

{#pointer *godot_instance_destroy_func as GodotInstanceDestroyFuncPtr -> GodotInstanceDestroyFunc #}

type InstanceMethodFun = Ptr GodotVariant -> GodotObject -> Ptr () -> Ptr () -> CInt 
                      -> Ptr (Ptr GodotVariant) -> IO (Ptr GodotVariant)

foreign import ccall "wrapper" mkInstanceMethodFunPtr :: InstanceMethodFun -> IO (FunPtr InstanceMethodFun)

data GodotInstanceMethod = GodotInstanceMethod
  { godotInstanceMethod :: !(FunPtr InstanceMethodFun)
  , godotInstanceMethodData :: !(Ptr ())
  , godotInstanceMethodFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)
instance Storable GodotInstanceMethod where
    sizeOf _ = {#sizeof godot_instance_method#}
    alignment _ = {#alignof godot_instance_method#}
    peek ptr = GodotInstanceMethod
               <$> (castFunPtr <$> {#get godot_instance_method->method#} ptr)
               <*> {#get godot_instance_method->method_data#} ptr
               <*> {#get godot_instance_method->free_func#} ptr
    poke ptr GodotInstanceMethod{..} = do
      {#set godot_instance_method->method#} ptr (castFunPtr godotInstanceMethod)
      {#set godot_instance_method->method_data#} ptr godotInstanceMethodData
      {#set godot_instance_method->free_func#} ptr godotInstanceMethodFreeFunc

{#pointer *godot_instance_method as GodotInstanceMethodPtr -> GodotInstanceMethod #}

newtype GodotMethodAttributes = GodotMethodAttributes GodotMethodRpcMode
  deriving newtype (Show, Eq)

instance Storable GodotMethodAttributes where
  sizeOf _ = {#sizeof godot_method_attributes#}
  alignment _ = {#alignof godot_method_attributes#}
  peek ptr = (GodotMethodAttributes . toEnum . fromIntegral) <$> {#get godot_method_attributes->rpc_type#} ptr
  poke ptr (GodotMethodAttributes rpcType) = {#set godot_method_attributes->rpc_type#} ptr (fromIntegral $ fromEnum rpcType)

{#pointer *godot_method_attributes as GodotMethodAttributesPtr -> GodotMethodAttributes #}

type PropertyGetFun = Ptr GodotVariant -> GodotObject -> Ptr () -> Ptr () -> IO (Ptr GodotVariant)

foreign import ccall "wrapper" mkPropertyGetFunPtr :: PropertyGetFun -> IO (FunPtr PropertyGetFun)

data GodotPropertyGetFunc = GodotPropertyGetFunc
  { godotPropertyGetFunc :: !(FunPtr PropertyGetFun)
  , godotPropertyGetMethodData :: !(Ptr ())
  , godotPropertyGetFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)

instance Storable GodotPropertyGetFunc where
  sizeOf _ = {#sizeof godot_property_get_func#}
  alignment _ = {#alignof godot_property_get_func#}
  peek ptr = GodotPropertyGetFunc
             <$> (castFunPtr <$> {#get godot_property_get_func->get_func#} ptr)
             <*> {#get godot_property_get_func->method_data#} ptr
             <*> {#get godot_property_get_func->free_func#} ptr
  poke ptr GodotPropertyGetFunc{..} = do
    {#set godot_property_get_func->get_func#} ptr (castFunPtr godotPropertyGetFunc)
    {#set godot_property_get_func->method_data#} ptr godotPropertyGetMethodData
    {#set godot_property_get_func->free_func#} ptr godotPropertyGetFreeFunc

{#pointer *godot_property_get_func as GodotPropertyGetFuncPtr -> GodotPropertyGetFunc #}

type PropertySetFun = GodotObject -> Ptr () -> Ptr () -> Ptr GodotVariant -> IO ()

foreign import ccall "wrapper" mkPropertySetFunPtr :: PropertySetFun -> IO (FunPtr PropertySetFun)

data GodotPropertySetFunc = GodotPropertySetFunc
  { godotPropertySetFunc :: !(FunPtr PropertySetFun)
  , godotPropertySetMethodData :: !(Ptr ())
  , godotPropertySetFreeFunc :: !(FunPtr InstanceFreeFun)
  } deriving (Show, Eq)

instance Storable GodotPropertySetFunc where
    sizeOf _ = {#sizeof godot_property_set_func#}
    alignment _ = {#alignof godot_property_set_func#}
    peek ptr = GodotPropertySetFunc
               <$> {#get godot_property_set_func->set_func#} ptr
               <*> {#get godot_property_set_func->method_data#} ptr
               <*> {#get godot_property_set_func->free_func#} ptr
    poke ptr GodotPropertySetFunc{..} = do
      {#set godot_property_set_func->set_func#} ptr godotPropertySetFunc
      {#set godot_property_set_func->method_data#} ptr godotPropertySetMethodData
      {#set godot_property_set_func->free_func#} ptr godotPropertySetFreeFunc

{#pointer *godot_property_set_func as GodotPropertySetFuncPtr -> GodotPropertySetFunc #}

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

data GodotPropertyAttributes = GodotPropertyAttributes
  { godotPropertyAttributesRsetType :: !GodotMethodRpcMode
  , godotPropertyAttributesType :: !GodotInt
  , godotPropertyAttributesHint :: !GodotPropertyHint
  , godotPropertyAttributesHintString :: !GodotString
  , godotPropertyAttributesUsage :: !GodotPropertyUsageFlags
  , godotPropertyAttributesDefaultValue :: !GodotVariant
  }
instance Storable GodotPropertyAttributes where
  sizeOf _ = {#sizeof godot_property_attributes#}
  alignment _ = {#alignof godot_property_attributes#}
  peek ptr = do
    godotPropertyAttributesRsetType <- (toEnum . fromIntegral) <$> {#get godot_property_attributes->rset_type#} ptr
    godotPropertyAttributesType <- {#get godot_property_attributes->type#} ptr
    godotPropertyAttributesHint <- (toEnum . fromIntegral) <$> {#get godot_property_attributes->hint#} ptr 
    godotPropertyAttributesHintString <- getOpaqueFromStruct GodotString ptr {#offsetof godot_property_attributes->hint_string#}
    godotPropertyAttributesUsage <- GodotPropertyUsageFlags <$> {#get godot_property_attributes->usage#} ptr
    godotPropertyAttributesDefaultValue <- getOpaqueFromStruct GodotVariant ptr {#offsetof godot_property_attributes->default_value#}
    return GodotPropertyAttributes{..}
  poke ptr GodotPropertyAttributes{..} = do
    {#set godot_property_attributes->rset_type#} ptr (fromIntegral . fromEnum $ godotPropertyAttributesRsetType)
    {#set godot_property_attributes->type#} ptr godotPropertyAttributesType
    {#set godot_property_attributes->hint#} ptr (fromIntegral . fromEnum $ godotPropertyAttributesHint)
    setOpaqueFromStruct ptr godotPropertyAttributesHintString {#offsetof godot_property_attributes->hint_string#}
    {#set godot_property_attributes->usage#} ptr (unGodotPropertyUsageFlags godotPropertyAttributesUsage)
    setOpaqueFromStruct ptr godotPropertyAttributesDefaultValue {#offsetof godot_property_attributes->default_value#}

{#pointer *godot_property_attributes as GodotPropertyAttributesPtr -> GodotPropertyAttributes #}


data GodotSignalArgument = GodotSignalArgument
  { godotSignalArgumentName :: !GodotString
  , godotSignalArgumentType :: !GodotInt
  , godotSignalArgumentHint :: !GodotPropertyHint
  , godotSignalArgumentHintString :: !GodotString
  , godotSignalArgumentUsage :: !GodotPropertyUsageFlags
  , godotSignalArgumentDefaultValue :: !GodotVariant
  }
instance Storable GodotSignalArgument where
  sizeOf _ = {#sizeof godot_signal_argument#}
  alignment _ = {#alignof godot_signal_argument#}
  peek ptr = do
    godotSignalArgumentName <- getOpaqueFromStruct GodotString ptr {#offsetof godot_signal_argument->name#} 
    godotSignalArgumentType <- {#get godot_signal_argument->type#} ptr
    godotSignalArgumentHint <- (toEnum . fromIntegral) <$> {#get godot_signal_argument->hint#} ptr 
    godotSignalArgumentHintString <- getOpaqueFromStruct GodotString ptr {#offsetof godot_signal_argument->hint_string#}
    godotSignalArgumentUsage <- GodotPropertyUsageFlags <$> {#get godot_signal_argument->usage#} ptr
    godotSignalArgumentDefaultValue <- getOpaqueFromStruct GodotVariant ptr {#offsetof godot_signal_argument->default_value#}
    return GodotSignalArgument{..}
  poke ptr GodotSignalArgument{..} = do
    setOpaqueFromStruct ptr godotSignalArgumentName {#offsetof godot_signal_argument->name#}
    {#set godot_signal_argument->type#} ptr godotSignalArgumentType
    {#set godot_signal_argument->hint#} ptr (fromIntegral . fromEnum $ godotSignalArgumentHint)
    setOpaqueFromStruct ptr godotSignalArgumentHintString {#offsetof godot_signal_argument->hint_string#}
    {#set godot_signal_argument->usage#} ptr (unGodotPropertyUsageFlags godotSignalArgumentUsage)
    setOpaqueFromStruct ptr godotSignalArgumentDefaultValue {#offsetof godot_signal_argument->default_value#}
{#pointer *godot_signal_argument as GodotSignalArgumentPtr -> GodotSignalArgument#}

data GodotSignal = GodotSignal
  { godotSignalName :: !GodotString
  , godotSignalNumArgs :: !CInt
  , godotSignalArgs :: !(Ptr GodotSignalArgument)
  , godotSignalNumDefaultArgs :: !CInt
  , godotSignalDefaultArgs :: !(Ptr GodotVariant)
  }
instance Storable GodotSignal where
  sizeOf _ = {#sizeof godot_signal#}
  alignment _ = {#alignof godot_signal#}
  peek ptr = do
    godotSignalName <- getOpaqueFromStruct GodotString ptr {#offsetof godot_signal->name#} 
    godotSignalNumArgs <- {#get godot_signal->num_args#} ptr
    godotSignalArgs <- {#get godot_signal->args#} ptr
    godotSignalNumDefaultArgs <- {#get godot_signal->num_default_args#} ptr
    godotSignalDefaultArgs <- {#get godot_signal->default_args#} ptr
    return GodotSignal{..}
  poke ptr GodotSignal{..} = do
    setOpaqueFromStruct ptr godotSignalName {#offsetof godot_signal->name#}
    {#set godot_signal->num_args#} ptr godotSignalNumArgs
    {#set godot_signal->args#} ptr godotSignalArgs
    {#set godot_signal->num_default_args#} ptr godotSignalNumDefaultArgs
    {#set godot_signal->default_args#} ptr godotSignalDefaultArgs
    
{#pointer *godot_signal as GodotSignalPtr -> GodotSignal#}



data GodotInstanceBindingFunctions
instance Storable GodotInstanceBindingFunctions where
  sizeOf _ = {#sizeof godot_instance_binding_functions#}
  alignment _ = {#sizeof godot_instance_binding_functions#}
  peek = error "GodotInstanceBindingFunctions peek not implemented"
  poke = error "GodotInstanceBindingFunctions poke not implemented"
{#pointer *godot_instance_binding_functions as GodotInstanceBindingFunctionsPtr -> GodotInstanceBindingFunctions #}


data GodotMethodArg
instance Storable GodotMethodArg where
  sizeOf _ = {#sizeof godot_method_arg#}
  alignment _ = {#sizeof godot_method_arg#}
  peek = error "GodotMethodArg peek not implemented"
  poke = error "GodotMethodArg poke not implemented"
{#pointer *godot_method_arg as GodotMethodArgPtr -> GodotMethodArg #}


--net

data GodotNetStreamPeer
instance Storable GodotNetStreamPeer where
  sizeOf _ = {#sizeof godot_net_stream_peer#}
  alignment _ = {#sizeof godot_net_stream_peer#}
  peek = error "GodotNetStreamPeer peek not implemented"
  poke = error "GodotNetStreamPeer poke not implemented"
{#pointer *godot_net_stream_peer as GodotNetStreamPeerPtr -> GodotNetStreamPeer #}

data GodotNetPacketPeer
instance Storable GodotNetPacketPeer where
  sizeOf _ = {#sizeof godot_net_packet_peer#}
  alignment _ = {#sizeof godot_net_packet_peer#}
  peek = error "GodotNetPacketPeer peek not implemented"
  poke = error "GodotNetPacketPeer poke not implemented"
{#pointer *godot_net_packet_peer as GodotNetPacketPeerPtr -> GodotNetPacketPeer #}

data GodotNetMultiplayerPeer
instance Storable GodotNetMultiplayerPeer where
  sizeOf _ = {#sizeof godot_net_multiplayer_peer#}
  alignment _ = {#sizeof godot_net_multiplayer_peer#}
  peek = error "GodotNetMultiplayerPeer peek not implemented"
  poke = error "GodotNetMultiplayerPeer poke not implemented"
{#pointer *godot_net_multiplayer_peer as GodotNetMultiplayerPeerPtr -> GodotNetMultiplayerPeer #}


--videodecoder

data GodotVideodecoderInterfaceGdnative
instance Storable GodotVideodecoderInterfaceGdnative where
  sizeOf _ = {#sizeof godot_videodecoder_interface_gdnative#}
  alignment _ = {#sizeof godot_videodecoder_interface_gdnative#}
  peek = error "GodotVideodecoderInterfaceGdnative peek not implemented"
  poke = error "GodotVideodecoderInterfaceGdnative poke not implemented"
{#pointer *godot_videodecoder_interface_gdnative as GodotVideodecoderInterfaceGdnativePtr -> GodotVideodecoderInterfaceGdnative #}


--arvr

data GodotArvrInterfaceGdnative
instance Storable GodotArvrInterfaceGdnative where
  sizeOf _ = {#sizeof godot_arvr_interface_gdnative#}
  alignment _ = {#sizeof godot_arvr_interface_gdnative#}
  peek = error "GodotArvrInterfaceGdnative peek not implemented"
  poke = error "GodotArvrInterfaceGdnative poke not implemented"
{#pointer *godot_arvr_interface_gdnative as GodotArvrInterfaceGdnativePtr -> GodotArvrInterfaceGdnative #}




godotGdnativeCoreApiStructRef :: IORef GodotGdnativeCoreApiStruct
godotGdnativeCoreApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeCoreApiStructRef too early"
{-# NOINLINE godotGdnativeCoreApiStructRef #-}

godotGdnativeCore11ApiStructRef :: IORef GodotGdnativeCore11ApiStruct
godotGdnativeCore11ApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeCore11ApiStructRef too early"
{-# NOINLINE godotGdnativeCore11ApiStructRef #-}

godotGdnativeExtNativescriptApiStructRef :: IORef GodotGdnativeExtNativescriptApiStruct
godotGdnativeExtNativescriptApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeExtNativescriptApiStructRef too early"
{-# NOINLINE godotGdnativeExtNativescriptApiStructRef #-}

godotGdnativeExtNativescript11ApiStructRef :: IORef GodotGdnativeExtNativescript11ApiStruct
godotGdnativeExtNativescript11ApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeExtNativescript11ApiStructRef too early"
{-# NOINLINE godotGdnativeExtNativescript11ApiStructRef #-}

godotGdnativeExtPluginscriptApiStructRef :: IORef GodotGdnativeExtPluginscriptApiStruct
godotGdnativeExtPluginscriptApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeExtPluginscriptApiStructRef too early"
{-# NOINLINE godotGdnativeExtPluginscriptApiStructRef #-}

godotGdnativeExtArvrApiStructRef :: IORef GodotGdnativeExtArvrApiStruct
godotGdnativeExtArvrApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeExtArvrApiStructRef too early"
{-# NOINLINE godotGdnativeExtArvrApiStructRef #-}

godotGdnativeExtVideodecoderApiStructRef :: IORef GodotGdnativeExtVideodecoderApiStruct
godotGdnativeExtVideodecoderApiStructRef = unsafePerformIO $ newIORef $
  error "attempted to get godotGdnativeExtVideodecoderApiStructRef too early"
{-# NOINLINE godotGdnativeExtVideodecoderApiStructRef #-}

godotGdnativeExtNetApiStructRef :: IORef GodotGdnativeExtNetApiStruct
godotGdnativeExtNetApiStructRef = unsafePerformIO $ newIORef $
  error "attempted to get godotGdnativeExtNetApiStructRef too early"
{-# NOINLINE godotGdnativeExtNetApiStructRef #-}


initApiStructs :: GodotGdnativeInitOptions -> IO ()
initApiStructs opts = do
  let coreApi = gdnativeInitOptionsApiStruct opts
  writeIORef godotGdnativeCoreApiStructRef coreApi
  findCoreExt (coerce coreApi)

  numExt <- {#get godot_gdnative_core_api_struct->num_extensions #} coreApi
  extsPtr <- {#get godot_gdnative_core_api_struct->extensions #} coreApi
  exts <- peekArray (fromIntegral numExt) (castPtr extsPtr :: Ptr GodotGdnativeApiStruct)
  forM_ exts $ \ext -> do
    ty <- {#get godot_gdnative_api_struct->type #} ext
    -- HACK
    case ty of
      1 -> do -- nativescript
        writeIORef godotGdnativeExtNativescriptApiStructRef (coerce ext)
        findNativescriptExt ext
      2 -> do -- pluginscript
        writeIORef godotGdnativeExtPluginscriptApiStructRef (coerce ext)
      3 -> return () -- android
      4 -> do -- arvr
        writeIORef godotGdnativeExtArvrApiStructRef (coerce ext)
      5 -> do -- videodecoder
        writeIORef godotGdnativeExtVideodecoderApiStructRef (coerce ext)
      6 -> do -- net
        writeIORef godotGdnativeExtNetApiStructRef (coerce ext)
      _ -> error $ "Unknown API struct type " ++ show ty
  where
    findCoreExt = findExt GodotGdnativeCore11ApiStruct godotGdnativeCore11ApiStructRef
    findNativescriptExt = findExt GodotGdnativeExtNativescript11ApiStruct godotGdnativeExtNativescript11ApiStructRef
    findExt con ref ext = do
      next <- {#get godot_gdnative_api_struct->next #} ext
      when (next /= coerce nullPtr) $ do

        major <- {#get godot_gdnative_api_struct->version.major #} next
        minor <- {#get godot_gdnative_api_struct->version.minor #} next
        if major == 1 && minor == 1 then writeIORef ref (con $ coerce next)
        else findExt con ref next


