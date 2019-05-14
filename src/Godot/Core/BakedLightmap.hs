{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.BakedLightmap
       (Godot.Core.BakedLightmap._BAKE_QUALITY_LOW,
        Godot.Core.BakedLightmap._BAKE_QUALITY_MEDIUM,
        Godot.Core.BakedLightmap._BAKE_ERROR_CANT_CREATE_IMAGE,
        Godot.Core.BakedLightmap._BAKE_ERROR_NO_MESHES,
        Godot.Core.BakedLightmap._BAKE_ERROR_OK,
        Godot.Core.BakedLightmap._BAKE_MODE_CONE_TRACE,
        Godot.Core.BakedLightmap._BAKE_MODE_RAY_TRACE,
        Godot.Core.BakedLightmap._BAKE_ERROR_NO_SAVE_PATH,
        Godot.Core.BakedLightmap._BAKE_ERROR_USER_ABORTED,
        Godot.Core.BakedLightmap._BAKE_QUALITY_HIGH,
        Godot.Core.BakedLightmap.set_light_data,
        Godot.Core.BakedLightmap.get_light_data,
        Godot.Core.BakedLightmap.set_bake_cell_size,
        Godot.Core.BakedLightmap.get_bake_cell_size,
        Godot.Core.BakedLightmap.set_capture_cell_size,
        Godot.Core.BakedLightmap.get_capture_cell_size,
        Godot.Core.BakedLightmap.set_bake_quality,
        Godot.Core.BakedLightmap.get_bake_quality,
        Godot.Core.BakedLightmap.set_bake_mode,
        Godot.Core.BakedLightmap.get_bake_mode,
        Godot.Core.BakedLightmap.set_extents,
        Godot.Core.BakedLightmap.get_extents,
        Godot.Core.BakedLightmap.set_propagation,
        Godot.Core.BakedLightmap.get_propagation,
        Godot.Core.BakedLightmap.set_energy,
        Godot.Core.BakedLightmap.get_energy,
        Godot.Core.BakedLightmap.set_hdr, Godot.Core.BakedLightmap.is_hdr,
        Godot.Core.BakedLightmap.set_image_path,
        Godot.Core.BakedLightmap.get_image_path,
        Godot.Core.BakedLightmap.bake, Godot.Core.BakedLightmap.debug_bake)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_BAKE_QUALITY_LOW :: Int
_BAKE_QUALITY_LOW = 0

_BAKE_QUALITY_MEDIUM :: Int
_BAKE_QUALITY_MEDIUM = 1

_BAKE_ERROR_CANT_CREATE_IMAGE :: Int
_BAKE_ERROR_CANT_CREATE_IMAGE = 3

_BAKE_ERROR_NO_MESHES :: Int
_BAKE_ERROR_NO_MESHES = 2

_BAKE_ERROR_OK :: Int
_BAKE_ERROR_OK = 0

_BAKE_MODE_CONE_TRACE :: Int
_BAKE_MODE_CONE_TRACE = 0

_BAKE_MODE_RAY_TRACE :: Int
_BAKE_MODE_RAY_TRACE = 1

_BAKE_ERROR_NO_SAVE_PATH :: Int
_BAKE_ERROR_NO_SAVE_PATH = 1

_BAKE_ERROR_USER_ABORTED :: Int
_BAKE_ERROR_USER_ABORTED = 4

_BAKE_QUALITY_HIGH :: Int
_BAKE_QUALITY_HIGH = 2

{-# NOINLINE bindBakedLightmap_set_light_data #-}

-- | The calculated light data.
bindBakedLightmap_set_light_data :: MethodBind
bindBakedLightmap_set_light_data
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_light_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The calculated light data.
set_light_data ::
                 (BakedLightmap :< cls, Object :< cls) =>
                 cls -> BakedLightmapData -> IO ()
set_light_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_light_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_light_data #-}

-- | The calculated light data.
bindBakedLightmap_get_light_data :: MethodBind
bindBakedLightmap_get_light_data
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_light_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The calculated light data.
get_light_data ::
                 (BakedLightmap :< cls, Object :< cls) =>
                 cls -> IO BakedLightmapData
get_light_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_light_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_bake_cell_size #-}

-- | Grid subdivision size for lightmapper calculation. Default value of [code]0.25[/code] will work for most cases. Increase for better lighting on small details or if your scene is very large.
bindBakedLightmap_set_bake_cell_size :: MethodBind
bindBakedLightmap_set_bake_cell_size
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_bake_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grid subdivision size for lightmapper calculation. Default value of [code]0.25[/code] will work for most cases. Increase for better lighting on small details or if your scene is very large.
set_bake_cell_size ::
                     (BakedLightmap :< cls, Object :< cls) => cls -> Float -> IO ()
set_bake_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_bake_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_bake_cell_size #-}

-- | Grid subdivision size for lightmapper calculation. Default value of [code]0.25[/code] will work for most cases. Increase for better lighting on small details or if your scene is very large.
bindBakedLightmap_get_bake_cell_size :: MethodBind
bindBakedLightmap_get_bake_cell_size
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_bake_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grid subdivision size for lightmapper calculation. Default value of [code]0.25[/code] will work for most cases. Increase for better lighting on small details or if your scene is very large.
get_bake_cell_size ::
                     (BakedLightmap :< cls, Object :< cls) => cls -> IO Float
get_bake_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_bake_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_capture_cell_size #-}

-- | Grid size used for real-time capture information on dynamic objects. Cannot be larger than [member bake_cell_size].
bindBakedLightmap_set_capture_cell_size :: MethodBind
bindBakedLightmap_set_capture_cell_size
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_capture_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grid size used for real-time capture information on dynamic objects. Cannot be larger than [member bake_cell_size].
set_capture_cell_size ::
                        (BakedLightmap :< cls, Object :< cls) => cls -> Float -> IO ()
set_capture_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_capture_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_capture_cell_size #-}

-- | Grid size used for real-time capture information on dynamic objects. Cannot be larger than [member bake_cell_size].
bindBakedLightmap_get_capture_cell_size :: MethodBind
bindBakedLightmap_get_capture_cell_size
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_capture_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grid size used for real-time capture information on dynamic objects. Cannot be larger than [member bake_cell_size].
get_capture_cell_size ::
                        (BakedLightmap :< cls, Object :< cls) => cls -> IO Float
get_capture_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_capture_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_bake_quality #-}

-- | Three quality modes are available. Higher quality requires more rendering time. See [enum BakeQuality].
bindBakedLightmap_set_bake_quality :: MethodBind
bindBakedLightmap_set_bake_quality
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_bake_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Three quality modes are available. Higher quality requires more rendering time. See [enum BakeQuality].
set_bake_quality ::
                   (BakedLightmap :< cls, Object :< cls) => cls -> Int -> IO ()
set_bake_quality cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_bake_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_bake_quality #-}

-- | Three quality modes are available. Higher quality requires more rendering time. See [enum BakeQuality].
bindBakedLightmap_get_bake_quality :: MethodBind
bindBakedLightmap_get_bake_quality
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_bake_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Three quality modes are available. Higher quality requires more rendering time. See [enum BakeQuality].
get_bake_quality ::
                   (BakedLightmap :< cls, Object :< cls) => cls -> IO Int
get_bake_quality cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_bake_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_bake_mode #-}

-- | Lightmapping mode. See [enum BakeMode].
bindBakedLightmap_set_bake_mode :: MethodBind
bindBakedLightmap_set_bake_mode
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_bake_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lightmapping mode. See [enum BakeMode].
set_bake_mode ::
                (BakedLightmap :< cls, Object :< cls) => cls -> Int -> IO ()
set_bake_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_bake_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_bake_mode #-}

-- | Lightmapping mode. See [enum BakeMode].
bindBakedLightmap_get_bake_mode :: MethodBind
bindBakedLightmap_get_bake_mode
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_bake_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lightmapping mode. See [enum BakeMode].
get_bake_mode ::
                (BakedLightmap :< cls, Object :< cls) => cls -> IO Int
get_bake_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_bake_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_extents #-}

-- | Size of affected area.
bindBakedLightmap_set_extents :: MethodBind
bindBakedLightmap_set_extents
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of affected area.
set_extents ::
              (BakedLightmap :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_extents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_extents #-}

-- | Size of affected area.
bindBakedLightmap_get_extents :: MethodBind
bindBakedLightmap_get_extents
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of affected area.
get_extents ::
              (BakedLightmap :< cls, Object :< cls) => cls -> IO Vector3
get_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_extents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_propagation #-}

bindBakedLightmap_set_propagation :: MethodBind
bindBakedLightmap_set_propagation
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_propagation ::
                  (BakedLightmap :< cls, Object :< cls) => cls -> Float -> IO ()
set_propagation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_propagation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_propagation #-}

bindBakedLightmap_get_propagation :: MethodBind
bindBakedLightmap_get_propagation
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_propagation ::
                  (BakedLightmap :< cls, Object :< cls) => cls -> IO Float
get_propagation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_propagation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_energy #-}

bindBakedLightmap_set_energy :: MethodBind
bindBakedLightmap_set_energy
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_energy ::
             (BakedLightmap :< cls, Object :< cls) => cls -> Float -> IO ()
set_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_energy (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_energy #-}

bindBakedLightmap_get_energy :: MethodBind
bindBakedLightmap_get_energy
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_energy ::
             (BakedLightmap :< cls, Object :< cls) => cls -> IO Float
get_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_energy (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_hdr #-}

-- | If [code]true[/code], lightmap can capture light values greater than [code]1.0[/code]. Turning this off will result in a smaller lightmap. Default value:[code]false[/code].
bindBakedLightmap_set_hdr :: MethodBind
bindBakedLightmap_set_hdr
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], lightmap can capture light values greater than [code]1.0[/code]. Turning this off will result in a smaller lightmap. Default value:[code]false[/code].
set_hdr ::
          (BakedLightmap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hdr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_hdr (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_is_hdr #-}

-- | If [code]true[/code], lightmap can capture light values greater than [code]1.0[/code]. Turning this off will result in a smaller lightmap. Default value:[code]false[/code].
bindBakedLightmap_is_hdr :: MethodBind
bindBakedLightmap_is_hdr
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "is_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], lightmap can capture light values greater than [code]1.0[/code]. Turning this off will result in a smaller lightmap. Default value:[code]false[/code].
is_hdr :: (BakedLightmap :< cls, Object :< cls) => cls -> IO Bool
is_hdr cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_is_hdr (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_set_image_path #-}

-- | Location where lightmaps will be saved.
bindBakedLightmap_set_image_path :: MethodBind
bindBakedLightmap_set_image_path
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_image_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Location where lightmaps will be saved.
set_image_path ::
                 (BakedLightmap :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
set_image_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_image_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_get_image_path #-}

-- | Location where lightmaps will be saved.
bindBakedLightmap_get_image_path :: MethodBind
bindBakedLightmap_get_image_path
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_image_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Location where lightmaps will be saved.
get_image_path ::
                 (BakedLightmap :< cls, Object :< cls) => cls -> IO GodotString
get_image_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_image_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_bake #-}

bindBakedLightmap_bake :: MethodBind
bindBakedLightmap_bake
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bake ::
       (BakedLightmap :< cls, Object :< cls) =>
       cls -> Node -> Bool -> IO Int
bake cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_bake (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmap_debug_bake #-}

bindBakedLightmap_debug_bake :: MethodBind
bindBakedLightmap_debug_bake
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "debug_bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

debug_bake :: (BakedLightmap :< cls, Object :< cls) => cls -> IO ()
debug_bake cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_debug_bake (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)