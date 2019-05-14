{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimatedSprite3D
       (Godot.Core.AnimatedSprite3D.sig_frame_changed,
        Godot.Core.AnimatedSprite3D.set_sprite_frames,
        Godot.Core.AnimatedSprite3D.get_sprite_frames,
        Godot.Core.AnimatedSprite3D.set_animation,
        Godot.Core.AnimatedSprite3D.get_animation,
        Godot.Core.AnimatedSprite3D._set_playing,
        Godot.Core.AnimatedSprite3D._is_playing,
        Godot.Core.AnimatedSprite3D.play, Godot.Core.AnimatedSprite3D.stop,
        Godot.Core.AnimatedSprite3D.is_playing,
        Godot.Core.AnimatedSprite3D.set_frame,
        Godot.Core.AnimatedSprite3D.get_frame,
        Godot.Core.AnimatedSprite3D._res_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when [member frame] changed.
sig_frame_changed ::
                  Godot.Internal.Dispatch.Signal AnimatedSprite3D
sig_frame_changed = Godot.Internal.Dispatch.Signal "frame_changed"

{-# NOINLINE bindAnimatedSprite3D_set_sprite_frames #-}

-- | The [SpriteFrames] resource containing the animation(s).
bindAnimatedSprite3D_set_sprite_frames :: MethodBind
bindAnimatedSprite3D_set_sprite_frames
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "set_sprite_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [SpriteFrames] resource containing the animation(s).
set_sprite_frames ::
                    (AnimatedSprite3D :< cls, Object :< cls) =>
                    cls -> SpriteFrames -> IO ()
set_sprite_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_set_sprite_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D_get_sprite_frames #-}

-- | The [SpriteFrames] resource containing the animation(s).
bindAnimatedSprite3D_get_sprite_frames :: MethodBind
bindAnimatedSprite3D_get_sprite_frames
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "get_sprite_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [SpriteFrames] resource containing the animation(s).
get_sprite_frames ::
                    (AnimatedSprite3D :< cls, Object :< cls) => cls -> IO SpriteFrames
get_sprite_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_get_sprite_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D_set_animation #-}

-- | The current animation from the [code]frames[/code] resource. If this value changes, the [code]frame[/code] counter is reset.
bindAnimatedSprite3D_set_animation :: MethodBind
bindAnimatedSprite3D_set_animation
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "set_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current animation from the [code]frames[/code] resource. If this value changes, the [code]frame[/code] counter is reset.
set_animation ::
                (AnimatedSprite3D :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_set_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D_get_animation #-}

-- | The current animation from the [code]frames[/code] resource. If this value changes, the [code]frame[/code] counter is reset.
bindAnimatedSprite3D_get_animation :: MethodBind
bindAnimatedSprite3D_get_animation
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "get_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current animation from the [code]frames[/code] resource. If this value changes, the [code]frame[/code] counter is reset.
get_animation ::
                (AnimatedSprite3D :< cls, Object :< cls) => cls -> IO GodotString
get_animation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_get_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D__set_playing #-}

-- | If [code]true[/code], the [member animation] is currently playing.
bindAnimatedSprite3D__set_playing :: MethodBind
bindAnimatedSprite3D__set_playing
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "_set_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [member animation] is currently playing.
_set_playing ::
               (AnimatedSprite3D :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_playing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D__set_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D__is_playing #-}

-- | If [code]true[/code], the [member animation] is currently playing.
bindAnimatedSprite3D__is_playing :: MethodBind
bindAnimatedSprite3D__is_playing
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "_is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [member animation] is currently playing.
_is_playing ::
              (AnimatedSprite3D :< cls, Object :< cls) => cls -> IO Bool
_is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D__is_playing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D_play #-}

-- | Play the animation set in parameter. If no parameter is provided, the current animation is played.
bindAnimatedSprite3D_play :: MethodBind
bindAnimatedSprite3D_play
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Play the animation set in parameter. If no parameter is provided, the current animation is played.
play ::
       (AnimatedSprite3D :< cls, Object :< cls) =>
       cls -> GodotString -> IO ()
play cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_play (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D_stop #-}

-- | Stop the current animation (does not reset the frame counter).
bindAnimatedSprite3D_stop :: MethodBind
bindAnimatedSprite3D_stop
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stop the current animation (does not reset the frame counter).
stop :: (AnimatedSprite3D :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_stop (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D_is_playing #-}

-- | Return true if an animation if currently being played.
bindAnimatedSprite3D_is_playing :: MethodBind
bindAnimatedSprite3D_is_playing
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return true if an animation if currently being played.
is_playing ::
             (AnimatedSprite3D :< cls, Object :< cls) => cls -> IO Bool
is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_is_playing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D_set_frame #-}

-- | The displayed animation frame's index.
bindAnimatedSprite3D_set_frame :: MethodBind
bindAnimatedSprite3D_set_frame
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "set_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The displayed animation frame's index.
set_frame ::
            (AnimatedSprite3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_frame cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_set_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D_get_frame #-}

-- | The displayed animation frame's index.
bindAnimatedSprite3D_get_frame :: MethodBind
bindAnimatedSprite3D_get_frame
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The displayed animation frame's index.
get_frame ::
            (AnimatedSprite3D :< cls, Object :< cls) => cls -> IO Int
get_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D_get_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimatedSprite3D__res_changed #-}

bindAnimatedSprite3D__res_changed :: MethodBind
bindAnimatedSprite3D__res_changed
  = unsafePerformIO $
      withCString "AnimatedSprite3D" $
        \ clsNamePtr ->
          withCString "_res_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_res_changed ::
               (AnimatedSprite3D :< cls, Object :< cls) => cls -> IO ()
_res_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite3D__res_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)