{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Mutex
       (Godot.Core.Mutex.lock, Godot.Core.Mutex.try_lock,
        Godot.Core.Mutex.unlock)
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
import Godot.Core.Reference()

{-# NOINLINE bindMutex_lock #-}

-- | Locks this @Mutex@, blocks until it is unlocked by the current owner.
bindMutex_lock :: MethodBind
bindMutex_lock
  = unsafePerformIO $
      withCString "_Mutex" $
        \ clsNamePtr ->
          withCString "lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Locks this @Mutex@, blocks until it is unlocked by the current owner.
lock :: (Mutex :< cls, Object :< cls) => cls -> IO ()
lock cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMutex_lock (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Mutex "lock" '[] (IO ()) where
        nodeMethod = Godot.Core.Mutex.lock

{-# NOINLINE bindMutex_try_lock #-}

-- | Tries locking this @Mutex@, but does not block. Returns @OK@ on success, @ERR_BUSY@ otherwise.
bindMutex_try_lock :: MethodBind
bindMutex_try_lock
  = unsafePerformIO $
      withCString "_Mutex" $
        \ clsNamePtr ->
          withCString "try_lock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tries locking this @Mutex@, but does not block. Returns @OK@ on success, @ERR_BUSY@ otherwise.
try_lock :: (Mutex :< cls, Object :< cls) => cls -> IO Int
try_lock cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMutex_try_lock (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Mutex "try_lock" '[] (IO Int) where
        nodeMethod = Godot.Core.Mutex.try_lock

{-# NOINLINE bindMutex_unlock #-}

-- | Unlocks this @Mutex@, leaving it to other threads.
bindMutex_unlock :: MethodBind
bindMutex_unlock
  = unsafePerformIO $
      withCString "_Mutex" $
        \ clsNamePtr ->
          withCString "unlock" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Unlocks this @Mutex@, leaving it to other threads.
unlock :: (Mutex :< cls, Object :< cls) => cls -> IO ()
unlock cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMutex_unlock (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Mutex "unlock" '[] (IO ()) where
        nodeMethod = Godot.Core.Mutex.unlock