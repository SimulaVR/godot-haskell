{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Timer
       (Godot.Core.Timer._TIMER_PROCESS_PHYSICS,
        Godot.Core.Timer._TIMER_PROCESS_IDLE, Godot.Core.Timer.sig_timeout,
        Godot.Core.Timer.set_wait_time, Godot.Core.Timer.get_wait_time,
        Godot.Core.Timer.set_one_shot, Godot.Core.Timer.is_one_shot,
        Godot.Core.Timer.set_autostart, Godot.Core.Timer.has_autostart,
        Godot.Core.Timer.start, Godot.Core.Timer.stop,
        Godot.Core.Timer.set_paused, Godot.Core.Timer.is_paused,
        Godot.Core.Timer.is_stopped, Godot.Core.Timer.get_time_left,
        Godot.Core.Timer.set_timer_process_mode,
        Godot.Core.Timer.get_timer_process_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_TIMER_PROCESS_PHYSICS :: Int
_TIMER_PROCESS_PHYSICS = 0

_TIMER_PROCESS_IDLE :: Int
_TIMER_PROCESS_IDLE = 1

-- | Emitted when the timer reaches 0.
sig_timeout :: Godot.Internal.Dispatch.Signal Timer
sig_timeout = Godot.Internal.Dispatch.Signal "timeout"

{-# NOINLINE bindTimer_set_wait_time #-}

-- | Wait time in seconds.
bindTimer_set_wait_time :: MethodBind
bindTimer_set_wait_time
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_wait_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Wait time in seconds.
set_wait_time ::
                (Timer :< cls, Object :< cls) => cls -> Float -> IO ()
set_wait_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_wait_time (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_get_wait_time #-}

-- | Wait time in seconds.
bindTimer_get_wait_time :: MethodBind
bindTimer_get_wait_time
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "get_wait_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Wait time in seconds.
get_wait_time :: (Timer :< cls, Object :< cls) => cls -> IO Float
get_wait_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_get_wait_time (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_set_one_shot #-}

-- | If [code]true[/code], the timer will stop when reaching 0. If [code]false[/code], it will restart. Default value: [code]false[/code].
bindTimer_set_one_shot :: MethodBind
bindTimer_set_one_shot
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the timer will stop when reaching 0. If [code]false[/code], it will restart. Default value: [code]false[/code].
set_one_shot ::
               (Timer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_shot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_one_shot (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_is_one_shot #-}

-- | If [code]true[/code], the timer will stop when reaching 0. If [code]false[/code], it will restart. Default value: [code]false[/code].
bindTimer_is_one_shot :: MethodBind
bindTimer_is_one_shot
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "is_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the timer will stop when reaching 0. If [code]false[/code], it will restart. Default value: [code]false[/code].
is_one_shot :: (Timer :< cls, Object :< cls) => cls -> IO Bool
is_one_shot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_is_one_shot (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_set_autostart #-}

-- | If [code]true[/code], the timer will automatically start when entering the scene tree. Default value: [code]false[/code].
bindTimer_set_autostart :: MethodBind
bindTimer_set_autostart
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_autostart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the timer will automatically start when entering the scene tree. Default value: [code]false[/code].
set_autostart ::
                (Timer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autostart cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_autostart (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_has_autostart #-}

-- | If [code]true[/code], the timer will automatically start when entering the scene tree. Default value: [code]false[/code].
bindTimer_has_autostart :: MethodBind
bindTimer_has_autostart
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "has_autostart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the timer will automatically start when entering the scene tree. Default value: [code]false[/code].
has_autostart :: (Timer :< cls, Object :< cls) => cls -> IO Bool
has_autostart cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_has_autostart (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_start #-}

-- | Starts the timer. Sets [code]wait_time[/code] to [code]time_sec[/code] if [code]time_sec > 0[/code]. This also resets the remaining time to [code]wait_time[/code].
--   				Note: this method will not resume a paused timer. See [member paused].
bindTimer_start :: MethodBind
bindTimer_start
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts the timer. Sets [code]wait_time[/code] to [code]time_sec[/code] if [code]time_sec > 0[/code]. This also resets the remaining time to [code]wait_time[/code].
--   				Note: this method will not resume a paused timer. See [member paused].
start :: (Timer :< cls, Object :< cls) => cls -> Float -> IO ()
start cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_start (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_stop #-}

-- | Stops the timer.
bindTimer_stop :: MethodBind
bindTimer_stop
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the timer.
stop :: (Timer :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_stop (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_set_paused #-}

-- | If [code]true[/code], the timer is paused and will not process until it is unpaused again, even if [method start] is called.
bindTimer_set_paused :: MethodBind
bindTimer_set_paused
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the timer is paused and will not process until it is unpaused again, even if [method start] is called.
set_paused :: (Timer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_paused cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_paused (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_is_paused #-}

-- | If [code]true[/code], the timer is paused and will not process until it is unpaused again, even if [method start] is called.
bindTimer_is_paused :: MethodBind
bindTimer_is_paused
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "is_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the timer is paused and will not process until it is unpaused again, even if [method start] is called.
is_paused :: (Timer :< cls, Object :< cls) => cls -> IO Bool
is_paused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_is_paused (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_is_stopped #-}

-- | Returns [code]true[/code] if the timer is stopped.
bindTimer_is_stopped :: MethodBind
bindTimer_is_stopped
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "is_stopped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the timer is stopped.
is_stopped :: (Timer :< cls, Object :< cls) => cls -> IO Bool
is_stopped cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_is_stopped (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_get_time_left #-}

-- | The timer's remaining time in seconds. Returns 0 if the timer is inactive.
--   			Note: You cannot set this value. To change the timer's remaining time, use [member wait_time].
bindTimer_get_time_left :: MethodBind
bindTimer_get_time_left
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "get_time_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The timer's remaining time in seconds. Returns 0 if the timer is inactive.
--   			Note: You cannot set this value. To change the timer's remaining time, use [member wait_time].
get_time_left :: (Timer :< cls, Object :< cls) => cls -> IO Float
get_time_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_get_time_left (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_set_timer_process_mode #-}

-- | Processing mode. See [enum TimerProcessMode].
bindTimer_set_timer_process_mode :: MethodBind
bindTimer_set_timer_process_mode
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_timer_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Processing mode. See [enum TimerProcessMode].
set_timer_process_mode ::
                         (Timer :< cls, Object :< cls) => cls -> Int -> IO ()
set_timer_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_timer_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTimer_get_timer_process_mode #-}

-- | Processing mode. See [enum TimerProcessMode].
bindTimer_get_timer_process_mode :: MethodBind
bindTimer_get_timer_process_mode
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "get_timer_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Processing mode. See [enum TimerProcessMode].
get_timer_process_mode ::
                         (Timer :< cls, Object :< cls) => cls -> IO Int
get_timer_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_get_timer_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)