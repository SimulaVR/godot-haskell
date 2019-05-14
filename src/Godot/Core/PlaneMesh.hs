{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PlaneMesh
       (Godot.Core.PlaneMesh.set_size, Godot.Core.PlaneMesh.get_size,
        Godot.Core.PlaneMesh.set_subdivide_width,
        Godot.Core.PlaneMesh.get_subdivide_width,
        Godot.Core.PlaneMesh.set_subdivide_depth,
        Godot.Core.PlaneMesh.get_subdivide_depth)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPlaneMesh_set_size #-}

-- | Size of the generated plane. Defaults to (2.0, 2.0).
bindPlaneMesh_set_size :: MethodBind
bindPlaneMesh_set_size
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of the generated plane. Defaults to (2.0, 2.0).
set_size ::
           (PlaneMesh :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPlaneMesh_get_size #-}

-- | Size of the generated plane. Defaults to (2.0, 2.0).
bindPlaneMesh_get_size :: MethodBind
bindPlaneMesh_get_size
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of the generated plane. Defaults to (2.0, 2.0).
get_size :: (PlaneMesh :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPlaneMesh_set_subdivide_width #-}

-- | Number of subdivision along the x-axis. Defaults to 0.
bindPlaneMesh_set_subdivide_width :: MethodBind
bindPlaneMesh_set_subdivide_width
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of subdivision along the x-axis. Defaults to 0.
set_subdivide_width ::
                      (PlaneMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_set_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPlaneMesh_get_subdivide_width #-}

-- | Number of subdivision along the x-axis. Defaults to 0.
bindPlaneMesh_get_subdivide_width :: MethodBind
bindPlaneMesh_get_subdivide_width
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of subdivision along the x-axis. Defaults to 0.
get_subdivide_width ::
                      (PlaneMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_get_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPlaneMesh_set_subdivide_depth #-}

-- | Number of subdivision along the z-axis. Defaults to 0.
bindPlaneMesh_set_subdivide_depth :: MethodBind
bindPlaneMesh_set_subdivide_depth
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of subdivision along the z-axis. Defaults to 0.
set_subdivide_depth ::
                      (PlaneMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_set_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPlaneMesh_get_subdivide_depth #-}

-- | Number of subdivision along the z-axis. Defaults to 0.
bindPlaneMesh_get_subdivide_depth :: MethodBind
bindPlaneMesh_get_subdivide_depth
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of subdivision along the z-axis. Defaults to 0.
get_subdivide_depth ::
                      (PlaneMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_get_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)