{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CylinderMesh
       (Godot.Core.CylinderMesh.get_bottom_radius,
        Godot.Core.CylinderMesh.get_height,
        Godot.Core.CylinderMesh.get_radial_segments,
        Godot.Core.CylinderMesh.get_rings,
        Godot.Core.CylinderMesh.get_top_radius,
        Godot.Core.CylinderMesh.set_bottom_radius,
        Godot.Core.CylinderMesh.set_height,
        Godot.Core.CylinderMesh.set_radial_segments,
        Godot.Core.CylinderMesh.set_rings,
        Godot.Core.CylinderMesh.set_top_radius)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCylinderMesh_get_bottom_radius #-}

-- | Bottom radius of the cylinder. Defaults to 1.0.
bindCylinderMesh_get_bottom_radius :: MethodBind
bindCylinderMesh_get_bottom_radius
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_bottom_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom radius of the cylinder. Defaults to 1.0.
get_bottom_radius ::
                    (CylinderMesh :< cls, Object :< cls) => cls -> IO Float
get_bottom_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_get_bottom_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_get_height #-}

-- | Full height of the cylinder. Defaults to 2.0.
bindCylinderMesh_get_height :: MethodBind
bindCylinderMesh_get_height
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Full height of the cylinder. Defaults to 2.0.
get_height ::
             (CylinderMesh :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_get_radial_segments #-}

-- | Number of radial segments on the cylinder. Defaults to 64.
bindCylinderMesh_get_radial_segments :: MethodBind
bindCylinderMesh_get_radial_segments
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the cylinder. Defaults to 64.
get_radial_segments ::
                      (CylinderMesh :< cls, Object :< cls) => cls -> IO Int
get_radial_segments cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_get_radial_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_get_rings #-}

-- | Number of edge rings along the height of the cylinder. Defaults to 4.
bindCylinderMesh_get_rings :: MethodBind
bindCylinderMesh_get_rings
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of edge rings along the height of the cylinder. Defaults to 4.
get_rings :: (CylinderMesh :< cls, Object :< cls) => cls -> IO Int
get_rings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_get_rings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_get_top_radius #-}

-- | Top radius of the cylinder. Defaults to 1.0.
bindCylinderMesh_get_top_radius :: MethodBind
bindCylinderMesh_get_top_radius
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_top_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Top radius of the cylinder. Defaults to 1.0.
get_top_radius ::
                 (CylinderMesh :< cls, Object :< cls) => cls -> IO Float
get_top_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_get_top_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_set_bottom_radius #-}

-- | Bottom radius of the cylinder. Defaults to 1.0.
bindCylinderMesh_set_bottom_radius :: MethodBind
bindCylinderMesh_set_bottom_radius
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_bottom_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom radius of the cylinder. Defaults to 1.0.
set_bottom_radius ::
                    (CylinderMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_bottom_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_set_bottom_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_set_height #-}

-- | Full height of the cylinder. Defaults to 2.0.
bindCylinderMesh_set_height :: MethodBind
bindCylinderMesh_set_height
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Full height of the cylinder. Defaults to 2.0.
set_height ::
             (CylinderMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_set_radial_segments #-}

-- | Number of radial segments on the cylinder. Defaults to 64.
bindCylinderMesh_set_radial_segments :: MethodBind
bindCylinderMesh_set_radial_segments
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the cylinder. Defaults to 64.
set_radial_segments ::
                      (CylinderMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_radial_segments cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_set_radial_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_set_rings #-}

-- | Number of edge rings along the height of the cylinder. Defaults to 4.
bindCylinderMesh_set_rings :: MethodBind
bindCylinderMesh_set_rings
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of edge rings along the height of the cylinder. Defaults to 4.
set_rings ::
            (CylinderMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_rings cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_set_rings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCylinderMesh_set_top_radius #-}

-- | Top radius of the cylinder. Defaults to 1.0.
bindCylinderMesh_set_top_radius :: MethodBind
bindCylinderMesh_set_top_radius
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_top_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Top radius of the cylinder. Defaults to 1.0.
set_top_radius ::
                 (CylinderMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_top_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_set_top_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)