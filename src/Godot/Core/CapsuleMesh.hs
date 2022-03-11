{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CapsuleMesh
       (Godot.Core.CapsuleMesh.get_mid_height,
        Godot.Core.CapsuleMesh.get_radial_segments,
        Godot.Core.CapsuleMesh.get_radius,
        Godot.Core.CapsuleMesh.get_rings,
        Godot.Core.CapsuleMesh.set_mid_height,
        Godot.Core.CapsuleMesh.set_radial_segments,
        Godot.Core.CapsuleMesh.set_radius,
        Godot.Core.CapsuleMesh.set_rings)
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

instance NodeProperty CapsuleMesh "mid_height" Float 'False where
        nodeProperty
          = (get_mid_height, wrapDroppingSetter set_mid_height, Nothing)

instance NodeProperty CapsuleMesh "radial_segments" Int 'False
         where
        nodeProperty
          = (get_radial_segments, wrapDroppingSetter set_radial_segments,
             Nothing)

instance NodeProperty CapsuleMesh "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

instance NodeProperty CapsuleMesh "rings" Int 'False where
        nodeProperty = (get_rings, wrapDroppingSetter set_rings, Nothing)

{-# NOINLINE bindCapsuleMesh_get_mid_height #-}

-- | Height of the middle cylindrical part of the capsule (without the hemispherical ends).
--   			__Note:__ The capsule's total height is equal to @mid_height@ + 2 * @radius@.
bindCapsuleMesh_get_mid_height :: MethodBind
bindCapsuleMesh_get_mid_height
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "get_mid_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Height of the middle cylindrical part of the capsule (without the hemispherical ends).
--   			__Note:__ The capsule's total height is equal to @mid_height@ + 2 * @radius@.
get_mid_height ::
                 (CapsuleMesh :< cls, Object :< cls) => cls -> IO Float
get_mid_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_get_mid_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleMesh "get_mid_height" '[] (IO Float)
         where
        nodeMethod = Godot.Core.CapsuleMesh.get_mid_height

{-# NOINLINE bindCapsuleMesh_get_radial_segments #-}

-- | Number of radial segments on the capsule mesh.
bindCapsuleMesh_get_radial_segments :: MethodBind
bindCapsuleMesh_get_radial_segments
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "get_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the capsule mesh.
get_radial_segments ::
                      (CapsuleMesh :< cls, Object :< cls) => cls -> IO Int
get_radial_segments cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_get_radial_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleMesh "get_radial_segments" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CapsuleMesh.get_radial_segments

{-# NOINLINE bindCapsuleMesh_get_radius #-}

-- | Radius of the capsule mesh.
bindCapsuleMesh_get_radius :: MethodBind
bindCapsuleMesh_get_radius
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Radius of the capsule mesh.
get_radius ::
             (CapsuleMesh :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleMesh "get_radius" '[] (IO Float) where
        nodeMethod = Godot.Core.CapsuleMesh.get_radius

{-# NOINLINE bindCapsuleMesh_get_rings #-}

-- | Number of rings along the height of the capsule.
bindCapsuleMesh_get_rings :: MethodBind
bindCapsuleMesh_get_rings
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "get_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of rings along the height of the capsule.
get_rings :: (CapsuleMesh :< cls, Object :< cls) => cls -> IO Int
get_rings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_get_rings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleMesh "get_rings" '[] (IO Int) where
        nodeMethod = Godot.Core.CapsuleMesh.get_rings

{-# NOINLINE bindCapsuleMesh_set_mid_height #-}

-- | Height of the middle cylindrical part of the capsule (without the hemispherical ends).
--   			__Note:__ The capsule's total height is equal to @mid_height@ + 2 * @radius@.
bindCapsuleMesh_set_mid_height :: MethodBind
bindCapsuleMesh_set_mid_height
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "set_mid_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Height of the middle cylindrical part of the capsule (without the hemispherical ends).
--   			__Note:__ The capsule's total height is equal to @mid_height@ + 2 * @radius@.
set_mid_height ::
                 (CapsuleMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_mid_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_set_mid_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleMesh "set_mid_height" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CapsuleMesh.set_mid_height

{-# NOINLINE bindCapsuleMesh_set_radial_segments #-}

-- | Number of radial segments on the capsule mesh.
bindCapsuleMesh_set_radial_segments :: MethodBind
bindCapsuleMesh_set_radial_segments
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "set_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the capsule mesh.
set_radial_segments ::
                      (CapsuleMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_radial_segments cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_set_radial_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleMesh "set_radial_segments" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CapsuleMesh.set_radial_segments

{-# NOINLINE bindCapsuleMesh_set_radius #-}

-- | Radius of the capsule mesh.
bindCapsuleMesh_set_radius :: MethodBind
bindCapsuleMesh_set_radius
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Radius of the capsule mesh.
set_radius ::
             (CapsuleMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleMesh "set_radius" '[Float] (IO ()) where
        nodeMethod = Godot.Core.CapsuleMesh.set_radius

{-# NOINLINE bindCapsuleMesh_set_rings #-}

-- | Number of rings along the height of the capsule.
bindCapsuleMesh_set_rings :: MethodBind
bindCapsuleMesh_set_rings
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "set_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of rings along the height of the capsule.
set_rings ::
            (CapsuleMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_rings cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_set_rings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleMesh "set_rings" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CapsuleMesh.set_rings