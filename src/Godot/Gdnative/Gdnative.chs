{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
module Godot.Gdnative.Gdnative where

import Data.Coerce
import Foreign
import Foreign.C

#include <gdnative/gdnative.h>

{#enum godot_error as GodotError {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_variant_type as GodotVariantType {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_variant_call_error_error as GodotVariantCallErrorError {underscoreToCase}
  deriving (Show, Eq, Ord, Bounded) #}

{#enum godot_vector3_axis as GodotVector3Axis {underscoreToCase}
 deriving (Show, Eq, Ord, Bounded)#}

  
{#typedef godot_bool Bool #}
{#typedef godot_int CInt #}
{#typedef godot_real CFloat#}
{#typedef godot_char_type CWchar#}

{#pointer *godot_aabb as GodotAabb newtype #}
deriving newtype instance Eq GodotAabb
deriving newtype instance Storable GodotAabb

{#pointer *godot_array as GodotArray newtype #}
deriving newtype instance Eq GodotArray
deriving newtype instance Storable GodotArray

{#pointer *godot_basis as GodotBasis newtype #}
deriving newtype instance Eq GodotBasis
deriving newtype instance Storable GodotBasis

{#pointer *godot_char_string as GodotChar_string newtype #}
deriving newtype instance Eq GodotChar_string
deriving newtype instance Storable GodotChar_string

{#pointer *godot_color as GodotColor newtype #}
deriving newtype instance Eq GodotColor
deriving newtype instance Storable GodotColor

{#pointer *godot_dictionary as GodotDictionary newtype #}
deriving newtype instance Eq GodotDictionary
deriving newtype instance Storable GodotDictionary

{#pointer *godot_method_bind as GodotMethod_bind newtype #}
deriving newtype instance Eq GodotMethod_bind
deriving newtype instance Storable GodotMethod_bind

{#pointer *godot_node_path as GodotNode_path newtype #}
deriving newtype instance Eq GodotNode_path
deriving newtype instance Storable GodotNode_path

{#pointer *godot_plane as GodotPlane newtype #}
deriving newtype instance Eq GodotPlane
deriving newtype instance Storable GodotPlane

{#pointer *godot_pool_array_read_access as GodotPool_array_read_access newtype #}
deriving newtype instance Eq GodotPool_array_read_access
deriving newtype instance Storable GodotPool_array_read_access

{#pointer *godot_pool_array_write_access as GodotPool_array_write_access newtype #}
deriving newtype instance Eq GodotPool_array_write_access
deriving newtype instance Storable GodotPool_array_write_access

{#pointer *godot_pool_byte_array as GodotPool_byte_array newtype #}
deriving newtype instance Eq GodotPool_byte_array
deriving newtype instance Storable GodotPool_byte_array

{#pointer *godot_pool_color_array as GodotPool_color_array newtype #}
deriving newtype instance Eq GodotPool_color_array
deriving newtype instance Storable GodotPool_color_array

{#pointer *godot_pool_int_array as GodotPool_int_array newtype #}
deriving newtype instance Eq GodotPool_int_array
deriving newtype instance Storable GodotPool_int_array

{#pointer *godot_pool_real_array as GodotPool_real_array newtype #}
deriving newtype instance Eq GodotPool_real_array
deriving newtype instance Storable GodotPool_real_array

{#pointer *godot_pool_string_array as GodotPool_string_array newtype #}
deriving newtype instance Eq GodotPool_string_array
deriving newtype instance Storable GodotPool_string_array

{#pointer *godot_pool_vector2_array as GodotPool_vector2_array newtype #}
deriving newtype instance Eq GodotPool_vector2_array
deriving newtype instance Storable GodotPool_vector2_array

{#pointer *godot_pool_vector3_array as GodotPool_vector3_array newtype #}
deriving newtype instance Eq GodotPool_vector3_array
deriving newtype instance Storable GodotPool_vector3_array

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

{#pointer *godot_string_name as GodotString_name newtype #}
deriving newtype instance Eq GodotString_name
deriving newtype instance Storable GodotString_name

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

allocaOpaque :: forall a b. OpaqueStorable a => (a -> IO b) -> IO b
allocaOpaque f = allocaBytes (opaqueSizeOf @a) (f . opaquePtr)

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

