{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Spatial
       (Godot.Core.Spatial._NOTIFICATION_ENTER_WORLD,
        Godot.Core.Spatial._NOTIFICATION_EXIT_WORLD,
        Godot.Core.Spatial._NOTIFICATION_TRANSFORM_CHANGED,
        Godot.Core.Spatial._NOTIFICATION_VISIBILITY_CHANGED,
        Godot.Core.Spatial.sig_visibility_changed,
        Godot.Core.Spatial.set_transform, Godot.Core.Spatial.get_transform,
        Godot.Core.Spatial.set_translation,
        Godot.Core.Spatial.get_translation,
        Godot.Core.Spatial.set_rotation, Godot.Core.Spatial.get_rotation,
        Godot.Core.Spatial.set_rotation_degrees,
        Godot.Core.Spatial.get_rotation_degrees,
        Godot.Core.Spatial.set_scale, Godot.Core.Spatial.get_scale,
        Godot.Core.Spatial.set_global_transform,
        Godot.Core.Spatial.get_global_transform,
        Godot.Core.Spatial.get_parent_spatial,
        Godot.Core.Spatial.set_ignore_transform_notification,
        Godot.Core.Spatial.set_as_toplevel,
        Godot.Core.Spatial.is_set_as_toplevel,
        Godot.Core.Spatial.set_disable_scale,
        Godot.Core.Spatial.is_scale_disabled, Godot.Core.Spatial.get_world,
        Godot.Core.Spatial.force_update_transform,
        Godot.Core.Spatial._update_gizmo, Godot.Core.Spatial.update_gizmo,
        Godot.Core.Spatial.set_gizmo, Godot.Core.Spatial.get_gizmo,
        Godot.Core.Spatial.set_visible, Godot.Core.Spatial.is_visible,
        Godot.Core.Spatial.is_visible_in_tree, Godot.Core.Spatial.show,
        Godot.Core.Spatial.hide,
        Godot.Core.Spatial.set_notify_local_transform,
        Godot.Core.Spatial.is_local_transform_notification_enabled,
        Godot.Core.Spatial.set_notify_transform,
        Godot.Core.Spatial.is_transform_notification_enabled,
        Godot.Core.Spatial.rotate, Godot.Core.Spatial.global_rotate,
        Godot.Core.Spatial.global_scale,
        Godot.Core.Spatial.global_translate,
        Godot.Core.Spatial.rotate_object_local,
        Godot.Core.Spatial.scale_object_local,
        Godot.Core.Spatial.translate_object_local,
        Godot.Core.Spatial.rotate_x, Godot.Core.Spatial.rotate_y,
        Godot.Core.Spatial.rotate_z, Godot.Core.Spatial.translate,
        Godot.Core.Spatial.orthonormalize, Godot.Core.Spatial.set_identity,
        Godot.Core.Spatial.look_at,
        Godot.Core.Spatial.look_at_from_position,
        Godot.Core.Spatial.to_local, Godot.Core.Spatial.to_global)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_NOTIFICATION_ENTER_WORLD :: Int
_NOTIFICATION_ENTER_WORLD = 41

_NOTIFICATION_EXIT_WORLD :: Int
_NOTIFICATION_EXIT_WORLD = 42

_NOTIFICATION_TRANSFORM_CHANGED :: Int
_NOTIFICATION_TRANSFORM_CHANGED = 29

_NOTIFICATION_VISIBILITY_CHANGED :: Int
_NOTIFICATION_VISIBILITY_CHANGED = 43

-- | Emitted when node visibility changes.
sig_visibility_changed :: Godot.Internal.Dispatch.Signal Spatial
sig_visibility_changed
  = Godot.Internal.Dispatch.Signal "visibility_changed"

{-# NOINLINE bindSpatial_set_transform #-}

-- | Local space [Transform] of this node, with respect to the parent node.
bindSpatial_set_transform :: MethodBind
bindSpatial_set_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Local space [Transform] of this node, with respect to the parent node.
set_transform ::
                (Spatial :< cls, Object :< cls) => cls -> Transform -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_transform #-}

-- | Local space [Transform] of this node, with respect to the parent node.
bindSpatial_get_transform :: MethodBind
bindSpatial_get_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Local space [Transform] of this node, with respect to the parent node.
get_transform ::
                (Spatial :< cls, Object :< cls) => cls -> IO Transform
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_translation #-}

-- | Local translation of this node.
bindSpatial_set_translation :: MethodBind
bindSpatial_set_translation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Local translation of this node.
set_translation ::
                  (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_translation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_translation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_translation #-}

-- | Local translation of this node.
bindSpatial_get_translation :: MethodBind
bindSpatial_get_translation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Local translation of this node.
get_translation ::
                  (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_translation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_translation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_rotation #-}

-- | Rotation part of the local transformation in radians, specified in terms of YXZ-Euler angles in the format (X-angle, Y-angle, Z-angle).
--   			Note that in the mathematical sense, rotation is a matrix and not a vector. The three Euler angles, which are the three independent parameters of the Euler-angle parametrization of the rotation matrix, are stored in a [Vector3] data structure not because the rotation is a vector, but only because [Vector3] exists as a convenient data-structure to store 3 floating point numbers. Therefore, applying affine operations on the rotation "vector" is not meaningful.
bindSpatial_set_rotation :: MethodBind
bindSpatial_set_rotation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation part of the local transformation in radians, specified in terms of YXZ-Euler angles in the format (X-angle, Y-angle, Z-angle).
--   			Note that in the mathematical sense, rotation is a matrix and not a vector. The three Euler angles, which are the three independent parameters of the Euler-angle parametrization of the rotation matrix, are stored in a [Vector3] data structure not because the rotation is a vector, but only because [Vector3] exists as a convenient data-structure to store 3 floating point numbers. Therefore, applying affine operations on the rotation "vector" is not meaningful.
set_rotation ::
               (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_rotation #-}

-- | Rotation part of the local transformation in radians, specified in terms of YXZ-Euler angles in the format (X-angle, Y-angle, Z-angle).
--   			Note that in the mathematical sense, rotation is a matrix and not a vector. The three Euler angles, which are the three independent parameters of the Euler-angle parametrization of the rotation matrix, are stored in a [Vector3] data structure not because the rotation is a vector, but only because [Vector3] exists as a convenient data-structure to store 3 floating point numbers. Therefore, applying affine operations on the rotation "vector" is not meaningful.
bindSpatial_get_rotation :: MethodBind
bindSpatial_get_rotation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation part of the local transformation in radians, specified in terms of YXZ-Euler angles in the format (X-angle, Y-angle, Z-angle).
--   			Note that in the mathematical sense, rotation is a matrix and not a vector. The three Euler angles, which are the three independent parameters of the Euler-angle parametrization of the rotation matrix, are stored in a [Vector3] data structure not because the rotation is a vector, but only because [Vector3] exists as a convenient data-structure to store 3 floating point numbers. Therefore, applying affine operations on the rotation "vector" is not meaningful.
get_rotation ::
               (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_rotation_degrees #-}

-- | Rotation part of the local transformation in degrees, specified in terms of YXZ-Euler angles in the format (X-angle, Y-angle, Z-angle).
bindSpatial_set_rotation_degrees :: MethodBind
bindSpatial_set_rotation_degrees
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation part of the local transformation in degrees, specified in terms of YXZ-Euler angles in the format (X-angle, Y-angle, Z-angle).
set_rotation_degrees ::
                       (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_rotation_degrees #-}

-- | Rotation part of the local transformation in degrees, specified in terms of YXZ-Euler angles in the format (X-angle, Y-angle, Z-angle).
bindSpatial_get_rotation_degrees :: MethodBind
bindSpatial_get_rotation_degrees
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation part of the local transformation in degrees, specified in terms of YXZ-Euler angles in the format (X-angle, Y-angle, Z-angle).
get_rotation_degrees ::
                       (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_scale #-}

-- | Scale part of the local transformation.
bindSpatial_set_scale :: MethodBind
bindSpatial_set_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scale part of the local transformation.
set_scale ::
            (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_scale #-}

-- | Scale part of the local transformation.
bindSpatial_get_scale :: MethodBind
bindSpatial_get_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scale part of the local transformation.
get_scale :: (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_global_transform #-}

-- | World space (global) [Transform] of this node.
bindSpatial_set_global_transform :: MethodBind
bindSpatial_set_global_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | World space (global) [Transform] of this node.
set_global_transform ::
                       (Spatial :< cls, Object :< cls) => cls -> Transform -> IO ()
set_global_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_global_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_global_transform #-}

-- | World space (global) [Transform] of this node.
bindSpatial_get_global_transform :: MethodBind
bindSpatial_get_global_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | World space (global) [Transform] of this node.
get_global_transform ::
                       (Spatial :< cls, Object :< cls) => cls -> IO Transform
get_global_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_global_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_parent_spatial #-}

-- | Returns the parent [code]Spatial[/code], or an empty [Object] if no parent exists or parent is not of type [code]Spatial[/code].
bindSpatial_get_parent_spatial :: MethodBind
bindSpatial_get_parent_spatial
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_parent_spatial" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent [code]Spatial[/code], or an empty [Object] if no parent exists or parent is not of type [code]Spatial[/code].
get_parent_spatial ::
                     (Spatial :< cls, Object :< cls) => cls -> IO Spatial
get_parent_spatial cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_parent_spatial (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_ignore_transform_notification #-}

-- | Set whether the node ignores notification that its transformation (global or local) changed.
bindSpatial_set_ignore_transform_notification :: MethodBind
bindSpatial_set_ignore_transform_notification
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_ignore_transform_notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set whether the node ignores notification that its transformation (global or local) changed.
set_ignore_transform_notification ::
                                    (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ignore_transform_notification cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatial_set_ignore_transform_notification
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_as_toplevel #-}

-- | Makes the node ignore its parents transformations. Node transformations are only in global space.
bindSpatial_set_as_toplevel :: MethodBind
bindSpatial_set_as_toplevel
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_as_toplevel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes the node ignore its parents transformations. Node transformations are only in global space.
set_as_toplevel ::
                  (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_as_toplevel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_as_toplevel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_is_set_as_toplevel #-}

-- | Returns whether this node is set as Toplevel, that is whether it ignores its parent nodes transformations.
bindSpatial_is_set_as_toplevel :: MethodBind
bindSpatial_is_set_as_toplevel
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_set_as_toplevel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether this node is set as Toplevel, that is whether it ignores its parent nodes transformations.
is_set_as_toplevel ::
                     (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_set_as_toplevel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_set_as_toplevel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_disable_scale #-}

bindSpatial_set_disable_scale :: MethodBind
bindSpatial_set_disable_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_disable_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_disable_scale ::
                    (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_disable_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_is_scale_disabled #-}

bindSpatial_is_scale_disabled :: MethodBind
bindSpatial_is_scale_disabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_scale_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_scale_disabled ::
                    (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_scale_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_scale_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_world #-}

-- | Returns the current [World] resource this [code]Spatial[/code] node is registered to.
bindSpatial_get_world :: MethodBind
bindSpatial_get_world
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current [World] resource this [code]Spatial[/code] node is registered to.
get_world :: (Spatial :< cls, Object :< cls) => cls -> IO World
get_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_force_update_transform #-}

bindSpatial_force_update_transform :: MethodBind
bindSpatial_force_update_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "force_update_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

force_update_transform ::
                         (Spatial :< cls, Object :< cls) => cls -> IO ()
force_update_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_force_update_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial__update_gizmo #-}

bindSpatial__update_gizmo :: MethodBind
bindSpatial__update_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "_update_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_gizmo :: (Spatial :< cls, Object :< cls) => cls -> IO ()
_update_gizmo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial__update_gizmo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_update_gizmo #-}

-- | Updates the [SpatialGizmo] of this node.
bindSpatial_update_gizmo :: MethodBind
bindSpatial_update_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "update_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the [SpatialGizmo] of this node.
update_gizmo :: (Spatial :< cls, Object :< cls) => cls -> IO ()
update_gizmo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_update_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_gizmo #-}

-- | The [SpatialGizmo] for this node. Used for example in [EditorSpatialGizmo] as custom visualization and editing handles in Editor.
bindSpatial_set_gizmo :: MethodBind
bindSpatial_set_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [SpatialGizmo] for this node. Used for example in [EditorSpatialGizmo] as custom visualization and editing handles in Editor.
set_gizmo ::
            (Spatial :< cls, Object :< cls) => cls -> SpatialGizmo -> IO ()
set_gizmo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_get_gizmo #-}

-- | The [SpatialGizmo] for this node. Used for example in [EditorSpatialGizmo] as custom visualization and editing handles in Editor.
bindSpatial_get_gizmo :: MethodBind
bindSpatial_get_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [SpatialGizmo] for this node. Used for example in [EditorSpatialGizmo] as custom visualization and editing handles in Editor.
get_gizmo ::
            (Spatial :< cls, Object :< cls) => cls -> IO SpatialGizmo
get_gizmo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_visible #-}

-- | If [code]true[/code], this node is drawn. Default value: [code]true[/code].
bindSpatial_set_visible :: MethodBind
bindSpatial_set_visible
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this node is drawn. Default value: [code]true[/code].
set_visible ::
              (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_visible (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_is_visible #-}

-- | If [code]true[/code], this node is drawn. Default value: [code]true[/code].
bindSpatial_is_visible :: MethodBind
bindSpatial_is_visible
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this node is drawn. Default value: [code]true[/code].
is_visible :: (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_visible (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_is_visible_in_tree #-}

-- | Returns whether the node is visible, taking into consideration that its parents visibility.
bindSpatial_is_visible_in_tree :: MethodBind
bindSpatial_is_visible_in_tree
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_visible_in_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the node is visible, taking into consideration that its parents visibility.
is_visible_in_tree ::
                     (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_visible_in_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_visible_in_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_show #-}

-- | Enables rendering of this node. Changes [member visible] to [code]true[/code].
bindSpatial_show :: MethodBind
bindSpatial_show
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "show" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables rendering of this node. Changes [member visible] to [code]true[/code].
show :: (Spatial :< cls, Object :< cls) => cls -> IO ()
show cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_show (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_hide #-}

-- | Disables rendering of this node. Changes [member visible] to [code]false[/code].
bindSpatial_hide :: MethodBind
bindSpatial_hide
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "hide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables rendering of this node. Changes [member visible] to [code]false[/code].
hide :: (Spatial :< cls, Object :< cls) => cls -> IO ()
hide cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_hide (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_notify_local_transform #-}

-- | Set whether the node notifies about its local transformation changes. [code]Spatial[/code] will not propagate this by default.
bindSpatial_set_notify_local_transform :: MethodBind
bindSpatial_set_notify_local_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_notify_local_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set whether the node notifies about its local transformation changes. [code]Spatial[/code] will not propagate this by default.
set_notify_local_transform ::
                             (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_notify_local_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_notify_local_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_is_local_transform_notification_enabled
             #-}

-- | Returns whether node notifies about its local transformation changes. [code]Spatial[/code] will not propagate this by default.
bindSpatial_is_local_transform_notification_enabled :: MethodBind
bindSpatial_is_local_transform_notification_enabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_local_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether node notifies about its local transformation changes. [code]Spatial[/code] will not propagate this by default.
is_local_transform_notification_enabled ::
                                          (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_local_transform_notification_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatial_is_local_transform_notification_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_notify_transform #-}

-- | Set whether the node notifies about its global and local transformation changes. [code]Spatial[/code] will not propagate this by default.
bindSpatial_set_notify_transform :: MethodBind
bindSpatial_set_notify_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_notify_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set whether the node notifies about its global and local transformation changes. [code]Spatial[/code] will not propagate this by default.
set_notify_transform ::
                       (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_notify_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_notify_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_is_transform_notification_enabled #-}

-- | Returns whether the node notifies about its global and local transformation changes. [code]Spatial[/code] will not propagate this by default.
bindSpatial_is_transform_notification_enabled :: MethodBind
bindSpatial_is_transform_notification_enabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the node notifies about its global and local transformation changes. [code]Spatial[/code] will not propagate this by default.
is_transform_notification_enabled ::
                                    (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_transform_notification_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatial_is_transform_notification_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_rotate #-}

-- | Rotates the local transformation around axis, a unit [Vector3], by specified angle in radians.
bindSpatial_rotate :: MethodBind
bindSpatial_rotate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the local transformation around axis, a unit [Vector3], by specified angle in radians.
rotate ::
         (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
rotate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_global_rotate #-}

-- | Rotates the global (world) transformation around axis, a unit [Vector3], by specified angle in radians. The rotation axis is in global coordinate system.
bindSpatial_global_rotate :: MethodBind
bindSpatial_global_rotate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_rotate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the global (world) transformation around axis, a unit [Vector3], by specified angle in radians. The rotation axis is in global coordinate system.
global_rotate ::
                (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
global_rotate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_rotate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_global_scale #-}

bindSpatial_global_scale :: MethodBind
bindSpatial_global_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

global_scale ::
               (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
global_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_global_translate #-}

-- | Moves the global (world) transformation by [Vector3] offset. The offset is in global coordinate system.
bindSpatial_global_translate :: MethodBind
bindSpatial_global_translate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the global (world) transformation by [Vector3] offset. The offset is in global coordinate system.
global_translate ::
                   (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
global_translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_translate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_rotate_object_local #-}

-- | Rotates the local transformation around axis, a unit [Vector3], by specified angle in radians. The rotation axis is in object-local coordinate system.
bindSpatial_rotate_object_local :: MethodBind
bindSpatial_rotate_object_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_object_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the local transformation around axis, a unit [Vector3], by specified angle in radians. The rotation axis is in object-local coordinate system.
rotate_object_local ::
                      (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
rotate_object_local cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_object_local (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_scale_object_local #-}

-- | Scales the local transformation by given 3D scale factors in object-local coordinate system.
bindSpatial_scale_object_local :: MethodBind
bindSpatial_scale_object_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "scale_object_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the local transformation by given 3D scale factors in object-local coordinate system.
scale_object_local ::
                     (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
scale_object_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_scale_object_local (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_translate_object_local #-}

bindSpatial_translate_object_local :: MethodBind
bindSpatial_translate_object_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "translate_object_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

translate_object_local ::
                         (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
translate_object_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_translate_object_local
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_rotate_x #-}

-- | Rotates the local transformation around the X axis by angle in radians
bindSpatial_rotate_x :: MethodBind
bindSpatial_rotate_x
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the local transformation around the X axis by angle in radians
rotate_x ::
           (Spatial :< cls, Object :< cls) => cls -> Float -> IO ()
rotate_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_x (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_rotate_y #-}

-- | Rotates the local transformation around the Y axis by angle in radians.
bindSpatial_rotate_y :: MethodBind
bindSpatial_rotate_y
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the local transformation around the Y axis by angle in radians.
rotate_y ::
           (Spatial :< cls, Object :< cls) => cls -> Float -> IO ()
rotate_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_y (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_rotate_z #-}

-- | Rotates the local transformation around the Z axis by angle in radians.
bindSpatial_rotate_z :: MethodBind
bindSpatial_rotate_z
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_z" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the local transformation around the Z axis by angle in radians.
rotate_z ::
           (Spatial :< cls, Object :< cls) => cls -> Float -> IO ()
rotate_z cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_z (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_translate #-}

-- | Changes the node's position by given offset [Vector3].
bindSpatial_translate :: MethodBind
bindSpatial_translate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the node's position by given offset [Vector3].
translate ::
            (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_translate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_orthonormalize #-}

-- | Resets this node's transformations (like scale, skew and taper) preserving its rotation and translation by performing Gram-Schmidt orthonormalization on this node's [Transform].
bindSpatial_orthonormalize :: MethodBind
bindSpatial_orthonormalize
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "orthonormalize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resets this node's transformations (like scale, skew and taper) preserving its rotation and translation by performing Gram-Schmidt orthonormalization on this node's [Transform].
orthonormalize :: (Spatial :< cls, Object :< cls) => cls -> IO ()
orthonormalize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_orthonormalize (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_set_identity #-}

-- | Reset all transformations for this node. Set its [Transform] to identity matrix.
bindSpatial_set_identity :: MethodBind
bindSpatial_set_identity
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_identity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reset all transformations for this node. Set its [Transform] to identity matrix.
set_identity :: (Spatial :< cls, Object :< cls) => cls -> IO ()
set_identity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_identity (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_look_at #-}

-- | Rotates itself so that the local -Z axis points towards the [code]target[/code] position.
--   				The transform will first be rotated around the given [code]up[/code] vector, and then fully aligned to the target by a further rotation around an axis perpendicular to both the [code]target[/code] and [code]up[/code] vectors.
--   				Operations take place in global space.
bindSpatial_look_at :: MethodBind
bindSpatial_look_at
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "look_at" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates itself so that the local -Z axis points towards the [code]target[/code] position.
--   				The transform will first be rotated around the given [code]up[/code] vector, and then fully aligned to the target by a further rotation around an axis perpendicular to both the [code]target[/code] and [code]up[/code] vectors.
--   				Operations take place in global space.
look_at ::
          (Spatial :< cls, Object :< cls) =>
          cls -> Vector3 -> Vector3 -> IO ()
look_at cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_look_at (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_look_at_from_position #-}

-- | Moves the node to the specified [code]position[/code], and then rotates itself to point toward the [code]target[/code] as per [method look_at]. Operations take place in global space.
bindSpatial_look_at_from_position :: MethodBind
bindSpatial_look_at_from_position
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "look_at_from_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the node to the specified [code]position[/code], and then rotates itself to point toward the [code]target[/code] as per [method look_at]. Operations take place in global space.
look_at_from_position ::
                        (Spatial :< cls, Object :< cls) =>
                        cls -> Vector3 -> Vector3 -> Vector3 -> IO ()
look_at_from_position cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_look_at_from_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_to_local #-}

-- | Transforms [Vector3] "global_point" from world space to this node's local space.
bindSpatial_to_local :: MethodBind
bindSpatial_to_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "to_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Transforms [Vector3] "global_point" from world space to this node's local space.
to_local ::
           (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
to_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_to_local (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatial_to_global #-}

-- | Transforms [Vector3] "local_point" from this node's local space to world space.
bindSpatial_to_global :: MethodBind
bindSpatial_to_global
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "to_global" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Transforms [Vector3] "local_point" from this node's local space to world space.
to_global ::
            (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
to_global cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_to_global (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)