{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MeshLibrary
       (Godot.Core.MeshLibrary.clear, Godot.Core.MeshLibrary.create_item,
        Godot.Core.MeshLibrary.find_item_by_name,
        Godot.Core.MeshLibrary.get_item_list,
        Godot.Core.MeshLibrary.get_item_mesh,
        Godot.Core.MeshLibrary.get_item_name,
        Godot.Core.MeshLibrary.get_item_navmesh,
        Godot.Core.MeshLibrary.get_item_navmesh_transform,
        Godot.Core.MeshLibrary.get_item_preview,
        Godot.Core.MeshLibrary.get_item_shapes,
        Godot.Core.MeshLibrary.get_last_unused_item_id,
        Godot.Core.MeshLibrary.remove_item,
        Godot.Core.MeshLibrary.set_item_mesh,
        Godot.Core.MeshLibrary.set_item_name,
        Godot.Core.MeshLibrary.set_item_navmesh,
        Godot.Core.MeshLibrary.set_item_navmesh_transform,
        Godot.Core.MeshLibrary.set_item_preview,
        Godot.Core.MeshLibrary.set_item_shapes)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMeshLibrary_clear #-}

-- | Clears the library.
bindMeshLibrary_clear :: MethodBind
bindMeshLibrary_clear
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the library.
clear :: (MeshLibrary :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_create_item #-}

-- | Creates a new item in the library with the given ID.
--   				You can get an unused ID from [method get_last_unused_item_id].
bindMeshLibrary_create_item :: MethodBind
bindMeshLibrary_create_item
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "create_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new item in the library with the given ID.
--   				You can get an unused ID from [method get_last_unused_item_id].
create_item ::
              (MeshLibrary :< cls, Object :< cls) => cls -> Int -> IO ()
create_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_create_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_find_item_by_name #-}

-- | Returns the first item with the given name.
bindMeshLibrary_find_item_by_name :: MethodBind
bindMeshLibrary_find_item_by_name
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "find_item_by_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the first item with the given name.
find_item_by_name ::
                    (MeshLibrary :< cls, Object :< cls) => cls -> GodotString -> IO Int
find_item_by_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_find_item_by_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_get_item_list #-}

-- | Returns the list of item IDs in use.
bindMeshLibrary_get_item_list :: MethodBind
bindMeshLibrary_get_item_list
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "get_item_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of item IDs in use.
get_item_list ::
                (MeshLibrary :< cls, Object :< cls) => cls -> IO PoolIntArray
get_item_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_get_item_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_get_item_mesh #-}

-- | Returns the item's mesh.
bindMeshLibrary_get_item_mesh :: MethodBind
bindMeshLibrary_get_item_mesh
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "get_item_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the item's mesh.
get_item_mesh ::
                (MeshLibrary :< cls, Object :< cls) => cls -> Int -> IO Mesh
get_item_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_get_item_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_get_item_name #-}

-- | Returns the item's name.
bindMeshLibrary_get_item_name :: MethodBind
bindMeshLibrary_get_item_name
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "get_item_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the item's name.
get_item_name ::
                (MeshLibrary :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_item_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_get_item_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_get_item_navmesh #-}

-- | Returns the item's navigation mesh.
bindMeshLibrary_get_item_navmesh :: MethodBind
bindMeshLibrary_get_item_navmesh
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "get_item_navmesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the item's navigation mesh.
get_item_navmesh ::
                   (MeshLibrary :< cls, Object :< cls) =>
                   cls -> Int -> IO NavigationMesh
get_item_navmesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_get_item_navmesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_get_item_navmesh_transform #-}

-- | Returns the transform applied to the item's navigation mesh.
bindMeshLibrary_get_item_navmesh_transform :: MethodBind
bindMeshLibrary_get_item_navmesh_transform
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "get_item_navmesh_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform applied to the item's navigation mesh.
get_item_navmesh_transform ::
                             (MeshLibrary :< cls, Object :< cls) => cls -> Int -> IO Transform
get_item_navmesh_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_get_item_navmesh_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_get_item_preview #-}

-- | When running in the editor, returns a generated item preview (a 3D rendering in isometric perspective). When used in a running project, returns the manually-defined item preview which can be set using [method set_item_preview]. Returns an empty [Texture] if no preview was manually set in a running project.
bindMeshLibrary_get_item_preview :: MethodBind
bindMeshLibrary_get_item_preview
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "get_item_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When running in the editor, returns a generated item preview (a 3D rendering in isometric perspective). When used in a running project, returns the manually-defined item preview which can be set using [method set_item_preview]. Returns an empty [Texture] if no preview was manually set in a running project.
get_item_preview ::
                   (MeshLibrary :< cls, Object :< cls) => cls -> Int -> IO Texture
get_item_preview cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_get_item_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_get_item_shapes #-}

-- | Returns an item's collision shapes.
--   				The array consists of each [Shape] followed by its [Transform].
bindMeshLibrary_get_item_shapes :: MethodBind
bindMeshLibrary_get_item_shapes
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "get_item_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an item's collision shapes.
--   				The array consists of each [Shape] followed by its [Transform].
get_item_shapes ::
                  (MeshLibrary :< cls, Object :< cls) => cls -> Int -> IO Array
get_item_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_get_item_shapes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_get_last_unused_item_id #-}

-- | Gets an unused ID for a new item.
bindMeshLibrary_get_last_unused_item_id :: MethodBind
bindMeshLibrary_get_last_unused_item_id
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "get_last_unused_item_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an unused ID for a new item.
get_last_unused_item_id ::
                          (MeshLibrary :< cls, Object :< cls) => cls -> IO Int
get_last_unused_item_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_get_last_unused_item_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_remove_item #-}

-- | Removes the item.
bindMeshLibrary_remove_item :: MethodBind
bindMeshLibrary_remove_item
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "remove_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the item.
remove_item ::
              (MeshLibrary :< cls, Object :< cls) => cls -> Int -> IO ()
remove_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_remove_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_set_item_mesh #-}

-- | Sets the item's mesh.
bindMeshLibrary_set_item_mesh :: MethodBind
bindMeshLibrary_set_item_mesh
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "set_item_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the item's mesh.
set_item_mesh ::
                (MeshLibrary :< cls, Object :< cls) => cls -> Int -> Mesh -> IO ()
set_item_mesh cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_set_item_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_set_item_name #-}

-- | Sets the item's name.
--   				This name is shown in the editor. It can also be used to look up the item later using [method find_item_by_name].
bindMeshLibrary_set_item_name :: MethodBind
bindMeshLibrary_set_item_name
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "set_item_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the item's name.
--   				This name is shown in the editor. It can also be used to look up the item later using [method find_item_by_name].
set_item_name ::
                (MeshLibrary :< cls, Object :< cls) =>
                cls -> Int -> GodotString -> IO ()
set_item_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_set_item_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_set_item_navmesh #-}

-- | Sets the item's navigation mesh.
bindMeshLibrary_set_item_navmesh :: MethodBind
bindMeshLibrary_set_item_navmesh
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "set_item_navmesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the item's navigation mesh.
set_item_navmesh ::
                   (MeshLibrary :< cls, Object :< cls) =>
                   cls -> Int -> NavigationMesh -> IO ()
set_item_navmesh cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_set_item_navmesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_set_item_navmesh_transform #-}

-- | Sets the transform to apply to the item's navigation mesh.
bindMeshLibrary_set_item_navmesh_transform :: MethodBind
bindMeshLibrary_set_item_navmesh_transform
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "set_item_navmesh_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform to apply to the item's navigation mesh.
set_item_navmesh_transform ::
                             (MeshLibrary :< cls, Object :< cls) =>
                             cls -> Int -> Transform -> IO ()
set_item_navmesh_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_set_item_navmesh_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_set_item_preview #-}

-- | Sets a texture to use as the item's preview icon in the editor.
bindMeshLibrary_set_item_preview :: MethodBind
bindMeshLibrary_set_item_preview
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "set_item_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a texture to use as the item's preview icon in the editor.
set_item_preview ::
                   (MeshLibrary :< cls, Object :< cls) =>
                   cls -> Int -> Texture -> IO ()
set_item_preview cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_set_item_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshLibrary_set_item_shapes #-}

-- | Sets an item's collision shapes.
--   				The array should consist of [Shape] objects, each followed by a [Transform] that will be applied to it. For shapes that should not have a transform, use [constant Transform.IDENTITY].
bindMeshLibrary_set_item_shapes :: MethodBind
bindMeshLibrary_set_item_shapes
  = unsafePerformIO $
      withCString "MeshLibrary" $
        \ clsNamePtr ->
          withCString "set_item_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an item's collision shapes.
--   				The array should consist of [Shape] objects, each followed by a [Transform] that will be applied to it. For shapes that should not have a transform, use [constant Transform.IDENTITY].
set_item_shapes ::
                  (MeshLibrary :< cls, Object :< cls) => cls -> Int -> Array -> IO ()
set_item_shapes cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshLibrary_set_item_shapes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)