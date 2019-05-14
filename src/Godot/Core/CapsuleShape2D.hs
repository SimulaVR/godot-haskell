{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CapsuleShape2D
       (Godot.Core.CapsuleShape2D.set_radius,
        Godot.Core.CapsuleShape2D.get_radius,
        Godot.Core.CapsuleShape2D.set_height,
        Godot.Core.CapsuleShape2D.get_height)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCapsuleShape2D_set_radius #-}

-- | The capsule's radius.
bindCapsuleShape2D_set_radius :: MethodBind
bindCapsuleShape2D_set_radius
  = unsafePerformIO $
      withCString "CapsuleShape2D" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The capsule's radius.
set_radius ::
             (CapsuleShape2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleShape2D_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCapsuleShape2D_get_radius #-}

-- | The capsule's radius.
bindCapsuleShape2D_get_radius :: MethodBind
bindCapsuleShape2D_get_radius
  = unsafePerformIO $
      withCString "CapsuleShape2D" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The capsule's radius.
get_radius ::
             (CapsuleShape2D :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleShape2D_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCapsuleShape2D_set_height #-}

-- | The capsule's height.
bindCapsuleShape2D_set_height :: MethodBind
bindCapsuleShape2D_set_height
  = unsafePerformIO $
      withCString "CapsuleShape2D" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The capsule's height.
set_height ::
             (CapsuleShape2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleShape2D_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCapsuleShape2D_get_height #-}

-- | The capsule's height.
bindCapsuleShape2D_get_height :: MethodBind
bindCapsuleShape2D_get_height
  = unsafePerformIO $
      withCString "CapsuleShape2D" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The capsule's height.
get_height ::
             (CapsuleShape2D :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleShape2D_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)