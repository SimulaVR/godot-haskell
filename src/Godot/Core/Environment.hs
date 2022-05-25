{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Environment
       (Godot.Core.Environment._SSAO_BLUR_DISABLED,
        Godot.Core.Environment._GLOW_BLEND_MODE_SCREEN,
        Godot.Core.Environment._GLOW_BLEND_MODE_SOFTLIGHT,
        Godot.Core.Environment._BG_CLEAR_COLOR,
        Godot.Core.Environment._GLOW_BLEND_MODE_ADDITIVE,
        Godot.Core.Environment._BG_MAX, Godot.Core.Environment._BG_SKY,
        Godot.Core.Environment._DOF_BLUR_QUALITY_LOW,
        Godot.Core.Environment._SSAO_BLUR_3x3,
        Godot.Core.Environment._SSAO_BLUR_1x1,
        Godot.Core.Environment._SSAO_BLUR_2x2,
        Godot.Core.Environment._SSAO_QUALITY_HIGH,
        Godot.Core.Environment._TONE_MAPPER_ACES,
        Godot.Core.Environment._GLOW_BLEND_MODE_REPLACE,
        Godot.Core.Environment._BG_COLOR_SKY,
        Godot.Core.Environment._TONE_MAPPER_REINHARDT,
        Godot.Core.Environment._TONE_MAPPER_LINEAR,
        Godot.Core.Environment._BG_KEEP, Godot.Core.Environment._BG_COLOR,
        Godot.Core.Environment._SSAO_QUALITY_LOW,
        Godot.Core.Environment._BG_CAMERA_FEED,
        Godot.Core.Environment._TONE_MAPPER_FILMIC,
        Godot.Core.Environment._BG_CANVAS,
        Godot.Core.Environment._DOF_BLUR_QUALITY_MEDIUM,
        Godot.Core.Environment._DOF_BLUR_QUALITY_HIGH,
        Godot.Core.Environment._SSAO_QUALITY_MEDIUM,
        Godot.Core.Environment.get_adjustment_brightness,
        Godot.Core.Environment.get_adjustment_color_correction,
        Godot.Core.Environment.get_adjustment_contrast,
        Godot.Core.Environment.get_adjustment_saturation,
        Godot.Core.Environment.get_ambient_light_color,
        Godot.Core.Environment.get_ambient_light_energy,
        Godot.Core.Environment.get_ambient_light_sky_contribution,
        Godot.Core.Environment.get_background,
        Godot.Core.Environment.get_bg_color,
        Godot.Core.Environment.get_bg_energy,
        Godot.Core.Environment.get_camera_feed_id,
        Godot.Core.Environment.get_canvas_max_layer,
        Godot.Core.Environment.get_dof_blur_far_amount,
        Godot.Core.Environment.get_dof_blur_far_distance,
        Godot.Core.Environment.get_dof_blur_far_quality,
        Godot.Core.Environment.get_dof_blur_far_transition,
        Godot.Core.Environment.get_dof_blur_near_amount,
        Godot.Core.Environment.get_dof_blur_near_distance,
        Godot.Core.Environment.get_dof_blur_near_quality,
        Godot.Core.Environment.get_dof_blur_near_transition,
        Godot.Core.Environment.get_fog_color,
        Godot.Core.Environment.get_fog_depth_begin,
        Godot.Core.Environment.get_fog_depth_curve,
        Godot.Core.Environment.get_fog_depth_end,
        Godot.Core.Environment.get_fog_height_curve,
        Godot.Core.Environment.get_fog_height_max,
        Godot.Core.Environment.get_fog_height_min,
        Godot.Core.Environment.get_fog_sun_amount,
        Godot.Core.Environment.get_fog_sun_color,
        Godot.Core.Environment.get_fog_transmit_curve,
        Godot.Core.Environment.get_glow_blend_mode,
        Godot.Core.Environment.get_glow_bloom,
        Godot.Core.Environment.get_glow_hdr_bleed_scale,
        Godot.Core.Environment.get_glow_hdr_bleed_threshold,
        Godot.Core.Environment.get_glow_hdr_luminance_cap,
        Godot.Core.Environment.get_glow_intensity,
        Godot.Core.Environment.get_glow_strength,
        Godot.Core.Environment.get_sky,
        Godot.Core.Environment.get_sky_custom_fov,
        Godot.Core.Environment.get_sky_orientation,
        Godot.Core.Environment.get_sky_rotation,
        Godot.Core.Environment.get_sky_rotation_degrees,
        Godot.Core.Environment.get_ssao_ao_channel_affect,
        Godot.Core.Environment.get_ssao_bias,
        Godot.Core.Environment.get_ssao_blur,
        Godot.Core.Environment.get_ssao_color,
        Godot.Core.Environment.get_ssao_direct_light_affect,
        Godot.Core.Environment.get_ssao_edge_sharpness,
        Godot.Core.Environment.get_ssao_intensity,
        Godot.Core.Environment.get_ssao_intensity2,
        Godot.Core.Environment.get_ssao_quality,
        Godot.Core.Environment.get_ssao_radius,
        Godot.Core.Environment.get_ssao_radius2,
        Godot.Core.Environment.get_ssr_depth_tolerance,
        Godot.Core.Environment.get_ssr_fade_in,
        Godot.Core.Environment.get_ssr_fade_out,
        Godot.Core.Environment.get_ssr_max_steps,
        Godot.Core.Environment.get_tonemap_auto_exposure,
        Godot.Core.Environment.get_tonemap_auto_exposure_grey,
        Godot.Core.Environment.get_tonemap_auto_exposure_max,
        Godot.Core.Environment.get_tonemap_auto_exposure_min,
        Godot.Core.Environment.get_tonemap_auto_exposure_speed,
        Godot.Core.Environment.get_tonemap_exposure,
        Godot.Core.Environment.get_tonemap_white,
        Godot.Core.Environment.get_tonemapper,
        Godot.Core.Environment.is_adjustment_enabled,
        Godot.Core.Environment.is_dof_blur_far_enabled,
        Godot.Core.Environment.is_dof_blur_near_enabled,
        Godot.Core.Environment.is_fog_depth_enabled,
        Godot.Core.Environment.is_fog_enabled,
        Godot.Core.Environment.is_fog_height_enabled,
        Godot.Core.Environment.is_fog_transmit_enabled,
        Godot.Core.Environment.is_glow_bicubic_upscale_enabled,
        Godot.Core.Environment.is_glow_enabled,
        Godot.Core.Environment.is_glow_level_enabled,
        Godot.Core.Environment.is_ssao_enabled,
        Godot.Core.Environment.is_ssr_enabled,
        Godot.Core.Environment.is_ssr_rough,
        Godot.Core.Environment.set_adjustment_brightness,
        Godot.Core.Environment.set_adjustment_color_correction,
        Godot.Core.Environment.set_adjustment_contrast,
        Godot.Core.Environment.set_adjustment_enable,
        Godot.Core.Environment.set_adjustment_saturation,
        Godot.Core.Environment.set_ambient_light_color,
        Godot.Core.Environment.set_ambient_light_energy,
        Godot.Core.Environment.set_ambient_light_sky_contribution,
        Godot.Core.Environment.set_background,
        Godot.Core.Environment.set_bg_color,
        Godot.Core.Environment.set_bg_energy,
        Godot.Core.Environment.set_camera_feed_id,
        Godot.Core.Environment.set_canvas_max_layer,
        Godot.Core.Environment.set_dof_blur_far_amount,
        Godot.Core.Environment.set_dof_blur_far_distance,
        Godot.Core.Environment.set_dof_blur_far_enabled,
        Godot.Core.Environment.set_dof_blur_far_quality,
        Godot.Core.Environment.set_dof_blur_far_transition,
        Godot.Core.Environment.set_dof_blur_near_amount,
        Godot.Core.Environment.set_dof_blur_near_distance,
        Godot.Core.Environment.set_dof_blur_near_enabled,
        Godot.Core.Environment.set_dof_blur_near_quality,
        Godot.Core.Environment.set_dof_blur_near_transition,
        Godot.Core.Environment.set_fog_color,
        Godot.Core.Environment.set_fog_depth_begin,
        Godot.Core.Environment.set_fog_depth_curve,
        Godot.Core.Environment.set_fog_depth_enabled,
        Godot.Core.Environment.set_fog_depth_end,
        Godot.Core.Environment.set_fog_enabled,
        Godot.Core.Environment.set_fog_height_curve,
        Godot.Core.Environment.set_fog_height_enabled,
        Godot.Core.Environment.set_fog_height_max,
        Godot.Core.Environment.set_fog_height_min,
        Godot.Core.Environment.set_fog_sun_amount,
        Godot.Core.Environment.set_fog_sun_color,
        Godot.Core.Environment.set_fog_transmit_curve,
        Godot.Core.Environment.set_fog_transmit_enabled,
        Godot.Core.Environment.set_glow_bicubic_upscale,
        Godot.Core.Environment.set_glow_blend_mode,
        Godot.Core.Environment.set_glow_bloom,
        Godot.Core.Environment.set_glow_enabled,
        Godot.Core.Environment.set_glow_hdr_bleed_scale,
        Godot.Core.Environment.set_glow_hdr_bleed_threshold,
        Godot.Core.Environment.set_glow_hdr_luminance_cap,
        Godot.Core.Environment.set_glow_intensity,
        Godot.Core.Environment.set_glow_level,
        Godot.Core.Environment.set_glow_strength,
        Godot.Core.Environment.set_sky,
        Godot.Core.Environment.set_sky_custom_fov,
        Godot.Core.Environment.set_sky_orientation,
        Godot.Core.Environment.set_sky_rotation,
        Godot.Core.Environment.set_sky_rotation_degrees,
        Godot.Core.Environment.set_ssao_ao_channel_affect,
        Godot.Core.Environment.set_ssao_bias,
        Godot.Core.Environment.set_ssao_blur,
        Godot.Core.Environment.set_ssao_color,
        Godot.Core.Environment.set_ssao_direct_light_affect,
        Godot.Core.Environment.set_ssao_edge_sharpness,
        Godot.Core.Environment.set_ssao_enabled,
        Godot.Core.Environment.set_ssao_intensity,
        Godot.Core.Environment.set_ssao_intensity2,
        Godot.Core.Environment.set_ssao_quality,
        Godot.Core.Environment.set_ssao_radius,
        Godot.Core.Environment.set_ssao_radius2,
        Godot.Core.Environment.set_ssr_depth_tolerance,
        Godot.Core.Environment.set_ssr_enabled,
        Godot.Core.Environment.set_ssr_fade_in,
        Godot.Core.Environment.set_ssr_fade_out,
        Godot.Core.Environment.set_ssr_max_steps,
        Godot.Core.Environment.set_ssr_rough,
        Godot.Core.Environment.set_tonemap_auto_exposure,
        Godot.Core.Environment.set_tonemap_auto_exposure_grey,
        Godot.Core.Environment.set_tonemap_auto_exposure_max,
        Godot.Core.Environment.set_tonemap_auto_exposure_min,
        Godot.Core.Environment.set_tonemap_auto_exposure_speed,
        Godot.Core.Environment.set_tonemap_exposure,
        Godot.Core.Environment.set_tonemap_white,
        Godot.Core.Environment.set_tonemapper)
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
import Godot.Core.Resource()

_SSAO_BLUR_DISABLED :: Int
_SSAO_BLUR_DISABLED = 0

_GLOW_BLEND_MODE_SCREEN :: Int
_GLOW_BLEND_MODE_SCREEN = 1

_GLOW_BLEND_MODE_SOFTLIGHT :: Int
_GLOW_BLEND_MODE_SOFTLIGHT = 2

_BG_CLEAR_COLOR :: Int
_BG_CLEAR_COLOR = 0

_GLOW_BLEND_MODE_ADDITIVE :: Int
_GLOW_BLEND_MODE_ADDITIVE = 0

_BG_MAX :: Int
_BG_MAX = 7

_BG_SKY :: Int
_BG_SKY = 2

_DOF_BLUR_QUALITY_LOW :: Int
_DOF_BLUR_QUALITY_LOW = 0

_SSAO_BLUR_3x3 :: Int
_SSAO_BLUR_3x3 = 3

_SSAO_BLUR_1x1 :: Int
_SSAO_BLUR_1x1 = 1

_SSAO_BLUR_2x2 :: Int
_SSAO_BLUR_2x2 = 2

_SSAO_QUALITY_HIGH :: Int
_SSAO_QUALITY_HIGH = 2

_TONE_MAPPER_ACES :: Int
_TONE_MAPPER_ACES = 3

_GLOW_BLEND_MODE_REPLACE :: Int
_GLOW_BLEND_MODE_REPLACE = 3

_BG_COLOR_SKY :: Int
_BG_COLOR_SKY = 3

_TONE_MAPPER_REINHARDT :: Int
_TONE_MAPPER_REINHARDT = 1

_TONE_MAPPER_LINEAR :: Int
_TONE_MAPPER_LINEAR = 0

_BG_KEEP :: Int
_BG_KEEP = 5

_BG_COLOR :: Int
_BG_COLOR = 1

_SSAO_QUALITY_LOW :: Int
_SSAO_QUALITY_LOW = 0

_BG_CAMERA_FEED :: Int
_BG_CAMERA_FEED = 6

_TONE_MAPPER_FILMIC :: Int
_TONE_MAPPER_FILMIC = 2

_BG_CANVAS :: Int
_BG_CANVAS = 4

_DOF_BLUR_QUALITY_MEDIUM :: Int
_DOF_BLUR_QUALITY_MEDIUM = 1

_DOF_BLUR_QUALITY_HIGH :: Int
_DOF_BLUR_QUALITY_HIGH = 2

_SSAO_QUALITY_MEDIUM :: Int
_SSAO_QUALITY_MEDIUM = 1

instance NodeProperty Environment "adjustment_brightness" Float
           'False
         where
        nodeProperty
          = (get_adjustment_brightness,
             wrapDroppingSetter set_adjustment_brightness, Nothing)

instance NodeProperty Environment "adjustment_color_correction"
           Texture
           'False
         where
        nodeProperty
          = (get_adjustment_color_correction,
             wrapDroppingSetter set_adjustment_color_correction, Nothing)

instance NodeProperty Environment "adjustment_contrast" Float
           'False
         where
        nodeProperty
          = (get_adjustment_contrast,
             wrapDroppingSetter set_adjustment_contrast, Nothing)

instance NodeProperty Environment "adjustment_enabled" Bool 'False
         where
        nodeProperty
          = (is_adjustment_enabled, wrapDroppingSetter set_adjustment_enable,
             Nothing)

instance NodeProperty Environment "adjustment_saturation" Float
           'False
         where
        nodeProperty
          = (get_adjustment_saturation,
             wrapDroppingSetter set_adjustment_saturation, Nothing)

instance NodeProperty Environment "ambient_light_color" Color
           'False
         where
        nodeProperty
          = (get_ambient_light_color,
             wrapDroppingSetter set_ambient_light_color, Nothing)

instance NodeProperty Environment "ambient_light_energy" Float
           'False
         where
        nodeProperty
          = (get_ambient_light_energy,
             wrapDroppingSetter set_ambient_light_energy, Nothing)

instance NodeProperty Environment "ambient_light_sky_contribution"
           Float
           'False
         where
        nodeProperty
          = (get_ambient_light_sky_contribution,
             wrapDroppingSetter set_ambient_light_sky_contribution, Nothing)

instance NodeProperty Environment "auto_exposure_enabled" Bool
           'False
         where
        nodeProperty
          = (get_tonemap_auto_exposure,
             wrapDroppingSetter set_tonemap_auto_exposure, Nothing)

instance NodeProperty Environment "auto_exposure_max_luma" Float
           'False
         where
        nodeProperty
          = (get_tonemap_auto_exposure_max,
             wrapDroppingSetter set_tonemap_auto_exposure_max, Nothing)

instance NodeProperty Environment "auto_exposure_min_luma" Float
           'False
         where
        nodeProperty
          = (get_tonemap_auto_exposure_min,
             wrapDroppingSetter set_tonemap_auto_exposure_min, Nothing)

instance NodeProperty Environment "auto_exposure_scale" Float
           'False
         where
        nodeProperty
          = (get_tonemap_auto_exposure_grey,
             wrapDroppingSetter set_tonemap_auto_exposure_grey, Nothing)

instance NodeProperty Environment "auto_exposure_speed" Float
           'False
         where
        nodeProperty
          = (get_tonemap_auto_exposure_speed,
             wrapDroppingSetter set_tonemap_auto_exposure_speed, Nothing)

instance NodeProperty Environment "background_camera_feed_id" Int
           'False
         where
        nodeProperty
          = (get_camera_feed_id, wrapDroppingSetter set_camera_feed_id,
             Nothing)

instance NodeProperty Environment "background_canvas_max_layer" Int
           'False
         where
        nodeProperty
          = (get_canvas_max_layer, wrapDroppingSetter set_canvas_max_layer,
             Nothing)

instance NodeProperty Environment "background_color" Color 'False
         where
        nodeProperty
          = (get_bg_color, wrapDroppingSetter set_bg_color, Nothing)

instance NodeProperty Environment "background_energy" Float 'False
         where
        nodeProperty
          = (get_bg_energy, wrapDroppingSetter set_bg_energy, Nothing)

instance NodeProperty Environment "background_mode" Int 'False
         where
        nodeProperty
          = (get_background, wrapDroppingSetter set_background, Nothing)

instance NodeProperty Environment "background_sky" Sky 'False where
        nodeProperty = (get_sky, wrapDroppingSetter set_sky, Nothing)

instance NodeProperty Environment "background_sky_custom_fov" Float
           'False
         where
        nodeProperty
          = (get_sky_custom_fov, wrapDroppingSetter set_sky_custom_fov,
             Nothing)

instance NodeProperty Environment "background_sky_orientation"
           Basis
           'False
         where
        nodeProperty
          = (get_sky_orientation, wrapDroppingSetter set_sky_orientation,
             Nothing)

instance NodeProperty Environment "background_sky_rotation" Vector3
           'False
         where
        nodeProperty
          = (get_sky_rotation, wrapDroppingSetter set_sky_rotation, Nothing)

instance NodeProperty Environment "background_sky_rotation_degrees"
           Vector3
           'False
         where
        nodeProperty
          = (get_sky_rotation_degrees,
             wrapDroppingSetter set_sky_rotation_degrees, Nothing)

instance NodeProperty Environment "dof_blur_far_amount" Float
           'False
         where
        nodeProperty
          = (get_dof_blur_far_amount,
             wrapDroppingSetter set_dof_blur_far_amount, Nothing)

instance NodeProperty Environment "dof_blur_far_distance" Float
           'False
         where
        nodeProperty
          = (get_dof_blur_far_distance,
             wrapDroppingSetter set_dof_blur_far_distance, Nothing)

instance NodeProperty Environment "dof_blur_far_enabled" Bool
           'False
         where
        nodeProperty
          = (is_dof_blur_far_enabled,
             wrapDroppingSetter set_dof_blur_far_enabled, Nothing)

instance NodeProperty Environment "dof_blur_far_quality" Int 'False
         where
        nodeProperty
          = (get_dof_blur_far_quality,
             wrapDroppingSetter set_dof_blur_far_quality, Nothing)

instance NodeProperty Environment "dof_blur_far_transition" Float
           'False
         where
        nodeProperty
          = (get_dof_blur_far_transition,
             wrapDroppingSetter set_dof_blur_far_transition, Nothing)

instance NodeProperty Environment "dof_blur_near_amount" Float
           'False
         where
        nodeProperty
          = (get_dof_blur_near_amount,
             wrapDroppingSetter set_dof_blur_near_amount, Nothing)

instance NodeProperty Environment "dof_blur_near_distance" Float
           'False
         where
        nodeProperty
          = (get_dof_blur_near_distance,
             wrapDroppingSetter set_dof_blur_near_distance, Nothing)

instance NodeProperty Environment "dof_blur_near_enabled" Bool
           'False
         where
        nodeProperty
          = (is_dof_blur_near_enabled,
             wrapDroppingSetter set_dof_blur_near_enabled, Nothing)

instance NodeProperty Environment "dof_blur_near_quality" Int
           'False
         where
        nodeProperty
          = (get_dof_blur_near_quality,
             wrapDroppingSetter set_dof_blur_near_quality, Nothing)

instance NodeProperty Environment "dof_blur_near_transition" Float
           'False
         where
        nodeProperty
          = (get_dof_blur_near_transition,
             wrapDroppingSetter set_dof_blur_near_transition, Nothing)

instance NodeProperty Environment "fog_color" Color 'False where
        nodeProperty
          = (get_fog_color, wrapDroppingSetter set_fog_color, Nothing)

instance NodeProperty Environment "fog_depth_begin" Float 'False
         where
        nodeProperty
          = (get_fog_depth_begin, wrapDroppingSetter set_fog_depth_begin,
             Nothing)

instance NodeProperty Environment "fog_depth_curve" Float 'False
         where
        nodeProperty
          = (get_fog_depth_curve, wrapDroppingSetter set_fog_depth_curve,
             Nothing)

instance NodeProperty Environment "fog_depth_enabled" Bool 'False
         where
        nodeProperty
          = (is_fog_depth_enabled, wrapDroppingSetter set_fog_depth_enabled,
             Nothing)

instance NodeProperty Environment "fog_depth_end" Float 'False
         where
        nodeProperty
          = (get_fog_depth_end, wrapDroppingSetter set_fog_depth_end,
             Nothing)

instance NodeProperty Environment "fog_enabled" Bool 'False where
        nodeProperty
          = (is_fog_enabled, wrapDroppingSetter set_fog_enabled, Nothing)

instance NodeProperty Environment "fog_height_curve" Float 'False
         where
        nodeProperty
          = (get_fog_height_curve, wrapDroppingSetter set_fog_height_curve,
             Nothing)

instance NodeProperty Environment "fog_height_enabled" Bool 'False
         where
        nodeProperty
          = (is_fog_height_enabled,
             wrapDroppingSetter set_fog_height_enabled, Nothing)

instance NodeProperty Environment "fog_height_max" Float 'False
         where
        nodeProperty
          = (get_fog_height_max, wrapDroppingSetter set_fog_height_max,
             Nothing)

instance NodeProperty Environment "fog_height_min" Float 'False
         where
        nodeProperty
          = (get_fog_height_min, wrapDroppingSetter set_fog_height_min,
             Nothing)

instance NodeProperty Environment "fog_sun_amount" Float 'False
         where
        nodeProperty
          = (get_fog_sun_amount, wrapDroppingSetter set_fog_sun_amount,
             Nothing)

instance NodeProperty Environment "fog_sun_color" Color 'False
         where
        nodeProperty
          = (get_fog_sun_color, wrapDroppingSetter set_fog_sun_color,
             Nothing)

instance NodeProperty Environment "fog_transmit_curve" Float 'False
         where
        nodeProperty
          = (get_fog_transmit_curve,
             wrapDroppingSetter set_fog_transmit_curve, Nothing)

instance NodeProperty Environment "fog_transmit_enabled" Bool
           'False
         where
        nodeProperty
          = (is_fog_transmit_enabled,
             wrapDroppingSetter set_fog_transmit_enabled, Nothing)

instance NodeProperty Environment "glow_bicubic_upscale" Bool
           'False
         where
        nodeProperty
          = (is_glow_bicubic_upscale_enabled,
             wrapDroppingSetter set_glow_bicubic_upscale, Nothing)

instance NodeProperty Environment "glow_blend_mode" Int 'False
         where
        nodeProperty
          = (get_glow_blend_mode, wrapDroppingSetter set_glow_blend_mode,
             Nothing)

instance NodeProperty Environment "glow_bloom" Float 'False where
        nodeProperty
          = (get_glow_bloom, wrapDroppingSetter set_glow_bloom, Nothing)

instance NodeProperty Environment "glow_enabled" Bool 'False where
        nodeProperty
          = (is_glow_enabled, wrapDroppingSetter set_glow_enabled, Nothing)

instance NodeProperty Environment "glow_hdr_luminance_cap" Float
           'False
         where
        nodeProperty
          = (get_glow_hdr_luminance_cap,
             wrapDroppingSetter set_glow_hdr_luminance_cap, Nothing)

instance NodeProperty Environment "glow_hdr_scale" Float 'False
         where
        nodeProperty
          = (get_glow_hdr_bleed_scale,
             wrapDroppingSetter set_glow_hdr_bleed_scale, Nothing)

instance NodeProperty Environment "glow_hdr_threshold" Float 'False
         where
        nodeProperty
          = (get_glow_hdr_bleed_threshold,
             wrapDroppingSetter set_glow_hdr_bleed_threshold, Nothing)

instance NodeProperty Environment "glow_intensity" Float 'False
         where
        nodeProperty
          = (get_glow_intensity, wrapDroppingSetter set_glow_intensity,
             Nothing)

instance NodeProperty Environment "glow_levels/1" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 0 is_glow_level_enabled,
             wrapIndexedSetter 0 set_glow_level, Nothing)

instance NodeProperty Environment "glow_levels/2" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 1 is_glow_level_enabled,
             wrapIndexedSetter 1 set_glow_level, Nothing)

instance NodeProperty Environment "glow_levels/3" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 2 is_glow_level_enabled,
             wrapIndexedSetter 2 set_glow_level, Nothing)

instance NodeProperty Environment "glow_levels/4" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 3 is_glow_level_enabled,
             wrapIndexedSetter 3 set_glow_level, Nothing)

instance NodeProperty Environment "glow_levels/5" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 4 is_glow_level_enabled,
             wrapIndexedSetter 4 set_glow_level, Nothing)

instance NodeProperty Environment "glow_levels/6" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 5 is_glow_level_enabled,
             wrapIndexedSetter 5 set_glow_level, Nothing)

instance NodeProperty Environment "glow_levels/7" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 6 is_glow_level_enabled,
             wrapIndexedSetter 6 set_glow_level, Nothing)

instance NodeProperty Environment "glow_strength" Float 'False
         where
        nodeProperty
          = (get_glow_strength, wrapDroppingSetter set_glow_strength,
             Nothing)

instance NodeProperty Environment "ss_reflections_depth_tolerance"
           Float
           'False
         where
        nodeProperty
          = (get_ssr_depth_tolerance,
             wrapDroppingSetter set_ssr_depth_tolerance, Nothing)

instance NodeProperty Environment "ss_reflections_enabled" Bool
           'False
         where
        nodeProperty
          = (is_ssr_enabled, wrapDroppingSetter set_ssr_enabled, Nothing)

instance NodeProperty Environment "ss_reflections_fade_in" Float
           'False
         where
        nodeProperty
          = (get_ssr_fade_in, wrapDroppingSetter set_ssr_fade_in, Nothing)

instance NodeProperty Environment "ss_reflections_fade_out" Float
           'False
         where
        nodeProperty
          = (get_ssr_fade_out, wrapDroppingSetter set_ssr_fade_out, Nothing)

instance NodeProperty Environment "ss_reflections_max_steps" Int
           'False
         where
        nodeProperty
          = (get_ssr_max_steps, wrapDroppingSetter set_ssr_max_steps,
             Nothing)

instance NodeProperty Environment "ss_reflections_roughness" Bool
           'False
         where
        nodeProperty
          = (is_ssr_rough, wrapDroppingSetter set_ssr_rough, Nothing)

instance NodeProperty Environment "ssao_ao_channel_affect" Float
           'False
         where
        nodeProperty
          = (get_ssao_ao_channel_affect,
             wrapDroppingSetter set_ssao_ao_channel_affect, Nothing)

instance NodeProperty Environment "ssao_bias" Float 'False where
        nodeProperty
          = (get_ssao_bias, wrapDroppingSetter set_ssao_bias, Nothing)

instance NodeProperty Environment "ssao_blur" Int 'False where
        nodeProperty
          = (get_ssao_blur, wrapDroppingSetter set_ssao_blur, Nothing)

instance NodeProperty Environment "ssao_color" Color 'False where
        nodeProperty
          = (get_ssao_color, wrapDroppingSetter set_ssao_color, Nothing)

instance NodeProperty Environment "ssao_edge_sharpness" Float
           'False
         where
        nodeProperty
          = (get_ssao_edge_sharpness,
             wrapDroppingSetter set_ssao_edge_sharpness, Nothing)

instance NodeProperty Environment "ssao_enabled" Bool 'False where
        nodeProperty
          = (is_ssao_enabled, wrapDroppingSetter set_ssao_enabled, Nothing)

instance NodeProperty Environment "ssao_intensity" Float 'False
         where
        nodeProperty
          = (get_ssao_intensity, wrapDroppingSetter set_ssao_intensity,
             Nothing)

instance NodeProperty Environment "ssao_intensity2" Float 'False
         where
        nodeProperty
          = (get_ssao_intensity2, wrapDroppingSetter set_ssao_intensity2,
             Nothing)

instance NodeProperty Environment "ssao_light_affect" Float 'False
         where
        nodeProperty
          = (get_ssao_direct_light_affect,
             wrapDroppingSetter set_ssao_direct_light_affect, Nothing)

instance NodeProperty Environment "ssao_quality" Int 'False where
        nodeProperty
          = (get_ssao_quality, wrapDroppingSetter set_ssao_quality, Nothing)

instance NodeProperty Environment "ssao_radius" Float 'False where
        nodeProperty
          = (get_ssao_radius, wrapDroppingSetter set_ssao_radius, Nothing)

instance NodeProperty Environment "ssao_radius2" Float 'False where
        nodeProperty
          = (get_ssao_radius2, wrapDroppingSetter set_ssao_radius2, Nothing)

instance NodeProperty Environment "tonemap_exposure" Float 'False
         where
        nodeProperty
          = (get_tonemap_exposure, wrapDroppingSetter set_tonemap_exposure,
             Nothing)

instance NodeProperty Environment "tonemap_mode" Int 'False where
        nodeProperty
          = (get_tonemapper, wrapDroppingSetter set_tonemapper, Nothing)

instance NodeProperty Environment "tonemap_white" Float 'False
         where
        nodeProperty
          = (get_tonemap_white, wrapDroppingSetter set_tonemap_white,
             Nothing)

{-# NOINLINE bindEnvironment_get_adjustment_brightness #-}

-- | The global brightness value of the rendered scene. Effective only if @adjustment_enabled@ is @true@.
bindEnvironment_get_adjustment_brightness :: MethodBind
bindEnvironment_get_adjustment_brightness
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_adjustment_brightness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global brightness value of the rendered scene. Effective only if @adjustment_enabled@ is @true@.
get_adjustment_brightness ::
                            (Environment :< cls, Object :< cls) => cls -> IO Float
get_adjustment_brightness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_adjustment_brightness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_adjustment_brightness" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_adjustment_brightness

{-# NOINLINE bindEnvironment_get_adjustment_color_correction #-}

-- | Applies the provided @Texture@ resource to affect the global color aspect of the rendered scene. Effective only if @adjustment_enabled@ is @true@.
bindEnvironment_get_adjustment_color_correction :: MethodBind
bindEnvironment_get_adjustment_color_correction
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_adjustment_color_correction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies the provided @Texture@ resource to affect the global color aspect of the rendered scene. Effective only if @adjustment_enabled@ is @true@.
get_adjustment_color_correction ::
                                  (Environment :< cls, Object :< cls) => cls -> IO Texture
get_adjustment_color_correction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_get_adjustment_color_correction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_adjustment_color_correction"
           '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.Environment.get_adjustment_color_correction

{-# NOINLINE bindEnvironment_get_adjustment_contrast #-}

-- | The global contrast value of the rendered scene (default value is 1). Effective only if @adjustment_enabled@ is @true@.
bindEnvironment_get_adjustment_contrast :: MethodBind
bindEnvironment_get_adjustment_contrast
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_adjustment_contrast" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global contrast value of the rendered scene (default value is 1). Effective only if @adjustment_enabled@ is @true@.
get_adjustment_contrast ::
                          (Environment :< cls, Object :< cls) => cls -> IO Float
get_adjustment_contrast cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_adjustment_contrast
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_adjustment_contrast" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_adjustment_contrast

{-# NOINLINE bindEnvironment_get_adjustment_saturation #-}

-- | The global color saturation value of the rendered scene (default value is 1). Effective only if @adjustment_enabled@ is @true@.
bindEnvironment_get_adjustment_saturation :: MethodBind
bindEnvironment_get_adjustment_saturation
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_adjustment_saturation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global color saturation value of the rendered scene (default value is 1). Effective only if @adjustment_enabled@ is @true@.
get_adjustment_saturation ::
                            (Environment :< cls, Object :< cls) => cls -> IO Float
get_adjustment_saturation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_adjustment_saturation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_adjustment_saturation" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_adjustment_saturation

{-# NOINLINE bindEnvironment_get_ambient_light_color #-}

-- | The ambient light's @Color@.
bindEnvironment_get_ambient_light_color :: MethodBind
bindEnvironment_get_ambient_light_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ambient_light_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ambient light's @Color@.
get_ambient_light_color ::
                          (Environment :< cls, Object :< cls) => cls -> IO Color
get_ambient_light_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ambient_light_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ambient_light_color" '[]
           (IO Color)
         where
        nodeMethod = Godot.Core.Environment.get_ambient_light_color

{-# NOINLINE bindEnvironment_get_ambient_light_energy #-}

-- | The ambient light's energy. The higher the value, the stronger the light.
bindEnvironment_get_ambient_light_energy :: MethodBind
bindEnvironment_get_ambient_light_energy
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ambient_light_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ambient light's energy. The higher the value, the stronger the light.
get_ambient_light_energy ::
                           (Environment :< cls, Object :< cls) => cls -> IO Float
get_ambient_light_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ambient_light_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ambient_light_energy" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ambient_light_energy

{-# NOINLINE bindEnvironment_get_ambient_light_sky_contribution #-}

-- | Defines the amount of light that the sky brings on the scene. A value of 0 means that the sky's light emission has no effect on the scene illumination, thus all ambient illumination is provided by the ambient light. On the contrary, a value of 1 means that all the light that affects the scene is provided by the sky, thus the ambient light parameter has no effect on the scene.
bindEnvironment_get_ambient_light_sky_contribution :: MethodBind
bindEnvironment_get_ambient_light_sky_contribution
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ambient_light_sky_contribution" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the amount of light that the sky brings on the scene. A value of 0 means that the sky's light emission has no effect on the scene illumination, thus all ambient illumination is provided by the ambient light. On the contrary, a value of 1 means that all the light that affects the scene is provided by the sky, thus the ambient light parameter has no effect on the scene.
get_ambient_light_sky_contribution ::
                                     (Environment :< cls, Object :< cls) => cls -> IO Float
get_ambient_light_sky_contribution cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_get_ambient_light_sky_contribution
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment
           "get_ambient_light_sky_contribution"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.Environment.get_ambient_light_sky_contribution

{-# NOINLINE bindEnvironment_get_background #-}

-- | The background mode. See @enum BGMode@ for possible values.
bindEnvironment_get_background :: MethodBind
bindEnvironment_get_background
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The background mode. See @enum BGMode@ for possible values.
get_background ::
                 (Environment :< cls, Object :< cls) => cls -> IO Int
get_background cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_background (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_background" '[] (IO Int) where
        nodeMethod = Godot.Core.Environment.get_background

{-# NOINLINE bindEnvironment_get_bg_color #-}

-- | The @Color@ displayed for clear areas of the scene. Only effective when using the @BG_COLOR@ or @BG_COLOR_SKY@ background modes).
bindEnvironment_get_bg_color :: MethodBind
bindEnvironment_get_bg_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Color@ displayed for clear areas of the scene. Only effective when using the @BG_COLOR@ or @BG_COLOR_SKY@ background modes).
get_bg_color ::
               (Environment :< cls, Object :< cls) => cls -> IO Color
get_bg_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_bg_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_bg_color" '[] (IO Color) where
        nodeMethod = Godot.Core.Environment.get_bg_color

{-# NOINLINE bindEnvironment_get_bg_energy #-}

-- | The power of the light emitted by the background.
bindEnvironment_get_bg_energy :: MethodBind
bindEnvironment_get_bg_energy
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_bg_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The power of the light emitted by the background.
get_bg_energy ::
                (Environment :< cls, Object :< cls) => cls -> IO Float
get_bg_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_bg_energy (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_bg_energy" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_bg_energy

{-# NOINLINE bindEnvironment_get_camera_feed_id #-}

-- | The ID of the camera feed to show in the background.
bindEnvironment_get_camera_feed_id :: MethodBind
bindEnvironment_get_camera_feed_id
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_camera_feed_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ID of the camera feed to show in the background.
get_camera_feed_id ::
                     (Environment :< cls, Object :< cls) => cls -> IO Int
get_camera_feed_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_camera_feed_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_camera_feed_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Environment.get_camera_feed_id

{-# NOINLINE bindEnvironment_get_canvas_max_layer #-}

-- | The maximum layer ID to display. Only effective when using the @BG_CANVAS@ background mode.
bindEnvironment_get_canvas_max_layer :: MethodBind
bindEnvironment_get_canvas_max_layer
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_canvas_max_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum layer ID to display. Only effective when using the @BG_CANVAS@ background mode.
get_canvas_max_layer ::
                       (Environment :< cls, Object :< cls) => cls -> IO Int
get_canvas_max_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_canvas_max_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_canvas_max_layer" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Environment.get_canvas_max_layer

{-# NOINLINE bindEnvironment_get_dof_blur_far_amount #-}

-- | The amount of far blur for the depth-of-field effect.
bindEnvironment_get_dof_blur_far_amount :: MethodBind
bindEnvironment_get_dof_blur_far_amount
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_dof_blur_far_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of far blur for the depth-of-field effect.
get_dof_blur_far_amount ::
                          (Environment :< cls, Object :< cls) => cls -> IO Float
get_dof_blur_far_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_dof_blur_far_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_dof_blur_far_amount" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_dof_blur_far_amount

{-# NOINLINE bindEnvironment_get_dof_blur_far_distance #-}

-- | The distance from the camera where the far blur effect affects the rendering.
bindEnvironment_get_dof_blur_far_distance :: MethodBind
bindEnvironment_get_dof_blur_far_distance
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_dof_blur_far_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance from the camera where the far blur effect affects the rendering.
get_dof_blur_far_distance ::
                            (Environment :< cls, Object :< cls) => cls -> IO Float
get_dof_blur_far_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_dof_blur_far_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_dof_blur_far_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_dof_blur_far_distance

{-# NOINLINE bindEnvironment_get_dof_blur_far_quality #-}

-- | The depth-of-field far blur's quality. Higher values can mitigate the visible banding effect seen at higher strengths, but are much slower.
bindEnvironment_get_dof_blur_far_quality :: MethodBind
bindEnvironment_get_dof_blur_far_quality
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_dof_blur_far_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The depth-of-field far blur's quality. Higher values can mitigate the visible banding effect seen at higher strengths, but are much slower.
get_dof_blur_far_quality ::
                           (Environment :< cls, Object :< cls) => cls -> IO Int
get_dof_blur_far_quality cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_dof_blur_far_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_dof_blur_far_quality" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Environment.get_dof_blur_far_quality

{-# NOINLINE bindEnvironment_get_dof_blur_far_transition #-}

-- | The length of the transition between the no-blur area and far blur.
bindEnvironment_get_dof_blur_far_transition :: MethodBind
bindEnvironment_get_dof_blur_far_transition
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_dof_blur_far_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length of the transition between the no-blur area and far blur.
get_dof_blur_far_transition ::
                              (Environment :< cls, Object :< cls) => cls -> IO Float
get_dof_blur_far_transition cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_dof_blur_far_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_dof_blur_far_transition" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_dof_blur_far_transition

{-# NOINLINE bindEnvironment_get_dof_blur_near_amount #-}

-- | The amount of near blur for the depth-of-field effect.
bindEnvironment_get_dof_blur_near_amount :: MethodBind
bindEnvironment_get_dof_blur_near_amount
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_dof_blur_near_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of near blur for the depth-of-field effect.
get_dof_blur_near_amount ::
                           (Environment :< cls, Object :< cls) => cls -> IO Float
get_dof_blur_near_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_dof_blur_near_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_dof_blur_near_amount" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_dof_blur_near_amount

{-# NOINLINE bindEnvironment_get_dof_blur_near_distance #-}

-- | Distance from the camera where the near blur effect affects the rendering.
bindEnvironment_get_dof_blur_near_distance :: MethodBind
bindEnvironment_get_dof_blur_near_distance
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_dof_blur_near_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance from the camera where the near blur effect affects the rendering.
get_dof_blur_near_distance ::
                             (Environment :< cls, Object :< cls) => cls -> IO Float
get_dof_blur_near_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_dof_blur_near_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_dof_blur_near_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_dof_blur_near_distance

{-# NOINLINE bindEnvironment_get_dof_blur_near_quality #-}

-- | The depth-of-field near blur's quality. Higher values can mitigate the visible banding effect seen at higher strengths, but are much slower.
bindEnvironment_get_dof_blur_near_quality :: MethodBind
bindEnvironment_get_dof_blur_near_quality
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_dof_blur_near_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The depth-of-field near blur's quality. Higher values can mitigate the visible banding effect seen at higher strengths, but are much slower.
get_dof_blur_near_quality ::
                            (Environment :< cls, Object :< cls) => cls -> IO Int
get_dof_blur_near_quality cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_dof_blur_near_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_dof_blur_near_quality" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Environment.get_dof_blur_near_quality

{-# NOINLINE bindEnvironment_get_dof_blur_near_transition #-}

-- | The length of the transition between the near blur and no-blur area.
bindEnvironment_get_dof_blur_near_transition :: MethodBind
bindEnvironment_get_dof_blur_near_transition
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_dof_blur_near_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length of the transition between the near blur and no-blur area.
get_dof_blur_near_transition ::
                               (Environment :< cls, Object :< cls) => cls -> IO Float
get_dof_blur_near_transition cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_dof_blur_near_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_dof_blur_near_transition" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_dof_blur_near_transition

{-# NOINLINE bindEnvironment_get_fog_color #-}

-- | The fog's @Color@.
bindEnvironment_get_fog_color :: MethodBind
bindEnvironment_get_fog_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fog's @Color@.
get_fog_color ::
                (Environment :< cls, Object :< cls) => cls -> IO Color
get_fog_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.Environment.get_fog_color

{-# NOINLINE bindEnvironment_get_fog_depth_begin #-}

-- | The fog's depth starting distance from the camera.
bindEnvironment_get_fog_depth_begin :: MethodBind
bindEnvironment_get_fog_depth_begin
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_depth_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fog's depth starting distance from the camera.
get_fog_depth_begin ::
                      (Environment :< cls, Object :< cls) => cls -> IO Float
get_fog_depth_begin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_depth_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_depth_begin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_fog_depth_begin

{-# NOINLINE bindEnvironment_get_fog_depth_curve #-}

-- | The fog depth's intensity curve. A number of presets are available in the __Inspector__ by right-clicking the curve.
bindEnvironment_get_fog_depth_curve :: MethodBind
bindEnvironment_get_fog_depth_curve
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_depth_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fog depth's intensity curve. A number of presets are available in the __Inspector__ by right-clicking the curve.
get_fog_depth_curve ::
                      (Environment :< cls, Object :< cls) => cls -> IO Float
get_fog_depth_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_depth_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_depth_curve" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_fog_depth_curve

{-# NOINLINE bindEnvironment_get_fog_depth_end #-}

-- | The fog's depth end distance from the camera. If this value is set to 0, it will be equal to the current camera's @Camera.far@ value.
bindEnvironment_get_fog_depth_end :: MethodBind
bindEnvironment_get_fog_depth_end
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_depth_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fog's depth end distance from the camera. If this value is set to 0, it will be equal to the current camera's @Camera.far@ value.
get_fog_depth_end ::
                    (Environment :< cls, Object :< cls) => cls -> IO Float
get_fog_depth_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_depth_end
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_depth_end" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_fog_depth_end

{-# NOINLINE bindEnvironment_get_fog_height_curve #-}

-- | The height fog's intensity. A number of presets are available in the __Inspector__ by right-clicking the curve.
bindEnvironment_get_fog_height_curve :: MethodBind
bindEnvironment_get_fog_height_curve
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_height_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The height fog's intensity. A number of presets are available in the __Inspector__ by right-clicking the curve.
get_fog_height_curve ::
                       (Environment :< cls, Object :< cls) => cls -> IO Float
get_fog_height_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_height_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_height_curve" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_fog_height_curve

{-# NOINLINE bindEnvironment_get_fog_height_max #-}

-- | The Y coordinate where the height fog will be the most intense. If this value is greater than @fog_height_min@, fog will be displayed from bottom to top. Otherwise, it will be displayed from top to bottom.
bindEnvironment_get_fog_height_max :: MethodBind
bindEnvironment_get_fog_height_max
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_height_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Y coordinate where the height fog will be the most intense. If this value is greater than @fog_height_min@, fog will be displayed from bottom to top. Otherwise, it will be displayed from top to bottom.
get_fog_height_max ::
                     (Environment :< cls, Object :< cls) => cls -> IO Float
get_fog_height_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_height_max
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_height_max" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_fog_height_max

{-# NOINLINE bindEnvironment_get_fog_height_min #-}

-- | The Y coordinate where the height fog will be the least intense. If this value is greater than @fog_height_max@, fog will be displayed from top to bottom. Otherwise, it will be displayed from bottom to top.
bindEnvironment_get_fog_height_min :: MethodBind
bindEnvironment_get_fog_height_min
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_height_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Y coordinate where the height fog will be the least intense. If this value is greater than @fog_height_max@, fog will be displayed from top to bottom. Otherwise, it will be displayed from bottom to top.
get_fog_height_min ::
                     (Environment :< cls, Object :< cls) => cls -> IO Float
get_fog_height_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_height_min
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_height_min" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_fog_height_min

{-# NOINLINE bindEnvironment_get_fog_sun_amount #-}

-- | The intensity of the depth fog color transition when looking towards the sun. The sun's direction is determined automatically using the DirectionalLight node in the scene.
bindEnvironment_get_fog_sun_amount :: MethodBind
bindEnvironment_get_fog_sun_amount
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_sun_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The intensity of the depth fog color transition when looking towards the sun. The sun's direction is determined automatically using the DirectionalLight node in the scene.
get_fog_sun_amount ::
                     (Environment :< cls, Object :< cls) => cls -> IO Float
get_fog_sun_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_sun_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_sun_amount" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_fog_sun_amount

{-# NOINLINE bindEnvironment_get_fog_sun_color #-}

-- | The depth fog's @Color@ when looking towards the sun.
bindEnvironment_get_fog_sun_color :: MethodBind
bindEnvironment_get_fog_sun_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_sun_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The depth fog's @Color@ when looking towards the sun.
get_fog_sun_color ::
                    (Environment :< cls, Object :< cls) => cls -> IO Color
get_fog_sun_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_sun_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_sun_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.Environment.get_fog_sun_color

{-# NOINLINE bindEnvironment_get_fog_transmit_curve #-}

-- | The intensity of the fog light transmittance effect. Amount of light that the fog transmits.
bindEnvironment_get_fog_transmit_curve :: MethodBind
bindEnvironment_get_fog_transmit_curve
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_fog_transmit_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The intensity of the fog light transmittance effect. Amount of light that the fog transmits.
get_fog_transmit_curve ::
                         (Environment :< cls, Object :< cls) => cls -> IO Float
get_fog_transmit_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_fog_transmit_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_fog_transmit_curve" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_fog_transmit_curve

{-# NOINLINE bindEnvironment_get_glow_blend_mode #-}

-- | The glow blending mode.
bindEnvironment_get_glow_blend_mode :: MethodBind
bindEnvironment_get_glow_blend_mode
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_glow_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The glow blending mode.
get_glow_blend_mode ::
                      (Environment :< cls, Object :< cls) => cls -> IO Int
get_glow_blend_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_glow_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_glow_blend_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Environment.get_glow_blend_mode

{-# NOINLINE bindEnvironment_get_glow_bloom #-}

-- | The bloom's intensity. If set to a value higher than @0@, this will make glow visible in areas darker than the @glow_hdr_threshold@.
bindEnvironment_get_glow_bloom :: MethodBind
bindEnvironment_get_glow_bloom
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_glow_bloom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The bloom's intensity. If set to a value higher than @0@, this will make glow visible in areas darker than the @glow_hdr_threshold@.
get_glow_bloom ::
                 (Environment :< cls, Object :< cls) => cls -> IO Float
get_glow_bloom cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_glow_bloom (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_glow_bloom" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_glow_bloom

{-# NOINLINE bindEnvironment_get_glow_hdr_bleed_scale #-}

-- | The bleed scale of the HDR glow.
bindEnvironment_get_glow_hdr_bleed_scale :: MethodBind
bindEnvironment_get_glow_hdr_bleed_scale
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_glow_hdr_bleed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The bleed scale of the HDR glow.
get_glow_hdr_bleed_scale ::
                           (Environment :< cls, Object :< cls) => cls -> IO Float
get_glow_hdr_bleed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_glow_hdr_bleed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_glow_hdr_bleed_scale" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_glow_hdr_bleed_scale

{-# NOINLINE bindEnvironment_get_glow_hdr_bleed_threshold #-}

-- | The lower threshold of the HDR glow. When using the GLES2 renderer (which doesn't support HDR), this needs to be below @1.0@ for glow to be visible. A value of @0.9@ works well in this case.
bindEnvironment_get_glow_hdr_bleed_threshold :: MethodBind
bindEnvironment_get_glow_hdr_bleed_threshold
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_glow_hdr_bleed_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The lower threshold of the HDR glow. When using the GLES2 renderer (which doesn't support HDR), this needs to be below @1.0@ for glow to be visible. A value of @0.9@ works well in this case.
get_glow_hdr_bleed_threshold ::
                               (Environment :< cls, Object :< cls) => cls -> IO Float
get_glow_hdr_bleed_threshold cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_glow_hdr_bleed_threshold
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_glow_hdr_bleed_threshold" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_glow_hdr_bleed_threshold

{-# NOINLINE bindEnvironment_get_glow_hdr_luminance_cap #-}

-- | The higher threshold of the HDR glow. Areas brighter than this threshold will be clamped for the purposes of the glow effect.
bindEnvironment_get_glow_hdr_luminance_cap :: MethodBind
bindEnvironment_get_glow_hdr_luminance_cap
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_glow_hdr_luminance_cap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The higher threshold of the HDR glow. Areas brighter than this threshold will be clamped for the purposes of the glow effect.
get_glow_hdr_luminance_cap ::
                             (Environment :< cls, Object :< cls) => cls -> IO Float
get_glow_hdr_luminance_cap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_glow_hdr_luminance_cap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_glow_hdr_luminance_cap" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_glow_hdr_luminance_cap

{-# NOINLINE bindEnvironment_get_glow_intensity #-}

-- | The glow intensity. When using the GLES2 renderer, this should be increased to 1.5 to compensate for the lack of HDR rendering.
bindEnvironment_get_glow_intensity :: MethodBind
bindEnvironment_get_glow_intensity
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_glow_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The glow intensity. When using the GLES2 renderer, this should be increased to 1.5 to compensate for the lack of HDR rendering.
get_glow_intensity ::
                     (Environment :< cls, Object :< cls) => cls -> IO Float
get_glow_intensity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_glow_intensity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_glow_intensity" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_glow_intensity

{-# NOINLINE bindEnvironment_get_glow_strength #-}

-- | The glow strength. When using the GLES2 renderer, this should be increased to 1.3 to compensate for the lack of HDR rendering.
bindEnvironment_get_glow_strength :: MethodBind
bindEnvironment_get_glow_strength
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_glow_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The glow strength. When using the GLES2 renderer, this should be increased to 1.3 to compensate for the lack of HDR rendering.
get_glow_strength ::
                    (Environment :< cls, Object :< cls) => cls -> IO Float
get_glow_strength cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_glow_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_glow_strength" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_glow_strength

{-# NOINLINE bindEnvironment_get_sky #-}

-- | The @Sky@ resource defined as background.
bindEnvironment_get_sky :: MethodBind
bindEnvironment_get_sky
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_sky" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource defined as background.
get_sky :: (Environment :< cls, Object :< cls) => cls -> IO Sky
get_sky cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_sky (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_sky" '[] (IO Sky) where
        nodeMethod = Godot.Core.Environment.get_sky

{-# NOINLINE bindEnvironment_get_sky_custom_fov #-}

-- | The @Sky@ resource's custom field of view.
bindEnvironment_get_sky_custom_fov :: MethodBind
bindEnvironment_get_sky_custom_fov
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_sky_custom_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource's custom field of view.
get_sky_custom_fov ::
                     (Environment :< cls, Object :< cls) => cls -> IO Float
get_sky_custom_fov cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_sky_custom_fov
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_sky_custom_fov" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_sky_custom_fov

{-# NOINLINE bindEnvironment_get_sky_orientation #-}

-- | The @Sky@ resource's rotation expressed as a @Basis@.
bindEnvironment_get_sky_orientation :: MethodBind
bindEnvironment_get_sky_orientation
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_sky_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource's rotation expressed as a @Basis@.
get_sky_orientation ::
                      (Environment :< cls, Object :< cls) => cls -> IO Basis
get_sky_orientation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_sky_orientation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_sky_orientation" '[]
           (IO Basis)
         where
        nodeMethod = Godot.Core.Environment.get_sky_orientation

{-# NOINLINE bindEnvironment_get_sky_rotation #-}

-- | The @Sky@ resource's rotation expressed as Euler angles in radians.
bindEnvironment_get_sky_rotation :: MethodBind
bindEnvironment_get_sky_rotation
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_sky_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource's rotation expressed as Euler angles in radians.
get_sky_rotation ::
                   (Environment :< cls, Object :< cls) => cls -> IO Vector3
get_sky_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_sky_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_sky_rotation" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Environment.get_sky_rotation

{-# NOINLINE bindEnvironment_get_sky_rotation_degrees #-}

-- | The @Sky@ resource's rotation expressed as Euler angles in degrees.
bindEnvironment_get_sky_rotation_degrees :: MethodBind
bindEnvironment_get_sky_rotation_degrees
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_sky_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource's rotation expressed as Euler angles in degrees.
get_sky_rotation_degrees ::
                           (Environment :< cls, Object :< cls) => cls -> IO Vector3
get_sky_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_sky_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_sky_rotation_degrees" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Environment.get_sky_rotation_degrees

{-# NOINLINE bindEnvironment_get_ssao_ao_channel_affect #-}

-- | The screen-space ambient occlusion intensity on materials that have an AO texture defined. Values higher than @0@ will make the SSAO effect visible in areas darkened by AO textures.
bindEnvironment_get_ssao_ao_channel_affect :: MethodBind
bindEnvironment_get_ssao_ao_channel_affect
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_ao_channel_affect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion intensity on materials that have an AO texture defined. Values higher than @0@ will make the SSAO effect visible in areas darkened by AO textures.
get_ssao_ao_channel_affect ::
                             (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssao_ao_channel_affect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_ao_channel_affect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_ao_channel_affect" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_ao_channel_affect

{-# NOINLINE bindEnvironment_get_ssao_bias #-}

-- | The screen-space ambient occlusion bias. This should be kept high enough to prevent "smooth" curves from being affected by ambient occlusion.
bindEnvironment_get_ssao_bias :: MethodBind
bindEnvironment_get_ssao_bias
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion bias. This should be kept high enough to prevent "smooth" curves from being affected by ambient occlusion.
get_ssao_bias ::
                (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssao_bias cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_bias (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_bias" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_bias

{-# NOINLINE bindEnvironment_get_ssao_blur #-}

-- | The screen-space ambient occlusion blur quality. See @enum SSAOBlur@ for possible values.
bindEnvironment_get_ssao_blur :: MethodBind
bindEnvironment_get_ssao_blur
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_blur" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion blur quality. See @enum SSAOBlur@ for possible values.
get_ssao_blur ::
                (Environment :< cls, Object :< cls) => cls -> IO Int
get_ssao_blur cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_blur (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_blur" '[] (IO Int) where
        nodeMethod = Godot.Core.Environment.get_ssao_blur

{-# NOINLINE bindEnvironment_get_ssao_color #-}

-- | The screen-space ambient occlusion color.
bindEnvironment_get_ssao_color :: MethodBind
bindEnvironment_get_ssao_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion color.
get_ssao_color ::
                 (Environment :< cls, Object :< cls) => cls -> IO Color
get_ssao_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_color

{-# NOINLINE bindEnvironment_get_ssao_direct_light_affect #-}

-- | The screen-space ambient occlusion intensity in direct light. In real life, ambient occlusion only applies to indirect light, which means its effects can't be seen in direct light. Values higher than @0@ will make the SSAO effect visible in direct light.
bindEnvironment_get_ssao_direct_light_affect :: MethodBind
bindEnvironment_get_ssao_direct_light_affect
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_direct_light_affect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion intensity in direct light. In real life, ambient occlusion only applies to indirect light, which means its effects can't be seen in direct light. Values higher than @0@ will make the SSAO effect visible in direct light.
get_ssao_direct_light_affect ::
                               (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssao_direct_light_affect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_direct_light_affect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_direct_light_affect" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_direct_light_affect

{-# NOINLINE bindEnvironment_get_ssao_edge_sharpness #-}

-- | The screen-space ambient occlusion edge sharpness.
bindEnvironment_get_ssao_edge_sharpness :: MethodBind
bindEnvironment_get_ssao_edge_sharpness
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_edge_sharpness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion edge sharpness.
get_ssao_edge_sharpness ::
                          (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssao_edge_sharpness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_edge_sharpness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_edge_sharpness" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_edge_sharpness

{-# NOINLINE bindEnvironment_get_ssao_intensity #-}

-- | The primary screen-space ambient occlusion intensity. See also @ssao_radius@.
bindEnvironment_get_ssao_intensity :: MethodBind
bindEnvironment_get_ssao_intensity
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The primary screen-space ambient occlusion intensity. See also @ssao_radius@.
get_ssao_intensity ::
                     (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssao_intensity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_intensity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_intensity" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_intensity

{-# NOINLINE bindEnvironment_get_ssao_intensity2 #-}

-- | The secondary screen-space ambient occlusion intensity. See also @ssao_radius2@.
bindEnvironment_get_ssao_intensity2 :: MethodBind
bindEnvironment_get_ssao_intensity2
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_intensity2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The secondary screen-space ambient occlusion intensity. See also @ssao_radius2@.
get_ssao_intensity2 ::
                      (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssao_intensity2 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_intensity2
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_intensity2" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_intensity2

{-# NOINLINE bindEnvironment_get_ssao_quality #-}

-- | The screen-space ambient occlusion quality. Higher qualities will make better use of small objects for ambient occlusion, but are slower.
bindEnvironment_get_ssao_quality :: MethodBind
bindEnvironment_get_ssao_quality
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion quality. Higher qualities will make better use of small objects for ambient occlusion, but are slower.
get_ssao_quality ::
                   (Environment :< cls, Object :< cls) => cls -> IO Int
get_ssao_quality cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_quality" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_quality

{-# NOINLINE bindEnvironment_get_ssao_radius #-}

-- | The primary screen-space ambient occlusion radius.
bindEnvironment_get_ssao_radius :: MethodBind
bindEnvironment_get_ssao_radius
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The primary screen-space ambient occlusion radius.
get_ssao_radius ::
                  (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssao_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_radius

{-# NOINLINE bindEnvironment_get_ssao_radius2 #-}

-- | The secondary screen-space ambient occlusion radius. If set to a value higher than @0@, enables the secondary screen-space ambient occlusion effect which can be used to improve the effect's appearance (at the cost of performance).
bindEnvironment_get_ssao_radius2 :: MethodBind
bindEnvironment_get_ssao_radius2
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssao_radius2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The secondary screen-space ambient occlusion radius. If set to a value higher than @0@, enables the secondary screen-space ambient occlusion effect which can be used to improve the effect's appearance (at the cost of performance).
get_ssao_radius2 ::
                   (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssao_radius2 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssao_radius2
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssao_radius2" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssao_radius2

{-# NOINLINE bindEnvironment_get_ssr_depth_tolerance #-}

-- | The depth tolerance for screen-space reflections.
bindEnvironment_get_ssr_depth_tolerance :: MethodBind
bindEnvironment_get_ssr_depth_tolerance
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssr_depth_tolerance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The depth tolerance for screen-space reflections.
get_ssr_depth_tolerance ::
                          (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssr_depth_tolerance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssr_depth_tolerance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssr_depth_tolerance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssr_depth_tolerance

{-# NOINLINE bindEnvironment_get_ssr_fade_in #-}

-- | The fade-in distance for screen-space reflections. Affects the area from the reflected material to the screen-space reflection).
bindEnvironment_get_ssr_fade_in :: MethodBind
bindEnvironment_get_ssr_fade_in
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssr_fade_in" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fade-in distance for screen-space reflections. Affects the area from the reflected material to the screen-space reflection).
get_ssr_fade_in ::
                  (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssr_fade_in cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssr_fade_in (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssr_fade_in" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssr_fade_in

{-# NOINLINE bindEnvironment_get_ssr_fade_out #-}

-- | The fade-out distance for screen-space reflections. Affects the area from the screen-space reflection to the "global" reflection.
bindEnvironment_get_ssr_fade_out :: MethodBind
bindEnvironment_get_ssr_fade_out
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssr_fade_out" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fade-out distance for screen-space reflections. Affects the area from the screen-space reflection to the "global" reflection.
get_ssr_fade_out ::
                   (Environment :< cls, Object :< cls) => cls -> IO Float
get_ssr_fade_out cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssr_fade_out
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssr_fade_out" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_ssr_fade_out

{-# NOINLINE bindEnvironment_get_ssr_max_steps #-}

-- | The maximum number of steps for screen-space reflections. Higher values are slower.
bindEnvironment_get_ssr_max_steps :: MethodBind
bindEnvironment_get_ssr_max_steps
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_ssr_max_steps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of steps for screen-space reflections. Higher values are slower.
get_ssr_max_steps ::
                    (Environment :< cls, Object :< cls) => cls -> IO Int
get_ssr_max_steps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_ssr_max_steps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_ssr_max_steps" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Environment.get_ssr_max_steps

{-# NOINLINE bindEnvironment_get_tonemap_auto_exposure #-}

-- | If @true@, enables the tonemapping auto exposure mode of the scene renderer. If @true@, the renderer will automatically determine the exposure setting to adapt to the scene's illumination and the observed light.
bindEnvironment_get_tonemap_auto_exposure :: MethodBind
bindEnvironment_get_tonemap_auto_exposure
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_tonemap_auto_exposure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the tonemapping auto exposure mode of the scene renderer. If @true@, the renderer will automatically determine the exposure setting to adapt to the scene's illumination and the observed light.
get_tonemap_auto_exposure ::
                            (Environment :< cls, Object :< cls) => cls -> IO Bool
get_tonemap_auto_exposure cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_tonemap_auto_exposure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_tonemap_auto_exposure" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.get_tonemap_auto_exposure

{-# NOINLINE bindEnvironment_get_tonemap_auto_exposure_grey #-}

-- | The scale of the auto exposure effect. Affects the intensity of auto exposure.
bindEnvironment_get_tonemap_auto_exposure_grey :: MethodBind
bindEnvironment_get_tonemap_auto_exposure_grey
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_tonemap_auto_exposure_grey" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The scale of the auto exposure effect. Affects the intensity of auto exposure.
get_tonemap_auto_exposure_grey ::
                                 (Environment :< cls, Object :< cls) => cls -> IO Float
get_tonemap_auto_exposure_grey cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_get_tonemap_auto_exposure_grey
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_tonemap_auto_exposure_grey"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_tonemap_auto_exposure_grey

{-# NOINLINE bindEnvironment_get_tonemap_auto_exposure_max #-}

-- | The maximum luminance value for the auto exposure.
bindEnvironment_get_tonemap_auto_exposure_max :: MethodBind
bindEnvironment_get_tonemap_auto_exposure_max
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_tonemap_auto_exposure_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum luminance value for the auto exposure.
get_tonemap_auto_exposure_max ::
                                (Environment :< cls, Object :< cls) => cls -> IO Float
get_tonemap_auto_exposure_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_get_tonemap_auto_exposure_max
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_tonemap_auto_exposure_max" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_tonemap_auto_exposure_max

{-# NOINLINE bindEnvironment_get_tonemap_auto_exposure_min #-}

-- | The minimum luminance value for the auto exposure.
bindEnvironment_get_tonemap_auto_exposure_min :: MethodBind
bindEnvironment_get_tonemap_auto_exposure_min
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_tonemap_auto_exposure_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum luminance value for the auto exposure.
get_tonemap_auto_exposure_min ::
                                (Environment :< cls, Object :< cls) => cls -> IO Float
get_tonemap_auto_exposure_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_get_tonemap_auto_exposure_min
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_tonemap_auto_exposure_min" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_tonemap_auto_exposure_min

{-# NOINLINE bindEnvironment_get_tonemap_auto_exposure_speed #-}

-- | The speed of the auto exposure effect. Affects the time needed for the camera to perform auto exposure.
bindEnvironment_get_tonemap_auto_exposure_speed :: MethodBind
bindEnvironment_get_tonemap_auto_exposure_speed
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_tonemap_auto_exposure_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed of the auto exposure effect. Affects the time needed for the camera to perform auto exposure.
get_tonemap_auto_exposure_speed ::
                                  (Environment :< cls, Object :< cls) => cls -> IO Float
get_tonemap_auto_exposure_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_get_tonemap_auto_exposure_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_tonemap_auto_exposure_speed"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_tonemap_auto_exposure_speed

{-# NOINLINE bindEnvironment_get_tonemap_exposure #-}

-- | The default exposure used for tonemapping.
bindEnvironment_get_tonemap_exposure :: MethodBind
bindEnvironment_get_tonemap_exposure
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_tonemap_exposure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default exposure used for tonemapping.
get_tonemap_exposure ::
                       (Environment :< cls, Object :< cls) => cls -> IO Float
get_tonemap_exposure cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_tonemap_exposure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_tonemap_exposure" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_tonemap_exposure

{-# NOINLINE bindEnvironment_get_tonemap_white #-}

-- | The white reference value for tonemapping. Only effective if the @tonemap_mode@ isn't set to @TONE_MAPPER_LINEAR@.
bindEnvironment_get_tonemap_white :: MethodBind
bindEnvironment_get_tonemap_white
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_tonemap_white" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The white reference value for tonemapping. Only effective if the @tonemap_mode@ isn't set to @TONE_MAPPER_LINEAR@.
get_tonemap_white ::
                    (Environment :< cls, Object :< cls) => cls -> IO Float
get_tonemap_white cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_tonemap_white
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_tonemap_white" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Environment.get_tonemap_white

{-# NOINLINE bindEnvironment_get_tonemapper #-}

-- | The tonemapping mode to use. Tonemapping is the process that "converts" HDR values to be suitable for rendering on a LDR display. (Godot doesn't support rendering on HDR displays yet.)
bindEnvironment_get_tonemapper :: MethodBind
bindEnvironment_get_tonemapper
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "get_tonemapper" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tonemapping mode to use. Tonemapping is the process that "converts" HDR values to be suitable for rendering on a LDR display. (Godot doesn't support rendering on HDR displays yet.)
get_tonemapper ::
                 (Environment :< cls, Object :< cls) => cls -> IO Int
get_tonemapper cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_get_tonemapper (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "get_tonemapper" '[] (IO Int) where
        nodeMethod = Godot.Core.Environment.get_tonemapper

{-# NOINLINE bindEnvironment_is_adjustment_enabled #-}

-- | If @true@, enables the @adjustment_*@ properties provided by this resource. If @false@, modifications to the @adjustment_*@ properties will have no effect on the rendered scene.
bindEnvironment_is_adjustment_enabled :: MethodBind
bindEnvironment_is_adjustment_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_adjustment_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the @adjustment_*@ properties provided by this resource. If @false@, modifications to the @adjustment_*@ properties will have no effect on the rendered scene.
is_adjustment_enabled ::
                        (Environment :< cls, Object :< cls) => cls -> IO Bool
is_adjustment_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_adjustment_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_adjustment_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_adjustment_enabled

{-# NOINLINE bindEnvironment_is_dof_blur_far_enabled #-}

-- | If @true@, enables the depth-of-field far blur effect.
bindEnvironment_is_dof_blur_far_enabled :: MethodBind
bindEnvironment_is_dof_blur_far_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_dof_blur_far_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the depth-of-field far blur effect.
is_dof_blur_far_enabled ::
                          (Environment :< cls, Object :< cls) => cls -> IO Bool
is_dof_blur_far_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_dof_blur_far_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_dof_blur_far_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_dof_blur_far_enabled

{-# NOINLINE bindEnvironment_is_dof_blur_near_enabled #-}

-- | If @true@, enables the depth-of-field near blur effect.
bindEnvironment_is_dof_blur_near_enabled :: MethodBind
bindEnvironment_is_dof_blur_near_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_dof_blur_near_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the depth-of-field near blur effect.
is_dof_blur_near_enabled ::
                           (Environment :< cls, Object :< cls) => cls -> IO Bool
is_dof_blur_near_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_dof_blur_near_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_dof_blur_near_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_dof_blur_near_enabled

{-# NOINLINE bindEnvironment_is_fog_depth_enabled #-}

-- | If @true@, the depth fog effect is enabled. When enabled, fog will appear in the distance (relative to the camera).
bindEnvironment_is_fog_depth_enabled :: MethodBind
bindEnvironment_is_fog_depth_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_fog_depth_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the depth fog effect is enabled. When enabled, fog will appear in the distance (relative to the camera).
is_fog_depth_enabled ::
                       (Environment :< cls, Object :< cls) => cls -> IO Bool
is_fog_depth_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_fog_depth_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_fog_depth_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_fog_depth_enabled

{-# NOINLINE bindEnvironment_is_fog_enabled #-}

-- | If @true@, fog effects are enabled. @fog_height_enabled@ and/or @fog_depth_enabled@ must be set to @true@ to actually display fog.
bindEnvironment_is_fog_enabled :: MethodBind
bindEnvironment_is_fog_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_fog_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, fog effects are enabled. @fog_height_enabled@ and/or @fog_depth_enabled@ must be set to @true@ to actually display fog.
is_fog_enabled ::
                 (Environment :< cls, Object :< cls) => cls -> IO Bool
is_fog_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_fog_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_fog_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_fog_enabled

{-# NOINLINE bindEnvironment_is_fog_height_enabled #-}

-- | If @true@, the height fog effect is enabled. When enabled, fog will appear in a defined height range, regardless of the distance from the camera. This can be used to simulate "deep water" effects with a lower performance cost compared to a dedicated shader.
bindEnvironment_is_fog_height_enabled :: MethodBind
bindEnvironment_is_fog_height_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_fog_height_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the height fog effect is enabled. When enabled, fog will appear in a defined height range, regardless of the distance from the camera. This can be used to simulate "deep water" effects with a lower performance cost compared to a dedicated shader.
is_fog_height_enabled ::
                        (Environment :< cls, Object :< cls) => cls -> IO Bool
is_fog_height_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_fog_height_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_fog_height_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_fog_height_enabled

{-# NOINLINE bindEnvironment_is_fog_transmit_enabled #-}

-- | Enables fog's light transmission effect. If @true@, light will be more visible in the fog to simulate light scattering as in real life.
bindEnvironment_is_fog_transmit_enabled :: MethodBind
bindEnvironment_is_fog_transmit_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_fog_transmit_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables fog's light transmission effect. If @true@, light will be more visible in the fog to simulate light scattering as in real life.
is_fog_transmit_enabled ::
                          (Environment :< cls, Object :< cls) => cls -> IO Bool
is_fog_transmit_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_fog_transmit_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_fog_transmit_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_fog_transmit_enabled

{-# NOINLINE bindEnvironment_is_glow_bicubic_upscale_enabled #-}

-- | Smooths out the blockiness created by sampling higher levels, at the cost of performance.
--   			__Note:__ When using the GLES2 renderer, this is only available if the GPU supports the @GL_EXT_gpu_shader4@ extension.
bindEnvironment_is_glow_bicubic_upscale_enabled :: MethodBind
bindEnvironment_is_glow_bicubic_upscale_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_glow_bicubic_upscale_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Smooths out the blockiness created by sampling higher levels, at the cost of performance.
--   			__Note:__ When using the GLES2 renderer, this is only available if the GPU supports the @GL_EXT_gpu_shader4@ extension.
is_glow_bicubic_upscale_enabled ::
                                  (Environment :< cls, Object :< cls) => cls -> IO Bool
is_glow_bicubic_upscale_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_is_glow_bicubic_upscale_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_glow_bicubic_upscale_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_glow_bicubic_upscale_enabled

{-# NOINLINE bindEnvironment_is_glow_enabled #-}

-- | If @true@, the glow effect is enabled.
bindEnvironment_is_glow_enabled :: MethodBind
bindEnvironment_is_glow_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_glow_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the glow effect is enabled.
is_glow_enabled ::
                  (Environment :< cls, Object :< cls) => cls -> IO Bool
is_glow_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_glow_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_glow_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_glow_enabled

{-# NOINLINE bindEnvironment_is_glow_level_enabled #-}

-- | Returns @true@ if the glow level @idx@ is specified, @false@ otherwise.
bindEnvironment_is_glow_level_enabled :: MethodBind
bindEnvironment_is_glow_level_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_glow_level_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the glow level @idx@ is specified, @false@ otherwise.
is_glow_level_enabled ::
                        (Environment :< cls, Object :< cls) => cls -> Int -> IO Bool
is_glow_level_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_glow_level_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_glow_level_enabled" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_glow_level_enabled

{-# NOINLINE bindEnvironment_is_ssao_enabled #-}

-- | If @true@, the screen-space ambient occlusion effect is enabled. This darkens objects' corners and cavities to simulate ambient light not reaching the entire object as in real life. This works well for small, dynamic objects, but baked lighting or ambient occlusion textures will do a better job at displaying ambient occlusion on large static objects. This is a costly effect and should be disabled first when running into performance issues.
bindEnvironment_is_ssao_enabled :: MethodBind
bindEnvironment_is_ssao_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_ssao_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the screen-space ambient occlusion effect is enabled. This darkens objects' corners and cavities to simulate ambient light not reaching the entire object as in real life. This works well for small, dynamic objects, but baked lighting or ambient occlusion textures will do a better job at displaying ambient occlusion on large static objects. This is a costly effect and should be disabled first when running into performance issues.
is_ssao_enabled ::
                  (Environment :< cls, Object :< cls) => cls -> IO Bool
is_ssao_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_ssao_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_ssao_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_ssao_enabled

{-# NOINLINE bindEnvironment_is_ssr_enabled #-}

-- | If @true@, screen-space reflections are enabled. Screen-space reflections are more accurate than reflections from @GIProbe@s or @ReflectionProbe@s, but are slower and can't reflect surfaces occluded by others.
bindEnvironment_is_ssr_enabled :: MethodBind
bindEnvironment_is_ssr_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_ssr_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, screen-space reflections are enabled. Screen-space reflections are more accurate than reflections from @GIProbe@s or @ReflectionProbe@s, but are slower and can't reflect surfaces occluded by others.
is_ssr_enabled ::
                 (Environment :< cls, Object :< cls) => cls -> IO Bool
is_ssr_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_ssr_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_ssr_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Environment.is_ssr_enabled

{-# NOINLINE bindEnvironment_is_ssr_rough #-}

-- | If @true@, screen-space reflections will take the material roughness into account.
bindEnvironment_is_ssr_rough :: MethodBind
bindEnvironment_is_ssr_rough
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "is_ssr_rough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, screen-space reflections will take the material roughness into account.
is_ssr_rough ::
               (Environment :< cls, Object :< cls) => cls -> IO Bool
is_ssr_rough cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_is_ssr_rough (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "is_ssr_rough" '[] (IO Bool) where
        nodeMethod = Godot.Core.Environment.is_ssr_rough

{-# NOINLINE bindEnvironment_set_adjustment_brightness #-}

-- | The global brightness value of the rendered scene. Effective only if @adjustment_enabled@ is @true@.
bindEnvironment_set_adjustment_brightness :: MethodBind
bindEnvironment_set_adjustment_brightness
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_adjustment_brightness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global brightness value of the rendered scene. Effective only if @adjustment_enabled@ is @true@.
set_adjustment_brightness ::
                            (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_adjustment_brightness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_adjustment_brightness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_adjustment_brightness"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_adjustment_brightness

{-# NOINLINE bindEnvironment_set_adjustment_color_correction #-}

-- | Applies the provided @Texture@ resource to affect the global color aspect of the rendered scene. Effective only if @adjustment_enabled@ is @true@.
bindEnvironment_set_adjustment_color_correction :: MethodBind
bindEnvironment_set_adjustment_color_correction
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_adjustment_color_correction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies the provided @Texture@ resource to affect the global color aspect of the rendered scene. Effective only if @adjustment_enabled@ is @true@.
set_adjustment_color_correction ::
                                  (Environment :< cls, Object :< cls) => cls -> Texture -> IO ()
set_adjustment_color_correction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_set_adjustment_color_correction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_adjustment_color_correction"
           '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_adjustment_color_correction

{-# NOINLINE bindEnvironment_set_adjustment_contrast #-}

-- | The global contrast value of the rendered scene (default value is 1). Effective only if @adjustment_enabled@ is @true@.
bindEnvironment_set_adjustment_contrast :: MethodBind
bindEnvironment_set_adjustment_contrast
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_adjustment_contrast" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global contrast value of the rendered scene (default value is 1). Effective only if @adjustment_enabled@ is @true@.
set_adjustment_contrast ::
                          (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_adjustment_contrast cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_adjustment_contrast
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_adjustment_contrast" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_adjustment_contrast

{-# NOINLINE bindEnvironment_set_adjustment_enable #-}

-- | If @true@, enables the @adjustment_*@ properties provided by this resource. If @false@, modifications to the @adjustment_*@ properties will have no effect on the rendered scene.
bindEnvironment_set_adjustment_enable :: MethodBind
bindEnvironment_set_adjustment_enable
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_adjustment_enable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the @adjustment_*@ properties provided by this resource. If @false@, modifications to the @adjustment_*@ properties will have no effect on the rendered scene.
set_adjustment_enable ::
                        (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_adjustment_enable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_adjustment_enable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_adjustment_enable" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_adjustment_enable

{-# NOINLINE bindEnvironment_set_adjustment_saturation #-}

-- | The global color saturation value of the rendered scene (default value is 1). Effective only if @adjustment_enabled@ is @true@.
bindEnvironment_set_adjustment_saturation :: MethodBind
bindEnvironment_set_adjustment_saturation
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_adjustment_saturation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global color saturation value of the rendered scene (default value is 1). Effective only if @adjustment_enabled@ is @true@.
set_adjustment_saturation ::
                            (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_adjustment_saturation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_adjustment_saturation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_adjustment_saturation"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_adjustment_saturation

{-# NOINLINE bindEnvironment_set_ambient_light_color #-}

-- | The ambient light's @Color@.
bindEnvironment_set_ambient_light_color :: MethodBind
bindEnvironment_set_ambient_light_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ambient_light_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ambient light's @Color@.
set_ambient_light_color ::
                          (Environment :< cls, Object :< cls) => cls -> Color -> IO ()
set_ambient_light_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ambient_light_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ambient_light_color" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ambient_light_color

{-# NOINLINE bindEnvironment_set_ambient_light_energy #-}

-- | The ambient light's energy. The higher the value, the stronger the light.
bindEnvironment_set_ambient_light_energy :: MethodBind
bindEnvironment_set_ambient_light_energy
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ambient_light_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ambient light's energy. The higher the value, the stronger the light.
set_ambient_light_energy ::
                           (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ambient_light_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ambient_light_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ambient_light_energy" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ambient_light_energy

{-# NOINLINE bindEnvironment_set_ambient_light_sky_contribution #-}

-- | Defines the amount of light that the sky brings on the scene. A value of 0 means that the sky's light emission has no effect on the scene illumination, thus all ambient illumination is provided by the ambient light. On the contrary, a value of 1 means that all the light that affects the scene is provided by the sky, thus the ambient light parameter has no effect on the scene.
bindEnvironment_set_ambient_light_sky_contribution :: MethodBind
bindEnvironment_set_ambient_light_sky_contribution
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ambient_light_sky_contribution" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the amount of light that the sky brings on the scene. A value of 0 means that the sky's light emission has no effect on the scene illumination, thus all ambient illumination is provided by the ambient light. On the contrary, a value of 1 means that all the light that affects the scene is provided by the sky, thus the ambient light parameter has no effect on the scene.
set_ambient_light_sky_contribution ::
                                     (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ambient_light_sky_contribution cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_set_ambient_light_sky_contribution
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment
           "set_ambient_light_sky_contribution"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Environment.set_ambient_light_sky_contribution

{-# NOINLINE bindEnvironment_set_background #-}

-- | The background mode. See @enum BGMode@ for possible values.
bindEnvironment_set_background :: MethodBind
bindEnvironment_set_background
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The background mode. See @enum BGMode@ for possible values.
set_background ::
                 (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_background cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_background (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_background" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_background

{-# NOINLINE bindEnvironment_set_bg_color #-}

-- | The @Color@ displayed for clear areas of the scene. Only effective when using the @BG_COLOR@ or @BG_COLOR_SKY@ background modes).
bindEnvironment_set_bg_color :: MethodBind
bindEnvironment_set_bg_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Color@ displayed for clear areas of the scene. Only effective when using the @BG_COLOR@ or @BG_COLOR_SKY@ background modes).
set_bg_color ::
               (Environment :< cls, Object :< cls) => cls -> Color -> IO ()
set_bg_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_bg_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_bg_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_bg_color

{-# NOINLINE bindEnvironment_set_bg_energy #-}

-- | The power of the light emitted by the background.
bindEnvironment_set_bg_energy :: MethodBind
bindEnvironment_set_bg_energy
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_bg_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The power of the light emitted by the background.
set_bg_energy ::
                (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_bg_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_bg_energy (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_bg_energy" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_bg_energy

{-# NOINLINE bindEnvironment_set_camera_feed_id #-}

-- | The ID of the camera feed to show in the background.
bindEnvironment_set_camera_feed_id :: MethodBind
bindEnvironment_set_camera_feed_id
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_camera_feed_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ID of the camera feed to show in the background.
set_camera_feed_id ::
                     (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_camera_feed_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_camera_feed_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_camera_feed_id" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_camera_feed_id

{-# NOINLINE bindEnvironment_set_canvas_max_layer #-}

-- | The maximum layer ID to display. Only effective when using the @BG_CANVAS@ background mode.
bindEnvironment_set_canvas_max_layer :: MethodBind
bindEnvironment_set_canvas_max_layer
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_canvas_max_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum layer ID to display. Only effective when using the @BG_CANVAS@ background mode.
set_canvas_max_layer ::
                       (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_canvas_max_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_canvas_max_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_canvas_max_layer" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_canvas_max_layer

{-# NOINLINE bindEnvironment_set_dof_blur_far_amount #-}

-- | The amount of far blur for the depth-of-field effect.
bindEnvironment_set_dof_blur_far_amount :: MethodBind
bindEnvironment_set_dof_blur_far_amount
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_far_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of far blur for the depth-of-field effect.
set_dof_blur_far_amount ::
                          (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_dof_blur_far_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_far_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_far_amount" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_far_amount

{-# NOINLINE bindEnvironment_set_dof_blur_far_distance #-}

-- | The distance from the camera where the far blur effect affects the rendering.
bindEnvironment_set_dof_blur_far_distance :: MethodBind
bindEnvironment_set_dof_blur_far_distance
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_far_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance from the camera where the far blur effect affects the rendering.
set_dof_blur_far_distance ::
                            (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_dof_blur_far_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_far_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_far_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_far_distance

{-# NOINLINE bindEnvironment_set_dof_blur_far_enabled #-}

-- | If @true@, enables the depth-of-field far blur effect.
bindEnvironment_set_dof_blur_far_enabled :: MethodBind
bindEnvironment_set_dof_blur_far_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_far_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the depth-of-field far blur effect.
set_dof_blur_far_enabled ::
                           (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_dof_blur_far_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_far_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_far_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_far_enabled

{-# NOINLINE bindEnvironment_set_dof_blur_far_quality #-}

-- | The depth-of-field far blur's quality. Higher values can mitigate the visible banding effect seen at higher strengths, but are much slower.
bindEnvironment_set_dof_blur_far_quality :: MethodBind
bindEnvironment_set_dof_blur_far_quality
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_far_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The depth-of-field far blur's quality. Higher values can mitigate the visible banding effect seen at higher strengths, but are much slower.
set_dof_blur_far_quality ::
                           (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_dof_blur_far_quality cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_far_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_far_quality" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_far_quality

{-# NOINLINE bindEnvironment_set_dof_blur_far_transition #-}

-- | The length of the transition between the no-blur area and far blur.
bindEnvironment_set_dof_blur_far_transition :: MethodBind
bindEnvironment_set_dof_blur_far_transition
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_far_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length of the transition between the no-blur area and far blur.
set_dof_blur_far_transition ::
                              (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_dof_blur_far_transition cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_far_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_far_transition"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_far_transition

{-# NOINLINE bindEnvironment_set_dof_blur_near_amount #-}

-- | The amount of near blur for the depth-of-field effect.
bindEnvironment_set_dof_blur_near_amount :: MethodBind
bindEnvironment_set_dof_blur_near_amount
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_near_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of near blur for the depth-of-field effect.
set_dof_blur_near_amount ::
                           (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_dof_blur_near_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_near_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_near_amount" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_near_amount

{-# NOINLINE bindEnvironment_set_dof_blur_near_distance #-}

-- | Distance from the camera where the near blur effect affects the rendering.
bindEnvironment_set_dof_blur_near_distance :: MethodBind
bindEnvironment_set_dof_blur_near_distance
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_near_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance from the camera where the near blur effect affects the rendering.
set_dof_blur_near_distance ::
                             (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_dof_blur_near_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_near_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_near_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_near_distance

{-# NOINLINE bindEnvironment_set_dof_blur_near_enabled #-}

-- | If @true@, enables the depth-of-field near blur effect.
bindEnvironment_set_dof_blur_near_enabled :: MethodBind
bindEnvironment_set_dof_blur_near_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_near_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the depth-of-field near blur effect.
set_dof_blur_near_enabled ::
                            (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_dof_blur_near_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_near_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_near_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_near_enabled

{-# NOINLINE bindEnvironment_set_dof_blur_near_quality #-}

-- | The depth-of-field near blur's quality. Higher values can mitigate the visible banding effect seen at higher strengths, but are much slower.
bindEnvironment_set_dof_blur_near_quality :: MethodBind
bindEnvironment_set_dof_blur_near_quality
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_near_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The depth-of-field near blur's quality. Higher values can mitigate the visible banding effect seen at higher strengths, but are much slower.
set_dof_blur_near_quality ::
                            (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_dof_blur_near_quality cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_near_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_near_quality" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_near_quality

{-# NOINLINE bindEnvironment_set_dof_blur_near_transition #-}

-- | The length of the transition between the near blur and no-blur area.
bindEnvironment_set_dof_blur_near_transition :: MethodBind
bindEnvironment_set_dof_blur_near_transition
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_dof_blur_near_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length of the transition between the near blur and no-blur area.
set_dof_blur_near_transition ::
                               (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_dof_blur_near_transition cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_dof_blur_near_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_dof_blur_near_transition"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_dof_blur_near_transition

{-# NOINLINE bindEnvironment_set_fog_color #-}

-- | The fog's @Color@.
bindEnvironment_set_fog_color :: MethodBind
bindEnvironment_set_fog_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fog's @Color@.
set_fog_color ::
                (Environment :< cls, Object :< cls) => cls -> Color -> IO ()
set_fog_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_color

{-# NOINLINE bindEnvironment_set_fog_depth_begin #-}

-- | The fog's depth starting distance from the camera.
bindEnvironment_set_fog_depth_begin :: MethodBind
bindEnvironment_set_fog_depth_begin
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_depth_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fog's depth starting distance from the camera.
set_fog_depth_begin ::
                      (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_fog_depth_begin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_depth_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_depth_begin" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_depth_begin

{-# NOINLINE bindEnvironment_set_fog_depth_curve #-}

-- | The fog depth's intensity curve. A number of presets are available in the __Inspector__ by right-clicking the curve.
bindEnvironment_set_fog_depth_curve :: MethodBind
bindEnvironment_set_fog_depth_curve
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_depth_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fog depth's intensity curve. A number of presets are available in the __Inspector__ by right-clicking the curve.
set_fog_depth_curve ::
                      (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_fog_depth_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_depth_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_depth_curve" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_depth_curve

{-# NOINLINE bindEnvironment_set_fog_depth_enabled #-}

-- | If @true@, the depth fog effect is enabled. When enabled, fog will appear in the distance (relative to the camera).
bindEnvironment_set_fog_depth_enabled :: MethodBind
bindEnvironment_set_fog_depth_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_depth_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the depth fog effect is enabled. When enabled, fog will appear in the distance (relative to the camera).
set_fog_depth_enabled ::
                        (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fog_depth_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_depth_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_depth_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_depth_enabled

{-# NOINLINE bindEnvironment_set_fog_depth_end #-}

-- | The fog's depth end distance from the camera. If this value is set to 0, it will be equal to the current camera's @Camera.far@ value.
bindEnvironment_set_fog_depth_end :: MethodBind
bindEnvironment_set_fog_depth_end
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_depth_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fog's depth end distance from the camera. If this value is set to 0, it will be equal to the current camera's @Camera.far@ value.
set_fog_depth_end ::
                    (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_fog_depth_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_depth_end
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_depth_end" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_depth_end

{-# NOINLINE bindEnvironment_set_fog_enabled #-}

-- | If @true@, fog effects are enabled. @fog_height_enabled@ and/or @fog_depth_enabled@ must be set to @true@ to actually display fog.
bindEnvironment_set_fog_enabled :: MethodBind
bindEnvironment_set_fog_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, fog effects are enabled. @fog_height_enabled@ and/or @fog_depth_enabled@ must be set to @true@ to actually display fog.
set_fog_enabled ::
                  (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fog_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_enabled

{-# NOINLINE bindEnvironment_set_fog_height_curve #-}

-- | The height fog's intensity. A number of presets are available in the __Inspector__ by right-clicking the curve.
bindEnvironment_set_fog_height_curve :: MethodBind
bindEnvironment_set_fog_height_curve
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_height_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The height fog's intensity. A number of presets are available in the __Inspector__ by right-clicking the curve.
set_fog_height_curve ::
                       (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_fog_height_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_height_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_height_curve" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_height_curve

{-# NOINLINE bindEnvironment_set_fog_height_enabled #-}

-- | If @true@, the height fog effect is enabled. When enabled, fog will appear in a defined height range, regardless of the distance from the camera. This can be used to simulate "deep water" effects with a lower performance cost compared to a dedicated shader.
bindEnvironment_set_fog_height_enabled :: MethodBind
bindEnvironment_set_fog_height_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_height_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the height fog effect is enabled. When enabled, fog will appear in a defined height range, regardless of the distance from the camera. This can be used to simulate "deep water" effects with a lower performance cost compared to a dedicated shader.
set_fog_height_enabled ::
                         (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fog_height_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_height_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_height_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_height_enabled

{-# NOINLINE bindEnvironment_set_fog_height_max #-}

-- | The Y coordinate where the height fog will be the most intense. If this value is greater than @fog_height_min@, fog will be displayed from bottom to top. Otherwise, it will be displayed from top to bottom.
bindEnvironment_set_fog_height_max :: MethodBind
bindEnvironment_set_fog_height_max
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_height_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Y coordinate where the height fog will be the most intense. If this value is greater than @fog_height_min@, fog will be displayed from bottom to top. Otherwise, it will be displayed from top to bottom.
set_fog_height_max ::
                     (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_fog_height_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_height_max
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_height_max" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_height_max

{-# NOINLINE bindEnvironment_set_fog_height_min #-}

-- | The Y coordinate where the height fog will be the least intense. If this value is greater than @fog_height_max@, fog will be displayed from top to bottom. Otherwise, it will be displayed from bottom to top.
bindEnvironment_set_fog_height_min :: MethodBind
bindEnvironment_set_fog_height_min
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_height_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Y coordinate where the height fog will be the least intense. If this value is greater than @fog_height_max@, fog will be displayed from top to bottom. Otherwise, it will be displayed from bottom to top.
set_fog_height_min ::
                     (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_fog_height_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_height_min
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_height_min" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_height_min

{-# NOINLINE bindEnvironment_set_fog_sun_amount #-}

-- | The intensity of the depth fog color transition when looking towards the sun. The sun's direction is determined automatically using the DirectionalLight node in the scene.
bindEnvironment_set_fog_sun_amount :: MethodBind
bindEnvironment_set_fog_sun_amount
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_sun_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The intensity of the depth fog color transition when looking towards the sun. The sun's direction is determined automatically using the DirectionalLight node in the scene.
set_fog_sun_amount ::
                     (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_fog_sun_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_sun_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_sun_amount" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_sun_amount

{-# NOINLINE bindEnvironment_set_fog_sun_color #-}

-- | The depth fog's @Color@ when looking towards the sun.
bindEnvironment_set_fog_sun_color :: MethodBind
bindEnvironment_set_fog_sun_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_sun_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The depth fog's @Color@ when looking towards the sun.
set_fog_sun_color ::
                    (Environment :< cls, Object :< cls) => cls -> Color -> IO ()
set_fog_sun_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_sun_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_sun_color" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_sun_color

{-# NOINLINE bindEnvironment_set_fog_transmit_curve #-}

-- | The intensity of the fog light transmittance effect. Amount of light that the fog transmits.
bindEnvironment_set_fog_transmit_curve :: MethodBind
bindEnvironment_set_fog_transmit_curve
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_transmit_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The intensity of the fog light transmittance effect. Amount of light that the fog transmits.
set_fog_transmit_curve ::
                         (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_fog_transmit_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_transmit_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_transmit_curve" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_transmit_curve

{-# NOINLINE bindEnvironment_set_fog_transmit_enabled #-}

-- | Enables fog's light transmission effect. If @true@, light will be more visible in the fog to simulate light scattering as in real life.
bindEnvironment_set_fog_transmit_enabled :: MethodBind
bindEnvironment_set_fog_transmit_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_fog_transmit_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables fog's light transmission effect. If @true@, light will be more visible in the fog to simulate light scattering as in real life.
set_fog_transmit_enabled ::
                           (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fog_transmit_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_fog_transmit_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_fog_transmit_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_fog_transmit_enabled

{-# NOINLINE bindEnvironment_set_glow_bicubic_upscale #-}

-- | Smooths out the blockiness created by sampling higher levels, at the cost of performance.
--   			__Note:__ When using the GLES2 renderer, this is only available if the GPU supports the @GL_EXT_gpu_shader4@ extension.
bindEnvironment_set_glow_bicubic_upscale :: MethodBind
bindEnvironment_set_glow_bicubic_upscale
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_bicubic_upscale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Smooths out the blockiness created by sampling higher levels, at the cost of performance.
--   			__Note:__ When using the GLES2 renderer, this is only available if the GPU supports the @GL_EXT_gpu_shader4@ extension.
set_glow_bicubic_upscale ::
                           (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_glow_bicubic_upscale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_bicubic_upscale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_bicubic_upscale" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_bicubic_upscale

{-# NOINLINE bindEnvironment_set_glow_blend_mode #-}

-- | The glow blending mode.
bindEnvironment_set_glow_blend_mode :: MethodBind
bindEnvironment_set_glow_blend_mode
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The glow blending mode.
set_glow_blend_mode ::
                      (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_glow_blend_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_blend_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_blend_mode

{-# NOINLINE bindEnvironment_set_glow_bloom #-}

-- | The bloom's intensity. If set to a value higher than @0@, this will make glow visible in areas darker than the @glow_hdr_threshold@.
bindEnvironment_set_glow_bloom :: MethodBind
bindEnvironment_set_glow_bloom
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_bloom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The bloom's intensity. If set to a value higher than @0@, this will make glow visible in areas darker than the @glow_hdr_threshold@.
set_glow_bloom ::
                 (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_glow_bloom cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_bloom (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_bloom" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_bloom

{-# NOINLINE bindEnvironment_set_glow_enabled #-}

-- | If @true@, the glow effect is enabled.
bindEnvironment_set_glow_enabled :: MethodBind
bindEnvironment_set_glow_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the glow effect is enabled.
set_glow_enabled ::
                   (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_glow_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_enabled

{-# NOINLINE bindEnvironment_set_glow_hdr_bleed_scale #-}

-- | The bleed scale of the HDR glow.
bindEnvironment_set_glow_hdr_bleed_scale :: MethodBind
bindEnvironment_set_glow_hdr_bleed_scale
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_hdr_bleed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The bleed scale of the HDR glow.
set_glow_hdr_bleed_scale ::
                           (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_glow_hdr_bleed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_hdr_bleed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_hdr_bleed_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_hdr_bleed_scale

{-# NOINLINE bindEnvironment_set_glow_hdr_bleed_threshold #-}

-- | The lower threshold of the HDR glow. When using the GLES2 renderer (which doesn't support HDR), this needs to be below @1.0@ for glow to be visible. A value of @0.9@ works well in this case.
bindEnvironment_set_glow_hdr_bleed_threshold :: MethodBind
bindEnvironment_set_glow_hdr_bleed_threshold
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_hdr_bleed_threshold" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The lower threshold of the HDR glow. When using the GLES2 renderer (which doesn't support HDR), this needs to be below @1.0@ for glow to be visible. A value of @0.9@ works well in this case.
set_glow_hdr_bleed_threshold ::
                               (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_glow_hdr_bleed_threshold cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_hdr_bleed_threshold
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_hdr_bleed_threshold"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_hdr_bleed_threshold

{-# NOINLINE bindEnvironment_set_glow_hdr_luminance_cap #-}

-- | The higher threshold of the HDR glow. Areas brighter than this threshold will be clamped for the purposes of the glow effect.
bindEnvironment_set_glow_hdr_luminance_cap :: MethodBind
bindEnvironment_set_glow_hdr_luminance_cap
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_hdr_luminance_cap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The higher threshold of the HDR glow. Areas brighter than this threshold will be clamped for the purposes of the glow effect.
set_glow_hdr_luminance_cap ::
                             (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_glow_hdr_luminance_cap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_hdr_luminance_cap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_hdr_luminance_cap"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_hdr_luminance_cap

{-# NOINLINE bindEnvironment_set_glow_intensity #-}

-- | The glow intensity. When using the GLES2 renderer, this should be increased to 1.5 to compensate for the lack of HDR rendering.
bindEnvironment_set_glow_intensity :: MethodBind
bindEnvironment_set_glow_intensity
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The glow intensity. When using the GLES2 renderer, this should be increased to 1.5 to compensate for the lack of HDR rendering.
set_glow_intensity ::
                     (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_glow_intensity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_intensity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_intensity" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_intensity

{-# NOINLINE bindEnvironment_set_glow_level #-}

-- | Enables or disables the glow level at index @idx@. Each level relies on the previous level. This means that enabling higher glow levels will slow down the glow effect rendering, even if previous levels aren't enabled.
bindEnvironment_set_glow_level :: MethodBind
bindEnvironment_set_glow_level
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_level" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables the glow level at index @idx@. Each level relies on the previous level. This means that enabling higher glow levels will slow down the glow effect rendering, even if previous levels aren't enabled.
set_glow_level ::
                 (Environment :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_glow_level cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_level (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_level" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_level

{-# NOINLINE bindEnvironment_set_glow_strength #-}

-- | The glow strength. When using the GLES2 renderer, this should be increased to 1.3 to compensate for the lack of HDR rendering.
bindEnvironment_set_glow_strength :: MethodBind
bindEnvironment_set_glow_strength
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_glow_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The glow strength. When using the GLES2 renderer, this should be increased to 1.3 to compensate for the lack of HDR rendering.
set_glow_strength ::
                    (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_glow_strength cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_glow_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_glow_strength" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_glow_strength

{-# NOINLINE bindEnvironment_set_sky #-}

-- | The @Sky@ resource defined as background.
bindEnvironment_set_sky :: MethodBind
bindEnvironment_set_sky
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_sky" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource defined as background.
set_sky ::
          (Environment :< cls, Object :< cls) => cls -> Sky -> IO ()
set_sky cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_sky (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_sky" '[Sky] (IO ()) where
        nodeMethod = Godot.Core.Environment.set_sky

{-# NOINLINE bindEnvironment_set_sky_custom_fov #-}

-- | The @Sky@ resource's custom field of view.
bindEnvironment_set_sky_custom_fov :: MethodBind
bindEnvironment_set_sky_custom_fov
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_sky_custom_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource's custom field of view.
set_sky_custom_fov ::
                     (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_sky_custom_fov cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_sky_custom_fov
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_sky_custom_fov" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_sky_custom_fov

{-# NOINLINE bindEnvironment_set_sky_orientation #-}

-- | The @Sky@ resource's rotation expressed as a @Basis@.
bindEnvironment_set_sky_orientation :: MethodBind
bindEnvironment_set_sky_orientation
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_sky_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource's rotation expressed as a @Basis@.
set_sky_orientation ::
                      (Environment :< cls, Object :< cls) => cls -> Basis -> IO ()
set_sky_orientation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_sky_orientation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_sky_orientation" '[Basis]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_sky_orientation

{-# NOINLINE bindEnvironment_set_sky_rotation #-}

-- | The @Sky@ resource's rotation expressed as Euler angles in radians.
bindEnvironment_set_sky_rotation :: MethodBind
bindEnvironment_set_sky_rotation
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_sky_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource's rotation expressed as Euler angles in radians.
set_sky_rotation ::
                   (Environment :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_sky_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_sky_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_sky_rotation" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_sky_rotation

{-# NOINLINE bindEnvironment_set_sky_rotation_degrees #-}

-- | The @Sky@ resource's rotation expressed as Euler angles in degrees.
bindEnvironment_set_sky_rotation_degrees :: MethodBind
bindEnvironment_set_sky_rotation_degrees
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_sky_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Sky@ resource's rotation expressed as Euler angles in degrees.
set_sky_rotation_degrees ::
                           (Environment :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_sky_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_sky_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_sky_rotation_degrees"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_sky_rotation_degrees

{-# NOINLINE bindEnvironment_set_ssao_ao_channel_affect #-}

-- | The screen-space ambient occlusion intensity on materials that have an AO texture defined. Values higher than @0@ will make the SSAO effect visible in areas darkened by AO textures.
bindEnvironment_set_ssao_ao_channel_affect :: MethodBind
bindEnvironment_set_ssao_ao_channel_affect
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_ao_channel_affect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion intensity on materials that have an AO texture defined. Values higher than @0@ will make the SSAO effect visible in areas darkened by AO textures.
set_ssao_ao_channel_affect ::
                             (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssao_ao_channel_affect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_ao_channel_affect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_ao_channel_affect"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_ao_channel_affect

{-# NOINLINE bindEnvironment_set_ssao_bias #-}

-- | The screen-space ambient occlusion bias. This should be kept high enough to prevent "smooth" curves from being affected by ambient occlusion.
bindEnvironment_set_ssao_bias :: MethodBind
bindEnvironment_set_ssao_bias
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion bias. This should be kept high enough to prevent "smooth" curves from being affected by ambient occlusion.
set_ssao_bias ::
                (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssao_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_bias (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_bias" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_bias

{-# NOINLINE bindEnvironment_set_ssao_blur #-}

-- | The screen-space ambient occlusion blur quality. See @enum SSAOBlur@ for possible values.
bindEnvironment_set_ssao_blur :: MethodBind
bindEnvironment_set_ssao_blur
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_blur" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion blur quality. See @enum SSAOBlur@ for possible values.
set_ssao_blur ::
                (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_ssao_blur cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_blur (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_blur" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_blur

{-# NOINLINE bindEnvironment_set_ssao_color #-}

-- | The screen-space ambient occlusion color.
bindEnvironment_set_ssao_color :: MethodBind
bindEnvironment_set_ssao_color
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion color.
set_ssao_color ::
                 (Environment :< cls, Object :< cls) => cls -> Color -> IO ()
set_ssao_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_color

{-# NOINLINE bindEnvironment_set_ssao_direct_light_affect #-}

-- | The screen-space ambient occlusion intensity in direct light. In real life, ambient occlusion only applies to indirect light, which means its effects can't be seen in direct light. Values higher than @0@ will make the SSAO effect visible in direct light.
bindEnvironment_set_ssao_direct_light_affect :: MethodBind
bindEnvironment_set_ssao_direct_light_affect
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_direct_light_affect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion intensity in direct light. In real life, ambient occlusion only applies to indirect light, which means its effects can't be seen in direct light. Values higher than @0@ will make the SSAO effect visible in direct light.
set_ssao_direct_light_affect ::
                               (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssao_direct_light_affect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_direct_light_affect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_direct_light_affect"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_direct_light_affect

{-# NOINLINE bindEnvironment_set_ssao_edge_sharpness #-}

-- | The screen-space ambient occlusion edge sharpness.
bindEnvironment_set_ssao_edge_sharpness :: MethodBind
bindEnvironment_set_ssao_edge_sharpness
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_edge_sharpness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion edge sharpness.
set_ssao_edge_sharpness ::
                          (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssao_edge_sharpness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_edge_sharpness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_edge_sharpness" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_edge_sharpness

{-# NOINLINE bindEnvironment_set_ssao_enabled #-}

-- | If @true@, the screen-space ambient occlusion effect is enabled. This darkens objects' corners and cavities to simulate ambient light not reaching the entire object as in real life. This works well for small, dynamic objects, but baked lighting or ambient occlusion textures will do a better job at displaying ambient occlusion on large static objects. This is a costly effect and should be disabled first when running into performance issues.
bindEnvironment_set_ssao_enabled :: MethodBind
bindEnvironment_set_ssao_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the screen-space ambient occlusion effect is enabled. This darkens objects' corners and cavities to simulate ambient light not reaching the entire object as in real life. This works well for small, dynamic objects, but baked lighting or ambient occlusion textures will do a better job at displaying ambient occlusion on large static objects. This is a costly effect and should be disabled first when running into performance issues.
set_ssao_enabled ::
                   (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ssao_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_enabled

{-# NOINLINE bindEnvironment_set_ssao_intensity #-}

-- | The primary screen-space ambient occlusion intensity. See also @ssao_radius@.
bindEnvironment_set_ssao_intensity :: MethodBind
bindEnvironment_set_ssao_intensity
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The primary screen-space ambient occlusion intensity. See also @ssao_radius@.
set_ssao_intensity ::
                     (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssao_intensity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_intensity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_intensity" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_intensity

{-# NOINLINE bindEnvironment_set_ssao_intensity2 #-}

-- | The secondary screen-space ambient occlusion intensity. See also @ssao_radius2@.
bindEnvironment_set_ssao_intensity2 :: MethodBind
bindEnvironment_set_ssao_intensity2
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_intensity2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The secondary screen-space ambient occlusion intensity. See also @ssao_radius2@.
set_ssao_intensity2 ::
                      (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssao_intensity2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_intensity2
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_intensity2" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_intensity2

{-# NOINLINE bindEnvironment_set_ssao_quality #-}

-- | The screen-space ambient occlusion quality. Higher qualities will make better use of small objects for ambient occlusion, but are slower.
bindEnvironment_set_ssao_quality :: MethodBind
bindEnvironment_set_ssao_quality
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The screen-space ambient occlusion quality. Higher qualities will make better use of small objects for ambient occlusion, but are slower.
set_ssao_quality ::
                   (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_ssao_quality cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_quality" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_quality

{-# NOINLINE bindEnvironment_set_ssao_radius #-}

-- | The primary screen-space ambient occlusion radius.
bindEnvironment_set_ssao_radius :: MethodBind
bindEnvironment_set_ssao_radius
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The primary screen-space ambient occlusion radius.
set_ssao_radius ::
                  (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssao_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_radius

{-# NOINLINE bindEnvironment_set_ssao_radius2 #-}

-- | The secondary screen-space ambient occlusion radius. If set to a value higher than @0@, enables the secondary screen-space ambient occlusion effect which can be used to improve the effect's appearance (at the cost of performance).
bindEnvironment_set_ssao_radius2 :: MethodBind
bindEnvironment_set_ssao_radius2
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssao_radius2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The secondary screen-space ambient occlusion radius. If set to a value higher than @0@, enables the secondary screen-space ambient occlusion effect which can be used to improve the effect's appearance (at the cost of performance).
set_ssao_radius2 ::
                   (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssao_radius2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssao_radius2
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssao_radius2" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssao_radius2

{-# NOINLINE bindEnvironment_set_ssr_depth_tolerance #-}

-- | The depth tolerance for screen-space reflections.
bindEnvironment_set_ssr_depth_tolerance :: MethodBind
bindEnvironment_set_ssr_depth_tolerance
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssr_depth_tolerance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The depth tolerance for screen-space reflections.
set_ssr_depth_tolerance ::
                          (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssr_depth_tolerance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssr_depth_tolerance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssr_depth_tolerance" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssr_depth_tolerance

{-# NOINLINE bindEnvironment_set_ssr_enabled #-}

-- | If @true@, screen-space reflections are enabled. Screen-space reflections are more accurate than reflections from @GIProbe@s or @ReflectionProbe@s, but are slower and can't reflect surfaces occluded by others.
bindEnvironment_set_ssr_enabled :: MethodBind
bindEnvironment_set_ssr_enabled
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssr_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, screen-space reflections are enabled. Screen-space reflections are more accurate than reflections from @GIProbe@s or @ReflectionProbe@s, but are slower and can't reflect surfaces occluded by others.
set_ssr_enabled ::
                  (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ssr_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssr_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssr_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssr_enabled

{-# NOINLINE bindEnvironment_set_ssr_fade_in #-}

-- | The fade-in distance for screen-space reflections. Affects the area from the reflected material to the screen-space reflection).
bindEnvironment_set_ssr_fade_in :: MethodBind
bindEnvironment_set_ssr_fade_in
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssr_fade_in" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fade-in distance for screen-space reflections. Affects the area from the reflected material to the screen-space reflection).
set_ssr_fade_in ::
                  (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssr_fade_in cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssr_fade_in (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssr_fade_in" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssr_fade_in

{-# NOINLINE bindEnvironment_set_ssr_fade_out #-}

-- | The fade-out distance for screen-space reflections. Affects the area from the screen-space reflection to the "global" reflection.
bindEnvironment_set_ssr_fade_out :: MethodBind
bindEnvironment_set_ssr_fade_out
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssr_fade_out" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fade-out distance for screen-space reflections. Affects the area from the screen-space reflection to the "global" reflection.
set_ssr_fade_out ::
                   (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_ssr_fade_out cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssr_fade_out
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssr_fade_out" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssr_fade_out

{-# NOINLINE bindEnvironment_set_ssr_max_steps #-}

-- | The maximum number of steps for screen-space reflections. Higher values are slower.
bindEnvironment_set_ssr_max_steps :: MethodBind
bindEnvironment_set_ssr_max_steps
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssr_max_steps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum number of steps for screen-space reflections. Higher values are slower.
set_ssr_max_steps ::
                    (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_ssr_max_steps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssr_max_steps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssr_max_steps" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssr_max_steps

{-# NOINLINE bindEnvironment_set_ssr_rough #-}

-- | If @true@, screen-space reflections will take the material roughness into account.
bindEnvironment_set_ssr_rough :: MethodBind
bindEnvironment_set_ssr_rough
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_ssr_rough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, screen-space reflections will take the material roughness into account.
set_ssr_rough ::
                (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ssr_rough cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_ssr_rough (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_ssr_rough" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_ssr_rough

{-# NOINLINE bindEnvironment_set_tonemap_auto_exposure #-}

-- | If @true@, enables the tonemapping auto exposure mode of the scene renderer. If @true@, the renderer will automatically determine the exposure setting to adapt to the scene's illumination and the observed light.
bindEnvironment_set_tonemap_auto_exposure :: MethodBind
bindEnvironment_set_tonemap_auto_exposure
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_tonemap_auto_exposure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the tonemapping auto exposure mode of the scene renderer. If @true@, the renderer will automatically determine the exposure setting to adapt to the scene's illumination and the observed light.
set_tonemap_auto_exposure ::
                            (Environment :< cls, Object :< cls) => cls -> Bool -> IO ()
set_tonemap_auto_exposure cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_tonemap_auto_exposure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_tonemap_auto_exposure" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_tonemap_auto_exposure

{-# NOINLINE bindEnvironment_set_tonemap_auto_exposure_grey #-}

-- | The scale of the auto exposure effect. Affects the intensity of auto exposure.
bindEnvironment_set_tonemap_auto_exposure_grey :: MethodBind
bindEnvironment_set_tonemap_auto_exposure_grey
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_tonemap_auto_exposure_grey" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The scale of the auto exposure effect. Affects the intensity of auto exposure.
set_tonemap_auto_exposure_grey ::
                                 (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_tonemap_auto_exposure_grey cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_set_tonemap_auto_exposure_grey
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_tonemap_auto_exposure_grey"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_tonemap_auto_exposure_grey

{-# NOINLINE bindEnvironment_set_tonemap_auto_exposure_max #-}

-- | The maximum luminance value for the auto exposure.
bindEnvironment_set_tonemap_auto_exposure_max :: MethodBind
bindEnvironment_set_tonemap_auto_exposure_max
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_tonemap_auto_exposure_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum luminance value for the auto exposure.
set_tonemap_auto_exposure_max ::
                                (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_tonemap_auto_exposure_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_set_tonemap_auto_exposure_max
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_tonemap_auto_exposure_max"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_tonemap_auto_exposure_max

{-# NOINLINE bindEnvironment_set_tonemap_auto_exposure_min #-}

-- | The minimum luminance value for the auto exposure.
bindEnvironment_set_tonemap_auto_exposure_min :: MethodBind
bindEnvironment_set_tonemap_auto_exposure_min
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_tonemap_auto_exposure_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum luminance value for the auto exposure.
set_tonemap_auto_exposure_min ::
                                (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_tonemap_auto_exposure_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_set_tonemap_auto_exposure_min
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_tonemap_auto_exposure_min"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_tonemap_auto_exposure_min

{-# NOINLINE bindEnvironment_set_tonemap_auto_exposure_speed #-}

-- | The speed of the auto exposure effect. Affects the time needed for the camera to perform auto exposure.
bindEnvironment_set_tonemap_auto_exposure_speed :: MethodBind
bindEnvironment_set_tonemap_auto_exposure_speed
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_tonemap_auto_exposure_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed of the auto exposure effect. Affects the time needed for the camera to perform auto exposure.
set_tonemap_auto_exposure_speed ::
                                  (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_tonemap_auto_exposure_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEnvironment_set_tonemap_auto_exposure_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_tonemap_auto_exposure_speed"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_tonemap_auto_exposure_speed

{-# NOINLINE bindEnvironment_set_tonemap_exposure #-}

-- | The default exposure used for tonemapping.
bindEnvironment_set_tonemap_exposure :: MethodBind
bindEnvironment_set_tonemap_exposure
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_tonemap_exposure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default exposure used for tonemapping.
set_tonemap_exposure ::
                       (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_tonemap_exposure cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_tonemap_exposure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_tonemap_exposure" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_tonemap_exposure

{-# NOINLINE bindEnvironment_set_tonemap_white #-}

-- | The white reference value for tonemapping. Only effective if the @tonemap_mode@ isn't set to @TONE_MAPPER_LINEAR@.
bindEnvironment_set_tonemap_white :: MethodBind
bindEnvironment_set_tonemap_white
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_tonemap_white" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The white reference value for tonemapping. Only effective if the @tonemap_mode@ isn't set to @TONE_MAPPER_LINEAR@.
set_tonemap_white ::
                    (Environment :< cls, Object :< cls) => cls -> Float -> IO ()
set_tonemap_white cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_tonemap_white
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_tonemap_white" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_tonemap_white

{-# NOINLINE bindEnvironment_set_tonemapper #-}

-- | The tonemapping mode to use. Tonemapping is the process that "converts" HDR values to be suitable for rendering on a LDR display. (Godot doesn't support rendering on HDR displays yet.)
bindEnvironment_set_tonemapper :: MethodBind
bindEnvironment_set_tonemapper
  = unsafePerformIO $
      withCString "Environment" $
        \ clsNamePtr ->
          withCString "set_tonemapper" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tonemapping mode to use. Tonemapping is the process that "converts" HDR values to be suitable for rendering on a LDR display. (Godot doesn't support rendering on HDR displays yet.)
set_tonemapper ::
                 (Environment :< cls, Object :< cls) => cls -> Int -> IO ()
set_tonemapper cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEnvironment_set_tonemapper (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Environment "set_tonemapper" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Environment.set_tonemapper