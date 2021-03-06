{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Semaphore
       (Godot.Core.Semaphore.post, Godot.Core.Semaphore.wait) where
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

{-# NOINLINE bindSemaphore_post #-}

-- | Lowers the @Semaphore@, allowing one more thread in. Returns @OK@ on success, @ERR_BUSY@ otherwise.
bindSemaphore_post :: MethodBind
bindSemaphore_post
  = unsafePerformIO $
      withCString "_Semaphore" $
        \ clsNamePtr ->
          withCString "post" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lowers the @Semaphore@, allowing one more thread in. Returns @OK@ on success, @ERR_BUSY@ otherwise.
post :: (Semaphore :< cls, Object :< cls) => cls -> IO Int
post cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSemaphore_post (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Semaphore "post" '[] (IO Int) where
        nodeMethod = Godot.Core.Semaphore.post

{-# NOINLINE bindSemaphore_wait #-}

-- | Tries to wait for the @Semaphore@, if its value is zero, blocks until non-zero. Returns @OK@ on success, @ERR_BUSY@ otherwise.
bindSemaphore_wait :: MethodBind
bindSemaphore_wait
  = unsafePerformIO $
      withCString "_Semaphore" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tries to wait for the @Semaphore@, if its value is zero, blocks until non-zero. Returns @OK@ on success, @ERR_BUSY@ otherwise.
wait :: (Semaphore :< cls, Object :< cls) => cls -> IO Int
wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSemaphore_wait (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Semaphore "wait" '[] (IO Int) where
        nodeMethod = Godot.Core.Semaphore.wait