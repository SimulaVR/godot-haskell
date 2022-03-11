{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.PrimitiveMesh()

instance NodeProperty CylinderMesh "bottom_radius" Float 'False
         where
        nodeProperty
          = (get_bottom_radius, wrapDroppingSetter set_bottom_radius,
             Nothing)

instance NodeProperty CylinderMesh "height" Float 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty CylinderMesh "radial_segments" Int 'False
         where
        nodeProperty
          = (get_radial_segments, wrapDroppingSetter set_radial_segments,
             Nothing)

instance NodeProperty CylinderMesh "rings" Int 'False where
        nodeProperty = (get_rings, wrapDroppingSetter set_rings, Nothing)

instance NodeProperty CylinderMesh "top_radius" Float 'False where
        nodeProperty
          = (get_top_radius, wrapDroppingSetter set_top_radius, Nothing)

{-# NOINLINE bindCylinderMesh_get_bottom_radius #-}

-- | Bottom radius of the cylinder. If set to @0.0@, the bottom faces will not be generated, resulting in a conic shape.
bindCylinderMesh_get_bottom_radius :: MethodBind
bindCylinderMesh_get_bottom_radius
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_bottom_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom radius of the cylinder. If set to @0.0@, the bottom faces will not be generated, resulting in a conic shape.
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

instance NodeMethod CylinderMesh "get_bottom_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.CylinderMesh.get_bottom_radius

{-# NOINLINE bindCylinderMesh_get_height #-}

-- | Full height of the cylinder.
bindCylinderMesh_get_height :: MethodBind
bindCylinderMesh_get_height
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Full height of the cylinder.
get_height ::
             (CylinderMesh :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CylinderMesh "get_height" '[] (IO Float) where
        nodeMethod = Godot.Core.CylinderMesh.get_height

{-# NOINLINE bindCylinderMesh_get_radial_segments #-}

-- | Number of radial segments on the cylinder. Higher values result in a more detailed cylinder/cone at the cost of performance.
bindCylinderMesh_get_radial_segments :: MethodBind
bindCylinderMesh_get_radial_segments
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the cylinder. Higher values result in a more detailed cylinder/cone at the cost of performance.
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

instance NodeMethod CylinderMesh "get_radial_segments" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CylinderMesh.get_radial_segments

{-# NOINLINE bindCylinderMesh_get_rings #-}

-- | Number of edge rings along the height of the cylinder. Changing @rings@ does not have any visual impact unless a shader or procedural mesh tool is used to alter the vertex data. Higher values result in more subdivisions, which can be used to create smoother-looking effects with shaders or procedural mesh tools (at the cost of performance). When not altering the vertex data using a shader or procedural mesh tool, @rings@ should be kept to its default value.
bindCylinderMesh_get_rings :: MethodBind
bindCylinderMesh_get_rings
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of edge rings along the height of the cylinder. Changing @rings@ does not have any visual impact unless a shader or procedural mesh tool is used to alter the vertex data. Higher values result in more subdivisions, which can be used to create smoother-looking effects with shaders or procedural mesh tools (at the cost of performance). When not altering the vertex data using a shader or procedural mesh tool, @rings@ should be kept to its default value.
get_rings :: (CylinderMesh :< cls, Object :< cls) => cls -> IO Int
get_rings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_get_rings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CylinderMesh "get_rings" '[] (IO Int) where
        nodeMethod = Godot.Core.CylinderMesh.get_rings

{-# NOINLINE bindCylinderMesh_get_top_radius #-}

-- | Top radius of the cylinder. If set to @0.0@, the top faces will not be generated, resulting in a conic shape.
bindCylinderMesh_get_top_radius :: MethodBind
bindCylinderMesh_get_top_radius
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "get_top_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Top radius of the cylinder. If set to @0.0@, the top faces will not be generated, resulting in a conic shape.
get_top_radius ::
                 (CylinderMesh :< cls, Object :< cls) => cls -> IO Float
get_top_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_get_top_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CylinderMesh "get_top_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.CylinderMesh.get_top_radius

{-# NOINLINE bindCylinderMesh_set_bottom_radius #-}

-- | Bottom radius of the cylinder. If set to @0.0@, the bottom faces will not be generated, resulting in a conic shape.
bindCylinderMesh_set_bottom_radius :: MethodBind
bindCylinderMesh_set_bottom_radius
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_bottom_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom radius of the cylinder. If set to @0.0@, the bottom faces will not be generated, resulting in a conic shape.
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

instance NodeMethod CylinderMesh "set_bottom_radius" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.CylinderMesh.set_bottom_radius

{-# NOINLINE bindCylinderMesh_set_height #-}

-- | Full height of the cylinder.
bindCylinderMesh_set_height :: MethodBind
bindCylinderMesh_set_height
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Full height of the cylinder.
set_height ::
             (CylinderMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CylinderMesh "set_height" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CylinderMesh.set_height

{-# NOINLINE bindCylinderMesh_set_radial_segments #-}

-- | Number of radial segments on the cylinder. Higher values result in a more detailed cylinder/cone at the cost of performance.
bindCylinderMesh_set_radial_segments :: MethodBind
bindCylinderMesh_set_radial_segments
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the cylinder. Higher values result in a more detailed cylinder/cone at the cost of performance.
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

instance NodeMethod CylinderMesh "set_radial_segments" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CylinderMesh.set_radial_segments

{-# NOINLINE bindCylinderMesh_set_rings #-}

-- | Number of edge rings along the height of the cylinder. Changing @rings@ does not have any visual impact unless a shader or procedural mesh tool is used to alter the vertex data. Higher values result in more subdivisions, which can be used to create smoother-looking effects with shaders or procedural mesh tools (at the cost of performance). When not altering the vertex data using a shader or procedural mesh tool, @rings@ should be kept to its default value.
bindCylinderMesh_set_rings :: MethodBind
bindCylinderMesh_set_rings
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of edge rings along the height of the cylinder. Changing @rings@ does not have any visual impact unless a shader or procedural mesh tool is used to alter the vertex data. Higher values result in more subdivisions, which can be used to create smoother-looking effects with shaders or procedural mesh tools (at the cost of performance). When not altering the vertex data using a shader or procedural mesh tool, @rings@ should be kept to its default value.
set_rings ::
            (CylinderMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_rings cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_set_rings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CylinderMesh "set_rings" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CylinderMesh.set_rings

{-# NOINLINE bindCylinderMesh_set_top_radius #-}

-- | Top radius of the cylinder. If set to @0.0@, the top faces will not be generated, resulting in a conic shape.
bindCylinderMesh_set_top_radius :: MethodBind
bindCylinderMesh_set_top_radius
  = unsafePerformIO $
      withCString "CylinderMesh" $
        \ clsNamePtr ->
          withCString "set_top_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Top radius of the cylinder. If set to @0.0@, the top faces will not be generated, resulting in a conic shape.
set_top_radius ::
                 (CylinderMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_top_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCylinderMesh_set_top_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CylinderMesh "set_top_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CylinderMesh.set_top_radius