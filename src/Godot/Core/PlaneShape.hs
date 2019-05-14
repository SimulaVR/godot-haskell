{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PlaneShape
       (Godot.Core.PlaneShape.set_plane, Godot.Core.PlaneShape.get_plane)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPlaneShape_set_plane #-}

bindPlaneShape_set_plane :: MethodBind
bindPlaneShape_set_plane
  = unsafePerformIO $
      withCString "PlaneShape" $
        \ clsNamePtr ->
          withCString "set_plane" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_plane ::
            (PlaneShape :< cls, Object :< cls) => cls -> Plane -> IO ()
set_plane cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneShape_set_plane (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPlaneShape_get_plane #-}

bindPlaneShape_get_plane :: MethodBind
bindPlaneShape_get_plane
  = unsafePerformIO $
      withCString "PlaneShape" $
        \ clsNamePtr ->
          withCString "get_plane" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_plane :: (PlaneShape :< cls, Object :< cls) => cls -> IO Plane
get_plane cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneShape_get_plane (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)