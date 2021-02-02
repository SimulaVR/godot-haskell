{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SphereShape
       (Godot.Core.SphereShape.get_radius,
        Godot.Core.SphereShape.set_radius)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSphereShape_get_radius #-}

-- | The sphere's radius. The shape's diameter is double the radius.
bindSphereShape_get_radius :: MethodBind
bindSphereShape_get_radius
  = unsafePerformIO $
      withCString "SphereShape" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius. The shape's diameter is double the radius.
get_radius ::
             (SphereShape :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereShape_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSphereShape_set_radius #-}

-- | The sphere's radius. The shape's diameter is double the radius.
bindSphereShape_set_radius :: MethodBind
bindSphereShape_set_radius
  = unsafePerformIO $
      withCString "SphereShape" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius. The shape's diameter is double the radius.
set_radius ::
             (SphereShape :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereShape_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)