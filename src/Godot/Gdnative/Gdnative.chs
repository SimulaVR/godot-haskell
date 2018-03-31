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

{#pointer *godot_aabb as GodotAabb newtype #}
deriving newtype instance Eq GodotAabb
deriving newtype instance Storable GodotAabb

{#pointer *godot_array as GodotArray newtype #}
deriving newtype instance Eq GodotArray
deriving newtype instance Storable GodotArray

{#pointer *godot_basis as GodotBasis newtype #}
deriving newtype instance Eq GodotBasis
deriving newtype instance Storable GodotBasis

{#pointer *godot_char_string as GodotCharString newtype #}
deriving newtype instance Eq GodotCharString
deriving newtype instance Storable GodotCharString

{#pointer *godot_color as GodotColor newtype #}
deriving newtype instance Eq GodotColor
deriving newtype instance Storable GodotColor

{#pointer *godot_dictionary as GodotDictionary newtype #}
deriving newtype instance Eq GodotDictionary
deriving newtype instance Storable GodotDictionary

{#pointer *godot_method_bind as GodotMethodBind newtype #}
deriving newtype instance Eq GodotMethodBind
deriving newtype instance Storable GodotMethodBind

{#pointer *godot_node_path as GodotNodePath newtype #}
deriving newtype instance Eq GodotNodePath
deriving newtype instance Storable GodotNodePath

{#pointer *godot_plane as GodotPlane newtype #}
deriving newtype instance Eq GodotPlane
deriving newtype instance Storable GodotPlane

{#pointer *godot_pool_array_read_access as GodotPoolArrayReadAccess newtype #}
deriving newtype instance Eq GodotPoolArrayReadAccess
deriving newtype instance Storable GodotPoolArrayReadAccess

{#pointer *godot_pool_array_write_access as GodotPoolArrayWriteAccess newtype #}
deriving newtype instance Eq GodotPoolArrayWriteAccess
deriving newtype instance Storable GodotPoolArrayWriteAccess

{#pointer *godot_pool_byte_array as GodotPoolByteArray newtype #}
deriving newtype instance Eq GodotPoolByteArray
deriving newtype instance Storable GodotPoolByteArray

{#pointer *godot_pool_color_array as GodotPoolColorArray newtype #}
deriving newtype instance Eq GodotPoolColorArray
deriving newtype instance Storable GodotPoolColorArray

{#pointer *godot_pool_int_array as GodotPoolIntArray newtype #}
deriving newtype instance Eq GodotPoolIntArray
deriving newtype instance Storable GodotPoolIntArray

{#pointer *godot_pool_real_array as GodotPoolRealArray newtype #}
deriving newtype instance Eq GodotPoolRealArray
deriving newtype instance Storable GodotPoolRealArray

{#pointer *godot_pool_string_array as GodotPoolStringArray newtype #}
deriving newtype instance Eq GodotPoolStringArray
deriving newtype instance Storable GodotPoolStringArray

{#pointer *godot_pool_vector2_array as GodotPoolVector2Array newtype #}
deriving newtype instance Eq GodotPoolVector2Array
deriving newtype instance Storable GodotPoolVector2Array

{#pointer *godot_pool_vector3_array as GodotPoolVector3Array newtype #}
deriving newtype instance Eq GodotPoolVector3Array
deriving newtype instance Storable GodotPoolVector3Array

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


{#pointer *godot_quat as GodotQuat newtype #}
deriving newtype instance Eq GodotQuat
deriving newtype instance Storable GodotQuat

{#pointer *godot_rect2 as GodotRect2 newtype #}
deriving newtype instance Eq GodotRect2
deriving newtype instance Storable GodotRect2

{#pointer *godot_rid as GodotRid newtype #}
deriving newtype instance Eq GodotRid
deriving newtype instance Storable GodotRid

{#pointer *godot_string as GodotString newtype #}
deriving newtype instance Eq GodotString
deriving newtype instance Storable GodotString

{#pointer *godot_string_name as GodotStringName newtype #}
deriving newtype instance Eq GodotStringName
deriving newtype instance Storable GodotStringName

{#pointer *godot_transform as GodotTransform newtype #}
deriving newtype instance Eq GodotTransform
deriving newtype instance Storable GodotTransform

{#pointer *godot_transform2d as GodotTransform2d newtype #}
deriving newtype instance Eq GodotTransform2d
deriving newtype instance Storable GodotTransform2d

{#pointer *godot_variant as GodotVariant newtype #}
deriving newtype instance Eq GodotVariant
deriving newtype instance Storable GodotVariant

{#pointer *godot_vector2 as GodotVector2 newtype #}
deriving newtype instance Eq GodotVector2
deriving newtype instance Storable GodotVector2

{#pointer *godot_vector3 as GodotVector3 newtype #}
deriving newtype instance Eq GodotVector3
deriving newtype instance Storable GodotVector3

{#pointer *godot_object as GodotObject newtype #}
deriving newtype instance Eq GodotObject
deriving newtype instance Storable GodotObject

class OpaqueStorable a where
  opaqueSizeOf :: Int
  opaquePtr :: Ptr a -> a
  default opaquePtr :: Coercible (Ptr a) a => Ptr a -> a
  opaquePtr = coerce

instance OpaqueStorable GodotColor where
  opaqueSizeOf = {#const GODOT_COLOR_SIZE#}

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
             <*> {#get godot_gdnative_init_options->active_library_path#} ptr
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
{#pointer *godot_pluginscript_language_desc as GodotPluginscriptLanguageDesc newtype#}

-- nativescript
{#pointer *godot_instance_create_func as GodotInstanceCreateFunc newtype#}
{#pointer *godot_instance_destroy_func as GodotInstanceDestroyFunc newtype#}
{#pointer *godot_instance_method as GodotInstanceMethod newtype#}
{#pointer *godot_method_attributes as GodotMethodAttributes newtype#}
{#pointer *godot_property_get_func as GodotPropertyGetFunc newtype#}
{#pointer *godot_property_set_func as GodotPropertySetFunc newtype#}
{#pointer *godot_property_attributes as GodotPropertyAttributes newtype#}
{#pointer *godot_signal as GodotSignal newtype#}

--arvr
{#pointer *godot_arvr_interface_gdnative as GodotArvrInterfaceGdnative newtype#}

