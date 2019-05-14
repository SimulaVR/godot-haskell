{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PinJoint2D
       (Godot.Core.PinJoint2D.set_softness,
        Godot.Core.PinJoint2D.get_softness)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPinJoint2D_set_softness #-}

-- | The higher this value, the more the bond to the pinned partner can flex.
bindPinJoint2D_set_softness :: MethodBind
bindPinJoint2D_set_softness
  = unsafePerformIO $
      withCString "PinJoint2D" $
        \ clsNamePtr ->
          withCString "set_softness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The higher this value, the more the bond to the pinned partner can flex.
set_softness ::
               (PinJoint2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_softness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPinJoint2D_set_softness (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPinJoint2D_get_softness #-}

-- | The higher this value, the more the bond to the pinned partner can flex.
bindPinJoint2D_get_softness :: MethodBind
bindPinJoint2D_get_softness
  = unsafePerformIO $
      withCString "PinJoint2D" $
        \ clsNamePtr ->
          withCString "get_softness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The higher this value, the more the bond to the pinned partner can flex.
get_softness ::
               (PinJoint2D :< cls, Object :< cls) => cls -> IO Float
get_softness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPinJoint2D_get_softness (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)