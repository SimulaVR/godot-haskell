{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SpatialMaterial
       (Godot.Core.SpatialMaterial._DIFFUSE_BURLEY,
        Godot.Core.SpatialMaterial._DEPTH_DRAW_ALWAYS,
        Godot.Core.SpatialMaterial._FLAG_DISABLE_DEPTH_TEST,
        Godot.Core.SpatialMaterial._TEXTURE_MAX,
        Godot.Core.SpatialMaterial._DISTANCE_FADE_PIXEL_DITHER,
        Godot.Core.SpatialMaterial._FLAG_DONT_RECEIVE_SHADOWS,
        Godot.Core.SpatialMaterial._TEXTURE_METALLIC,
        Godot.Core.SpatialMaterial._FEATURE_MAX,
        Godot.Core.SpatialMaterial._TEXTURE_DETAIL_ALBEDO,
        Godot.Core.SpatialMaterial._TEXTURE_CHANNEL_RED,
        Godot.Core.SpatialMaterial._SPECULAR_TOON,
        Godot.Core.SpatialMaterial._FEATURE_EMISSION,
        Godot.Core.SpatialMaterial._TEXTURE_CHANNEL_BLUE,
        Godot.Core.SpatialMaterial._TEXTURE_AMBIENT_OCCLUSION,
        Godot.Core.SpatialMaterial._TEXTURE_DETAIL_MASK,
        Godot.Core.SpatialMaterial._FEATURE_DETAIL,
        Godot.Core.SpatialMaterial._SPECULAR_SCHLICK_GGX,
        Godot.Core.SpatialMaterial._FEATURE_SUBSURACE_SCATTERING,
        Godot.Core.SpatialMaterial._FEATURE_DEPTH_MAPPING,
        Godot.Core.SpatialMaterial._TEXTURE_REFRACTION,
        Godot.Core.SpatialMaterial._FEATURE_TRANSPARENT,
        Godot.Core.SpatialMaterial._FEATURE_TRANSMISSION,
        Godot.Core.SpatialMaterial._FLAG_TRIPLANAR_USE_WORLD,
        Godot.Core.SpatialMaterial._DEPTH_DRAW_ALPHA_OPAQUE_PREPASS,
        Godot.Core.SpatialMaterial._FLAG_USE_ALPHA_SCISSOR,
        Godot.Core.SpatialMaterial._DIFFUSE_LAMBERT,
        Godot.Core.SpatialMaterial._DETAIL_UV_2,
        Godot.Core.SpatialMaterial._DIFFUSE_LAMBERT_WRAP,
        Godot.Core.SpatialMaterial._BLEND_MODE_ADD,
        Godot.Core.SpatialMaterial._BILLBOARD_ENABLED,
        Godot.Core.SpatialMaterial._TEXTURE_NORMAL,
        Godot.Core.SpatialMaterial._FEATURE_NORMAL_MAPPING,
        Godot.Core.SpatialMaterial._TEXTURE_TRANSMISSION,
        Godot.Core.SpatialMaterial._FLAG_ALBEDO_FROM_VERTEX_COLOR,
        Godot.Core.SpatialMaterial._FEATURE_REFRACTION,
        Godot.Core.SpatialMaterial._BLEND_MODE_MIX,
        Godot.Core.SpatialMaterial._BILLBOARD_FIXED_Y,
        Godot.Core.SpatialMaterial._TEXTURE_FLOWMAP,
        Godot.Core.SpatialMaterial._TEXTURE_RIM,
        Godot.Core.SpatialMaterial._FEATURE_AMBIENT_OCCLUSION,
        Godot.Core.SpatialMaterial._DISTANCE_FADE_OBJECT_DITHER,
        Godot.Core.SpatialMaterial._FLAG_BILLBOARD_KEEP_SCALE,
        Godot.Core.SpatialMaterial._DEPTH_DRAW_OPAQUE_ONLY,
        Godot.Core.SpatialMaterial._FLAG_USE_POINT_SIZE,
        Godot.Core.SpatialMaterial._CULL_DISABLED,
        Godot.Core.SpatialMaterial._FEATURE_ANISOTROPY,
        Godot.Core.SpatialMaterial._TEXTURE_ROUGHNESS,
        Godot.Core.SpatialMaterial._EMISSION_OP_ADD,
        Godot.Core.SpatialMaterial._FLAG_MAX,
        Godot.Core.SpatialMaterial._FLAG_FIXED_SIZE,
        Godot.Core.SpatialMaterial._FLAG_UNSHADED,
        Godot.Core.SpatialMaterial._FLAG_ENSURE_CORRECT_NORMALS,
        Godot.Core.SpatialMaterial._TEXTURE_CHANNEL_GREEN,
        Godot.Core.SpatialMaterial._SPECULAR_BLINN,
        Godot.Core.SpatialMaterial._CULL_BACK,
        Godot.Core.SpatialMaterial._EMISSION_OP_MULTIPLY,
        Godot.Core.SpatialMaterial._FLAG_SRGB_VERTEX_COLOR,
        Godot.Core.SpatialMaterial._FLAG_EMISSION_ON_UV2,
        Godot.Core.SpatialMaterial._FLAG_AO_ON_UV2,
        Godot.Core.SpatialMaterial._TEXTURE_DEPTH,
        Godot.Core.SpatialMaterial._DIFFUSE_OREN_NAYAR,
        Godot.Core.SpatialMaterial._FLAG_UV1_USE_TRIPLANAR,
        Godot.Core.SpatialMaterial._DEPTH_DRAW_DISABLED,
        Godot.Core.SpatialMaterial._TEXTURE_DETAIL_NORMAL,
        Godot.Core.SpatialMaterial._FEATURE_RIM,
        Godot.Core.SpatialMaterial._DISTANCE_FADE_DISABLED,
        Godot.Core.SpatialMaterial._SPECULAR_DISABLED,
        Godot.Core.SpatialMaterial._CULL_FRONT,
        Godot.Core.SpatialMaterial._TEXTURE_SUBSURFACE_SCATTERING,
        Godot.Core.SpatialMaterial._TEXTURE_CLEARCOAT,
        Godot.Core.SpatialMaterial._TEXTURE_CHANNEL_ALPHA,
        Godot.Core.SpatialMaterial._FEATURE_CLEARCOAT,
        Godot.Core.SpatialMaterial._FLAG_ALBEDO_TEXTURE_FORCE_SRGB,
        Godot.Core.SpatialMaterial._DIFFUSE_TOON,
        Godot.Core.SpatialMaterial._DETAIL_UV_1,
        Godot.Core.SpatialMaterial._FLAG_USE_SHADOW_TO_OPACITY,
        Godot.Core.SpatialMaterial._BILLBOARD_DISABLED,
        Godot.Core.SpatialMaterial._BLEND_MODE_MUL,
        Godot.Core.SpatialMaterial._FLAG_USE_VERTEX_LIGHTING,
        Godot.Core.SpatialMaterial._FLAG_UV2_USE_TRIPLANAR,
        Godot.Core.SpatialMaterial._BLEND_MODE_SUB,
        Godot.Core.SpatialMaterial._SPECULAR_PHONG,
        Godot.Core.SpatialMaterial._DISTANCE_FADE_PIXEL_ALPHA,
        Godot.Core.SpatialMaterial._FLAG_DISABLE_AMBIENT_LIGHT,
        Godot.Core.SpatialMaterial._BILLBOARD_PARTICLES,
        Godot.Core.SpatialMaterial._TEXTURE_EMISSION,
        Godot.Core.SpatialMaterial._TEXTURE_CHANNEL_GRAYSCALE,
        Godot.Core.SpatialMaterial._TEXTURE_ALBEDO,
        Godot.Core.SpatialMaterial.get_albedo,
        Godot.Core.SpatialMaterial.get_alpha_scissor_threshold,
        Godot.Core.SpatialMaterial.get_anisotropy,
        Godot.Core.SpatialMaterial.get_ao_light_affect,
        Godot.Core.SpatialMaterial.get_ao_texture_channel,
        Godot.Core.SpatialMaterial.get_billboard_mode,
        Godot.Core.SpatialMaterial.get_blend_mode,
        Godot.Core.SpatialMaterial.get_clearcoat,
        Godot.Core.SpatialMaterial.get_clearcoat_gloss,
        Godot.Core.SpatialMaterial.get_cull_mode,
        Godot.Core.SpatialMaterial.get_depth_deep_parallax_flip_binormal,
        Godot.Core.SpatialMaterial.get_depth_deep_parallax_flip_tangent,
        Godot.Core.SpatialMaterial.get_depth_deep_parallax_max_layers,
        Godot.Core.SpatialMaterial.get_depth_deep_parallax_min_layers,
        Godot.Core.SpatialMaterial.get_depth_draw_mode,
        Godot.Core.SpatialMaterial.get_depth_scale,
        Godot.Core.SpatialMaterial.get_detail_blend_mode,
        Godot.Core.SpatialMaterial.get_detail_uv,
        Godot.Core.SpatialMaterial.get_diffuse_mode,
        Godot.Core.SpatialMaterial.get_distance_fade,
        Godot.Core.SpatialMaterial.get_distance_fade_max_distance,
        Godot.Core.SpatialMaterial.get_distance_fade_min_distance,
        Godot.Core.SpatialMaterial.get_emission,
        Godot.Core.SpatialMaterial.get_emission_energy,
        Godot.Core.SpatialMaterial.get_emission_operator,
        Godot.Core.SpatialMaterial.get_feature,
        Godot.Core.SpatialMaterial.get_flag,
        Godot.Core.SpatialMaterial.get_grow,
        Godot.Core.SpatialMaterial.get_line_width,
        Godot.Core.SpatialMaterial.get_metallic,
        Godot.Core.SpatialMaterial.get_metallic_texture_channel,
        Godot.Core.SpatialMaterial.get_normal_scale,
        Godot.Core.SpatialMaterial.get_particles_anim_h_frames,
        Godot.Core.SpatialMaterial.get_particles_anim_loop,
        Godot.Core.SpatialMaterial.get_particles_anim_v_frames,
        Godot.Core.SpatialMaterial.get_point_size,
        Godot.Core.SpatialMaterial.get_proximity_fade_distance,
        Godot.Core.SpatialMaterial.get_refraction,
        Godot.Core.SpatialMaterial.get_refraction_texture_channel,
        Godot.Core.SpatialMaterial.get_rim,
        Godot.Core.SpatialMaterial.get_rim_tint,
        Godot.Core.SpatialMaterial.get_roughness,
        Godot.Core.SpatialMaterial.get_roughness_texture_channel,
        Godot.Core.SpatialMaterial.get_specular,
        Godot.Core.SpatialMaterial.get_specular_mode,
        Godot.Core.SpatialMaterial.get_subsurface_scattering_strength,
        Godot.Core.SpatialMaterial.get_texture,
        Godot.Core.SpatialMaterial.get_transmission,
        Godot.Core.SpatialMaterial.get_uv1_offset,
        Godot.Core.SpatialMaterial.get_uv1_scale,
        Godot.Core.SpatialMaterial.get_uv1_triplanar_blend_sharpness,
        Godot.Core.SpatialMaterial.get_uv2_offset,
        Godot.Core.SpatialMaterial.get_uv2_scale,
        Godot.Core.SpatialMaterial.get_uv2_triplanar_blend_sharpness,
        Godot.Core.SpatialMaterial.is_depth_deep_parallax_enabled,
        Godot.Core.SpatialMaterial.is_grow_enabled,
        Godot.Core.SpatialMaterial.is_proximity_fade_enabled,
        Godot.Core.SpatialMaterial.set_albedo,
        Godot.Core.SpatialMaterial.set_alpha_scissor_threshold,
        Godot.Core.SpatialMaterial.set_anisotropy,
        Godot.Core.SpatialMaterial.set_ao_light_affect,
        Godot.Core.SpatialMaterial.set_ao_texture_channel,
        Godot.Core.SpatialMaterial.set_billboard_mode,
        Godot.Core.SpatialMaterial.set_blend_mode,
        Godot.Core.SpatialMaterial.set_clearcoat,
        Godot.Core.SpatialMaterial.set_clearcoat_gloss,
        Godot.Core.SpatialMaterial.set_cull_mode,
        Godot.Core.SpatialMaterial.set_depth_deep_parallax,
        Godot.Core.SpatialMaterial.set_depth_deep_parallax_flip_binormal,
        Godot.Core.SpatialMaterial.set_depth_deep_parallax_flip_tangent,
        Godot.Core.SpatialMaterial.set_depth_deep_parallax_max_layers,
        Godot.Core.SpatialMaterial.set_depth_deep_parallax_min_layers,
        Godot.Core.SpatialMaterial.set_depth_draw_mode,
        Godot.Core.SpatialMaterial.set_depth_scale,
        Godot.Core.SpatialMaterial.set_detail_blend_mode,
        Godot.Core.SpatialMaterial.set_detail_uv,
        Godot.Core.SpatialMaterial.set_diffuse_mode,
        Godot.Core.SpatialMaterial.set_distance_fade,
        Godot.Core.SpatialMaterial.set_distance_fade_max_distance,
        Godot.Core.SpatialMaterial.set_distance_fade_min_distance,
        Godot.Core.SpatialMaterial.set_emission,
        Godot.Core.SpatialMaterial.set_emission_energy,
        Godot.Core.SpatialMaterial.set_emission_operator,
        Godot.Core.SpatialMaterial.set_feature,
        Godot.Core.SpatialMaterial.set_flag,
        Godot.Core.SpatialMaterial.set_grow,
        Godot.Core.SpatialMaterial.set_grow_enabled,
        Godot.Core.SpatialMaterial.set_line_width,
        Godot.Core.SpatialMaterial.set_metallic,
        Godot.Core.SpatialMaterial.set_metallic_texture_channel,
        Godot.Core.SpatialMaterial.set_normal_scale,
        Godot.Core.SpatialMaterial.set_particles_anim_h_frames,
        Godot.Core.SpatialMaterial.set_particles_anim_loop,
        Godot.Core.SpatialMaterial.set_particles_anim_v_frames,
        Godot.Core.SpatialMaterial.set_point_size,
        Godot.Core.SpatialMaterial.set_proximity_fade,
        Godot.Core.SpatialMaterial.set_proximity_fade_distance,
        Godot.Core.SpatialMaterial.set_refraction,
        Godot.Core.SpatialMaterial.set_refraction_texture_channel,
        Godot.Core.SpatialMaterial.set_rim,
        Godot.Core.SpatialMaterial.set_rim_tint,
        Godot.Core.SpatialMaterial.set_roughness,
        Godot.Core.SpatialMaterial.set_roughness_texture_channel,
        Godot.Core.SpatialMaterial.set_specular,
        Godot.Core.SpatialMaterial.set_specular_mode,
        Godot.Core.SpatialMaterial.set_subsurface_scattering_strength,
        Godot.Core.SpatialMaterial.set_texture,
        Godot.Core.SpatialMaterial.set_transmission,
        Godot.Core.SpatialMaterial.set_uv1_offset,
        Godot.Core.SpatialMaterial.set_uv1_scale,
        Godot.Core.SpatialMaterial.set_uv1_triplanar_blend_sharpness,
        Godot.Core.SpatialMaterial.set_uv2_offset,
        Godot.Core.SpatialMaterial.set_uv2_scale,
        Godot.Core.SpatialMaterial.set_uv2_triplanar_blend_sharpness)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Material()

_DIFFUSE_BURLEY :: Int
_DIFFUSE_BURLEY = 0

_DEPTH_DRAW_ALWAYS :: Int
_DEPTH_DRAW_ALWAYS = 1

_FLAG_DISABLE_DEPTH_TEST :: Int
_FLAG_DISABLE_DEPTH_TEST = 2

_TEXTURE_MAX :: Int
_TEXTURE_MAX = 16

_DISTANCE_FADE_PIXEL_DITHER :: Int
_DISTANCE_FADE_PIXEL_DITHER = 2

_FLAG_DONT_RECEIVE_SHADOWS :: Int
_FLAG_DONT_RECEIVE_SHADOWS = 15

_TEXTURE_METALLIC :: Int
_TEXTURE_METALLIC = 1

_FEATURE_MAX :: Int
_FEATURE_MAX = 12

_TEXTURE_DETAIL_ALBEDO :: Int
_TEXTURE_DETAIL_ALBEDO = 14

_TEXTURE_CHANNEL_RED :: Int
_TEXTURE_CHANNEL_RED = 0

_SPECULAR_TOON :: Int
_SPECULAR_TOON = 3

_FEATURE_EMISSION :: Int
_FEATURE_EMISSION = 1

_TEXTURE_CHANNEL_BLUE :: Int
_TEXTURE_CHANNEL_BLUE = 2

_TEXTURE_AMBIENT_OCCLUSION :: Int
_TEXTURE_AMBIENT_OCCLUSION = 8

_TEXTURE_DETAIL_MASK :: Int
_TEXTURE_DETAIL_MASK = 13

_FEATURE_DETAIL :: Int
_FEATURE_DETAIL = 11

_SPECULAR_SCHLICK_GGX :: Int
_SPECULAR_SCHLICK_GGX = 0

_FEATURE_SUBSURACE_SCATTERING :: Int
_FEATURE_SUBSURACE_SCATTERING = 8

_FEATURE_DEPTH_MAPPING :: Int
_FEATURE_DEPTH_MAPPING = 7

_TEXTURE_REFRACTION :: Int
_TEXTURE_REFRACTION = 12

_FEATURE_TRANSPARENT :: Int
_FEATURE_TRANSPARENT = 0

_FEATURE_TRANSMISSION :: Int
_FEATURE_TRANSMISSION = 9

_FLAG_TRIPLANAR_USE_WORLD :: Int
_FLAG_TRIPLANAR_USE_WORLD = 10

_DEPTH_DRAW_ALPHA_OPAQUE_PREPASS :: Int
_DEPTH_DRAW_ALPHA_OPAQUE_PREPASS = 3

_FLAG_USE_ALPHA_SCISSOR :: Int
_FLAG_USE_ALPHA_SCISSOR = 13

_DIFFUSE_LAMBERT :: Int
_DIFFUSE_LAMBERT = 1

_DETAIL_UV_2 :: Int
_DETAIL_UV_2 = 1

_DIFFUSE_LAMBERT_WRAP :: Int
_DIFFUSE_LAMBERT_WRAP = 2

_BLEND_MODE_ADD :: Int
_BLEND_MODE_ADD = 1

_BILLBOARD_ENABLED :: Int
_BILLBOARD_ENABLED = 1

_TEXTURE_NORMAL :: Int
_TEXTURE_NORMAL = 4

_FEATURE_NORMAL_MAPPING :: Int
_FEATURE_NORMAL_MAPPING = 2

_TEXTURE_TRANSMISSION :: Int
_TEXTURE_TRANSMISSION = 11

_FLAG_ALBEDO_FROM_VERTEX_COLOR :: Int
_FLAG_ALBEDO_FROM_VERTEX_COLOR = 3

_FEATURE_REFRACTION :: Int
_FEATURE_REFRACTION = 10

_BLEND_MODE_MIX :: Int
_BLEND_MODE_MIX = 0

_BILLBOARD_FIXED_Y :: Int
_BILLBOARD_FIXED_Y = 2

_TEXTURE_FLOWMAP :: Int
_TEXTURE_FLOWMAP = 7

_TEXTURE_RIM :: Int
_TEXTURE_RIM = 5

_FEATURE_AMBIENT_OCCLUSION :: Int
_FEATURE_AMBIENT_OCCLUSION = 6

_DISTANCE_FADE_OBJECT_DITHER :: Int
_DISTANCE_FADE_OBJECT_DITHER = 3

_FLAG_BILLBOARD_KEEP_SCALE :: Int
_FLAG_BILLBOARD_KEEP_SCALE = 7

_DEPTH_DRAW_OPAQUE_ONLY :: Int
_DEPTH_DRAW_OPAQUE_ONLY = 0

_FLAG_USE_POINT_SIZE :: Int
_FLAG_USE_POINT_SIZE = 5

_CULL_DISABLED :: Int
_CULL_DISABLED = 2

_FEATURE_ANISOTROPY :: Int
_FEATURE_ANISOTROPY = 5

_TEXTURE_ROUGHNESS :: Int
_TEXTURE_ROUGHNESS = 2

_EMISSION_OP_ADD :: Int
_EMISSION_OP_ADD = 0

_FLAG_MAX :: Int
_FLAG_MAX = 19

_FLAG_FIXED_SIZE :: Int
_FLAG_FIXED_SIZE = 6

_FLAG_UNSHADED :: Int
_FLAG_UNSHADED = 0

_FLAG_ENSURE_CORRECT_NORMALS :: Int
_FLAG_ENSURE_CORRECT_NORMALS = 16

_TEXTURE_CHANNEL_GREEN :: Int
_TEXTURE_CHANNEL_GREEN = 1

_SPECULAR_BLINN :: Int
_SPECULAR_BLINN = 1

_CULL_BACK :: Int
_CULL_BACK = 0

_EMISSION_OP_MULTIPLY :: Int
_EMISSION_OP_MULTIPLY = 1

_FLAG_SRGB_VERTEX_COLOR :: Int
_FLAG_SRGB_VERTEX_COLOR = 4

_FLAG_EMISSION_ON_UV2 :: Int
_FLAG_EMISSION_ON_UV2 = 12

_FLAG_AO_ON_UV2 :: Int
_FLAG_AO_ON_UV2 = 11

_TEXTURE_DEPTH :: Int
_TEXTURE_DEPTH = 9

_DIFFUSE_OREN_NAYAR :: Int
_DIFFUSE_OREN_NAYAR = 3

_FLAG_UV1_USE_TRIPLANAR :: Int
_FLAG_UV1_USE_TRIPLANAR = 8

_DEPTH_DRAW_DISABLED :: Int
_DEPTH_DRAW_DISABLED = 2

_TEXTURE_DETAIL_NORMAL :: Int
_TEXTURE_DETAIL_NORMAL = 15

_FEATURE_RIM :: Int
_FEATURE_RIM = 3

_DISTANCE_FADE_DISABLED :: Int
_DISTANCE_FADE_DISABLED = 0

_SPECULAR_DISABLED :: Int
_SPECULAR_DISABLED = 4

_CULL_FRONT :: Int
_CULL_FRONT = 1

_TEXTURE_SUBSURFACE_SCATTERING :: Int
_TEXTURE_SUBSURFACE_SCATTERING = 10

_TEXTURE_CLEARCOAT :: Int
_TEXTURE_CLEARCOAT = 6

_TEXTURE_CHANNEL_ALPHA :: Int
_TEXTURE_CHANNEL_ALPHA = 3

_FEATURE_CLEARCOAT :: Int
_FEATURE_CLEARCOAT = 4

_FLAG_ALBEDO_TEXTURE_FORCE_SRGB :: Int
_FLAG_ALBEDO_TEXTURE_FORCE_SRGB = 14

_DIFFUSE_TOON :: Int
_DIFFUSE_TOON = 4

_DETAIL_UV_1 :: Int
_DETAIL_UV_1 = 0

_FLAG_USE_SHADOW_TO_OPACITY :: Int
_FLAG_USE_SHADOW_TO_OPACITY = 18

_BILLBOARD_DISABLED :: Int
_BILLBOARD_DISABLED = 0

_BLEND_MODE_MUL :: Int
_BLEND_MODE_MUL = 3

_FLAG_USE_VERTEX_LIGHTING :: Int
_FLAG_USE_VERTEX_LIGHTING = 1

_FLAG_UV2_USE_TRIPLANAR :: Int
_FLAG_UV2_USE_TRIPLANAR = 9

_BLEND_MODE_SUB :: Int
_BLEND_MODE_SUB = 2

_SPECULAR_PHONG :: Int
_SPECULAR_PHONG = 2

_DISTANCE_FADE_PIXEL_ALPHA :: Int
_DISTANCE_FADE_PIXEL_ALPHA = 1

_FLAG_DISABLE_AMBIENT_LIGHT :: Int
_FLAG_DISABLE_AMBIENT_LIGHT = 17

_BILLBOARD_PARTICLES :: Int
_BILLBOARD_PARTICLES = 3

_TEXTURE_EMISSION :: Int
_TEXTURE_EMISSION = 3

_TEXTURE_CHANNEL_GRAYSCALE :: Int
_TEXTURE_CHANNEL_GRAYSCALE = 4

_TEXTURE_ALBEDO :: Int
_TEXTURE_ALBEDO = 0

instance NodeProperty SpatialMaterial "albedo_color" Color 'False
         where
        nodeProperty = (get_albedo, wrapDroppingSetter set_albedo, Nothing)

instance NodeProperty SpatialMaterial "albedo_texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_texture,
             wrapIndexedSetter 0 set_texture, Nothing)

instance NodeProperty SpatialMaterial "anisotropy" Float 'False
         where
        nodeProperty
          = (get_anisotropy, wrapDroppingSetter set_anisotropy, Nothing)

instance NodeProperty SpatialMaterial "anisotropy_enabled" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_feature,
             wrapIndexedSetter 5 set_feature, Nothing)

instance NodeProperty SpatialMaterial "anisotropy_flowmap" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_texture,
             wrapIndexedSetter 7 set_texture, Nothing)

instance NodeProperty SpatialMaterial "ao_enabled" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_feature,
             wrapIndexedSetter 6 set_feature, Nothing)

instance NodeProperty SpatialMaterial "ao_light_affect" Float
           'False
         where
        nodeProperty
          = (get_ao_light_affect, wrapDroppingSetter set_ao_light_affect,
             Nothing)

instance NodeProperty SpatialMaterial "ao_on_uv2" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 11 get_flag, wrapIndexedSetter 11 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "ao_texture" Texture 'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_texture,
             wrapIndexedSetter 8 set_texture, Nothing)

instance NodeProperty SpatialMaterial "ao_texture_channel" Int
           'False
         where
        nodeProperty
          = (get_ao_texture_channel,
             wrapDroppingSetter set_ao_texture_channel, Nothing)

instance NodeProperty SpatialMaterial "clearcoat" Float 'False
         where
        nodeProperty
          = (get_clearcoat, wrapDroppingSetter set_clearcoat, Nothing)

instance NodeProperty SpatialMaterial "clearcoat_enabled" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_feature,
             wrapIndexedSetter 4 set_feature, Nothing)

instance NodeProperty SpatialMaterial "clearcoat_gloss" Float
           'False
         where
        nodeProperty
          = (get_clearcoat_gloss, wrapDroppingSetter set_clearcoat_gloss,
             Nothing)

instance NodeProperty SpatialMaterial "clearcoat_texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_texture,
             wrapIndexedSetter 6 set_texture, Nothing)

instance NodeProperty SpatialMaterial "depth_deep_parallax" Bool
           'False
         where
        nodeProperty
          = (is_depth_deep_parallax_enabled,
             wrapDroppingSetter set_depth_deep_parallax, Nothing)

instance NodeProperty SpatialMaterial "depth_enabled" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_feature,
             wrapIndexedSetter 7 set_feature, Nothing)

instance NodeProperty SpatialMaterial "depth_flip_binormal" Bool
           'False
         where
        nodeProperty
          = (get_depth_deep_parallax_flip_binormal,
             wrapDroppingSetter set_depth_deep_parallax_flip_binormal, Nothing)

instance NodeProperty SpatialMaterial "depth_flip_tangent" Bool
           'False
         where
        nodeProperty
          = (get_depth_deep_parallax_flip_tangent,
             wrapDroppingSetter set_depth_deep_parallax_flip_tangent, Nothing)

instance NodeProperty SpatialMaterial "depth_max_layers" Int 'False
         where
        nodeProperty
          = (get_depth_deep_parallax_max_layers,
             wrapDroppingSetter set_depth_deep_parallax_max_layers, Nothing)

instance NodeProperty SpatialMaterial "depth_min_layers" Int 'False
         where
        nodeProperty
          = (get_depth_deep_parallax_min_layers,
             wrapDroppingSetter set_depth_deep_parallax_min_layers, Nothing)

instance NodeProperty SpatialMaterial "depth_scale" Float 'False
         where
        nodeProperty
          = (get_depth_scale, wrapDroppingSetter set_depth_scale, Nothing)

instance NodeProperty SpatialMaterial "depth_texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_texture,
             wrapIndexedSetter 9 set_texture, Nothing)

instance NodeProperty SpatialMaterial "detail_albedo" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_texture,
             wrapIndexedSetter 14 set_texture, Nothing)

instance NodeProperty SpatialMaterial "detail_blend_mode" Int
           'False
         where
        nodeProperty
          = (get_detail_blend_mode, wrapDroppingSetter set_detail_blend_mode,
             Nothing)

instance NodeProperty SpatialMaterial "detail_enabled" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_feature,
             wrapIndexedSetter 11 set_feature, Nothing)

instance NodeProperty SpatialMaterial "detail_mask" Texture 'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_texture,
             wrapIndexedSetter 13 set_texture, Nothing)

instance NodeProperty SpatialMaterial "detail_normal" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_texture,
             wrapIndexedSetter 15 set_texture, Nothing)

instance NodeProperty SpatialMaterial "detail_uv_layer" Int 'False
         where
        nodeProperty
          = (get_detail_uv, wrapDroppingSetter set_detail_uv, Nothing)

instance NodeProperty SpatialMaterial "distance_fade_max_distance"
           Float
           'False
         where
        nodeProperty
          = (get_distance_fade_max_distance,
             wrapDroppingSetter set_distance_fade_max_distance, Nothing)

instance NodeProperty SpatialMaterial "distance_fade_min_distance"
           Float
           'False
         where
        nodeProperty
          = (get_distance_fade_min_distance,
             wrapDroppingSetter set_distance_fade_min_distance, Nothing)

instance NodeProperty SpatialMaterial "distance_fade_mode" Int
           'False
         where
        nodeProperty
          = (get_distance_fade, wrapDroppingSetter set_distance_fade,
             Nothing)

instance NodeProperty SpatialMaterial "emission" Color 'False where
        nodeProperty
          = (get_emission, wrapDroppingSetter set_emission, Nothing)

instance NodeProperty SpatialMaterial "emission_enabled" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_feature,
             wrapIndexedSetter 1 set_feature, Nothing)

instance NodeProperty SpatialMaterial "emission_energy" Float
           'False
         where
        nodeProperty
          = (get_emission_energy, wrapDroppingSetter set_emission_energy,
             Nothing)

instance NodeProperty SpatialMaterial "emission_on_uv2" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_flag, wrapIndexedSetter 12 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "emission_operator" Int
           'False
         where
        nodeProperty
          = (get_emission_operator, wrapDroppingSetter set_emission_operator,
             Nothing)

instance NodeProperty SpatialMaterial "emission_texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_texture,
             wrapIndexedSetter 3 set_texture, Nothing)

instance NodeProperty SpatialMaterial "flags_albedo_tex_force_srgb"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_flag, wrapIndexedSetter 14 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "flags_disable_ambient_light"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_flag, wrapIndexedSetter 17 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial
           "flags_do_not_receive_shadows"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_flag, wrapIndexedSetter 15 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial
           "flags_ensure_correct_normals"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_flag, wrapIndexedSetter 16 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "flags_fixed_size" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_flag, wrapIndexedSetter 6 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "flags_no_depth_test" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_flag, wrapIndexedSetter 2 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "flags_transparent" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_feature,
             wrapIndexedSetter 0 set_feature, Nothing)

instance NodeProperty SpatialMaterial "flags_unshaded" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_flag, wrapIndexedSetter 0 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "flags_use_point_size" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_flag, wrapIndexedSetter 5 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "flags_use_shadow_to_opacity"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_flag, wrapIndexedSetter 18 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "flags_vertex_lighting" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_flag, wrapIndexedSetter 1 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "flags_world_triplanar" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_flag, wrapIndexedSetter 10 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "metallic" Float 'False where
        nodeProperty
          = (get_metallic, wrapDroppingSetter set_metallic, Nothing)

instance NodeProperty SpatialMaterial "metallic_specular" Float
           'False
         where
        nodeProperty
          = (get_specular, wrapDroppingSetter set_specular, Nothing)

instance NodeProperty SpatialMaterial "metallic_texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_texture,
             wrapIndexedSetter 1 set_texture, Nothing)

instance NodeProperty SpatialMaterial "metallic_texture_channel"
           Int
           'False
         where
        nodeProperty
          = (get_metallic_texture_channel,
             wrapDroppingSetter set_metallic_texture_channel, Nothing)

instance NodeProperty SpatialMaterial "normal_enabled" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_feature,
             wrapIndexedSetter 2 set_feature, Nothing)

instance NodeProperty SpatialMaterial "normal_scale" Float 'False
         where
        nodeProperty
          = (get_normal_scale, wrapDroppingSetter set_normal_scale, Nothing)

instance NodeProperty SpatialMaterial "normal_texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_texture,
             wrapIndexedSetter 4 set_texture, Nothing)

instance NodeProperty SpatialMaterial
           "params_alpha_scissor_threshold"
           Float
           'False
         where
        nodeProperty
          = (get_alpha_scissor_threshold,
             wrapDroppingSetter set_alpha_scissor_threshold, Nothing)

instance NodeProperty SpatialMaterial "params_billboard_keep_scale"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_flag, wrapIndexedSetter 7 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "params_billboard_mode" Int
           'False
         where
        nodeProperty
          = (get_billboard_mode, wrapDroppingSetter set_billboard_mode,
             Nothing)

instance NodeProperty SpatialMaterial "params_blend_mode" Int
           'False
         where
        nodeProperty
          = (get_blend_mode, wrapDroppingSetter set_blend_mode, Nothing)

instance NodeProperty SpatialMaterial "params_cull_mode" Int 'False
         where
        nodeProperty
          = (get_cull_mode, wrapDroppingSetter set_cull_mode, Nothing)

instance NodeProperty SpatialMaterial "params_depth_draw_mode" Int
           'False
         where
        nodeProperty
          = (get_depth_draw_mode, wrapDroppingSetter set_depth_draw_mode,
             Nothing)

instance NodeProperty SpatialMaterial "params_diffuse_mode" Int
           'False
         where
        nodeProperty
          = (get_diffuse_mode, wrapDroppingSetter set_diffuse_mode, Nothing)

instance NodeProperty SpatialMaterial "params_grow" Bool 'False
         where
        nodeProperty
          = (is_grow_enabled, wrapDroppingSetter set_grow_enabled, Nothing)

instance NodeProperty SpatialMaterial "params_grow_amount" Float
           'False
         where
        nodeProperty = (get_grow, wrapDroppingSetter set_grow, Nothing)

instance NodeProperty SpatialMaterial "params_line_width" Float
           'False
         where
        nodeProperty
          = (get_line_width, wrapDroppingSetter set_line_width, Nothing)

instance NodeProperty SpatialMaterial "params_point_size" Float
           'False
         where
        nodeProperty
          = (get_point_size, wrapDroppingSetter set_point_size, Nothing)

instance NodeProperty SpatialMaterial "params_specular_mode" Int
           'False
         where
        nodeProperty
          = (get_specular_mode, wrapDroppingSetter set_specular_mode,
             Nothing)

instance NodeProperty SpatialMaterial "params_use_alpha_scissor"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_flag, wrapIndexedSetter 13 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "particles_anim_h_frames" Int
           'False
         where
        nodeProperty
          = (get_particles_anim_h_frames,
             wrapDroppingSetter set_particles_anim_h_frames, Nothing)

instance NodeProperty SpatialMaterial "particles_anim_loop" Bool
           'False
         where
        nodeProperty
          = (get_particles_anim_loop,
             wrapDroppingSetter set_particles_anim_loop, Nothing)

instance NodeProperty SpatialMaterial "particles_anim_v_frames" Int
           'False
         where
        nodeProperty
          = (get_particles_anim_v_frames,
             wrapDroppingSetter set_particles_anim_v_frames, Nothing)

instance NodeProperty SpatialMaterial "proximity_fade_distance"
           Float
           'False
         where
        nodeProperty
          = (get_proximity_fade_distance,
             wrapDroppingSetter set_proximity_fade_distance, Nothing)

instance NodeProperty SpatialMaterial "proximity_fade_enable" Bool
           'False
         where
        nodeProperty
          = (is_proximity_fade_enabled,
             wrapDroppingSetter set_proximity_fade, Nothing)

instance NodeProperty SpatialMaterial "refraction_enabled" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_feature,
             wrapIndexedSetter 10 set_feature, Nothing)

instance NodeProperty SpatialMaterial "refraction_scale" Float
           'False
         where
        nodeProperty
          = (get_refraction, wrapDroppingSetter set_refraction, Nothing)

instance NodeProperty SpatialMaterial "refraction_texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_texture,
             wrapIndexedSetter 12 set_texture, Nothing)

instance NodeProperty SpatialMaterial "refraction_texture_channel"
           Int
           'False
         where
        nodeProperty
          = (get_refraction_texture_channel,
             wrapDroppingSetter set_refraction_texture_channel, Nothing)

instance NodeProperty SpatialMaterial "rim" Float 'False where
        nodeProperty = (get_rim, wrapDroppingSetter set_rim, Nothing)

instance NodeProperty SpatialMaterial "rim_enabled" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_feature,
             wrapIndexedSetter 3 set_feature, Nothing)

instance NodeProperty SpatialMaterial "rim_texture" Texture 'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_texture,
             wrapIndexedSetter 5 set_texture, Nothing)

instance NodeProperty SpatialMaterial "rim_tint" Float 'False where
        nodeProperty
          = (get_rim_tint, wrapDroppingSetter set_rim_tint, Nothing)

instance NodeProperty SpatialMaterial "roughness" Float 'False
         where
        nodeProperty
          = (get_roughness, wrapDroppingSetter set_roughness, Nothing)

instance NodeProperty SpatialMaterial "roughness_texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_texture,
             wrapIndexedSetter 2 set_texture, Nothing)

instance NodeProperty SpatialMaterial "roughness_texture_channel"
           Int
           'False
         where
        nodeProperty
          = (get_roughness_texture_channel,
             wrapDroppingSetter set_roughness_texture_channel, Nothing)

instance NodeProperty SpatialMaterial "subsurf_scatter_enabled"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_feature,
             wrapIndexedSetter 8 set_feature, Nothing)

instance NodeProperty SpatialMaterial "subsurf_scatter_strength"
           Float
           'False
         where
        nodeProperty
          = (get_subsurface_scattering_strength,
             wrapDroppingSetter set_subsurface_scattering_strength, Nothing)

instance NodeProperty SpatialMaterial "subsurf_scatter_texture"
           Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_texture,
             wrapIndexedSetter 10 set_texture, Nothing)

instance NodeProperty SpatialMaterial "transmission" Color 'False
         where
        nodeProperty
          = (get_transmission, wrapDroppingSetter set_transmission, Nothing)

instance NodeProperty SpatialMaterial "transmission_enabled" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_feature,
             wrapIndexedSetter 9 set_feature, Nothing)

instance NodeProperty SpatialMaterial "transmission_texture"
           Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_texture,
             wrapIndexedSetter 11 set_texture, Nothing)

instance NodeProperty SpatialMaterial "uv1_offset" Vector3 'False
         where
        nodeProperty
          = (get_uv1_offset, wrapDroppingSetter set_uv1_offset, Nothing)

instance NodeProperty SpatialMaterial "uv1_scale" Vector3 'False
         where
        nodeProperty
          = (get_uv1_scale, wrapDroppingSetter set_uv1_scale, Nothing)

instance NodeProperty SpatialMaterial "uv1_triplanar" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_flag, wrapIndexedSetter 8 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "uv1_triplanar_sharpness"
           Float
           'False
         where
        nodeProperty
          = (get_uv1_triplanar_blend_sharpness,
             wrapDroppingSetter set_uv1_triplanar_blend_sharpness, Nothing)

instance NodeProperty SpatialMaterial "uv2_offset" Vector3 'False
         where
        nodeProperty
          = (get_uv2_offset, wrapDroppingSetter set_uv2_offset, Nothing)

instance NodeProperty SpatialMaterial "uv2_scale" Vector3 'False
         where
        nodeProperty
          = (get_uv2_scale, wrapDroppingSetter set_uv2_scale, Nothing)

instance NodeProperty SpatialMaterial "uv2_triplanar" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_flag, wrapIndexedSetter 9 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "uv2_triplanar_sharpness"
           Float
           'False
         where
        nodeProperty
          = (get_uv2_triplanar_blend_sharpness,
             wrapDroppingSetter set_uv2_triplanar_blend_sharpness, Nothing)

instance NodeProperty SpatialMaterial "vertex_color_is_srgb" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_flag, wrapIndexedSetter 4 set_flag,
             Nothing)

instance NodeProperty SpatialMaterial "vertex_color_use_as_albedo"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_flag, wrapIndexedSetter 3 set_flag,
             Nothing)

{-# NOINLINE bindSpatialMaterial_get_albedo #-}

-- | The material's base color.
bindSpatialMaterial_get_albedo :: MethodBind
bindSpatialMaterial_get_albedo
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_albedo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material's base color.
get_albedo ::
             (SpatialMaterial :< cls, Object :< cls) => cls -> IO Color
get_albedo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_albedo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_albedo" '[] (IO Color)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_albedo

{-# NOINLINE bindSpatialMaterial_get_alpha_scissor_threshold #-}

-- | Threshold at which the alpha scissor will discard values.
bindSpatialMaterial_get_alpha_scissor_threshold :: MethodBind
bindSpatialMaterial_get_alpha_scissor_threshold
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_alpha_scissor_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold at which the alpha scissor will discard values.
get_alpha_scissor_threshold ::
                              (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_alpha_scissor_threshold cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_alpha_scissor_threshold
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_alpha_scissor_threshold"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_alpha_scissor_threshold

{-# NOINLINE bindSpatialMaterial_get_anisotropy #-}

-- | The strength of the anisotropy effect. This is multiplied by @anisotropy_flowmap@'s alpha channel if a texture is defined there and the texture contains an alpha channel.
bindSpatialMaterial_get_anisotropy :: MethodBind
bindSpatialMaterial_get_anisotropy
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_anisotropy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The strength of the anisotropy effect. This is multiplied by @anisotropy_flowmap@'s alpha channel if a texture is defined there and the texture contains an alpha channel.
get_anisotropy ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_anisotropy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_anisotropy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_anisotropy" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_anisotropy

{-# NOINLINE bindSpatialMaterial_get_ao_light_affect #-}

-- | Amount that ambient occlusion affects lighting from lights. If @0@, ambient occlusion only affects ambient light. If @1@, ambient occlusion affects lights just as much as it affects ambient light. This can be used to impact the strength of the ambient occlusion effect, but typically looks unrealistic.
bindSpatialMaterial_get_ao_light_affect :: MethodBind
bindSpatialMaterial_get_ao_light_affect
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_ao_light_affect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount that ambient occlusion affects lighting from lights. If @0@, ambient occlusion only affects ambient light. If @1@, ambient occlusion affects lights just as much as it affects ambient light. This can be used to impact the strength of the ambient occlusion effect, but typically looks unrealistic.
get_ao_light_affect ::
                      (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_ao_light_affect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_ao_light_affect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_ao_light_affect" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_ao_light_affect

{-# NOINLINE bindSpatialMaterial_get_ao_texture_channel #-}

-- | Specifies the channel of the @ao_texture@ in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
bindSpatialMaterial_get_ao_texture_channel :: MethodBind
bindSpatialMaterial_get_ao_texture_channel
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_ao_texture_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the channel of the @ao_texture@ in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
get_ao_texture_channel ::
                         (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_ao_texture_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_ao_texture_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_ao_texture_channel" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_ao_texture_channel

{-# NOINLINE bindSpatialMaterial_get_billboard_mode #-}

-- | Controls how the object faces the camera. See @enum BillboardMode@.
--   			__Note:__ Billboard mode is not suitable for VR because the left-right vector of the camera is not horizontal when the screen is attached to your head instead of on the table. See @url=https://github.com/godotengine/godot/issues/41567@GitHub issue #41567@/url@ for details.
bindSpatialMaterial_get_billboard_mode :: MethodBind
bindSpatialMaterial_get_billboard_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_billboard_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls how the object faces the camera. See @enum BillboardMode@.
--   			__Note:__ Billboard mode is not suitable for VR because the left-right vector of the camera is not horizontal when the screen is attached to your head instead of on the table. See @url=https://github.com/godotengine/godot/issues/41567@GitHub issue #41567@/url@ for details.
get_billboard_mode ::
                     (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_billboard_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_billboard_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_billboard_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_billboard_mode

{-# NOINLINE bindSpatialMaterial_get_blend_mode #-}

-- | The material's blend mode.
--   			__Note:__ Values other than @Mix@ force the object into the transparent pipeline. See @enum BlendMode@.
bindSpatialMaterial_get_blend_mode :: MethodBind
bindSpatialMaterial_get_blend_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material's blend mode.
--   			__Note:__ Values other than @Mix@ force the object into the transparent pipeline. See @enum BlendMode@.
get_blend_mode ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_blend_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_blend_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_blend_mode

{-# NOINLINE bindSpatialMaterial_get_clearcoat #-}

-- | Sets the strength of the clearcoat effect. Setting to @0@ looks the same as disabling the clearcoat effect.
bindSpatialMaterial_get_clearcoat :: MethodBind
bindSpatialMaterial_get_clearcoat
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_clearcoat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the strength of the clearcoat effect. Setting to @0@ looks the same as disabling the clearcoat effect.
get_clearcoat ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_clearcoat cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_clearcoat
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_clearcoat" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_clearcoat

{-# NOINLINE bindSpatialMaterial_get_clearcoat_gloss #-}

-- | Sets the roughness of the clearcoat pass. A higher value results in a smoother clearcoat while a lower value results in a rougher clearcoat.
bindSpatialMaterial_get_clearcoat_gloss :: MethodBind
bindSpatialMaterial_get_clearcoat_gloss
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_clearcoat_gloss" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the roughness of the clearcoat pass. A higher value results in a smoother clearcoat while a lower value results in a rougher clearcoat.
get_clearcoat_gloss ::
                      (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_clearcoat_gloss cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_clearcoat_gloss
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_clearcoat_gloss" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_clearcoat_gloss

{-# NOINLINE bindSpatialMaterial_get_cull_mode #-}

-- | Which side of the object is not drawn when backfaces are rendered. See @enum CullMode@.
bindSpatialMaterial_get_cull_mode :: MethodBind
bindSpatialMaterial_get_cull_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_cull_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Which side of the object is not drawn when backfaces are rendered. See @enum CullMode@.
get_cull_mode ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_cull_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_cull_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_cull_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_cull_mode

{-# NOINLINE bindSpatialMaterial_get_depth_deep_parallax_flip_binormal
             #-}

-- | If @true@, direction of the binormal is flipped before using in the depth effect. This may be necessary if you have encoded your binormals in a way that is conflicting with the depth effect.
bindSpatialMaterial_get_depth_deep_parallax_flip_binormal ::
                                                          MethodBind
bindSpatialMaterial_get_depth_deep_parallax_flip_binormal
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_depth_deep_parallax_flip_binormal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, direction of the binormal is flipped before using in the depth effect. This may be necessary if you have encoded your binormals in a way that is conflicting with the depth effect.
get_depth_deep_parallax_flip_binormal ::
                                        (SpatialMaterial :< cls, Object :< cls) => cls -> IO Bool
get_depth_deep_parallax_flip_binormal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_depth_deep_parallax_flip_binormal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_depth_deep_parallax_flip_binormal"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_depth_deep_parallax_flip_binormal

{-# NOINLINE bindSpatialMaterial_get_depth_deep_parallax_flip_tangent
             #-}

-- | If @true@, direction of the tangent is flipped before using in the depth effect. This may be necessary if you have encoded your tangents in a way that is conflicting with the depth effect.
bindSpatialMaterial_get_depth_deep_parallax_flip_tangent ::
                                                         MethodBind
bindSpatialMaterial_get_depth_deep_parallax_flip_tangent
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_depth_deep_parallax_flip_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, direction of the tangent is flipped before using in the depth effect. This may be necessary if you have encoded your tangents in a way that is conflicting with the depth effect.
get_depth_deep_parallax_flip_tangent ::
                                       (SpatialMaterial :< cls, Object :< cls) => cls -> IO Bool
get_depth_deep_parallax_flip_tangent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_depth_deep_parallax_flip_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_depth_deep_parallax_flip_tangent"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_depth_deep_parallax_flip_tangent

{-# NOINLINE bindSpatialMaterial_get_depth_deep_parallax_max_layers
             #-}

-- | Number of layers to use when using @depth_deep_parallax@ and the view direction is perpendicular to the surface of the object. A higher number will be more performance demanding while a lower number may not look as crisp.
bindSpatialMaterial_get_depth_deep_parallax_max_layers ::
                                                       MethodBind
bindSpatialMaterial_get_depth_deep_parallax_max_layers
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_depth_deep_parallax_max_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of layers to use when using @depth_deep_parallax@ and the view direction is perpendicular to the surface of the object. A higher number will be more performance demanding while a lower number may not look as crisp.
get_depth_deep_parallax_max_layers ::
                                     (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_depth_deep_parallax_max_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_depth_deep_parallax_max_layers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_depth_deep_parallax_max_layers"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_depth_deep_parallax_max_layers

{-# NOINLINE bindSpatialMaterial_get_depth_deep_parallax_min_layers
             #-}

-- | Number of layers to use when using @depth_deep_parallax@ and the view direction is parallel to the surface of the object. A higher number will be more performance demanding while a lower number may not look as crisp.
bindSpatialMaterial_get_depth_deep_parallax_min_layers ::
                                                       MethodBind
bindSpatialMaterial_get_depth_deep_parallax_min_layers
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_depth_deep_parallax_min_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of layers to use when using @depth_deep_parallax@ and the view direction is parallel to the surface of the object. A higher number will be more performance demanding while a lower number may not look as crisp.
get_depth_deep_parallax_min_layers ::
                                     (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_depth_deep_parallax_min_layers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_depth_deep_parallax_min_layers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_depth_deep_parallax_min_layers"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_depth_deep_parallax_min_layers

{-# NOINLINE bindSpatialMaterial_get_depth_draw_mode #-}

-- | Determines when depth rendering takes place. See @enum DepthDrawMode@. See also @flags_transparent@.
bindSpatialMaterial_get_depth_draw_mode :: MethodBind
bindSpatialMaterial_get_depth_draw_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_depth_draw_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines when depth rendering takes place. See @enum DepthDrawMode@. See also @flags_transparent@.
get_depth_draw_mode ::
                      (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_depth_draw_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_depth_draw_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_depth_draw_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_depth_draw_mode

{-# NOINLINE bindSpatialMaterial_get_depth_scale #-}

-- | Scales the depth offset effect. A higher number will create a larger depth.
bindSpatialMaterial_get_depth_scale :: MethodBind
bindSpatialMaterial_get_depth_scale
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_depth_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the depth offset effect. A higher number will create a larger depth.
get_depth_scale ::
                  (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_depth_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_depth_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_depth_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_depth_scale

{-# NOINLINE bindSpatialMaterial_get_detail_blend_mode #-}

-- | Specifies how the @detail_albedo@ should blend with the current @ALBEDO@. See @enum BlendMode@ for options.
bindSpatialMaterial_get_detail_blend_mode :: MethodBind
bindSpatialMaterial_get_detail_blend_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_detail_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies how the @detail_albedo@ should blend with the current @ALBEDO@. See @enum BlendMode@ for options.
get_detail_blend_mode ::
                        (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_detail_blend_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_detail_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_detail_blend_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_detail_blend_mode

{-# NOINLINE bindSpatialMaterial_get_detail_uv #-}

-- | Specifies whether to use @UV@ or @UV2@ for the detail layer. See @enum DetailUV@ for options.
bindSpatialMaterial_get_detail_uv :: MethodBind
bindSpatialMaterial_get_detail_uv
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_detail_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies whether to use @UV@ or @UV2@ for the detail layer. See @enum DetailUV@ for options.
get_detail_uv ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_detail_uv cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_detail_uv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_detail_uv" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_detail_uv

{-# NOINLINE bindSpatialMaterial_get_diffuse_mode #-}

-- | The algorithm used for diffuse light scattering. See @enum DiffuseMode@.
bindSpatialMaterial_get_diffuse_mode :: MethodBind
bindSpatialMaterial_get_diffuse_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_diffuse_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The algorithm used for diffuse light scattering. See @enum DiffuseMode@.
get_diffuse_mode ::
                   (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_diffuse_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_diffuse_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_diffuse_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_diffuse_mode

{-# NOINLINE bindSpatialMaterial_get_distance_fade #-}

-- | Specifies which type of fade to use. Can be any of the @enum DistanceFadeMode@s.
bindSpatialMaterial_get_distance_fade :: MethodBind
bindSpatialMaterial_get_distance_fade
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_distance_fade" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies which type of fade to use. Can be any of the @enum DistanceFadeMode@s.
get_distance_fade ::
                    (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_distance_fade cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_distance_fade
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_distance_fade" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_distance_fade

{-# NOINLINE bindSpatialMaterial_get_distance_fade_max_distance #-}

-- | Distance at which the object appears fully opaque.
--   			__Note:__ If @distance_fade_max_distance@ is less than @distance_fade_min_distance@, the behavior will be reversed. The object will start to fade away at @distance_fade_max_distance@ and will fully disappear once it reaches @distance_fade_min_distance@.
bindSpatialMaterial_get_distance_fade_max_distance :: MethodBind
bindSpatialMaterial_get_distance_fade_max_distance
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_distance_fade_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance at which the object appears fully opaque.
--   			__Note:__ If @distance_fade_max_distance@ is less than @distance_fade_min_distance@, the behavior will be reversed. The object will start to fade away at @distance_fade_max_distance@ and will fully disappear once it reaches @distance_fade_min_distance@.
get_distance_fade_max_distance ::
                                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_distance_fade_max_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_distance_fade_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_distance_fade_max_distance"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_distance_fade_max_distance

{-# NOINLINE bindSpatialMaterial_get_distance_fade_min_distance #-}

-- | Distance at which the object starts to become visible. If the object is less than this distance away, it will be invisible.
--   			__Note:__ If @distance_fade_min_distance@ is greater than @distance_fade_max_distance@, the behavior will be reversed. The object will start to fade away at @distance_fade_max_distance@ and will fully disappear once it reaches @distance_fade_min_distance@.
bindSpatialMaterial_get_distance_fade_min_distance :: MethodBind
bindSpatialMaterial_get_distance_fade_min_distance
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_distance_fade_min_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance at which the object starts to become visible. If the object is less than this distance away, it will be invisible.
--   			__Note:__ If @distance_fade_min_distance@ is greater than @distance_fade_max_distance@, the behavior will be reversed. The object will start to fade away at @distance_fade_max_distance@ and will fully disappear once it reaches @distance_fade_min_distance@.
get_distance_fade_min_distance ::
                                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_distance_fade_min_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_distance_fade_min_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_distance_fade_min_distance"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_distance_fade_min_distance

{-# NOINLINE bindSpatialMaterial_get_emission #-}

-- | The emitted light's color. See @emission_enabled@.
bindSpatialMaterial_get_emission :: MethodBind
bindSpatialMaterial_get_emission
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_emission" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The emitted light's color. See @emission_enabled@.
get_emission ::
               (SpatialMaterial :< cls, Object :< cls) => cls -> IO Color
get_emission cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_emission
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_emission" '[] (IO Color)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_emission

{-# NOINLINE bindSpatialMaterial_get_emission_energy #-}

-- | The emitted light's strength. See @emission_enabled@.
bindSpatialMaterial_get_emission_energy :: MethodBind
bindSpatialMaterial_get_emission_energy
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The emitted light's strength. See @emission_enabled@.
get_emission_energy ::
                      (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_emission_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_emission_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_emission_energy" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_emission_energy

{-# NOINLINE bindSpatialMaterial_get_emission_operator #-}

-- | Sets how @emission@ interacts with @emission_texture@. Can either add or multiply. See @enum EmissionOperator@ for options.
bindSpatialMaterial_get_emission_operator :: MethodBind
bindSpatialMaterial_get_emission_operator
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets how @emission@ interacts with @emission_texture@. Can either add or multiply. See @enum EmissionOperator@ for options.
get_emission_operator ::
                        (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_emission_operator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_emission_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_emission_operator" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_emission_operator

{-# NOINLINE bindSpatialMaterial_get_feature #-}

-- | Returns @true@, if the specified @enum Feature@ is enabled.
bindSpatialMaterial_get_feature :: MethodBind
bindSpatialMaterial_get_feature
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@, if the specified @enum Feature@ is enabled.
get_feature ::
              (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO Bool
get_feature cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_feature (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_feature" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_feature

{-# NOINLINE bindSpatialMaterial_get_flag #-}

-- | Returns @true@, if the specified flag is enabled. See @enum Flags@ enumerator for options.
bindSpatialMaterial_get_flag :: MethodBind
bindSpatialMaterial_get_flag
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@, if the specified flag is enabled. See @enum Flags@ enumerator for options.
get_flag ::
           (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_flag" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_flag

{-# NOINLINE bindSpatialMaterial_get_grow #-}

-- | Grows object vertices in the direction of their normals.
bindSpatialMaterial_get_grow :: MethodBind
bindSpatialMaterial_get_grow
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_grow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grows object vertices in the direction of their normals.
get_grow ::
           (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_grow cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_grow (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_grow" '[] (IO Float) where
        nodeMethod = Godot.Core.SpatialMaterial.get_grow

{-# NOINLINE bindSpatialMaterial_get_line_width #-}

-- | Currently unimplemented in Godot.
bindSpatialMaterial_get_line_width :: MethodBind
bindSpatialMaterial_get_line_width
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_line_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Currently unimplemented in Godot.
get_line_width ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_line_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_line_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_line_width" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_line_width

{-# NOINLINE bindSpatialMaterial_get_metallic #-}

-- | A high value makes the material appear more like a metal. Non-metals use their albedo as the diffuse color and add diffuse to the specular reflection. With non-metals, the reflection appears on top of the albedo color. Metals use their albedo as a multiplier to the specular reflection and set the diffuse color to black resulting in a tinted reflection. Materials work better when fully metal or fully non-metal, values between @0@ and @1@ should only be used for blending between metal and non-metal sections. To alter the amount of reflection use @roughness@.
bindSpatialMaterial_get_metallic :: MethodBind
bindSpatialMaterial_get_metallic
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_metallic" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A high value makes the material appear more like a metal. Non-metals use their albedo as the diffuse color and add diffuse to the specular reflection. With non-metals, the reflection appears on top of the albedo color. Metals use their albedo as a multiplier to the specular reflection and set the diffuse color to black resulting in a tinted reflection. Materials work better when fully metal or fully non-metal, values between @0@ and @1@ should only be used for blending between metal and non-metal sections. To alter the amount of reflection use @roughness@.
get_metallic ::
               (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_metallic cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_metallic
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_metallic" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_metallic

{-# NOINLINE bindSpatialMaterial_get_metallic_texture_channel #-}

-- | Specifies the channel of the @metallic_texture@ in which the metallic information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
bindSpatialMaterial_get_metallic_texture_channel :: MethodBind
bindSpatialMaterial_get_metallic_texture_channel
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_metallic_texture_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the channel of the @metallic_texture@ in which the metallic information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
get_metallic_texture_channel ::
                               (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_metallic_texture_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_metallic_texture_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_metallic_texture_channel"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_metallic_texture_channel

{-# NOINLINE bindSpatialMaterial_get_normal_scale #-}

-- | The strength of the normal map's effect.
bindSpatialMaterial_get_normal_scale :: MethodBind
bindSpatialMaterial_get_normal_scale
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_normal_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The strength of the normal map's effect.
get_normal_scale ::
                   (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_normal_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_normal_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_normal_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_normal_scale

{-# NOINLINE bindSpatialMaterial_get_particles_anim_h_frames #-}

-- | The number of horizontal frames in the particle sprite sheet. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
bindSpatialMaterial_get_particles_anim_h_frames :: MethodBind
bindSpatialMaterial_get_particles_anim_h_frames
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_particles_anim_h_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of horizontal frames in the particle sprite sheet. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
get_particles_anim_h_frames ::
                              (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_particles_anim_h_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_particles_anim_h_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_particles_anim_h_frames"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_particles_anim_h_frames

{-# NOINLINE bindSpatialMaterial_get_particles_anim_loop #-}

-- | If @true@, particle animations are looped. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
bindSpatialMaterial_get_particles_anim_loop :: MethodBind
bindSpatialMaterial_get_particles_anim_loop
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_particles_anim_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particle animations are looped. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
get_particles_anim_loop ::
                          (SpatialMaterial :< cls, Object :< cls) => cls -> IO Bool
get_particles_anim_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_particles_anim_loop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_particles_anim_loop" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_particles_anim_loop

{-# NOINLINE bindSpatialMaterial_get_particles_anim_v_frames #-}

-- | The number of vertical frames in the particle sprite sheet. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
bindSpatialMaterial_get_particles_anim_v_frames :: MethodBind
bindSpatialMaterial_get_particles_anim_v_frames
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_particles_anim_v_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of vertical frames in the particle sprite sheet. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
get_particles_anim_v_frames ::
                              (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_particles_anim_v_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_particles_anim_v_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_particles_anim_v_frames"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_particles_anim_v_frames

{-# NOINLINE bindSpatialMaterial_get_point_size #-}

-- | The point size in pixels. See @flags_use_point_size@.
bindSpatialMaterial_get_point_size :: MethodBind
bindSpatialMaterial_get_point_size
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_point_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The point size in pixels. See @flags_use_point_size@.
get_point_size ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_point_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_point_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_point_size" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_point_size

{-# NOINLINE bindSpatialMaterial_get_proximity_fade_distance #-}

-- | Distance over which the fade effect takes place. The larger the distance the longer it takes for an object to fade.
bindSpatialMaterial_get_proximity_fade_distance :: MethodBind
bindSpatialMaterial_get_proximity_fade_distance
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_proximity_fade_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance over which the fade effect takes place. The larger the distance the longer it takes for an object to fade.
get_proximity_fade_distance ::
                              (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_proximity_fade_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_proximity_fade_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_proximity_fade_distance"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_proximity_fade_distance

{-# NOINLINE bindSpatialMaterial_get_refraction #-}

-- | The strength of the refraction effect. Higher values result in a more distorted appearance for the refraction.
bindSpatialMaterial_get_refraction :: MethodBind
bindSpatialMaterial_get_refraction
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_refraction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The strength of the refraction effect. Higher values result in a more distorted appearance for the refraction.
get_refraction ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_refraction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_refraction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_refraction" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_refraction

{-# NOINLINE bindSpatialMaterial_get_refraction_texture_channel #-}

-- | Specifies the channel of the @refraction_texture@ in which the refraction information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
bindSpatialMaterial_get_refraction_texture_channel :: MethodBind
bindSpatialMaterial_get_refraction_texture_channel
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_refraction_texture_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the channel of the @refraction_texture@ in which the refraction information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
get_refraction_texture_channel ::
                                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_refraction_texture_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_refraction_texture_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_refraction_texture_channel"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_refraction_texture_channel

{-# NOINLINE bindSpatialMaterial_get_rim #-}

-- | Sets the strength of the rim lighting effect.
bindSpatialMaterial_get_rim :: MethodBind
bindSpatialMaterial_get_rim
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_rim" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the strength of the rim lighting effect.
get_rim ::
          (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_rim cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_rim (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_rim" '[] (IO Float) where
        nodeMethod = Godot.Core.SpatialMaterial.get_rim

{-# NOINLINE bindSpatialMaterial_get_rim_tint #-}

-- | The amount of to blend light and albedo color when rendering rim effect. If @0@ the light color is used, while @1@ means albedo color is used. An intermediate value generally works best.
bindSpatialMaterial_get_rim_tint :: MethodBind
bindSpatialMaterial_get_rim_tint
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_rim_tint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of to blend light and albedo color when rendering rim effect. If @0@ the light color is used, while @1@ means albedo color is used. An intermediate value generally works best.
get_rim_tint ::
               (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_rim_tint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_rim_tint
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_rim_tint" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_rim_tint

{-# NOINLINE bindSpatialMaterial_get_roughness #-}

-- | Surface reflection. A value of @0@ represents a perfect mirror while a value of @1@ completely blurs the reflection. See also @metallic@.
bindSpatialMaterial_get_roughness :: MethodBind
bindSpatialMaterial_get_roughness
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_roughness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Surface reflection. A value of @0@ represents a perfect mirror while a value of @1@ completely blurs the reflection. See also @metallic@.
get_roughness ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_roughness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_roughness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_roughness" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_roughness

{-# NOINLINE bindSpatialMaterial_get_roughness_texture_channel #-}

-- | Specifies the channel of the @ao_texture@ in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
bindSpatialMaterial_get_roughness_texture_channel :: MethodBind
bindSpatialMaterial_get_roughness_texture_channel
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_roughness_texture_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the channel of the @ao_texture@ in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
get_roughness_texture_channel ::
                                (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_roughness_texture_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_roughness_texture_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_roughness_texture_channel"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_roughness_texture_channel

{-# NOINLINE bindSpatialMaterial_get_specular #-}

-- | Sets the size of the specular lobe. The specular lobe is the bright spot that is reflected from light sources.
--   			__Note:__ Unlike @metallic@, this is not energy-conserving, so it should be left at @0.5@ in most cases. See also @roughness@.
bindSpatialMaterial_get_specular :: MethodBind
bindSpatialMaterial_get_specular
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_specular" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the specular lobe. The specular lobe is the bright spot that is reflected from light sources.
--   			__Note:__ Unlike @metallic@, this is not energy-conserving, so it should be left at @0.5@ in most cases. See also @roughness@.
get_specular ::
               (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_specular cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_specular
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_specular" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_specular

{-# NOINLINE bindSpatialMaterial_get_specular_mode #-}

-- | The method for rendering the specular blob. See @enum SpecularMode@.
bindSpatialMaterial_get_specular_mode :: MethodBind
bindSpatialMaterial_get_specular_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_specular_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The method for rendering the specular blob. See @enum SpecularMode@.
get_specular_mode ::
                    (SpatialMaterial :< cls, Object :< cls) => cls -> IO Int
get_specular_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_specular_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_specular_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_specular_mode

{-# NOINLINE bindSpatialMaterial_get_subsurface_scattering_strength
             #-}

-- | The strength of the subsurface scattering effect.
bindSpatialMaterial_get_subsurface_scattering_strength ::
                                                       MethodBind
bindSpatialMaterial_get_subsurface_scattering_strength
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_subsurface_scattering_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The strength of the subsurface scattering effect.
get_subsurface_scattering_strength ::
                                     (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_subsurface_scattering_strength cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_subsurface_scattering_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_subsurface_scattering_strength"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_subsurface_scattering_strength

{-# NOINLINE bindSpatialMaterial_get_texture #-}

-- | Returns the @Texture@ associated with the specified @enum TextureParam@.
bindSpatialMaterial_get_texture :: MethodBind
bindSpatialMaterial_get_texture
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Texture@ associated with the specified @enum TextureParam@.
get_texture ::
              (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO Texture
get_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_texture" '[Int]
           (IO Texture)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_texture

{-# NOINLINE bindSpatialMaterial_get_transmission #-}

-- | The color used by the transmission effect. Represents the light passing through an object.
bindSpatialMaterial_get_transmission :: MethodBind
bindSpatialMaterial_get_transmission
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_transmission" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color used by the transmission effect. Represents the light passing through an object.
get_transmission ::
                   (SpatialMaterial :< cls, Object :< cls) => cls -> IO Color
get_transmission cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_transmission
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_transmission" '[]
           (IO Color)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_transmission

{-# NOINLINE bindSpatialMaterial_get_uv1_offset #-}

-- | How much to offset the @UV@ coordinates. This amount will be added to @UV@ in the vertex function. This can be used to offset a texture.
bindSpatialMaterial_get_uv1_offset :: MethodBind
bindSpatialMaterial_get_uv1_offset
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_uv1_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much to offset the @UV@ coordinates. This amount will be added to @UV@ in the vertex function. This can be used to offset a texture.
get_uv1_offset ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Vector3
get_uv1_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_uv1_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_uv1_offset" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_uv1_offset

{-# NOINLINE bindSpatialMaterial_get_uv1_scale #-}

-- | How much to scale the @UV@ coordinates. This is multiplied by @UV@ in the vertex function.
bindSpatialMaterial_get_uv1_scale :: MethodBind
bindSpatialMaterial_get_uv1_scale
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_uv1_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much to scale the @UV@ coordinates. This is multiplied by @UV@ in the vertex function.
get_uv1_scale ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> IO Vector3
get_uv1_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_uv1_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_uv1_scale" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_uv1_scale

{-# NOINLINE bindSpatialMaterial_get_uv1_triplanar_blend_sharpness
             #-}

-- | A lower number blends the texture more softly while a higher number blends the texture more sharply.
bindSpatialMaterial_get_uv1_triplanar_blend_sharpness :: MethodBind
bindSpatialMaterial_get_uv1_triplanar_blend_sharpness
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_uv1_triplanar_blend_sharpness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A lower number blends the texture more softly while a higher number blends the texture more sharply.
get_uv1_triplanar_blend_sharpness ::
                                    (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_uv1_triplanar_blend_sharpness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_uv1_triplanar_blend_sharpness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_uv1_triplanar_blend_sharpness"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_uv1_triplanar_blend_sharpness

{-# NOINLINE bindSpatialMaterial_get_uv2_offset #-}

-- | How much to offset the @UV2@ coordinates. This amount will be added to @UV2@ in the vertex function. This can be used to offset a texture.
bindSpatialMaterial_get_uv2_offset :: MethodBind
bindSpatialMaterial_get_uv2_offset
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_uv2_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much to offset the @UV2@ coordinates. This amount will be added to @UV2@ in the vertex function. This can be used to offset a texture.
get_uv2_offset ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Vector3
get_uv2_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_uv2_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_uv2_offset" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_uv2_offset

{-# NOINLINE bindSpatialMaterial_get_uv2_scale #-}

-- | How much to scale the @UV2@ coordinates. This is multiplied by @UV2@ in the vertex function.
bindSpatialMaterial_get_uv2_scale :: MethodBind
bindSpatialMaterial_get_uv2_scale
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_uv2_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much to scale the @UV2@ coordinates. This is multiplied by @UV2@ in the vertex function.
get_uv2_scale ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> IO Vector3
get_uv2_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_get_uv2_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "get_uv2_scale" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.SpatialMaterial.get_uv2_scale

{-# NOINLINE bindSpatialMaterial_get_uv2_triplanar_blend_sharpness
             #-}

-- | A lower number blends the texture more softly while a higher number blends the texture more sharply.
bindSpatialMaterial_get_uv2_triplanar_blend_sharpness :: MethodBind
bindSpatialMaterial_get_uv2_triplanar_blend_sharpness
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "get_uv2_triplanar_blend_sharpness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A lower number blends the texture more softly while a higher number blends the texture more sharply.
get_uv2_triplanar_blend_sharpness ::
                                    (SpatialMaterial :< cls, Object :< cls) => cls -> IO Float
get_uv2_triplanar_blend_sharpness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_get_uv2_triplanar_blend_sharpness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "get_uv2_triplanar_blend_sharpness"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.get_uv2_triplanar_blend_sharpness

{-# NOINLINE bindSpatialMaterial_is_depth_deep_parallax_enabled #-}

-- | If @true@, the shader will read depth texture at multiple points along the view ray to determine occlusion and parrallax. This can be very performance demanding, but results in more realistic looking depth mapping.
bindSpatialMaterial_is_depth_deep_parallax_enabled :: MethodBind
bindSpatialMaterial_is_depth_deep_parallax_enabled
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "is_depth_deep_parallax_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the shader will read depth texture at multiple points along the view ray to determine occlusion and parrallax. This can be very performance demanding, but results in more realistic looking depth mapping.
is_depth_deep_parallax_enabled ::
                                 (SpatialMaterial :< cls, Object :< cls) => cls -> IO Bool
is_depth_deep_parallax_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_is_depth_deep_parallax_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "is_depth_deep_parallax_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.is_depth_deep_parallax_enabled

{-# NOINLINE bindSpatialMaterial_is_grow_enabled #-}

-- | If @true@, enables the vertex grow setting. See @params_grow_amount@.
bindSpatialMaterial_is_grow_enabled :: MethodBind
bindSpatialMaterial_is_grow_enabled
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "is_grow_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the vertex grow setting. See @params_grow_amount@.
is_grow_enabled ::
                  (SpatialMaterial :< cls, Object :< cls) => cls -> IO Bool
is_grow_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_is_grow_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "is_grow_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.SpatialMaterial.is_grow_enabled

{-# NOINLINE bindSpatialMaterial_is_proximity_fade_enabled #-}

-- | If @true@, the proximity fade effect is enabled. The proximity fade effect fades out each pixel based on its distance to another object.
bindSpatialMaterial_is_proximity_fade_enabled :: MethodBind
bindSpatialMaterial_is_proximity_fade_enabled
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "is_proximity_fade_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the proximity fade effect is enabled. The proximity fade effect fades out each pixel based on its distance to another object.
is_proximity_fade_enabled ::
                            (SpatialMaterial :< cls, Object :< cls) => cls -> IO Bool
is_proximity_fade_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_is_proximity_fade_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "is_proximity_fade_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.SpatialMaterial.is_proximity_fade_enabled

{-# NOINLINE bindSpatialMaterial_set_albedo #-}

-- | The material's base color.
bindSpatialMaterial_set_albedo :: MethodBind
bindSpatialMaterial_set_albedo
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_albedo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material's base color.
set_albedo ::
             (SpatialMaterial :< cls, Object :< cls) => cls -> Color -> IO ()
set_albedo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_albedo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_albedo" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_albedo

{-# NOINLINE bindSpatialMaterial_set_alpha_scissor_threshold #-}

-- | Threshold at which the alpha scissor will discard values.
bindSpatialMaterial_set_alpha_scissor_threshold :: MethodBind
bindSpatialMaterial_set_alpha_scissor_threshold
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_alpha_scissor_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Threshold at which the alpha scissor will discard values.
set_alpha_scissor_threshold ::
                              (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_alpha_scissor_threshold cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_alpha_scissor_threshold
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_alpha_scissor_threshold"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_alpha_scissor_threshold

{-# NOINLINE bindSpatialMaterial_set_anisotropy #-}

-- | The strength of the anisotropy effect. This is multiplied by @anisotropy_flowmap@'s alpha channel if a texture is defined there and the texture contains an alpha channel.
bindSpatialMaterial_set_anisotropy :: MethodBind
bindSpatialMaterial_set_anisotropy
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_anisotropy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The strength of the anisotropy effect. This is multiplied by @anisotropy_flowmap@'s alpha channel if a texture is defined there and the texture contains an alpha channel.
set_anisotropy ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_anisotropy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_anisotropy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_anisotropy" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_anisotropy

{-# NOINLINE bindSpatialMaterial_set_ao_light_affect #-}

-- | Amount that ambient occlusion affects lighting from lights. If @0@, ambient occlusion only affects ambient light. If @1@, ambient occlusion affects lights just as much as it affects ambient light. This can be used to impact the strength of the ambient occlusion effect, but typically looks unrealistic.
bindSpatialMaterial_set_ao_light_affect :: MethodBind
bindSpatialMaterial_set_ao_light_affect
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_ao_light_affect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount that ambient occlusion affects lighting from lights. If @0@, ambient occlusion only affects ambient light. If @1@, ambient occlusion affects lights just as much as it affects ambient light. This can be used to impact the strength of the ambient occlusion effect, but typically looks unrealistic.
set_ao_light_affect ::
                      (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_ao_light_affect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_ao_light_affect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_ao_light_affect" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_ao_light_affect

{-# NOINLINE bindSpatialMaterial_set_ao_texture_channel #-}

-- | Specifies the channel of the @ao_texture@ in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
bindSpatialMaterial_set_ao_texture_channel :: MethodBind
bindSpatialMaterial_set_ao_texture_channel
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_ao_texture_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the channel of the @ao_texture@ in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
set_ao_texture_channel ::
                         (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_ao_texture_channel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_ao_texture_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_ao_texture_channel" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_ao_texture_channel

{-# NOINLINE bindSpatialMaterial_set_billboard_mode #-}

-- | Controls how the object faces the camera. See @enum BillboardMode@.
--   			__Note:__ Billboard mode is not suitable for VR because the left-right vector of the camera is not horizontal when the screen is attached to your head instead of on the table. See @url=https://github.com/godotengine/godot/issues/41567@GitHub issue #41567@/url@ for details.
bindSpatialMaterial_set_billboard_mode :: MethodBind
bindSpatialMaterial_set_billboard_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_billboard_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls how the object faces the camera. See @enum BillboardMode@.
--   			__Note:__ Billboard mode is not suitable for VR because the left-right vector of the camera is not horizontal when the screen is attached to your head instead of on the table. See @url=https://github.com/godotengine/godot/issues/41567@GitHub issue #41567@/url@ for details.
set_billboard_mode ::
                     (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_billboard_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_billboard_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_billboard_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_billboard_mode

{-# NOINLINE bindSpatialMaterial_set_blend_mode #-}

-- | The material's blend mode.
--   			__Note:__ Values other than @Mix@ force the object into the transparent pipeline. See @enum BlendMode@.
bindSpatialMaterial_set_blend_mode :: MethodBind
bindSpatialMaterial_set_blend_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material's blend mode.
--   			__Note:__ Values other than @Mix@ force the object into the transparent pipeline. See @enum BlendMode@.
set_blend_mode ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_blend_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_blend_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_blend_mode

{-# NOINLINE bindSpatialMaterial_set_clearcoat #-}

-- | Sets the strength of the clearcoat effect. Setting to @0@ looks the same as disabling the clearcoat effect.
bindSpatialMaterial_set_clearcoat :: MethodBind
bindSpatialMaterial_set_clearcoat
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_clearcoat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the strength of the clearcoat effect. Setting to @0@ looks the same as disabling the clearcoat effect.
set_clearcoat ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_clearcoat cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_clearcoat
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_clearcoat" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_clearcoat

{-# NOINLINE bindSpatialMaterial_set_clearcoat_gloss #-}

-- | Sets the roughness of the clearcoat pass. A higher value results in a smoother clearcoat while a lower value results in a rougher clearcoat.
bindSpatialMaterial_set_clearcoat_gloss :: MethodBind
bindSpatialMaterial_set_clearcoat_gloss
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_clearcoat_gloss" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the roughness of the clearcoat pass. A higher value results in a smoother clearcoat while a lower value results in a rougher clearcoat.
set_clearcoat_gloss ::
                      (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_clearcoat_gloss cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_clearcoat_gloss
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_clearcoat_gloss" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_clearcoat_gloss

{-# NOINLINE bindSpatialMaterial_set_cull_mode #-}

-- | Which side of the object is not drawn when backfaces are rendered. See @enum CullMode@.
bindSpatialMaterial_set_cull_mode :: MethodBind
bindSpatialMaterial_set_cull_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_cull_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Which side of the object is not drawn when backfaces are rendered. See @enum CullMode@.
set_cull_mode ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_cull_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_cull_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_cull_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_cull_mode

{-# NOINLINE bindSpatialMaterial_set_depth_deep_parallax #-}

-- | If @true@, the shader will read depth texture at multiple points along the view ray to determine occlusion and parrallax. This can be very performance demanding, but results in more realistic looking depth mapping.
bindSpatialMaterial_set_depth_deep_parallax :: MethodBind
bindSpatialMaterial_set_depth_deep_parallax
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_depth_deep_parallax" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the shader will read depth texture at multiple points along the view ray to determine occlusion and parrallax. This can be very performance demanding, but results in more realistic looking depth mapping.
set_depth_deep_parallax ::
                          (SpatialMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_depth_deep_parallax cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_depth_deep_parallax
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_depth_deep_parallax"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_depth_deep_parallax

{-# NOINLINE bindSpatialMaterial_set_depth_deep_parallax_flip_binormal
             #-}

-- | If @true@, direction of the binormal is flipped before using in the depth effect. This may be necessary if you have encoded your binormals in a way that is conflicting with the depth effect.
bindSpatialMaterial_set_depth_deep_parallax_flip_binormal ::
                                                          MethodBind
bindSpatialMaterial_set_depth_deep_parallax_flip_binormal
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_depth_deep_parallax_flip_binormal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, direction of the binormal is flipped before using in the depth effect. This may be necessary if you have encoded your binormals in a way that is conflicting with the depth effect.
set_depth_deep_parallax_flip_binormal ::
                                        (SpatialMaterial :< cls, Object :< cls) =>
                                        cls -> Bool -> IO ()
set_depth_deep_parallax_flip_binormal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_depth_deep_parallax_flip_binormal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_depth_deep_parallax_flip_binormal"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_depth_deep_parallax_flip_binormal

{-# NOINLINE bindSpatialMaterial_set_depth_deep_parallax_flip_tangent
             #-}

-- | If @true@, direction of the tangent is flipped before using in the depth effect. This may be necessary if you have encoded your tangents in a way that is conflicting with the depth effect.
bindSpatialMaterial_set_depth_deep_parallax_flip_tangent ::
                                                         MethodBind
bindSpatialMaterial_set_depth_deep_parallax_flip_tangent
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_depth_deep_parallax_flip_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, direction of the tangent is flipped before using in the depth effect. This may be necessary if you have encoded your tangents in a way that is conflicting with the depth effect.
set_depth_deep_parallax_flip_tangent ::
                                       (SpatialMaterial :< cls, Object :< cls) =>
                                       cls -> Bool -> IO ()
set_depth_deep_parallax_flip_tangent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_depth_deep_parallax_flip_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_depth_deep_parallax_flip_tangent"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_depth_deep_parallax_flip_tangent

{-# NOINLINE bindSpatialMaterial_set_depth_deep_parallax_max_layers
             #-}

-- | Number of layers to use when using @depth_deep_parallax@ and the view direction is perpendicular to the surface of the object. A higher number will be more performance demanding while a lower number may not look as crisp.
bindSpatialMaterial_set_depth_deep_parallax_max_layers ::
                                                       MethodBind
bindSpatialMaterial_set_depth_deep_parallax_max_layers
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_depth_deep_parallax_max_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of layers to use when using @depth_deep_parallax@ and the view direction is perpendicular to the surface of the object. A higher number will be more performance demanding while a lower number may not look as crisp.
set_depth_deep_parallax_max_layers ::
                                     (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_depth_deep_parallax_max_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_depth_deep_parallax_max_layers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_depth_deep_parallax_max_layers"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_depth_deep_parallax_max_layers

{-# NOINLINE bindSpatialMaterial_set_depth_deep_parallax_min_layers
             #-}

-- | Number of layers to use when using @depth_deep_parallax@ and the view direction is parallel to the surface of the object. A higher number will be more performance demanding while a lower number may not look as crisp.
bindSpatialMaterial_set_depth_deep_parallax_min_layers ::
                                                       MethodBind
bindSpatialMaterial_set_depth_deep_parallax_min_layers
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_depth_deep_parallax_min_layers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of layers to use when using @depth_deep_parallax@ and the view direction is parallel to the surface of the object. A higher number will be more performance demanding while a lower number may not look as crisp.
set_depth_deep_parallax_min_layers ::
                                     (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_depth_deep_parallax_min_layers cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_depth_deep_parallax_min_layers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_depth_deep_parallax_min_layers"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_depth_deep_parallax_min_layers

{-# NOINLINE bindSpatialMaterial_set_depth_draw_mode #-}

-- | Determines when depth rendering takes place. See @enum DepthDrawMode@. See also @flags_transparent@.
bindSpatialMaterial_set_depth_draw_mode :: MethodBind
bindSpatialMaterial_set_depth_draw_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_depth_draw_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines when depth rendering takes place. See @enum DepthDrawMode@. See also @flags_transparent@.
set_depth_draw_mode ::
                      (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_depth_draw_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_depth_draw_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_depth_draw_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_depth_draw_mode

{-# NOINLINE bindSpatialMaterial_set_depth_scale #-}

-- | Scales the depth offset effect. A higher number will create a larger depth.
bindSpatialMaterial_set_depth_scale :: MethodBind
bindSpatialMaterial_set_depth_scale
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_depth_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the depth offset effect. A higher number will create a larger depth.
set_depth_scale ::
                  (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_depth_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_depth_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_depth_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_depth_scale

{-# NOINLINE bindSpatialMaterial_set_detail_blend_mode #-}

-- | Specifies how the @detail_albedo@ should blend with the current @ALBEDO@. See @enum BlendMode@ for options.
bindSpatialMaterial_set_detail_blend_mode :: MethodBind
bindSpatialMaterial_set_detail_blend_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_detail_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies how the @detail_albedo@ should blend with the current @ALBEDO@. See @enum BlendMode@ for options.
set_detail_blend_mode ::
                        (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_detail_blend_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_detail_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_detail_blend_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_detail_blend_mode

{-# NOINLINE bindSpatialMaterial_set_detail_uv #-}

-- | Specifies whether to use @UV@ or @UV2@ for the detail layer. See @enum DetailUV@ for options.
bindSpatialMaterial_set_detail_uv :: MethodBind
bindSpatialMaterial_set_detail_uv
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_detail_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies whether to use @UV@ or @UV2@ for the detail layer. See @enum DetailUV@ for options.
set_detail_uv ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_detail_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_detail_uv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_detail_uv" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_detail_uv

{-# NOINLINE bindSpatialMaterial_set_diffuse_mode #-}

-- | The algorithm used for diffuse light scattering. See @enum DiffuseMode@.
bindSpatialMaterial_set_diffuse_mode :: MethodBind
bindSpatialMaterial_set_diffuse_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_diffuse_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The algorithm used for diffuse light scattering. See @enum DiffuseMode@.
set_diffuse_mode ::
                   (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_diffuse_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_diffuse_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_diffuse_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_diffuse_mode

{-# NOINLINE bindSpatialMaterial_set_distance_fade #-}

-- | Specifies which type of fade to use. Can be any of the @enum DistanceFadeMode@s.
bindSpatialMaterial_set_distance_fade :: MethodBind
bindSpatialMaterial_set_distance_fade
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_distance_fade" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies which type of fade to use. Can be any of the @enum DistanceFadeMode@s.
set_distance_fade ::
                    (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_distance_fade cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_distance_fade
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_distance_fade" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_distance_fade

{-# NOINLINE bindSpatialMaterial_set_distance_fade_max_distance #-}

-- | Distance at which the object appears fully opaque.
--   			__Note:__ If @distance_fade_max_distance@ is less than @distance_fade_min_distance@, the behavior will be reversed. The object will start to fade away at @distance_fade_max_distance@ and will fully disappear once it reaches @distance_fade_min_distance@.
bindSpatialMaterial_set_distance_fade_max_distance :: MethodBind
bindSpatialMaterial_set_distance_fade_max_distance
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_distance_fade_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance at which the object appears fully opaque.
--   			__Note:__ If @distance_fade_max_distance@ is less than @distance_fade_min_distance@, the behavior will be reversed. The object will start to fade away at @distance_fade_max_distance@ and will fully disappear once it reaches @distance_fade_min_distance@.
set_distance_fade_max_distance ::
                                 (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_distance_fade_max_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_distance_fade_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_distance_fade_max_distance"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_distance_fade_max_distance

{-# NOINLINE bindSpatialMaterial_set_distance_fade_min_distance #-}

-- | Distance at which the object starts to become visible. If the object is less than this distance away, it will be invisible.
--   			__Note:__ If @distance_fade_min_distance@ is greater than @distance_fade_max_distance@, the behavior will be reversed. The object will start to fade away at @distance_fade_max_distance@ and will fully disappear once it reaches @distance_fade_min_distance@.
bindSpatialMaterial_set_distance_fade_min_distance :: MethodBind
bindSpatialMaterial_set_distance_fade_min_distance
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_distance_fade_min_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance at which the object starts to become visible. If the object is less than this distance away, it will be invisible.
--   			__Note:__ If @distance_fade_min_distance@ is greater than @distance_fade_max_distance@, the behavior will be reversed. The object will start to fade away at @distance_fade_max_distance@ and will fully disappear once it reaches @distance_fade_min_distance@.
set_distance_fade_min_distance ::
                                 (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_distance_fade_min_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_distance_fade_min_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_distance_fade_min_distance"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_distance_fade_min_distance

{-# NOINLINE bindSpatialMaterial_set_emission #-}

-- | The emitted light's color. See @emission_enabled@.
bindSpatialMaterial_set_emission :: MethodBind
bindSpatialMaterial_set_emission
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_emission" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The emitted light's color. See @emission_enabled@.
set_emission ::
               (SpatialMaterial :< cls, Object :< cls) => cls -> Color -> IO ()
set_emission cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_emission
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_emission" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_emission

{-# NOINLINE bindSpatialMaterial_set_emission_energy #-}

-- | The emitted light's strength. See @emission_enabled@.
bindSpatialMaterial_set_emission_energy :: MethodBind
bindSpatialMaterial_set_emission_energy
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The emitted light's strength. See @emission_enabled@.
set_emission_energy ::
                      (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_emission_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_emission_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_emission_energy" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_emission_energy

{-# NOINLINE bindSpatialMaterial_set_emission_operator #-}

-- | Sets how @emission@ interacts with @emission_texture@. Can either add or multiply. See @enum EmissionOperator@ for options.
bindSpatialMaterial_set_emission_operator :: MethodBind
bindSpatialMaterial_set_emission_operator
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets how @emission@ interacts with @emission_texture@. Can either add or multiply. See @enum EmissionOperator@ for options.
set_emission_operator ::
                        (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_emission_operator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_emission_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_emission_operator" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_emission_operator

{-# NOINLINE bindSpatialMaterial_set_feature #-}

-- | If @true@, enables the specified @enum Feature@. Many features that are available in @SpatialMaterial@s need to be enabled before use. This way the cost for using the feature is only incurred when specified. Features can also be enabled by setting the corresponding member to @true@.
bindSpatialMaterial_set_feature :: MethodBind
bindSpatialMaterial_set_feature
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the specified @enum Feature@. Many features that are available in @SpatialMaterial@s need to be enabled before use. This way the cost for using the feature is only incurred when specified. Features can also be enabled by setting the corresponding member to @true@.
set_feature ::
              (SpatialMaterial :< cls, Object :< cls) =>
              cls -> Int -> Bool -> IO ()
set_feature cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_feature (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_feature" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_feature

{-# NOINLINE bindSpatialMaterial_set_flag #-}

-- | If @true@, enables the specified flag. Flags are optional behaviour that can be turned on and off. Only one flag can be enabled at a time with this function, the flag enumerators cannot be bit-masked together to enable or disable multiple flags at once. Flags can also be enabled by setting the corresponding member to @true@. See @enum Flags@ enumerator for options.
bindSpatialMaterial_set_flag :: MethodBind
bindSpatialMaterial_set_flag
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the specified flag. Flags are optional behaviour that can be turned on and off. Only one flag can be enabled at a time with this function, the flag enumerators cannot be bit-masked together to enable or disable multiple flags at once. Flags can also be enabled by setting the corresponding member to @true@. See @enum Flags@ enumerator for options.
set_flag ::
           (SpatialMaterial :< cls, Object :< cls) =>
           cls -> Int -> Bool -> IO ()
set_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_flag" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_flag

{-# NOINLINE bindSpatialMaterial_set_grow #-}

-- | Grows object vertices in the direction of their normals.
bindSpatialMaterial_set_grow :: MethodBind
bindSpatialMaterial_set_grow
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_grow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grows object vertices in the direction of their normals.
set_grow ::
           (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_grow cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_grow (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_grow" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_grow

{-# NOINLINE bindSpatialMaterial_set_grow_enabled #-}

-- | If @true@, enables the vertex grow setting. See @params_grow_amount@.
bindSpatialMaterial_set_grow_enabled :: MethodBind
bindSpatialMaterial_set_grow_enabled
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_grow_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the vertex grow setting. See @params_grow_amount@.
set_grow_enabled ::
                   (SpatialMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_grow_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_grow_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_grow_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_grow_enabled

{-# NOINLINE bindSpatialMaterial_set_line_width #-}

-- | Currently unimplemented in Godot.
bindSpatialMaterial_set_line_width :: MethodBind
bindSpatialMaterial_set_line_width
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_line_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Currently unimplemented in Godot.
set_line_width ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_line_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_line_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_line_width" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_line_width

{-# NOINLINE bindSpatialMaterial_set_metallic #-}

-- | A high value makes the material appear more like a metal. Non-metals use their albedo as the diffuse color and add diffuse to the specular reflection. With non-metals, the reflection appears on top of the albedo color. Metals use their albedo as a multiplier to the specular reflection and set the diffuse color to black resulting in a tinted reflection. Materials work better when fully metal or fully non-metal, values between @0@ and @1@ should only be used for blending between metal and non-metal sections. To alter the amount of reflection use @roughness@.
bindSpatialMaterial_set_metallic :: MethodBind
bindSpatialMaterial_set_metallic
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_metallic" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A high value makes the material appear more like a metal. Non-metals use their albedo as the diffuse color and add diffuse to the specular reflection. With non-metals, the reflection appears on top of the albedo color. Metals use their albedo as a multiplier to the specular reflection and set the diffuse color to black resulting in a tinted reflection. Materials work better when fully metal or fully non-metal, values between @0@ and @1@ should only be used for blending between metal and non-metal sections. To alter the amount of reflection use @roughness@.
set_metallic ::
               (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_metallic cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_metallic
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_metallic" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_metallic

{-# NOINLINE bindSpatialMaterial_set_metallic_texture_channel #-}

-- | Specifies the channel of the @metallic_texture@ in which the metallic information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
bindSpatialMaterial_set_metallic_texture_channel :: MethodBind
bindSpatialMaterial_set_metallic_texture_channel
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_metallic_texture_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the channel of the @metallic_texture@ in which the metallic information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
set_metallic_texture_channel ::
                               (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_metallic_texture_channel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_metallic_texture_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_metallic_texture_channel"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_metallic_texture_channel

{-# NOINLINE bindSpatialMaterial_set_normal_scale #-}

-- | The strength of the normal map's effect.
bindSpatialMaterial_set_normal_scale :: MethodBind
bindSpatialMaterial_set_normal_scale
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_normal_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The strength of the normal map's effect.
set_normal_scale ::
                   (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_normal_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_normal_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_normal_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_normal_scale

{-# NOINLINE bindSpatialMaterial_set_particles_anim_h_frames #-}

-- | The number of horizontal frames in the particle sprite sheet. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
bindSpatialMaterial_set_particles_anim_h_frames :: MethodBind
bindSpatialMaterial_set_particles_anim_h_frames
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_particles_anim_h_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of horizontal frames in the particle sprite sheet. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
set_particles_anim_h_frames ::
                              (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_particles_anim_h_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_particles_anim_h_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_particles_anim_h_frames"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_particles_anim_h_frames

{-# NOINLINE bindSpatialMaterial_set_particles_anim_loop #-}

-- | If @true@, particle animations are looped. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
bindSpatialMaterial_set_particles_anim_loop :: MethodBind
bindSpatialMaterial_set_particles_anim_loop
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_particles_anim_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particle animations are looped. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
set_particles_anim_loop ::
                          (SpatialMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_particles_anim_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_particles_anim_loop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_particles_anim_loop"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_particles_anim_loop

{-# NOINLINE bindSpatialMaterial_set_particles_anim_v_frames #-}

-- | The number of vertical frames in the particle sprite sheet. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
bindSpatialMaterial_set_particles_anim_v_frames :: MethodBind
bindSpatialMaterial_set_particles_anim_v_frames
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_particles_anim_v_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of vertical frames in the particle sprite sheet. Only enabled when using @BILLBOARD_PARTICLES@. See @params_billboard_mode@.
set_particles_anim_v_frames ::
                              (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_particles_anim_v_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_particles_anim_v_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_particles_anim_v_frames"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_particles_anim_v_frames

{-# NOINLINE bindSpatialMaterial_set_point_size #-}

-- | The point size in pixels. See @flags_use_point_size@.
bindSpatialMaterial_set_point_size :: MethodBind
bindSpatialMaterial_set_point_size
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_point_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The point size in pixels. See @flags_use_point_size@.
set_point_size ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_point_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_point_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_point_size" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_point_size

{-# NOINLINE bindSpatialMaterial_set_proximity_fade #-}

-- | If @true@, the proximity fade effect is enabled. The proximity fade effect fades out each pixel based on its distance to another object.
bindSpatialMaterial_set_proximity_fade :: MethodBind
bindSpatialMaterial_set_proximity_fade
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_proximity_fade" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the proximity fade effect is enabled. The proximity fade effect fades out each pixel based on its distance to another object.
set_proximity_fade ::
                     (SpatialMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_proximity_fade cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_proximity_fade
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_proximity_fade" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_proximity_fade

{-# NOINLINE bindSpatialMaterial_set_proximity_fade_distance #-}

-- | Distance over which the fade effect takes place. The larger the distance the longer it takes for an object to fade.
bindSpatialMaterial_set_proximity_fade_distance :: MethodBind
bindSpatialMaterial_set_proximity_fade_distance
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_proximity_fade_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance over which the fade effect takes place. The larger the distance the longer it takes for an object to fade.
set_proximity_fade_distance ::
                              (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_proximity_fade_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_proximity_fade_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_proximity_fade_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_proximity_fade_distance

{-# NOINLINE bindSpatialMaterial_set_refraction #-}

-- | The strength of the refraction effect. Higher values result in a more distorted appearance for the refraction.
bindSpatialMaterial_set_refraction :: MethodBind
bindSpatialMaterial_set_refraction
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_refraction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The strength of the refraction effect. Higher values result in a more distorted appearance for the refraction.
set_refraction ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_refraction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_refraction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_refraction" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_refraction

{-# NOINLINE bindSpatialMaterial_set_refraction_texture_channel #-}

-- | Specifies the channel of the @refraction_texture@ in which the refraction information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
bindSpatialMaterial_set_refraction_texture_channel :: MethodBind
bindSpatialMaterial_set_refraction_texture_channel
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_refraction_texture_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the channel of the @refraction_texture@ in which the refraction information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
set_refraction_texture_channel ::
                                 (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_refraction_texture_channel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_refraction_texture_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_refraction_texture_channel"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_refraction_texture_channel

{-# NOINLINE bindSpatialMaterial_set_rim #-}

-- | Sets the strength of the rim lighting effect.
bindSpatialMaterial_set_rim :: MethodBind
bindSpatialMaterial_set_rim
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_rim" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the strength of the rim lighting effect.
set_rim ::
          (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_rim cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_rim (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_rim" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_rim

{-# NOINLINE bindSpatialMaterial_set_rim_tint #-}

-- | The amount of to blend light and albedo color when rendering rim effect. If @0@ the light color is used, while @1@ means albedo color is used. An intermediate value generally works best.
bindSpatialMaterial_set_rim_tint :: MethodBind
bindSpatialMaterial_set_rim_tint
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_rim_tint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of to blend light and albedo color when rendering rim effect. If @0@ the light color is used, while @1@ means albedo color is used. An intermediate value generally works best.
set_rim_tint ::
               (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_rim_tint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_rim_tint
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_rim_tint" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_rim_tint

{-# NOINLINE bindSpatialMaterial_set_roughness #-}

-- | Surface reflection. A value of @0@ represents a perfect mirror while a value of @1@ completely blurs the reflection. See also @metallic@.
bindSpatialMaterial_set_roughness :: MethodBind
bindSpatialMaterial_set_roughness
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_roughness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Surface reflection. A value of @0@ represents a perfect mirror while a value of @1@ completely blurs the reflection. See also @metallic@.
set_roughness ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_roughness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_roughness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_roughness" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_roughness

{-# NOINLINE bindSpatialMaterial_set_roughness_texture_channel #-}

-- | Specifies the channel of the @ao_texture@ in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
bindSpatialMaterial_set_roughness_texture_channel :: MethodBind
bindSpatialMaterial_set_roughness_texture_channel
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_roughness_texture_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the channel of the @ao_texture@ in which the ambient occlusion information is stored. This is useful when you store the information for multiple effects in a single texture. For example if you stored metallic in the red channel, roughness in the blue, and ambient occlusion in the green you could reduce the number of textures you use.
set_roughness_texture_channel ::
                                (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_roughness_texture_channel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_roughness_texture_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_roughness_texture_channel"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_roughness_texture_channel

{-# NOINLINE bindSpatialMaterial_set_specular #-}

-- | Sets the size of the specular lobe. The specular lobe is the bright spot that is reflected from light sources.
--   			__Note:__ Unlike @metallic@, this is not energy-conserving, so it should be left at @0.5@ in most cases. See also @roughness@.
bindSpatialMaterial_set_specular :: MethodBind
bindSpatialMaterial_set_specular
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_specular" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the specular lobe. The specular lobe is the bright spot that is reflected from light sources.
--   			__Note:__ Unlike @metallic@, this is not energy-conserving, so it should be left at @0.5@ in most cases. See also @roughness@.
set_specular ::
               (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_specular cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_specular
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_specular" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_specular

{-# NOINLINE bindSpatialMaterial_set_specular_mode #-}

-- | The method for rendering the specular blob. See @enum SpecularMode@.
bindSpatialMaterial_set_specular_mode :: MethodBind
bindSpatialMaterial_set_specular_mode
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_specular_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The method for rendering the specular blob. See @enum SpecularMode@.
set_specular_mode ::
                    (SpatialMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_specular_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_specular_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_specular_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_specular_mode

{-# NOINLINE bindSpatialMaterial_set_subsurface_scattering_strength
             #-}

-- | The strength of the subsurface scattering effect.
bindSpatialMaterial_set_subsurface_scattering_strength ::
                                                       MethodBind
bindSpatialMaterial_set_subsurface_scattering_strength
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_subsurface_scattering_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The strength of the subsurface scattering effect.
set_subsurface_scattering_strength ::
                                     (SpatialMaterial :< cls, Object :< cls) =>
                                     cls -> Float -> IO ()
set_subsurface_scattering_strength cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_subsurface_scattering_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_subsurface_scattering_strength"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_subsurface_scattering_strength

{-# NOINLINE bindSpatialMaterial_set_texture #-}

-- | Sets the @Texture@ to be used by the specified @enum TextureParam@. This function is called when setting members ending in @*_texture@.
bindSpatialMaterial_set_texture :: MethodBind
bindSpatialMaterial_set_texture
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Texture@ to be used by the specified @enum TextureParam@. This function is called when setting members ending in @*_texture@.
set_texture ::
              (SpatialMaterial :< cls, Object :< cls) =>
              cls -> Int -> Texture -> IO ()
set_texture cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_texture" '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_texture

{-# NOINLINE bindSpatialMaterial_set_transmission #-}

-- | The color used by the transmission effect. Represents the light passing through an object.
bindSpatialMaterial_set_transmission :: MethodBind
bindSpatialMaterial_set_transmission
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_transmission" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color used by the transmission effect. Represents the light passing through an object.
set_transmission ::
                   (SpatialMaterial :< cls, Object :< cls) => cls -> Color -> IO ()
set_transmission cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_transmission
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_transmission" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_transmission

{-# NOINLINE bindSpatialMaterial_set_uv1_offset #-}

-- | How much to offset the @UV@ coordinates. This amount will be added to @UV@ in the vertex function. This can be used to offset a texture.
bindSpatialMaterial_set_uv1_offset :: MethodBind
bindSpatialMaterial_set_uv1_offset
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_uv1_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much to offset the @UV@ coordinates. This amount will be added to @UV@ in the vertex function. This can be used to offset a texture.
set_uv1_offset ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_uv1_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_uv1_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_uv1_offset" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_uv1_offset

{-# NOINLINE bindSpatialMaterial_set_uv1_scale #-}

-- | How much to scale the @UV@ coordinates. This is multiplied by @UV@ in the vertex function.
bindSpatialMaterial_set_uv1_scale :: MethodBind
bindSpatialMaterial_set_uv1_scale
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_uv1_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much to scale the @UV@ coordinates. This is multiplied by @UV@ in the vertex function.
set_uv1_scale ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_uv1_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_uv1_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_uv1_scale" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_uv1_scale

{-# NOINLINE bindSpatialMaterial_set_uv1_triplanar_blend_sharpness
             #-}

-- | A lower number blends the texture more softly while a higher number blends the texture more sharply.
bindSpatialMaterial_set_uv1_triplanar_blend_sharpness :: MethodBind
bindSpatialMaterial_set_uv1_triplanar_blend_sharpness
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_uv1_triplanar_blend_sharpness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A lower number blends the texture more softly while a higher number blends the texture more sharply.
set_uv1_triplanar_blend_sharpness ::
                                    (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_uv1_triplanar_blend_sharpness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_uv1_triplanar_blend_sharpness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_uv1_triplanar_blend_sharpness"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_uv1_triplanar_blend_sharpness

{-# NOINLINE bindSpatialMaterial_set_uv2_offset #-}

-- | How much to offset the @UV2@ coordinates. This amount will be added to @UV2@ in the vertex function. This can be used to offset a texture.
bindSpatialMaterial_set_uv2_offset :: MethodBind
bindSpatialMaterial_set_uv2_offset
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_uv2_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much to offset the @UV2@ coordinates. This amount will be added to @UV2@ in the vertex function. This can be used to offset a texture.
set_uv2_offset ::
                 (SpatialMaterial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_uv2_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_uv2_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_uv2_offset" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_uv2_offset

{-# NOINLINE bindSpatialMaterial_set_uv2_scale #-}

-- | How much to scale the @UV2@ coordinates. This is multiplied by @UV2@ in the vertex function.
bindSpatialMaterial_set_uv2_scale :: MethodBind
bindSpatialMaterial_set_uv2_scale
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_uv2_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much to scale the @UV2@ coordinates. This is multiplied by @UV2@ in the vertex function.
set_uv2_scale ::
                (SpatialMaterial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_uv2_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialMaterial_set_uv2_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial "set_uv2_scale" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.SpatialMaterial.set_uv2_scale

{-# NOINLINE bindSpatialMaterial_set_uv2_triplanar_blend_sharpness
             #-}

-- | A lower number blends the texture more softly while a higher number blends the texture more sharply.
bindSpatialMaterial_set_uv2_triplanar_blend_sharpness :: MethodBind
bindSpatialMaterial_set_uv2_triplanar_blend_sharpness
  = unsafePerformIO $
      withCString "SpatialMaterial" $
        \ clsNamePtr ->
          withCString "set_uv2_triplanar_blend_sharpness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A lower number blends the texture more softly while a higher number blends the texture more sharply.
set_uv2_triplanar_blend_sharpness ::
                                    (SpatialMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_uv2_triplanar_blend_sharpness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialMaterial_set_uv2_triplanar_blend_sharpness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpatialMaterial
           "set_uv2_triplanar_blend_sharpness"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SpatialMaterial.set_uv2_triplanar_blend_sharpness