{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Position2D
       (Godot.Core.Position2D._get_gizmo_extents,
        Godot.Core.Position2D._set_gizmo_extents)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPosition2D__get_gizmo_extents #-}

bindPosition2D__get_gizmo_extents :: MethodBind
bindPosition2D__get_gizmo_extents
  = unsafePerformIO $
      withCString "Position2D" $
        \ clsNamePtr ->
          withCString "_get_gizmo_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_gizmo_extents ::
                     (Position2D :< cls, Object :< cls) => cls -> IO Float
_get_gizmo_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPosition2D__get_gizmo_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPosition2D__set_gizmo_extents #-}

bindPosition2D__set_gizmo_extents :: MethodBind
bindPosition2D__set_gizmo_extents
  = unsafePerformIO $
      withCString "Position2D" $
        \ clsNamePtr ->
          withCString "_set_gizmo_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_gizmo_extents ::
                     (Position2D :< cls, Object :< cls) => cls -> Float -> IO ()
_set_gizmo_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPosition2D__set_gizmo_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)