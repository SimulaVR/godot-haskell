{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SphereMesh
       (Godot.Core.SphereMesh.get_height,
        Godot.Core.SphereMesh.get_is_hemisphere,
        Godot.Core.SphereMesh.get_radial_segments,
        Godot.Core.SphereMesh.get_radius, Godot.Core.SphereMesh.get_rings,
        Godot.Core.SphereMesh.set_height,
        Godot.Core.SphereMesh.set_is_hemisphere,
        Godot.Core.SphereMesh.set_radial_segments,
        Godot.Core.SphereMesh.set_radius, Godot.Core.SphereMesh.set_rings)
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

instance NodeProperty SphereMesh "height" Float 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty SphereMesh "is_hemisphere" Bool 'False where
        nodeProperty
          = (get_is_hemisphere, wrapDroppingSetter set_is_hemisphere,
             Nothing)

instance NodeProperty SphereMesh "radial_segments" Int 'False where
        nodeProperty
          = (get_radial_segments, wrapDroppingSetter set_radial_segments,
             Nothing)

instance NodeProperty SphereMesh "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

instance NodeProperty SphereMesh "rings" Int 'False where
        nodeProperty = (get_rings, wrapDroppingSetter set_rings, Nothing)

{-# NOINLINE bindSphereMesh_get_height #-}

-- | Full height of the sphere.
bindSphereMesh_get_height :: MethodBind
bindSphereMesh_get_height
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Full height of the sphere.
get_height :: (SphereMesh :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "get_height" '[] (IO Float) where
        nodeMethod = Godot.Core.SphereMesh.get_height

{-# NOINLINE bindSphereMesh_get_is_hemisphere #-}

-- | If @true@, a hemisphere is created rather than a full sphere.
--   			__Note:__ To get a regular hemisphere, the height and radius of the sphere must be equal.
bindSphereMesh_get_is_hemisphere :: MethodBind
bindSphereMesh_get_is_hemisphere
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_is_hemisphere" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, a hemisphere is created rather than a full sphere.
--   			__Note:__ To get a regular hemisphere, the height and radius of the sphere must be equal.
get_is_hemisphere ::
                    (SphereMesh :< cls, Object :< cls) => cls -> IO Bool
get_is_hemisphere cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_get_is_hemisphere
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "get_is_hemisphere" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.SphereMesh.get_is_hemisphere

{-# NOINLINE bindSphereMesh_get_radial_segments #-}

-- | Number of radial segments on the sphere.
bindSphereMesh_get_radial_segments :: MethodBind
bindSphereMesh_get_radial_segments
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the sphere.
get_radial_segments ::
                      (SphereMesh :< cls, Object :< cls) => cls -> IO Int
get_radial_segments cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_get_radial_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "get_radial_segments" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SphereMesh.get_radial_segments

{-# NOINLINE bindSphereMesh_get_radius #-}

-- | Radius of sphere.
bindSphereMesh_get_radius :: MethodBind
bindSphereMesh_get_radius
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Radius of sphere.
get_radius :: (SphereMesh :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "get_radius" '[] (IO Float) where
        nodeMethod = Godot.Core.SphereMesh.get_radius

{-# NOINLINE bindSphereMesh_get_rings #-}

-- | Number of segments along the height of the sphere.
bindSphereMesh_get_rings :: MethodBind
bindSphereMesh_get_rings
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of segments along the height of the sphere.
get_rings :: (SphereMesh :< cls, Object :< cls) => cls -> IO Int
get_rings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_get_rings (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "get_rings" '[] (IO Int) where
        nodeMethod = Godot.Core.SphereMesh.get_rings

{-# NOINLINE bindSphereMesh_set_height #-}

-- | Full height of the sphere.
bindSphereMesh_set_height :: MethodBind
bindSphereMesh_set_height
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Full height of the sphere.
set_height ::
             (SphereMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "set_height" '[Float] (IO ()) where
        nodeMethod = Godot.Core.SphereMesh.set_height

{-# NOINLINE bindSphereMesh_set_is_hemisphere #-}

-- | If @true@, a hemisphere is created rather than a full sphere.
--   			__Note:__ To get a regular hemisphere, the height and radius of the sphere must be equal.
bindSphereMesh_set_is_hemisphere :: MethodBind
bindSphereMesh_set_is_hemisphere
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_is_hemisphere" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, a hemisphere is created rather than a full sphere.
--   			__Note:__ To get a regular hemisphere, the height and radius of the sphere must be equal.
set_is_hemisphere ::
                    (SphereMesh :< cls, Object :< cls) => cls -> Bool -> IO ()
set_is_hemisphere cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_set_is_hemisphere
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "set_is_hemisphere" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.SphereMesh.set_is_hemisphere

{-# NOINLINE bindSphereMesh_set_radial_segments #-}

-- | Number of radial segments on the sphere.
bindSphereMesh_set_radial_segments :: MethodBind
bindSphereMesh_set_radial_segments
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the sphere.
set_radial_segments ::
                      (SphereMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_radial_segments cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_set_radial_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "set_radial_segments" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.SphereMesh.set_radial_segments

{-# NOINLINE bindSphereMesh_set_radius #-}

-- | Radius of sphere.
bindSphereMesh_set_radius :: MethodBind
bindSphereMesh_set_radius
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Radius of sphere.
set_radius ::
             (SphereMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "set_radius" '[Float] (IO ()) where
        nodeMethod = Godot.Core.SphereMesh.set_radius

{-# NOINLINE bindSphereMesh_set_rings #-}

-- | Number of segments along the height of the sphere.
bindSphereMesh_set_rings :: MethodBind
bindSphereMesh_set_rings
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of segments along the height of the sphere.
set_rings ::
            (SphereMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_rings cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_set_rings (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereMesh "set_rings" '[Int] (IO ()) where
        nodeMethod = Godot.Core.SphereMesh.set_rings