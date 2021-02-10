{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CPUParticles
       (Godot.Core.CPUParticles._FLAG_ALIGN_Y_TO_VELOCITY,
        Godot.Core.CPUParticles._PARAM_RADIAL_ACCEL,
        Godot.Core.CPUParticles._FLAG_ROTATE_Y,
        Godot.Core.CPUParticles._EMISSION_SHAPE_SPHERE,
        Godot.Core.CPUParticles._FLAG_DISABLE_Z,
        Godot.Core.CPUParticles._PARAM_ANGULAR_VELOCITY,
        Godot.Core.CPUParticles._EMISSION_SHAPE_MAX,
        Godot.Core.CPUParticles._PARAM_TANGENTIAL_ACCEL,
        Godot.Core.CPUParticles._PARAM_ANIM_SPEED,
        Godot.Core.CPUParticles._EMISSION_SHAPE_BOX,
        Godot.Core.CPUParticles._EMISSION_SHAPE_POINTS,
        Godot.Core.CPUParticles._PARAM_MAX,
        Godot.Core.CPUParticles._PARAM_INITIAL_LINEAR_VELOCITY,
        Godot.Core.CPUParticles._FLAG_MAX,
        Godot.Core.CPUParticles._PARAM_LINEAR_ACCEL,
        Godot.Core.CPUParticles._EMISSION_SHAPE_DIRECTED_POINTS,
        Godot.Core.CPUParticles._EMISSION_SHAPE_POINT,
        Godot.Core.CPUParticles._PARAM_ORBIT_VELOCITY,
        Godot.Core.CPUParticles._DRAW_ORDER_LIFETIME,
        Godot.Core.CPUParticles._PARAM_SCALE,
        Godot.Core.CPUParticles._DRAW_ORDER_INDEX,
        Godot.Core.CPUParticles._PARAM_DAMPING,
        Godot.Core.CPUParticles._PARAM_HUE_VARIATION,
        Godot.Core.CPUParticles._PARAM_ANIM_OFFSET,
        Godot.Core.CPUParticles._PARAM_ANGLE,
        Godot.Core.CPUParticles._DRAW_ORDER_VIEW_DEPTH,
        Godot.Core.CPUParticles._update_render_thread,
        Godot.Core.CPUParticles.convert_from_particles,
        Godot.Core.CPUParticles.get_amount,
        Godot.Core.CPUParticles.get_color,
        Godot.Core.CPUParticles.get_color_ramp,
        Godot.Core.CPUParticles.get_direction,
        Godot.Core.CPUParticles.get_draw_order,
        Godot.Core.CPUParticles.get_emission_box_extents,
        Godot.Core.CPUParticles.get_emission_colors,
        Godot.Core.CPUParticles.get_emission_normals,
        Godot.Core.CPUParticles.get_emission_points,
        Godot.Core.CPUParticles.get_emission_shape,
        Godot.Core.CPUParticles.get_emission_sphere_radius,
        Godot.Core.CPUParticles.get_explosiveness_ratio,
        Godot.Core.CPUParticles.get_fixed_fps,
        Godot.Core.CPUParticles.get_flatness,
        Godot.Core.CPUParticles.get_fractional_delta,
        Godot.Core.CPUParticles.get_gravity,
        Godot.Core.CPUParticles.get_lifetime,
        Godot.Core.CPUParticles.get_lifetime_randomness,
        Godot.Core.CPUParticles.get_mesh,
        Godot.Core.CPUParticles.get_one_shot,
        Godot.Core.CPUParticles.get_param,
        Godot.Core.CPUParticles.get_param_curve,
        Godot.Core.CPUParticles.get_param_randomness,
        Godot.Core.CPUParticles.get_particle_flag,
        Godot.Core.CPUParticles.get_pre_process_time,
        Godot.Core.CPUParticles.get_randomness_ratio,
        Godot.Core.CPUParticles.get_speed_scale,
        Godot.Core.CPUParticles.get_spread,
        Godot.Core.CPUParticles.get_use_local_coordinates,
        Godot.Core.CPUParticles.is_emitting,
        Godot.Core.CPUParticles.restart,
        Godot.Core.CPUParticles.set_amount,
        Godot.Core.CPUParticles.set_color,
        Godot.Core.CPUParticles.set_color_ramp,
        Godot.Core.CPUParticles.set_direction,
        Godot.Core.CPUParticles.set_draw_order,
        Godot.Core.CPUParticles.set_emission_box_extents,
        Godot.Core.CPUParticles.set_emission_colors,
        Godot.Core.CPUParticles.set_emission_normals,
        Godot.Core.CPUParticles.set_emission_points,
        Godot.Core.CPUParticles.set_emission_shape,
        Godot.Core.CPUParticles.set_emission_sphere_radius,
        Godot.Core.CPUParticles.set_emitting,
        Godot.Core.CPUParticles.set_explosiveness_ratio,
        Godot.Core.CPUParticles.set_fixed_fps,
        Godot.Core.CPUParticles.set_flatness,
        Godot.Core.CPUParticles.set_fractional_delta,
        Godot.Core.CPUParticles.set_gravity,
        Godot.Core.CPUParticles.set_lifetime,
        Godot.Core.CPUParticles.set_lifetime_randomness,
        Godot.Core.CPUParticles.set_mesh,
        Godot.Core.CPUParticles.set_one_shot,
        Godot.Core.CPUParticles.set_param,
        Godot.Core.CPUParticles.set_param_curve,
        Godot.Core.CPUParticles.set_param_randomness,
        Godot.Core.CPUParticles.set_particle_flag,
        Godot.Core.CPUParticles.set_pre_process_time,
        Godot.Core.CPUParticles.set_randomness_ratio,
        Godot.Core.CPUParticles.set_speed_scale,
        Godot.Core.CPUParticles.set_spread,
        Godot.Core.CPUParticles.set_use_local_coordinates)
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

_DRAW_ORDER_LIFETIME :: Int
_DRAW_ORDER_LIFETIME = 1

_PARAM_SCALE :: Int
_PARAM_SCALE = 8

_DRAW_ORDER_INDEX :: Int
_DRAW_ORDER_INDEX = 0

_PARAM_DAMPING :: Int
_PARAM_DAMPING = 6

_PARAM_HUE_VARIATION :: Int
_PARAM_HUE_VARIATION = 9

_PARAM_ANIM_OFFSET :: Int
_PARAM_ANIM_OFFSET = 11

_PARAM_ANGLE :: Int
_PARAM_ANGLE = 7

_DRAW_ORDER_VIEW_DEPTH :: Int
_DRAW_ORDER_VIEW_DEPTH = 2

{-# NOINLINE bindCPUParticles__update_render_thread #-}

bindCPUParticles__update_render_thread :: MethodBind
bindCPUParticles__update_render_thread
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "_update_render_thread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_render_thread ::
                        (CPUParticles :< cls, Object :< cls) => cls -> IO ()
_update_render_thread cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles__update_render_thread
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_convert_from_particles #-}

-- | Sets this node's properties to match a given [Particles] node with an assigned [ParticlesMaterial].
bindCPUParticles_convert_from_particles :: MethodBind
bindCPUParticles_convert_from_particles
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "convert_from_particles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets this node's properties to match a given [Particles] node with an assigned [ParticlesMaterial].
convert_from_particles ::
                         (CPUParticles :< cls, Object :< cls) => cls -> Node -> IO ()
convert_from_particles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_convert_from_particles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_amount #-}

-- | Number of particles emitted in one emission cycle.
bindCPUParticles_get_amount :: MethodBind
bindCPUParticles_get_amount
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of particles emitted in one emission cycle.
get_amount :: (CPUParticles :< cls, Object :< cls) => cls -> IO Int
get_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_color #-}

-- | Unused for 3D particles.
bindCPUParticles_get_color :: MethodBind
bindCPUParticles_get_color
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unused for 3D particles.
get_color ::
            (CPUParticles :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_color_ramp #-}

-- | Unused for 3D particles.
bindCPUParticles_get_color_ramp :: MethodBind
bindCPUParticles_get_color_ramp
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_color_ramp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unused for 3D particles.
get_color_ramp ::
                 (CPUParticles :< cls, Object :< cls) => cls -> IO Gradient
get_color_ramp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_color_ramp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_direction #-}

-- | Unit vector specifying the particles' emission direction.
bindCPUParticles_get_direction :: MethodBind
bindCPUParticles_get_direction
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unit vector specifying the particles' emission direction.
get_direction ::
                (CPUParticles :< cls, Object :< cls) => cls -> IO Vector3
get_direction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_direction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_draw_order #-}

-- | Particle draw order. Uses [enum DrawOrder] values.
bindCPUParticles_get_draw_order :: MethodBind
bindCPUParticles_get_draw_order
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses [enum DrawOrder] values.
get_draw_order ::
                 (CPUParticles :< cls, Object :< cls) => cls -> IO Int
get_draw_order cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_emission_box_extents #-}

-- | The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_BOX].
bindCPUParticles_get_emission_box_extents :: MethodBind
bindCPUParticles_get_emission_box_extents
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_emission_box_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_BOX].
get_emission_box_extents ::
                           (CPUParticles :< cls, Object :< cls) => cls -> IO Vector3
get_emission_box_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_emission_box_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_emission_colors #-}

-- | Sets the [Color]s to modulate particles by when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
bindCPUParticles_get_emission_colors :: MethodBind
bindCPUParticles_get_emission_colors
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_emission_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [Color]s to modulate particles by when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
get_emission_colors ::
                      (CPUParticles :< cls, Object :< cls) => cls -> IO PoolColorArray
get_emission_colors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_emission_colors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_emission_normals #-}

-- | Sets the direction the particles will be emitted in when using [constant EMISSION_SHAPE_DIRECTED_POINTS].
bindCPUParticles_get_emission_normals :: MethodBind
bindCPUParticles_get_emission_normals
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_emission_normals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the direction the particles will be emitted in when using [constant EMISSION_SHAPE_DIRECTED_POINTS].
get_emission_normals ::
                       (CPUParticles :< cls, Object :< cls) => cls -> IO PoolVector3Array
get_emission_normals cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_emission_normals
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_emission_points #-}

-- | Sets the initial positions to spawn particles when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
bindCPUParticles_get_emission_points :: MethodBind
bindCPUParticles_get_emission_points
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_emission_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the initial positions to spawn particles when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
get_emission_points ::
                      (CPUParticles :< cls, Object :< cls) => cls -> IO PoolVector3Array
get_emission_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_emission_points
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_emission_shape #-}

-- | Particles will be emitted inside this region. See [enum EmissionShape] for possible values.
bindCPUParticles_get_emission_shape :: MethodBind
bindCPUParticles_get_emission_shape
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_emission_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted inside this region. See [enum EmissionShape] for possible values.
get_emission_shape ::
                     (CPUParticles :< cls, Object :< cls) => cls -> IO Int
get_emission_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_emission_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_emission_sphere_radius #-}

-- | The sphere's radius if [enum EmissionShape] is set to [constant EMISSION_SHAPE_SPHERE].
bindCPUParticles_get_emission_sphere_radius :: MethodBind
bindCPUParticles_get_emission_sphere_radius
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_emission_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius if [enum EmissionShape] is set to [constant EMISSION_SHAPE_SPHERE].
get_emission_sphere_radius ::
                             (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_emission_sphere_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_emission_sphere_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_explosiveness_ratio #-}

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins.
bindCPUParticles_get_explosiveness_ratio :: MethodBind
bindCPUParticles_get_explosiveness_ratio
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins.
get_explosiveness_ratio ::
                          (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_explosiveness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_fixed_fps #-}

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the particle system itself.
bindCPUParticles_get_fixed_fps :: MethodBind
bindCPUParticles_get_fixed_fps
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the particle system itself.
get_fixed_fps ::
                (CPUParticles :< cls, Object :< cls) => cls -> IO Int
get_fixed_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_fixed_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_flatness #-}

-- | Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane.
bindCPUParticles_get_flatness :: MethodBind
bindCPUParticles_get_flatness
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_flatness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane.
get_flatness ::
               (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_flatness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_flatness (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_fractional_delta #-}

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect.
bindCPUParticles_get_fractional_delta :: MethodBind
bindCPUParticles_get_fractional_delta
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect.
get_fractional_delta ::
                       (CPUParticles :< cls, Object :< cls) => cls -> IO Bool
get_fractional_delta cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_gravity #-}

-- | Gravity applied to every particle.
bindCPUParticles_get_gravity :: MethodBind
bindCPUParticles_get_gravity
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gravity applied to every particle.
get_gravity ::
              (CPUParticles :< cls, Object :< cls) => cls -> IO Vector3
get_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_gravity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_lifetime #-}

-- | Amount of time each particle will exist.
bindCPUParticles_get_lifetime :: MethodBind
bindCPUParticles_get_lifetime
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time each particle will exist.
get_lifetime ::
               (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_lifetime cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_lifetime_randomness #-}

-- | Particle lifetime randomness ratio.
bindCPUParticles_get_lifetime_randomness :: MethodBind
bindCPUParticles_get_lifetime_randomness
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_lifetime_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle lifetime randomness ratio.
get_lifetime_randomness ::
                          (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_lifetime_randomness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_lifetime_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_mesh #-}

-- | The [Mesh] used for each particle. If [code]null[/code], particles will be spheres.
bindCPUParticles_get_mesh :: MethodBind
bindCPUParticles_get_mesh
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Mesh] used for each particle. If [code]null[/code], particles will be spheres.
get_mesh :: (CPUParticles :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_one_shot #-}

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end.
bindCPUParticles_get_one_shot :: MethodBind
bindCPUParticles_get_one_shot
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end.
get_one_shot ::
               (CPUParticles :< cls, Object :< cls) => cls -> IO Bool
get_one_shot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_param #-}

-- | Returns the base value of the parameter specified by [enum Parameter].
bindCPUParticles_get_param :: MethodBind
bindCPUParticles_get_param
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the base value of the parameter specified by [enum Parameter].
get_param ::
            (CPUParticles :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_param_curve #-}

-- | Returns the [Curve] of the parameter specified by [enum Parameter].
bindCPUParticles_get_param_curve :: MethodBind
bindCPUParticles_get_param_curve
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_param_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Curve] of the parameter specified by [enum Parameter].
get_param_curve ::
                  (CPUParticles :< cls, Object :< cls) => cls -> Int -> IO Curve
get_param_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_param_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_param_randomness #-}

-- | Returns the randomness factor of the parameter specified by [enum Parameter].
bindCPUParticles_get_param_randomness :: MethodBind
bindCPUParticles_get_param_randomness
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_param_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the randomness factor of the parameter specified by [enum Parameter].
get_param_randomness ::
                       (CPUParticles :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_randomness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_param_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_particle_flag #-}

-- | Returns the enabled state of the given flag (see [enum Flags] for options).
bindCPUParticles_get_particle_flag :: MethodBind
bindCPUParticles_get_particle_flag
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_particle_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the enabled state of the given flag (see [enum Flags] for options).
get_particle_flag ::
                    (CPUParticles :< cls, Object :< cls) => cls -> Int -> IO Bool
get_particle_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_particle_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_pre_process_time #-}

-- | Particle system starts as if it had already run for this many seconds.
bindCPUParticles_get_pre_process_time :: MethodBind
bindCPUParticles_get_pre_process_time
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system starts as if it had already run for this many seconds.
get_pre_process_time ::
                       (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_pre_process_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_randomness_ratio #-}

-- | Emission lifetime randomness ratio.
bindCPUParticles_get_randomness_ratio :: MethodBind
bindCPUParticles_get_randomness_ratio
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission lifetime randomness ratio.
get_randomness_ratio ::
                       (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_randomness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_speed_scale #-}

-- | Particle system's running speed scaling ratio. A value of [code]0[/code] can be used to pause the particles.
bindCPUParticles_get_speed_scale :: MethodBind
bindCPUParticles_get_speed_scale
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system's running speed scaling ratio. A value of [code]0[/code] can be used to pause the particles.
get_speed_scale ::
                  (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_spread #-}

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Applied to X/Z plane and Y/Z planes.
bindCPUParticles_get_spread :: MethodBind
bindCPUParticles_get_spread
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Applied to X/Z plane and Y/Z planes.
get_spread ::
             (CPUParticles :< cls, Object :< cls) => cls -> IO Float
get_spread cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_spread (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_get_use_local_coordinates #-}

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates.
bindCPUParticles_get_use_local_coordinates :: MethodBind
bindCPUParticles_get_use_local_coordinates
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "get_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates.
get_use_local_coordinates ::
                            (CPUParticles :< cls, Object :< cls) => cls -> IO Bool
get_use_local_coordinates cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_get_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_is_emitting #-}

-- | If [code]true[/code], particles are being emitted.
bindCPUParticles_is_emitting :: MethodBind
bindCPUParticles_is_emitting
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "is_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles are being emitted.
is_emitting ::
              (CPUParticles :< cls, Object :< cls) => cls -> IO Bool
is_emitting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_is_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_restart #-}

-- | Restarts the particle emitter.
bindCPUParticles_restart :: MethodBind
bindCPUParticles_restart
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "restart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Restarts the particle emitter.
restart :: (CPUParticles :< cls, Object :< cls) => cls -> IO ()
restart cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_restart (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_amount #-}

-- | Number of particles emitted in one emission cycle.
bindCPUParticles_set_amount :: MethodBind
bindCPUParticles_set_amount
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of particles emitted in one emission cycle.
set_amount ::
             (CPUParticles :< cls, Object :< cls) => cls -> Int -> IO ()
set_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_color #-}

-- | Unused for 3D particles.
bindCPUParticles_set_color :: MethodBind
bindCPUParticles_set_color
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unused for 3D particles.
set_color ::
            (CPUParticles :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_color_ramp #-}

-- | Unused for 3D particles.
bindCPUParticles_set_color_ramp :: MethodBind
bindCPUParticles_set_color_ramp
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_color_ramp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unused for 3D particles.
set_color_ramp ::
                 (CPUParticles :< cls, Object :< cls) => cls -> Gradient -> IO ()
set_color_ramp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_color_ramp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_direction #-}

-- | Unit vector specifying the particles' emission direction.
bindCPUParticles_set_direction :: MethodBind
bindCPUParticles_set_direction
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unit vector specifying the particles' emission direction.
set_direction ::
                (CPUParticles :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_direction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_direction (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_draw_order #-}

-- | Particle draw order. Uses [enum DrawOrder] values.
bindCPUParticles_set_draw_order :: MethodBind
bindCPUParticles_set_draw_order
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses [enum DrawOrder] values.
set_draw_order ::
                 (CPUParticles :< cls, Object :< cls) => cls -> Int -> IO ()
set_draw_order cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_emission_box_extents #-}

-- | The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_BOX].
bindCPUParticles_set_emission_box_extents :: MethodBind
bindCPUParticles_set_emission_box_extents
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_emission_box_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_BOX].
set_emission_box_extents ::
                           (CPUParticles :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_emission_box_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_emission_box_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_emission_colors #-}

-- | Sets the [Color]s to modulate particles by when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
bindCPUParticles_set_emission_colors :: MethodBind
bindCPUParticles_set_emission_colors
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_emission_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [Color]s to modulate particles by when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
set_emission_colors ::
                      (CPUParticles :< cls, Object :< cls) =>
                      cls -> PoolColorArray -> IO ()
set_emission_colors cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_emission_colors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_emission_normals #-}

-- | Sets the direction the particles will be emitted in when using [constant EMISSION_SHAPE_DIRECTED_POINTS].
bindCPUParticles_set_emission_normals :: MethodBind
bindCPUParticles_set_emission_normals
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_emission_normals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the direction the particles will be emitted in when using [constant EMISSION_SHAPE_DIRECTED_POINTS].
set_emission_normals ::
                       (CPUParticles :< cls, Object :< cls) =>
                       cls -> PoolVector3Array -> IO ()
set_emission_normals cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_emission_normals
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_emission_points #-}

-- | Sets the initial positions to spawn particles when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
bindCPUParticles_set_emission_points :: MethodBind
bindCPUParticles_set_emission_points
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_emission_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the initial positions to spawn particles when using [constant EMISSION_SHAPE_POINTS] or [constant EMISSION_SHAPE_DIRECTED_POINTS].
set_emission_points ::
                      (CPUParticles :< cls, Object :< cls) =>
                      cls -> PoolVector3Array -> IO ()
set_emission_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_emission_points
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_emission_shape #-}

-- | Particles will be emitted inside this region. See [enum EmissionShape] for possible values.
bindCPUParticles_set_emission_shape :: MethodBind
bindCPUParticles_set_emission_shape
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_emission_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted inside this region. See [enum EmissionShape] for possible values.
set_emission_shape ::
                     (CPUParticles :< cls, Object :< cls) => cls -> Int -> IO ()
set_emission_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_emission_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_emission_sphere_radius #-}

-- | The sphere's radius if [enum EmissionShape] is set to [constant EMISSION_SHAPE_SPHERE].
bindCPUParticles_set_emission_sphere_radius :: MethodBind
bindCPUParticles_set_emission_sphere_radius
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_emission_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius if [enum EmissionShape] is set to [constant EMISSION_SHAPE_SPHERE].
set_emission_sphere_radius ::
                             (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_emission_sphere_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_emission_sphere_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_emitting #-}

-- | If [code]true[/code], particles are being emitted.
bindCPUParticles_set_emitting :: MethodBind
bindCPUParticles_set_emitting
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles are being emitted.
set_emitting ::
               (CPUParticles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_emitting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_explosiveness_ratio #-}

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins.
bindCPUParticles_set_explosiveness_ratio :: MethodBind
bindCPUParticles_set_explosiveness_ratio
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins.
set_explosiveness_ratio ::
                          (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_explosiveness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_fixed_fps #-}

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the particle system itself.
bindCPUParticles_set_fixed_fps :: MethodBind
bindCPUParticles_set_fixed_fps
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the particle system itself.
set_fixed_fps ::
                (CPUParticles :< cls, Object :< cls) => cls -> Int -> IO ()
set_fixed_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_fixed_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_flatness #-}

-- | Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane.
bindCPUParticles_set_flatness :: MethodBind
bindCPUParticles_set_flatness
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_flatness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of [member spread] in Y/Z plane. A value of [code]1[/code] restricts particles to X/Z plane.
set_flatness ::
               (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_flatness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_flatness (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_fractional_delta #-}

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect.
bindCPUParticles_set_fractional_delta :: MethodBind
bindCPUParticles_set_fractional_delta
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect.
set_fractional_delta ::
                       (CPUParticles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fractional_delta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_gravity #-}

-- | Gravity applied to every particle.
bindCPUParticles_set_gravity :: MethodBind
bindCPUParticles_set_gravity
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gravity applied to every particle.
set_gravity ::
              (CPUParticles :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_gravity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_gravity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_lifetime #-}

-- | Amount of time each particle will exist.
bindCPUParticles_set_lifetime :: MethodBind
bindCPUParticles_set_lifetime
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time each particle will exist.
set_lifetime ::
               (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_lifetime_randomness #-}

-- | Particle lifetime randomness ratio.
bindCPUParticles_set_lifetime_randomness :: MethodBind
bindCPUParticles_set_lifetime_randomness
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_lifetime_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle lifetime randomness ratio.
set_lifetime_randomness ::
                          (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime_randomness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_lifetime_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_mesh #-}

-- | The [Mesh] used for each particle. If [code]null[/code], particles will be spheres.
bindCPUParticles_set_mesh :: MethodBind
bindCPUParticles_set_mesh
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Mesh] used for each particle. If [code]null[/code], particles will be spheres.
set_mesh ::
           (CPUParticles :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_one_shot #-}

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end.
bindCPUParticles_set_one_shot :: MethodBind
bindCPUParticles_set_one_shot
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end.
set_one_shot ::
               (CPUParticles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_shot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_param #-}

-- | Sets the base value of the parameter specified by [enum Parameter].
bindCPUParticles_set_param :: MethodBind
bindCPUParticles_set_param
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the base value of the parameter specified by [enum Parameter].
set_param ::
            (CPUParticles :< cls, Object :< cls) =>
            cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_param_curve #-}

-- | Sets the [Curve] of the parameter specified by [enum Parameter].
bindCPUParticles_set_param_curve :: MethodBind
bindCPUParticles_set_param_curve
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_param_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [Curve] of the parameter specified by [enum Parameter].
set_param_curve ::
                  (CPUParticles :< cls, Object :< cls) =>
                  cls -> Int -> Curve -> IO ()
set_param_curve cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_param_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_param_randomness #-}

-- | Sets the randomness factor of the parameter specified by [enum Parameter].
bindCPUParticles_set_param_randomness :: MethodBind
bindCPUParticles_set_param_randomness
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_param_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the randomness factor of the parameter specified by [enum Parameter].
set_param_randomness ::
                       (CPUParticles :< cls, Object :< cls) =>
                       cls -> Int -> Float -> IO ()
set_param_randomness cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_param_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_particle_flag #-}

-- | Enables or disables the given flag (see [enum Flags] for options).
bindCPUParticles_set_particle_flag :: MethodBind
bindCPUParticles_set_particle_flag
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_particle_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables the given flag (see [enum Flags] for options).
set_particle_flag ::
                    (CPUParticles :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_particle_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_particle_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_pre_process_time #-}

-- | Particle system starts as if it had already run for this many seconds.
bindCPUParticles_set_pre_process_time :: MethodBind
bindCPUParticles_set_pre_process_time
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system starts as if it had already run for this many seconds.
set_pre_process_time ::
                       (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_pre_process_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_randomness_ratio #-}

-- | Emission lifetime randomness ratio.
bindCPUParticles_set_randomness_ratio :: MethodBind
bindCPUParticles_set_randomness_ratio
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission lifetime randomness ratio.
set_randomness_ratio ::
                       (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_randomness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_speed_scale #-}

-- | Particle system's running speed scaling ratio. A value of [code]0[/code] can be used to pause the particles.
bindCPUParticles_set_speed_scale :: MethodBind
bindCPUParticles_set_speed_scale
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system's running speed scaling ratio. A value of [code]0[/code] can be used to pause the particles.
set_speed_scale ::
                  (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_spread #-}

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Applied to X/Z plane and Y/Z planes.
bindCPUParticles_set_spread :: MethodBind
bindCPUParticles_set_spread
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Applied to X/Z plane and Y/Z planes.
set_spread ::
             (CPUParticles :< cls, Object :< cls) => cls -> Float -> IO ()
set_spread cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_spread (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles_set_use_local_coordinates #-}

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates.
bindCPUParticles_set_use_local_coordinates :: MethodBind
bindCPUParticles_set_use_local_coordinates
  = unsafePerformIO $
      withCString "CPUParticles" $
        \ clsNamePtr ->
          withCString "set_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates.
set_use_local_coordinates ::
                            (CPUParticles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_local_coordinates cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles_set_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)