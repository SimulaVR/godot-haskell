{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.GeometryInstance()

_MAX_DRAW_PASSES :: Int
_MAX_DRAW_PASSES = 4

_DRAW_ORDER_LIFETIME :: Int
_DRAW_ORDER_LIFETIME = 1

_DRAW_ORDER_INDEX :: Int
_DRAW_ORDER_INDEX = 0

_DRAW_ORDER_VIEW_DEPTH :: Int
_DRAW_ORDER_VIEW_DEPTH = 2

instance NodeProperty Particles "amount" Int 'False where
        nodeProperty = (get_amount, wrapDroppingSetter set_amount, Nothing)

instance NodeProperty Particles "draw_order" Int 'False where
        nodeProperty
          = (get_draw_order, wrapDroppingSetter set_draw_order, Nothing)

instance NodeProperty Particles "draw_pass_1" Mesh 'False where
        nodeProperty
          = (wrapIndexedGetter 0 get_draw_pass_mesh,
             wrapIndexedSetter 0 set_draw_pass_mesh, Nothing)

instance NodeProperty Particles "draw_pass_2" Mesh 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_draw_pass_mesh,
             wrapIndexedSetter 1 set_draw_pass_mesh, Nothing)

instance NodeProperty Particles "draw_pass_3" Mesh 'False where
        nodeProperty
          = (wrapIndexedGetter 2 get_draw_pass_mesh,
             wrapIndexedSetter 2 set_draw_pass_mesh, Nothing)

instance NodeProperty Particles "draw_pass_4" Mesh 'False where
        nodeProperty
          = (wrapIndexedGetter 3 get_draw_pass_mesh,
             wrapIndexedSetter 3 set_draw_pass_mesh, Nothing)

instance NodeProperty Particles "draw_passes" Int 'False where
        nodeProperty
          = (get_draw_passes, wrapDroppingSetter set_draw_passes, Nothing)

instance NodeProperty Particles "emitting" Bool 'False where
        nodeProperty
          = (is_emitting, wrapDroppingSetter set_emitting, Nothing)

instance NodeProperty Particles "explosiveness" Float 'False where
        nodeProperty
          = (get_explosiveness_ratio,
             wrapDroppingSetter set_explosiveness_ratio, Nothing)

instance NodeProperty Particles "fixed_fps" Int 'False where
        nodeProperty
          = (get_fixed_fps, wrapDroppingSetter set_fixed_fps, Nothing)

instance NodeProperty Particles "fract_delta" Bool 'False where
        nodeProperty
          = (get_fractional_delta, wrapDroppingSetter set_fractional_delta,
             Nothing)

instance NodeProperty Particles "lifetime" Float 'False where
        nodeProperty
          = (get_lifetime, wrapDroppingSetter set_lifetime, Nothing)

instance NodeProperty Particles "local_coords" Bool 'False where
        nodeProperty
          = (get_use_local_coordinates,
             wrapDroppingSetter set_use_local_coordinates, Nothing)

instance NodeProperty Particles "one_shot" Bool 'False where
        nodeProperty
          = (get_one_shot, wrapDroppingSetter set_one_shot, Nothing)

instance NodeProperty Particles "preprocess" Float 'False where
        nodeProperty
          = (get_pre_process_time, wrapDroppingSetter set_pre_process_time,
             Nothing)

instance NodeProperty Particles "process_material" Material 'False
         where
        nodeProperty
          = (get_process_material, wrapDroppingSetter set_process_material,
             Nothing)

instance NodeProperty Particles "randomness" Float 'False where
        nodeProperty
          = (get_randomness_ratio, wrapDroppingSetter set_randomness_ratio,
             Nothing)

instance NodeProperty Particles "speed_scale" Float 'False where
        nodeProperty
          = (get_speed_scale, wrapDroppingSetter set_speed_scale, Nothing)

instance NodeProperty Particles "visibility_aabb" Aabb 'False where
        nodeProperty
          = (get_visibility_aabb, wrapDroppingSetter set_visibility_aabb,
             Nothing)

{-# NOINLINE bindParticles_capture_aabb #-}

-- | Returns the axis-aligned bounding box that contains all the particles that are active in the current frame.
bindParticles_capture_aabb :: MethodBind
bindParticles_capture_aabb
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "capture_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the axis-aligned bounding box that contains all the particles that are active in the current frame.
capture_aabb :: (Particles :< cls, Object :< cls) => cls -> IO Aabb
capture_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_capture_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "capture_aabb" '[] (IO Aabb) where
        nodeMethod = Godot.Core.Particles.capture_aabb

{-# NOINLINE bindParticles_get_amount #-}

-- | The number of particles emitted in one emission cycle (corresponding to the @lifetime@).
--   			__Note:__ Changing @amount@ will reset the particle emission, therefore removing all particles that were already emitted before changing @amount@.
bindParticles_get_amount :: MethodBind
bindParticles_get_amount
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of particles emitted in one emission cycle (corresponding to the @lifetime@).
--   			__Note:__ Changing @amount@ will reset the particle emission, therefore removing all particles that were already emitted before changing @amount@.
get_amount :: (Particles :< cls, Object :< cls) => cls -> IO Int
get_amount cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_amount (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "get_amount" '[] (IO Int) where
        nodeMethod = Godot.Core.Particles.get_amount

{-# NOINLINE bindParticles_get_draw_order #-}

-- | Particle draw order. Uses @enum DrawOrder@ values.
bindParticles_get_draw_order :: MethodBind
bindParticles_get_draw_order
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses @enum DrawOrder@ values.
get_draw_order ::
                 (Particles :< cls, Object :< cls) => cls -> IO Int
get_draw_order cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "get_draw_order" '[] (IO Int) where
        nodeMethod = Godot.Core.Particles.get_draw_order

{-# NOINLINE bindParticles_get_draw_pass_mesh #-}

-- | Returns the @Mesh@ that is drawn at index @pass@.
bindParticles_get_draw_pass_mesh :: MethodBind
bindParticles_get_draw_pass_mesh
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_draw_pass_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Mesh@ that is drawn at index @pass@.
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

instance NodeMethod Particles "get_draw_pass_mesh" '[Int] (IO Mesh)
         where
        nodeMethod = Godot.Core.Particles.get_draw_pass_mesh

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

instance NodeMethod Particles "get_draw_passes" '[] (IO Int) where
        nodeMethod = Godot.Core.Particles.get_draw_passes

{-# NOINLINE bindParticles_get_explosiveness_ratio #-}

-- | Time ratio between each emission. If @0@, particles are emitted continuously. If @1@, all particles are emitted simultaneously.
bindParticles_get_explosiveness_ratio :: MethodBind
bindParticles_get_explosiveness_ratio
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Time ratio between each emission. If @0@, particles are emitted continuously. If @1@, all particles are emitted simultaneously.
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

instance NodeMethod Particles "get_explosiveness_ratio" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Particles.get_explosiveness_ratio

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

instance NodeMethod Particles "get_fixed_fps" '[] (IO Int) where
        nodeMethod = Godot.Core.Particles.get_fixed_fps

{-# NOINLINE bindParticles_get_fractional_delta #-}

-- | If @true@, results in fractional delta calculation which has a smoother particles display effect.
bindParticles_get_fractional_delta :: MethodBind
bindParticles_get_fractional_delta
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, results in fractional delta calculation which has a smoother particles display effect.
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

instance NodeMethod Particles "get_fractional_delta" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Particles.get_fractional_delta

{-# NOINLINE bindParticles_get_lifetime #-}

-- | The amount of time each particle will exist (in seconds).
bindParticles_get_lifetime :: MethodBind
bindParticles_get_lifetime
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of time each particle will exist (in seconds).
get_lifetime ::
               (Particles :< cls, Object :< cls) => cls -> IO Float
get_lifetime cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "get_lifetime" '[] (IO Float) where
        nodeMethod = Godot.Core.Particles.get_lifetime

{-# NOINLINE bindParticles_get_one_shot #-}

-- | If @true@, only @amount@ particles will be emitted.
bindParticles_get_one_shot :: MethodBind
bindParticles_get_one_shot
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, only @amount@ particles will be emitted.
get_one_shot :: (Particles :< cls, Object :< cls) => cls -> IO Bool
get_one_shot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "get_one_shot" '[] (IO Bool) where
        nodeMethod = Godot.Core.Particles.get_one_shot

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

instance NodeMethod Particles "get_pre_process_time" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Particles.get_pre_process_time

{-# NOINLINE bindParticles_get_process_material #-}

-- | @Material@ for processing particles. Can be a @ParticlesMaterial@ or a @ShaderMaterial@.
bindParticles_get_process_material :: MethodBind
bindParticles_get_process_material
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Material@ for processing particles. Can be a @ParticlesMaterial@ or a @ShaderMaterial@.
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

instance NodeMethod Particles "get_process_material" '[]
           (IO Material)
         where
        nodeMethod = Godot.Core.Particles.get_process_material

{-# NOINLINE bindParticles_get_randomness_ratio #-}

-- | Emission randomness ratio.
bindParticles_get_randomness_ratio :: MethodBind
bindParticles_get_randomness_ratio
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission randomness ratio.
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

instance NodeMethod Particles "get_randomness_ratio" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Particles.get_randomness_ratio

{-# NOINLINE bindParticles_get_speed_scale #-}

-- | Speed scaling ratio. A value of @0@ can be used to pause the particles.
bindParticles_get_speed_scale :: MethodBind
bindParticles_get_speed_scale
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Speed scaling ratio. A value of @0@ can be used to pause the particles.
get_speed_scale ::
                  (Particles :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_get_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "get_speed_scale" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Particles.get_speed_scale

{-# NOINLINE bindParticles_get_use_local_coordinates #-}

-- | If @true@, particles use the parent node's coordinate space. If @false@, they use global coordinates.
bindParticles_get_use_local_coordinates :: MethodBind
bindParticles_get_use_local_coordinates
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particles use the parent node's coordinate space. If @false@, they use global coordinates.
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

instance NodeMethod Particles "get_use_local_coordinates" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Particles.get_use_local_coordinates

{-# NOINLINE bindParticles_get_visibility_aabb #-}

-- | The @AABB@ that determines the node's region which needs to be visible on screen for the particle system to be active.
--   			Grow the box if particles suddenly appear/disappear when the node enters/exits the screen. The @AABB@ can be grown via code or with the __Particles → Generate AABB__ editor tool.
--   			__Note:__ If the @ParticlesMaterial@ in use is configured to cast shadows, you may want to enlarge this AABB to ensure the shadow is updated when particles are off-screen.
bindParticles_get_visibility_aabb :: MethodBind
bindParticles_get_visibility_aabb
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "get_visibility_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @AABB@ that determines the node's region which needs to be visible on screen for the particle system to be active.
--   			Grow the box if particles suddenly appear/disappear when the node enters/exits the screen. The @AABB@ can be grown via code or with the __Particles → Generate AABB__ editor tool.
--   			__Note:__ If the @ParticlesMaterial@ in use is configured to cast shadows, you may want to enlarge this AABB to ensure the shadow is updated when particles are off-screen.
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

instance NodeMethod Particles "get_visibility_aabb" '[] (IO Aabb)
         where
        nodeMethod = Godot.Core.Particles.get_visibility_aabb

{-# NOINLINE bindParticles_is_emitting #-}

-- | If @true@, particles are being emitted.
bindParticles_is_emitting :: MethodBind
bindParticles_is_emitting
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "is_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particles are being emitted.
is_emitting :: (Particles :< cls, Object :< cls) => cls -> IO Bool
is_emitting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_is_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "is_emitting" '[] (IO Bool) where
        nodeMethod = Godot.Core.Particles.is_emitting

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

instance NodeMethod Particles "restart" '[] (IO ()) where
        nodeMethod = Godot.Core.Particles.restart

{-# NOINLINE bindParticles_set_amount #-}

-- | The number of particles emitted in one emission cycle (corresponding to the @lifetime@).
--   			__Note:__ Changing @amount@ will reset the particle emission, therefore removing all particles that were already emitted before changing @amount@.
bindParticles_set_amount :: MethodBind
bindParticles_set_amount
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of particles emitted in one emission cycle (corresponding to the @lifetime@).
--   			__Note:__ Changing @amount@ will reset the particle emission, therefore removing all particles that were already emitted before changing @amount@.
set_amount ::
             (Particles :< cls, Object :< cls) => cls -> Int -> IO ()
set_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_amount (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "set_amount" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Particles.set_amount

{-# NOINLINE bindParticles_set_draw_order #-}

-- | Particle draw order. Uses @enum DrawOrder@ values.
bindParticles_set_draw_order :: MethodBind
bindParticles_set_draw_order
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Particle draw order. Uses @enum DrawOrder@ values.
set_draw_order ::
                 (Particles :< cls, Object :< cls) => cls -> Int -> IO ()
set_draw_order cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_draw_order (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "set_draw_order" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Particles.set_draw_order

{-# NOINLINE bindParticles_set_draw_pass_mesh #-}

-- | Sets the @Mesh@ that is drawn at index @pass@.
bindParticles_set_draw_pass_mesh :: MethodBind
bindParticles_set_draw_pass_mesh
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_draw_pass_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Mesh@ that is drawn at index @pass@.
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

instance NodeMethod Particles "set_draw_pass_mesh" '[Int, Mesh]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_draw_pass_mesh

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

instance NodeMethod Particles "set_draw_passes" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_draw_passes

{-# NOINLINE bindParticles_set_emitting #-}

-- | If @true@, particles are being emitted.
bindParticles_set_emitting :: MethodBind
bindParticles_set_emitting
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particles are being emitted.
set_emitting ::
               (Particles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_emitting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_emitting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "set_emitting" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Particles.set_emitting

{-# NOINLINE bindParticles_set_explosiveness_ratio #-}

-- | Time ratio between each emission. If @0@, particles are emitted continuously. If @1@, all particles are emitted simultaneously.
bindParticles_set_explosiveness_ratio :: MethodBind
bindParticles_set_explosiveness_ratio
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Time ratio between each emission. If @0@, particles are emitted continuously. If @1@, all particles are emitted simultaneously.
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

instance NodeMethod Particles "set_explosiveness_ratio" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_explosiveness_ratio

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

instance NodeMethod Particles "set_fixed_fps" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Particles.set_fixed_fps

{-# NOINLINE bindParticles_set_fractional_delta #-}

-- | If @true@, results in fractional delta calculation which has a smoother particles display effect.
bindParticles_set_fractional_delta :: MethodBind
bindParticles_set_fractional_delta
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, results in fractional delta calculation which has a smoother particles display effect.
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

instance NodeMethod Particles "set_fractional_delta" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_fractional_delta

{-# NOINLINE bindParticles_set_lifetime #-}

-- | The amount of time each particle will exist (in seconds).
bindParticles_set_lifetime :: MethodBind
bindParticles_set_lifetime
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of time each particle will exist (in seconds).
set_lifetime ::
               (Particles :< cls, Object :< cls) => cls -> Float -> IO ()
set_lifetime cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_lifetime (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "set_lifetime" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Particles.set_lifetime

{-# NOINLINE bindParticles_set_one_shot #-}

-- | If @true@, only @amount@ particles will be emitted.
bindParticles_set_one_shot :: MethodBind
bindParticles_set_one_shot
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, only @amount@ particles will be emitted.
set_one_shot ::
               (Particles :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_shot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_one_shot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "set_one_shot" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Particles.set_one_shot

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

instance NodeMethod Particles "set_pre_process_time" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_pre_process_time

{-# NOINLINE bindParticles_set_process_material #-}

-- | @Material@ for processing particles. Can be a @ParticlesMaterial@ or a @ShaderMaterial@.
bindParticles_set_process_material :: MethodBind
bindParticles_set_process_material
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Material@ for processing particles. Can be a @ParticlesMaterial@ or a @ShaderMaterial@.
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

instance NodeMethod Particles "set_process_material" '[Material]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_process_material

{-# NOINLINE bindParticles_set_randomness_ratio #-}

-- | Emission randomness ratio.
bindParticles_set_randomness_ratio :: MethodBind
bindParticles_set_randomness_ratio
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emission randomness ratio.
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

instance NodeMethod Particles "set_randomness_ratio" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_randomness_ratio

{-# NOINLINE bindParticles_set_speed_scale #-}

-- | Speed scaling ratio. A value of @0@ can be used to pause the particles.
bindParticles_set_speed_scale :: MethodBind
bindParticles_set_speed_scale
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Speed scaling ratio. A value of @0@ can be used to pause the particles.
set_speed_scale ::
                  (Particles :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParticles_set_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Particles "set_speed_scale" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_speed_scale

{-# NOINLINE bindParticles_set_use_local_coordinates #-}

-- | If @true@, particles use the parent node's coordinate space. If @false@, they use global coordinates.
bindParticles_set_use_local_coordinates :: MethodBind
bindParticles_set_use_local_coordinates
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particles use the parent node's coordinate space. If @false@, they use global coordinates.
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

instance NodeMethod Particles "set_use_local_coordinates" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_use_local_coordinates

{-# NOINLINE bindParticles_set_visibility_aabb #-}

-- | The @AABB@ that determines the node's region which needs to be visible on screen for the particle system to be active.
--   			Grow the box if particles suddenly appear/disappear when the node enters/exits the screen. The @AABB@ can be grown via code or with the __Particles → Generate AABB__ editor tool.
--   			__Note:__ If the @ParticlesMaterial@ in use is configured to cast shadows, you may want to enlarge this AABB to ensure the shadow is updated when particles are off-screen.
bindParticles_set_visibility_aabb :: MethodBind
bindParticles_set_visibility_aabb
  = unsafePerformIO $
      withCString "Particles" $
        \ clsNamePtr ->
          withCString "set_visibility_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @AABB@ that determines the node's region which needs to be visible on screen for the particle system to be active.
--   			Grow the box if particles suddenly appear/disappear when the node enters/exits the screen. The @AABB@ can be grown via code or with the __Particles → Generate AABB__ editor tool.
--   			__Note:__ If the @ParticlesMaterial@ in use is configured to cast shadows, you may want to enlarge this AABB to ensure the shadow is updated when particles are off-screen.
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

instance NodeMethod Particles "set_visibility_aabb" '[Aabb] (IO ())
         where
        nodeMethod = Godot.Core.Particles.set_visibility_aabb