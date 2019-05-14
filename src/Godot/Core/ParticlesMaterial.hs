{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ParticlesMaterial
       (Godot.Core.ParticlesMaterial._FLAG_ALIGN_Y_TO_VELOCITY,
        Godot.Core.ParticlesMaterial._PARAM_RADIAL_ACCEL,
        Godot.Core.ParticlesMaterial._FLAG_ROTATE_Y,
        Godot.Core.ParticlesMaterial._EMISSION_SHAPE_SPHERE,
        Godot.Core.ParticlesMaterial._PARAM_ANGULAR_VELOCITY,
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
        Godot.Core.ParticlesMaterial.set_spread,
        Godot.Core.ParticlesMaterial.get_spread,
        Godot.Core.ParticlesMaterial.set_flatness,
        Godot.Core.ParticlesMaterial.get_flatness,
        Godot.Core.ParticlesMaterial.set_param,
        Godot.Core.ParticlesMaterial.get_param,
        Godot.Core.ParticlesMaterial.set_param_randomness,
        Godot.Core.ParticlesMaterial.get_param_randomness,
        Godot.Core.ParticlesMaterial.set_param_texture,
        Godot.Core.ParticlesMaterial.get_param_texture,
        Godot.Core.ParticlesMaterial.set_color,
        Godot.Core.ParticlesMaterial.get_color,
        Godot.Core.ParticlesMaterial.set_color_ramp,
        Godot.Core.ParticlesMaterial.get_color_ramp,
        Godot.Core.ParticlesMaterial.set_flag,
        Godot.Core.ParticlesMaterial.get_flag,
        Godot.Core.ParticlesMaterial.set_emission_shape,
        Godot.Core.ParticlesMaterial.get_emission_shape,
        Godot.Core.ParticlesMaterial.set_emission_sphere_radius,
        Godot.Core.ParticlesMaterial.get_emission_sphere_radius,
        Godot.Core.ParticlesMaterial.set_emission_box_extents,
        Godot.Core.ParticlesMaterial.get_emission_box_extents,
        Godot.Core.ParticlesMaterial.set_emission_point_texture,
        Godot.Core.ParticlesMaterial.get_emission_point_texture,
        Godot.Core.ParticlesMaterial.set_emission_normal_texture,
        Godot.Core.ParticlesMaterial.get_emission_normal_texture,
        Godot.Core.ParticlesMaterial.set_emission_color_texture,
        Godot.Core.ParticlesMaterial.get_emission_color_texture,
        Godot.Core.ParticlesMaterial.set_emission_point_count,
        Godot.Core.ParticlesMaterial.get_emission_point_count,
        Godot.Core.ParticlesMaterial.set_trail_divisor,
        Godot.Core.ParticlesMaterial.get_trail_divisor,
        Godot.Core.ParticlesMaterial.set_trail_size_modifier,
        Godot.Core.ParticlesMaterial.get_trail_size_modifier,
        Godot.Core.ParticlesMaterial.set_trail_color_modifier,
        Godot.Core.ParticlesMaterial.get_trail_color_modifier,
        Godot.Core.ParticlesMaterial.get_gravity,
        Godot.Core.ParticlesMaterial.set_gravity)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FLAG_ALIGN_Y_TO_VELOCITY :: Int
_FLAG_ALIGN_Y_TO_VELOCITY = 0

_PARAM_RADIAL_ACCEL :: Int
_PARAM_RADIAL_ACCEL = 4

_FLAG_ROTATE_Y :: Int
_FLAG_ROTATE_Y = 1

_EMISSION_SHAPE_SPHERE :: Int
_EMISSION_SHAPE_SPHERE = 1

_PARAM_ANGULAR_VELOCITY :: Int
_PARAM_ANGULAR_VELOCITY = 1

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

{-# NOINLINE bindParticlesMaterial_set_spread #-}

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Default value: [code]45[/code]. Applied to X/Z plane and Y/Z planes.
bindParticlesMaterial_set_spread :: MethodBind
bindParticlesMaterial_set_spread
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Default value: [code]45[/code]. Applied to X/Z plane and Y/Z planes.
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

{-# NOINLINE bindParticlesMaterial_get_spread #-}

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Default value: [code]45[/code]. Applied to X/Z plane and Y/Z planes.
bindParticlesMaterial_get_spread :: MethodBind
bindParticlesMaterial_get_spread
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Default value: [code]45[/code]. Applied to X/Z plane and Y/Z planes.
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

{-# NOINLINE bindParticlesMaterial_set_flatness #-}

-- | Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane. Default [code]0[/code].
bindParticlesMaterial_set_flatness :: MethodBind
bindParticlesMaterial_set_flatness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_flatness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane. Default [code]0[/code].
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

{-# NOINLINE bindParticlesMaterial_get_flatness #-}

-- | Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane. Default [code]0[/code].
bindParticlesMaterial_get_flatness :: MethodBind
bindParticlesMaterial_get_flatness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_flatness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane. Default [code]0[/code].
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

{-# NOINLINE bindParticlesMaterial_set_param #-}

-- | Initial rotation applied to each particle, in degrees.
--   			Only applied when [member flag_disable_z] or [member flag_rotate_y] are [code]true[/code] or the [SpatialMaterial] being used to draw the particle is using [code]BillboardMode.BILLBOARD_PARTICLES[/code].
bindParticlesMaterial_set_param :: MethodBind
bindParticlesMaterial_set_param
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initial rotation applied to each particle, in degrees.
--   			Only applied when [member flag_disable_z] or [member flag_rotate_y] are [code]true[/code] or the [SpatialMaterial] being used to draw the particle is using [code]BillboardMode.BILLBOARD_PARTICLES[/code].
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

{-# NOINLINE bindParticlesMaterial_get_param #-}

-- | Initial rotation applied to each particle, in degrees.
--   			Only applied when [member flag_disable_z] or [member flag_rotate_y] are [code]true[/code] or the [SpatialMaterial] being used to draw the particle is using [code]BillboardMode.BILLBOARD_PARTICLES[/code].
bindParticlesMaterial_get_param :: MethodBind
bindParticlesMaterial_get_param
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initial rotation applied to each particle, in degrees.
--   			Only applied when [member flag_disable_z] or [member flag_rotate_y] are [code]true[/code] or the [SpatialMaterial] being used to draw the particle is using [code]BillboardMode.BILLBOARD_PARTICLES[/code].
get_param ::
            (ParticlesMaterial :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticlesMaterial_set_param_randomness #-}

-- | Rotation randomness ratio. Default value: [code]0[/code].
bindParticlesMaterial_set_param_randomness :: MethodBind
bindParticlesMaterial_set_param_randomness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_param_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation randomness ratio. Default value: [code]0[/code].
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

{-# NOINLINE bindParticlesMaterial_get_param_randomness #-}

-- | Rotation randomness ratio. Default value: [code]0[/code].
bindParticlesMaterial_get_param_randomness :: MethodBind
bindParticlesMaterial_get_param_randomness
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_param_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation randomness ratio. Default value: [code]0[/code].
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

{-# NOINLINE bindParticlesMaterial_set_param_texture #-}

-- | Each particle's rotation will be animated along this [CurveTexture].
bindParticlesMaterial_set_param_texture :: MethodBind
bindParticlesMaterial_set_param_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_param_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's rotation will be animated along this [CurveTexture].
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

{-# NOINLINE bindParticlesMaterial_get_param_texture #-}

-- | Each particle's rotation will be animated along this [CurveTexture].
bindParticlesMaterial_get_param_texture :: MethodBind
bindParticlesMaterial_get_param_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_param_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's rotation will be animated along this [CurveTexture].
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

{-# NOINLINE bindParticlesMaterial_set_color #-}

-- | Each particle's initial color. If the [Particles2D]'s [code]texture[/code] is defined, it will be multiplied by this color. To have particle display color in a [SpatialMaterial] make sure to set [member SpatialMaterial.vertex_color_use_as_albedo] to [code]true[/code].
bindParticlesMaterial_set_color :: MethodBind
bindParticlesMaterial_set_color
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial color. If the [Particles2D]'s [code]texture[/code] is defined, it will be multiplied by this color. To have particle display color in a [SpatialMaterial] make sure to set [member SpatialMaterial.vertex_color_use_as_albedo] to [code]true[/code].
set_color ::
            (ParticlesMaterial :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticlesMaterial_get_color #-}

-- | Each particle's initial color. If the [Particles2D]'s [code]texture[/code] is defined, it will be multiplied by this color. To have particle display color in a [SpatialMaterial] make sure to set [member SpatialMaterial.vertex_color_use_as_albedo] to [code]true[/code].
bindParticlesMaterial_get_color :: MethodBind
bindParticlesMaterial_get_color
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial color. If the [Particles2D]'s [code]texture[/code] is defined, it will be multiplied by this color. To have particle display color in a [SpatialMaterial] make sure to set [member SpatialMaterial.vertex_color_use_as_albedo] to [code]true[/code].
get_color ::
            (ParticlesMaterial :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticlesMaterial_set_color_ramp #-}

-- | Each particle's color will vary along this [GradientTexture].
bindParticlesMaterial_set_color_ramp :: MethodBind
bindParticlesMaterial_set_color_ramp
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_color_ramp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's color will vary along this [GradientTexture].
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

{-# NOINLINE bindParticlesMaterial_get_color_ramp #-}

-- | Each particle's color will vary along this [GradientTexture].
bindParticlesMaterial_get_color_ramp :: MethodBind
bindParticlesMaterial_get_color_ramp
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_color_ramp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's color will vary along this [GradientTexture].
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

{-# NOINLINE bindParticlesMaterial_set_flag #-}

-- | Align y-axis of particle with the direction of its velocity.
bindParticlesMaterial_set_flag :: MethodBind
bindParticlesMaterial_set_flag
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Align y-axis of particle with the direction of its velocity.
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

{-# NOINLINE bindParticlesMaterial_get_flag #-}

-- | Align y-axis of particle with the direction of its velocity.
bindParticlesMaterial_get_flag :: MethodBind
bindParticlesMaterial_get_flag
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Align y-axis of particle with the direction of its velocity.
get_flag ::
           (ParticlesMaterial :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticlesMaterial_get_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticlesMaterial_set_emission_shape #-}

-- | Particles will be emitted inside this region. Use [code]EMISSION_SHAPE_*[/code] constants for values. Default value: [code]EMISSION_SHAPE_POINT[/code].
bindParticlesMaterial_set_emission_shape :: MethodBind
bindParticlesMaterial_set_emission_shape
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted inside this region. Use [code]EMISSION_SHAPE_*[/code] constants for values. Default value: [code]EMISSION_SHAPE_POINT[/code].
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

{-# NOINLINE bindParticlesMaterial_get_emission_shape #-}

-- | Particles will be emitted inside this region. Use [code]EMISSION_SHAPE_*[/code] constants for values. Default value: [code]EMISSION_SHAPE_POINT[/code].
bindParticlesMaterial_get_emission_shape :: MethodBind
bindParticlesMaterial_get_emission_shape
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted inside this region. Use [code]EMISSION_SHAPE_*[/code] constants for values. Default value: [code]EMISSION_SHAPE_POINT[/code].
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

{-# NOINLINE bindParticlesMaterial_set_emission_sphere_radius #-}

-- | The sphere's radius if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_SPHERE[/code].
bindParticlesMaterial_set_emission_sphere_radius :: MethodBind
bindParticlesMaterial_set_emission_sphere_radius
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_SPHERE[/code].
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

{-# NOINLINE bindParticlesMaterial_get_emission_sphere_radius #-}

-- | The sphere's radius if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_SPHERE[/code].
bindParticlesMaterial_get_emission_sphere_radius :: MethodBind
bindParticlesMaterial_get_emission_sphere_radius
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_SPHERE[/code].
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

{-# NOINLINE bindParticlesMaterial_set_emission_box_extents #-}

-- | The box's extents if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_BOX[/code].
bindParticlesMaterial_set_emission_box_extents :: MethodBind
bindParticlesMaterial_set_emission_box_extents
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_box_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The box's extents if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_BOX[/code].
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

{-# NOINLINE bindParticlesMaterial_get_emission_box_extents #-}

-- | The box's extents if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_BOX[/code].
bindParticlesMaterial_get_emission_box_extents :: MethodBind
bindParticlesMaterial_get_emission_box_extents
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_box_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The box's extents if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_BOX[/code].
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

{-# NOINLINE bindParticlesMaterial_set_emission_point_texture #-}

-- | Particles will be emitted at positions determined by sampling this texture at a random position. Used with [code]EMISSION_SHAPE_POINTS[/code] and [code]EMISSION_SHAPE_DIRECTED_POINTS[/code]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
bindParticlesMaterial_set_emission_point_texture :: MethodBind
bindParticlesMaterial_set_emission_point_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_point_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted at positions determined by sampling this texture at a random position. Used with [code]EMISSION_SHAPE_POINTS[/code] and [code]EMISSION_SHAPE_DIRECTED_POINTS[/code]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
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

{-# NOINLINE bindParticlesMaterial_get_emission_point_texture #-}

-- | Particles will be emitted at positions determined by sampling this texture at a random position. Used with [code]EMISSION_SHAPE_POINTS[/code] and [code]EMISSION_SHAPE_DIRECTED_POINTS[/code]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
bindParticlesMaterial_get_emission_point_texture :: MethodBind
bindParticlesMaterial_get_emission_point_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_point_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted at positions determined by sampling this texture at a random position. Used with [code]EMISSION_SHAPE_POINTS[/code] and [code]EMISSION_SHAPE_DIRECTED_POINTS[/code]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
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

{-# NOINLINE bindParticlesMaterial_set_emission_normal_texture #-}

-- | Particle velocity and rotation will be set by sampling this texture at the same point as the [member emission_point_texture]. Used only in [code]EMISSION_SHAPE_DIRECTED[/code]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
bindParticlesMaterial_set_emission_normal_texture :: MethodBind
bindParticlesMaterial_set_emission_normal_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_normal_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle velocity and rotation will be set by sampling this texture at the same point as the [member emission_point_texture]. Used only in [code]EMISSION_SHAPE_DIRECTED[/code]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
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

{-# NOINLINE bindParticlesMaterial_get_emission_normal_texture #-}

-- | Particle velocity and rotation will be set by sampling this texture at the same point as the [member emission_point_texture]. Used only in [code]EMISSION_SHAPE_DIRECTED[/code]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
bindParticlesMaterial_get_emission_normal_texture :: MethodBind
bindParticlesMaterial_get_emission_normal_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_normal_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle velocity and rotation will be set by sampling this texture at the same point as the [member emission_point_texture]. Used only in [code]EMISSION_SHAPE_DIRECTED[/code]. Can be created automatically from mesh or node by selecting "Create Emission Points from Mesh/Node" under the "Particles" tool in the toolbar.
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

{-# NOINLINE bindParticlesMaterial_set_emission_color_texture #-}

-- | Particle color will be modulated by color determined by sampling this texture at the same point as the [member emission_point_texture].
bindParticlesMaterial_set_emission_color_texture :: MethodBind
bindParticlesMaterial_set_emission_color_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_color_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle color will be modulated by color determined by sampling this texture at the same point as the [member emission_point_texture].
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

{-# NOINLINE bindParticlesMaterial_get_emission_color_texture #-}

-- | Particle color will be modulated by color determined by sampling this texture at the same point as the [member emission_point_texture].
bindParticlesMaterial_get_emission_color_texture :: MethodBind
bindParticlesMaterial_get_emission_color_texture
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_color_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle color will be modulated by color determined by sampling this texture at the same point as the [member emission_point_texture].
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

{-# NOINLINE bindParticlesMaterial_set_emission_point_count #-}

-- | The number of emission points if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_POINTS[/code] or [code]EMISSION_SHAPE_DIRECTED_POINTS[/code].
bindParticlesMaterial_set_emission_point_count :: MethodBind
bindParticlesMaterial_set_emission_point_count
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_emission_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of emission points if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_POINTS[/code] or [code]EMISSION_SHAPE_DIRECTED_POINTS[/code].
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

{-# NOINLINE bindParticlesMaterial_get_emission_point_count #-}

-- | The number of emission points if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_POINTS[/code] or [code]EMISSION_SHAPE_DIRECTED_POINTS[/code].
bindParticlesMaterial_get_emission_point_count :: MethodBind
bindParticlesMaterial_get_emission_point_count
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_emission_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of emission points if [code]emission_shape[/code] is set to [code]EMISSION_SHAPE_POINTS[/code] or [code]EMISSION_SHAPE_DIRECTED_POINTS[/code].
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

{-# NOINLINE bindParticlesMaterial_set_trail_divisor #-}

-- | Emitter will emit [code]amount[/code] divided by [code]trail_divisor[/code] particles. The remaining particles will be used as trail(s).
bindParticlesMaterial_set_trail_divisor :: MethodBind
bindParticlesMaterial_set_trail_divisor
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_trail_divisor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emitter will emit [code]amount[/code] divided by [code]trail_divisor[/code] particles. The remaining particles will be used as trail(s).
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

{-# NOINLINE bindParticlesMaterial_get_trail_divisor #-}

-- | Emitter will emit [code]amount[/code] divided by [code]trail_divisor[/code] particles. The remaining particles will be used as trail(s).
bindParticlesMaterial_get_trail_divisor :: MethodBind
bindParticlesMaterial_get_trail_divisor
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_trail_divisor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emitter will emit [code]amount[/code] divided by [code]trail_divisor[/code] particles. The remaining particles will be used as trail(s).
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

{-# NOINLINE bindParticlesMaterial_set_trail_size_modifier #-}

-- | Trail particles' size will vary along this [CurveTexture].
bindParticlesMaterial_set_trail_size_modifier :: MethodBind
bindParticlesMaterial_set_trail_size_modifier
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_trail_size_modifier" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Trail particles' size will vary along this [CurveTexture].
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

{-# NOINLINE bindParticlesMaterial_get_trail_size_modifier #-}

-- | Trail particles' size will vary along this [CurveTexture].
bindParticlesMaterial_get_trail_size_modifier :: MethodBind
bindParticlesMaterial_get_trail_size_modifier
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_trail_size_modifier" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Trail particles' size will vary along this [CurveTexture].
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

{-# NOINLINE bindParticlesMaterial_set_trail_color_modifier #-}

-- | Trail particles' color will vary along this [GradientTexture].
bindParticlesMaterial_set_trail_color_modifier :: MethodBind
bindParticlesMaterial_set_trail_color_modifier
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_trail_color_modifier" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Trail particles' color will vary along this [GradientTexture].
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

{-# NOINLINE bindParticlesMaterial_get_trail_color_modifier #-}

-- | Trail particles' color will vary along this [GradientTexture].
bindParticlesMaterial_get_trail_color_modifier :: MethodBind
bindParticlesMaterial_get_trail_color_modifier
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_trail_color_modifier" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Trail particles' color will vary along this [GradientTexture].
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

{-# NOINLINE bindParticlesMaterial_get_gravity #-}

-- | Gravity applied to every particle. Default value: [code](0, 98, 0)[/code].
bindParticlesMaterial_get_gravity :: MethodBind
bindParticlesMaterial_get_gravity
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gravity applied to every particle. Default value: [code](0, 98, 0)[/code].
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

{-# NOINLINE bindParticlesMaterial_set_gravity #-}

-- | Gravity applied to every particle. Default value: [code](0, 98, 0)[/code].
bindParticlesMaterial_set_gravity :: MethodBind
bindParticlesMaterial_set_gravity
  = unsafePerformIO $
      withCString "ParticlesMaterial" $
        \ clsNamePtr ->
          withCString "set_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gravity applied to every particle. Default value: [code](0, 98, 0)[/code].
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