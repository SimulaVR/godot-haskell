{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GIProbe
       (Godot.Core.GIProbe._SUBDIV_64, Godot.Core.GIProbe._SUBDIV_256,
        Godot.Core.GIProbe._SUBDIV_MAX, Godot.Core.GIProbe._SUBDIV_128,
        Godot.Core.GIProbe._SUBDIV_512, Godot.Core.GIProbe.bake,
        Godot.Core.GIProbe.debug_bake, Godot.Core.GIProbe.get_bias,
        Godot.Core.GIProbe.get_dynamic_range,
        Godot.Core.GIProbe.get_energy, Godot.Core.GIProbe.get_extents,
        Godot.Core.GIProbe.get_normal_bias,
        Godot.Core.GIProbe.get_probe_data,
        Godot.Core.GIProbe.get_propagation, Godot.Core.GIProbe.get_subdiv,
        Godot.Core.GIProbe.is_compressed, Godot.Core.GIProbe.is_interior,
        Godot.Core.GIProbe.set_bias, Godot.Core.GIProbe.set_compress,
        Godot.Core.GIProbe.set_dynamic_range,
        Godot.Core.GIProbe.set_energy, Godot.Core.GIProbe.set_extents,
        Godot.Core.GIProbe.set_interior,
        Godot.Core.GIProbe.set_normal_bias,
        Godot.Core.GIProbe.set_probe_data,
        Godot.Core.GIProbe.set_propagation, Godot.Core.GIProbe.set_subdiv)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_SUBDIV_64 :: Int
_SUBDIV_64 = 0

_SUBDIV_256 :: Int
_SUBDIV_256 = 2

_SUBDIV_MAX :: Int
_SUBDIV_MAX = 4

_SUBDIV_128 :: Int
_SUBDIV_128 = 1

_SUBDIV_512 :: Int
_SUBDIV_512 = 3

{-# NOINLINE bindGIProbe_bake #-}

-- | Bakes the effect from all [GeometryInstance]s marked with [member GeometryInstance.use_in_baked_light] and [Light]s marked with either [constant Light.BAKE_INDIRECT] or [constant Light.BAKE_ALL]. If [code]create_visual_debug[/code] is [code]true[/code], after baking the light, this will generate a [MultiMesh] that has a cube representing each solid cell with each cube colored to the cell's albedo color. This can be used to visualize the [GIProbe]'s data and debug any issues that may be occurring.
bindGIProbe_bake :: MethodBind
bindGIProbe_bake
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bakes the effect from all [GeometryInstance]s marked with [member GeometryInstance.use_in_baked_light] and [Light]s marked with either [constant Light.BAKE_INDIRECT] or [constant Light.BAKE_ALL]. If [code]create_visual_debug[/code] is [code]true[/code], after baking the light, this will generate a [MultiMesh] that has a cube representing each solid cell with each cube colored to the cell's albedo color. This can be used to visualize the [GIProbe]'s data and debug any issues that may be occurring.
bake ::
       (GIProbe :< cls, Object :< cls) => cls -> Node -> Bool -> IO ()
bake cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_bake (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_debug_bake #-}

-- | Calls [method bake] with [code]create_visual_debug[/code] enabled.
bindGIProbe_debug_bake :: MethodBind
bindGIProbe_debug_bake
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "debug_bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls [method bake] with [code]create_visual_debug[/code] enabled.
debug_bake :: (GIProbe :< cls, Object :< cls) => cls -> IO ()
debug_bake cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_debug_bake (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_get_bias #-}

-- | Offsets the lookup of the light contribution from the [GIProbe]. This can be used to avoid self-shadowing, but may introduce light leaking at higher values. This and [member normal_bias] should be played around with to minimize self-shadowing and light leaking.
--   			[b]Note:[/b] [code]bias[/code] should usually be above 1.0 as that is the size of the voxels.
bindGIProbe_get_bias :: MethodBind
bindGIProbe_get_bias
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "get_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Offsets the lookup of the light contribution from the [GIProbe]. This can be used to avoid self-shadowing, but may introduce light leaking at higher values. This and [member normal_bias] should be played around with to minimize self-shadowing and light leaking.
--   			[b]Note:[/b] [code]bias[/code] should usually be above 1.0 as that is the size of the voxels.
get_bias :: (GIProbe :< cls, Object :< cls) => cls -> IO Float
get_bias cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_get_bias (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_get_dynamic_range #-}

-- | The maximum brightness that the [GIProbe] will recognize. Brightness will be scaled within this range.
bindGIProbe_get_dynamic_range :: MethodBind
bindGIProbe_get_dynamic_range
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "get_dynamic_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum brightness that the [GIProbe] will recognize. Brightness will be scaled within this range.
get_dynamic_range ::
                    (GIProbe :< cls, Object :< cls) => cls -> IO Int
get_dynamic_range cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_get_dynamic_range (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_get_energy #-}

-- | Energy multiplier. Makes the lighting contribution from the [GIProbe] brighter.
bindGIProbe_get_energy :: MethodBind
bindGIProbe_get_energy
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Energy multiplier. Makes the lighting contribution from the [GIProbe] brighter.
get_energy :: (GIProbe :< cls, Object :< cls) => cls -> IO Float
get_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_get_energy (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_get_extents #-}

-- | The size of the area covered by the [GIProbe]. If you make the extents larger without increasing the subdivisions with [member subdiv], the size of each cell will increase and result in lower detailed lighting.
bindGIProbe_get_extents :: MethodBind
bindGIProbe_get_extents
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "get_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the area covered by the [GIProbe]. If you make the extents larger without increasing the subdivisions with [member subdiv], the size of each cell will increase and result in lower detailed lighting.
get_extents :: (GIProbe :< cls, Object :< cls) => cls -> IO Vector3
get_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_get_extents (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_get_normal_bias #-}

-- | Offsets the lookup into the [GIProbe] based on the object's normal direction. Can be used to reduce some self-shadowing artifacts.
bindGIProbe_get_normal_bias :: MethodBind
bindGIProbe_get_normal_bias
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "get_normal_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Offsets the lookup into the [GIProbe] based on the object's normal direction. Can be used to reduce some self-shadowing artifacts.
get_normal_bias ::
                  (GIProbe :< cls, Object :< cls) => cls -> IO Float
get_normal_bias cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_get_normal_bias (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_get_probe_data #-}

-- | The [GIProbeData] resource that holds the data for this [GIProbe].
bindGIProbe_get_probe_data :: MethodBind
bindGIProbe_get_probe_data
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "get_probe_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [GIProbeData] resource that holds the data for this [GIProbe].
get_probe_data ::
                 (GIProbe :< cls, Object :< cls) => cls -> IO GIProbeData
get_probe_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_get_probe_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_get_propagation #-}

-- | How much light propagates through the probe internally. A higher value allows light to spread further.
bindGIProbe_get_propagation :: MethodBind
bindGIProbe_get_propagation
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "get_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much light propagates through the probe internally. A higher value allows light to spread further.
get_propagation ::
                  (GIProbe :< cls, Object :< cls) => cls -> IO Float
get_propagation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_get_propagation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_get_subdiv #-}

-- | Number of times to subdivide the grid that the [GIProbe] operates on. A higher number results in finer detail and thus higher visual quality, while lower numbers result in better performance.
bindGIProbe_get_subdiv :: MethodBind
bindGIProbe_get_subdiv
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "get_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of times to subdivide the grid that the [GIProbe] operates on. A higher number results in finer detail and thus higher visual quality, while lower numbers result in better performance.
get_subdiv :: (GIProbe :< cls, Object :< cls) => cls -> IO Int
get_subdiv cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_get_subdiv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_is_compressed #-}

-- | If [code]true[/code], the data for this [GIProbe] will be compressed. Compression saves space, but results in far worse visual quality.
bindGIProbe_is_compressed :: MethodBind
bindGIProbe_is_compressed
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "is_compressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the data for this [GIProbe] will be compressed. Compression saves space, but results in far worse visual quality.
is_compressed :: (GIProbe :< cls, Object :< cls) => cls -> IO Bool
is_compressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_is_compressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_is_interior #-}

-- | If [code]true[/code], ignores the sky contribution when calculating lighting.
bindGIProbe_is_interior :: MethodBind
bindGIProbe_is_interior
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "is_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], ignores the sky contribution when calculating lighting.
is_interior :: (GIProbe :< cls, Object :< cls) => cls -> IO Bool
is_interior cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_is_interior (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_bias #-}

-- | Offsets the lookup of the light contribution from the [GIProbe]. This can be used to avoid self-shadowing, but may introduce light leaking at higher values. This and [member normal_bias] should be played around with to minimize self-shadowing and light leaking.
--   			[b]Note:[/b] [code]bias[/code] should usually be above 1.0 as that is the size of the voxels.
bindGIProbe_set_bias :: MethodBind
bindGIProbe_set_bias
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Offsets the lookup of the light contribution from the [GIProbe]. This can be used to avoid self-shadowing, but may introduce light leaking at higher values. This and [member normal_bias] should be played around with to minimize self-shadowing and light leaking.
--   			[b]Note:[/b] [code]bias[/code] should usually be above 1.0 as that is the size of the voxels.
set_bias ::
           (GIProbe :< cls, Object :< cls) => cls -> Float -> IO ()
set_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_bias (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_compress #-}

-- | If [code]true[/code], the data for this [GIProbe] will be compressed. Compression saves space, but results in far worse visual quality.
bindGIProbe_set_compress :: MethodBind
bindGIProbe_set_compress
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_compress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the data for this [GIProbe] will be compressed. Compression saves space, but results in far worse visual quality.
set_compress ::
               (GIProbe :< cls, Object :< cls) => cls -> Bool -> IO ()
set_compress cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_compress (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_dynamic_range #-}

-- | The maximum brightness that the [GIProbe] will recognize. Brightness will be scaled within this range.
bindGIProbe_set_dynamic_range :: MethodBind
bindGIProbe_set_dynamic_range
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_dynamic_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum brightness that the [GIProbe] will recognize. Brightness will be scaled within this range.
set_dynamic_range ::
                    (GIProbe :< cls, Object :< cls) => cls -> Int -> IO ()
set_dynamic_range cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_dynamic_range (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_energy #-}

-- | Energy multiplier. Makes the lighting contribution from the [GIProbe] brighter.
bindGIProbe_set_energy :: MethodBind
bindGIProbe_set_energy
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Energy multiplier. Makes the lighting contribution from the [GIProbe] brighter.
set_energy ::
             (GIProbe :< cls, Object :< cls) => cls -> Float -> IO ()
set_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_energy (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_extents #-}

-- | The size of the area covered by the [GIProbe]. If you make the extents larger without increasing the subdivisions with [member subdiv], the size of each cell will increase and result in lower detailed lighting.
bindGIProbe_set_extents :: MethodBind
bindGIProbe_set_extents
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the area covered by the [GIProbe]. If you make the extents larger without increasing the subdivisions with [member subdiv], the size of each cell will increase and result in lower detailed lighting.
set_extents ::
              (GIProbe :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_extents (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_interior #-}

-- | If [code]true[/code], ignores the sky contribution when calculating lighting.
bindGIProbe_set_interior :: MethodBind
bindGIProbe_set_interior
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], ignores the sky contribution when calculating lighting.
set_interior ::
               (GIProbe :< cls, Object :< cls) => cls -> Bool -> IO ()
set_interior cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_interior (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_normal_bias #-}

-- | Offsets the lookup into the [GIProbe] based on the object's normal direction. Can be used to reduce some self-shadowing artifacts.
bindGIProbe_set_normal_bias :: MethodBind
bindGIProbe_set_normal_bias
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_normal_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Offsets the lookup into the [GIProbe] based on the object's normal direction. Can be used to reduce some self-shadowing artifacts.
set_normal_bias ::
                  (GIProbe :< cls, Object :< cls) => cls -> Float -> IO ()
set_normal_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_normal_bias (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_probe_data #-}

-- | The [GIProbeData] resource that holds the data for this [GIProbe].
bindGIProbe_set_probe_data :: MethodBind
bindGIProbe_set_probe_data
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_probe_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [GIProbeData] resource that holds the data for this [GIProbe].
set_probe_data ::
                 (GIProbe :< cls, Object :< cls) => cls -> GIProbeData -> IO ()
set_probe_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_probe_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_propagation #-}

-- | How much light propagates through the probe internally. A higher value allows light to spread further.
bindGIProbe_set_propagation :: MethodBind
bindGIProbe_set_propagation
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How much light propagates through the probe internally. A higher value allows light to spread further.
set_propagation ::
                  (GIProbe :< cls, Object :< cls) => cls -> Float -> IO ()
set_propagation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_propagation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbe_set_subdiv #-}

-- | Number of times to subdivide the grid that the [GIProbe] operates on. A higher number results in finer detail and thus higher visual quality, while lower numbers result in better performance.
bindGIProbe_set_subdiv :: MethodBind
bindGIProbe_set_subdiv
  = unsafePerformIO $
      withCString "GIProbe" $
        \ clsNamePtr ->
          withCString "set_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of times to subdivide the grid that the [GIProbe] operates on. A higher number results in finer detail and thus higher visual quality, while lower numbers result in better performance.
set_subdiv ::
             (GIProbe :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdiv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbe_set_subdiv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)