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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCapsuleMesh_get_mid_height #-}

-- | Height of the capsule mesh from the center point.
bindCapsuleMesh_get_mid_height :: MethodBind
bindCapsuleMesh_get_mid_height
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "get_mid_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Height of the capsule mesh from the center point.
get_mid_height ::
                 (CapsuleMesh :< cls, Object :< cls) => cls -> IO Float
get_mid_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_get_mid_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindCapsuleMesh_set_mid_height #-}

-- | Height of the capsule mesh from the center point.
bindCapsuleMesh_set_mid_height :: MethodBind
bindCapsuleMesh_set_mid_height
  = unsafePerformIO $
      withCString "CapsuleMesh" $
        \ clsNamePtr ->
          withCString "set_mid_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Height of the capsule mesh from the center point.
set_mid_height ::
                 (CapsuleMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_mid_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleMesh_set_mid_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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