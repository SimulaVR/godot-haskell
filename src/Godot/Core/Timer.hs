{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Timer
       (Godot.Core.Timer._TIMER_PROCESS_PHYSICS,
        Godot.Core.Timer._TIMER_PROCESS_IDLE, Godot.Core.Timer.sig_timeout,
        Godot.Core.Timer.get_time_left,
        Godot.Core.Timer.get_timer_process_mode,
        Godot.Core.Timer.get_wait_time, Godot.Core.Timer.has_autostart,
        Godot.Core.Timer.is_one_shot, Godot.Core.Timer.is_paused,
        Godot.Core.Timer.is_stopped, Godot.Core.Timer.set_autostart,
        Godot.Core.Timer.set_one_shot, Godot.Core.Timer.set_paused,
        Godot.Core.Timer.set_timer_process_mode,
        Godot.Core.Timer.set_wait_time, Godot.Core.Timer.start,
        Godot.Core.Timer.stop)
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
import Godot.Core.Node()

_TIMER_PROCESS_PHYSICS :: Int
_TIMER_PROCESS_PHYSICS = 0

_TIMER_PROCESS_IDLE :: Int
_TIMER_PROCESS_IDLE = 1

-- | Emitted when the timer reaches 0.
sig_timeout :: Godot.Internal.Dispatch.Signal Timer
sig_timeout = Godot.Internal.Dispatch.Signal "timeout"

instance NodeSignal Timer "timeout" '[]

instance NodeProperty Timer "autostart" Bool 'False where
        nodeProperty
          = (has_autostart, wrapDroppingSetter set_autostart, Nothing)

instance NodeProperty Timer "one_shot" Bool 'False where
        nodeProperty
          = (is_one_shot, wrapDroppingSetter set_one_shot, Nothing)

instance NodeProperty Timer "paused" Bool 'False where
        nodeProperty = (is_paused, wrapDroppingSetter set_paused, Nothing)

instance NodeProperty Timer "process_mode" Int 'False where
        nodeProperty
          = (get_timer_process_mode,
             wrapDroppingSetter set_timer_process_mode, Nothing)

instance NodeProperty Timer "time_left" Float 'True where
        nodeProperty = (get_time_left, (), Nothing)

instance NodeProperty Timer "wait_time" Float 'False where
        nodeProperty
          = (get_wait_time, wrapDroppingSetter set_wait_time, Nothing)

{-# NOINLINE bindTimer_get_time_left #-}

-- | The timer's remaining time in seconds. Returns 0 if the timer is inactive.
--   			__Note:__ You cannot set this value. To change the timer's remaining time, use @method start@.
bindTimer_get_time_left :: MethodBind
bindTimer_get_time_left
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "get_time_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The timer's remaining time in seconds. Returns 0 if the timer is inactive.
--   			__Note:__ You cannot set this value. To change the timer's remaining time, use @method start@.
get_time_left :: (Timer :< cls, Object :< cls) => cls -> IO Float
get_time_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_get_time_left (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "get_time_left" '[] (IO Float) where
        nodeMethod = Godot.Core.Timer.get_time_left

{-# NOINLINE bindTimer_get_timer_process_mode #-}

-- | Processing mode. See @enum TimerProcessMode@.
bindTimer_get_timer_process_mode :: MethodBind
bindTimer_get_timer_process_mode
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "get_timer_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Processing mode. See @enum TimerProcessMode@.
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

instance NodeMethod Timer "get_timer_process_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Timer.get_timer_process_mode

{-# NOINLINE bindTimer_get_wait_time #-}

-- | The wait time in seconds.
--   			__Note:__ Timers can only emit once per rendered frame at most (or once per physics frame if @process_mode@ is @TIMER_PROCESS_PHYSICS@). This means very low wait times (lower than 0.05 seconds) will behave in significantly different ways depending on the rendered framerate. For very low wait times, it is recommended to use a process loop in a script instead of using a Timer node.
bindTimer_get_wait_time :: MethodBind
bindTimer_get_wait_time
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "get_wait_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The wait time in seconds.
--   			__Note:__ Timers can only emit once per rendered frame at most (or once per physics frame if @process_mode@ is @TIMER_PROCESS_PHYSICS@). This means very low wait times (lower than 0.05 seconds) will behave in significantly different ways depending on the rendered framerate. For very low wait times, it is recommended to use a process loop in a script instead of using a Timer node.
get_wait_time :: (Timer :< cls, Object :< cls) => cls -> IO Float
get_wait_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_get_wait_time (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "get_wait_time" '[] (IO Float) where
        nodeMethod = Godot.Core.Timer.get_wait_time

{-# NOINLINE bindTimer_has_autostart #-}

-- | If @true@, the timer will automatically start when entering the scene tree.
--   			__Note:__ This property is automatically set to @false@ after the timer enters the scene tree and starts.
bindTimer_has_autostart :: MethodBind
bindTimer_has_autostart
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "has_autostart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the timer will automatically start when entering the scene tree.
--   			__Note:__ This property is automatically set to @false@ after the timer enters the scene tree and starts.
has_autostart :: (Timer :< cls, Object :< cls) => cls -> IO Bool
has_autostart cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_has_autostart (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "has_autostart" '[] (IO Bool) where
        nodeMethod = Godot.Core.Timer.has_autostart

{-# NOINLINE bindTimer_is_one_shot #-}

-- | If @true@, the timer will stop when reaching 0. If @false@, it will restart.
bindTimer_is_one_shot :: MethodBind
bindTimer_is_one_shot
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "is_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the timer will stop when reaching 0. If @false@, it will restart.
is_one_shot :: (Timer :< cls, Object :< cls) => cls -> IO Bool
is_one_shot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_is_one_shot (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "is_one_shot" '[] (IO Bool) where
        nodeMethod = Godot.Core.Timer.is_one_shot

{-# NOINLINE bindTimer_is_paused #-}

-- | If @true@, the timer is paused and will not process until it is unpaused again, even if @method start@ is called.
bindTimer_is_paused :: MethodBind
bindTimer_is_paused
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "is_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the timer is paused and will not process until it is unpaused again, even if @method start@ is called.
is_paused :: (Timer :< cls, Object :< cls) => cls -> IO Bool
is_paused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_is_paused (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "is_paused" '[] (IO Bool) where
        nodeMethod = Godot.Core.Timer.is_paused

{-# NOINLINE bindTimer_is_stopped #-}

-- | Returns @true@ if the timer is stopped.
bindTimer_is_stopped :: MethodBind
bindTimer_is_stopped
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "is_stopped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the timer is stopped.
is_stopped :: (Timer :< cls, Object :< cls) => cls -> IO Bool
is_stopped cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_is_stopped (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "is_stopped" '[] (IO Bool) where
        nodeMethod = Godot.Core.Timer.is_stopped

{-# NOINLINE bindTimer_set_autostart #-}

-- | If @true@, the timer will automatically start when entering the scene tree.
--   			__Note:__ This property is automatically set to @false@ after the timer enters the scene tree and starts.
bindTimer_set_autostart :: MethodBind
bindTimer_set_autostart
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_autostart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the timer will automatically start when entering the scene tree.
--   			__Note:__ This property is automatically set to @false@ after the timer enters the scene tree and starts.
set_autostart ::
                (Timer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autostart cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_autostart (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "set_autostart" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Timer.set_autostart

{-# NOINLINE bindTimer_set_one_shot #-}

-- | If @true@, the timer will stop when reaching 0. If @false@, it will restart.
bindTimer_set_one_shot :: MethodBind
bindTimer_set_one_shot
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the timer will stop when reaching 0. If @false@, it will restart.
set_one_shot ::
               (Timer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_one_shot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_one_shot (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "set_one_shot" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Timer.set_one_shot

{-# NOINLINE bindTimer_set_paused #-}

-- | If @true@, the timer is paused and will not process until it is unpaused again, even if @method start@ is called.
bindTimer_set_paused :: MethodBind
bindTimer_set_paused
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the timer is paused and will not process until it is unpaused again, even if @method start@ is called.
set_paused :: (Timer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_paused cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_paused (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "set_paused" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Timer.set_paused

{-# NOINLINE bindTimer_set_timer_process_mode #-}

-- | Processing mode. See @enum TimerProcessMode@.
bindTimer_set_timer_process_mode :: MethodBind
bindTimer_set_timer_process_mode
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_timer_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Processing mode. See @enum TimerProcessMode@.
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

instance NodeMethod Timer "set_timer_process_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Timer.set_timer_process_mode

{-# NOINLINE bindTimer_set_wait_time #-}

-- | The wait time in seconds.
--   			__Note:__ Timers can only emit once per rendered frame at most (or once per physics frame if @process_mode@ is @TIMER_PROCESS_PHYSICS@). This means very low wait times (lower than 0.05 seconds) will behave in significantly different ways depending on the rendered framerate. For very low wait times, it is recommended to use a process loop in a script instead of using a Timer node.
bindTimer_set_wait_time :: MethodBind
bindTimer_set_wait_time
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "set_wait_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The wait time in seconds.
--   			__Note:__ Timers can only emit once per rendered frame at most (or once per physics frame if @process_mode@ is @TIMER_PROCESS_PHYSICS@). This means very low wait times (lower than 0.05 seconds) will behave in significantly different ways depending on the rendered framerate. For very low wait times, it is recommended to use a process loop in a script instead of using a Timer node.
set_wait_time ::
                (Timer :< cls, Object :< cls) => cls -> Float -> IO ()
set_wait_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_set_wait_time (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "set_wait_time" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Timer.set_wait_time

{-# NOINLINE bindTimer_start #-}

-- | Starts the timer. Sets @wait_time@ to @time_sec@ if @time_sec > 0@. This also resets the remaining time to @wait_time@.
--   				__Note:__ This method will not resume a paused timer. See @paused@.
bindTimer_start :: MethodBind
bindTimer_start
  = unsafePerformIO $
      withCString "Timer" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts the timer. Sets @wait_time@ to @time_sec@ if @time_sec > 0@. This also resets the remaining time to @wait_time@.
--   				__Note:__ This method will not resume a paused timer. See @paused@.
start ::
        (Timer :< cls, Object :< cls) => cls -> Maybe Float -> IO ()
start cls arg1
  = withVariantArray [maybe (VariantReal (-1)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTimer_start (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Timer "start" '[Maybe Float] (IO ()) where
        nodeMethod = Godot.Core.Timer.start

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

instance NodeMethod Timer "stop" '[] (IO ()) where
        nodeMethod = Godot.Core.Timer.stop