{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationPlayer
       (Godot.Core.AnimationPlayer._ANIMATION_PROCESS_MANUAL,
        Godot.Core.AnimationPlayer._ANIMATION_PROCESS_PHYSICS,
        Godot.Core.AnimationPlayer._ANIMATION_PROCESS_IDLE,
        Godot.Core.AnimationPlayer.sig_caches_cleared,
        Godot.Core.AnimationPlayer.sig_animation_started,
        Godot.Core.AnimationPlayer.sig_animation_changed,
        Godot.Core.AnimationPlayer.sig_animation_finished,
        Godot.Core.AnimationPlayer._node_removed,
        Godot.Core.AnimationPlayer._animation_changed,
        Godot.Core.AnimationPlayer.add_animation,
        Godot.Core.AnimationPlayer.remove_animation,
        Godot.Core.AnimationPlayer.rename_animation,
        Godot.Core.AnimationPlayer.has_animation,
        Godot.Core.AnimationPlayer.get_animation,
        Godot.Core.AnimationPlayer.get_animation_list,
        Godot.Core.AnimationPlayer.animation_set_next,
        Godot.Core.AnimationPlayer.animation_get_next,
        Godot.Core.AnimationPlayer.set_blend_time,
        Godot.Core.AnimationPlayer.get_blend_time,
        Godot.Core.AnimationPlayer.set_default_blend_time,
        Godot.Core.AnimationPlayer.get_default_blend_time,
        Godot.Core.AnimationPlayer.play,
        Godot.Core.AnimationPlayer.play_backwards,
        Godot.Core.AnimationPlayer.stop,
        Godot.Core.AnimationPlayer.is_playing,
        Godot.Core.AnimationPlayer.set_current_animation,
        Godot.Core.AnimationPlayer.get_current_animation,
        Godot.Core.AnimationPlayer.set_assigned_animation,
        Godot.Core.AnimationPlayer.get_assigned_animation,
        Godot.Core.AnimationPlayer.queue,
        Godot.Core.AnimationPlayer.get_queue,
        Godot.Core.AnimationPlayer.clear_queue,
        Godot.Core.AnimationPlayer.set_active,
        Godot.Core.AnimationPlayer.is_active,
        Godot.Core.AnimationPlayer.set_speed_scale,
        Godot.Core.AnimationPlayer.get_speed_scale,
        Godot.Core.AnimationPlayer.get_playing_speed,
        Godot.Core.AnimationPlayer.set_autoplay,
        Godot.Core.AnimationPlayer.get_autoplay,
        Godot.Core.AnimationPlayer.set_root,
        Godot.Core.AnimationPlayer.get_root,
        Godot.Core.AnimationPlayer.find_animation,
        Godot.Core.AnimationPlayer.clear_caches,
        Godot.Core.AnimationPlayer.set_animation_process_mode,
        Godot.Core.AnimationPlayer.get_animation_process_mode,
        Godot.Core.AnimationPlayer.get_current_animation_position,
        Godot.Core.AnimationPlayer.get_current_animation_length,
        Godot.Core.AnimationPlayer.seek,
        Godot.Core.AnimationPlayer.advance)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ANIMATION_PROCESS_MANUAL :: Int
_ANIMATION_PROCESS_MANUAL = 2

_ANIMATION_PROCESS_PHYSICS :: Int
_ANIMATION_PROCESS_PHYSICS = 0

_ANIMATION_PROCESS_IDLE :: Int
_ANIMATION_PROCESS_IDLE = 1

sig_caches_cleared ::
                   Godot.Internal.Dispatch.Signal AnimationPlayer
sig_caches_cleared
  = Godot.Internal.Dispatch.Signal "caches_cleared"

-- | Notifies when an animation starts playing.
sig_animation_started ::
                      Godot.Internal.Dispatch.Signal AnimationPlayer
sig_animation_started
  = Godot.Internal.Dispatch.Signal "animation_started"

-- | If the currently being played animation changes, this signal will notify of such change.
sig_animation_changed ::
                      Godot.Internal.Dispatch.Signal AnimationPlayer
sig_animation_changed
  = Godot.Internal.Dispatch.Signal "animation_changed"

-- | Notifies when an animation finished playing.
sig_animation_finished ::
                       Godot.Internal.Dispatch.Signal AnimationPlayer
sig_animation_finished
  = Godot.Internal.Dispatch.Signal "animation_finished"

{-# NOINLINE bindAnimationPlayer__node_removed #-}

bindAnimationPlayer__node_removed :: MethodBind
bindAnimationPlayer__node_removed
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "_node_removed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_removed ::
                (AnimationPlayer :< cls, Object :< cls) => cls -> Node -> IO ()
_node_removed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer__node_removed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer__animation_changed #-}

bindAnimationPlayer__animation_changed :: MethodBind
bindAnimationPlayer__animation_changed
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "_animation_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_animation_changed ::
                     (AnimationPlayer :< cls, Object :< cls) => cls -> IO ()
_animation_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer__animation_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_add_animation #-}

-- | Adds [code]animation[/code] to the player accessible with the key [code]name[/code].
bindAnimationPlayer_add_animation :: MethodBind
bindAnimationPlayer_add_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "add_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds [code]animation[/code] to the player accessible with the key [code]name[/code].
add_animation ::
                (AnimationPlayer :< cls, Object :< cls) =>
                cls -> GodotString -> Animation -> IO Int
add_animation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_add_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_remove_animation #-}

-- | Remove the animation with key [code]name[/code].
bindAnimationPlayer_remove_animation :: MethodBind
bindAnimationPlayer_remove_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "remove_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove the animation with key [code]name[/code].
remove_animation ::
                   (AnimationPlayer :< cls, Object :< cls) =>
                   cls -> GodotString -> IO ()
remove_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_remove_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_rename_animation #-}

-- | Rename an existing animation with key [code]name[/code] to [code]newname[/code].
bindAnimationPlayer_rename_animation :: MethodBind
bindAnimationPlayer_rename_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "rename_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rename an existing animation with key [code]name[/code] to [code]newname[/code].
rename_animation ::
                   (AnimationPlayer :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO ()
rename_animation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_rename_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_has_animation #-}

-- | Returns [code]true[/code] if the [code]AnimationPlayer[/code] stores an [Animation] with key [code]name[/code].
bindAnimationPlayer_has_animation :: MethodBind
bindAnimationPlayer_has_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "has_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the [code]AnimationPlayer[/code] stores an [Animation] with key [code]name[/code].
has_animation ::
                (AnimationPlayer :< cls, Object :< cls) =>
                cls -> GodotString -> IO Bool
has_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_has_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_animation #-}

-- | Returns the [Animation] with key [code]name[/code] or [code]null[/code] if not found.
bindAnimationPlayer_get_animation :: MethodBind
bindAnimationPlayer_get_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Animation] with key [code]name[/code] or [code]null[/code] if not found.
get_animation ::
                (AnimationPlayer :< cls, Object :< cls) =>
                cls -> GodotString -> IO Animation
get_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_animation_list #-}

-- | Returns the list of stored animation names.
bindAnimationPlayer_get_animation_list :: MethodBind
bindAnimationPlayer_get_animation_list
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_animation_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of stored animation names.
get_animation_list ::
                     (AnimationPlayer :< cls, Object :< cls) =>
                     cls -> IO PoolStringArray
get_animation_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_animation_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_animation_set_next #-}

-- | Triggers the [code]anim_to[/code] animation when the [code]anim_from[/code] animation completes.
bindAnimationPlayer_animation_set_next :: MethodBind
bindAnimationPlayer_animation_set_next
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "animation_set_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Triggers the [code]anim_to[/code] animation when the [code]anim_from[/code] animation completes.
animation_set_next ::
                     (AnimationPlayer :< cls, Object :< cls) =>
                     cls -> GodotString -> GodotString -> IO ()
animation_set_next cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_animation_set_next
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_animation_get_next #-}

-- | Returns the name of the next animation in the queue.
bindAnimationPlayer_animation_get_next :: MethodBind
bindAnimationPlayer_animation_get_next
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "animation_get_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the next animation in the queue.
animation_get_next ::
                     (AnimationPlayer :< cls, Object :< cls) =>
                     cls -> GodotString -> IO GodotString
animation_get_next cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_animation_get_next
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_blend_time #-}

-- | Specify a blend time (in seconds) between two animations, referenced by their names.
bindAnimationPlayer_set_blend_time :: MethodBind
bindAnimationPlayer_set_blend_time
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_blend_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specify a blend time (in seconds) between two animations, referenced by their names.
set_blend_time ::
                 (AnimationPlayer :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> Float -> IO ()
set_blend_time cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_blend_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_blend_time #-}

-- | Get the blend time (in seconds) between two animations, referenced by their names.
bindAnimationPlayer_get_blend_time :: MethodBind
bindAnimationPlayer_get_blend_time
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_blend_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the blend time (in seconds) between two animations, referenced by their names.
get_blend_time ::
                 (AnimationPlayer :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> IO Float
get_blend_time cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_blend_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_default_blend_time #-}

-- | The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision. Default value: [code]0[/code].
bindAnimationPlayer_set_default_blend_time :: MethodBind
bindAnimationPlayer_set_default_blend_time
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_default_blend_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision. Default value: [code]0[/code].
set_default_blend_time ::
                         (AnimationPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_default_blend_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_default_blend_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_default_blend_time #-}

-- | The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision. Default value: [code]0[/code].
bindAnimationPlayer_get_default_blend_time :: MethodBind
bindAnimationPlayer_get_default_blend_time
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_default_blend_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision. Default value: [code]0[/code].
get_default_blend_time ::
                         (AnimationPlayer :< cls, Object :< cls) => cls -> IO Float
get_default_blend_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_default_blend_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_play #-}

-- | Play the animation with key [code]name[/code]. Custom speed and blend times can be set. If custom speed is negative (-1), 'from_end' being true can play the animation backwards.
--   				If the animation has been paused by [code]stop(true)[/code] it will be resumed. Calling [code]play()[/code] without arguments will also resume the animation.
bindAnimationPlayer_play :: MethodBind
bindAnimationPlayer_play
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Play the animation with key [code]name[/code]. Custom speed and blend times can be set. If custom speed is negative (-1), 'from_end' being true can play the animation backwards.
--   				If the animation has been paused by [code]stop(true)[/code] it will be resumed. Calling [code]play()[/code] without arguments will also resume the animation.
play ::
       (AnimationPlayer :< cls, Object :< cls) =>
       cls -> GodotString -> Float -> Float -> Bool -> IO ()
play cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_play (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_play_backwards #-}

-- | Play the animation with key [code]name[/code] in reverse.
--   				If the animation has been paused by [code]stop(true)[/code] it will be resumed backwards. Calling [code]play_backwards()[/code] without arguments will also resume the animation backwards.
bindAnimationPlayer_play_backwards :: MethodBind
bindAnimationPlayer_play_backwards
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "play_backwards" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Play the animation with key [code]name[/code] in reverse.
--   				If the animation has been paused by [code]stop(true)[/code] it will be resumed backwards. Calling [code]play_backwards()[/code] without arguments will also resume the animation backwards.
play_backwards ::
                 (AnimationPlayer :< cls, Object :< cls) =>
                 cls -> GodotString -> Float -> IO ()
play_backwards cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_play_backwards
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_stop #-}

-- | Stop the currently playing animation. If [code]reset[/code] is [code]true[/code], the animation position is reset to [code]0[/code] and the playback speed is reset to [code]1.0[/code].
--   				If [code]reset[/code] is [code]false[/code], then calling [code]play()[/code] without arguments or [code]play("same_as_before")[/code] will resume the animation. Works the same for the [code]play_backwards()[/code] method.
bindAnimationPlayer_stop :: MethodBind
bindAnimationPlayer_stop
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stop the currently playing animation. If [code]reset[/code] is [code]true[/code], the animation position is reset to [code]0[/code] and the playback speed is reset to [code]1.0[/code].
--   				If [code]reset[/code] is [code]false[/code], then calling [code]play()[/code] without arguments or [code]play("same_as_before")[/code] will resume the animation. Works the same for the [code]play_backwards()[/code] method.
stop ::
       (AnimationPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
stop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_stop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_is_playing #-}

-- | Returns [code]true[/code] if playing an animation.
bindAnimationPlayer_is_playing :: MethodBind
bindAnimationPlayer_is_playing
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if playing an animation.
is_playing ::
             (AnimationPlayer :< cls, Object :< cls) => cls -> IO Bool
is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_is_playing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_current_animation #-}

-- | The name of the current animation, "" if not playing anything. When being set, does not restart the animation. See also [method play]. Default value: [code]""[/code].
bindAnimationPlayer_set_current_animation :: MethodBind
bindAnimationPlayer_set_current_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_current_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the current animation, "" if not playing anything. When being set, does not restart the animation. See also [method play]. Default value: [code]""[/code].
set_current_animation ::
                        (AnimationPlayer :< cls, Object :< cls) =>
                        cls -> GodotString -> IO ()
set_current_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_current_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_current_animation #-}

-- | The name of the current animation, "" if not playing anything. When being set, does not restart the animation. See also [method play]. Default value: [code]""[/code].
bindAnimationPlayer_get_current_animation :: MethodBind
bindAnimationPlayer_get_current_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_current_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the current animation, "" if not playing anything. When being set, does not restart the animation. See also [method play]. Default value: [code]""[/code].
get_current_animation ::
                        (AnimationPlayer :< cls, Object :< cls) => cls -> IO GodotString
get_current_animation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_current_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_assigned_animation #-}

-- | If playing, the current animation; otherwise, the animation last played. When set, would change the animation, but would not play it unless currently playing. See also [member current_animation].
bindAnimationPlayer_set_assigned_animation :: MethodBind
bindAnimationPlayer_set_assigned_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_assigned_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If playing, the current animation; otherwise, the animation last played. When set, would change the animation, but would not play it unless currently playing. See also [member current_animation].
set_assigned_animation ::
                         (AnimationPlayer :< cls, Object :< cls) =>
                         cls -> GodotString -> IO ()
set_assigned_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_assigned_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_assigned_animation #-}

-- | If playing, the current animation; otherwise, the animation last played. When set, would change the animation, but would not play it unless currently playing. See also [member current_animation].
bindAnimationPlayer_get_assigned_animation :: MethodBind
bindAnimationPlayer_get_assigned_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_assigned_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If playing, the current animation; otherwise, the animation last played. When set, would change the animation, but would not play it unless currently playing. See also [member current_animation].
get_assigned_animation ::
                         (AnimationPlayer :< cls, Object :< cls) => cls -> IO GodotString
get_assigned_animation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_assigned_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_queue #-}

-- | Queue an animation for playback once the current one is done.
bindAnimationPlayer_queue :: MethodBind
bindAnimationPlayer_queue
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "queue" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queue an animation for playback once the current one is done.
queue ::
        (AnimationPlayer :< cls, Object :< cls) =>
        cls -> GodotString -> IO ()
queue cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_queue (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_queue #-}

bindAnimationPlayer_get_queue :: MethodBind
bindAnimationPlayer_get_queue
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_queue" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_queue ::
            (AnimationPlayer :< cls, Object :< cls) =>
            cls -> IO PoolStringArray
get_queue cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_queue (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_clear_queue #-}

-- | Clears all queued, unplayed animations.
bindAnimationPlayer_clear_queue :: MethodBind
bindAnimationPlayer_clear_queue
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "clear_queue" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears all queued, unplayed animations.
clear_queue ::
              (AnimationPlayer :< cls, Object :< cls) => cls -> IO ()
clear_queue cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_clear_queue (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_active #-}

-- | If [code]true[/code], updates animations in response to process-related notifications. Default value: [code]true[/code].
bindAnimationPlayer_set_active :: MethodBind
bindAnimationPlayer_set_active
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], updates animations in response to process-related notifications. Default value: [code]true[/code].
set_active ::
             (AnimationPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_is_active #-}

-- | If [code]true[/code], updates animations in response to process-related notifications. Default value: [code]true[/code].
bindAnimationPlayer_is_active :: MethodBind
bindAnimationPlayer_is_active
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], updates animations in response to process-related notifications. Default value: [code]true[/code].
is_active ::
            (AnimationPlayer :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_is_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_speed_scale #-}

-- | The speed scaling ratio. For instance, if this value is 1 then the animation plays at normal speed. If it's 0.5 then it plays at half speed. If it's 2 then it plays at double speed. Default value: [code]1[/code].
bindAnimationPlayer_set_speed_scale :: MethodBind
bindAnimationPlayer_set_speed_scale
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed scaling ratio. For instance, if this value is 1 then the animation plays at normal speed. If it's 0.5 then it plays at half speed. If it's 2 then it plays at double speed. Default value: [code]1[/code].
set_speed_scale ::
                  (AnimationPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_speed_scale #-}

-- | The speed scaling ratio. For instance, if this value is 1 then the animation plays at normal speed. If it's 0.5 then it plays at half speed. If it's 2 then it plays at double speed. Default value: [code]1[/code].
bindAnimationPlayer_get_speed_scale :: MethodBind
bindAnimationPlayer_get_speed_scale
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed scaling ratio. For instance, if this value is 1 then the animation plays at normal speed. If it's 0.5 then it plays at half speed. If it's 2 then it plays at double speed. Default value: [code]1[/code].
get_speed_scale ::
                  (AnimationPlayer :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_playing_speed #-}

-- | Get the actual playing speed of current animation or 0 if not playing. This speed is the [code]playback_speed[/code] property multiplied by [code]custom_speed[/code] argument specified when calling the [code]play[/code] method.
bindAnimationPlayer_get_playing_speed :: MethodBind
bindAnimationPlayer_get_playing_speed
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_playing_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the actual playing speed of current animation or 0 if not playing. This speed is the [code]playback_speed[/code] property multiplied by [code]custom_speed[/code] argument specified when calling the [code]play[/code] method.
get_playing_speed ::
                    (AnimationPlayer :< cls, Object :< cls) => cls -> IO Float
get_playing_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_playing_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_autoplay #-}

-- | The name of the animation to play when the scene loads. Default value: [code]""[/code].
bindAnimationPlayer_set_autoplay :: MethodBind
bindAnimationPlayer_set_autoplay
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the animation to play when the scene loads. Default value: [code]""[/code].
set_autoplay ::
               (AnimationPlayer :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_autoplay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_autoplay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_autoplay #-}

-- | The name of the animation to play when the scene loads. Default value: [code]""[/code].
bindAnimationPlayer_get_autoplay :: MethodBind
bindAnimationPlayer_get_autoplay
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the animation to play when the scene loads. Default value: [code]""[/code].
get_autoplay ::
               (AnimationPlayer :< cls, Object :< cls) => cls -> IO GodotString
get_autoplay cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_autoplay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_root #-}

-- | The node from which node path references will travel. Default value: [code]".."[/code].
bindAnimationPlayer_set_root :: MethodBind
bindAnimationPlayer_set_root
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node from which node path references will travel. Default value: [code]".."[/code].
set_root ::
           (AnimationPlayer :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_root cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_root (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_root #-}

-- | The node from which node path references will travel. Default value: [code]".."[/code].
bindAnimationPlayer_get_root :: MethodBind
bindAnimationPlayer_get_root
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node from which node path references will travel. Default value: [code]".."[/code].
get_root ::
           (AnimationPlayer :< cls, Object :< cls) => cls -> IO NodePath
get_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_root (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_find_animation #-}

-- | Returns the name of [code]animation[/code] or empty string if not found.
bindAnimationPlayer_find_animation :: MethodBind
bindAnimationPlayer_find_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "find_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of [code]animation[/code] or empty string if not found.
find_animation ::
                 (AnimationPlayer :< cls, Object :< cls) =>
                 cls -> Animation -> IO GodotString
find_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_find_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_clear_caches #-}

-- | [code]AnimationPlayer[/code] caches animated nodes. It may not notice if a node disappears, so clear_caches forces it to update the cache again.
bindAnimationPlayer_clear_caches :: MethodBind
bindAnimationPlayer_clear_caches
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "clear_caches" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [code]AnimationPlayer[/code] caches animated nodes. It may not notice if a node disappears, so clear_caches forces it to update the cache again.
clear_caches ::
               (AnimationPlayer :< cls, Object :< cls) => cls -> IO ()
clear_caches cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_clear_caches
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_animation_process_mode #-}

-- | The process notification in which to update animations. Default value: [code]ANIMATION_PROCESS_IDLE[/code].
bindAnimationPlayer_set_animation_process_mode :: MethodBind
bindAnimationPlayer_set_animation_process_mode
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_animation_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The process notification in which to update animations. Default value: [code]ANIMATION_PROCESS_IDLE[/code].
set_animation_process_mode ::
                             (AnimationPlayer :< cls, Object :< cls) => cls -> Int -> IO ()
set_animation_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationPlayer_set_animation_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_animation_process_mode #-}

-- | The process notification in which to update animations. Default value: [code]ANIMATION_PROCESS_IDLE[/code].
bindAnimationPlayer_get_animation_process_mode :: MethodBind
bindAnimationPlayer_get_animation_process_mode
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_animation_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The process notification in which to update animations. Default value: [code]ANIMATION_PROCESS_IDLE[/code].
get_animation_process_mode ::
                             (AnimationPlayer :< cls, Object :< cls) => cls -> IO Int
get_animation_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationPlayer_get_animation_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_current_animation_position #-}

-- | The position (in seconds) of the currently playing animation.
bindAnimationPlayer_get_current_animation_position :: MethodBind
bindAnimationPlayer_get_current_animation_position
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_current_animation_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The position (in seconds) of the currently playing animation.
get_current_animation_position ::
                                 (AnimationPlayer :< cls, Object :< cls) => cls -> IO Float
get_current_animation_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationPlayer_get_current_animation_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_current_animation_length #-}

-- | The length (in seconds) of the currently being played animation.
bindAnimationPlayer_get_current_animation_length :: MethodBind
bindAnimationPlayer_get_current_animation_length
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_current_animation_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The length (in seconds) of the currently being played animation.
get_current_animation_length ::
                               (AnimationPlayer :< cls, Object :< cls) => cls -> IO Float
get_current_animation_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationPlayer_get_current_animation_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_seek #-}

-- | Seek the animation to the [code]seconds[/code] point in time (in seconds). If [code]update[/code] is [code]true[/code], the animation updates too, otherwise it updates at process time. Events between the current frame and [code]seconds[/code] are skipped.
bindAnimationPlayer_seek :: MethodBind
bindAnimationPlayer_seek
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Seek the animation to the [code]seconds[/code] point in time (in seconds). If [code]update[/code] is [code]true[/code], the animation updates too, otherwise it updates at process time. Events between the current frame and [code]seconds[/code] are skipped.
seek ::
       (AnimationPlayer :< cls, Object :< cls) =>
       cls -> Float -> Bool -> IO ()
seek cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_seek (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_advance #-}

-- | Shifts position in the animation timeline. Delta is the time in seconds to shift. Events between the current frame and [code]delta[/code] are handled.
bindAnimationPlayer_advance :: MethodBind
bindAnimationPlayer_advance
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shifts position in the animation timeline. Delta is the time in seconds to shift. Events between the current frame and [code]delta[/code] are handled.
advance ::
          (AnimationPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_advance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)