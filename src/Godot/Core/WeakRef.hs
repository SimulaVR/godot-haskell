{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.WeakRef (Godot.Core.WeakRef.get_ref) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindWeakRef_get_ref #-}

-- | Returns the [Object] this weakref is referring to.
bindWeakRef_get_ref :: MethodBind
bindWeakRef_get_ref
  = unsafePerformIO $
      withCString "WeakRef" $
        \ clsNamePtr ->
          withCString "get_ref" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Object] this weakref is referring to.
get_ref ::
          (WeakRef :< cls, Object :< cls) => cls -> IO GodotVariant
get_ref cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWeakRef_get_ref (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)