{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Spatial
       (Godot.Core.Spatial._NOTIFICATION_ENTER_WORLD,
        Godot.Core.Spatial._NOTIFICATION_EXIT_WORLD,
        Godot.Core.Spatial._NOTIFICATION_TRANSFORM_CHANGED,
        Godot.Core.Spatial._NOTIFICATION_VISIBILITY_CHANGED,
        Godot.Core.Spatial.sig_visibility_changed,
        Godot.Core.Spatial._update_gizmo,
        Godot.Core.Spatial.force_update_transform,
        Godot.Core.Spatial.get_gizmo,
        Godot.Core.Spatial.get_global_transform,
        Godot.Core.Spatial.get_parent_spatial,
        Godot.Core.Spatial.get_rotation,
        Godot.Core.Spatial.get_rotation_degrees,
        Godot.Core.Spatial.get_scale, Godot.Core.Spatial.get_transform,
        Godot.Core.Spatial.get_translation, Godot.Core.Spatial.get_world,
        Godot.Core.Spatial.global_rotate, Godot.Core.Spatial.global_scale,
        Godot.Core.Spatial.global_translate, Godot.Core.Spatial.hide,
        Godot.Core.Spatial.is_local_transform_notification_enabled,
        Godot.Core.Spatial.is_scale_disabled,
        Godot.Core.Spatial.is_set_as_toplevel,
        Godot.Core.Spatial.is_transform_notification_enabled,
        Godot.Core.Spatial.is_visible,
        Godot.Core.Spatial.is_visible_in_tree, Godot.Core.Spatial.look_at,
        Godot.Core.Spatial.look_at_from_position,
        Godot.Core.Spatial.orthonormalize, Godot.Core.Spatial.rotate,
        Godot.Core.Spatial.rotate_object_local,
        Godot.Core.Spatial.rotate_x, Godot.Core.Spatial.rotate_y,
        Godot.Core.Spatial.rotate_z, Godot.Core.Spatial.scale_object_local,
        Godot.Core.Spatial.set_as_toplevel,
        Godot.Core.Spatial.set_disable_scale, Godot.Core.Spatial.set_gizmo,
        Godot.Core.Spatial.set_global_transform,
        Godot.Core.Spatial.set_identity,
        Godot.Core.Spatial.set_ignore_transform_notification,
        Godot.Core.Spatial.set_notify_local_transform,
        Godot.Core.Spatial.set_notify_transform,
        Godot.Core.Spatial.set_rotation,
        Godot.Core.Spatial.set_rotation_degrees,
        Godot.Core.Spatial.set_scale, Godot.Core.Spatial.set_transform,
        Godot.Core.Spatial.set_translation, Godot.Core.Spatial.set_visible,
        Godot.Core.Spatial.show, Godot.Core.Spatial.to_global,
        Godot.Core.Spatial.to_local, Godot.Core.Spatial.translate,
        Godot.Core.Spatial.translate_object_local,
        Godot.Core.Spatial.update_gizmo)
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
import Godot.Core.Node()

_NOTIFICATION_ENTER_WORLD :: Int
_NOTIFICATION_ENTER_WORLD = 41

_NOTIFICATION_EXIT_WORLD :: Int
_NOTIFICATION_EXIT_WORLD = 42

_NOTIFICATION_TRANSFORM_CHANGED :: Int
_NOTIFICATION_TRANSFORM_CHANGED = 2000

_NOTIFICATION_VISIBILITY_CHANGED :: Int
_NOTIFICATION_VISIBILITY_CHANGED = 43

-- | Emitted when node visibility changes.
sig_visibility_changed :: Godot.Internal.Dispatch.Signal Spatial
sig_visibility_changed
  = Godot.Internal.Dispatch.Signal "visibility_changed"

instance NodeSignal Spatial "visibility_changed" '[]

instance NodeProperty Spatial "gizmo" SpatialGizmo 'False where
        nodeProperty = (get_gizmo, wrapDroppingSetter set_gizmo, Nothing)

instance NodeProperty Spatial "global_transform" Transform 'False
         where
        nodeProperty
          = (get_global_transform, wrapDroppingSetter set_global_transform,
             Nothing)

instance NodeProperty Spatial "rotation" Vector3 'False where
        nodeProperty
          = (get_rotation, wrapDroppingSetter set_rotation, Nothing)

instance NodeProperty Spatial "rotation_degrees" Vector3 'False
         where
        nodeProperty
          = (get_rotation_degrees, wrapDroppingSetter set_rotation_degrees,
             Nothing)

instance NodeProperty Spatial "scale" Vector3 'False where
        nodeProperty = (get_scale, wrapDroppingSetter set_scale, Nothing)

instance NodeProperty Spatial "transform" Transform 'False where
        nodeProperty
          = (get_transform, wrapDroppingSetter set_transform, Nothing)

instance NodeProperty Spatial "translation" Vector3 'False where
        nodeProperty
          = (get_translation, wrapDroppingSetter set_translation, Nothing)

instance NodeProperty Spatial "visible" Bool 'False where
        nodeProperty
          = (is_visible, wrapDroppingSetter set_visible, Nothing)

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

instance NodeMethod Spatial "_update_gizmo" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial._update_gizmo

{-# NOINLINE bindSpatial_force_update_transform #-}

-- | Forces the transform to update. Transform changes in physics are not instant for performance reasons. Transforms are accumulated and then set. Use this if you need an up-to-date transform when doing physics operations.
bindSpatial_force_update_transform :: MethodBind
bindSpatial_force_update_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "force_update_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Forces the transform to update. Transform changes in physics are not instant for performance reasons. Transforms are accumulated and then set. Use this if you need an up-to-date transform when doing physics operations.
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

instance NodeMethod Spatial "force_update_transform" '[] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.force_update_transform

{-# NOINLINE bindSpatial_get_gizmo #-}

-- | The @SpatialGizmo@ for this node. Used for example in @EditorSpatialGizmo@ as custom visualization and editing handles in Editor.
bindSpatial_get_gizmo :: MethodBind
bindSpatial_get_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @SpatialGizmo@ for this node. Used for example in @EditorSpatialGizmo@ as custom visualization and editing handles in Editor.
get_gizmo ::
            (Spatial :< cls, Object :< cls) => cls -> IO SpatialGizmo
get_gizmo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_gizmo" '[] (IO SpatialGizmo) where
        nodeMethod = Godot.Core.Spatial.get_gizmo

{-# NOINLINE bindSpatial_get_global_transform #-}

-- | World space (global) @Transform@ of this node.
bindSpatial_get_global_transform :: MethodBind
bindSpatial_get_global_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | World space (global) @Transform@ of this node.
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

instance NodeMethod Spatial "get_global_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.Spatial.get_global_transform

{-# NOINLINE bindSpatial_get_parent_spatial #-}

-- | Returns the parent @Spatial@, or an empty @Object@ if no parent exists or parent is not of type @Spatial@.
bindSpatial_get_parent_spatial :: MethodBind
bindSpatial_get_parent_spatial
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_parent_spatial" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent @Spatial@, or an empty @Object@ if no parent exists or parent is not of type @Spatial@.
get_parent_spatial ::
                     (Spatial :< cls, Object :< cls) => cls -> IO Spatial
get_parent_spatial cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_parent_spatial (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_parent_spatial" '[] (IO Spatial)
         where
        nodeMethod = Godot.Core.Spatial.get_parent_spatial

{-# NOINLINE bindSpatial_get_rotation #-}

-- | Rotation part of the local transformation in radians, specified in terms of YXZ-Euler angles in the format (X angle, Y angle, Z angle).
--   			__Note:__ In the mathematical sense, rotation is a matrix and not a vector. The three Euler angles, which are the three independent parameters of the Euler-angle parametrization of the rotation matrix, are stored in a @Vector3@ data structure not because the rotation is a vector, but only because @Vector3@ exists as a convenient data-structure to store 3 floating-point numbers. Therefore, applying affine operations on the rotation "vector" is not meaningful.
bindSpatial_get_rotation :: MethodBind
bindSpatial_get_rotation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation part of the local transformation in radians, specified in terms of YXZ-Euler angles in the format (X angle, Y angle, Z angle).
--   			__Note:__ In the mathematical sense, rotation is a matrix and not a vector. The three Euler angles, which are the three independent parameters of the Euler-angle parametrization of the rotation matrix, are stored in a @Vector3@ data structure not because the rotation is a vector, but only because @Vector3@ exists as a convenient data-structure to store 3 floating-point numbers. Therefore, applying affine operations on the rotation "vector" is not meaningful.
get_rotation ::
               (Spatial :< cls, Object :< cls) => cls -> IO Vector3
get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_rotation" '[] (IO Vector3) where
        nodeMethod = Godot.Core.Spatial.get_rotation

{-# NOINLINE bindSpatial_get_rotation_degrees #-}

-- | Rotation part of the local transformation in degrees, specified in terms of YXZ-Euler angles in the format (X angle, Y angle, Z angle).
bindSpatial_get_rotation_degrees :: MethodBind
bindSpatial_get_rotation_degrees
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation part of the local transformation in degrees, specified in terms of YXZ-Euler angles in the format (X angle, Y angle, Z angle).
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

instance NodeMethod Spatial "get_rotation_degrees" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Spatial.get_rotation_degrees

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

instance NodeMethod Spatial "get_scale" '[] (IO Vector3) where
        nodeMethod = Godot.Core.Spatial.get_scale

{-# NOINLINE bindSpatial_get_transform #-}

-- | Local space @Transform@ of this node, with respect to the parent node.
bindSpatial_get_transform :: MethodBind
bindSpatial_get_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Local space @Transform@ of this node, with respect to the parent node.
get_transform ::
                (Spatial :< cls, Object :< cls) => cls -> IO Transform
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_transform" '[] (IO Transform)
         where
        nodeMethod = Godot.Core.Spatial.get_transform

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

instance NodeMethod Spatial "get_translation" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Spatial.get_translation

{-# NOINLINE bindSpatial_get_world #-}

-- | Returns the current @World@ resource this @Spatial@ node is registered to.
bindSpatial_get_world :: MethodBind
bindSpatial_get_world
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "get_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current @World@ resource this @Spatial@ node is registered to.
get_world :: (Spatial :< cls, Object :< cls) => cls -> IO World
get_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_get_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "get_world" '[] (IO World) where
        nodeMethod = Godot.Core.Spatial.get_world

{-# NOINLINE bindSpatial_global_rotate #-}

-- | Rotates the global (world) transformation around axis, a unit @Vector3@, by specified angle in radians. The rotation axis is in global coordinate system.
bindSpatial_global_rotate :: MethodBind
bindSpatial_global_rotate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_rotate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the global (world) transformation around axis, a unit @Vector3@, by specified angle in radians. The rotation axis is in global coordinate system.
global_rotate ::
                (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
global_rotate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_rotate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "global_rotate" '[Vector3, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.global_rotate

{-# NOINLINE bindSpatial_global_scale #-}

-- | Scales the global (world) transformation by the given @Vector3@ scale factors.
bindSpatial_global_scale :: MethodBind
bindSpatial_global_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Scales the global (world) transformation by the given @Vector3@ scale factors.
global_scale ::
               (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
global_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "global_scale" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Spatial.global_scale

{-# NOINLINE bindSpatial_global_translate #-}

-- | Moves the global (world) transformation by @Vector3@ offset. The offset is in global coordinate system.
bindSpatial_global_translate :: MethodBind
bindSpatial_global_translate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "global_translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the global (world) transformation by @Vector3@ offset. The offset is in global coordinate system.
global_translate ::
                   (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
global_translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_global_translate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "global_translate" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.global_translate

{-# NOINLINE bindSpatial_hide #-}

-- | Disables rendering of this node. Changes @visible@ to @false@.
bindSpatial_hide :: MethodBind
bindSpatial_hide
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "hide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables rendering of this node. Changes @visible@ to @false@.
hide :: (Spatial :< cls, Object :< cls) => cls -> IO ()
hide cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_hide (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "hide" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.hide

{-# NOINLINE bindSpatial_is_local_transform_notification_enabled
             #-}

-- | Returns whether node notifies about its local transformation changes. @Spatial@ will not propagate this by default.
bindSpatial_is_local_transform_notification_enabled :: MethodBind
bindSpatial_is_local_transform_notification_enabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_local_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether node notifies about its local transformation changes. @Spatial@ will not propagate this by default.
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

instance NodeMethod Spatial
           "is_local_transform_notification_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.Spatial.is_local_transform_notification_enabled

{-# NOINLINE bindSpatial_is_scale_disabled #-}

-- | Returns whether this node uses a scale of @(1, 1, 1)@ or its local transformation scale.
bindSpatial_is_scale_disabled :: MethodBind
bindSpatial_is_scale_disabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_scale_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether this node uses a scale of @(1, 1, 1)@ or its local transformation scale.
is_scale_disabled ::
                    (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_scale_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_scale_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "is_scale_disabled" '[] (IO Bool) where
        nodeMethod = Godot.Core.Spatial.is_scale_disabled

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

instance NodeMethod Spatial "is_set_as_toplevel" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Spatial.is_set_as_toplevel

{-# NOINLINE bindSpatial_is_transform_notification_enabled #-}

-- | Returns whether the node notifies about its global and local transformation changes. @Spatial@ will not propagate this by default.
bindSpatial_is_transform_notification_enabled :: MethodBind
bindSpatial_is_transform_notification_enabled
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the node notifies about its global and local transformation changes. @Spatial@ will not propagate this by default.
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

instance NodeMethod Spatial "is_transform_notification_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Spatial.is_transform_notification_enabled

{-# NOINLINE bindSpatial_is_visible #-}

-- | If @true@, this node is drawn. The node is only visible if all of its antecedents are visible as well (in other words, @method is_visible_in_tree@ must return @true@).
bindSpatial_is_visible :: MethodBind
bindSpatial_is_visible
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this node is drawn. The node is only visible if all of its antecedents are visible as well (in other words, @method is_visible_in_tree@ must return @true@).
is_visible :: (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_visible (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "is_visible" '[] (IO Bool) where
        nodeMethod = Godot.Core.Spatial.is_visible

{-# NOINLINE bindSpatial_is_visible_in_tree #-}

-- | Returns @true@ if the node is present in the @SceneTree@, its @visible@ property is @true@ and all its antecedents are also visible. If any antecedent is hidden, this node will not be visible in the scene tree.
bindSpatial_is_visible_in_tree :: MethodBind
bindSpatial_is_visible_in_tree
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "is_visible_in_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the node is present in the @SceneTree@, its @visible@ property is @true@ and all its antecedents are also visible. If any antecedent is hidden, this node will not be visible in the scene tree.
is_visible_in_tree ::
                     (Spatial :< cls, Object :< cls) => cls -> IO Bool
is_visible_in_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_is_visible_in_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "is_visible_in_tree" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Spatial.is_visible_in_tree

{-# NOINLINE bindSpatial_look_at #-}

-- | Rotates the node so that the local forward axis (-Z) points toward the @target@ position.
--   				The local up axis (+Y) points as close to the @up@ vector as possible while staying perpendicular to the local forward axis. The resulting transform is orthogonal, and the scale is preserved. Non-uniform scaling may not work correctly.
--   				The @target@ position cannot be the same as the node's position, the @up@ vector cannot be zero, and the direction from the node's position to the @target@ vector cannot be parallel to the @up@ vector.
--   				Operations take place in global space.
bindSpatial_look_at :: MethodBind
bindSpatial_look_at
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "look_at" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the node so that the local forward axis (-Z) points toward the @target@ position.
--   				The local up axis (+Y) points as close to the @up@ vector as possible while staying perpendicular to the local forward axis. The resulting transform is orthogonal, and the scale is preserved. Non-uniform scaling may not work correctly.
--   				The @target@ position cannot be the same as the node's position, the @up@ vector cannot be zero, and the direction from the node's position to the @target@ vector cannot be parallel to the @up@ vector.
--   				Operations take place in global space.
look_at ::
          (Spatial :< cls, Object :< cls) =>
          cls -> Vector3 -> Vector3 -> IO ()
look_at cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_look_at (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "look_at" '[Vector3, Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.look_at

{-# NOINLINE bindSpatial_look_at_from_position #-}

-- | Moves the node to the specified @position@, and then rotates itself to point toward the @target@ as per @method look_at@. Operations take place in global space.
bindSpatial_look_at_from_position :: MethodBind
bindSpatial_look_at_from_position
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "look_at_from_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the node to the specified @position@, and then rotates itself to point toward the @target@ as per @method look_at@. Operations take place in global space.
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

instance NodeMethod Spatial "look_at_from_position"
           '[Vector3, Vector3, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.look_at_from_position

{-# NOINLINE bindSpatial_orthonormalize #-}

-- | Resets this node's transformations (like scale, skew and taper) preserving its rotation and translation by performing Gram-Schmidt orthonormalization on this node's @Transform@.
bindSpatial_orthonormalize :: MethodBind
bindSpatial_orthonormalize
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "orthonormalize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resets this node's transformations (like scale, skew and taper) preserving its rotation and translation by performing Gram-Schmidt orthonormalization on this node's @Transform@.
orthonormalize :: (Spatial :< cls, Object :< cls) => cls -> IO ()
orthonormalize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_orthonormalize (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "orthonormalize" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.orthonormalize

{-# NOINLINE bindSpatial_rotate #-}

-- | Rotates the local transformation around axis, a unit @Vector3@, by specified angle in radians.
bindSpatial_rotate :: MethodBind
bindSpatial_rotate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the local transformation around axis, a unit @Vector3@, by specified angle in radians.
rotate ::
         (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
rotate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "rotate" '[Vector3, Float] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.rotate

{-# NOINLINE bindSpatial_rotate_object_local #-}

-- | Rotates the local transformation around axis, a unit @Vector3@, by specified angle in radians. The rotation axis is in object-local coordinate system.
bindSpatial_rotate_object_local :: MethodBind
bindSpatial_rotate_object_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_object_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the local transformation around axis, a unit @Vector3@, by specified angle in radians. The rotation axis is in object-local coordinate system.
rotate_object_local ::
                      (Spatial :< cls, Object :< cls) => cls -> Vector3 -> Float -> IO ()
rotate_object_local cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_object_local (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "rotate_object_local" '[Vector3, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.rotate_object_local

{-# NOINLINE bindSpatial_rotate_x #-}

-- | Rotates the local transformation around the X axis by angle in radians.
bindSpatial_rotate_x :: MethodBind
bindSpatial_rotate_x
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "rotate_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the local transformation around the X axis by angle in radians.
rotate_x ::
           (Spatial :< cls, Object :< cls) => cls -> Float -> IO ()
rotate_x cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_rotate_x (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "rotate_x" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Spatial.rotate_x

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

instance NodeMethod Spatial "rotate_y" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Spatial.rotate_y

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

instance NodeMethod Spatial "rotate_z" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Spatial.rotate_z

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

instance NodeMethod Spatial "scale_object_local" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.scale_object_local

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

instance NodeMethod Spatial "set_as_toplevel" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_as_toplevel

{-# NOINLINE bindSpatial_set_disable_scale #-}

-- | Sets whether the node uses a scale of @(1, 1, 1)@ or its local transformation scale. Changes to the local transformation scale are preserved.
bindSpatial_set_disable_scale :: MethodBind
bindSpatial_set_disable_scale
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_disable_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the node uses a scale of @(1, 1, 1)@ or its local transformation scale. Changes to the local transformation scale are preserved.
set_disable_scale ::
                    (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_disable_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_disable_scale" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_disable_scale

{-# NOINLINE bindSpatial_set_gizmo #-}

-- | The @SpatialGizmo@ for this node. Used for example in @EditorSpatialGizmo@ as custom visualization and editing handles in Editor.
bindSpatial_set_gizmo :: MethodBind
bindSpatial_set_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @SpatialGizmo@ for this node. Used for example in @EditorSpatialGizmo@ as custom visualization and editing handles in Editor.
set_gizmo ::
            (Spatial :< cls, Object :< cls) => cls -> SpatialGizmo -> IO ()
set_gizmo cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_gizmo" '[SpatialGizmo] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_gizmo

{-# NOINLINE bindSpatial_set_global_transform #-}

-- | World space (global) @Transform@ of this node.
bindSpatial_set_global_transform :: MethodBind
bindSpatial_set_global_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | World space (global) @Transform@ of this node.
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

instance NodeMethod Spatial "set_global_transform" '[Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_global_transform

{-# NOINLINE bindSpatial_set_identity #-}

-- | Reset all transformations for this node (sets its @Transform@ to the identity matrix).
bindSpatial_set_identity :: MethodBind
bindSpatial_set_identity
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_identity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reset all transformations for this node (sets its @Transform@ to the identity matrix).
set_identity :: (Spatial :< cls, Object :< cls) => cls -> IO ()
set_identity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_identity (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_identity" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_identity

{-# NOINLINE bindSpatial_set_ignore_transform_notification #-}

-- | Sets whether the node ignores notification that its transformation (global or local) changed.
bindSpatial_set_ignore_transform_notification :: MethodBind
bindSpatial_set_ignore_transform_notification
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_ignore_transform_notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the node ignores notification that its transformation (global or local) changed.
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

instance NodeMethod Spatial "set_ignore_transform_notification"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_ignore_transform_notification

{-# NOINLINE bindSpatial_set_notify_local_transform #-}

-- | Sets whether the node notifies about its local transformation changes. @Spatial@ will not propagate this by default.
bindSpatial_set_notify_local_transform :: MethodBind
bindSpatial_set_notify_local_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_notify_local_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the node notifies about its local transformation changes. @Spatial@ will not propagate this by default.
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

instance NodeMethod Spatial "set_notify_local_transform" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_notify_local_transform

{-# NOINLINE bindSpatial_set_notify_transform #-}

-- | Sets whether the node notifies about its global and local transformation changes. @Spatial@ will not propagate this by default, unless it is in the editor context and it has a valid gizmo.
bindSpatial_set_notify_transform :: MethodBind
bindSpatial_set_notify_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_notify_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the node notifies about its global and local transformation changes. @Spatial@ will not propagate this by default, unless it is in the editor context and it has a valid gizmo.
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

instance NodeMethod Spatial "set_notify_transform" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_notify_transform

{-# NOINLINE bindSpatial_set_rotation #-}

-- | Rotation part of the local transformation in radians, specified in terms of YXZ-Euler angles in the format (X angle, Y angle, Z angle).
--   			__Note:__ In the mathematical sense, rotation is a matrix and not a vector. The three Euler angles, which are the three independent parameters of the Euler-angle parametrization of the rotation matrix, are stored in a @Vector3@ data structure not because the rotation is a vector, but only because @Vector3@ exists as a convenient data-structure to store 3 floating-point numbers. Therefore, applying affine operations on the rotation "vector" is not meaningful.
bindSpatial_set_rotation :: MethodBind
bindSpatial_set_rotation
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation part of the local transformation in radians, specified in terms of YXZ-Euler angles in the format (X angle, Y angle, Z angle).
--   			__Note:__ In the mathematical sense, rotation is a matrix and not a vector. The three Euler angles, which are the three independent parameters of the Euler-angle parametrization of the rotation matrix, are stored in a @Vector3@ data structure not because the rotation is a vector, but only because @Vector3@ exists as a convenient data-structure to store 3 floating-point numbers. Therefore, applying affine operations on the rotation "vector" is not meaningful.
set_rotation ::
               (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_rotation" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_rotation

{-# NOINLINE bindSpatial_set_rotation_degrees #-}

-- | Rotation part of the local transformation in degrees, specified in terms of YXZ-Euler angles in the format (X angle, Y angle, Z angle).
bindSpatial_set_rotation_degrees :: MethodBind
bindSpatial_set_rotation_degrees
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation part of the local transformation in degrees, specified in terms of YXZ-Euler angles in the format (X angle, Y angle, Z angle).
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

instance NodeMethod Spatial "set_rotation_degrees" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_rotation_degrees

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

instance NodeMethod Spatial "set_scale" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_scale

{-# NOINLINE bindSpatial_set_transform #-}

-- | Local space @Transform@ of this node, with respect to the parent node.
bindSpatial_set_transform :: MethodBind
bindSpatial_set_transform
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Local space @Transform@ of this node, with respect to the parent node.
set_transform ::
                (Spatial :< cls, Object :< cls) => cls -> Transform -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_transform" '[Transform] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_transform

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

instance NodeMethod Spatial "set_translation" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Spatial.set_translation

{-# NOINLINE bindSpatial_set_visible #-}

-- | If @true@, this node is drawn. The node is only visible if all of its antecedents are visible as well (in other words, @method is_visible_in_tree@ must return @true@).
bindSpatial_set_visible :: MethodBind
bindSpatial_set_visible
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this node is drawn. The node is only visible if all of its antecedents are visible as well (in other words, @method is_visible_in_tree@ must return @true@).
set_visible ::
              (Spatial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_set_visible (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "set_visible" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Spatial.set_visible

{-# NOINLINE bindSpatial_show #-}

-- | Enables rendering of this node. Changes @visible@ to @true@.
bindSpatial_show :: MethodBind
bindSpatial_show
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "show" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables rendering of this node. Changes @visible@ to @true@.
show :: (Spatial :< cls, Object :< cls) => cls -> IO ()
show cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_show (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "show" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.show

{-# NOINLINE bindSpatial_to_global #-}

-- | Transforms @local_point@ from this node's local space to world space.
bindSpatial_to_global :: MethodBind
bindSpatial_to_global
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "to_global" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Transforms @local_point@ from this node's local space to world space.
to_global ::
            (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
to_global cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_to_global (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "to_global" '[Vector3] (IO Vector3)
         where
        nodeMethod = Godot.Core.Spatial.to_global

{-# NOINLINE bindSpatial_to_local #-}

-- | Transforms @global_point@ from world space to this node's local space.
bindSpatial_to_local :: MethodBind
bindSpatial_to_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "to_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Transforms @global_point@ from world space to this node's local space.
to_local ::
           (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
to_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_to_local (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "to_local" '[Vector3] (IO Vector3)
         where
        nodeMethod = Godot.Core.Spatial.to_local

{-# NOINLINE bindSpatial_translate #-}

-- | Changes the node's position by the given offset @Vector3@.
--   				Note that the translation @offset@ is affected by the node's scale, so if scaled by e.g. @(10, 1, 1)@, a translation by an offset of @(2, 0, 0)@ would actually add 20 (@2 * 10@) to the X coordinate.
bindSpatial_translate :: MethodBind
bindSpatial_translate
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the node's position by the given offset @Vector3@.
--   				Note that the translation @offset@ is affected by the node's scale, so if scaled by e.g. @(10, 1, 1)@, a translation by an offset of @(2, 0, 0)@ would actually add 20 (@2 * 10@) to the X coordinate.
translate ::
            (Spatial :< cls, Object :< cls) => cls -> Vector3 -> IO ()
translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_translate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "translate" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.Spatial.translate

{-# NOINLINE bindSpatial_translate_object_local #-}

-- | Changes the node's position by the given offset @Vector3@ in local space.
bindSpatial_translate_object_local :: MethodBind
bindSpatial_translate_object_local
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "translate_object_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the node's position by the given offset @Vector3@ in local space.
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

instance NodeMethod Spatial "translate_object_local" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.Spatial.translate_object_local

{-# NOINLINE bindSpatial_update_gizmo #-}

-- | Updates the @SpatialGizmo@ of this node.
bindSpatial_update_gizmo :: MethodBind
bindSpatial_update_gizmo
  = unsafePerformIO $
      withCString "Spatial" $
        \ clsNamePtr ->
          withCString "update_gizmo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the @SpatialGizmo@ of this node.
update_gizmo :: (Spatial :< cls, Object :< cls) => cls -> IO ()
update_gizmo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatial_update_gizmo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Spatial "update_gizmo" '[] (IO ()) where
        nodeMethod = Godot.Core.Spatial.update_gizmo