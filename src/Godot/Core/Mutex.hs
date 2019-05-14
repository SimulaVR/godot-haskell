{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Mutex
       (Godot.Core.Mutex.lock, Godot.Core.Mutex.try_lock,
        Godot.Core.Mutex.unlock)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMutex_lock #-}

-- | Lock this [code]Mutex[/code], blocks until it is unlocked by the current owner.
bindMutex_lock :: MethodBind
bindMutex_lock
  = unsafePerformIO $
      withCString "_Mutex" $
        \ clsNamePtr ->
          withCString "lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lock this [code]Mutex[/code], blocks until it is unlocked by the current owner.
lock :: (Mutex :< cls, Object :< cls) => cls -> IO ()
lock cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMutex_lock (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMutex_try_lock #-}

-- | Try locking this [code]Mutex[/code], does not block. Returns [code]OK[/code] on success, [code]ERR_BUSY[/code] otherwise.
bindMutex_try_lock :: MethodBind
bindMutex_try_lock
  = unsafePerformIO $
      withCString "_Mutex" $
        \ clsNamePtr ->
          withCString "try_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Try locking this [code]Mutex[/code], does not block. Returns [code]OK[/code] on success, [code]ERR_BUSY[/code] otherwise.
try_lock :: (Mutex :< cls, Object :< cls) => cls -> IO Int
try_lock cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMutex_try_lock (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMutex_unlock #-}

-- | Unlock this [code]Mutex[/code], leaving it to other threads.
bindMutex_unlock :: MethodBind
bindMutex_unlock
  = unsafePerformIO $
      withCString "_Mutex" $
        \ clsNamePtr ->
          withCString "unlock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unlock this [code]Mutex[/code], leaving it to other threads.
unlock :: (Mutex :< cls, Object :< cls) => cls -> IO ()
unlock cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMutex_unlock (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)