{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CSGSphere
       (Godot.Core.CSGSphere.set_radius, Godot.Core.CSGSphere.get_radius,
        Godot.Core.CSGSphere.set_radial_segments,
        Godot.Core.CSGSphere.get_radial_segments,
        Godot.Core.CSGSphere.set_rings, Godot.Core.CSGSphere.get_rings,
        Godot.Core.CSGSphere.set_smooth_faces,
        Godot.Core.CSGSphere.get_smooth_faces,
        Godot.Core.CSGSphere.set_material,
        Godot.Core.CSGSphere.get_material)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCSGSphere_set_radius #-}

bindCSGSphere_set_radius :: MethodBind
bindCSGSphere_set_radius
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_radius ::
             (CSGSphere :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_set_radius (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_get_radius #-}

bindCSGSphere_get_radius :: MethodBind
bindCSGSphere_get_radius
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_radius :: (CSGSphere :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_get_radius (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_set_radial_segments #-}

bindCSGSphere_set_radial_segments :: MethodBind
bindCSGSphere_set_radial_segments
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "set_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_radial_segments ::
                      (CSGSphere :< cls, Object :< cls) => cls -> Int -> IO ()
set_radial_segments cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_set_radial_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_get_radial_segments #-}

bindCSGSphere_get_radial_segments :: MethodBind
bindCSGSphere_get_radial_segments
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "get_radial_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_radial_segments ::
                      (CSGSphere :< cls, Object :< cls) => cls -> IO Int
get_radial_segments cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_get_radial_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_set_rings #-}

bindCSGSphere_set_rings :: MethodBind
bindCSGSphere_set_rings
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "set_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rings ::
            (CSGSphere :< cls, Object :< cls) => cls -> Int -> IO ()
set_rings cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_set_rings (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_get_rings #-}

bindCSGSphere_get_rings :: MethodBind
bindCSGSphere_get_rings
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "get_rings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rings :: (CSGSphere :< cls, Object :< cls) => cls -> IO Int
get_rings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_get_rings (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_set_smooth_faces #-}

bindCSGSphere_set_smooth_faces :: MethodBind
bindCSGSphere_set_smooth_faces
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "set_smooth_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_smooth_faces ::
                   (CSGSphere :< cls, Object :< cls) => cls -> Bool -> IO ()
set_smooth_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_set_smooth_faces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_get_smooth_faces #-}

bindCSGSphere_get_smooth_faces :: MethodBind
bindCSGSphere_get_smooth_faces
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "get_smooth_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_smooth_faces ::
                   (CSGSphere :< cls, Object :< cls) => cls -> IO Bool
get_smooth_faces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_get_smooth_faces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_set_material #-}

bindCSGSphere_set_material :: MethodBind
bindCSGSphere_set_material
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_material ::
               (CSGSphere :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGSphere_get_material #-}

bindCSGSphere_get_material :: MethodBind
bindCSGSphere_get_material
  = unsafePerformIO $
      withCString "CSGSphere" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_material ::
               (CSGSphere :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGSphere_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)