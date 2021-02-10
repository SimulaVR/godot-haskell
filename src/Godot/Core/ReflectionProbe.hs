{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ReflectionProbe
       (Godot.Core.ReflectionProbe._UPDATE_ALWAYS,
        Godot.Core.ReflectionProbe._UPDATE_ONCE,
        Godot.Core.ReflectionProbe.are_shadows_enabled,
        Godot.Core.ReflectionProbe.get_cull_mask,
        Godot.Core.ReflectionProbe.get_extents,
        Godot.Core.ReflectionProbe.get_intensity,
        Godot.Core.ReflectionProbe.get_interior_ambient,
        Godot.Core.ReflectionProbe.get_interior_ambient_energy,
        Godot.Core.ReflectionProbe.get_interior_ambient_probe_contribution,
        Godot.Core.ReflectionProbe.get_max_distance,
        Godot.Core.ReflectionProbe.get_origin_offset,
        Godot.Core.ReflectionProbe.get_update_mode,
        Godot.Core.ReflectionProbe.is_box_projection_enabled,
        Godot.Core.ReflectionProbe.is_set_as_interior,
        Godot.Core.ReflectionProbe.set_as_interior,
        Godot.Core.ReflectionProbe.set_cull_mask,
        Godot.Core.ReflectionProbe.set_enable_box_projection,
        Godot.Core.ReflectionProbe.set_enable_shadows,
        Godot.Core.ReflectionProbe.set_extents,
        Godot.Core.ReflectionProbe.set_intensity,
        Godot.Core.ReflectionProbe.set_interior_ambient,
        Godot.Core.ReflectionProbe.set_interior_ambient_energy,
        Godot.Core.ReflectionProbe.set_interior_ambient_probe_contribution,
        Godot.Core.ReflectionProbe.set_max_distance,
        Godot.Core.ReflectionProbe.set_origin_offset,
        Godot.Core.ReflectionProbe.set_update_mode)
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

{-# NOINLINE bindReflectionProbe_are_shadows_enabled #-}

-- | If [code]true[/code], computes shadows in the reflection probe. This makes the reflection probe slower to render; you may want to disable this if using the [constant UPDATE_ALWAYS] [member update_mode].
bindReflectionProbe_are_shadows_enabled :: MethodBind
bindReflectionProbe_are_shadows_enabled
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "are_shadows_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], computes shadows in the reflection probe. This makes the reflection probe slower to render; you may want to disable this if using the [constant UPDATE_ALWAYS] [member update_mode].
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

{-# NOINLINE bindReflectionProbe_get_cull_mask #-}

-- | Sets the cull mask which determines what objects are drawn by this probe. Every [VisualInstance] with a layer included in this cull mask will be rendered by the probe. It is best to only include large objects which are likely to take up a lot of space in the reflection in order to save on rendering cost.
bindReflectionProbe_get_cull_mask :: MethodBind
bindReflectionProbe_get_cull_mask
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the cull mask which determines what objects are drawn by this probe. Every [VisualInstance] with a layer included in this cull mask will be rendered by the probe. It is best to only include large objects which are likely to take up a lot of space in the reflection in order to save on rendering cost.
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

{-# NOINLINE bindReflectionProbe_get_extents #-}

-- | The size of the reflection probe. The larger the extents the more space covered by the probe which will lower the perceived resolution. It is best to keep the extents only as large as you need them.
bindReflectionProbe_get_extents :: MethodBind
bindReflectionProbe_get_extents
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the reflection probe. The larger the extents the more space covered by the probe which will lower the perceived resolution. It is best to keep the extents only as large as you need them.
get_extents ::
              (ReflectionProbe :< cls, Object :< cls) => cls -> IO Vector3
get_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_get_extents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_get_intensity #-}

-- | Defines the reflection intensity. Intensity modulates the strength of the reflection.
bindReflectionProbe_get_intensity :: MethodBind
bindReflectionProbe_get_intensity
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the reflection intensity. Intensity modulates the strength of the reflection.
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

{-# NOINLINE bindReflectionProbe_get_interior_ambient #-}

-- | Sets the ambient light color to be used when this probe is set to [member interior_enable].
bindReflectionProbe_get_interior_ambient :: MethodBind
bindReflectionProbe_get_interior_ambient
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_interior_ambient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the ambient light color to be used when this probe is set to [member interior_enable].
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

{-# NOINLINE bindReflectionProbe_get_interior_ambient_energy #-}

-- | Sets the energy multiplier for this reflection probe's ambient light contribution when set to [member interior_enable].
bindReflectionProbe_get_interior_ambient_energy :: MethodBind
bindReflectionProbe_get_interior_ambient_energy
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_interior_ambient_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the energy multiplier for this reflection probe's ambient light contribution when set to [member interior_enable].
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

{-# NOINLINE bindReflectionProbe_get_interior_ambient_probe_contribution
             #-}

-- | Sets the contribution value for how much the reflection affects the ambient light for this reflection probe when set to [member interior_enable]. Useful so that ambient light matches the color of the room.
bindReflectionProbe_get_interior_ambient_probe_contribution ::
                                                            MethodBind
bindReflectionProbe_get_interior_ambient_probe_contribution
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_interior_ambient_probe_contribution" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the contribution value for how much the reflection affects the ambient light for this reflection probe when set to [member interior_enable]. Useful so that ambient light matches the color of the room.
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

{-# NOINLINE bindReflectionProbe_get_max_distance #-}

-- | Sets the max distance away from the probe an object can be before it is culled.
bindReflectionProbe_get_max_distance :: MethodBind
bindReflectionProbe_get_max_distance
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the max distance away from the probe an object can be before it is culled.
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

{-# NOINLINE bindReflectionProbe_get_origin_offset #-}

-- | Sets the origin offset to be used when this reflection probe is in box project mode.
bindReflectionProbe_get_origin_offset :: MethodBind
bindReflectionProbe_get_origin_offset
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_origin_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the origin offset to be used when this reflection probe is in box project mode.
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

{-# NOINLINE bindReflectionProbe_get_update_mode #-}

-- | Sets how frequently the probe is updated. Can be [constant UPDATE_ONCE] or [constant UPDATE_ALWAYS].
bindReflectionProbe_get_update_mode :: MethodBind
bindReflectionProbe_get_update_mode
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "get_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets how frequently the probe is updated. Can be [constant UPDATE_ONCE] or [constant UPDATE_ALWAYS].
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

{-# NOINLINE bindReflectionProbe_is_box_projection_enabled #-}

-- | If [code]true[/code], enables box projection. This makes reflections look more correct in rectangle-shaped rooms by offsetting the reflection center depending on the camera's location.
bindReflectionProbe_is_box_projection_enabled :: MethodBind
bindReflectionProbe_is_box_projection_enabled
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "is_box_projection_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables box projection. This makes reflections look more correct in rectangle-shaped rooms by offsetting the reflection center depending on the camera's location.
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

{-# NOINLINE bindReflectionProbe_is_set_as_interior #-}

-- | If [code]true[/code], reflections will ignore sky contribution. Ambient lighting is then controlled by the [code]interior_ambient_*[/code] properties.
bindReflectionProbe_is_set_as_interior :: MethodBind
bindReflectionProbe_is_set_as_interior
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "is_set_as_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], reflections will ignore sky contribution. Ambient lighting is then controlled by the [code]interior_ambient_*[/code] properties.
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

{-# NOINLINE bindReflectionProbe_set_as_interior #-}

-- | If [code]true[/code], reflections will ignore sky contribution. Ambient lighting is then controlled by the [code]interior_ambient_*[/code] properties.
bindReflectionProbe_set_as_interior :: MethodBind
bindReflectionProbe_set_as_interior
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_as_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], reflections will ignore sky contribution. Ambient lighting is then controlled by the [code]interior_ambient_*[/code] properties.
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

{-# NOINLINE bindReflectionProbe_set_cull_mask #-}

-- | Sets the cull mask which determines what objects are drawn by this probe. Every [VisualInstance] with a layer included in this cull mask will be rendered by the probe. It is best to only include large objects which are likely to take up a lot of space in the reflection in order to save on rendering cost.
bindReflectionProbe_set_cull_mask :: MethodBind
bindReflectionProbe_set_cull_mask
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the cull mask which determines what objects are drawn by this probe. Every [VisualInstance] with a layer included in this cull mask will be rendered by the probe. It is best to only include large objects which are likely to take up a lot of space in the reflection in order to save on rendering cost.
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

{-# NOINLINE bindReflectionProbe_set_enable_box_projection #-}

-- | If [code]true[/code], enables box projection. This makes reflections look more correct in rectangle-shaped rooms by offsetting the reflection center depending on the camera's location.
bindReflectionProbe_set_enable_box_projection :: MethodBind
bindReflectionProbe_set_enable_box_projection
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_enable_box_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables box projection. This makes reflections look more correct in rectangle-shaped rooms by offsetting the reflection center depending on the camera's location.
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

{-# NOINLINE bindReflectionProbe_set_enable_shadows #-}

-- | If [code]true[/code], computes shadows in the reflection probe. This makes the reflection probe slower to render; you may want to disable this if using the [constant UPDATE_ALWAYS] [member update_mode].
bindReflectionProbe_set_enable_shadows :: MethodBind
bindReflectionProbe_set_enable_shadows
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_enable_shadows" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], computes shadows in the reflection probe. This makes the reflection probe slower to render; you may want to disable this if using the [constant UPDATE_ALWAYS] [member update_mode].
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

{-# NOINLINE bindReflectionProbe_set_extents #-}

-- | The size of the reflection probe. The larger the extents the more space covered by the probe which will lower the perceived resolution. It is best to keep the extents only as large as you need them.
bindReflectionProbe_set_extents :: MethodBind
bindReflectionProbe_set_extents
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the reflection probe. The larger the extents the more space covered by the probe which will lower the perceived resolution. It is best to keep the extents only as large as you need them.
set_extents ::
              (ReflectionProbe :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReflectionProbe_set_extents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReflectionProbe_set_intensity #-}

-- | Defines the reflection intensity. Intensity modulates the strength of the reflection.
bindReflectionProbe_set_intensity :: MethodBind
bindReflectionProbe_set_intensity
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the reflection intensity. Intensity modulates the strength of the reflection.
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

{-# NOINLINE bindReflectionProbe_set_interior_ambient #-}

-- | Sets the ambient light color to be used when this probe is set to [member interior_enable].
bindReflectionProbe_set_interior_ambient :: MethodBind
bindReflectionProbe_set_interior_ambient
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_interior_ambient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the ambient light color to be used when this probe is set to [member interior_enable].
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

{-# NOINLINE bindReflectionProbe_set_interior_ambient_energy #-}

-- | Sets the energy multiplier for this reflection probe's ambient light contribution when set to [member interior_enable].
bindReflectionProbe_set_interior_ambient_energy :: MethodBind
bindReflectionProbe_set_interior_ambient_energy
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_interior_ambient_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the energy multiplier for this reflection probe's ambient light contribution when set to [member interior_enable].
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

{-# NOINLINE bindReflectionProbe_set_interior_ambient_probe_contribution
             #-}

-- | Sets the contribution value for how much the reflection affects the ambient light for this reflection probe when set to [member interior_enable]. Useful so that ambient light matches the color of the room.
bindReflectionProbe_set_interior_ambient_probe_contribution ::
                                                            MethodBind
bindReflectionProbe_set_interior_ambient_probe_contribution
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_interior_ambient_probe_contribution" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the contribution value for how much the reflection affects the ambient light for this reflection probe when set to [member interior_enable]. Useful so that ambient light matches the color of the room.
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

{-# NOINLINE bindReflectionProbe_set_max_distance #-}

-- | Sets the max distance away from the probe an object can be before it is culled.
bindReflectionProbe_set_max_distance :: MethodBind
bindReflectionProbe_set_max_distance
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the max distance away from the probe an object can be before it is culled.
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

{-# NOINLINE bindReflectionProbe_set_origin_offset #-}

-- | Sets the origin offset to be used when this reflection probe is in box project mode.
bindReflectionProbe_set_origin_offset :: MethodBind
bindReflectionProbe_set_origin_offset
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_origin_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the origin offset to be used when this reflection probe is in box project mode.
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

{-# NOINLINE bindReflectionProbe_set_update_mode #-}

-- | Sets how frequently the probe is updated. Can be [constant UPDATE_ONCE] or [constant UPDATE_ALWAYS].
bindReflectionProbe_set_update_mode :: MethodBind
bindReflectionProbe_set_update_mode
  = unsafePerformIO $
      withCString "ReflectionProbe" $
        \ clsNamePtr ->
          withCString "set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets how frequently the probe is updated. Can be [constant UPDATE_ONCE] or [constant UPDATE_ALWAYS].
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