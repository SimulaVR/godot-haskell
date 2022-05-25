{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CanvasItemMaterial
       (Godot.Core.CanvasItemMaterial._BLEND_MODE_ADD,
        Godot.Core.CanvasItemMaterial._BLEND_MODE_PREMULT_ALPHA,
        Godot.Core.CanvasItemMaterial._LIGHT_MODE_UNSHADED,
        Godot.Core.CanvasItemMaterial._BLEND_MODE_MIX,
        Godot.Core.CanvasItemMaterial._LIGHT_MODE_LIGHT_ONLY,
        Godot.Core.CanvasItemMaterial._LIGHT_MODE_NORMAL,
        Godot.Core.CanvasItemMaterial._BLEND_MODE_SUB,
        Godot.Core.CanvasItemMaterial._BLEND_MODE_MUL,
        Godot.Core.CanvasItemMaterial.get_blend_mode,
        Godot.Core.CanvasItemMaterial.get_light_mode,
        Godot.Core.CanvasItemMaterial.get_particles_anim_h_frames,
        Godot.Core.CanvasItemMaterial.get_particles_anim_loop,
        Godot.Core.CanvasItemMaterial.get_particles_anim_v_frames,
        Godot.Core.CanvasItemMaterial.get_particles_animation,
        Godot.Core.CanvasItemMaterial.set_blend_mode,
        Godot.Core.CanvasItemMaterial.set_light_mode,
        Godot.Core.CanvasItemMaterial.set_particles_anim_h_frames,
        Godot.Core.CanvasItemMaterial.set_particles_anim_loop,
        Godot.Core.CanvasItemMaterial.set_particles_anim_v_frames,
        Godot.Core.CanvasItemMaterial.set_particles_animation)
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

_BLEND_MODE_ADD :: Int
_BLEND_MODE_ADD = 1

_BLEND_MODE_PREMULT_ALPHA :: Int
_BLEND_MODE_PREMULT_ALPHA = 4

_LIGHT_MODE_UNSHADED :: Int
_LIGHT_MODE_UNSHADED = 1

_BLEND_MODE_MIX :: Int
_BLEND_MODE_MIX = 0

_LIGHT_MODE_LIGHT_ONLY :: Int
_LIGHT_MODE_LIGHT_ONLY = 2

_LIGHT_MODE_NORMAL :: Int
_LIGHT_MODE_NORMAL = 0

_BLEND_MODE_SUB :: Int
_BLEND_MODE_SUB = 2

_BLEND_MODE_MUL :: Int
_BLEND_MODE_MUL = 3

instance NodeProperty CanvasItemMaterial "blend_mode" Int 'False
         where
        nodeProperty
          = (get_blend_mode, wrapDroppingSetter set_blend_mode, Nothing)

instance NodeProperty CanvasItemMaterial "light_mode" Int 'False
         where
        nodeProperty
          = (get_light_mode, wrapDroppingSetter set_light_mode, Nothing)

instance NodeProperty CanvasItemMaterial "particles_anim_h_frames"
           Int
           'False
         where
        nodeProperty
          = (get_particles_anim_h_frames,
             wrapDroppingSetter set_particles_anim_h_frames, Nothing)

instance NodeProperty CanvasItemMaterial "particles_anim_loop" Bool
           'False
         where
        nodeProperty
          = (get_particles_anim_loop,
             wrapDroppingSetter set_particles_anim_loop, Nothing)

instance NodeProperty CanvasItemMaterial "particles_anim_v_frames"
           Int
           'False
         where
        nodeProperty
          = (get_particles_anim_v_frames,
             wrapDroppingSetter set_particles_anim_v_frames, Nothing)

instance NodeProperty CanvasItemMaterial "particles_animation" Bool
           'False
         where
        nodeProperty
          = (get_particles_animation,
             wrapDroppingSetter set_particles_animation, Nothing)

{-# NOINLINE bindCanvasItemMaterial_get_blend_mode #-}

-- | The manner in which a material's rendering is applied to underlying textures.
bindCanvasItemMaterial_get_blend_mode :: MethodBind
bindCanvasItemMaterial_get_blend_mode
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "get_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The manner in which a material's rendering is applied to underlying textures.
get_blend_mode ::
                 (CanvasItemMaterial :< cls, Object :< cls) => cls -> IO Int
get_blend_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItemMaterial_get_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial "get_blend_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.CanvasItemMaterial.get_blend_mode

{-# NOINLINE bindCanvasItemMaterial_get_light_mode #-}

-- | The manner in which material reacts to lighting.
bindCanvasItemMaterial_get_light_mode :: MethodBind
bindCanvasItemMaterial_get_light_mode
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "get_light_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The manner in which material reacts to lighting.
get_light_mode ::
                 (CanvasItemMaterial :< cls, Object :< cls) => cls -> IO Int
get_light_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItemMaterial_get_light_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial "get_light_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.CanvasItemMaterial.get_light_mode

{-# NOINLINE bindCanvasItemMaterial_get_particles_anim_h_frames #-}

-- | The number of columns in the spritesheet assigned as @Texture@ for a @Particles2D@ or @CPUParticles2D@.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
bindCanvasItemMaterial_get_particles_anim_h_frames :: MethodBind
bindCanvasItemMaterial_get_particles_anim_h_frames
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "get_particles_anim_h_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the spritesheet assigned as @Texture@ for a @Particles2D@ or @CPUParticles2D@.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
get_particles_anim_h_frames ::
                              (CanvasItemMaterial :< cls, Object :< cls) => cls -> IO Int
get_particles_anim_h_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItemMaterial_get_particles_anim_h_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial
           "get_particles_anim_h_frames"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.CanvasItemMaterial.get_particles_anim_h_frames

{-# NOINLINE bindCanvasItemMaterial_get_particles_anim_loop #-}

-- | If @true@, the particles animation will loop.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
bindCanvasItemMaterial_get_particles_anim_loop :: MethodBind
bindCanvasItemMaterial_get_particles_anim_loop
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "get_particles_anim_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the particles animation will loop.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
get_particles_anim_loop ::
                          (CanvasItemMaterial :< cls, Object :< cls) => cls -> IO Bool
get_particles_anim_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItemMaterial_get_particles_anim_loop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial "get_particles_anim_loop"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasItemMaterial.get_particles_anim_loop

{-# NOINLINE bindCanvasItemMaterial_get_particles_anim_v_frames #-}

-- | The number of rows in the spritesheet assigned as @Texture@ for a @Particles2D@ or @CPUParticles2D@.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
bindCanvasItemMaterial_get_particles_anim_v_frames :: MethodBind
bindCanvasItemMaterial_get_particles_anim_v_frames
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "get_particles_anim_v_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of rows in the spritesheet assigned as @Texture@ for a @Particles2D@ or @CPUParticles2D@.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
get_particles_anim_v_frames ::
                              (CanvasItemMaterial :< cls, Object :< cls) => cls -> IO Int
get_particles_anim_v_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItemMaterial_get_particles_anim_v_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial
           "get_particles_anim_v_frames"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.CanvasItemMaterial.get_particles_anim_v_frames

{-# NOINLINE bindCanvasItemMaterial_get_particles_animation #-}

-- | If @true@, enable spritesheet-based animation features when assigned to @Particles2D@ and @CPUParticles2D@ nodes. The @ParticlesMaterial.anim_speed@ or @CPUParticles2D.anim_speed@ should also be set to a positive value for the animation to play.
--   			This property (and other @particles_anim_*@ properties that depend on it) has no effect on other types of nodes.
bindCanvasItemMaterial_get_particles_animation :: MethodBind
bindCanvasItemMaterial_get_particles_animation
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "get_particles_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enable spritesheet-based animation features when assigned to @Particles2D@ and @CPUParticles2D@ nodes. The @ParticlesMaterial.anim_speed@ or @CPUParticles2D.anim_speed@ should also be set to a positive value for the animation to play.
--   			This property (and other @particles_anim_*@ properties that depend on it) has no effect on other types of nodes.
get_particles_animation ::
                          (CanvasItemMaterial :< cls, Object :< cls) => cls -> IO Bool
get_particles_animation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItemMaterial_get_particles_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial "get_particles_animation"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasItemMaterial.get_particles_animation

{-# NOINLINE bindCanvasItemMaterial_set_blend_mode #-}

-- | The manner in which a material's rendering is applied to underlying textures.
bindCanvasItemMaterial_set_blend_mode :: MethodBind
bindCanvasItemMaterial_set_blend_mode
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "set_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The manner in which a material's rendering is applied to underlying textures.
set_blend_mode ::
                 (CanvasItemMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_blend_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItemMaterial_set_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial "set_blend_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItemMaterial.set_blend_mode

{-# NOINLINE bindCanvasItemMaterial_set_light_mode #-}

-- | The manner in which material reacts to lighting.
bindCanvasItemMaterial_set_light_mode :: MethodBind
bindCanvasItemMaterial_set_light_mode
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "set_light_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The manner in which material reacts to lighting.
set_light_mode ::
                 (CanvasItemMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_light_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItemMaterial_set_light_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial "set_light_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItemMaterial.set_light_mode

{-# NOINLINE bindCanvasItemMaterial_set_particles_anim_h_frames #-}

-- | The number of columns in the spritesheet assigned as @Texture@ for a @Particles2D@ or @CPUParticles2D@.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
bindCanvasItemMaterial_set_particles_anim_h_frames :: MethodBind
bindCanvasItemMaterial_set_particles_anim_h_frames
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "set_particles_anim_h_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the spritesheet assigned as @Texture@ for a @Particles2D@ or @CPUParticles2D@.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
set_particles_anim_h_frames ::
                              (CanvasItemMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_particles_anim_h_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItemMaterial_set_particles_anim_h_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial
           "set_particles_anim_h_frames"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.CanvasItemMaterial.set_particles_anim_h_frames

{-# NOINLINE bindCanvasItemMaterial_set_particles_anim_loop #-}

-- | If @true@, the particles animation will loop.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
bindCanvasItemMaterial_set_particles_anim_loop :: MethodBind
bindCanvasItemMaterial_set_particles_anim_loop
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "set_particles_anim_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the particles animation will loop.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
set_particles_anim_loop ::
                          (CanvasItemMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_particles_anim_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItemMaterial_set_particles_anim_loop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial "set_particles_anim_loop"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItemMaterial.set_particles_anim_loop

{-# NOINLINE bindCanvasItemMaterial_set_particles_anim_v_frames #-}

-- | The number of rows in the spritesheet assigned as @Texture@ for a @Particles2D@ or @CPUParticles2D@.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
bindCanvasItemMaterial_set_particles_anim_v_frames :: MethodBind
bindCanvasItemMaterial_set_particles_anim_v_frames
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "set_particles_anim_v_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of rows in the spritesheet assigned as @Texture@ for a @Particles2D@ or @CPUParticles2D@.
--   			__Note:__ This property is only used and visible in the editor if @particles_animation@ is @true@.
set_particles_anim_v_frames ::
                              (CanvasItemMaterial :< cls, Object :< cls) => cls -> Int -> IO ()
set_particles_anim_v_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItemMaterial_set_particles_anim_v_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial
           "set_particles_anim_v_frames"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.CanvasItemMaterial.set_particles_anim_v_frames

{-# NOINLINE bindCanvasItemMaterial_set_particles_animation #-}

-- | If @true@, enable spritesheet-based animation features when assigned to @Particles2D@ and @CPUParticles2D@ nodes. The @ParticlesMaterial.anim_speed@ or @CPUParticles2D.anim_speed@ should also be set to a positive value for the animation to play.
--   			This property (and other @particles_anim_*@ properties that depend on it) has no effect on other types of nodes.
bindCanvasItemMaterial_set_particles_animation :: MethodBind
bindCanvasItemMaterial_set_particles_animation
  = unsafePerformIO $
      withCString "CanvasItemMaterial" $
        \ clsNamePtr ->
          withCString "set_particles_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enable spritesheet-based animation features when assigned to @Particles2D@ and @CPUParticles2D@ nodes. The @ParticlesMaterial.anim_speed@ or @CPUParticles2D.anim_speed@ should also be set to a positive value for the animation to play.
--   			This property (and other @particles_anim_*@ properties that depend on it) has no effect on other types of nodes.
set_particles_animation ::
                          (CanvasItemMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_particles_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItemMaterial_set_particles_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItemMaterial "set_particles_animation"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItemMaterial.set_particles_animation