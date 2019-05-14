{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Thread
       (Godot.Core.Thread._PRIORITY_NORMAL,
        Godot.Core.Thread._PRIORITY_LOW, Godot.Core.Thread._PRIORITY_HIGH,
        Godot.Core.Thread.start, Godot.Core.Thread.get_id,
        Godot.Core.Thread.is_active, Godot.Core.Thread.wait_to_finish)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_PRIORITY_NORMAL :: Int
_PRIORITY_NORMAL = 1

_PRIORITY_LOW :: Int
_PRIORITY_LOW = 0

_PRIORITY_HIGH :: Int
_PRIORITY_HIGH = 2

{-# NOINLINE bindThread_start #-}

-- | Starts a new [code]Thread[/code] that runs "method" on object "instance" with "userdata" passed as an argument. The "priority" of the [code]Thread[/code] can be changed by passing a PRIORITY_* enum.
--   				Returns OK on success, or ERR_CANT_CREATE on failure.
bindThread_start :: MethodBind
bindThread_start
  = unsafePerformIO $
      withCString "_Thread" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts a new [code]Thread[/code] that runs "method" on object "instance" with "userdata" passed as an argument. The "priority" of the [code]Thread[/code] can be changed by passing a PRIORITY_* enum.
--   				Returns OK on success, or ERR_CANT_CREATE on failure.
start ::
        (Thread :< cls, Object :< cls) =>
        cls -> Object -> GodotString -> GodotVariant -> Int -> IO Int
start cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindThread_start (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindThread_get_id #-}

-- | Returns the current [code]Thread[/code]s id, uniquely identifying it among all threads.
bindThread_get_id :: MethodBind
bindThread_get_id
  = unsafePerformIO $
      withCString "_Thread" $
        \ clsNamePtr ->
          withCString "get_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current [code]Thread[/code]s id, uniquely identifying it among all threads.
get_id :: (Thread :< cls, Object :< cls) => cls -> IO GodotString
get_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindThread_get_id (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindThread_is_active #-}

-- | Returns true if this [code]Thread[/code] is currently active. An active [code]Thread[/code] cannot start work on a new method but can be joined with [method wait_to_finish].
bindThread_is_active :: MethodBind
bindThread_is_active
  = unsafePerformIO $
      withCString "_Thread" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns true if this [code]Thread[/code] is currently active. An active [code]Thread[/code] cannot start work on a new method but can be joined with [method wait_to_finish].
is_active :: (Thread :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindThread_is_active (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindThread_wait_to_finish #-}

-- | Joins the [code]Thread[/code] and waits for it to finish. Returns what the method called returned.
bindThread_wait_to_finish :: MethodBind
bindThread_wait_to_finish
  = unsafePerformIO $
      withCString "_Thread" $
        \ clsNamePtr ->
          withCString "wait_to_finish" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Joins the [code]Thread[/code] and waits for it to finish. Returns what the method called returned.
wait_to_finish ::
                 (Thread :< cls, Object :< cls) => cls -> IO GodotVariant
wait_to_finish cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindThread_wait_to_finish (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)