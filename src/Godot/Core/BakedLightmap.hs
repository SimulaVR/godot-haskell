{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
        Godot.Core.BakedLightmap.bake, Godot.Core.BakedLightmap.debug_bake,
        Godot.Core.BakedLightmap.get_bake_cell_size,
        Godot.Core.BakedLightmap.get_bake_default_texels_per_unit,
        Godot.Core.BakedLightmap.get_bake_mode,
        Godot.Core.BakedLightmap.get_bake_quality,
        Godot.Core.BakedLightmap.get_capture_cell_size,
        Godot.Core.BakedLightmap.get_energy,
        Godot.Core.BakedLightmap.get_extents,
        Godot.Core.BakedLightmap.get_image_path,
        Godot.Core.BakedLightmap.get_light_data,
        Godot.Core.BakedLightmap.get_propagation,
        Godot.Core.BakedLightmap.is_hdr,
        Godot.Core.BakedLightmap.set_bake_cell_size,
        Godot.Core.BakedLightmap.set_bake_default_texels_per_unit,
        Godot.Core.BakedLightmap.set_bake_mode,
        Godot.Core.BakedLightmap.set_bake_quality,
        Godot.Core.BakedLightmap.set_capture_cell_size,
        Godot.Core.BakedLightmap.set_energy,
        Godot.Core.BakedLightmap.set_extents,
        Godot.Core.BakedLightmap.set_hdr,
        Godot.Core.BakedLightmap.set_image_path,
        Godot.Core.BakedLightmap.set_light_data,
        Godot.Core.BakedLightmap.set_propagation)
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
import Godot.Core.VisualInstance()

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

instance NodeProperty BakedLightmap "bake_cell_size" Float 'False
         where
        nodeProperty
          = (get_bake_cell_size, wrapDroppingSetter set_bake_cell_size,
             Nothing)

instance NodeProperty BakedLightmap "bake_default_texels_per_unit"
           Float
           'False
         where
        nodeProperty
          = (get_bake_default_texels_per_unit,
             wrapDroppingSetter set_bake_default_texels_per_unit, Nothing)

instance NodeProperty BakedLightmap "bake_energy" Float 'False
         where
        nodeProperty = (get_energy, wrapDroppingSetter set_energy, Nothing)

instance NodeProperty BakedLightmap "bake_extents" Vector3 'False
         where
        nodeProperty
          = (get_extents, wrapDroppingSetter set_extents, Nothing)

instance NodeProperty BakedLightmap "bake_hdr" Bool 'False where
        nodeProperty = (is_hdr, wrapDroppingSetter set_hdr, Nothing)

instance NodeProperty BakedLightmap "bake_mode" Int 'False where
        nodeProperty
          = (get_bake_mode, wrapDroppingSetter set_bake_mode, Nothing)

instance NodeProperty BakedLightmap "bake_propagation" Float 'False
         where
        nodeProperty
          = (get_propagation, wrapDroppingSetter set_propagation, Nothing)

instance NodeProperty BakedLightmap "bake_quality" Int 'False where
        nodeProperty
          = (get_bake_quality, wrapDroppingSetter set_bake_quality, Nothing)

instance NodeProperty BakedLightmap "capture_cell_size" Float
           'False
         where
        nodeProperty
          = (get_capture_cell_size, wrapDroppingSetter set_capture_cell_size,
             Nothing)

instance NodeProperty BakedLightmap "image_path" GodotString 'False
         where
        nodeProperty
          = (get_image_path, wrapDroppingSetter set_image_path, Nothing)

instance NodeProperty BakedLightmap "light_data" BakedLightmapData
           'False
         where
        nodeProperty
          = (get_light_data, wrapDroppingSetter set_light_data, Nothing)

{-# NOINLINE bindBakedLightmap_bake #-}

-- | Bakes the lightmaps within the currently edited scene. Returns a @enum BakeError@ to signify if the bake was successful, or if unsuccessful, how the bake failed.
bindBakedLightmap_bake :: MethodBind
bindBakedLightmap_bake
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bakes the lightmaps within the currently edited scene. Returns a @enum BakeError@ to signify if the bake was successful, or if unsuccessful, how the bake failed.
bake ::
       (BakedLightmap :< cls, Object :< cls) =>
       cls -> Maybe Node -> Maybe Bool -> IO Int
bake cls arg1 arg2
  = withVariantArray
      [maybe VariantNil toVariant arg1,
       maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_bake (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "bake" '[Maybe Node, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.BakedLightmap.bake

{-# NOINLINE bindBakedLightmap_debug_bake #-}

-- | Executes a dry run bake of lightmaps within the currently edited scene.
bindBakedLightmap_debug_bake :: MethodBind
bindBakedLightmap_debug_bake
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "debug_bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Executes a dry run bake of lightmaps within the currently edited scene.
debug_bake :: (BakedLightmap :< cls, Object :< cls) => cls -> IO ()
debug_bake cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_debug_bake (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "debug_bake" '[] (IO ()) where
        nodeMethod = Godot.Core.BakedLightmap.debug_bake

{-# NOINLINE bindBakedLightmap_get_bake_cell_size #-}

-- | Grid subdivision size for lightmapper calculation. The default value will work for most cases. Increase for better lighting on small details or if your scene is very large.
bindBakedLightmap_get_bake_cell_size :: MethodBind
bindBakedLightmap_get_bake_cell_size
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_bake_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grid subdivision size for lightmapper calculation. The default value will work for most cases. Increase for better lighting on small details or if your scene is very large.
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

instance NodeMethod BakedLightmap "get_bake_cell_size" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.BakedLightmap.get_bake_cell_size

{-# NOINLINE bindBakedLightmap_get_bake_default_texels_per_unit #-}

-- | If a @Mesh.lightmap_size_hint@ isn't specified, the lightmap baker will dynamically set the lightmap size using this value. This value is measured in texels per world unit. The maximum lightmap texture size is 4096x4096.
bindBakedLightmap_get_bake_default_texels_per_unit :: MethodBind
bindBakedLightmap_get_bake_default_texels_per_unit
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_bake_default_texels_per_unit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If a @Mesh.lightmap_size_hint@ isn't specified, the lightmap baker will dynamically set the lightmap size using this value. This value is measured in texels per world unit. The maximum lightmap texture size is 4096x4096.
get_bake_default_texels_per_unit ::
                                   (BakedLightmap :< cls, Object :< cls) => cls -> IO Float
get_bake_default_texels_per_unit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindBakedLightmap_get_bake_default_texels_per_unit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap
           "get_bake_default_texels_per_unit"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.BakedLightmap.get_bake_default_texels_per_unit

{-# NOINLINE bindBakedLightmap_get_bake_mode #-}

-- | Lightmapping mode. See @enum BakeMode@.
bindBakedLightmap_get_bake_mode :: MethodBind
bindBakedLightmap_get_bake_mode
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_bake_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lightmapping mode. See @enum BakeMode@.
get_bake_mode ::
                (BakedLightmap :< cls, Object :< cls) => cls -> IO Int
get_bake_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_bake_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "get_bake_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.BakedLightmap.get_bake_mode

{-# NOINLINE bindBakedLightmap_get_bake_quality #-}

-- | Three quality modes are available. Higher quality requires more rendering time. See @enum BakeQuality@.
bindBakedLightmap_get_bake_quality :: MethodBind
bindBakedLightmap_get_bake_quality
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_bake_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Three quality modes are available. Higher quality requires more rendering time. See @enum BakeQuality@.
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

instance NodeMethod BakedLightmap "get_bake_quality" '[] (IO Int)
         where
        nodeMethod = Godot.Core.BakedLightmap.get_bake_quality

{-# NOINLINE bindBakedLightmap_get_capture_cell_size #-}

-- | Grid size used for real-time capture information on dynamic objects. Cannot be larger than @bake_cell_size@.
bindBakedLightmap_get_capture_cell_size :: MethodBind
bindBakedLightmap_get_capture_cell_size
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_capture_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grid size used for real-time capture information on dynamic objects. Cannot be larger than @bake_cell_size@.
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

instance NodeMethod BakedLightmap "get_capture_cell_size" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.BakedLightmap.get_capture_cell_size

{-# NOINLINE bindBakedLightmap_get_energy #-}

-- | Multiplies the light sources' intensity by this value. For instance, if the value is set to 2, lights will be twice as bright. If the value is set to 0.5, lights will be half as bright.
bindBakedLightmap_get_energy :: MethodBind
bindBakedLightmap_get_energy
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the light sources' intensity by this value. For instance, if the value is set to 2, lights will be twice as bright. If the value is set to 0.5, lights will be half as bright.
get_energy ::
             (BakedLightmap :< cls, Object :< cls) => cls -> IO Float
get_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_energy (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "get_energy" '[] (IO Float) where
        nodeMethod = Godot.Core.BakedLightmap.get_energy

{-# NOINLINE bindBakedLightmap_get_extents #-}

-- | The size of the affected area.
bindBakedLightmap_get_extents :: MethodBind
bindBakedLightmap_get_extents
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the affected area.
get_extents ::
              (BakedLightmap :< cls, Object :< cls) => cls -> IO Vector3
get_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_get_extents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "get_extents" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.BakedLightmap.get_extents

{-# NOINLINE bindBakedLightmap_get_image_path #-}

-- | The location where lightmaps will be saved.
bindBakedLightmap_get_image_path :: MethodBind
bindBakedLightmap_get_image_path
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_image_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The location where lightmaps will be saved.
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

instance NodeMethod BakedLightmap "get_image_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.BakedLightmap.get_image_path

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

instance NodeMethod BakedLightmap "get_light_data" '[]
           (IO BakedLightmapData)
         where
        nodeMethod = Godot.Core.BakedLightmap.get_light_data

{-# NOINLINE bindBakedLightmap_get_propagation #-}

-- | Defines how far the light will travel before it is no longer effective. The higher the number, the farther the light will travel. For instance, if the value is set to 2, the light will go twice as far. If the value is set to 0.5, the light will only go half as far.
bindBakedLightmap_get_propagation :: MethodBind
bindBakedLightmap_get_propagation
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "get_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines how far the light will travel before it is no longer effective. The higher the number, the farther the light will travel. For instance, if the value is set to 2, the light will go twice as far. If the value is set to 0.5, the light will only go half as far.
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

instance NodeMethod BakedLightmap "get_propagation" '[] (IO Float)
         where
        nodeMethod = Godot.Core.BakedLightmap.get_propagation

{-# NOINLINE bindBakedLightmap_is_hdr #-}

-- | If @true@, the lightmap can capture light values greater than @1.0@. Turning this off will result in a smaller file size.
bindBakedLightmap_is_hdr :: MethodBind
bindBakedLightmap_is_hdr
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "is_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the lightmap can capture light values greater than @1.0@. Turning this off will result in a smaller file size.
is_hdr :: (BakedLightmap :< cls, Object :< cls) => cls -> IO Bool
is_hdr cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_is_hdr (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "is_hdr" '[] (IO Bool) where
        nodeMethod = Godot.Core.BakedLightmap.is_hdr

{-# NOINLINE bindBakedLightmap_set_bake_cell_size #-}

-- | Grid subdivision size for lightmapper calculation. The default value will work for most cases. Increase for better lighting on small details or if your scene is very large.
bindBakedLightmap_set_bake_cell_size :: MethodBind
bindBakedLightmap_set_bake_cell_size
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_bake_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grid subdivision size for lightmapper calculation. The default value will work for most cases. Increase for better lighting on small details or if your scene is very large.
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

instance NodeMethod BakedLightmap "set_bake_cell_size" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_bake_cell_size

{-# NOINLINE bindBakedLightmap_set_bake_default_texels_per_unit #-}

-- | If a @Mesh.lightmap_size_hint@ isn't specified, the lightmap baker will dynamically set the lightmap size using this value. This value is measured in texels per world unit. The maximum lightmap texture size is 4096x4096.
bindBakedLightmap_set_bake_default_texels_per_unit :: MethodBind
bindBakedLightmap_set_bake_default_texels_per_unit
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_bake_default_texels_per_unit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If a @Mesh.lightmap_size_hint@ isn't specified, the lightmap baker will dynamically set the lightmap size using this value. This value is measured in texels per world unit. The maximum lightmap texture size is 4096x4096.
set_bake_default_texels_per_unit ::
                                   (BakedLightmap :< cls, Object :< cls) => cls -> Float -> IO ()
set_bake_default_texels_per_unit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindBakedLightmap_set_bake_default_texels_per_unit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap
           "set_bake_default_texels_per_unit"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.BakedLightmap.set_bake_default_texels_per_unit

{-# NOINLINE bindBakedLightmap_set_bake_mode #-}

-- | Lightmapping mode. See @enum BakeMode@.
bindBakedLightmap_set_bake_mode :: MethodBind
bindBakedLightmap_set_bake_mode
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_bake_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lightmapping mode. See @enum BakeMode@.
set_bake_mode ::
                (BakedLightmap :< cls, Object :< cls) => cls -> Int -> IO ()
set_bake_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_bake_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "set_bake_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_bake_mode

{-# NOINLINE bindBakedLightmap_set_bake_quality #-}

-- | Three quality modes are available. Higher quality requires more rendering time. See @enum BakeQuality@.
bindBakedLightmap_set_bake_quality :: MethodBind
bindBakedLightmap_set_bake_quality
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_bake_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Three quality modes are available. Higher quality requires more rendering time. See @enum BakeQuality@.
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

instance NodeMethod BakedLightmap "set_bake_quality" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_bake_quality

{-# NOINLINE bindBakedLightmap_set_capture_cell_size #-}

-- | Grid size used for real-time capture information on dynamic objects. Cannot be larger than @bake_cell_size@.
bindBakedLightmap_set_capture_cell_size :: MethodBind
bindBakedLightmap_set_capture_cell_size
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_capture_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Grid size used for real-time capture information on dynamic objects. Cannot be larger than @bake_cell_size@.
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

instance NodeMethod BakedLightmap "set_capture_cell_size" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_capture_cell_size

{-# NOINLINE bindBakedLightmap_set_energy #-}

-- | Multiplies the light sources' intensity by this value. For instance, if the value is set to 2, lights will be twice as bright. If the value is set to 0.5, lights will be half as bright.
bindBakedLightmap_set_energy :: MethodBind
bindBakedLightmap_set_energy
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the light sources' intensity by this value. For instance, if the value is set to 2, lights will be twice as bright. If the value is set to 0.5, lights will be half as bright.
set_energy ::
             (BakedLightmap :< cls, Object :< cls) => cls -> Float -> IO ()
set_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_energy (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "set_energy" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_energy

{-# NOINLINE bindBakedLightmap_set_extents #-}

-- | The size of the affected area.
bindBakedLightmap_set_extents :: MethodBind
bindBakedLightmap_set_extents
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the affected area.
set_extents ::
              (BakedLightmap :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_extents (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "set_extents" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_extents

{-# NOINLINE bindBakedLightmap_set_hdr #-}

-- | If @true@, the lightmap can capture light values greater than @1.0@. Turning this off will result in a smaller file size.
bindBakedLightmap_set_hdr :: MethodBind
bindBakedLightmap_set_hdr
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the lightmap can capture light values greater than @1.0@. Turning this off will result in a smaller file size.
set_hdr ::
          (BakedLightmap :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hdr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmap_set_hdr (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BakedLightmap "set_hdr" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.BakedLightmap.set_hdr

{-# NOINLINE bindBakedLightmap_set_image_path #-}

-- | The location where lightmaps will be saved.
bindBakedLightmap_set_image_path :: MethodBind
bindBakedLightmap_set_image_path
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_image_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The location where lightmaps will be saved.
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

instance NodeMethod BakedLightmap "set_image_path" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_image_path

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

instance NodeMethod BakedLightmap "set_light_data"
           '[BakedLightmapData]
           (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_light_data

{-# NOINLINE bindBakedLightmap_set_propagation #-}

-- | Defines how far the light will travel before it is no longer effective. The higher the number, the farther the light will travel. For instance, if the value is set to 2, the light will go twice as far. If the value is set to 0.5, the light will only go half as far.
bindBakedLightmap_set_propagation :: MethodBind
bindBakedLightmap_set_propagation
  = unsafePerformIO $
      withCString "BakedLightmap" $
        \ clsNamePtr ->
          withCString "set_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines how far the light will travel before it is no longer effective. The higher the number, the farther the light will travel. For instance, if the value is set to 2, the light will go twice as far. If the value is set to 0.5, the light will only go half as far.
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

instance NodeMethod BakedLightmap "set_propagation" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.BakedLightmap.set_propagation