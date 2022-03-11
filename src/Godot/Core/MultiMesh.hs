{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MultiMesh
       (Godot.Core.MultiMesh._CUSTOM_DATA_8BIT,
        Godot.Core.MultiMesh._TRANSFORM_3D,
        Godot.Core.MultiMesh._COLOR_NONE,
        Godot.Core.MultiMesh._COLOR_FLOAT,
        Godot.Core.MultiMesh._TRANSFORM_2D,
        Godot.Core.MultiMesh._COLOR_8BIT,
        Godot.Core.MultiMesh._CUSTOM_DATA_FLOAT,
        Godot.Core.MultiMesh._CUSTOM_DATA_NONE,
        Godot.Core.MultiMesh._get_color_array,
        Godot.Core.MultiMesh._get_custom_data_array,
        Godot.Core.MultiMesh._get_transform_2d_array,
        Godot.Core.MultiMesh._get_transform_array,
        Godot.Core.MultiMesh._set_color_array,
        Godot.Core.MultiMesh._set_custom_data_array,
        Godot.Core.MultiMesh._set_transform_2d_array,
        Godot.Core.MultiMesh._set_transform_array,
        Godot.Core.MultiMesh.get_aabb,
        Godot.Core.MultiMesh.get_color_format,
        Godot.Core.MultiMesh.get_custom_data_format,
        Godot.Core.MultiMesh.get_instance_color,
        Godot.Core.MultiMesh.get_instance_count,
        Godot.Core.MultiMesh.get_instance_custom_data,
        Godot.Core.MultiMesh.get_instance_transform,
        Godot.Core.MultiMesh.get_instance_transform_2d,
        Godot.Core.MultiMesh.get_mesh,
        Godot.Core.MultiMesh.get_transform_format,
        Godot.Core.MultiMesh.get_visible_instance_count,
        Godot.Core.MultiMesh.set_as_bulk_array,
        Godot.Core.MultiMesh.set_color_format,
        Godot.Core.MultiMesh.set_custom_data_format,
        Godot.Core.MultiMesh.set_instance_color,
        Godot.Core.MultiMesh.set_instance_count,
        Godot.Core.MultiMesh.set_instance_custom_data,
        Godot.Core.MultiMesh.set_instance_transform,
        Godot.Core.MultiMesh.set_instance_transform_2d,
        Godot.Core.MultiMesh.set_mesh,
        Godot.Core.MultiMesh.set_transform_format,
        Godot.Core.MultiMesh.set_visible_instance_count)
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
import Godot.Core.Resource()

_CUSTOM_DATA_8BIT :: Int
_CUSTOM_DATA_8BIT = 1

_TRANSFORM_3D :: Int
_TRANSFORM_3D = 1

_COLOR_NONE :: Int
_COLOR_NONE = 0

_COLOR_FLOAT :: Int
_COLOR_FLOAT = 2

_TRANSFORM_2D :: Int
_TRANSFORM_2D = 0

_COLOR_8BIT :: Int
_COLOR_8BIT = 1

_CUSTOM_DATA_FLOAT :: Int
_CUSTOM_DATA_FLOAT = 2

_CUSTOM_DATA_NONE :: Int
_CUSTOM_DATA_NONE = 0

instance NodeProperty MultiMesh "color_array" PoolColorArray 'False
         where
        nodeProperty
          = (_get_color_array, wrapDroppingSetter _set_color_array, Nothing)

instance NodeProperty MultiMesh "color_format" Int 'False where
        nodeProperty
          = (get_color_format, wrapDroppingSetter set_color_format, Nothing)

instance NodeProperty MultiMesh "custom_data_array" PoolColorArray
           'False
         where
        nodeProperty
          = (_get_custom_data_array,
             wrapDroppingSetter _set_custom_data_array, Nothing)

instance NodeProperty MultiMesh "custom_data_format" Int 'False
         where
        nodeProperty
          = (get_custom_data_format,
             wrapDroppingSetter set_custom_data_format, Nothing)

instance NodeProperty MultiMesh "instance_count" Int 'False where
        nodeProperty
          = (get_instance_count, wrapDroppingSetter set_instance_count,
             Nothing)

instance NodeProperty MultiMesh "mesh" Mesh 'False where
        nodeProperty = (get_mesh, wrapDroppingSetter set_mesh, Nothing)

instance NodeProperty MultiMesh "transform_2d_array"
           PoolVector2Array
           'False
         where
        nodeProperty
          = (_get_transform_2d_array,
             wrapDroppingSetter _set_transform_2d_array, Nothing)

instance NodeProperty MultiMesh "transform_array" PoolVector3Array
           'False
         where
        nodeProperty
          = (_get_transform_array, wrapDroppingSetter _set_transform_array,
             Nothing)

instance NodeProperty MultiMesh "transform_format" Int 'False where
        nodeProperty
          = (get_transform_format, wrapDroppingSetter set_transform_format,
             Nothing)

instance NodeProperty MultiMesh "visible_instance_count" Int 'False
         where
        nodeProperty
          = (get_visible_instance_count,
             wrapDroppingSetter set_visible_instance_count, Nothing)

{-# NOINLINE bindMultiMesh__get_color_array #-}

bindMultiMesh__get_color_array :: MethodBind
bindMultiMesh__get_color_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "_get_color_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_color_array ::
                   (MultiMesh :< cls, Object :< cls) => cls -> IO PoolColorArray
_get_color_array cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh__get_color_array (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "_get_color_array" '[]
           (IO PoolColorArray)
         where
        nodeMethod = Godot.Core.MultiMesh._get_color_array

{-# NOINLINE bindMultiMesh__get_custom_data_array #-}

bindMultiMesh__get_custom_data_array :: MethodBind
bindMultiMesh__get_custom_data_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "_get_custom_data_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_custom_data_array ::
                         (MultiMesh :< cls, Object :< cls) => cls -> IO PoolColorArray
_get_custom_data_array cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh__get_custom_data_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "_get_custom_data_array" '[]
           (IO PoolColorArray)
         where
        nodeMethod = Godot.Core.MultiMesh._get_custom_data_array

{-# NOINLINE bindMultiMesh__get_transform_2d_array #-}

bindMultiMesh__get_transform_2d_array :: MethodBind
bindMultiMesh__get_transform_2d_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "_get_transform_2d_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_transform_2d_array ::
                          (MultiMesh :< cls, Object :< cls) => cls -> IO PoolVector2Array
_get_transform_2d_array cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh__get_transform_2d_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "_get_transform_2d_array" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.MultiMesh._get_transform_2d_array

{-# NOINLINE bindMultiMesh__get_transform_array #-}

bindMultiMesh__get_transform_array :: MethodBind
bindMultiMesh__get_transform_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "_get_transform_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_transform_array ::
                       (MultiMesh :< cls, Object :< cls) => cls -> IO PoolVector3Array
_get_transform_array cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh__get_transform_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "_get_transform_array" '[]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.MultiMesh._get_transform_array

{-# NOINLINE bindMultiMesh__set_color_array #-}

bindMultiMesh__set_color_array :: MethodBind
bindMultiMesh__set_color_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "_set_color_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_color_array ::
                   (MultiMesh :< cls, Object :< cls) => cls -> PoolColorArray -> IO ()
_set_color_array cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh__set_color_array (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "_set_color_array" '[PoolColorArray]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh._set_color_array

{-# NOINLINE bindMultiMesh__set_custom_data_array #-}

bindMultiMesh__set_custom_data_array :: MethodBind
bindMultiMesh__set_custom_data_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "_set_custom_data_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_custom_data_array ::
                         (MultiMesh :< cls, Object :< cls) => cls -> PoolColorArray -> IO ()
_set_custom_data_array cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh__set_custom_data_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "_set_custom_data_array"
           '[PoolColorArray]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh._set_custom_data_array

{-# NOINLINE bindMultiMesh__set_transform_2d_array #-}

bindMultiMesh__set_transform_2d_array :: MethodBind
bindMultiMesh__set_transform_2d_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "_set_transform_2d_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_transform_2d_array ::
                          (MultiMesh :< cls, Object :< cls) =>
                          cls -> PoolVector2Array -> IO ()
_set_transform_2d_array cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh__set_transform_2d_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "_set_transform_2d_array"
           '[PoolVector2Array]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh._set_transform_2d_array

{-# NOINLINE bindMultiMesh__set_transform_array #-}

bindMultiMesh__set_transform_array :: MethodBind
bindMultiMesh__set_transform_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "_set_transform_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_transform_array ::
                       (MultiMesh :< cls, Object :< cls) =>
                       cls -> PoolVector3Array -> IO ()
_set_transform_array cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh__set_transform_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "_set_transform_array"
           '[PoolVector3Array]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh._set_transform_array

{-# NOINLINE bindMultiMesh_get_aabb #-}

-- | Returns the visibility axis-aligned bounding box in local space. See also @method VisualInstance.get_transformed_aabb@.
bindMultiMesh_get_aabb :: MethodBind
bindMultiMesh_get_aabb
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the visibility axis-aligned bounding box in local space. See also @method VisualInstance.get_transformed_aabb@.
get_aabb :: (MultiMesh :< cls, Object :< cls) => cls -> IO Aabb
get_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_aabb (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_aabb" '[] (IO Aabb) where
        nodeMethod = Godot.Core.MultiMesh.get_aabb

{-# NOINLINE bindMultiMesh_get_color_format #-}

-- | Format of colors in color array that gets passed to shader.
bindMultiMesh_get_color_format :: MethodBind
bindMultiMesh_get_color_format
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_color_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Format of colors in color array that gets passed to shader.
get_color_format ::
                   (MultiMesh :< cls, Object :< cls) => cls -> IO Int
get_color_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_color_format (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_color_format" '[] (IO Int) where
        nodeMethod = Godot.Core.MultiMesh.get_color_format

{-# NOINLINE bindMultiMesh_get_custom_data_format #-}

-- | Format of custom data in custom data array that gets passed to shader.
bindMultiMesh_get_custom_data_format :: MethodBind
bindMultiMesh_get_custom_data_format
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_custom_data_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Format of custom data in custom data array that gets passed to shader.
get_custom_data_format ::
                         (MultiMesh :< cls, Object :< cls) => cls -> IO Int
get_custom_data_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_custom_data_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_custom_data_format" '[] (IO Int)
         where
        nodeMethod = Godot.Core.MultiMesh.get_custom_data_format

{-# NOINLINE bindMultiMesh_get_instance_color #-}

-- | Gets a specific instance's color.
bindMultiMesh_get_instance_color :: MethodBind
bindMultiMesh_get_instance_color
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_instance_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a specific instance's color.
get_instance_color ::
                     (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO Color
get_instance_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_instance_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_instance_color" '[Int]
           (IO Color)
         where
        nodeMethod = Godot.Core.MultiMesh.get_instance_color

{-# NOINLINE bindMultiMesh_get_instance_count #-}

-- | Number of instances that will get drawn. This clears and (re)sizes the buffers. By default, all instances are drawn but you can limit this with @visible_instance_count@.
bindMultiMesh_get_instance_count :: MethodBind
bindMultiMesh_get_instance_count
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_instance_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of instances that will get drawn. This clears and (re)sizes the buffers. By default, all instances are drawn but you can limit this with @visible_instance_count@.
get_instance_count ::
                     (MultiMesh :< cls, Object :< cls) => cls -> IO Int
get_instance_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_instance_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_instance_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.MultiMesh.get_instance_count

{-# NOINLINE bindMultiMesh_get_instance_custom_data #-}

-- | Returns the custom data that has been set for a specific instance.
bindMultiMesh_get_instance_custom_data :: MethodBind
bindMultiMesh_get_instance_custom_data
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_instance_custom_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the custom data that has been set for a specific instance.
get_instance_custom_data ::
                           (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO Color
get_instance_custom_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_instance_custom_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_instance_custom_data" '[Int]
           (IO Color)
         where
        nodeMethod = Godot.Core.MultiMesh.get_instance_custom_data

{-# NOINLINE bindMultiMesh_get_instance_transform #-}

-- | Returns the @Transform@ of a specific instance.
bindMultiMesh_get_instance_transform :: MethodBind
bindMultiMesh_get_instance_transform
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_instance_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Transform@ of a specific instance.
get_instance_transform ::
                         (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO Transform
get_instance_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_instance_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_instance_transform" '[Int]
           (IO Transform)
         where
        nodeMethod = Godot.Core.MultiMesh.get_instance_transform

{-# NOINLINE bindMultiMesh_get_instance_transform_2d #-}

-- | Returns the @Transform2D@ of a specific instance.
bindMultiMesh_get_instance_transform_2d :: MethodBind
bindMultiMesh_get_instance_transform_2d
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_instance_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Transform2D@ of a specific instance.
get_instance_transform_2d ::
                            (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO Transform2d
get_instance_transform_2d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_instance_transform_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_instance_transform_2d" '[Int]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.MultiMesh.get_instance_transform_2d

{-# NOINLINE bindMultiMesh_get_mesh #-}

-- | Mesh to be drawn.
bindMultiMesh_get_mesh :: MethodBind
bindMultiMesh_get_mesh
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mesh to be drawn.
get_mesh :: (MultiMesh :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_mesh" '[] (IO Mesh) where
        nodeMethod = Godot.Core.MultiMesh.get_mesh

{-# NOINLINE bindMultiMesh_get_transform_format #-}

-- | Format of transform used to transform mesh, either 2D or 3D.
bindMultiMesh_get_transform_format :: MethodBind
bindMultiMesh_get_transform_format
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_transform_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Format of transform used to transform mesh, either 2D or 3D.
get_transform_format ::
                       (MultiMesh :< cls, Object :< cls) => cls -> IO Int
get_transform_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_transform_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_transform_format" '[] (IO Int)
         where
        nodeMethod = Godot.Core.MultiMesh.get_transform_format

{-# NOINLINE bindMultiMesh_get_visible_instance_count #-}

-- | Limits the number of instances drawn, -1 draws all instances. Changing this does not change the sizes of the buffers.
bindMultiMesh_get_visible_instance_count :: MethodBind
bindMultiMesh_get_visible_instance_count
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "get_visible_instance_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Limits the number of instances drawn, -1 draws all instances. Changing this does not change the sizes of the buffers.
get_visible_instance_count ::
                             (MultiMesh :< cls, Object :< cls) => cls -> IO Int
get_visible_instance_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_get_visible_instance_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "get_visible_instance_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.MultiMesh.get_visible_instance_count

{-# NOINLINE bindMultiMesh_set_as_bulk_array #-}

-- | Sets all data related to the instances in one go. This is especially useful when loading the data from disk or preparing the data from GDNative.
--   				All data is packed in one large float array. An array may look like this: Transform for instance 1, color data for instance 1, custom data for instance 1, transform for instance 2, color data for instance 2, etc...
--   				@Transform@ is stored as 12 floats, @Transform2D@ is stored as 8 floats, @COLOR_8BIT@ / @CUSTOM_DATA_8BIT@ is stored as 1 float (4 bytes as is) and @COLOR_FLOAT@ / @CUSTOM_DATA_FLOAT@ is stored as 4 floats.
bindMultiMesh_set_as_bulk_array :: MethodBind
bindMultiMesh_set_as_bulk_array
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_as_bulk_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets all data related to the instances in one go. This is especially useful when loading the data from disk or preparing the data from GDNative.
--   				All data is packed in one large float array. An array may look like this: Transform for instance 1, color data for instance 1, custom data for instance 1, transform for instance 2, color data for instance 2, etc...
--   				@Transform@ is stored as 12 floats, @Transform2D@ is stored as 8 floats, @COLOR_8BIT@ / @CUSTOM_DATA_8BIT@ is stored as 1 float (4 bytes as is) and @COLOR_FLOAT@ / @CUSTOM_DATA_FLOAT@ is stored as 4 floats.
set_as_bulk_array ::
                    (MultiMesh :< cls, Object :< cls) => cls -> PoolRealArray -> IO ()
set_as_bulk_array cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_as_bulk_array (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_as_bulk_array" '[PoolRealArray]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_as_bulk_array

{-# NOINLINE bindMultiMesh_set_color_format #-}

-- | Format of colors in color array that gets passed to shader.
bindMultiMesh_set_color_format :: MethodBind
bindMultiMesh_set_color_format
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_color_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Format of colors in color array that gets passed to shader.
set_color_format ::
                   (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_color_format cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_color_format (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_color_format" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_color_format

{-# NOINLINE bindMultiMesh_set_custom_data_format #-}

-- | Format of custom data in custom data array that gets passed to shader.
bindMultiMesh_set_custom_data_format :: MethodBind
bindMultiMesh_set_custom_data_format
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_custom_data_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Format of custom data in custom data array that gets passed to shader.
set_custom_data_format ::
                         (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_custom_data_format cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_custom_data_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_custom_data_format" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_custom_data_format

{-# NOINLINE bindMultiMesh_set_instance_color #-}

-- | Sets the color of a specific instance by @i@multiplying@/i@ the mesh's existing vertex colors.
--   				For the color to take effect, ensure that @color_format@ is non-@null@ on the @MultiMesh@ and @SpatialMaterial.vertex_color_use_as_albedo@ is @true@ on the material.
bindMultiMesh_set_instance_color :: MethodBind
bindMultiMesh_set_instance_color
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_instance_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color of a specific instance by @i@multiplying@/i@ the mesh's existing vertex colors.
--   				For the color to take effect, ensure that @color_format@ is non-@null@ on the @MultiMesh@ and @SpatialMaterial.vertex_color_use_as_albedo@ is @true@ on the material.
set_instance_color ::
                     (MultiMesh :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
set_instance_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_instance_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_instance_color" '[Int, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_instance_color

{-# NOINLINE bindMultiMesh_set_instance_count #-}

-- | Number of instances that will get drawn. This clears and (re)sizes the buffers. By default, all instances are drawn but you can limit this with @visible_instance_count@.
bindMultiMesh_set_instance_count :: MethodBind
bindMultiMesh_set_instance_count
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_instance_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of instances that will get drawn. This clears and (re)sizes the buffers. By default, all instances are drawn but you can limit this with @visible_instance_count@.
set_instance_count ::
                     (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_instance_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_instance_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_instance_count" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_instance_count

{-# NOINLINE bindMultiMesh_set_instance_custom_data #-}

-- | Sets custom data for a specific instance. Although @Color@ is used, it is just a container for 4 floating point numbers. The format of the number can change depending on the @enum CustomDataFormat@ used.
bindMultiMesh_set_instance_custom_data :: MethodBind
bindMultiMesh_set_instance_custom_data
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_instance_custom_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets custom data for a specific instance. Although @Color@ is used, it is just a container for 4 floating point numbers. The format of the number can change depending on the @enum CustomDataFormat@ used.
set_instance_custom_data ::
                           (MultiMesh :< cls, Object :< cls) => cls -> Int -> Color -> IO ()
set_instance_custom_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_instance_custom_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_instance_custom_data"
           '[Int, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_instance_custom_data

{-# NOINLINE bindMultiMesh_set_instance_transform #-}

-- | Sets the @Transform@ for a specific instance.
bindMultiMesh_set_instance_transform :: MethodBind
bindMultiMesh_set_instance_transform
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_instance_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform@ for a specific instance.
set_instance_transform ::
                         (MultiMesh :< cls, Object :< cls) =>
                         cls -> Int -> Transform -> IO ()
set_instance_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_instance_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_instance_transform"
           '[Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_instance_transform

{-# NOINLINE bindMultiMesh_set_instance_transform_2d #-}

-- | Sets the @Transform2D@ for a specific instance.
bindMultiMesh_set_instance_transform_2d :: MethodBind
bindMultiMesh_set_instance_transform_2d
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_instance_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform2D@ for a specific instance.
set_instance_transform_2d ::
                            (MultiMesh :< cls, Object :< cls) =>
                            cls -> Int -> Transform2d -> IO ()
set_instance_transform_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_instance_transform_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_instance_transform_2d"
           '[Int, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_instance_transform_2d

{-# NOINLINE bindMultiMesh_set_mesh #-}

-- | Mesh to be drawn.
bindMultiMesh_set_mesh :: MethodBind
bindMultiMesh_set_mesh
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Mesh to be drawn.
set_mesh ::
           (MultiMesh :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_mesh" '[Mesh] (IO ()) where
        nodeMethod = Godot.Core.MultiMesh.set_mesh

{-# NOINLINE bindMultiMesh_set_transform_format #-}

-- | Format of transform used to transform mesh, either 2D or 3D.
bindMultiMesh_set_transform_format :: MethodBind
bindMultiMesh_set_transform_format
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_transform_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Format of transform used to transform mesh, either 2D or 3D.
set_transform_format ::
                       (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_transform_format cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_transform_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_transform_format" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_transform_format

{-# NOINLINE bindMultiMesh_set_visible_instance_count #-}

-- | Limits the number of instances drawn, -1 draws all instances. Changing this does not change the sizes of the buffers.
bindMultiMesh_set_visible_instance_count :: MethodBind
bindMultiMesh_set_visible_instance_count
  = unsafePerformIO $
      withCString "MultiMesh" $
        \ clsNamePtr ->
          withCString "set_visible_instance_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Limits the number of instances drawn, -1 draws all instances. Changing this does not change the sizes of the buffers.
set_visible_instance_count ::
                             (MultiMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_visible_instance_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMesh_set_visible_instance_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMesh "set_visible_instance_count" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMesh.set_visible_instance_count