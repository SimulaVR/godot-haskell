{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Polygon2D
       (Godot.Core.Polygon2D._get_bones, Godot.Core.Polygon2D._set_bones,
        Godot.Core.Polygon2D._skeleton_bone_setup_changed,
        Godot.Core.Polygon2D.add_bone, Godot.Core.Polygon2D.clear_bones,
        Godot.Core.Polygon2D.erase_bone,
        Godot.Core.Polygon2D.get_antialiased,
        Godot.Core.Polygon2D.get_bone_count,
        Godot.Core.Polygon2D.get_bone_path,
        Godot.Core.Polygon2D.get_bone_weights,
        Godot.Core.Polygon2D.get_color,
        Godot.Core.Polygon2D.get_internal_vertex_count,
        Godot.Core.Polygon2D.get_invert,
        Godot.Core.Polygon2D.get_invert_border,
        Godot.Core.Polygon2D.get_offset, Godot.Core.Polygon2D.get_polygon,
        Godot.Core.Polygon2D.get_polygons,
        Godot.Core.Polygon2D.get_skeleton,
        Godot.Core.Polygon2D.get_texture,
        Godot.Core.Polygon2D.get_texture_offset,
        Godot.Core.Polygon2D.get_texture_rotation,
        Godot.Core.Polygon2D.get_texture_rotation_degrees,
        Godot.Core.Polygon2D.get_texture_scale,
        Godot.Core.Polygon2D.get_uv,
        Godot.Core.Polygon2D.get_vertex_colors,
        Godot.Core.Polygon2D.set_antialiased,
        Godot.Core.Polygon2D.set_bone_path,
        Godot.Core.Polygon2D.set_bone_weights,
        Godot.Core.Polygon2D.set_color,
        Godot.Core.Polygon2D.set_internal_vertex_count,
        Godot.Core.Polygon2D.set_invert,
        Godot.Core.Polygon2D.set_invert_border,
        Godot.Core.Polygon2D.set_offset, Godot.Core.Polygon2D.set_polygon,
        Godot.Core.Polygon2D.set_polygons,
        Godot.Core.Polygon2D.set_skeleton,
        Godot.Core.Polygon2D.set_texture,
        Godot.Core.Polygon2D.set_texture_offset,
        Godot.Core.Polygon2D.set_texture_rotation,
        Godot.Core.Polygon2D.set_texture_rotation_degrees,
        Godot.Core.Polygon2D.set_texture_scale,
        Godot.Core.Polygon2D.set_uv,
        Godot.Core.Polygon2D.set_vertex_colors)
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
import Godot.Core.Node2D()

instance NodeProperty Polygon2D "antialiased" Bool 'False where
        nodeProperty
          = (get_antialiased, wrapDroppingSetter set_antialiased, Nothing)

instance NodeProperty Polygon2D "bones" Array 'False where
        nodeProperty = (_get_bones, wrapDroppingSetter _set_bones, Nothing)

instance NodeProperty Polygon2D "color" Color 'False where
        nodeProperty = (get_color, wrapDroppingSetter set_color, Nothing)

instance NodeProperty Polygon2D "internal_vertex_count" Int 'False
         where
        nodeProperty
          = (get_internal_vertex_count,
             wrapDroppingSetter set_internal_vertex_count, Nothing)

instance NodeProperty Polygon2D "invert_border" Float 'False where
        nodeProperty
          = (get_invert_border, wrapDroppingSetter set_invert_border,
             Nothing)

instance NodeProperty Polygon2D "invert_enable" Bool 'False where
        nodeProperty = (get_invert, wrapDroppingSetter set_invert, Nothing)

instance NodeProperty Polygon2D "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty Polygon2D "polygon" PoolVector2Array 'False
         where
        nodeProperty
          = (get_polygon, wrapDroppingSetter set_polygon, Nothing)

instance NodeProperty Polygon2D "polygons" Array 'False where
        nodeProperty
          = (get_polygons, wrapDroppingSetter set_polygons, Nothing)

instance NodeProperty Polygon2D "skeleton" NodePath 'False where
        nodeProperty
          = (get_skeleton, wrapDroppingSetter set_skeleton, Nothing)

instance NodeProperty Polygon2D "texture" Texture 'False where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

instance NodeProperty Polygon2D "texture_offset" Vector2 'False
         where
        nodeProperty
          = (get_texture_offset, wrapDroppingSetter set_texture_offset,
             Nothing)

instance NodeProperty Polygon2D "texture_rotation" Float 'False
         where
        nodeProperty
          = (get_texture_rotation, wrapDroppingSetter set_texture_rotation,
             Nothing)

instance NodeProperty Polygon2D "texture_rotation_degrees" Float
           'False
         where
        nodeProperty
          = (get_texture_rotation_degrees,
             wrapDroppingSetter set_texture_rotation_degrees, Nothing)

instance NodeProperty Polygon2D "texture_scale" Vector2 'False
         where
        nodeProperty
          = (get_texture_scale, wrapDroppingSetter set_texture_scale,
             Nothing)

instance NodeProperty Polygon2D "uv" PoolVector2Array 'False where
        nodeProperty = (get_uv, wrapDroppingSetter set_uv, Nothing)

instance NodeProperty Polygon2D "vertex_colors" PoolColorArray
           'False
         where
        nodeProperty
          = (get_vertex_colors, wrapDroppingSetter set_vertex_colors,
             Nothing)

{-# NOINLINE bindPolygon2D__get_bones #-}

bindPolygon2D__get_bones :: MethodBind
bindPolygon2D__get_bones
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "_get_bones" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_bones :: (Polygon2D :< cls, Object :< cls) => cls -> IO Array
_get_bones cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D__get_bones (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "_get_bones" '[] (IO Array) where
        nodeMethod = Godot.Core.Polygon2D._get_bones

{-# NOINLINE bindPolygon2D__set_bones #-}

bindPolygon2D__set_bones :: MethodBind
bindPolygon2D__set_bones
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "_set_bones" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_bones ::
             (Polygon2D :< cls, Object :< cls) => cls -> Array -> IO ()
_set_bones cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D__set_bones (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "_set_bones" '[Array] (IO ()) where
        nodeMethod = Godot.Core.Polygon2D._set_bones

{-# NOINLINE bindPolygon2D__skeleton_bone_setup_changed #-}

bindPolygon2D__skeleton_bone_setup_changed :: MethodBind
bindPolygon2D__skeleton_bone_setup_changed
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "_skeleton_bone_setup_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_skeleton_bone_setup_changed ::
                               (Polygon2D :< cls, Object :< cls) => cls -> IO ()
_skeleton_bone_setup_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D__skeleton_bone_setup_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "_skeleton_bone_setup_changed" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D._skeleton_bone_setup_changed

{-# NOINLINE bindPolygon2D_add_bone #-}

bindPolygon2D_add_bone :: MethodBind
bindPolygon2D_add_bone
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "add_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_bone ::
           (Polygon2D :< cls, Object :< cls) =>
           cls -> NodePath -> PoolRealArray -> IO ()
add_bone cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_add_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "add_bone" '[NodePath, PoolRealArray]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.add_bone

{-# NOINLINE bindPolygon2D_clear_bones #-}

bindPolygon2D_clear_bones :: MethodBind
bindPolygon2D_clear_bones
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "clear_bones" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_bones :: (Polygon2D :< cls, Object :< cls) => cls -> IO ()
clear_bones cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_clear_bones (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "clear_bones" '[] (IO ()) where
        nodeMethod = Godot.Core.Polygon2D.clear_bones

{-# NOINLINE bindPolygon2D_erase_bone #-}

bindPolygon2D_erase_bone :: MethodBind
bindPolygon2D_erase_bone
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "erase_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

erase_bone ::
             (Polygon2D :< cls, Object :< cls) => cls -> Int -> IO ()
erase_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_erase_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "erase_bone" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Polygon2D.erase_bone

{-# NOINLINE bindPolygon2D_get_antialiased #-}

-- | If @true@, polygon edges will be anti-aliased.
bindPolygon2D_get_antialiased :: MethodBind
bindPolygon2D_get_antialiased
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_antialiased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, polygon edges will be anti-aliased.
get_antialiased ::
                  (Polygon2D :< cls, Object :< cls) => cls -> IO Bool
get_antialiased cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_antialiased (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_antialiased" '[] (IO Bool) where
        nodeMethod = Godot.Core.Polygon2D.get_antialiased

{-# NOINLINE bindPolygon2D_get_bone_count #-}

bindPolygon2D_get_bone_count :: MethodBind
bindPolygon2D_get_bone_count
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_bone_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bone_count ::
                 (Polygon2D :< cls, Object :< cls) => cls -> IO Int
get_bone_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_bone_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_bone_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Polygon2D.get_bone_count

{-# NOINLINE bindPolygon2D_get_bone_path #-}

bindPolygon2D_get_bone_path :: MethodBind
bindPolygon2D_get_bone_path
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_bone_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bone_path ::
                (Polygon2D :< cls, Object :< cls) => cls -> Int -> IO NodePath
get_bone_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_bone_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_bone_path" '[Int] (IO NodePath)
         where
        nodeMethod = Godot.Core.Polygon2D.get_bone_path

{-# NOINLINE bindPolygon2D_get_bone_weights #-}

bindPolygon2D_get_bone_weights :: MethodBind
bindPolygon2D_get_bone_weights
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_bone_weights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bone_weights ::
                   (Polygon2D :< cls, Object :< cls) => cls -> Int -> IO PoolRealArray
get_bone_weights cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_bone_weights (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_bone_weights" '[Int]
           (IO PoolRealArray)
         where
        nodeMethod = Godot.Core.Polygon2D.get_bone_weights

{-# NOINLINE bindPolygon2D_get_color #-}

-- | The polygon's fill color. If @texture@ is defined, it will be multiplied by this color. It will also be the default color for vertices not set in @vertex_colors@.
bindPolygon2D_get_color :: MethodBind
bindPolygon2D_get_color
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's fill color. If @texture@ is defined, it will be multiplied by this color. It will also be the default color for vertices not set in @vertex_colors@.
get_color :: (Polygon2D :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_color" '[] (IO Color) where
        nodeMethod = Godot.Core.Polygon2D.get_color

{-# NOINLINE bindPolygon2D_get_internal_vertex_count #-}

bindPolygon2D_get_internal_vertex_count :: MethodBind
bindPolygon2D_get_internal_vertex_count
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_internal_vertex_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_internal_vertex_count ::
                            (Polygon2D :< cls, Object :< cls) => cls -> IO Int
get_internal_vertex_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_internal_vertex_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_internal_vertex_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Polygon2D.get_internal_vertex_count

{-# NOINLINE bindPolygon2D_get_invert #-}

-- | If @true@, polygon will be inverted, containing the area outside the defined points and extending to the @invert_border@.
bindPolygon2D_get_invert :: MethodBind
bindPolygon2D_get_invert
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_invert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, polygon will be inverted, containing the area outside the defined points and extending to the @invert_border@.
get_invert :: (Polygon2D :< cls, Object :< cls) => cls -> IO Bool
get_invert cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_invert (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_invert" '[] (IO Bool) where
        nodeMethod = Godot.Core.Polygon2D.get_invert

{-# NOINLINE bindPolygon2D_get_invert_border #-}

-- | Added padding applied to the bounding box when using @invert@. Setting this value too small may result in a "Bad Polygon" error.
bindPolygon2D_get_invert_border :: MethodBind
bindPolygon2D_get_invert_border
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_invert_border" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Added padding applied to the bounding box when using @invert@. Setting this value too small may result in a "Bad Polygon" error.
get_invert_border ::
                    (Polygon2D :< cls, Object :< cls) => cls -> IO Float
get_invert_border cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_invert_border (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_invert_border" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Polygon2D.get_invert_border

{-# NOINLINE bindPolygon2D_get_offset #-}

-- | The offset applied to each vertex.
bindPolygon2D_get_offset :: MethodBind
bindPolygon2D_get_offset
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset applied to each vertex.
get_offset ::
             (Polygon2D :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_offset" '[] (IO Vector2) where
        nodeMethod = Godot.Core.Polygon2D.get_offset

{-# NOINLINE bindPolygon2D_get_polygon #-}

-- | The polygon's list of vertices. The final point will be connected to the first.
--   			__Note:__ This returns a copy of the @PoolVector2Array@ rather than a reference.
bindPolygon2D_get_polygon :: MethodBind
bindPolygon2D_get_polygon
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's list of vertices. The final point will be connected to the first.
--   			__Note:__ This returns a copy of the @PoolVector2Array@ rather than a reference.
get_polygon ::
              (Polygon2D :< cls, Object :< cls) => cls -> IO PoolVector2Array
get_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_polygon" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Polygon2D.get_polygon

{-# NOINLINE bindPolygon2D_get_polygons #-}

bindPolygon2D_get_polygons :: MethodBind
bindPolygon2D_get_polygons
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_polygons ::
               (Polygon2D :< cls, Object :< cls) => cls -> IO Array
get_polygons cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_polygons (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_polygons" '[] (IO Array) where
        nodeMethod = Godot.Core.Polygon2D.get_polygons

{-# NOINLINE bindPolygon2D_get_skeleton #-}

bindPolygon2D_get_skeleton :: MethodBind
bindPolygon2D_get_skeleton
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skeleton ::
               (Polygon2D :< cls, Object :< cls) => cls -> IO NodePath
get_skeleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_skeleton (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_skeleton" '[] (IO NodePath)
         where
        nodeMethod = Godot.Core.Polygon2D.get_skeleton

{-# NOINLINE bindPolygon2D_get_texture #-}

-- | The polygon's fill texture. Use @uv@ to set texture coordinates.
bindPolygon2D_get_texture :: MethodBind
bindPolygon2D_get_texture
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's fill texture. Use @uv@ to set texture coordinates.
get_texture ::
              (Polygon2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_texture" '[] (IO Texture) where
        nodeMethod = Godot.Core.Polygon2D.get_texture

{-# NOINLINE bindPolygon2D_get_texture_offset #-}

-- | Amount to offset the polygon's @texture@. If @(0, 0)@ the texture's origin (its top-left corner) will be placed at the polygon's @position@.
bindPolygon2D_get_texture_offset :: MethodBind
bindPolygon2D_get_texture_offset
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount to offset the polygon's @texture@. If @(0, 0)@ the texture's origin (its top-left corner) will be placed at the polygon's @position@.
get_texture_offset ::
                     (Polygon2D :< cls, Object :< cls) => cls -> IO Vector2
get_texture_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_texture_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_texture_offset" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Polygon2D.get_texture_offset

{-# NOINLINE bindPolygon2D_get_texture_rotation #-}

-- | The texture's rotation in radians.
bindPolygon2D_get_texture_rotation :: MethodBind
bindPolygon2D_get_texture_rotation
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_texture_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's rotation in radians.
get_texture_rotation ::
                       (Polygon2D :< cls, Object :< cls) => cls -> IO Float
get_texture_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_texture_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_texture_rotation" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Polygon2D.get_texture_rotation

{-# NOINLINE bindPolygon2D_get_texture_rotation_degrees #-}

-- | The texture's rotation in degrees.
bindPolygon2D_get_texture_rotation_degrees :: MethodBind
bindPolygon2D_get_texture_rotation_degrees
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_texture_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's rotation in degrees.
get_texture_rotation_degrees ::
                               (Polygon2D :< cls, Object :< cls) => cls -> IO Float
get_texture_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_texture_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_texture_rotation_degrees" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Polygon2D.get_texture_rotation_degrees

{-# NOINLINE bindPolygon2D_get_texture_scale #-}

-- | Amount to multiply the @uv@ coordinates when using a @texture@. Larger values make the texture smaller, and vice versa.
bindPolygon2D_get_texture_scale :: MethodBind
bindPolygon2D_get_texture_scale
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_texture_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount to multiply the @uv@ coordinates when using a @texture@. Larger values make the texture smaller, and vice versa.
get_texture_scale ::
                    (Polygon2D :< cls, Object :< cls) => cls -> IO Vector2
get_texture_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_texture_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_texture_scale" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Polygon2D.get_texture_scale

{-# NOINLINE bindPolygon2D_get_uv #-}

-- | Texture coordinates for each vertex of the polygon. There should be one @uv@ per polygon vertex. If there are fewer, undefined vertices will use @(0, 0)@.
bindPolygon2D_get_uv :: MethodBind
bindPolygon2D_get_uv
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture coordinates for each vertex of the polygon. There should be one @uv@ per polygon vertex. If there are fewer, undefined vertices will use @(0, 0)@.
get_uv ::
         (Polygon2D :< cls, Object :< cls) => cls -> IO PoolVector2Array
get_uv cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_uv (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_uv" '[] (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Polygon2D.get_uv

{-# NOINLINE bindPolygon2D_get_vertex_colors #-}

-- | Color for each vertex. Colors are interpolated between vertices, resulting in smooth gradients. There should be one per polygon vertex. If there are fewer, undefined vertices will use @color@.
bindPolygon2D_get_vertex_colors :: MethodBind
bindPolygon2D_get_vertex_colors
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "get_vertex_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color for each vertex. Colors are interpolated between vertices, resulting in smooth gradients. There should be one per polygon vertex. If there are fewer, undefined vertices will use @color@.
get_vertex_colors ::
                    (Polygon2D :< cls, Object :< cls) => cls -> IO PoolColorArray
get_vertex_colors cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_get_vertex_colors (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "get_vertex_colors" '[]
           (IO PoolColorArray)
         where
        nodeMethod = Godot.Core.Polygon2D.get_vertex_colors

{-# NOINLINE bindPolygon2D_set_antialiased #-}

-- | If @true@, polygon edges will be anti-aliased.
bindPolygon2D_set_antialiased :: MethodBind
bindPolygon2D_set_antialiased
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_antialiased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, polygon edges will be anti-aliased.
set_antialiased ::
                  (Polygon2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_antialiased cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_antialiased (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_antialiased" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_antialiased

{-# NOINLINE bindPolygon2D_set_bone_path #-}

bindPolygon2D_set_bone_path :: MethodBind
bindPolygon2D_set_bone_path
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_bone_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bone_path ::
                (Polygon2D :< cls, Object :< cls) =>
                cls -> Int -> NodePath -> IO ()
set_bone_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_bone_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_bone_path" '[Int, NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_bone_path

{-# NOINLINE bindPolygon2D_set_bone_weights #-}

bindPolygon2D_set_bone_weights :: MethodBind
bindPolygon2D_set_bone_weights
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_bone_weights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bone_weights ::
                   (Polygon2D :< cls, Object :< cls) =>
                   cls -> Int -> PoolRealArray -> IO ()
set_bone_weights cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_bone_weights (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_bone_weights"
           '[Int, PoolRealArray]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_bone_weights

{-# NOINLINE bindPolygon2D_set_color #-}

-- | The polygon's fill color. If @texture@ is defined, it will be multiplied by this color. It will also be the default color for vertices not set in @vertex_colors@.
bindPolygon2D_set_color :: MethodBind
bindPolygon2D_set_color
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's fill color. If @texture@ is defined, it will be multiplied by this color. It will also be the default color for vertices not set in @vertex_colors@.
set_color ::
            (Polygon2D :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_color" '[Color] (IO ()) where
        nodeMethod = Godot.Core.Polygon2D.set_color

{-# NOINLINE bindPolygon2D_set_internal_vertex_count #-}

bindPolygon2D_set_internal_vertex_count :: MethodBind
bindPolygon2D_set_internal_vertex_count
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_internal_vertex_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_internal_vertex_count ::
                            (Polygon2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_internal_vertex_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_internal_vertex_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_internal_vertex_count" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_internal_vertex_count

{-# NOINLINE bindPolygon2D_set_invert #-}

-- | If @true@, polygon will be inverted, containing the area outside the defined points and extending to the @invert_border@.
bindPolygon2D_set_invert :: MethodBind
bindPolygon2D_set_invert
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_invert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, polygon will be inverted, containing the area outside the defined points and extending to the @invert_border@.
set_invert ::
             (Polygon2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_invert cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_invert (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_invert" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Polygon2D.set_invert

{-# NOINLINE bindPolygon2D_set_invert_border #-}

-- | Added padding applied to the bounding box when using @invert@. Setting this value too small may result in a "Bad Polygon" error.
bindPolygon2D_set_invert_border :: MethodBind
bindPolygon2D_set_invert_border
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_invert_border" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Added padding applied to the bounding box when using @invert@. Setting this value too small may result in a "Bad Polygon" error.
set_invert_border ::
                    (Polygon2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_invert_border cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_invert_border (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_invert_border" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_invert_border

{-# NOINLINE bindPolygon2D_set_offset #-}

-- | The offset applied to each vertex.
bindPolygon2D_set_offset :: MethodBind
bindPolygon2D_set_offset
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset applied to each vertex.
set_offset ::
             (Polygon2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_offset" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.Polygon2D.set_offset

{-# NOINLINE bindPolygon2D_set_polygon #-}

-- | The polygon's list of vertices. The final point will be connected to the first.
--   			__Note:__ This returns a copy of the @PoolVector2Array@ rather than a reference.
bindPolygon2D_set_polygon :: MethodBind
bindPolygon2D_set_polygon
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's list of vertices. The final point will be connected to the first.
--   			__Note:__ This returns a copy of the @PoolVector2Array@ rather than a reference.
set_polygon ::
              (Polygon2D :< cls, Object :< cls) =>
              cls -> PoolVector2Array -> IO ()
set_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_polygon" '[PoolVector2Array]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_polygon

{-# NOINLINE bindPolygon2D_set_polygons #-}

bindPolygon2D_set_polygons :: MethodBind
bindPolygon2D_set_polygons
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_polygons ::
               (Polygon2D :< cls, Object :< cls) => cls -> Array -> IO ()
set_polygons cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_polygons (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_polygons" '[Array] (IO ()) where
        nodeMethod = Godot.Core.Polygon2D.set_polygons

{-# NOINLINE bindPolygon2D_set_skeleton #-}

bindPolygon2D_set_skeleton :: MethodBind
bindPolygon2D_set_skeleton
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_skeleton ::
               (Polygon2D :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_skeleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_skeleton (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_skeleton" '[NodePath] (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_skeleton

{-# NOINLINE bindPolygon2D_set_texture #-}

-- | The polygon's fill texture. Use @uv@ to set texture coordinates.
bindPolygon2D_set_texture :: MethodBind
bindPolygon2D_set_texture
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The polygon's fill texture. Use @uv@ to set texture coordinates.
set_texture ::
              (Polygon2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_texture" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_texture

{-# NOINLINE bindPolygon2D_set_texture_offset #-}

-- | Amount to offset the polygon's @texture@. If @(0, 0)@ the texture's origin (its top-left corner) will be placed at the polygon's @position@.
bindPolygon2D_set_texture_offset :: MethodBind
bindPolygon2D_set_texture_offset
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount to offset the polygon's @texture@. If @(0, 0)@ the texture's origin (its top-left corner) will be placed at the polygon's @position@.
set_texture_offset ::
                     (Polygon2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_texture_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_texture_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_texture_offset" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_texture_offset

{-# NOINLINE bindPolygon2D_set_texture_rotation #-}

-- | The texture's rotation in radians.
bindPolygon2D_set_texture_rotation :: MethodBind
bindPolygon2D_set_texture_rotation
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_texture_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's rotation in radians.
set_texture_rotation ::
                       (Polygon2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_texture_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_texture_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_texture_rotation" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_texture_rotation

{-# NOINLINE bindPolygon2D_set_texture_rotation_degrees #-}

-- | The texture's rotation in degrees.
bindPolygon2D_set_texture_rotation_degrees :: MethodBind
bindPolygon2D_set_texture_rotation_degrees
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_texture_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's rotation in degrees.
set_texture_rotation_degrees ::
                               (Polygon2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_texture_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_texture_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_texture_rotation_degrees"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_texture_rotation_degrees

{-# NOINLINE bindPolygon2D_set_texture_scale #-}

-- | Amount to multiply the @uv@ coordinates when using a @texture@. Larger values make the texture smaller, and vice versa.
bindPolygon2D_set_texture_scale :: MethodBind
bindPolygon2D_set_texture_scale
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_texture_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount to multiply the @uv@ coordinates when using a @texture@. Larger values make the texture smaller, and vice versa.
set_texture_scale ::
                    (Polygon2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_texture_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_texture_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_texture_scale" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_texture_scale

{-# NOINLINE bindPolygon2D_set_uv #-}

-- | Texture coordinates for each vertex of the polygon. There should be one @uv@ per polygon vertex. If there are fewer, undefined vertices will use @(0, 0)@.
bindPolygon2D_set_uv :: MethodBind
bindPolygon2D_set_uv
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Texture coordinates for each vertex of the polygon. There should be one @uv@ per polygon vertex. If there are fewer, undefined vertices will use @(0, 0)@.
set_uv ::
         (Polygon2D :< cls, Object :< cls) =>
         cls -> PoolVector2Array -> IO ()
set_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_uv (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_uv" '[PoolVector2Array] (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_uv

{-# NOINLINE bindPolygon2D_set_vertex_colors #-}

-- | Color for each vertex. Colors are interpolated between vertices, resulting in smooth gradients. There should be one per polygon vertex. If there are fewer, undefined vertices will use @color@.
bindPolygon2D_set_vertex_colors :: MethodBind
bindPolygon2D_set_vertex_colors
  = unsafePerformIO $
      withCString "Polygon2D" $
        \ clsNamePtr ->
          withCString "set_vertex_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color for each vertex. Colors are interpolated between vertices, resulting in smooth gradients. There should be one per polygon vertex. If there are fewer, undefined vertices will use @color@.
set_vertex_colors ::
                    (Polygon2D :< cls, Object :< cls) => cls -> PoolColorArray -> IO ()
set_vertex_colors cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPolygon2D_set_vertex_colors (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Polygon2D "set_vertex_colors" '[PoolColorArray]
           (IO ())
         where
        nodeMethod = Godot.Core.Polygon2D.set_vertex_colors