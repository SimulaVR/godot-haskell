{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CylinderShape
       (Godot.Core.CylinderShape.set_radius,
        Godot.Core.CylinderShape.get_radius,
        Godot.Core.CylinderShape.set_height,
        Godot.Core.CylinderShape.get_height)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCylinderShape_set_radius #-}

-- | The cylinder's radius.
bindCylinderShape_set_radius :: MethodBind
bindCylinderShape_set_radius
  = unsafePerformIO $
      withCString "CylinderShape" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cylinder's radius.
set_radius ::
             (CylinderShape :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderShape_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderShape_get_radius #-}

-- | The cylinder's radius.
bindCylinderShape_get_radius :: MethodBind
bindCylinderShape_get_radius
  = unsafePerformIO $
      withCString "CylinderShape" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cylinder's radius.
get_radius ::
             (CylinderShape :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderShape_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderShape_set_height #-}

-- | The cylinder's height.
bindCylinderShape_set_height :: MethodBind
bindCylinderShape_set_height
  = unsafePerformIO $
      withCString "CylinderShape" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cylinder's height.
set_height ::
             (CylinderShape :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderShape_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderShape_get_height #-}

-- | The cylinder's height.
bindCylinderShape_get_height :: MethodBind
bindCylinderShape_get_height
  = unsafePerformIO $
      withCString "CylinderShape" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The cylinder's height.
get_height ::
             (CylinderShape :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderShape_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)