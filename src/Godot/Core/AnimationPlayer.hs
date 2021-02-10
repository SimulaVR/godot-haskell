{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationPlayer
       (Godot.Core.AnimationPlayer._ANIMATION_METHOD_CALL_IMMEDIATE,
        Godot.Core.AnimationPlayer._ANIMATION_METHOD_CALL_DEFERRED,
        Godot.Core.AnimationPlayer._ANIMATION_PROCESS_MANUAL,
        Godot.Core.AnimationPlayer._ANIMATION_PROCESS_PHYSICS,
        Godot.Core.AnimationPlayer._ANIMATION_PROCESS_IDLE,
        Godot.Core.AnimationPlayer.sig_animation_changed,
        Godot.Core.AnimationPlayer.sig_animation_finished,
        Godot.Core.AnimationPlayer.sig_animation_started,
        Godot.Core.AnimationPlayer.sig_caches_cleared,
        Godot.Core.AnimationPlayer._animation_changed,
        Godot.Core.AnimationPlayer._node_removed,
        Godot.Core.AnimationPlayer.add_animation,
        Godot.Core.AnimationPlayer.advance,
        Godot.Core.AnimationPlayer.animation_get_next,
        Godot.Core.AnimationPlayer.animation_set_next,
        Godot.Core.AnimationPlayer.clear_caches,
        Godot.Core.AnimationPlayer.clear_queue,
        Godot.Core.AnimationPlayer.find_animation,
        Godot.Core.AnimationPlayer.get_animation,
        Godot.Core.AnimationPlayer.get_animation_list,
        Godot.Core.AnimationPlayer.get_animation_process_mode,
        Godot.Core.AnimationPlayer.get_assigned_animation,
        Godot.Core.AnimationPlayer.get_autoplay,
        Godot.Core.AnimationPlayer.get_blend_time,
        Godot.Core.AnimationPlayer.get_current_animation,
        Godot.Core.AnimationPlayer.get_current_animation_length,
        Godot.Core.AnimationPlayer.get_current_animation_position,
        Godot.Core.AnimationPlayer.get_default_blend_time,
        Godot.Core.AnimationPlayer.get_method_call_mode,
        Godot.Core.AnimationPlayer.get_playing_speed,
        Godot.Core.AnimationPlayer.get_queue,
        Godot.Core.AnimationPlayer.get_root,
        Godot.Core.AnimationPlayer.get_speed_scale,
        Godot.Core.AnimationPlayer.has_animation,
        Godot.Core.AnimationPlayer.is_active,
        Godot.Core.AnimationPlayer.is_playing,
        Godot.Core.AnimationPlayer.play,
        Godot.Core.AnimationPlayer.play_backwards,
        Godot.Core.AnimationPlayer.queue,
        Godot.Core.AnimationPlayer.remove_animation,
        Godot.Core.AnimationPlayer.rename_animation,
        Godot.Core.AnimationPlayer.seek,
        Godot.Core.AnimationPlayer.set_active,
        Godot.Core.AnimationPlayer.set_animation_process_mode,
        Godot.Core.AnimationPlayer.set_assigned_animation,
        Godot.Core.AnimationPlayer.set_autoplay,
        Godot.Core.AnimationPlayer.set_blend_time,
        Godot.Core.AnimationPlayer.set_current_animation,
        Godot.Core.AnimationPlayer.set_default_blend_time,
        Godot.Core.AnimationPlayer.set_method_call_mode,
        Godot.Core.AnimationPlayer.set_root,
        Godot.Core.AnimationPlayer.set_speed_scale,
        Godot.Core.AnimationPlayer.stop)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ANIMATION_METHOD_CALL_IMMEDIATE :: Int
_ANIMATION_METHOD_CALL_IMMEDIATE = 1

_ANIMATION_METHOD_CALL_DEFERRED :: Int
_ANIMATION_METHOD_CALL_DEFERRED = 0

_ANIMATION_PROCESS_MANUAL :: Int
_ANIMATION_PROCESS_MANUAL = 2

_ANIMATION_PROCESS_PHYSICS :: Int
_ANIMATION_PROCESS_PHYSICS = 0

_ANIMATION_PROCESS_IDLE :: Int
_ANIMATION_PROCESS_IDLE = 1

-- | If the currently being played animation changes, this signal will notify of such change.
sig_animation_changed ::
                      Godot.Internal.Dispatch.Signal AnimationPlayer
sig_animation_changed
  = Godot.Internal.Dispatch.Signal "animation_changed"

instance NodeSignal AnimationPlayer "animation_changed"
           '[GodotString, GodotString]

-- | Notifies when an animation finished playing.
sig_animation_finished ::
                       Godot.Internal.Dispatch.Signal AnimationPlayer
sig_animation_finished
  = Godot.Internal.Dispatch.Signal "animation_finished"

instance NodeSignal AnimationPlayer "animation_finished"
           '[GodotString]

-- | Notifies when an animation starts playing.
sig_animation_started ::
                      Godot.Internal.Dispatch.Signal AnimationPlayer
sig_animation_started
  = Godot.Internal.Dispatch.Signal "animation_started"

instance NodeSignal AnimationPlayer "animation_started"
           '[GodotString]

-- | Notifies when the caches have been cleared, either automatically, or manually via [method clear_caches].
sig_caches_cleared ::
                   Godot.Internal.Dispatch.Signal AnimationPlayer
sig_caches_cleared
  = Godot.Internal.Dispatch.Signal "caches_cleared"

instance NodeSignal AnimationPlayer "caches_cleared" '[]

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

{-# NOINLINE bindAnimationPlayer_advance #-}

-- | Shifts position in the animation timeline and immediately updates the animation. [code]delta[/code] is the time in seconds to shift. Events between the current frame and [code]delta[/code] are handled.
bindAnimationPlayer_advance :: MethodBind
bindAnimationPlayer_advance
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shifts position in the animation timeline and immediately updates the animation. [code]delta[/code] is the time in seconds to shift. Events between the current frame and [code]delta[/code] are handled.
advance ::
          (AnimationPlayer :< cls, Object :< cls) => cls -> Float -> IO ()
advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_advance (upcast cls)
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

{-# NOINLINE bindAnimationPlayer_clear_caches #-}

-- | [AnimationPlayer] caches animated nodes. It may not notice if a node disappears; [method clear_caches] forces it to update the cache again.
bindAnimationPlayer_clear_caches :: MethodBind
bindAnimationPlayer_clear_caches
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "clear_caches" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [AnimationPlayer] caches animated nodes. It may not notice if a node disappears; [method clear_caches] forces it to update the cache again.
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

{-# NOINLINE bindAnimationPlayer_find_animation #-}

-- | Returns the name of [code]animation[/code] or an empty string if not found.
bindAnimationPlayer_find_animation :: MethodBind
bindAnimationPlayer_find_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "find_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of [code]animation[/code] or an empty string if not found.
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

{-# NOINLINE bindAnimationPlayer_get_animation_process_mode #-}

-- | The process notification in which to update animations.
bindAnimationPlayer_get_animation_process_mode :: MethodBind
bindAnimationPlayer_get_animation_process_mode
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_animation_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The process notification in which to update animations.
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

{-# NOINLINE bindAnimationPlayer_get_autoplay #-}

-- | The name of the animation to play when the scene loads.
bindAnimationPlayer_get_autoplay :: MethodBind
bindAnimationPlayer_get_autoplay
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the animation to play when the scene loads.
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

{-# NOINLINE bindAnimationPlayer_get_blend_time #-}

-- | Gets the blend time (in seconds) between two animations, referenced by their names.
bindAnimationPlayer_get_blend_time :: MethodBind
bindAnimationPlayer_get_blend_time
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_blend_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the blend time (in seconds) between two animations, referenced by their names.
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

{-# NOINLINE bindAnimationPlayer_get_current_animation #-}

-- | The name of the currently playing animation. If no animation is playing, the property's value is an empty string. Changing this value does not restart the animation. See [method play] for more information on playing animations.
--   			[b]Note[/b]: while this property appears in the inspector, it's not meant to be edited and it's not saved in the scene. This property is mainly used to get the currently playing animation, and internally for animation playback tracks. For more information, see [Animation].
bindAnimationPlayer_get_current_animation :: MethodBind
bindAnimationPlayer_get_current_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_current_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the currently playing animation. If no animation is playing, the property's value is an empty string. Changing this value does not restart the animation. See [method play] for more information on playing animations.
--   			[b]Note[/b]: while this property appears in the inspector, it's not meant to be edited and it's not saved in the scene. This property is mainly used to get the currently playing animation, and internally for animation playback tracks. For more information, see [Animation].
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

{-# NOINLINE bindAnimationPlayer_get_default_blend_time #-}

-- | The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision.
bindAnimationPlayer_get_default_blend_time :: MethodBind
bindAnimationPlayer_get_default_blend_time
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_default_blend_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision.
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

{-# NOINLINE bindAnimationPlayer_get_method_call_mode #-}

-- | The call mode to use for Call Method tracks.
bindAnimationPlayer_get_method_call_mode :: MethodBind
bindAnimationPlayer_get_method_call_mode
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_method_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The call mode to use for Call Method tracks.
get_method_call_mode ::
                       (AnimationPlayer :< cls, Object :< cls) => cls -> IO Int
get_method_call_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_method_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_playing_speed #-}

-- | Gets the actual playing speed of current animation or 0 if not playing. This speed is the [member playback_speed] property multiplied by [code]custom_speed[/code] argument specified when calling the [method play] method.
bindAnimationPlayer_get_playing_speed :: MethodBind
bindAnimationPlayer_get_playing_speed
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_playing_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the actual playing speed of current animation or 0 if not playing. This speed is the [member playback_speed] property multiplied by [code]custom_speed[/code] argument specified when calling the [method play] method.
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

{-# NOINLINE bindAnimationPlayer_get_queue #-}

-- | Returns a list of the animation names that are currently queued to play.
bindAnimationPlayer_get_queue :: MethodBind
bindAnimationPlayer_get_queue
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_queue" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the animation names that are currently queued to play.
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

{-# NOINLINE bindAnimationPlayer_get_root #-}

-- | The node from which node path references will travel.
bindAnimationPlayer_get_root :: MethodBind
bindAnimationPlayer_get_root
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node from which node path references will travel.
get_root ::
           (AnimationPlayer :< cls, Object :< cls) => cls -> IO NodePath
get_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_get_root (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_get_speed_scale #-}

-- | The speed scaling ratio. For instance, if this value is 1, then the animation plays at normal speed. If it's 0.5, then it plays at half speed. If it's 2, then it plays at double speed.
bindAnimationPlayer_get_speed_scale :: MethodBind
bindAnimationPlayer_get_speed_scale
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed scaling ratio. For instance, if this value is 1, then the animation plays at normal speed. If it's 0.5, then it plays at half speed. If it's 2, then it plays at double speed.
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

{-# NOINLINE bindAnimationPlayer_has_animation #-}

-- | Returns [code]true[/code] if the [AnimationPlayer] stores an [Animation] with key [code]name[/code].
bindAnimationPlayer_has_animation :: MethodBind
bindAnimationPlayer_has_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "has_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the [AnimationPlayer] stores an [Animation] with key [code]name[/code].
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

{-# NOINLINE bindAnimationPlayer_is_active #-}

-- | If [code]true[/code], updates animations in response to process-related notifications.
bindAnimationPlayer_is_active :: MethodBind
bindAnimationPlayer_is_active
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], updates animations in response to process-related notifications.
is_active ::
            (AnimationPlayer :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_is_active (upcast cls)
           arrPtr
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

{-# NOINLINE bindAnimationPlayer_play #-}

-- | Plays the animation with key [code]name[/code]. Custom blend times and speed can be set. If [code]custom_speed[/code] is negative and [code]from_end[/code] is [code]true[/code], the animation will play backwards (which is equivalent to calling [method play_backwards]).
--   				The [AnimationPlayer] keeps track of its current or last played animation with [member assigned_animation]. If this method is called with that same animation [code]name[/code], or with no [code]name[/code] parameter, the assigned animation will resume playing if it was paused, or restart if it was stopped (see [method stop] for both pause and stop). If the animation was already playing, it will keep playing.
--   				[b]Note:[/b] The animation will be updated the next time the [AnimationPlayer] is processed. If other variables are updated at the same time this is called, they may be updated too early. To perform the update immediately, call [code]advance(0)[/code].
bindAnimationPlayer_play :: MethodBind
bindAnimationPlayer_play
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Plays the animation with key [code]name[/code]. Custom blend times and speed can be set. If [code]custom_speed[/code] is negative and [code]from_end[/code] is [code]true[/code], the animation will play backwards (which is equivalent to calling [method play_backwards]).
--   				The [AnimationPlayer] keeps track of its current or last played animation with [member assigned_animation]. If this method is called with that same animation [code]name[/code], or with no [code]name[/code] parameter, the assigned animation will resume playing if it was paused, or restart if it was stopped (see [method stop] for both pause and stop). If the animation was already playing, it will keep playing.
--   				[b]Note:[/b] The animation will be updated the next time the [AnimationPlayer] is processed. If other variables are updated at the same time this is called, they may be updated too early. To perform the update immediately, call [code]advance(0)[/code].
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

-- | Plays the animation with key [code]name[/code] in reverse.
--   				This method is a shorthand for [method play] with [code]custom_speed = -1.0[/code] and [code]from_end = true[/code], so see its description for more information.
bindAnimationPlayer_play_backwards :: MethodBind
bindAnimationPlayer_play_backwards
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "play_backwards" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Plays the animation with key [code]name[/code] in reverse.
--   				This method is a shorthand for [method play] with [code]custom_speed = -1.0[/code] and [code]from_end = true[/code], so see its description for more information.
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

{-# NOINLINE bindAnimationPlayer_queue #-}

-- | Queues an animation for playback once the current one is done.
--   				[b]Note:[/b] If a looped animation is currently playing, the queued animation will never play unless the looped animation is stopped somehow.
bindAnimationPlayer_queue :: MethodBind
bindAnimationPlayer_queue
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "queue" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queues an animation for playback once the current one is done.
--   				[b]Note:[/b] If a looped animation is currently playing, the queued animation will never play unless the looped animation is stopped somehow.
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

{-# NOINLINE bindAnimationPlayer_remove_animation #-}

-- | Removes the animation with key [code]name[/code].
bindAnimationPlayer_remove_animation :: MethodBind
bindAnimationPlayer_remove_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "remove_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the animation with key [code]name[/code].
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

-- | Renames an existing animation with key [code]name[/code] to [code]newname[/code].
bindAnimationPlayer_rename_animation :: MethodBind
bindAnimationPlayer_rename_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "rename_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames an existing animation with key [code]name[/code] to [code]newname[/code].
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

{-# NOINLINE bindAnimationPlayer_seek #-}

-- | Seeks the animation to the [code]seconds[/code] point in time (in seconds). If [code]update[/code] is [code]true[/code], the animation updates too, otherwise it updates at process time. Events between the current frame and [code]seconds[/code] are skipped.
bindAnimationPlayer_seek :: MethodBind
bindAnimationPlayer_seek
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Seeks the animation to the [code]seconds[/code] point in time (in seconds). If [code]update[/code] is [code]true[/code], the animation updates too, otherwise it updates at process time. Events between the current frame and [code]seconds[/code] are skipped.
seek ::
       (AnimationPlayer :< cls, Object :< cls) =>
       cls -> Float -> Bool -> IO ()
seek cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_seek (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_active #-}

-- | If [code]true[/code], updates animations in response to process-related notifications.
bindAnimationPlayer_set_active :: MethodBind
bindAnimationPlayer_set_active
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], updates animations in response to process-related notifications.
set_active ::
             (AnimationPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_animation_process_mode #-}

-- | The process notification in which to update animations.
bindAnimationPlayer_set_animation_process_mode :: MethodBind
bindAnimationPlayer_set_animation_process_mode
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_animation_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The process notification in which to update animations.
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

{-# NOINLINE bindAnimationPlayer_set_autoplay #-}

-- | The name of the animation to play when the scene loads.
bindAnimationPlayer_set_autoplay :: MethodBind
bindAnimationPlayer_set_autoplay
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_autoplay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the animation to play when the scene loads.
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

{-# NOINLINE bindAnimationPlayer_set_blend_time #-}

-- | Specifies a blend time (in seconds) between two animations, referenced by their names.
bindAnimationPlayer_set_blend_time :: MethodBind
bindAnimationPlayer_set_blend_time
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_blend_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a blend time (in seconds) between two animations, referenced by their names.
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

{-# NOINLINE bindAnimationPlayer_set_current_animation #-}

-- | The name of the currently playing animation. If no animation is playing, the property's value is an empty string. Changing this value does not restart the animation. See [method play] for more information on playing animations.
--   			[b]Note[/b]: while this property appears in the inspector, it's not meant to be edited and it's not saved in the scene. This property is mainly used to get the currently playing animation, and internally for animation playback tracks. For more information, see [Animation].
bindAnimationPlayer_set_current_animation :: MethodBind
bindAnimationPlayer_set_current_animation
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_current_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the currently playing animation. If no animation is playing, the property's value is an empty string. Changing this value does not restart the animation. See [method play] for more information on playing animations.
--   			[b]Note[/b]: while this property appears in the inspector, it's not meant to be edited and it's not saved in the scene. This property is mainly used to get the currently playing animation, and internally for animation playback tracks. For more information, see [Animation].
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

{-# NOINLINE bindAnimationPlayer_set_default_blend_time #-}

-- | The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision.
bindAnimationPlayer_set_default_blend_time :: MethodBind
bindAnimationPlayer_set_default_blend_time
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_default_blend_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default time in which to blend animations. Ranges from 0 to 4096 with 0.01 precision.
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

{-# NOINLINE bindAnimationPlayer_set_method_call_mode #-}

-- | The call mode to use for Call Method tracks.
bindAnimationPlayer_set_method_call_mode :: MethodBind
bindAnimationPlayer_set_method_call_mode
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_method_call_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The call mode to use for Call Method tracks.
set_method_call_mode ::
                       (AnimationPlayer :< cls, Object :< cls) => cls -> Int -> IO ()
set_method_call_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_method_call_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_root #-}

-- | The node from which node path references will travel.
bindAnimationPlayer_set_root :: MethodBind
bindAnimationPlayer_set_root
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node from which node path references will travel.
set_root ::
           (AnimationPlayer :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_root cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_set_root (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationPlayer_set_speed_scale #-}

-- | The speed scaling ratio. For instance, if this value is 1, then the animation plays at normal speed. If it's 0.5, then it plays at half speed. If it's 2, then it plays at double speed.
bindAnimationPlayer_set_speed_scale :: MethodBind
bindAnimationPlayer_set_speed_scale
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The speed scaling ratio. For instance, if this value is 1, then the animation plays at normal speed. If it's 0.5, then it plays at half speed. If it's 2, then it plays at double speed.
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

{-# NOINLINE bindAnimationPlayer_stop #-}

-- | Stops or pauses the currently playing animation. If [code]reset[/code] is [code]true[/code], the animation position is reset to [code]0[/code] and the playback speed is reset to [code]1.0[/code].
--   				If [code]reset[/code] is [code]false[/code], the [member current_animation_position] will be kept and calling [method play] or [method play_backwards] without arguments or with the same animation name as [member assigned_animation] will resume the animation.
bindAnimationPlayer_stop :: MethodBind
bindAnimationPlayer_stop
  = unsafePerformIO $
      withCString "AnimationPlayer" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops or pauses the currently playing animation. If [code]reset[/code] is [code]true[/code], the animation position is reset to [code]0[/code] and the playback speed is reset to [code]1.0[/code].
--   				If [code]reset[/code] is [code]false[/code], the [member current_animation_position] will be kept and calling [method play] or [method play_backwards] without arguments or with the same animation name as [member assigned_animation] will resume the animation.
stop ::
       (AnimationPlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
stop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationPlayer_stop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)