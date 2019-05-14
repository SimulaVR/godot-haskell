{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorSpatialGizmo
       (Godot.Tools.EditorSpatialGizmo.redraw,
        Godot.Tools.EditorSpatialGizmo.get_handle_name,
        Godot.Tools.EditorSpatialGizmo.is_handle_highlighted,
        Godot.Tools.EditorSpatialGizmo.get_handle_value,
        Godot.Tools.EditorSpatialGizmo.set_handle,
        Godot.Tools.EditorSpatialGizmo.commit_handle,
        Godot.Tools.EditorSpatialGizmo.add_lines,
        Godot.Tools.EditorSpatialGizmo.add_mesh,
        Godot.Tools.EditorSpatialGizmo.add_collision_segments,
        Godot.Tools.EditorSpatialGizmo.add_collision_triangles,
        Godot.Tools.EditorSpatialGizmo.add_unscaled_billboard,
        Godot.Tools.EditorSpatialGizmo.add_handles,
        Godot.Tools.EditorSpatialGizmo.set_spatial_node,
        Godot.Tools.EditorSpatialGizmo.get_spatial_node,
        Godot.Tools.EditorSpatialGizmo.get_plugin,
        Godot.Tools.EditorSpatialGizmo.clear,
        Godot.Tools.EditorSpatialGizmo.set_hidden)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEditorSpatialGizmo_redraw #-}

-- | This function is called when the Spatial this gizmo refers to changes (the [method Spatial.update_gizmo] is called).
bindEditorSpatialGizmo_redraw :: MethodBind
bindEditorSpatialGizmo_redraw
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "redraw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This function is called when the Spatial this gizmo refers to changes (the [method Spatial.update_gizmo] is called).
redraw ::
         (EditorSpatialGizmo :< cls, Object :< cls) => cls -> IO ()
redraw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_redraw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_get_handle_name #-}

-- | Get the name of an edited handle (handles must have been previously added by [method add_handles]).
--   				Handles can be named for reference to the user when editing.
bindEditorSpatialGizmo_get_handle_name :: MethodBind
bindEditorSpatialGizmo_get_handle_name
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "get_handle_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the name of an edited handle (handles must have been previously added by [method add_handles]).
--   				Handles can be named for reference to the user when editing.
get_handle_name ::
                  (EditorSpatialGizmo :< cls, Object :< cls) =>
                  cls -> Int -> IO GodotString
get_handle_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_get_handle_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_is_handle_highlighted #-}

-- | Get whether a handle is highlighted or not.
bindEditorSpatialGizmo_is_handle_highlighted :: MethodBind
bindEditorSpatialGizmo_is_handle_highlighted
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "is_handle_highlighted" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get whether a handle is highlighted or not.
is_handle_highlighted ::
                        (EditorSpatialGizmo :< cls, Object :< cls) => cls -> Int -> IO Bool
is_handle_highlighted cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_is_handle_highlighted
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_get_handle_value #-}

-- | Get actual value of a handle. This value can be anything and used for eventually undoing the motion when calling [method commit_handle].
bindEditorSpatialGizmo_get_handle_value :: MethodBind
bindEditorSpatialGizmo_get_handle_value
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "get_handle_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get actual value of a handle. This value can be anything and used for eventually undoing the motion when calling [method commit_handle].
get_handle_value ::
                   (EditorSpatialGizmo :< cls, Object :< cls) =>
                   cls -> Int -> IO GodotVariant
get_handle_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_get_handle_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_set_handle #-}

-- | This function is used when the user drags a gizmo handle (previously added with [method add_handles]) in screen coordinates.
--   				The [Camera] is also provided so screen coordinates can be converted to raycasts.
bindEditorSpatialGizmo_set_handle :: MethodBind
bindEditorSpatialGizmo_set_handle
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "set_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This function is used when the user drags a gizmo handle (previously added with [method add_handles]) in screen coordinates.
--   				The [Camera] is also provided so screen coordinates can be converted to raycasts.
set_handle ::
             (EditorSpatialGizmo :< cls, Object :< cls) =>
             cls -> Int -> Camera -> Vector2 -> IO ()
set_handle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_set_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_commit_handle #-}

-- | Commit a handle being edited (handles must have been previously added by [method add_handles]).
--   				If the cancel parameter is true, an option to restore the edited value to the original is provided.
bindEditorSpatialGizmo_commit_handle :: MethodBind
bindEditorSpatialGizmo_commit_handle
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "commit_handle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Commit a handle being edited (handles must have been previously added by [method add_handles]).
--   				If the cancel parameter is true, an option to restore the edited value to the original is provided.
commit_handle ::
                (EditorSpatialGizmo :< cls, Object :< cls) =>
                cls -> Int -> GodotVariant -> Bool -> IO ()
commit_handle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_commit_handle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_add_lines #-}

-- | Add lines to the gizmo (as sets of 2 points), with a given material. The lines are used for visualizing the gizmo. Call this function during [method redraw].
bindEditorSpatialGizmo_add_lines :: MethodBind
bindEditorSpatialGizmo_add_lines
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add lines to the gizmo (as sets of 2 points), with a given material. The lines are used for visualizing the gizmo. Call this function during [method redraw].
add_lines ::
            (EditorSpatialGizmo :< cls, Object :< cls) =>
            cls -> PoolVector3Array -> Material -> Bool -> IO ()
add_lines cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_add_lines
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_add_mesh #-}

bindEditorSpatialGizmo_add_mesh :: MethodBind
bindEditorSpatialGizmo_add_mesh
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_mesh ::
           (EditorSpatialGizmo :< cls, Object :< cls) =>
           cls -> ArrayMesh -> Bool -> Rid -> Material -> IO ()
add_mesh cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_add_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_add_collision_segments #-}

bindEditorSpatialGizmo_add_collision_segments :: MethodBind
bindEditorSpatialGizmo_add_collision_segments
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_collision_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_collision_segments ::
                         (EditorSpatialGizmo :< cls, Object :< cls) =>
                         cls -> PoolVector3Array -> IO ()
add_collision_segments cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmo_add_collision_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_add_collision_triangles #-}

-- | Add collision triangles to the gizmo for picking. A [TriangleMesh] can be generated from a regular [Mesh] too. Call this function during [method redraw].
bindEditorSpatialGizmo_add_collision_triangles :: MethodBind
bindEditorSpatialGizmo_add_collision_triangles
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_collision_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add collision triangles to the gizmo for picking. A [TriangleMesh] can be generated from a regular [Mesh] too. Call this function during [method redraw].
add_collision_triangles ::
                          (EditorSpatialGizmo :< cls, Object :< cls) =>
                          cls -> TriangleMesh -> IO ()
add_collision_triangles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmo_add_collision_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_add_unscaled_billboard #-}

-- | Add an unscaled billboard for visualization. Call this function during [method redraw].
bindEditorSpatialGizmo_add_unscaled_billboard :: MethodBind
bindEditorSpatialGizmo_add_unscaled_billboard
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_unscaled_billboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add an unscaled billboard for visualization. Call this function during [method redraw].
add_unscaled_billboard ::
                         (EditorSpatialGizmo :< cls, Object :< cls) =>
                         cls -> Material -> Float -> IO ()
add_unscaled_billboard cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSpatialGizmo_add_unscaled_billboard
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_add_handles #-}

-- | Add a list of handles (points) which can be used to deform the object being edited.
--   				There are virtual functions which will be called upon editing of these handles. Call this function during [method redraw].
bindEditorSpatialGizmo_add_handles :: MethodBind
bindEditorSpatialGizmo_add_handles
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "add_handles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a list of handles (points) which can be used to deform the object being edited.
--   				There are virtual functions which will be called upon editing of these handles. Call this function during [method redraw].
add_handles ::
              (EditorSpatialGizmo :< cls, Object :< cls) =>
              cls -> PoolVector3Array -> Material -> Bool -> Bool -> IO ()
add_handles cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_add_handles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_set_spatial_node #-}

bindEditorSpatialGizmo_set_spatial_node :: MethodBind
bindEditorSpatialGizmo_set_spatial_node
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "set_spatial_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_spatial_node ::
                   (EditorSpatialGizmo :< cls, Object :< cls) => cls -> Node -> IO ()
set_spatial_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_set_spatial_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_get_spatial_node #-}

-- | Returns the Spatial node associated with this gizmo.
bindEditorSpatialGizmo_get_spatial_node :: MethodBind
bindEditorSpatialGizmo_get_spatial_node
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "get_spatial_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the Spatial node associated with this gizmo.
get_spatial_node ::
                   (EditorSpatialGizmo :< cls, Object :< cls) => cls -> IO Spatial
get_spatial_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_get_spatial_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_get_plugin #-}

-- | Return the [EditorSpatialGizmoPlugin] that owns this gizmo. It's useful to retrieve materials using [method EditorSpatialGizmoPlugin.get_material].
bindEditorSpatialGizmo_get_plugin :: MethodBind
bindEditorSpatialGizmo_get_plugin
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "get_plugin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the [EditorSpatialGizmoPlugin] that owns this gizmo. It's useful to retrieve materials using [method EditorSpatialGizmoPlugin.get_material].
get_plugin ::
             (EditorSpatialGizmo :< cls, Object :< cls) =>
             cls -> IO EditorSpatialGizmoPlugin
get_plugin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_get_plugin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_clear #-}

bindEditorSpatialGizmo_clear :: MethodBind
bindEditorSpatialGizmo_clear
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (EditorSpatialGizmo :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorSpatialGizmo_set_hidden #-}

bindEditorSpatialGizmo_set_hidden :: MethodBind
bindEditorSpatialGizmo_set_hidden
  = unsafePerformIO $
      withCString "EditorSpatialGizmo" $
        \ clsNamePtr ->
          withCString "set_hidden" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_hidden ::
             (EditorSpatialGizmo :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hidden cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSpatialGizmo_set_hidden
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)