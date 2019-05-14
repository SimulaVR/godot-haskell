{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Tween
       (Godot.Core.Tween._TRANS_SINE,
        Godot.Core.Tween._TWEEN_PROCESS_IDLE,
        Godot.Core.Tween._TWEEN_PROCESS_PHYSICS,
        Godot.Core.Tween._TRANS_LINEAR, Godot.Core.Tween._EASE_OUT_IN,
        Godot.Core.Tween._TRANS_QUAD, Godot.Core.Tween._TRANS_EXPO,
        Godot.Core.Tween._EASE_IN, Godot.Core.Tween._TRANS_QUINT,
        Godot.Core.Tween._TRANS_BOUNCE, Godot.Core.Tween._TRANS_ELASTIC,
        Godot.Core.Tween._TRANS_CUBIC, Godot.Core.Tween._EASE_OUT,
        Godot.Core.Tween._EASE_IN_OUT, Godot.Core.Tween._TRANS_QUART,
        Godot.Core.Tween._TRANS_BACK, Godot.Core.Tween._TRANS_CIRC,
        Godot.Core.Tween.sig_tween_step,
        Godot.Core.Tween.sig_tween_completed,
        Godot.Core.Tween.sig_tween_started, Godot.Core.Tween.is_active,
        Godot.Core.Tween.set_active, Godot.Core.Tween.is_repeat,
        Godot.Core.Tween.set_repeat, Godot.Core.Tween.set_speed_scale,
        Godot.Core.Tween.get_speed_scale,
        Godot.Core.Tween.set_tween_process_mode,
        Godot.Core.Tween.get_tween_process_mode, Godot.Core.Tween.start,
        Godot.Core.Tween.reset, Godot.Core.Tween.reset_all,
        Godot.Core.Tween.stop, Godot.Core.Tween.stop_all,
        Godot.Core.Tween.resume, Godot.Core.Tween.resume_all,
        Godot.Core.Tween.remove, Godot.Core.Tween._remove_by_uid,
        Godot.Core.Tween.remove_all, Godot.Core.Tween.seek,
        Godot.Core.Tween.tell, Godot.Core.Tween.get_runtime,
        Godot.Core.Tween.interpolate_property,
        Godot.Core.Tween.interpolate_method,
        Godot.Core.Tween.interpolate_callback,
        Godot.Core.Tween.interpolate_deferred_callback,
        Godot.Core.Tween.follow_property, Godot.Core.Tween.follow_method,
        Godot.Core.Tween.targeting_property,
        Godot.Core.Tween.targeting_method)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_TRANS_SINE :: Int
_TRANS_SINE = 1

_TWEEN_PROCESS_IDLE :: Int
_TWEEN_PROCESS_IDLE = 1

_TWEEN_PROCESS_PHYSICS :: Int
_TWEEN_PROCESS_PHYSICS = 0

_TRANS_LINEAR :: Int
_TRANS_LINEAR = 0

_EASE_OUT_IN :: Int
_EASE_OUT_IN = 3

_TRANS_QUAD :: Int
_TRANS_QUAD = 4

_TRANS_EXPO :: Int
_TRANS_EXPO = 5

_EASE_IN :: Int
_EASE_IN = 0

_TRANS_QUINT :: Int
_TRANS_QUINT = 2

_TRANS_BOUNCE :: Int
_TRANS_BOUNCE = 9

_TRANS_ELASTIC :: Int
_TRANS_ELASTIC = 6

_TRANS_CUBIC :: Int
_TRANS_CUBIC = 7

_EASE_OUT :: Int
_EASE_OUT = 1

_EASE_IN_OUT :: Int
_EASE_IN_OUT = 2

_TRANS_QUART :: Int
_TRANS_QUART = 3

_TRANS_BACK :: Int
_TRANS_BACK = 10

_TRANS_CIRC :: Int
_TRANS_CIRC = 8

-- | Emitted at each step of the animation.
sig_tween_step :: Godot.Internal.Dispatch.Signal Tween
sig_tween_step = Godot.Internal.Dispatch.Signal "tween_step"

-- | Emitted when a tween ends.
sig_tween_completed :: Godot.Internal.Dispatch.Signal Tween
sig_tween_completed
  = Godot.Internal.Dispatch.Signal "tween_completed"

-- | Emitted when a tween starts.
sig_tween_started :: Godot.Internal.Dispatch.Signal Tween
sig_tween_started = Godot.Internal.Dispatch.Signal "tween_started"

{-# NOINLINE bindTween_is_active #-}

-- | Returns [code]true[/code] if any tweens are currently running. Note that this method doesn't consider tweens that have ended.
bindTween_is_active :: MethodBind
bindTween_is_active
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if any tweens are currently running. Note that this method doesn't consider tweens that have ended.
is_active :: (Tween :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_is_active (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_set_active #-}

-- | Activates/deactivates the tween. See also [method stop_all] and [method resume_all].
bindTween_set_active :: MethodBind
bindTween_set_active
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Activates/deactivates the tween. See also [method stop_all] and [method resume_all].
set_active :: (Tween :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_set_active (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_is_repeat #-}

-- | If [code]true[/code], the tween loops.
bindTween_is_repeat :: MethodBind
bindTween_is_repeat
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "is_repeat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the tween loops.
is_repeat :: (Tween :< cls, Object :< cls) => cls -> IO Bool
is_repeat cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_is_repeat (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_set_repeat #-}

-- | If [code]true[/code], the tween loops.
bindTween_set_repeat :: MethodBind
bindTween_set_repeat
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "set_repeat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the tween loops.
set_repeat :: (Tween :< cls, Object :< cls) => cls -> Bool -> IO ()
set_repeat cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_set_repeat (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_set_speed_scale #-}

-- | The tween's speed multiplier. For example, set it to [code]1.0[/code] for normal speed, [code]2.0[/code] for two times normal speed, or [code]0.5[/code] for half of the normal speed. A value of [code]0[/code] pauses the animation, but see also [method set_active] or [method stop_all] for this.
bindTween_set_speed_scale :: MethodBind
bindTween_set_speed_scale
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tween's speed multiplier. For example, set it to [code]1.0[/code] for normal speed, [code]2.0[/code] for two times normal speed, or [code]0.5[/code] for half of the normal speed. A value of [code]0[/code] pauses the animation, but see also [method set_active] or [method stop_all] for this.
set_speed_scale ::
                  (Tween :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_set_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_get_speed_scale #-}

-- | The tween's speed multiplier. For example, set it to [code]1.0[/code] for normal speed, [code]2.0[/code] for two times normal speed, or [code]0.5[/code] for half of the normal speed. A value of [code]0[/code] pauses the animation, but see also [method set_active] or [method stop_all] for this.
bindTween_get_speed_scale :: MethodBind
bindTween_get_speed_scale
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tween's speed multiplier. For example, set it to [code]1.0[/code] for normal speed, [code]2.0[/code] for two times normal speed, or [code]0.5[/code] for half of the normal speed. A value of [code]0[/code] pauses the animation, but see also [method set_active] or [method stop_all] for this.
get_speed_scale :: (Tween :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_get_speed_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_set_tween_process_mode #-}

-- | The tween's animation process thread. See [enum TweenProcessMode]. Default value: [constant TWEEN_PROCESS_IDLE].
bindTween_set_tween_process_mode :: MethodBind
bindTween_set_tween_process_mode
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "set_tween_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tween's animation process thread. See [enum TweenProcessMode]. Default value: [constant TWEEN_PROCESS_IDLE].
set_tween_process_mode ::
                         (Tween :< cls, Object :< cls) => cls -> Int -> IO ()
set_tween_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_set_tween_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_get_tween_process_mode #-}

-- | The tween's animation process thread. See [enum TweenProcessMode]. Default value: [constant TWEEN_PROCESS_IDLE].
bindTween_get_tween_process_mode :: MethodBind
bindTween_get_tween_process_mode
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "get_tween_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tween's animation process thread. See [enum TweenProcessMode]. Default value: [constant TWEEN_PROCESS_IDLE].
get_tween_process_mode ::
                         (Tween :< cls, Object :< cls) => cls -> IO Int
get_tween_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_get_tween_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_start #-}

-- | Starts the tween. You can define animations both before and after this.
bindTween_start :: MethodBind
bindTween_start
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts the tween. You can define animations both before and after this.
start :: (Tween :< cls, Object :< cls) => cls -> IO Bool
start cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_start (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_reset #-}

-- | Resets a tween to its initial value (the one given, not the one before the tween), given its object and property/method pair. By default, all tweens are removed, unless [code]key[/code] is specified.
bindTween_reset :: MethodBind
bindTween_reset
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "reset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resets a tween to its initial value (the one given, not the one before the tween), given its object and property/method pair. By default, all tweens are removed, unless [code]key[/code] is specified.
reset ::
        (Tween :< cls, Object :< cls) =>
        cls -> Object -> GodotString -> IO Bool
reset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_reset (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_reset_all #-}

-- | Resets all tweens to their initial values (the ones given, not those before the tween).
bindTween_reset_all :: MethodBind
bindTween_reset_all
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "reset_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resets all tweens to their initial values (the ones given, not those before the tween).
reset_all :: (Tween :< cls, Object :< cls) => cls -> IO Bool
reset_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_reset_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_stop #-}

-- | Stops a tween, given its object and property/method pair. By default, all tweens are stopped, unless [code]key[/code] is specified.
bindTween_stop :: MethodBind
bindTween_stop
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops a tween, given its object and property/method pair. By default, all tweens are stopped, unless [code]key[/code] is specified.
stop ::
       (Tween :< cls, Object :< cls) =>
       cls -> Object -> GodotString -> IO Bool
stop cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_stop (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_stop_all #-}

-- | Stops animating all tweens.
bindTween_stop_all :: MethodBind
bindTween_stop_all
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "stop_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops animating all tweens.
stop_all :: (Tween :< cls, Object :< cls) => cls -> IO Bool
stop_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_stop_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_resume #-}

-- | Continues animating a stopped tween, given its object and property/method pair. By default, all tweens are resumed, unless [code]key[/code] is specified.
bindTween_resume :: MethodBind
bindTween_resume
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "resume" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Continues animating a stopped tween, given its object and property/method pair. By default, all tweens are resumed, unless [code]key[/code] is specified.
resume ::
         (Tween :< cls, Object :< cls) =>
         cls -> Object -> GodotString -> IO Bool
resume cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_resume (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_resume_all #-}

-- | Continues animating all stopped tweens.
bindTween_resume_all :: MethodBind
bindTween_resume_all
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "resume_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Continues animating all stopped tweens.
resume_all :: (Tween :< cls, Object :< cls) => cls -> IO Bool
resume_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_resume_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_remove #-}

-- | Stops animation and removes a tween, given its object and property/method pair. By default, all tweens are removed, unless [code]key[/code] is specified.
bindTween_remove :: MethodBind
bindTween_remove
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops animation and removes a tween, given its object and property/method pair. By default, all tweens are removed, unless [code]key[/code] is specified.
remove ::
         (Tween :< cls, Object :< cls) =>
         cls -> Object -> GodotString -> IO Bool
remove cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_remove (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween__remove_by_uid #-}

bindTween__remove_by_uid :: MethodBind
bindTween__remove_by_uid
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "_remove_by_uid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_remove_by_uid ::
                 (Tween :< cls, Object :< cls) => cls -> Int -> IO ()
_remove_by_uid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween__remove_by_uid (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_remove_all #-}

-- | Stops animation and removes all tweens.
bindTween_remove_all :: MethodBind
bindTween_remove_all
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "remove_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops animation and removes all tweens.
remove_all :: (Tween :< cls, Object :< cls) => cls -> IO Bool
remove_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_remove_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_seek #-}

-- | Sets the interpolation to the given [code]time[/code] in seconds.
bindTween_seek :: MethodBind
bindTween_seek
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the interpolation to the given [code]time[/code] in seconds.
seek :: (Tween :< cls, Object :< cls) => cls -> Float -> IO Bool
seek cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_seek (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_tell #-}

-- | Returns the current time of the tween.
bindTween_tell :: MethodBind
bindTween_tell
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "tell" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current time of the tween.
tell :: (Tween :< cls, Object :< cls) => cls -> IO Float
tell cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_tell (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_get_runtime #-}

-- | Returns the total time needed for all tweens to end. If you have two tweens, one lasting 10 seconds and the other 20 seconds, it would return 20 seconds, as by that time all tweens would have finished.
bindTween_get_runtime :: MethodBind
bindTween_get_runtime
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "get_runtime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total time needed for all tweens to end. If you have two tweens, one lasting 10 seconds and the other 20 seconds, it would return 20 seconds, as by that time all tweens would have finished.
get_runtime :: (Tween :< cls, Object :< cls) => cls -> IO Float
get_runtime cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_get_runtime (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_interpolate_property #-}

-- | Animates [code]property[/code] of [code]object[/code] from [code]initial_val[/code] to [code]final_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later. Setting the initial value to [code]null[/code] uses the current value of the property.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
bindTween_interpolate_property :: MethodBind
bindTween_interpolate_property
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "interpolate_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animates [code]property[/code] of [code]object[/code] from [code]initial_val[/code] to [code]final_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later. Setting the initial value to [code]null[/code] uses the current value of the property.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
interpolate_property ::
                       (Tween :< cls, Object :< cls) =>
                       cls ->
                         Object ->
                           NodePath ->
                             GodotVariant ->
                               GodotVariant -> Float -> Int -> Int -> Float -> IO Bool
interpolate_property cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_interpolate_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_interpolate_method #-}

-- | Animates [code]method[/code] of [code]object[/code] from [code]initial_val[/code] to [code]final_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later. Methods are called with consecutive values.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
bindTween_interpolate_method :: MethodBind
bindTween_interpolate_method
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "interpolate_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animates [code]method[/code] of [code]object[/code] from [code]initial_val[/code] to [code]final_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later. Methods are called with consecutive values.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
interpolate_method ::
                     (Tween :< cls, Object :< cls) =>
                     cls ->
                       Object ->
                         GodotString ->
                           GodotVariant ->
                             GodotVariant -> Float -> Int -> Int -> Float -> IO Bool
interpolate_method cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_interpolate_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_interpolate_callback #-}

-- | Calls [code]callback[/code] of [code]object[/code] after [code]duration[/code]. [code]arg1[/code]-[code]arg5[/code] are arguments to be passed to the callback.
bindTween_interpolate_callback :: MethodBind
bindTween_interpolate_callback
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "interpolate_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls [code]callback[/code] of [code]object[/code] after [code]duration[/code]. [code]arg1[/code]-[code]arg5[/code] are arguments to be passed to the callback.
interpolate_callback ::
                       (Tween :< cls, Object :< cls) =>
                       cls ->
                         Object ->
                           Float ->
                             GodotString ->
                               GodotVariant ->
                                 GodotVariant ->
                                   GodotVariant -> GodotVariant -> GodotVariant -> IO Bool
interpolate_callback cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_interpolate_callback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_interpolate_deferred_callback #-}

-- | Calls [code]callback[/code] of [code]object[/code] after [code]duration[/code] on the main thread (similar to [method Object.call_deferred]). [code]arg1[/code]-[code]arg5[/code] are arguments to be passed to the callback.
bindTween_interpolate_deferred_callback :: MethodBind
bindTween_interpolate_deferred_callback
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "interpolate_deferred_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls [code]callback[/code] of [code]object[/code] after [code]duration[/code] on the main thread (similar to [method Object.call_deferred]). [code]arg1[/code]-[code]arg5[/code] are arguments to be passed to the callback.
interpolate_deferred_callback ::
                                (Tween :< cls, Object :< cls) =>
                                cls ->
                                  Object ->
                                    Float ->
                                      GodotString ->
                                        GodotVariant ->
                                          GodotVariant ->
                                            GodotVariant -> GodotVariant -> GodotVariant -> IO Bool
interpolate_deferred_callback cls arg1 arg2 arg3 arg4 arg5 arg6
  arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_interpolate_deferred_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_follow_property #-}

-- | Follows [code]property[/code] of [code]object[/code] and applies it on [code]target_property[/code] of [code]target[/code], beginning from [code]initial_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
bindTween_follow_property :: MethodBind
bindTween_follow_property
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "follow_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Follows [code]property[/code] of [code]object[/code] and applies it on [code]target_property[/code] of [code]target[/code], beginning from [code]initial_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
follow_property ::
                  (Tween :< cls, Object :< cls) =>
                  cls ->
                    Object ->
                      NodePath ->
                        GodotVariant ->
                          Object -> NodePath -> Float -> Int -> Int -> Float -> IO Bool
follow_property cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_follow_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_follow_method #-}

-- | Follows [code]method[/code] of [code]object[/code] and applies the returned value on [code]target_method[/code] of [code]target[/code], beginning from [code]initial_val[/code] for [code]duration[/code] seconds, [code]delay[/code] later. Methods are called with consecutive values.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
bindTween_follow_method :: MethodBind
bindTween_follow_method
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "follow_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Follows [code]method[/code] of [code]object[/code] and applies the returned value on [code]target_method[/code] of [code]target[/code], beginning from [code]initial_val[/code] for [code]duration[/code] seconds, [code]delay[/code] later. Methods are called with consecutive values.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
follow_method ::
                (Tween :< cls, Object :< cls) =>
                cls ->
                  Object ->
                    GodotString ->
                      GodotVariant ->
                        Object -> GodotString -> Float -> Int -> Int -> Float -> IO Bool
follow_method cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_follow_method (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_targeting_property #-}

-- | Animates [code]property[/code] of [code]object[/code] from the current value of the [code]initial_val[/code] property of [code]initial[/code] to [code]final_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
bindTween_targeting_property :: MethodBind
bindTween_targeting_property
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "targeting_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animates [code]property[/code] of [code]object[/code] from the current value of the [code]initial_val[/code] property of [code]initial[/code] to [code]final_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
targeting_property ::
                     (Tween :< cls, Object :< cls) =>
                     cls ->
                       Object ->
                         NodePath ->
                           Object ->
                             NodePath -> GodotVariant -> Float -> Int -> Int -> Float -> IO Bool
targeting_property cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_targeting_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTween_targeting_method #-}

-- | Animates [code]method[/code] of [code]object[/code] from the value returned by [code]initial_method[/code] to [code]final_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later. Methods are animated by calling them with consecutive values.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
bindTween_targeting_method :: MethodBind
bindTween_targeting_method
  = unsafePerformIO $
      withCString "Tween" $
        \ clsNamePtr ->
          withCString "targeting_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animates [code]method[/code] of [code]object[/code] from the value returned by [code]initial_method[/code] to [code]final_val[/code] for [code]duration[/code] seconds, [code]delay[/code] seconds later. Methods are animated by calling them with consecutive values.
--   				Use [enum TransitionType] for [code]trans_type[/code] and [enum EaseType] for [code]ease_type[/code] parameters. These values control the timing and direction of the interpolation. See the class description for more information
targeting_method ::
                   (Tween :< cls, Object :< cls) =>
                   cls ->
                     Object ->
                       GodotString ->
                         Object ->
                           GodotString ->
                             GodotVariant -> Float -> Int -> Int -> Float -> IO Bool
targeting_method cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTween_targeting_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)