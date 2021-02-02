{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Particles2D
       (Godot.Core.Particles2D._DRAW_ORDER_LIFETIME,
        Godot.Core.Particles2D._DRAW_ORDER_INDEX,
        Godot.Core.Particles2D.capture_rect,
        Godot.Core.Particles2D.get_amount,
        Godot.Core.Particles2D.get_draw_order,
        Godot.Core.Particles2D.get_explosiveness_ratio,
        Godot.Core.Particles2D.get_fixed_fps,
        Godot.Core.Particles2D.get_fractional_delta,
        Godot.Core.Particles2D.get_lifetime,
        Godot.Core.Particles2D.get_normal_map,
        Godot.Core.Particles2D.get_one_shot,
        Godot.Core.Particles2D.get_pre_process_time,
        Godot.Core.Particles2D.get_process_material,
        Godot.Core.Particles2D.get_randomness_ratio,
        Godot.Core.Particles2D.get_speed_scale,
        Godot.Core.Particles2D.get_texture,
        Godot.Core.Particles2D.get_use_local_coordinates,
        Godot.Core.Particles2D.get_visibility_rect,
        Godot.Core.Particles2D.is_emitting, Godot.Core.Particles2D.restart,
        Godot.Core.Particles2D.set_amount,
        Godot.Core.Particles2D.set_draw_order,
        Godot.Core.Particles2D.set_emitting,
        Godot.Core.Particles2D.set_explosiveness_ratio,
        Godot.Core.Particles2D.set_fixed_fps,
        Godot.Core.Particles2D.set_fractional_delta,
        Godot.Core.Particles2D.set_lifetime,
        Godot.Core.Particles2D.set_normal_map,
        Godot.Core.Particles2D.set_one_shot,
        Godot.Core.Particles2D.set_pre_process_time,
        Godot.Core.Particles2D.set_process_material,
        Godot.Core.Particles2D.set_randomness_ratio,
        Godot.Core.Particles2D.set_speed_scale,
        Godot.Core.Particles2D.set_texture,
        Godot.Core.Particles2D.set_use_local_coordinates,
        Godot.Core.Particles2D.set_visibility_rect)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_DRAW_ORDER_LIFETIME :: Int
_DRAW_ORDER_LIFETIME = 1

_DRAW_ORDER_INDEX :: Int
_DRAW_ORDER_INDEX = 0

{-# NOINLINE bindParticles2D_capture_rect #-}

-- | Returns a rectangle containing the positions of all existing particles.
bindParticles2D_capture_rect :: MethodBind
bindParticles2D_capture_rect
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "capture_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a rectangle containing the positions of all existing particles.
capture_rect ::
               (Particles2D :< cls, Object :< cls) => cls -> IO Rect2
capture_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_capture_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_amount #-}

-- | Number of particles emitted in one emission cycle.
bindParticles2D_get_amount :: MethodBind
bindParticles2D_get_amount
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of particles emitted in one emission cycle.
get_amount :: (Particles2D :< cls, Object :< cls) => cls -> IO Int
get_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_draw_order #-}

-- | Particle draw order. Uses [code]DRAW_ORDER_*[/code] values. Default value: [constant DRAW_ORDER_INDEX].
bindParticles2D_get_draw_order :: MethodBind
bindParticles2D_get_draw_order
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses [code]DRAW_ORDER_*[/code] values. Default value: [constant DRAW_ORDER_INDEX].
get_draw_order ::
                 (Particles2D :< cls, Object :< cls) => cls -> IO Int
get_draw_order cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_explosiveness_ratio #-}

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins. Default value: [code]0[/code].
bindParticles2D_get_explosiveness_ratio :: MethodBind
bindParticles2D_get_explosiveness_ratio
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins. Default value: [code]0[/code].
get_explosiveness_ratio ::
                          (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_explosiveness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_fixed_fps #-}

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
bindParticles2D_get_fixed_fps :: MethodBind
bindParticles2D_get_fixed_fps
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
get_fixed_fps ::
                (Particles2D :< cls, Object :< cls) => cls -> IO Int
get_fixed_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_fixed_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_fractional_delta #-}

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code]
bindParticles2D_get_fractional_delta :: MethodBind
bindParticles2D_get_fractional_delta
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code]
get_fractional_delta ::
                       (Particles2D :< cls, Object :< cls) => cls -> IO Bool
get_fractional_delta cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_lifetime #-}

-- | Amount of time each particle will exist. Default value: [code]1[/code].
bindParticles2D_get_lifetime :: MethodBind
bindParticles2D_get_lifetime
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time each particle will exist. Default value: [code]1[/code].
get_lifetime ::
               (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_lifetime cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_normal_map #-}

-- | Normal map to be used for the [member texture] property.
bindParticles2D_get_normal_map :: MethodBind
bindParticles2D_get_normal_map
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Normal map to be used for the [member texture] property.
get_normal_map ::
                 (Particles2D :< cls, Object :< cls) => cls -> IO Texture
get_normal_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_one_shot #-}

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end. Default value: [code]false[/code].
bindParticles2D_get_one_shot :: MethodBind
bindParticles2D_get_one_shot
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end. Default value: [code]false[/code].
get_one_shot ::
               (Particles2D :< cls, Object :< cls) => cls -> IO Bool
get_one_shot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_pre_process_time #-}

-- | Particle system starts as if it had already run for this many seconds.
bindParticles2D_get_pre_process_time :: MethodBind
bindParticles2D_get_pre_process_time
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system starts as if it had already run for this many seconds.
get_pre_process_time ::
                       (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_pre_process_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_process_material #-}

-- | [Material] for processing particles. Can be a [ParticlesMaterial] or a [ShaderMaterial].
bindParticles2D_get_process_material :: MethodBind
bindParticles2D_get_process_material
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Material] for processing particles. Can be a [ParticlesMaterial] or a [ShaderMaterial].
get_process_material ::
                       (Particles2D :< cls, Object :< cls) => cls -> IO Material
get_process_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_process_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_randomness_ratio #-}

-- | Emission lifetime randomness ratio. Default value: [code]0[/code].
bindParticles2D_get_randomness_ratio :: MethodBind
bindParticles2D_get_randomness_ratio
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission lifetime randomness ratio. Default value: [code]0[/code].
get_randomness_ratio ::
                       (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_randomness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_speed_scale #-}

-- | Particle system's running speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
bindParticles2D_get_speed_scale :: MethodBind
bindParticles2D_get_speed_scale
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system's running speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
get_speed_scale ::
                  (Particles2D :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_texture #-}

-- | Particle texture. If [code]null[/code] particles will be squares.
bindParticles2D_get_texture :: MethodBind
bindParticles2D_get_texture
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle texture. If [code]null[/code] particles will be squares.
get_texture ::
              (Particles2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_use_local_coordinates #-}

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
bindParticles2D_get_use_local_coordinates :: MethodBind
bindParticles2D_get_use_local_coordinates
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
get_use_local_coordinates ::
                            (Particles2D :< cls, Object :< cls) => cls -> IO Bool
get_use_local_coordinates cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_get_visibility_rect #-}

-- | Editor visibility helper.
bindParticles2D_get_visibility_rect :: MethodBind
bindParticles2D_get_visibility_rect
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "get_visibility_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Editor visibility helper.
get_visibility_rect ::
                      (Particles2D :< cls, Object :< cls) => cls -> IO Rect2
get_visibility_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_get_visibility_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_is_emitting #-}

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
bindParticles2D_is_emitting :: MethodBind
bindParticles2D_is_emitting
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "is_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
is_emitting ::
              (Particles2D :< cls, Object :< cls) => cls -> IO Bool
is_emitting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_is_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_restart #-}

-- | Restarts all the existing particles.
bindParticles2D_restart :: MethodBind
bindParticles2D_restart
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "restart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Restarts all the existing particles.
restart :: (Particles2D :< cls, Object :< cls) => cls -> IO ()
restart cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_restart (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_amount #-}

-- | Number of particles emitted in one emission cycle.
bindParticles2D_set_amount :: MethodBind
bindParticles2D_set_amount
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of particles emitted in one emission cycle.
set_amount ::
             (Particles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_amount (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_draw_order #-}

-- | Particle draw order. Uses [code]DRAW_ORDER_*[/code] values. Default value: [constant DRAW_ORDER_INDEX].
bindParticles2D_set_draw_order :: MethodBind
bindParticles2D_set_draw_order
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses [code]DRAW_ORDER_*[/code] values. Default value: [constant DRAW_ORDER_INDEX].
set_draw_order ::
                 (Particles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_draw_order cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_emitting #-}

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
bindParticles2D_set_emitting :: MethodBind
bindParticles2D_set_emitting
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
set_emitting ::
               (Particles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_emitting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_explosiveness_ratio #-}

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins. Default value: [code]0[/code].
bindParticles2D_set_explosiveness_ratio :: MethodBind
bindParticles2D_set_explosiveness_ratio
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How rapidly particles in an emission cycle are emitted. If greater than [code]0[/code], there will be a gap in emissions before the next cycle begins. Default value: [code]0[/code].
set_explosiveness_ratio ::
                          (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_explosiveness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_fixed_fps #-}

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
bindParticles2D_set_fixed_fps :: MethodBind
bindParticles2D_set_fixed_fps
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
set_fixed_fps ::
                (Particles2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_fixed_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_fixed_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_fractional_delta #-}

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code]
bindParticles2D_set_fractional_delta :: MethodBind
bindParticles2D_set_fractional_delta
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code]
set_fractional_delta ::
                       (Particles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fractional_delta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_lifetime #-}

-- | Amount of time each particle will exist. Default value: [code]1[/code].
bindParticles2D_set_lifetime :: MethodBind
bindParticles2D_set_lifetime
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time each particle will exist. Default value: [code]1[/code].
set_lifetime ::
               (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_normal_map #-}

-- | Normal map to be used for the [member texture] property.
bindParticles2D_set_normal_map :: MethodBind
bindParticles2D_set_normal_map
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Normal map to be used for the [member texture] property.
set_normal_map ::
                 (Particles2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_normal_map (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_one_shot #-}

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end. Default value: [code]false[/code].
bindParticles2D_set_one_shot :: MethodBind
bindParticles2D_set_one_shot
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only one emission cycle occurs. If set [code]true[/code] during a cycle, emission will stop at the cycle's end. Default value: [code]false[/code].
set_one_shot ::
               (Particles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_shot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_pre_process_time #-}

-- | Particle system starts as if it had already run for this many seconds.
bindParticles2D_set_pre_process_time :: MethodBind
bindParticles2D_set_pre_process_time
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system starts as if it had already run for this many seconds.
set_pre_process_time ::
                       (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_pre_process_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_process_material #-}

-- | [Material] for processing particles. Can be a [ParticlesMaterial] or a [ShaderMaterial].
bindParticles2D_set_process_material :: MethodBind
bindParticles2D_set_process_material
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Material] for processing particles. Can be a [ParticlesMaterial] or a [ShaderMaterial].
set_process_material ::
                       (Particles2D :< cls, Object :< cls) => cls -> Material -> IO ()
set_process_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_process_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_randomness_ratio #-}

-- | Emission lifetime randomness ratio. Default value: [code]0[/code].
bindParticles2D_set_randomness_ratio :: MethodBind
bindParticles2D_set_randomness_ratio
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission lifetime randomness ratio. Default value: [code]0[/code].
set_randomness_ratio ::
                       (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_randomness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_speed_scale #-}

-- | Particle system's running speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
bindParticles2D_set_speed_scale :: MethodBind
bindParticles2D_set_speed_scale
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle system's running speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
set_speed_scale ::
                  (Particles2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_texture #-}

-- | Particle texture. If [code]null[/code] particles will be squares.
bindParticles2D_set_texture :: MethodBind
bindParticles2D_set_texture
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle texture. If [code]null[/code] particles will be squares.
set_texture ::
              (Particles2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_use_local_coordinates #-}

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
bindParticles2D_set_use_local_coordinates :: MethodBind
bindParticles2D_set_use_local_coordinates
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
set_use_local_coordinates ::
                            (Particles2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_local_coordinates cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles2D_set_visibility_rect #-}

-- | Editor visibility helper.
bindParticles2D_set_visibility_rect :: MethodBind
bindParticles2D_set_visibility_rect
  = unsafePerformIO $
      withCString "Particles2D" $
        \ clsNamePtr ->
          withCString "set_visibility_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Editor visibility helper.
set_visibility_rect ::
                      (Particles2D :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_visibility_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles2D_set_visibility_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)