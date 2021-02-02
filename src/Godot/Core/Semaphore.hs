{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Semaphore
       (Godot.Core.Semaphore.post, Godot.Core.Semaphore.wait) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSemaphore_post #-}

-- | Lowers the [code]Semaphore[/code], allowing one more thread in. Returns [constant @GlobalScope.OK] on success, [constant @GlobalScope.ERR_BUSY] otherwise.
bindSemaphore_post :: MethodBind
bindSemaphore_post
  = unsafePerformIO $
      withCString "_Semaphore" $
        \ clsNamePtr ->
          withCString "post" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lowers the [code]Semaphore[/code], allowing one more thread in. Returns [constant @GlobalScope.OK] on success, [constant @GlobalScope.ERR_BUSY] otherwise.
post :: (Semaphore :< cls, Object :< cls) => cls -> IO Int
post cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSemaphore_post (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSemaphore_wait #-}

-- | Tries to wait for the [code]Semaphore[/code], if its value is zero, blocks until non-zero. Returns [constant @GlobalScope.OK] on success, [constant @GlobalScope.ERR_BUSY] otherwise.
bindSemaphore_wait :: MethodBind
bindSemaphore_wait
  = unsafePerformIO $
      withCString "_Semaphore" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tries to wait for the [code]Semaphore[/code], if its value is zero, blocks until non-zero. Returns [constant @GlobalScope.OK] on success, [constant @GlobalScope.ERR_BUSY] otherwise.
wait :: (Semaphore :< cls, Object :< cls) => cls -> IO Int
wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSemaphore_wait (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)