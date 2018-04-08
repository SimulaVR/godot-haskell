{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE UnboxedTuples, MagicHash #-}
module Godot.Gdnative.Gdnative where

import Data.Coerce
import Data.Void
import Foreign
import Foreign.C

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


type GodotPoolByteArrayReadAccess = GodotPoolByteArray
type GodotPoolByteArrayWriteAccess = GodotPoolByteArray
type GodotPoolColorArrayReadAccess = GodotPoolColorArray
type GodotPoolColorArrayWriteAccess = GodotPoolColorArray
type GodotPoolIntArrayReadAccess = GodotPoolIntArray
type GodotPoolIntArrayWriteAccess = GodotPoolIntArray
type GodotPoolRealArrayReadAccess = GodotPoolRealArray
type GodotPoolRealArrayWriteAccess = GodotPoolRealArray
type GodotPoolStringArrayReadAccess = GodotPoolStringArray
type GodotPoolStringArrayWriteAccess = GodotPoolStringArray
type GodotPoolVector2ArrayReadAccess = GodotPoolVector2Array
type GodotPoolVector2ArrayWriteAccess = GodotPoolVector2Array
type GodotPoolVector3ArrayReadAccess = GodotPoolVector3Array
type GodotPoolVector3ArrayWriteAccess = GodotPoolVector3Array

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
  { variantCallErrorError :: GodotVariantCallErrorError
  , variantCallErrorArgument :: CInt
  , variantCallErrorExpected :: GodotVariantType
  } deriving (Show, Eq, Ord)

{#pointer *godot_variant_call_error as GodotVariantCallErrorPtr -> GodotVariantCallError#}

instance Storable GodotVariantCallError where
  sizeOf _ = {#sizeof godot_variant_call_error#}
  alignment _ = {#alignof godot_variant_call_error#}
  peek ptr = GodotVariantCallError
             <$> ((toEnum . fromIntegral) <$> {#get godot_variant_call_error->error #} ptr)
             <*> {#get godot_variant_call_error->argument #} ptr
             <*> ((toEnum . fromIntegral) <$> {#get godot_variant_call_error->expected #} ptr)
  poke ptr a = do
    {#set godot_variant_call_error->error #} ptr (fromIntegral . fromEnum $ variantCallErrorError a)
    {#set godot_variant_call_error->argument #} ptr (variantCallErrorArgument a)
    {#set godot_variant_call_error->expected #} ptr (fromIntegral . fromEnum $ variantCallErrorExpected a)

{#pointer *godot_gdnative_core_api_struct as GodotGdnativeCoreApiStruct newtype#}
deriving newtype instance Eq GodotGdnativeCoreApiStruct
deriving newtype instance Storable GodotGdnativeCoreApiStruct

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

type ReportVersionMismatchFunc = GodotObject -> CString -> Word64 -> Word64 -> IO ()
type ReportLoadingErrorFunc = GodotObject -> CString -> IO ()


{#pointer *godot_object as GodotObject newtype #}
deriving newtype instance Eq GodotObject
deriving newtype instance Storable GodotObject


data GodotGdnativeInitOptions = GodotGdnativeInitOptions
  { gdnativeInitOptionsInEditor :: Bool
  , gdnativeInitOptionsCoreApiHash :: Word64
  , gdnativeInitOptionsEditorApiHash :: Word64
  , gdnativeInitOptionsNoApiHash :: Word64
  , gdnativeInitOptionsReportVersionMismatch :: ReportVersionMismatchFunc
  , gdnativeInitOptionsReportLoadingError :: ReportLoadingErrorFunc
  , gdnativeInitOptionsGdNativeLibrary :: GodotObject
  , gdnativeInitOptionsApiStruct :: GodotGdnativeCoreApiStruct
  , gdnativeInitOptionsActiveLibraryPath :: GodotString
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
  { _godotGdnativeTerminateOptionsInEditor :: Bool
  } deriving (Show, Eq, Ord)

instance Storable GodotGdnativeTerminateOptions where
  sizeOf _ = {#sizeof godot_gdnative_terminate_options#}
  alignment _ = {#alignof godot_gdnative_terminate_options#}
  peek ptr = GodotGdnativeTerminateOptions
             <$> {#get godot_gdnative_terminate_options->in_editor#} ptr
  poke ptr a = {#set godot_gdnative_terminate_options->in_editor#} ptr (_godotGdnativeTerminateOptionsInEditor a)

{#pointer *godot_gdnative_terminate_options as GodotGdnativeTerminateOptionsPtr -> GodotGdnativeTerminateOptions#}


-- not the real type but we need something
type NativeCallCb = FunPtr Void
-- funptrs
type GodotClassConstructor = FunPtr (IO GodotObject)

-- stuff that's not opaque (i.e. needs to be Storable'd) but i don't want to deal w/ rn

-- pluginscript
data GodotPluginscriptLanguageDesc
instance Storable GodotPluginscriptLanguageDesc
{#pointer *godot_pluginscript_language_desc as GodotPluginscriptLanguageDescPtr -> GodotPluginscriptLanguageDesc#}

-- nativescript
data GodotInstanceCreateFunc
instance Storable GodotInstanceCreateFunc
{#pointer *godot_instance_create_func as GodotInstanceCreateFuncPtr -> GodotInstanceCreateFunc #}

data GodotInstanceDestroyFunc
instance Storable GodotInstanceDestroyFunc
{#pointer *godot_instance_destroy_func as GodotInstanceDestroyFuncPtr -> GodotInstanceDestroyFunc #}

data GodotInstanceMethod
instance Storable GodotInstanceMethod
{#pointer *godot_instance_method as GodotInstanceMethodPtr -> GodotInstanceMethod #}

data GodotMethodAttributes
instance Storable GodotMethodAttributes
{#pointer *godot_method_attributes as GodotMethodAttributesPtr -> GodotMethodAttributes #}

data GodotPropertyGetFunc
instance Storable GodotPropertyGetFunc
{#pointer *godot_property_get_func as GodotPropertyGetFuncPtr -> GodotPropertyGetFunc #}

data GodotPropertySetFunc
instance Storable GodotPropertySetFunc
{#pointer *godot_property_set_func as GodotPropertySetFuncPtr -> GodotPropertySetFunc #}

data GodotPropertyAttributes
instance Storable GodotPropertyAttributes
{#pointer *godot_property_attributes as GodotPropertyAttributesPtr -> GodotPropertyAttributes #}

data GodotSignal
instance Storable GodotSignal
{#pointer *godot_signal as GodotSignalPtr -> GodotSignal#}

--arvr

data GodotArvrInterfaceGdnative
instance Storable GodotArvrInterfaceGdnative
{#pointer *godot_arvr_interface_gdnative as GodotArvrInterfaceGdnativePtr -> GodotArvrInterfaceGdnative #}
