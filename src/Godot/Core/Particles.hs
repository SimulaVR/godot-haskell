{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Particles
       (Godot.Core.Particles._MAX_DRAW_PASSES,
        Godot.Core.Particles._DRAW_ORDER_LIFETIME,
        Godot.Core.Particles._DRAW_ORDER_INDEX,
        Godot.Core.Particles._DRAW_ORDER_VIEW_DEPTH,
        Godot.Core.Particles.capture_aabb, Godot.Core.Particles.get_amount,
        Godot.Core.Particles.get_draw_order,
        Godot.Core.Particles.get_draw_pass_mesh,
        Godot.Core.Particles.get_draw_passes,
        Godot.Core.Particles.get_explosiveness_ratio,
        Godot.Core.Particles.get_fixed_fps,
        Godot.Core.Particles.get_fractional_delta,
        Godot.Core.Particles.get_lifetime,
        Godot.Core.Particles.get_one_shot,
        Godot.Core.Particles.get_pre_process_time,
        Godot.Core.Particles.get_process_material,
        Godot.Core.Particles.get_randomness_ratio,
        Godot.Core.Particles.get_speed_scale,
        Godot.Core.Particles.get_use_local_coordinates,
        Godot.Core.Particles.get_visibility_aabb,
        Godot.Core.Particles.is_emitting, Godot.Core.Particles.restart,
        Godot.Core.Particles.set_amount,
        Godot.Core.Particles.set_draw_order,
        Godot.Core.Particles.set_draw_pass_mesh,
        Godot.Core.Particles.set_draw_passes,
        Godot.Core.Particles.set_emitting,
        Godot.Core.Particles.set_explosiveness_ratio,
        Godot.Core.Particles.set_fixed_fps,
        Godot.Core.Particles.set_fractional_delta,
        Godot.Core.Particles.set_lifetime,
        Godot.Core.Particles.set_one_shot,
        Godot.Core.Particles.set_pre_process_time,
        Godot.Core.Particles.set_process_material,
        Godot.Core.Particles.set_randomness_ratio,
        Godot.Core.Particles.set_speed_scale,
        Godot.Core.Particles.set_use_local_coordinates,
        Godot.Core.Particles.set_visibility_aabb)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MAX_DRAW_PASSES :: Int
_MAX_DRAW_PASSES = 4

_DRAW_ORDER_LIFETIME :: Int
_DRAW_ORDER_LIFETIME = 1

_DRAW_ORDER_INDEX :: Int
_DRAW_ORDER_INDEX = 0

_DRAW_ORDER_VIEW_DEPTH :: Int
_DRAW_ORDER_VIEW_DEPTH = 2

{-# NOINLINE bindParticles_capture_aabb #-}

-- | Returns the bounding box that contains all the particles that are active in the current frame.
bindParticles_capture_aabb :: MethodBind
bindParticles_capture_aabb
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "capture_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the bounding box that contains all the particles that are active in the current frame.
capture_aabb :: (Particles :< cls, Object :< cls) => cls -> IO Aabb
capture_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_capture_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_amount #-}

-- | Number of particles to emit.
bindParticles_get_amount :: MethodBind
bindParticles_get_amount
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of particles to emit.
get_amount :: (Particles :< cls, Object :< cls) => cls -> IO Int
get_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_amount (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_draw_order #-}

-- | Particle draw order. Uses [code]DRAW_ORDER_*[/code] values. Default value: [constant DRAW_ORDER_INDEX].
bindParticles_get_draw_order :: MethodBind
bindParticles_get_draw_order
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses [code]DRAW_ORDER_*[/code] values. Default value: [constant DRAW_ORDER_INDEX].
get_draw_order ::
                 (Particles :< cls, Object :< cls) => cls -> IO Int
get_draw_order cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_draw_pass_mesh #-}

-- | [Mesh] that is drawn for the first draw pass.
bindParticles_get_draw_pass_mesh :: MethodBind
bindParticles_get_draw_pass_mesh
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_draw_pass_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Mesh] that is drawn for the first draw pass.
get_draw_pass_mesh ::
                     (Particles :< cls, Object :< cls) => cls -> Int -> IO Mesh
get_draw_pass_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_draw_pass_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_draw_passes #-}

-- | The number of draw passes when rendering particles.
bindParticles_get_draw_passes :: MethodBind
bindParticles_get_draw_passes
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_draw_passes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of draw passes when rendering particles.
get_draw_passes ::
                  (Particles :< cls, Object :< cls) => cls -> IO Int
get_draw_passes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_draw_passes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_explosiveness_ratio #-}

-- | Time ratio between each emission. If [code]0[/code] particles are emitted continuously. If [code]1[/code] all particles are emitted simultaneously. Default value: [code]0[/code].
bindParticles_get_explosiveness_ratio :: MethodBind
bindParticles_get_explosiveness_ratio
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Time ratio between each emission. If [code]0[/code] particles are emitted continuously. If [code]1[/code] all particles are emitted simultaneously. Default value: [code]0[/code].
get_explosiveness_ratio ::
                          (Particles :< cls, Object :< cls) => cls -> IO Float
get_explosiveness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_fixed_fps #-}

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
bindParticles_get_fixed_fps :: MethodBind
bindParticles_get_fixed_fps
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
get_fixed_fps :: (Particles :< cls, Object :< cls) => cls -> IO Int
get_fixed_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_fixed_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_fractional_delta #-}

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code].
bindParticles_get_fractional_delta :: MethodBind
bindParticles_get_fractional_delta
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code].
get_fractional_delta ::
                       (Particles :< cls, Object :< cls) => cls -> IO Bool
get_fractional_delta cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_lifetime #-}

-- | Amount of time each particle will exist. Default value: [code]1[/code].
bindParticles_get_lifetime :: MethodBind
bindParticles_get_lifetime
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time each particle will exist. Default value: [code]1[/code].
get_lifetime ::
               (Particles :< cls, Object :< cls) => cls -> IO Float
get_lifetime cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_one_shot #-}

-- | If [code]true[/code], only [code]amount[/code] particles will be emitted. Default value: [code]false[/code].
bindParticles_get_one_shot :: MethodBind
bindParticles_get_one_shot
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only [code]amount[/code] particles will be emitted. Default value: [code]false[/code].
get_one_shot :: (Particles :< cls, Object :< cls) => cls -> IO Bool
get_one_shot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_pre_process_time #-}

-- | Amount of time to preprocess the particles before animation starts. Lets you start the animation some time after particles have started emitting.
bindParticles_get_pre_process_time :: MethodBind
bindParticles_get_pre_process_time
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time to preprocess the particles before animation starts. Lets you start the animation some time after particles have started emitting.
get_pre_process_time ::
                       (Particles :< cls, Object :< cls) => cls -> IO Float
get_pre_process_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_process_material #-}

-- | [Material] for processing particles. Can be a [ParticlesMaterial] or a [ShaderMaterial].
bindParticles_get_process_material :: MethodBind
bindParticles_get_process_material
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Material] for processing particles. Can be a [ParticlesMaterial] or a [ShaderMaterial].
get_process_material ::
                       (Particles :< cls, Object :< cls) => cls -> IO Material
get_process_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_process_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_randomness_ratio #-}

-- | Emission randomness ratio. Default value: [code]0[/code].
bindParticles_get_randomness_ratio :: MethodBind
bindParticles_get_randomness_ratio
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission randomness ratio. Default value: [code]0[/code].
get_randomness_ratio ::
                       (Particles :< cls, Object :< cls) => cls -> IO Float
get_randomness_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_speed_scale #-}

-- | Speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
bindParticles_get_speed_scale :: MethodBind
bindParticles_get_speed_scale
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
get_speed_scale ::
                  (Particles :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_use_local_coordinates #-}

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
bindParticles_get_use_local_coordinates :: MethodBind
bindParticles_get_use_local_coordinates
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
get_use_local_coordinates ::
                            (Particles :< cls, Object :< cls) => cls -> IO Bool
get_use_local_coordinates cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_get_visibility_aabb #-}

-- | The [AABB] that determines the area of the world part of which needs to be visible on screen for the particle system to be active.
bindParticles_get_visibility_aabb :: MethodBind
bindParticles_get_visibility_aabb
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_visibility_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [AABB] that determines the area of the world part of which needs to be visible on screen for the particle system to be active.
get_visibility_aabb ::
                      (Particles :< cls, Object :< cls) => cls -> IO Aabb
get_visibility_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_visibility_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_is_emitting #-}

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
bindParticles_is_emitting :: MethodBind
bindParticles_is_emitting
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "is_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
is_emitting :: (Particles :< cls, Object :< cls) => cls -> IO Bool
is_emitting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_is_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_restart #-}

-- | Restarts the particle emission, clearing existing particles.
bindParticles_restart :: MethodBind
bindParticles_restart
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "restart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Restarts the particle emission, clearing existing particles.
restart :: (Particles :< cls, Object :< cls) => cls -> IO ()
restart cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_restart (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_amount #-}

-- | Number of particles to emit.
bindParticles_set_amount :: MethodBind
bindParticles_set_amount
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of particles to emit.
set_amount ::
             (Particles :< cls, Object :< cls) => cls -> Int -> IO ()
set_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_amount (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_draw_order #-}

-- | Particle draw order. Uses [code]DRAW_ORDER_*[/code] values. Default value: [constant DRAW_ORDER_INDEX].
bindParticles_set_draw_order :: MethodBind
bindParticles_set_draw_order
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses [code]DRAW_ORDER_*[/code] values. Default value: [constant DRAW_ORDER_INDEX].
set_draw_order ::
                 (Particles :< cls, Object :< cls) => cls -> Int -> IO ()
set_draw_order cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_draw_pass_mesh #-}

-- | [Mesh] that is drawn for the first draw pass.
bindParticles_set_draw_pass_mesh :: MethodBind
bindParticles_set_draw_pass_mesh
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_draw_pass_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Mesh] that is drawn for the first draw pass.
set_draw_pass_mesh ::
                     (Particles :< cls, Object :< cls) => cls -> Int -> Mesh -> IO ()
set_draw_pass_mesh cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_draw_pass_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_draw_passes #-}

-- | The number of draw passes when rendering particles.
bindParticles_set_draw_passes :: MethodBind
bindParticles_set_draw_passes
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_draw_passes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of draw passes when rendering particles.
set_draw_passes ::
                  (Particles :< cls, Object :< cls) => cls -> Int -> IO ()
set_draw_passes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_draw_passes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_emitting #-}

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
bindParticles_set_emitting :: MethodBind
bindParticles_set_emitting
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles are being emitted. Default value: [code]true[/code].
set_emitting ::
               (Particles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_emitting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_explosiveness_ratio #-}

-- | Time ratio between each emission. If [code]0[/code] particles are emitted continuously. If [code]1[/code] all particles are emitted simultaneously. Default value: [code]0[/code].
bindParticles_set_explosiveness_ratio :: MethodBind
bindParticles_set_explosiveness_ratio
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Time ratio between each emission. If [code]0[/code] particles are emitted continuously. If [code]1[/code] all particles are emitted simultaneously. Default value: [code]0[/code].
set_explosiveness_ratio ::
                          (Particles :< cls, Object :< cls) => cls -> Float -> IO ()
set_explosiveness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_fixed_fps #-}

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
bindParticles_set_fixed_fps :: MethodBind
bindParticles_set_fixed_fps
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The particle system's frame rate is fixed to a value. For instance, changing the value to 2 will make the particles render at 2 frames per second. Note this does not slow down the simulation of the particle system itself.
set_fixed_fps ::
                (Particles :< cls, Object :< cls) => cls -> Int -> IO ()
set_fixed_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_fixed_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_fractional_delta #-}

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code].
bindParticles_set_fractional_delta :: MethodBind
bindParticles_set_fractional_delta
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], results in fractional delta calculation which has a smoother particles display effect. Default value: [code]true[/code].
set_fractional_delta ::
                       (Particles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_fractional_delta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_lifetime #-}

-- | Amount of time each particle will exist. Default value: [code]1[/code].
bindParticles_set_lifetime :: MethodBind
bindParticles_set_lifetime
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time each particle will exist. Default value: [code]1[/code].
set_lifetime ::
               (Particles :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_one_shot #-}

-- | If [code]true[/code], only [code]amount[/code] particles will be emitted. Default value: [code]false[/code].
bindParticles_set_one_shot :: MethodBind
bindParticles_set_one_shot
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], only [code]amount[/code] particles will be emitted. Default value: [code]false[/code].
set_one_shot ::
               (Particles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_shot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_pre_process_time #-}

-- | Amount of time to preprocess the particles before animation starts. Lets you start the animation some time after particles have started emitting.
bindParticles_set_pre_process_time :: MethodBind
bindParticles_set_pre_process_time
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of time to preprocess the particles before animation starts. Lets you start the animation some time after particles have started emitting.
set_pre_process_time ::
                       (Particles :< cls, Object :< cls) => cls -> Float -> IO ()
set_pre_process_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_process_material #-}

-- | [Material] for processing particles. Can be a [ParticlesMaterial] or a [ShaderMaterial].
bindParticles_set_process_material :: MethodBind
bindParticles_set_process_material
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Material] for processing particles. Can be a [ParticlesMaterial] or a [ShaderMaterial].
set_process_material ::
                       (Particles :< cls, Object :< cls) => cls -> Material -> IO ()
set_process_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_process_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_randomness_ratio #-}

-- | Emission randomness ratio. Default value: [code]0[/code].
bindParticles_set_randomness_ratio :: MethodBind
bindParticles_set_randomness_ratio
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission randomness ratio. Default value: [code]0[/code].
set_randomness_ratio ::
                       (Particles :< cls, Object :< cls) => cls -> Float -> IO ()
set_randomness_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_speed_scale #-}

-- | Speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
bindParticles_set_speed_scale :: MethodBind
bindParticles_set_speed_scale
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Speed scaling ratio. Default value: [code]1[/code]. A value of [code]0[/code] can be used to pause the particles.
set_speed_scale ::
                  (Particles :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_use_local_coordinates #-}

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
bindParticles_set_use_local_coordinates :: MethodBind
bindParticles_set_use_local_coordinates
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], particles use the parent node's coordinate space. If [code]false[/code], they use global coordinates. Default value: [code]true[/code].
set_use_local_coordinates ::
                            (Particles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_local_coordinates cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParticles_set_visibility_aabb #-}

-- | The [AABB] that determines the area of the world part of which needs to be visible on screen for the particle system to be active.
bindParticles_set_visibility_aabb :: MethodBind
bindParticles_set_visibility_aabb
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_visibility_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [AABB] that determines the area of the world part of which needs to be visible on screen for the particle system to be active.
set_visibility_aabb ::
                      (Particles :< cls, Object :< cls) => cls -> Aabb -> IO ()
set_visibility_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_visibility_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)