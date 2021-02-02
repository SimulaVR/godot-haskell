{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CPUParticles2D
       (Godot.Core.CPUParticles2D._FLAG_ALIGN_Y_TO_VELOCITY,
        Godot.Core.CPUParticles2D._PARAM_RADIAL_ACCEL,
        Godot.Core.CPUParticles2D._FLAG_ROTATE_Y,
        Godot.Core.CPUParticles2D._EMISSION_SHAPE_SPHERE,
        Godot.Core.CPUParticles2D._FLAG_DISABLE_Z,
        Godot.Core.CPUParticles2D._PARAM_ANGULAR_VELOCITY,
        Godot.Core.CPUParticles2D._EMISSION_SHAPE_MAX,
        Godot.Core.CPUParticles2D._PARAM_TANGENTIAL_ACCEL,
        Godot.Core.CPUParticles2D._PARAM_ANIM_SPEED,
        Godot.Core.CPUParticles2D._EMISSION_SHAPE_POINTS,
        Godot.Core.CPUParticles2D._PARAM_MAX,
        Godot.Core.CPUParticles2D._PARAM_INITIAL_LINEAR_VELOCITY,
        Godot.Core.CPUParticles2D._FLAG_MAX,
        Godot.Core.CPUParticles2D._EMISSION_SHAPE_RECTANGLE,
        Godot.Core.CPUParticles2D._PARAM_LINEAR_ACCEL,
        Godot.Core.CPUParticles2D._EMISSION_SHAPE_DIRECTED_POINTS,
        Godot.Core.CPUParticles2D._EMISSION_SHAPE_POINT,
        Godot.Core.CPUParticles2D._PARAM_ORBIT_VELOCITY,
        Godot.Core.CPUParticles2D._DRAW_ORDER_LIFETIME,
        Godot.Core.CPUParticles2D._PARAM_SCALE,
        Godot.Core.CPUParticles2D._DRAW_ORDER_INDEX,
        Godot.Core.CPUParticles2D._PARAM_DAMPING,
        Godot.Core.CPUParticles2D._PARAM_HUE_VARIATION,
        Godot.Core.CPUParticles2D._PARAM_ANIM_OFFSET,
        Godot.Core.CPUParticles2D._PARAM_ANGLE,
        Godot.Core.CPUParticles2D._update_render_thread,
        Godot.Core.CPUParticles2D.convert_from_particles,
        Godot.Core.CPUParticles2D.get_amount,
        Godot.Core.CPUParticles2D.get_color,
        Godot.Core.CPUParticles2D.get_color_ramp,
        Godot.Core.CPUParticles2D.get_direction,
        Godot.Core.CPUParticles2D.get_draw_order,
        Godot.Core.CPUParticles2D.get_emission_colors,
        Godot.Core.CPUParticles2D.get_emission_normals,
        Godot.Core.CPUParticles2D.get_emission_points,
        Godot.Core.CPUParticles2D.get_emission_rect_extents,
        Godot.Core.CPUParticles2D.get_emission_shape,
        Godot.Core.CPUParticles2D.get_emission_sphere_radius,
        Godot.Core.CPUParticles2D.get_explosiveness_ratio,
        Godot.Core.CPUParticles2D.get_fixed_fps,
        Godot.Core.CPUParticles2D.get_fractional_delta,
        Godot.Core.CPUParticles2D.get_gravity,
        Godot.Core.CPUParticles2D.get_lifetime,
        Godot.Core.CPUParticles2D.get_lifetime_randomness,
        Godot.Core.CPUParticles2D.get_normalmap,
        Godot.Core.CPUParticles2D.get_one_shot,
        Godot.Core.CPUParticles2D.get_param,
        Godot.Core.CPUParticles2D.get_param_curve,
        Godot.Core.CPUParticles2D.get_param_randomness,
        Godot.Core.CPUParticles2D.get_particle_flag,
        Godot.Core.CPUParticles2D.get_pre_process_time,
        Godot.Core.CPUParticles2D.get_randomness_ratio,
        Godot.Core.CPUParticles2D.get_speed_scale,
        Godot.Core.CPUParticles2D.get_spread,
        Godot.Core.CPUParticles2D.get_texture,
        Godot.Core.CPUParticles2D.get_use_local_coordinates,
        Godot.Core.CPUParticles2D.is_emitting,
        Godot.Core.CPUParticles2D.restart,
        Godot.Core.CPUParticles2D.set_amount,
        Godot.Core.CPUParticles2D.set_color,
        Godot.Core.CPUParticles2D.set_color_ramp,
        Godot.Core.CPUParticles2D.set_direction,
        Godot.Core.CPUParticles2D.set_draw_order,
        Godot.Core.CPUParticles2D.set_emission_colors,
        Godot.Core.CPUParticles2D.set_emission_normals,
        Godot.Core.CPUParticles2D.set_emission_points,
        Godot.Core.CPUParticles2D.set_emission_rect_extents,
        Godot.Core.CPUParticles2D.set_emission_shape,
        Godot.Core.CPUParticles2D.set_emission_sphere_radius,
        Godot.Core.CPUParticles2D.set_emitting,
        Godot.Core.CPUParticles2D.set_explosiveness_ratio,
        Godot.Core.CPUParticles2D.set_fixed_fps,
        Godot.Core.CPUParticles2D.set_fractional_delta,
        Godot.Core.CPUParticles2D.set_gravity,
        Godot.Core.CPUParticles2D.set_lifetime,
        Godot.Core.CPUParticles2D.set_lifetime_randomness,
        Godot.Core.CPUParticles2D.set_normalmap,
        Godot.Core.CPUParticles2D.set_one_shot,
        Godot.Core.CPUParticles2D.set_param,
        Godot.Core.CPUParticles2D.set_param_curve,
        Godot.Core.CPUParticles2D.set_param_randomness,
        Godot.Core.CPUParticles2D.set_particle_flag,
        Godot.Core.CPUParticles2D.set_pre_process_time,
        Godot.Core.CPUParticles2D.set_randomness_ratio,
        Godot.Core.CPUParticles2D.set_speed_scale,
        Godot.Core.CPUParticles2D.set_spread,
        Godot.Core.CPUParticles2D.set_texture,
        Godot.Core.CPUParticles2D.set_use_local_coordinates)
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

_EMISSION_SHAPE_POINTS :: Int
_EMISSION_SHAPE_POINTS = 3

_PARAM_MAX :: Int
_PARAM_MAX = 12

_PARAM_INITIAL_LINEAR_VELOCITY :: Int
_PARAM_INITIAL_LINEAR_VELOCITY = 0

_FLAG_MAX :: Int
_FLAG_MAX = 3

_EMISSION_SHAPE_RECTANGLE :: Int
_EMISSION_SHAPE_RECTANGLE = 2

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

{-# NOINLINE bindCPUParticles2D__update_render_thread #-}

bindCPUParticles2D__update_render_thread :: MethodBind
bindCPUParticles2D__update_render_thread
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "_update_render_thread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_render_thread ::
                        (CPUParticles2D :< cls, Object :< cls) => cls -> IO ()
_update_render_thread cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D__update_render_thread
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_convert_from_particles #-}

-- | Sets this node's properties to match a given [Particles2D] node with an assigned [ParticlesMaterial].
bindCPUParticles2D_convert_from_particles :: MethodBind
bindCPUParticles2D_convert_from_particles
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "convert_from_particles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets this node's properties to match a given [Particles2D] node with an assigned [ParticlesMaterial].
convert_from_particles ::
                         (CPUParticles2D :< cls, Object :< cls) => cls -> Node -> IO ()
convert_from_particles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_convert_from_particles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_amount #-}

-- | Number of particles emitted in one emission cycle.
bindCPUParticles2D_get_amount :: MethodBind
bindCPUParticles2D_get_amount
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of particles emitted in one emission cycle.
get_amount ::
             (CPUParticles2D :< cls, Object :< cls) => cls -> IO Int
get_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_color #-}

-- | Each particle's initial color. If [member texture] is defined, it will be multiplied by this color.
bindCPUParticles2D_get_color :: MethodBind
bindCPUParticles2D_get_color
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial color. If [member texture] is defined, it will be multiplied by this color.
get_color ::
            (CPUParticles2D :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_color_ramp #-}

-- | Each particle's color will vary along this [Gradient].
bindCPUParticles2D_get_color_ramp :: MethodBind
bindCPUParticles2D_get_color_ramp
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_color_ramp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's color will vary along this [Gradient].
get_color_ramp ::
                 (CPUParticles2D :< cls, Object :< cls) => cls -> IO Gradient
get_color_ramp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_color_ramp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_direction #-}

bindCPUParticles2D_get_direction :: MethodBind
bindCPUParticles2D_get_direction
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_direction ::
                (CPUParticles2D :< cls, Object :< cls) => cls -> IO Vector2
get_direction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_direction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_draw_order #-}

-- | Particle draw order. Uses [enum DrawOrder] values. Default value: [constant DRAW_ORDER_INDEX].
bindCPUParticles2D_get_draw_order :: MethodBind
bindCPUParticles2D_get_draw_order
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses [enum DrawOrder] values. Default value: [constant DRAW_ORDER_INDEX].
get_draw_order ::
                 (CPUParticles2D :< cls, Object :< cls) => cls -> IO Int
get_draw_order cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_draw_order
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_emission_colors #-}

bindCPUParticles2D_get_emission_colors :: MethodBind
bindCPUParticles2D_get_emission_colors
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_emission_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_emission_colors ::
                      (CPUParticles2D :< cls, Object :< cls) => cls -> IO PoolColorArray
get_emission_colors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_emission_colors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_emission_normals #-}

bindCPUParticles2D_get_emission_normals :: MethodBind
bindCPUParticles2D_get_emission_normals
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_emission_normals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_emission_normals ::
                       (CPUParticles2D :< cls, Object :< cls) =>
                       cls -> IO PoolVector2Array
get_emission_normals cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_emission_normals
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_emission_points #-}

bindCPUParticles2D_get_emission_points :: MethodBind
bindCPUParticles2D_get_emission_points
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_emission_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_emission_points ::
                      (CPUParticles2D :< cls, Object :< cls) =>
                      cls -> IO PoolVector2Array
get_emission_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_emission_points
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_emission_rect_extents #-}

-- | The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_RECTANGLE].
bindCPUParticles2D_get_emission_rect_extents :: MethodBind
bindCPUParticles2D_get_emission_rect_extents
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_emission_rect_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_RECTANGLE].
get_emission_rect_extents ::
                            (CPUParticles2D :< cls, Object :< cls) => cls -> IO Vector2
get_emission_rect_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_emission_rect_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_emission_shape #-}

-- | Particles will be emitted inside this region. Use [enum EmissionShape] for values. Default value: [constant EMISSION_SHAPE_POINT].
bindCPUParticles2D_get_emission_shape :: MethodBind
bindCPUParticles2D_get_emission_shape
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_emission_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted inside this region. Use [enum EmissionShape] for values. Default value: [constant EMISSION_SHAPE_POINT].
get_emission_shape ::
                     (CPUParticles2D :< cls, Object :< cls) => cls -> IO Int
get_emission_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_emission_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_emission_sphere_radius #-}

-- | The circle's radius if [member emission_shape] is set to [constant EMISSION_SHAPE_CIRCLE].
bindCPUParticles2D_get_emission_sphere_radius :: MethodBind
bindCPUParticles2D_get_emission_sphere_radius
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_emission_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The circle's radius if [member emission_shape] is set to [constant EMISSION_SHAPE_CIRCLE].
get_emission_sphere_radius ::
                             (CPUParticles2D :< cls, Object :< cls) => cls -> IO Float
get_emission_sphere_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCPUParticles2D_get_emission_sphere_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_explosiveness_ratio #-}

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins. Default value: [code]0[/code].
bindCPUParticles2D_get_explosiveness_ratio :: MethodBind
bindCPUParticles2D_get_explosiveness_ratio
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins. Default value: [code]0[/code].
get_explosiveness_ratio ::
                          (CPUParticles2D :< cls, Object :< cls) => cls -> IO Float
get_explosiveness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_fixed_fps #-}

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
bindCPUParticles2D_get_fixed_fps :: MethodBind
bindCPUParticles2D_get_fixed_fps
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
get_fixed_fps ::
                (CPUParticles2D :< cls, Object :< cls) => cls -> IO Int
get_fixed_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_fixed_fps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_fractional_delta #-}

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code]
bindCPUParticles2D_get_fractional_delta :: MethodBind
bindCPUParticles2D_get_fractional_delta
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code]
get_fractional_delta ::
                       (CPUParticles2D :< cls, Object :< cls) => cls -> IO Bool
get_fractional_delta cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_gravity #-}

-- | Gravity applied to every particle. Default value: [code](0, 98)[/code].
bindCPUParticles2D_get_gravity :: MethodBind
bindCPUParticles2D_get_gravity
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gravity applied to every particle. Default value: [code](0, 98)[/code].
get_gravity ::
              (CPUParticles2D :< cls, Object :< cls) => cls -> IO Vector2
get_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_gravity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_lifetime #-}

-- | Amount of time each particle will exist. Default value: [code]1[/code].
bindCPUParticles2D_get_lifetime :: MethodBind
bindCPUParticles2D_get_lifetime
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time each particle will exist. Default value: [code]1[/code].
get_lifetime ::
               (CPUParticles2D :< cls, Object :< cls) => cls -> IO Float
get_lifetime cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_lifetime_randomness #-}

bindCPUParticles2D_get_lifetime_randomness :: MethodBind
bindCPUParticles2D_get_lifetime_randomness
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_lifetime_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_lifetime_randomness ::
                          (CPUParticles2D :< cls, Object :< cls) => cls -> IO Float
get_lifetime_randomness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_lifetime_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_normalmap #-}

-- | Normal map to be used for the [member texture] property.
bindCPUParticles2D_get_normalmap :: MethodBind
bindCPUParticles2D_get_normalmap
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_normalmap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Normal map to be used for the [member texture] property.
get_normalmap ::
                (CPUParticles2D :< cls, Object :< cls) => cls -> IO Texture
get_normalmap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_normalmap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_one_shot #-}

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end. Default value: [code]false[/code].
bindCPUParticles2D_get_one_shot :: MethodBind
bindCPUParticles2D_get_one_shot
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end. Default value: [code]false[/code].
get_one_shot ::
               (CPUParticles2D :< cls, Object :< cls) => cls -> IO Bool
get_one_shot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_param #-}

-- | Initial rotation applied to each particle, in degrees.
bindCPUParticles2D_get_param :: MethodBind
bindCPUParticles2D_get_param
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initial rotation applied to each particle, in degrees.
get_param ::
            (CPUParticles2D :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_param_curve #-}

-- | Each particle's rotation will be animated along this [Curve].
bindCPUParticles2D_get_param_curve :: MethodBind
bindCPUParticles2D_get_param_curve
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_param_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's rotation will be animated along this [Curve].
get_param_curve ::
                  (CPUParticles2D :< cls, Object :< cls) => cls -> Int -> IO Curve
get_param_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_param_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_param_randomness #-}

-- | Rotation randomness ratio. Default value: [code]0[/code].
bindCPUParticles2D_get_param_randomness :: MethodBind
bindCPUParticles2D_get_param_randomness
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_param_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation randomness ratio. Default value: [code]0[/code].
get_param_randomness ::
                       (CPUParticles2D :< cls, Object :< cls) => cls -> Int -> IO Float
get_param_randomness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_param_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_particle_flag #-}

-- | Align y-axis of particle with the direction of its velocity.
bindCPUParticles2D_get_particle_flag :: MethodBind
bindCPUParticles2D_get_particle_flag
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_particle_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Align y-axis of particle with the direction of its velocity.
get_particle_flag ::
                    (CPUParticles2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_particle_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_particle_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_pre_process_time #-}

-- | Particle system starts as if it had already run for this many seconds.
bindCPUParticles2D_get_pre_process_time :: MethodBind
bindCPUParticles2D_get_pre_process_time
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system starts as if it had already run for this many seconds.
get_pre_process_time ::
                       (CPUParticles2D :< cls, Object :< cls) => cls -> IO Float
get_pre_process_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_randomness_ratio #-}

-- | Emission lifetime randomness ratio. Default value: [code]0[/code].
bindCPUParticles2D_get_randomness_ratio :: MethodBind
bindCPUParticles2D_get_randomness_ratio
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission lifetime randomness ratio. Default value: [code]0[/code].
get_randomness_ratio ::
                       (CPUParticles2D :< cls, Object :< cls) => cls -> IO Float
get_randomness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_speed_scale #-}

-- | Particle system's running speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
bindCPUParticles2D_get_speed_scale :: MethodBind
bindCPUParticles2D_get_speed_scale
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system's running speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
get_speed_scale ::
                  (CPUParticles2D :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_spread #-}

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Default value: [code]45[/code].
bindCPUParticles2D_get_spread :: MethodBind
bindCPUParticles2D_get_spread
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Default value: [code]45[/code].
get_spread ::
             (CPUParticles2D :< cls, Object :< cls) => cls -> IO Float
get_spread cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_spread (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_texture #-}

-- | Particle texture. If [code]null[/code] particles will be squares.
bindCPUParticles2D_get_texture :: MethodBind
bindCPUParticles2D_get_texture
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle texture. If [code]null[/code] particles will be squares.
get_texture ::
              (CPUParticles2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_get_use_local_coordinates #-}

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
bindCPUParticles2D_get_use_local_coordinates :: MethodBind
bindCPUParticles2D_get_use_local_coordinates
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "get_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
get_use_local_coordinates ::
                            (CPUParticles2D :< cls, Object :< cls) => cls -> IO Bool
get_use_local_coordinates cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_get_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_is_emitting #-}

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
bindCPUParticles2D_is_emitting :: MethodBind
bindCPUParticles2D_is_emitting
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "is_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
is_emitting ::
              (CPUParticles2D :< cls, Object :< cls) => cls -> IO Bool
is_emitting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_is_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_restart #-}

-- | Restarts the particle emitter.
bindCPUParticles2D_restart :: MethodBind
bindCPUParticles2D_restart
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "restart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Restarts the particle emitter.
restart :: (CPUParticles2D :< cls, Object :< cls) => cls -> IO ()
restart cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_restart (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_amount #-}

-- | Number of particles emitted in one emission cycle.
bindCPUParticles2D_set_amount :: MethodBind
bindCPUParticles2D_set_amount
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of particles emitted in one emission cycle.
set_amount ::
             (CPUParticles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_color #-}

-- | Each particle's initial color. If [member texture] is defined, it will be multiplied by this color.
bindCPUParticles2D_set_color :: MethodBind
bindCPUParticles2D_set_color
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial color. If [member texture] is defined, it will be multiplied by this color.
set_color ::
            (CPUParticles2D :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_color_ramp #-}

-- | Each particle's color will vary along this [Gradient].
bindCPUParticles2D_set_color_ramp :: MethodBind
bindCPUParticles2D_set_color_ramp
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_color_ramp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's color will vary along this [Gradient].
set_color_ramp ::
                 (CPUParticles2D :< cls, Object :< cls) => cls -> Gradient -> IO ()
set_color_ramp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_color_ramp
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_direction #-}

bindCPUParticles2D_set_direction :: MethodBind
bindCPUParticles2D_set_direction
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_direction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_direction ::
                (CPUParticles2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_direction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_direction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_draw_order #-}

-- | Particle draw order. Uses [enum DrawOrder] values. Default value: [constant DRAW_ORDER_INDEX].
bindCPUParticles2D_set_draw_order :: MethodBind
bindCPUParticles2D_set_draw_order
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses [enum DrawOrder] values. Default value: [constant DRAW_ORDER_INDEX].
set_draw_order ::
                 (CPUParticles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_draw_order cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_draw_order
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_emission_colors #-}

bindCPUParticles2D_set_emission_colors :: MethodBind
bindCPUParticles2D_set_emission_colors
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_emission_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_emission_colors ::
                      (CPUParticles2D :< cls, Object :< cls) =>
                      cls -> PoolColorArray -> IO ()
set_emission_colors cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_emission_colors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_emission_normals #-}

bindCPUParticles2D_set_emission_normals :: MethodBind
bindCPUParticles2D_set_emission_normals
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_emission_normals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_emission_normals ::
                       (CPUParticles2D :< cls, Object :< cls) =>
                       cls -> PoolVector2Array -> IO ()
set_emission_normals cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_emission_normals
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_emission_points #-}

bindCPUParticles2D_set_emission_points :: MethodBind
bindCPUParticles2D_set_emission_points
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_emission_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_emission_points ::
                      (CPUParticles2D :< cls, Object :< cls) =>
                      cls -> PoolVector2Array -> IO ()
set_emission_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_emission_points
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_emission_rect_extents #-}

-- | The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_RECTANGLE].
bindCPUParticles2D_set_emission_rect_extents :: MethodBind
bindCPUParticles2D_set_emission_rect_extents
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_emission_rect_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rectangle's extents if [member emission_shape] is set to [constant EMISSION_SHAPE_RECTANGLE].
set_emission_rect_extents ::
                            (CPUParticles2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_emission_rect_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_emission_rect_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_emission_shape #-}

-- | Particles will be emitted inside this region. Use [enum EmissionShape] for values. Default value: [constant EMISSION_SHAPE_POINT].
bindCPUParticles2D_set_emission_shape :: MethodBind
bindCPUParticles2D_set_emission_shape
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_emission_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particles will be emitted inside this region. Use [enum EmissionShape] for values. Default value: [constant EMISSION_SHAPE_POINT].
set_emission_shape ::
                     (CPUParticles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_emission_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_emission_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_emission_sphere_radius #-}

-- | The circle's radius if [member emission_shape] is set to [constant EMISSION_SHAPE_CIRCLE].
bindCPUParticles2D_set_emission_sphere_radius :: MethodBind
bindCPUParticles2D_set_emission_sphere_radius
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_emission_sphere_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The circle's radius if [member emission_shape] is set to [constant EMISSION_SHAPE_CIRCLE].
set_emission_sphere_radius ::
                             (CPUParticles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_emission_sphere_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCPUParticles2D_set_emission_sphere_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_emitting #-}

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
bindCPUParticles2D_set_emitting :: MethodBind
bindCPUParticles2D_set_emitting
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
set_emitting ::
               (CPUParticles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_emitting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_explosiveness_ratio #-}

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins. Default value: [code]0[/code].
bindCPUParticles2D_set_explosiveness_ratio :: MethodBind
bindCPUParticles2D_set_explosiveness_ratio
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins. Default value: [code]0[/code].
set_explosiveness_ratio ::
                          (CPUParticles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_explosiveness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_fixed_fps #-}

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
bindCPUParticles2D_set_fixed_fps :: MethodBind
bindCPUParticles2D_set_fixed_fps
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
set_fixed_fps ::
                (CPUParticles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_fixed_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_fixed_fps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_fractional_delta #-}

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code]
bindCPUParticles2D_set_fractional_delta :: MethodBind
bindCPUParticles2D_set_fractional_delta
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code]
set_fractional_delta ::
                       (CPUParticles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fractional_delta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_gravity #-}

-- | Gravity applied to every particle. Default value: [code](0, 98)[/code].
bindCPUParticles2D_set_gravity :: MethodBind
bindCPUParticles2D_set_gravity
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gravity applied to every particle. Default value: [code](0, 98)[/code].
set_gravity ::
              (CPUParticles2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_gravity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_gravity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_lifetime #-}

-- | Amount of time each particle will exist. Default value: [code]1[/code].
bindCPUParticles2D_set_lifetime :: MethodBind
bindCPUParticles2D_set_lifetime
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time each particle will exist. Default value: [code]1[/code].
set_lifetime ::
               (CPUParticles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_lifetime_randomness #-}

bindCPUParticles2D_set_lifetime_randomness :: MethodBind
bindCPUParticles2D_set_lifetime_randomness
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_lifetime_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_lifetime_randomness ::
                          (CPUParticles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime_randomness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_lifetime_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_normalmap #-}

-- | Normal map to be used for the [member texture] property.
bindCPUParticles2D_set_normalmap :: MethodBind
bindCPUParticles2D_set_normalmap
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_normalmap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Normal map to be used for the [member texture] property.
set_normalmap ::
                (CPUParticles2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normalmap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_normalmap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_one_shot #-}

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end. Default value: [code]false[/code].
bindCPUParticles2D_set_one_shot :: MethodBind
bindCPUParticles2D_set_one_shot
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end. Default value: [code]false[/code].
set_one_shot ::
               (CPUParticles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_shot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_param #-}

-- | Initial rotation applied to each particle, in degrees.
bindCPUParticles2D_set_param :: MethodBind
bindCPUParticles2D_set_param
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initial rotation applied to each particle, in degrees.
set_param ::
            (CPUParticles2D :< cls, Object :< cls) =>
            cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_param_curve #-}

-- | Each particle's rotation will be animated along this [Curve].
bindCPUParticles2D_set_param_curve :: MethodBind
bindCPUParticles2D_set_param_curve
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_param_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's rotation will be animated along this [Curve].
set_param_curve ::
                  (CPUParticles2D :< cls, Object :< cls) =>
                  cls -> Int -> Curve -> IO ()
set_param_curve cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_param_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_param_randomness #-}

-- | Rotation randomness ratio. Default value: [code]0[/code].
bindCPUParticles2D_set_param_randomness :: MethodBind
bindCPUParticles2D_set_param_randomness
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_param_randomness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation randomness ratio. Default value: [code]0[/code].
set_param_randomness ::
                       (CPUParticles2D :< cls, Object :< cls) =>
                       cls -> Int -> Float -> IO ()
set_param_randomness cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_param_randomness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_particle_flag #-}

-- | Align y-axis of particle with the direction of its velocity.
bindCPUParticles2D_set_particle_flag :: MethodBind
bindCPUParticles2D_set_particle_flag
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_particle_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Align y-axis of particle with the direction of its velocity.
set_particle_flag ::
                    (CPUParticles2D :< cls, Object :< cls) =>
                    cls -> Int -> Bool -> IO ()
set_particle_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_particle_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_pre_process_time #-}

-- | Particle system starts as if it had already run for this many seconds.
bindCPUParticles2D_set_pre_process_time :: MethodBind
bindCPUParticles2D_set_pre_process_time
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system starts as if it had already run for this many seconds.
set_pre_process_time ::
                       (CPUParticles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_pre_process_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_randomness_ratio #-}

-- | Emission lifetime randomness ratio. Default value: [code]0[/code].
bindCPUParticles2D_set_randomness_ratio :: MethodBind
bindCPUParticles2D_set_randomness_ratio
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission lifetime randomness ratio. Default value: [code]0[/code].
set_randomness_ratio ::
                       (CPUParticles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_randomness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_speed_scale #-}

-- | Particle system's running speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
bindCPUParticles2D_set_speed_scale :: MethodBind
bindCPUParticles2D_set_speed_scale
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system's running speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
set_speed_scale ::
                  (CPUParticles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_spread #-}

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Default value: [code]45[/code].
bindCPUParticles2D_set_spread :: MethodBind
bindCPUParticles2D_set_spread
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_spread" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Each particle's initial direction range from [code]+spread[/code] to [code]-spread[/code] degrees. Default value: [code]45[/code].
set_spread ::
             (CPUParticles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_spread cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_spread (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_texture #-}

-- | Particle texture. If [code]null[/code] particles will be squares.
bindCPUParticles2D_set_texture :: MethodBind
bindCPUParticles2D_set_texture
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle texture. If [code]null[/code] particles will be squares.
set_texture ::
              (CPUParticles2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCPUParticles2D_set_use_local_coordinates #-}

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
bindCPUParticles2D_set_use_local_coordinates :: MethodBind
bindCPUParticles2D_set_use_local_coordinates
  = unsafePerformIO $
      withCString "CPUParticles2D" $
        \ clsNamePtr ->
          withCString "set_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
set_use_local_coordinates ::
                            (CPUParticles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_local_coordinates cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCPUParticles2D_set_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)