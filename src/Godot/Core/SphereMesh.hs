{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SphereMesh
       (Godot.Core.SphereMesh.set_radius,
        Godot.Core.SphereMesh.get_radius, Godot.Core.SphereMesh.set_height,
        Godot.Core.SphereMesh.get_height,
        Godot.Core.SphereMesh.set_radial_segments,
        Godot.Core.SphereMesh.get_radial_segments,
        Godot.Core.SphereMesh.set_rings, Godot.Core.SphereMesh.get_rings,
        Godot.Core.SphereMesh.set_is_hemisphere,
        Godot.Core.SphereMesh.get_is_hemisphere)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSphereMesh_set_radius #-}

-- | Radius of sphere. Defaults to 1.0.
bindSphereMesh_set_radius :: MethodBind
bindSphereMesh_set_radius
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Radius of sphere. Defaults to 1.0.
set_radius ::
             (SphereMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSphereMesh_get_radius #-}

-- | Radius of sphere. Defaults to 1.0.
bindSphereMesh_get_radius :: MethodBind
bindSphereMesh_get_radius
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Radius of sphere. Defaults to 1.0.
get_radius :: (SphereMesh :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSphereMesh_set_height #-}

-- | Full height of the sphere. Defaults to 2.0.
bindSphereMesh_set_height :: MethodBind
bindSphereMesh_set_height
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Full height of the sphere. Defaults to 2.0.
set_height ::
             (SphereMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSphereMesh_get_height #-}

-- | Full height of the sphere. Defaults to 2.0.
bindSphereMesh_get_height :: MethodBind
bindSphereMesh_get_height
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Full height of the sphere. Defaults to 2.0.
get_height :: (SphereMesh :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSphereMesh_set_radial_segments #-}

-- | Number of radial segments on the sphere. Defaults to 64.
bindSphereMesh_set_radial_segments :: MethodBind
bindSphereMesh_set_radial_segments
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the sphere. Defaults to 64.
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

{-# NOINLINE bindSphereMesh_get_radial_segments #-}

-- | Number of radial segments on the sphere. Defaults to 64.
bindSphereMesh_get_radial_segments :: MethodBind
bindSphereMesh_get_radial_segments
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of radial segments on the sphere. Defaults to 64.
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

{-# NOINLINE bindSphereMesh_set_rings #-}

-- | Number of segments along the height of the sphere. Defaults to 32.
bindSphereMesh_set_rings :: MethodBind
bindSphereMesh_set_rings
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of segments along the height of the sphere. Defaults to 32.
set_rings ::
            (SphereMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_rings cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_set_rings (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSphereMesh_get_rings #-}

-- | Number of segments along the height of the sphere. Defaults to 32.
bindSphereMesh_get_rings :: MethodBind
bindSphereMesh_get_rings
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of segments along the height of the sphere. Defaults to 32.
get_rings :: (SphereMesh :< cls, Object :< cls) => cls -> IO Int
get_rings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereMesh_get_rings (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSphereMesh_set_is_hemisphere #-}

-- | Determines whether a full sphere or a hemisphere is created. Attention: To get a regular hemisphere the height and radius of the sphere have to equal. Defaults to false.
bindSphereMesh_set_is_hemisphere :: MethodBind
bindSphereMesh_set_is_hemisphere
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "set_is_hemisphere" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines whether a full sphere or a hemisphere is created. Attention: To get a regular hemisphere the height and radius of the sphere have to equal. Defaults to false.
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

{-# NOINLINE bindSphereMesh_get_is_hemisphere #-}

-- | Determines whether a full sphere or a hemisphere is created. Attention: To get a regular hemisphere the height and radius of the sphere have to equal. Defaults to false.
bindSphereMesh_get_is_hemisphere :: MethodBind
bindSphereMesh_get_is_hemisphere
  = unsafePerformIO $
      withCString "SphereMesh" $
        \ clsNamePtr ->
          withCString "get_is_hemisphere" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines whether a full sphere or a hemisphere is created. Attention: To get a regular hemisphere the height and radius of the sphere have to equal. Defaults to false.
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