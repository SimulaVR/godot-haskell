{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ReflectionProbe
       (Godot.Core.ReflectionProbe._UPDATE_ALWAYS,
        Godot.Core.ReflectionProbe._UPDATE_ONCE,
        Godot.Core.ReflectionProbe.set_intensity,
        Godot.Core.ReflectionProbe.get_intensity,
        Godot.Core.ReflectionProbe.set_interior_ambient,
        Godot.Core.ReflectionProbe.get_interior_ambient,
        Godot.Core.ReflectionProbe.set_interior_ambient_energy,
        Godot.Core.ReflectionProbe.get_interior_ambient_energy,
        Godot.Core.ReflectionProbe.set_interior_ambient_probe_contribution,
        Godot.Core.ReflectionProbe.get_interior_ambient_probe_contribution,
        Godot.Core.ReflectionProbe.set_max_distance,
        Godot.Core.ReflectionProbe.get_max_distance,
        Godot.Core.ReflectionProbe.set_extents,
        Godot.Core.ReflectionProbe.get_extents,
        Godot.Core.ReflectionProbe.set_origin_offset,
        Godot.Core.ReflectionProbe.get_origin_offset,
        Godot.Core.ReflectionProbe.set_as_interior,
        Godot.Core.ReflectionProbe.is_set_as_interior,
        Godot.Core.ReflectionProbe.set_enable_box_projection,
        Godot.Core.ReflectionProbe.is_box_projection_enabled,
        Godot.Core.ReflectionProbe.set_enable_shadows,
        Godot.Core.ReflectionProbe.are_shadows_enabled,
        Godot.Core.ReflectionProbe.set_cull_mask,
        Godot.Core.ReflectionProbe.get_cull_mask,
        Godot.Core.ReflectionProbe.set_update_mode,
        Godot.Core.ReflectionProbe.get_update_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_UPDATE_ALWAYS :: Int
_UPDATE_ALWAYS = 1

_UPDATE_ONCE :: Int
_UPDATE_ONCE = 0

{-# NOINLINE bindReflectionProbe_set_intensity #-}

bindReflectionProbe_set_intensity :: MethodBind
bindReflectionProbe_set_intensity
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_intensity ::
                (ReflectionProbe :< cls, Object :< cls) => cls -> Float -> IO ()
set_intensity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_intensity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_intensity #-}

bindReflectionProbe_get_intensity :: MethodBind
bindReflectionProbe_get_intensity
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_intensity ::
                (ReflectionProbe :< cls, Object :< cls) => cls -> IO Float
get_intensity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_get_intensity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_interior_ambient #-}

bindReflectionProbe_set_interior_ambient :: MethodBind
bindReflectionProbe_set_interior_ambient
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_interior_ambient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_interior_ambient ::
                       (ReflectionProbe :< cls, Object :< cls) => cls -> Color -> IO ()
set_interior_ambient cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_interior_ambient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_interior_ambient #-}

bindReflectionProbe_get_interior_ambient :: MethodBind
bindReflectionProbe_get_interior_ambient
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_interior_ambient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_interior_ambient ::
                       (ReflectionProbe :< cls, Object :< cls) => cls -> IO Color
get_interior_ambient cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_get_interior_ambient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_interior_ambient_energy #-}

bindReflectionProbe_set_interior_ambient_energy :: MethodBind
bindReflectionProbe_set_interior_ambient_energy
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_interior_ambient_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_interior_ambient_energy ::
                              (ReflectionProbe :< cls, Object :< cls) => cls -> Float -> IO ()
set_interior_ambient_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindReflectionProbe_set_interior_ambient_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_interior_ambient_energy #-}

bindReflectionProbe_get_interior_ambient_energy :: MethodBind
bindReflectionProbe_get_interior_ambient_energy
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_interior_ambient_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_interior_ambient_energy ::
                              (ReflectionProbe :< cls, Object :< cls) => cls -> IO Float
get_interior_ambient_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindReflectionProbe_get_interior_ambient_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_interior_ambient_probe_contribution
             #-}

bindReflectionProbe_set_interior_ambient_probe_contribution ::
                                                            MethodBind
bindReflectionProbe_set_interior_ambient_probe_contribution
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_interior_ambient_probe_contribution" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_interior_ambient_probe_contribution ::
                                          (ReflectionProbe :< cls, Object :< cls) =>
                                          cls -> Float -> IO ()
set_interior_ambient_probe_contribution cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindReflectionProbe_set_interior_ambient_probe_contribution
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_interior_ambient_probe_contribution
             #-}

bindReflectionProbe_get_interior_ambient_probe_contribution ::
                                                            MethodBind
bindReflectionProbe_get_interior_ambient_probe_contribution
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_interior_ambient_probe_contribution" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_interior_ambient_probe_contribution ::
                                          (ReflectionProbe :< cls, Object :< cls) => cls -> IO Float
get_interior_ambient_probe_contribution cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindReflectionProbe_get_interior_ambient_probe_contribution
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_max_distance #-}

bindReflectionProbe_set_max_distance :: MethodBind
bindReflectionProbe_set_max_distance
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_max_distance ::
                   (ReflectionProbe :< cls, Object :< cls) => cls -> Float -> IO ()
set_max_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_max_distance #-}

bindReflectionProbe_get_max_distance :: MethodBind
bindReflectionProbe_get_max_distance
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max_distance ::
                   (ReflectionProbe :< cls, Object :< cls) => cls -> IO Float
get_max_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_get_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_extents #-}

bindReflectionProbe_set_extents :: MethodBind
bindReflectionProbe_set_extents
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_extents ::
              (ReflectionProbe :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_extents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_extents #-}

bindReflectionProbe_get_extents :: MethodBind
bindReflectionProbe_get_extents
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_extents ::
              (ReflectionProbe :< cls, Object :< cls) => cls -> IO Vector3
get_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_get_extents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_origin_offset #-}

bindReflectionProbe_set_origin_offset :: MethodBind
bindReflectionProbe_set_origin_offset
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_origin_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_origin_offset ::
                    (ReflectionProbe :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_origin_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_origin_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_origin_offset #-}

bindReflectionProbe_get_origin_offset :: MethodBind
bindReflectionProbe_get_origin_offset
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_origin_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_origin_offset ::
                    (ReflectionProbe :< cls, Object :< cls) => cls -> IO Vector3
get_origin_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_get_origin_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_as_interior #-}

bindReflectionProbe_set_as_interior :: MethodBind
bindReflectionProbe_set_as_interior
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_as_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_as_interior ::
                  (ReflectionProbe :< cls, Object :< cls) => cls -> Bool -> IO ()
set_as_interior cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_as_interior
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_is_set_as_interior #-}

bindReflectionProbe_is_set_as_interior :: MethodBind
bindReflectionProbe_is_set_as_interior
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "is_set_as_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_set_as_interior ::
                     (ReflectionProbe :< cls, Object :< cls) => cls -> IO Bool
is_set_as_interior cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_is_set_as_interior
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_enable_box_projection #-}

bindReflectionProbe_set_enable_box_projection :: MethodBind
bindReflectionProbe_set_enable_box_projection
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_enable_box_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_enable_box_projection ::
                            (ReflectionProbe :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enable_box_projection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindReflectionProbe_set_enable_box_projection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_is_box_projection_enabled #-}

bindReflectionProbe_is_box_projection_enabled :: MethodBind
bindReflectionProbe_is_box_projection_enabled
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "is_box_projection_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_box_projection_enabled ::
                            (ReflectionProbe :< cls, Object :< cls) => cls -> IO Bool
is_box_projection_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindReflectionProbe_is_box_projection_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_enable_shadows #-}

bindReflectionProbe_set_enable_shadows :: MethodBind
bindReflectionProbe_set_enable_shadows
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_enable_shadows" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_enable_shadows ::
                     (ReflectionProbe :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enable_shadows cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_enable_shadows
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_are_shadows_enabled #-}

bindReflectionProbe_are_shadows_enabled :: MethodBind
bindReflectionProbe_are_shadows_enabled
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "are_shadows_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

are_shadows_enabled ::
                      (ReflectionProbe :< cls, Object :< cls) => cls -> IO Bool
are_shadows_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_are_shadows_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_cull_mask #-}

bindReflectionProbe_set_cull_mask :: MethodBind
bindReflectionProbe_set_cull_mask
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cull_mask ::
                (ReflectionProbe :< cls, Object :< cls) => cls -> Int -> IO ()
set_cull_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_cull_mask #-}

bindReflectionProbe_get_cull_mask :: MethodBind
bindReflectionProbe_get_cull_mask
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cull_mask ::
                (ReflectionProbe :< cls, Object :< cls) => cls -> IO Int
get_cull_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_get_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_update_mode #-}

bindReflectionProbe_set_update_mode :: MethodBind
bindReflectionProbe_set_update_mode
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_update_mode ::
                  (ReflectionProbe :< cls, Object :< cls) => cls -> Int -> IO ()
set_update_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_update_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_update_mode #-}

bindReflectionProbe_get_update_mode :: MethodBind
bindReflectionProbe_get_update_mode
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_update_mode ::
                  (ReflectionProbe :< cls, Object :< cls) => cls -> IO Int
get_update_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_get_update_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)