{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CubeMesh
       (Godot.Core.CubeMesh.get_size,
        Godot.Core.CubeMesh.get_subdivide_depth,
        Godot.Core.CubeMesh.get_subdivide_height,
        Godot.Core.CubeMesh.get_subdivide_width,
        Godot.Core.CubeMesh.set_size,
        Godot.Core.CubeMesh.set_subdivide_depth,
        Godot.Core.CubeMesh.set_subdivide_height,
        Godot.Core.CubeMesh.set_subdivide_width)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCubeMesh_get_size #-}

-- | Size of the cuboid mesh.
bindCubeMesh_get_size :: MethodBind
bindCubeMesh_get_size
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of the cuboid mesh.
get_size :: (CubeMesh :< cls, Object :< cls) => cls -> IO Vector3
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMesh_get_subdivide_depth #-}

-- | Number of extra edge loops inserted along the Z axis.
bindCubeMesh_get_subdivide_depth :: MethodBind
bindCubeMesh_get_subdivide_depth
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of extra edge loops inserted along the Z axis.
get_subdivide_depth ::
                      (CubeMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_get_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMesh_get_subdivide_height #-}

-- | Number of extra edge loops inserted along the Y axis.
bindCubeMesh_get_subdivide_height :: MethodBind
bindCubeMesh_get_subdivide_height
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of extra edge loops inserted along the Y axis.
get_subdivide_height ::
                       (CubeMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_get_subdivide_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMesh_get_subdivide_width #-}

-- | Number of extra edge loops inserted along the X axis.
bindCubeMesh_get_subdivide_width :: MethodBind
bindCubeMesh_get_subdivide_width
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of extra edge loops inserted along the X axis.
get_subdivide_width ::
                      (CubeMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_get_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMesh_set_size #-}

-- | Size of the cuboid mesh.
bindCubeMesh_set_size :: MethodBind
bindCubeMesh_set_size
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of the cuboid mesh.
set_size ::
           (CubeMesh :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMesh_set_subdivide_depth #-}

-- | Number of extra edge loops inserted along the Z axis.
bindCubeMesh_set_subdivide_depth :: MethodBind
bindCubeMesh_set_subdivide_depth
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of extra edge loops inserted along the Z axis.
set_subdivide_depth ::
                      (CubeMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_set_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMesh_set_subdivide_height #-}

-- | Number of extra edge loops inserted along the Y axis.
bindCubeMesh_set_subdivide_height :: MethodBind
bindCubeMesh_set_subdivide_height
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of extra edge loops inserted along the Y axis.
set_subdivide_height ::
                       (CubeMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_set_subdivide_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMesh_set_subdivide_width #-}

-- | Number of extra edge loops inserted along the X axis.
bindCubeMesh_set_subdivide_width :: MethodBind
bindCubeMesh_set_subdivide_width
  = unsafePerformIO $
      withCString "CubeMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of extra edge loops inserted along the X axis.
set_subdivide_width ::
                      (CubeMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMesh_set_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)