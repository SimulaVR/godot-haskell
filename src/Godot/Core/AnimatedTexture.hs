{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimatedTexture
       (Godot.Core.AnimatedTexture._MAX_FRAMES,
        Godot.Core.AnimatedTexture._update_proxy,
        Godot.Core.AnimatedTexture.get_fps,
        Godot.Core.AnimatedTexture.get_frame_delay,
        Godot.Core.AnimatedTexture.get_frame_texture,
        Godot.Core.AnimatedTexture.get_frames,
        Godot.Core.AnimatedTexture.set_fps,
        Godot.Core.AnimatedTexture.set_frame_delay,
        Godot.Core.AnimatedTexture.set_frame_texture,
        Godot.Core.AnimatedTexture.set_frames)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MAX_FRAMES :: Int
_MAX_FRAMES = 256

{-# NOINLINE bindAnimatedTexture__update_proxy #-}

bindAnimatedTexture__update_proxy :: MethodBind
bindAnimatedTexture__update_proxy
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "_update_proxy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_proxy ::
                (AnimatedTexture :< cls, Object :< cls) => cls -> IO ()
_update_proxy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture__update_proxy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedTexture_get_fps #-}

-- | Animation speed in frames per second. This value defines the default time interval between two frames of the animation, and thus the overall duration of the animation loop based on the [member frames] property. A value of 0 means no predefined number of frames per second, the animation will play according to each frame's frame delay (see [method set_frame_delay]).
--   			For example, an animation with 8 frames, no frame delay and a [code]fps[/code] value of 2 will run for 4 seconds, with each frame lasting 0.5 seconds.
bindAnimatedTexture_get_fps :: MethodBind
bindAnimatedTexture_get_fps
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "get_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animation speed in frames per second. This value defines the default time interval between two frames of the animation, and thus the overall duration of the animation loop based on the [member frames] property. A value of 0 means no predefined number of frames per second, the animation will play according to each frame's frame delay (see [method set_frame_delay]).
--   			For example, an animation with 8 frames, no frame delay and a [code]fps[/code] value of 2 will run for 4 seconds, with each frame lasting 0.5 seconds.
get_fps ::
          (AnimatedTexture :< cls, Object :< cls) => cls -> IO Float
get_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_get_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedTexture_get_frame_delay #-}

-- | Returns the given frame's delay value.
bindAnimatedTexture_get_frame_delay :: MethodBind
bindAnimatedTexture_get_frame_delay
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "get_frame_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given frame's delay value.
get_frame_delay ::
                  (AnimatedTexture :< cls, Object :< cls) => cls -> Int -> IO Float
get_frame_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_get_frame_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedTexture_get_frame_texture #-}

-- | Returns the given frame's [Texture].
bindAnimatedTexture_get_frame_texture :: MethodBind
bindAnimatedTexture_get_frame_texture
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "get_frame_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given frame's [Texture].
get_frame_texture ::
                    (AnimatedTexture :< cls, Object :< cls) => cls -> Int -> IO Texture
get_frame_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_get_frame_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedTexture_get_frames #-}

-- | Number of frames to use in the animation. While you can create the frames independently with [method set_frame_texture], you need to set this value for the animation to take new frames into account. The maximum number of frames is [constant MAX_FRAMES].
bindAnimatedTexture_get_frames :: MethodBind
bindAnimatedTexture_get_frames
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "get_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of frames to use in the animation. While you can create the frames independently with [method set_frame_texture], you need to set this value for the animation to take new frames into account. The maximum number of frames is [constant MAX_FRAMES].
get_frames ::
             (AnimatedTexture :< cls, Object :< cls) => cls -> IO Int
get_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_get_frames (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedTexture_set_fps #-}

-- | Animation speed in frames per second. This value defines the default time interval between two frames of the animation, and thus the overall duration of the animation loop based on the [member frames] property. A value of 0 means no predefined number of frames per second, the animation will play according to each frame's frame delay (see [method set_frame_delay]).
--   			For example, an animation with 8 frames, no frame delay and a [code]fps[/code] value of 2 will run for 4 seconds, with each frame lasting 0.5 seconds.
bindAnimatedTexture_set_fps :: MethodBind
bindAnimatedTexture_set_fps
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "set_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animation speed in frames per second. This value defines the default time interval between two frames of the animation, and thus the overall duration of the animation loop based on the [member frames] property. A value of 0 means no predefined number of frames per second, the animation will play according to each frame's frame delay (see [method set_frame_delay]).
--   			For example, an animation with 8 frames, no frame delay and a [code]fps[/code] value of 2 will run for 4 seconds, with each frame lasting 0.5 seconds.
set_fps ::
          (AnimatedTexture :< cls, Object :< cls) => cls -> Float -> IO ()
set_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_set_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedTexture_set_frame_delay #-}

-- | Sets an additional delay (in seconds) between this frame and the next one, that will be added to the time interval defined by [member fps]. By default, frames have no delay defined. If a delay value is defined, the final time interval between this frame and the next will be [code]1.0 / fps + delay[/code].
--   				For example, for an animation with 3 frames, 2 FPS and a frame delay on the second frame of 1.2, the resulting playback will be:
--   				[codeblock]
--   				Frame 0: 0.5 s (1 / fps)
--   				Frame 1: 1.7 s (1 / fps + 1.2)
--   				Frame 2: 0.5 s (1 / fps)
--   				Total duration: 2.7 s
--   				[/codeblock]
bindAnimatedTexture_set_frame_delay :: MethodBind
bindAnimatedTexture_set_frame_delay
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "set_frame_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an additional delay (in seconds) between this frame and the next one, that will be added to the time interval defined by [member fps]. By default, frames have no delay defined. If a delay value is defined, the final time interval between this frame and the next will be [code]1.0 / fps + delay[/code].
--   				For example, for an animation with 3 frames, 2 FPS and a frame delay on the second frame of 1.2, the resulting playback will be:
--   				[codeblock]
--   				Frame 0: 0.5 s (1 / fps)
--   				Frame 1: 1.7 s (1 / fps + 1.2)
--   				Frame 2: 0.5 s (1 / fps)
--   				Total duration: 2.7 s
--   				[/codeblock]
set_frame_delay ::
                  (AnimatedTexture :< cls, Object :< cls) =>
                  cls -> Int -> Float -> IO ()
set_frame_delay cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_set_frame_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedTexture_set_frame_texture #-}

-- | Assigns a [Texture] to the given frame. Frame IDs start at 0, so the first frame has ID 0, and the last frame of the animation has ID [member frames] - 1.
--   				You can define any number of textures up to [constant MAX_FRAMES], but keep in mind that only frames from 0 to [member frames] - 1 will be part of the animation.
bindAnimatedTexture_set_frame_texture :: MethodBind
bindAnimatedTexture_set_frame_texture
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "set_frame_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a [Texture] to the given frame. Frame IDs start at 0, so the first frame has ID 0, and the last frame of the animation has ID [member frames] - 1.
--   				You can define any number of textures up to [constant MAX_FRAMES], but keep in mind that only frames from 0 to [member frames] - 1 will be part of the animation.
set_frame_texture ::
                    (AnimatedTexture :< cls, Object :< cls) =>
                    cls -> Int -> Texture -> IO ()
set_frame_texture cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_set_frame_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedTexture_set_frames #-}

-- | Number of frames to use in the animation. While you can create the frames independently with [method set_frame_texture], you need to set this value for the animation to take new frames into account. The maximum number of frames is [constant MAX_FRAMES].
bindAnimatedTexture_set_frames :: MethodBind
bindAnimatedTexture_set_frames
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "set_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of frames to use in the animation. While you can create the frames independently with [method set_frame_texture], you need to set this value for the animation to take new frames into account. The maximum number of frames is [constant MAX_FRAMES].
set_frames ::
             (AnimatedTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_set_frames (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)