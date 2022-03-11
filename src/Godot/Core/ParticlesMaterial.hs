{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ParticlesMaterial
       (Godot.Core.ParticlesMaterial._FLAG_ALIGN_Y_TO_VELOCITY,
        Godot.Core.ParticlesMaterial._PARAM_RADIAL_ACCEL,
        Godot.Core.ParticlesMaterial._FLAG_ROTATE_Y,
        Godot.Core.ParticlesMaterial._EMISSION_SHAPE_SPHERE,
        Godot.Core.ParticlesMaterial._FLAG_DISABLE_Z,
        Godot.Core.ParticlesMaterial._PARAM_ANGULAR_VELOCITY,
        Godot.Core.ParticlesMaterial._EMISSION_SHAPE_MAX,
        Godot.Core.ParticlesMaterial._PARAM_TANGENTIAL_ACCEL,
        Godot.Core.ParticlesMaterial._PARAM_ANIM_SPEED,
        Godot.Core.ParticlesMaterial._EMISSION_SHAPE_BOX,
        Godot.Core.ParticlesMaterial._EMISSION_SHAPE_POINTS,
        Godot.Core.ParticlesMaterial._PARAM_MAX,
        Godot.Core.ParticlesMaterial._PARAM_INITIAL_LINEAR_VELOCITY,
        Godot.Core.ParticlesMaterial._FLAG_MAX,
        Godot.Core.ParticlesMaterial._PARAM_LINEAR_ACCEL,
        Godot.Core.ParticlesMaterial._EMISSION_SHAPE_DIRECTED_POINTS,
        Godot.Core.ParticlesMaterial._EMISSION_SHAPE_POINT,
        Godot.Core.ParticlesMaterial._PARAM_ORBIT_VELOCITY,
        Godot.Core.ParticlesMaterial._PARAM_SCALE,
        Godot.Core.ParticlesMaterial._PARAM_DAMPING,
        Godot.Core.ParticlesMaterial._PARAM_HUE_VARIATION,
        Godot.Core.ParticlesMaterial._PARAM_ANIM_OFFSET,
        Godot.Core.ParticlesMaterial._PARAM_ANGLE,
        Godot.Core.ParticlesMaterial.get_color,
        Godot.Core.ParticlesMaterial.get_color_ramp,
        Godot.Core.ParticlesMaterial.get_direction,
        Godot.Core.ParticlesMaterial.get_emission_box_extents,
        Godot.Core.ParticlesMaterial.get_emission_color_texture,
        Godot.Core.ParticlesMaterial.get_emission_normal_texture,
        Godot.Core.ParticlesMaterial.get_emission_point_count,
        Godot.Core.ParticlesMaterial.get_emission_point_texture,
        Godot.Core.ParticlesMaterial.get_emission_shape,
        Godot.Core.ParticlesMaterial.get_emission_sphere_radius,
        Godot.Core.ParticlesMaterial.get_flag,
        Godot.Core.ParticlesMaterial.get_flatness,
        Godot.Core.ParticlesMaterial.get_gravity,
        Godot.Core.ParticlesMaterial.get_lifetime_randomness,
        Godot.Core.ParticlesMaterial.get_param,
        Godot.Core.ParticlesMaterial.get_param_randomness,
        Godot.Core.ParticlesMaterial.get_param_texture,
        Godot.Core.ParticlesMaterial.get_spread,
        Godot.Core.ParticlesMaterial.get_trail_color_modifier,
        Godot.Core.ParticlesMaterial.get_trail_divisor,
        Godot.Core.ParticlesMaterial.get_trail_size_modifier,
        Godot.Core.ParticlesMaterial.set_color,
        Godot.Core.ParticlesMaterial.set_color_ramp,
        Godot.Core.ParticlesMaterial.set_direction,
        Godot.Core.ParticlesMaterial.set_emission_box_extents,
        Godot.Core.ParticlesMaterial.set_emission_color_texture,
        Godot.Core.ParticlesMaterial.set_emission_normal_texture,
        Godot.Core.ParticlesMaterial.set_emission_point_count,
        Godot.Core.ParticlesMaterial.set_emission_point_texture,
        Godot.Core.ParticlesMaterial.set_emission_shape,
        Godot.Core.ParticlesMaterial.set_emission_sphere_radius,
        Godot.Core.ParticlesMaterial.set_flag,
        Godot.Core.ParticlesMaterial.set_flatness,
        Godot.Core.ParticlesMaterial.set_gravity,
        Godot.Core.ParticlesMaterial.set_lifetime_randomness,
        Godot.Core.ParticlesMaterial.set_param,
        Godot.Core.ParticlesMaterial.set_param_randomness,
        Godot.Core.ParticlesMaterial.set_param_texture,
        Godot.Core.ParticlesMaterial.set_spread,
        Godot.Core.ParticlesMaterial.set_trail_color_modifier,
        Godot.Core.ParticlesMaterial.set_trail_divisor,
        Godot.Core.ParticlesMaterial.set_trail_size_modifier)
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

_FLAG_ALIGN_Y_TO_VELOCITY :: Int
_FLAG_ALIGN_Y_TO_VELOCITY = 0

_PARAM_RADIAL_ACCEL :: Int
_PARAM_RADIAL_ACCEL = 4

_FLAG_ROTATE_Y :: Int
_FLAG_ROTATE_Y = 1

_EMISSION_SHAPE_SPHERE :: Int
_EMISSION_SHAPE_SPHERE = 1

_FLAG_DISABLE_Z :: Int
_FLAG_DISABLE_Z = 2

_PARAM_ANGULAR_VELOCITY :: Int
_PARAM_ANGULAR_VELOCITY = 1

_EMISSION_SHAPE_MAX :: Int
_EMISSION_SHAPE_MAX = 5

_PARAM_TANGENTIAL_ACCEL :: Int
_PARAM_TANGENTIAL_ACCEL = 5

_PARAM_ANIM_SPEED :: Int
_PARAM_ANIM_SPEED = 10

_EMISSION_SHAPE_BOX :: Int
_EMISSION_SHAPE_BOX = 2

_EMISSION_SHAPE_POINTS :: Int
_EMISSION_SHAPE_POINTS = 3

_PARAM_MAX :: Int
_PARAM_MAX = 12

_PARAM_INITIAL_LINEAR_VELOCITY :: Int
_PARAM_INITIAL_LINEAR_VELOCITY = 0

_FLAG_MAX :: Int
_FLAG_MAX = 3

_PARAM_LINEAR_ACCEL :: Int
_PARAM_LINEAR_ACCEL = 3

_EMISSION_SHAPE_DIRECTED_POINTS :: Int
_EMISSION_SHAPE_DIRECTED_POINTS = 4

_EMISSION_SHAPE_POINT :: Int
_EMISSION_SHAPE_POINT = 0

_PARAM_ORBIT_VELOCITY :: Int
_PARAM_ORBIT_VELOCITY = 2

_PARAM_SCALE :: Int
_PARAM_SCALE = 8

_PARAM_DAMPING :: Int
_PARAM_DAMPING = 6

_PARAM_HUE_VARIATION :: Int
_PARAM_HUE_VARIATION = 9

_PARAM_ANIM_OFFSET :: Int
_PARAM_ANIM_OFFSET = 11

_PARAM_ANGLE :: Int
_PARAM_ANGLE = 7

instance NodeProperty ParticlesMaterial "angle" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 7 get_param, wrapIndexedSetter 7 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "angle_curve" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_param_texture,
             wrapIndexedSetter 7 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "angle_random" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_param_randomness,
             wrapIndexedSetter 7 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "angular_velocity" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_param, wrapIndexedSetter 1 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "angular_velocity_curve"
           Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_param_texture,
             wrapIndexedSetter 1 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "angular_velocity_random"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_param_randomness,
             wrapIndexedSetter 1 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "anim_offset" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_param, wrapIndexedSetter 11 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "anim_offset_curve" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_param_texture,
             wrapIndexedSetter 11 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "anim_offset_random" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_param_randomness,
             wrapIndexedSetter 11 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "anim_speed" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_param, wrapIndexedSetter 10 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "anim_speed_curve" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_param_texture,
             wrapIndexedSetter 10 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "anim_speed_random" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_param_randomness,
             wrapIndexedSetter 10 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "color" Color 'False where
        nodeProperty = (get_color, wrapDroppingSetter set_color, Nothing)

instance NodeProperty ParticlesMaterial "color_ramp" Texture 'False
         where
        nodeProperty
          = (get_color_ramp, wrapDroppingSetter set_color_ramp, Nothing)

instance NodeProperty ParticlesMaterial "damping" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_param, wrapIndexedSetter 6 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "damping_curve" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_param_texture,
             wrapIndexedSetter 6 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "damping_random" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_param_randomness,
             wrapIndexedSetter 6 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "direction" Vector3 'False
         where
        nodeProperty
          = (get_direction, wrapDroppingSetter set_direction, Nothing)

instance NodeProperty ParticlesMaterial "emission_box_extents"
           Vector3
           'False
         where
        nodeProperty
          = (get_emission_box_extents,
             wrapDroppingSetter set_emission_box_extents, Nothing)

instance NodeProperty ParticlesMaterial "emission_color_texture"
           Texture
           'False
         where
        nodeProperty
          = (get_emission_color_texture,
             wrapDroppingSetter set_emission_color_texture, Nothing)

instance NodeProperty ParticlesMaterial "emission_normal_texture"
           Texture
           'False
         where
        nodeProperty
          = (get_emission_normal_texture,
             wrapDroppingSetter set_emission_normal_texture, Nothing)

instance NodeProperty ParticlesMaterial "emission_point_count" Int
           'False
         where
        nodeProperty
          = (get_emission_point_count,
             wrapDroppingSetter set_emission_point_count, Nothing)

instance NodeProperty ParticlesMaterial "emission_point_texture"
           Texture
           'False
         where
        nodeProperty
          = (get_emission_point_texture,
             wrapDroppingSetter set_emission_point_texture, Nothing)

instance NodeProperty ParticlesMaterial "emission_shape" Int 'False
         where
        nodeProperty
          = (get_emission_shape, wrapDroppingSetter set_emission_shape,
             Nothing)

instance NodeProperty ParticlesMaterial "emission_sphere_radius"
           Float
           'False
         where
        nodeProperty
          = (get_emission_sphere_radius,
             wrapDroppingSetter set_emission_sphere_radius, Nothing)

instance NodeProperty ParticlesMaterial "flag_align_y" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_flag, wrapIndexedSetter 0 set_flag,
             Nothing)

instance NodeProperty ParticlesMaterial "flag_disable_z" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_flag, wrapIndexedSetter 2 set_flag,
             Nothing)

instance NodeProperty ParticlesMaterial "flag_rotate_y" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_flag, wrapIndexedSetter 1 set_flag,
             Nothing)

instance NodeProperty ParticlesMaterial "flatness" Float 'False
         where
        nodeProperty
          = (get_flatness, wrapDroppingSetter set_flatness, Nothing)

instance NodeProperty ParticlesMaterial "gravity" Vector3 'False
         where
        nodeProperty
          = (get_gravity, wrapDroppingSetter set_gravity, Nothing)

instance NodeProperty ParticlesMaterial "hue_variation" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_param, wrapIndexedSetter 9 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "hue_variation_curve"
           Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_param_texture,
             wrapIndexedSetter 9 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "hue_variation_random"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_param_randomness,
             wrapIndexedSetter 9 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "initial_velocity" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_param, wrapIndexedSetter 0 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "initial_velocity_random"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_param_randomness,
             wrapIndexedSetter 0 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "lifetime_randomness" Float
           'False
         where
        nodeProperty
          = (get_lifetime_randomness,
             wrapDroppingSetter set_lifetime_randomness, Nothing)

instance NodeProperty ParticlesMaterial "linear_accel" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_param, wrapIndexedSetter 3 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "linear_accel_curve"
           Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_param_texture,
             wrapIndexedSetter 3 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "linear_accel_random" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_param_randomness,
             wrapIndexedSetter 3 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "orbit_velocity" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_param, wrapIndexedSetter 2 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "orbit_velocity_curve"
           Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_param_texture,
             wrapIndexedSetter 2 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "orbit_velocity_random"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_param_randomness,
             wrapIndexedSetter 2 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "radial_accel" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param, wrapIndexedSetter 4 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "radial_accel_curve"
           Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param_texture,
             wrapIndexedSetter 4 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "radial_accel_random" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_param_randomness,
             wrapIndexedSetter 4 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "scale" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 8 get_param, wrapIndexedSetter 8 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "scale_curve" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_param_texture,
             wrapIndexedSetter 8 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "scale_random" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_param_randomness,
             wrapIndexedSetter 8 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "spread" Float 'False where
        nodeProperty = (get_spread, wrapDroppingSetter set_spread, Nothing)

instance NodeProperty ParticlesMaterial "tangential_accel" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_param, wrapIndexedSetter 5 set_param,
             Nothing)

instance NodeProperty ParticlesMaterial "tangential_accel_curve"
           Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_param_texture,
             wrapIndexedSetter 5 set_param_texture, Nothing)

instance NodeProperty ParticlesMaterial "tangential_accel_random"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_param_randomness,
             wrapIndexedSetter 5 set_param_randomness, Nothing)

instance NodeProperty ParticlesMaterial "trail_color_modifier"
           GradientTexture
           'False
         where
        nodeProperty
          = (get_trail_color_modifier,
             wrapDroppingSetter set_trail_color_modifier, Nothing)

instance NodeProperty ParticlesMaterial "trail_divisor" Int 'False
         where
        nodeProperty
          = (get_trail_divisor, wrapDroppingSetter set_trail_divisor,
             Nothing)

instance NodeProperty ParticlesMaterial "trail_size_modifier"
           CurveTexture
           'False
         where
        nodeProperty
          = (get_trail_size_modifier,
             wrapDroppingSetter set_trail_size_modifier, Nothing)

{-# NOINLINE bindParticlesMaterial_get_color #-}

-- | Each particle's initial color. If the @Particles2D@'s @texture@ is defined, it will be multiplied by this color. To have particle display color in a @SpatialMaterial@ make sure to set @SpatialMaterial.vertex_color_use_as_albedo@ to @true@.
bindParticlesMaterial_get_color :: MethodBind
bindParticlesMaterial_get_color
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial color. If the @Particles2D@'s @texture@ is defined, it will be multiplied by this color. To have particle display color in a @SpatialMaterial@ make sure to set @SpatialMaterial.vertex_color_use_as_albedo@ to @true@.
get_color ::
            (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_color

{-# NOINLINE bindParticlesMaterial_get_color_ramp #-}

-- | Each particle's color will vary along this @GradientTexture@ over its lifetime (multiplied with @color@).
bindParticlesMaterial_get_color_ramp :: MethodBind
bindParticlesMaterial_get_color_ramp
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_color_ramp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's color will vary along this @GradientTexture@ over its lifetime (multiplied with @color@).
get_color_ramp ::
                 (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Texture
get_color_ramp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_color_ramp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_color_ramp" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_color_ramp

{-# NOINLINE bindParticlesMaterial_get_direction #-}

-- | Unit vector specifying the particles' emission direction.
bindParticlesMaterial_get_direction :: MethodBind
bindParticlesMaterial_get_direction
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unit vector specifying the particles' emission direction.
get_direction ::
                (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Vector3
get_direction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_direction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_direction" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_direction

{-# NOINLINE bindParticlesMaterial_get_emission_box_extents #-}

-- | The box's extents if @emission_shape@ is set to @EMISSION_SHAPE_BOX@.
bindParticlesMaterial_get_emission_box_extents :: MethodBind
bindParticlesMaterial_get_emission_box_extents
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_box_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The box's extents if @emission_shape@ is set to @EMISSION_SHAPE_BOX@.
get_emission_box_extents ::
                           (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Vector3
get_emission_box_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_emission_box_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_emission_box_extents"
           '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_emission_box_extents

{-# NOINLINE bindParticlesMaterial_get_emission_color_texture #-}

-- | Particle color will be modulated by color determined by sampling this texture at the same point as the @emission_point_texture@.
bindParticlesMaterial_get_emission_color_texture :: MethodBind
bindParticlesMaterial_get_emission_color_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_color_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle color will be modulated by color determined by sampling this texture at the same point as the @emission_point_texture@.
get_emission_color_texture ::
                             (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Texture
get_emission_color_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_emission_color_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_emission_color_texture"
           '[]
           (IO Texture)
         where
        nodeMethod
          = Godot.Core.ParticlesMaterial.get_emission_color_texture

{-# NOINLINE bindParticlesMaterial_get_emission_normal_texture #-}

-- | Particle velocity and rotation will be set by sampling this texture at the same point as the @emission_point_texture@. Used only in @EMISSION_SHAPE_DIRECTED_POINTS@. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
bindParticlesMaterial_get_emission_normal_texture :: MethodBind
bindParticlesMaterial_get_emission_normal_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_normal_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle velocity and rotation will be set by sampling this texture at the same point as the @emission_point_texture@. Used only in @EMISSION_SHAPE_DIRECTED_POINTS@. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
get_emission_normal_texture ::
                              (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Texture
get_emission_normal_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_emission_normal_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_emission_normal_texture"
           '[]
           (IO Texture)
         where
        nodeMethod
          = Godot.Core.ParticlesMaterial.get_emission_normal_texture

{-# NOINLINE bindParticlesMaterial_get_emission_point_count #-}

-- | The number of emission points if @emission_shape@ is set to @EMISSION_SHAPE_POINTS@ or @EMISSION_SHAPE_DIRECTED_POINTS@.
bindParticlesMaterial_get_emission_point_count :: MethodBind
bindParticlesMaterial_get_emission_point_count
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of emission points if @emission_shape@ is set to @EMISSION_SHAPE_POINTS@ or @EMISSION_SHAPE_DIRECTED_POINTS@.
get_emission_point_count ::
                           (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Int
get_emission_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_emission_point_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_emission_point_count"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_emission_point_count

{-# NOINLINE bindParticlesMaterial_get_emission_point_texture #-}

-- | Particles will be emitted at positions determined by sampling this texture at a random position. Used with @EMISSION_SHAPE_POINTS@ and @EMISSION_SHAPE_DIRECTED_POINTS@. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
bindParticlesMaterial_get_emission_point_texture :: MethodBind
bindParticlesMaterial_get_emission_point_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_point_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted at positions determined by sampling this texture at a random position. Used with @EMISSION_SHAPE_POINTS@ and @EMISSION_SHAPE_DIRECTED_POINTS@. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
get_emission_point_texture ::
                             (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Texture
get_emission_point_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_emission_point_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_emission_point_texture"
           '[]
           (IO Texture)
         where
        nodeMethod
          = Godot.Core.ParticlesMaterial.get_emission_point_texture

{-# NOINLINE bindParticlesMaterial_get_emission_shape #-}

-- | Particles will be emitted inside this region. Use @enum EmissionShape@ constants for values.
bindParticlesMaterial_get_emission_shape :: MethodBind
bindParticlesMaterial_get_emission_shape
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted inside this region. Use @enum EmissionShape@ constants for values.
get_emission_shape ::
                     (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Int
get_emission_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_emission_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_emission_shape" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_emission_shape

{-# NOINLINE bindParticlesMaterial_get_emission_sphere_radius #-}

-- | The sphere's radius if @emission_shape@ is set to @EMISSION_SHAPE_SPHERE@.
bindParticlesMaterial_get_emission_sphere_radius :: MethodBind
bindParticlesMaterial_get_emission_sphere_radius
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius if @emission_shape@ is set to @EMISSION_SHAPE_SPHERE@.
get_emission_sphere_radius ::
                             (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Float
get_emission_sphere_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_emission_sphere_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_emission_sphere_radius"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.ParticlesMaterial.get_emission_sphere_radius

{-# NOINLINE bindParticlesMaterial_get_flag #-}

-- | Returns @true@ if the specified flag is enabled.
bindParticlesMaterial_get_flag :: MethodBind
bindParticlesMaterial_get_flag
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified flag is enabled.
get_flag ::
           (ParticlesMaterial :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_flag" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_flag

{-# NOINLINE bindParticlesMaterial_get_flatness #-}

-- | Amount of @spread@ along the Y axis.
bindParticlesMaterial_get_flatness :: MethodBind
bindParticlesMaterial_get_flatness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_flatness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of @spread@ along the Y axis.
get_flatness ::
               (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Float
get_flatness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_flatness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_flatness" '[] (IO Float)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_flatness

{-# NOINLINE bindParticlesMaterial_get_gravity #-}

-- | Gravity applied to every particle.
bindParticlesMaterial_get_gravity :: MethodBind
bindParticlesMaterial_get_gravity
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gravity applied to every particle.
get_gravity ::
              (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Vector3
get_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_gravity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_gravity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_gravity

{-# NOINLINE bindParticlesMaterial_get_lifetime_randomness #-}

-- | Particle lifetime randomness ratio.
bindParticlesMaterial_get_lifetime_randomness :: MethodBind
bindParticlesMaterial_get_lifetime_randomness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_lifetime_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle lifetime randomness ratio.
get_lifetime_randomness ::
                          (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Float
get_lifetime_randomness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_lifetime_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_lifetime_randomness" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_lifetime_randomness

{-# NOINLINE bindParticlesMaterial_get_param #-}

-- | Returns the value of the specified parameter.
bindParticlesMaterial_get_param :: MethodBind
bindParticlesMaterial_get_param
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the specified parameter.
get_param ::
            (ParticlesMaterial :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_param" '[Int] (IO Float)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_param

{-# NOINLINE bindParticlesMaterial_get_param_randomness #-}

-- | Returns the randomness ratio associated with the specified parameter.
bindParticlesMaterial_get_param_randomness :: MethodBind
bindParticlesMaterial_get_param_randomness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_param_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the randomness ratio associated with the specified parameter.
get_param_randomness ::
                       (ParticlesMaterial :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_randomness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_param_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_param_randomness" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_param_randomness

{-# NOINLINE bindParticlesMaterial_get_param_texture #-}

-- | Returns the @Texture@ used by the specified parameter.
bindParticlesMaterial_get_param_texture :: MethodBind
bindParticlesMaterial_get_param_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_param_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Texture@ used by the specified parameter.
get_param_texture ::
                    (ParticlesMaterial :< cls, Object :< cls) =>
                    cls -> Int -> IO Texture
get_param_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_param_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_param_texture" '[Int]
           (IO Texture)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_param_texture

{-# NOINLINE bindParticlesMaterial_get_spread #-}

-- | Each particle's initial direction range from @+spread@ to @-spread@ degrees.
bindParticlesMaterial_get_spread :: MethodBind
bindParticlesMaterial_get_spread
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial direction range from @+spread@ to @-spread@ degrees.
get_spread ::
             (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Float
get_spread cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_spread
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_spread" '[] (IO Float)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_spread

{-# NOINLINE bindParticlesMaterial_get_trail_color_modifier #-}

-- | Trail particles' color will vary along this @GradientTexture@.
bindParticlesMaterial_get_trail_color_modifier :: MethodBind
bindParticlesMaterial_get_trail_color_modifier
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_trail_color_modifier" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Trail particles' color will vary along this @GradientTexture@.
get_trail_color_modifier ::
                           (ParticlesMaterial :< cls, Object :< cls) =>
                           cls -> IO GradientTexture
get_trail_color_modifier cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_trail_color_modifier
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_trail_color_modifier"
           '[]
           (IO GradientTexture)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_trail_color_modifier

{-# NOINLINE bindParticlesMaterial_get_trail_divisor #-}

-- | Emitter will emit @amount@ divided by @trail_divisor@ particles. The remaining particles will be used as trail(s).
bindParticlesMaterial_get_trail_divisor :: MethodBind
bindParticlesMaterial_get_trail_divisor
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_trail_divisor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emitter will emit @amount@ divided by @trail_divisor@ particles. The remaining particles will be used as trail(s).
get_trail_divisor ::
                    (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Int
get_trail_divisor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_trail_divisor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_trail_divisor" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_trail_divisor

{-# NOINLINE bindParticlesMaterial_get_trail_size_modifier #-}

-- | Trail particles' size will vary along this @CurveTexture@.
bindParticlesMaterial_get_trail_size_modifier :: MethodBind
bindParticlesMaterial_get_trail_size_modifier
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_trail_size_modifier" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Trail particles' size will vary along this @CurveTexture@.
get_trail_size_modifier ::
                          (ParticlesMaterial :< cls, Object :< cls) => cls -> IO CurveTexture
get_trail_size_modifier cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_get_trail_size_modifier
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "get_trail_size_modifier" '[]
           (IO CurveTexture)
         where
        nodeMethod = Godot.Core.ParticlesMaterial.get_trail_size_modifier

{-# NOINLINE bindParticlesMaterial_set_color #-}

-- | Each particle's initial color. If the @Particles2D@'s @texture@ is defined, it will be multiplied by this color. To have particle display color in a @SpatialMaterial@ make sure to set @SpatialMaterial.vertex_color_use_as_albedo@ to @true@.
bindParticlesMaterial_set_color :: MethodBind
bindParticlesMaterial_set_color
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial color. If the @Particles2D@'s @texture@ is defined, it will be multiplied by this color. To have particle display color in a @SpatialMaterial@ make sure to set @SpatialMaterial.vertex_color_use_as_albedo@ to @true@.
set_color ::
            (ParticlesMaterial :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_color

{-# NOINLINE bindParticlesMaterial_set_color_ramp #-}

-- | Each particle's color will vary along this @GradientTexture@ over its lifetime (multiplied with @color@).
bindParticlesMaterial_set_color_ramp :: MethodBind
bindParticlesMaterial_set_color_ramp
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_color_ramp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's color will vary along this @GradientTexture@ over its lifetime (multiplied with @color@).
set_color_ramp ::
                 (ParticlesMaterial :< cls, Object :< cls) =>
                 cls -> Texture -> IO ()
set_color_ramp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_color_ramp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_color_ramp" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_color_ramp

{-# NOINLINE bindParticlesMaterial_set_direction #-}

-- | Unit vector specifying the particles' emission direction.
bindParticlesMaterial_set_direction :: MethodBind
bindParticlesMaterial_set_direction
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unit vector specifying the particles' emission direction.
set_direction ::
                (ParticlesMaterial :< cls, Object :< cls) =>
                cls -> Vector3 -> IO ()
set_direction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_direction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_direction" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_direction

{-# NOINLINE bindParticlesMaterial_set_emission_box_extents #-}

-- | The box's extents if @emission_shape@ is set to @EMISSION_SHAPE_BOX@.
bindParticlesMaterial_set_emission_box_extents :: MethodBind
bindParticlesMaterial_set_emission_box_extents
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_box_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The box's extents if @emission_shape@ is set to @EMISSION_SHAPE_BOX@.
set_emission_box_extents ::
                           (ParticlesMaterial :< cls, Object :< cls) =>
                           cls -> Vector3 -> IO ()
set_emission_box_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_emission_box_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_emission_box_extents"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_emission_box_extents

{-# NOINLINE bindParticlesMaterial_set_emission_color_texture #-}

-- | Particle color will be modulated by color determined by sampling this texture at the same point as the @emission_point_texture@.
bindParticlesMaterial_set_emission_color_texture :: MethodBind
bindParticlesMaterial_set_emission_color_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_color_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle color will be modulated by color determined by sampling this texture at the same point as the @emission_point_texture@.
set_emission_color_texture ::
                             (ParticlesMaterial :< cls, Object :< cls) =>
                             cls -> Texture -> IO ()
set_emission_color_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_emission_color_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_emission_color_texture"
           '[Texture]
           (IO ())
         where
        nodeMethod
          = Godot.Core.ParticlesMaterial.set_emission_color_texture

{-# NOINLINE bindParticlesMaterial_set_emission_normal_texture #-}

-- | Particle velocity and rotation will be set by sampling this texture at the same point as the @emission_point_texture@. Used only in @EMISSION_SHAPE_DIRECTED_POINTS@. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
bindParticlesMaterial_set_emission_normal_texture :: MethodBind
bindParticlesMaterial_set_emission_normal_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_normal_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle velocity and rotation will be set by sampling this texture at the same point as the @emission_point_texture@. Used only in @EMISSION_SHAPE_DIRECTED_POINTS@. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
set_emission_normal_texture ::
                              (ParticlesMaterial :< cls, Object :< cls) =>
                              cls -> Texture -> IO ()
set_emission_normal_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_emission_normal_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_emission_normal_texture"
           '[Texture]
           (IO ())
         where
        nodeMethod
          = Godot.Core.ParticlesMaterial.set_emission_normal_texture

{-# NOINLINE bindParticlesMaterial_set_emission_point_count #-}

-- | The number of emission points if @emission_shape@ is set to @EMISSION_SHAPE_POINTS@ or @EMISSION_SHAPE_DIRECTED_POINTS@.
bindParticlesMaterial_set_emission_point_count :: MethodBind
bindParticlesMaterial_set_emission_point_count
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of emission points if @emission_shape@ is set to @EMISSION_SHAPE_POINTS@ or @EMISSION_SHAPE_DIRECTED_POINTS@.
set_emission_point_count ::
                           (ParticlesMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_emission_point_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_emission_point_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_emission_point_count"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_emission_point_count

{-# NOINLINE bindParticlesMaterial_set_emission_point_texture #-}

-- | Particles will be emitted at positions determined by sampling this texture at a random position. Used with @EMISSION_SHAPE_POINTS@ and @EMISSION_SHAPE_DIRECTED_POINTS@. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
bindParticlesMaterial_set_emission_point_texture :: MethodBind
bindParticlesMaterial_set_emission_point_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_point_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted at positions determined by sampling this texture at a random position. Used with @EMISSION_SHAPE_POINTS@ and @EMISSION_SHAPE_DIRECTED_POINTS@. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
set_emission_point_texture ::
                             (ParticlesMaterial :< cls, Object :< cls) =>
                             cls -> Texture -> IO ()
set_emission_point_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_emission_point_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_emission_point_texture"
           '[Texture]
           (IO ())
         where
        nodeMethod
          = Godot.Core.ParticlesMaterial.set_emission_point_texture

{-# NOINLINE bindParticlesMaterial_set_emission_shape #-}

-- | Particles will be emitted inside this region. Use @enum EmissionShape@ constants for values.
bindParticlesMaterial_set_emission_shape :: MethodBind
bindParticlesMaterial_set_emission_shape
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted inside this region. Use @enum EmissionShape@ constants for values.
set_emission_shape ::
                     (ParticlesMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_emission_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_emission_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_emission_shape" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_emission_shape

{-# NOINLINE bindParticlesMaterial_set_emission_sphere_radius #-}

-- | The sphere's radius if @emission_shape@ is set to @EMISSION_SHAPE_SPHERE@.
bindParticlesMaterial_set_emission_sphere_radius :: MethodBind
bindParticlesMaterial_set_emission_sphere_radius
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius if @emission_shape@ is set to @EMISSION_SHAPE_SPHERE@.
set_emission_sphere_radius ::
                             (ParticlesMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_emission_sphere_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_emission_sphere_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_emission_sphere_radius"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.ParticlesMaterial.set_emission_sphere_radius

{-# NOINLINE bindParticlesMaterial_set_flag #-}

-- | If @true@, enables the specified flag. See @enum Flags@ for options.
bindParticlesMaterial_set_flag :: MethodBind
bindParticlesMaterial_set_flag
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables the specified flag. See @enum Flags@ for options.
set_flag ::
           (ParticlesMaterial :< cls, Object :< cls) =>
           cls -> Int -> Bool -> IO ()
set_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_flag" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_flag

{-# NOINLINE bindParticlesMaterial_set_flatness #-}

-- | Amount of @spread@ along the Y axis.
bindParticlesMaterial_set_flatness :: MethodBind
bindParticlesMaterial_set_flatness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_flatness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of @spread@ along the Y axis.
set_flatness ::
               (ParticlesMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_flatness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_flatness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_flatness" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_flatness

{-# NOINLINE bindParticlesMaterial_set_gravity #-}

-- | Gravity applied to every particle.
bindParticlesMaterial_set_gravity :: MethodBind
bindParticlesMaterial_set_gravity
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gravity applied to every particle.
set_gravity ::
              (ParticlesMaterial :< cls, Object :< cls) =>
              cls -> Vector3 -> IO ()
set_gravity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_gravity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_gravity" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_gravity

{-# NOINLINE bindParticlesMaterial_set_lifetime_randomness #-}

-- | Particle lifetime randomness ratio.
bindParticlesMaterial_set_lifetime_randomness :: MethodBind
bindParticlesMaterial_set_lifetime_randomness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_lifetime_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle lifetime randomness ratio.
set_lifetime_randomness ::
                          (ParticlesMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime_randomness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_lifetime_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_lifetime_randomness"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_lifetime_randomness

{-# NOINLINE bindParticlesMaterial_set_param #-}

-- | Sets the specified @enum Parameter@.
bindParticlesMaterial_set_param :: MethodBind
bindParticlesMaterial_set_param
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified @enum Parameter@.
set_param ::
            (ParticlesMaterial :< cls, Object :< cls) =>
            cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_param" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_param

{-# NOINLINE bindParticlesMaterial_set_param_randomness #-}

-- | Sets the randomness ratio for the specified @enum Parameter@.
bindParticlesMaterial_set_param_randomness :: MethodBind
bindParticlesMaterial_set_param_randomness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_param_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the randomness ratio for the specified @enum Parameter@.
set_param_randomness ::
                       (ParticlesMaterial :< cls, Object :< cls) =>
                       cls -> Int -> Float -> IO ()
set_param_randomness cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_param_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_param_randomness"
           '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_param_randomness

{-# NOINLINE bindParticlesMaterial_set_param_texture #-}

-- | Sets the @Texture@ for the specified @enum Parameter@.
bindParticlesMaterial_set_param_texture :: MethodBind
bindParticlesMaterial_set_param_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_param_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Texture@ for the specified @enum Parameter@.
set_param_texture ::
                    (ParticlesMaterial :< cls, Object :< cls) =>
                    cls -> Int -> Texture -> IO ()
set_param_texture cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_param_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_param_texture"
           '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_param_texture

{-# NOINLINE bindParticlesMaterial_set_spread #-}

-- | Each particle's initial direction range from @+spread@ to @-spread@ degrees.
bindParticlesMaterial_set_spread :: MethodBind
bindParticlesMaterial_set_spread
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial direction range from @+spread@ to @-spread@ degrees.
set_spread ::
             (ParticlesMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_spread cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_spread
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_spread" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_spread

{-# NOINLINE bindParticlesMaterial_set_trail_color_modifier #-}

-- | Trail particles' color will vary along this @GradientTexture@.
bindParticlesMaterial_set_trail_color_modifier :: MethodBind
bindParticlesMaterial_set_trail_color_modifier
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_trail_color_modifier" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Trail particles' color will vary along this @GradientTexture@.
set_trail_color_modifier ::
                           (ParticlesMaterial :< cls, Object :< cls) =>
                           cls -> GradientTexture -> IO ()
set_trail_color_modifier cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_trail_color_modifier
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_trail_color_modifier"
           '[GradientTexture]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_trail_color_modifier

{-# NOINLINE bindParticlesMaterial_set_trail_divisor #-}

-- | Emitter will emit @amount@ divided by @trail_divisor@ particles. The remaining particles will be used as trail(s).
bindParticlesMaterial_set_trail_divisor :: MethodBind
bindParticlesMaterial_set_trail_divisor
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_trail_divisor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emitter will emit @amount@ divided by @trail_divisor@ particles. The remaining particles will be used as trail(s).
set_trail_divisor ::
                    (ParticlesMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_trail_divisor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_trail_divisor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_trail_divisor" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_trail_divisor

{-# NOINLINE bindParticlesMaterial_set_trail_size_modifier #-}

-- | Trail particles' size will vary along this @CurveTexture@.
bindParticlesMaterial_set_trail_size_modifier :: MethodBind
bindParticlesMaterial_set_trail_size_modifier
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_trail_size_modifier" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Trail particles' size will vary along this @CurveTexture@.
set_trail_size_modifier ::
                          (ParticlesMaterial :< cls, Object :< cls) =>
                          cls -> CurveTexture -> IO ()
set_trail_size_modifier cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParticlesMaterial_set_trail_size_modifier
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParticlesMaterial "set_trail_size_modifier"
           '[CurveTexture]
           (IO ())
         where
        nodeMethod = Godot.Core.ParticlesMaterial.set_trail_size_modifier