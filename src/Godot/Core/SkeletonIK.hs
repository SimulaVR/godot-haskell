{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SkeletonIK
       (Godot.Core.SkeletonIK.get_interpolation,
        Godot.Core.SkeletonIK.get_magnet_position,
        Godot.Core.SkeletonIK.get_max_iterations,
        Godot.Core.SkeletonIK.get_min_distance,
        Godot.Core.SkeletonIK.get_parent_skeleton,
        Godot.Core.SkeletonIK.get_root_bone,
        Godot.Core.SkeletonIK.get_target_node,
        Godot.Core.SkeletonIK.get_target_transform,
        Godot.Core.SkeletonIK.get_tip_bone,
        Godot.Core.SkeletonIK.is_override_tip_basis,
        Godot.Core.SkeletonIK.is_running,
        Godot.Core.SkeletonIK.is_using_magnet,
        Godot.Core.SkeletonIK.set_interpolation,
        Godot.Core.SkeletonIK.set_magnet_position,
        Godot.Core.SkeletonIK.set_max_iterations,
        Godot.Core.SkeletonIK.set_min_distance,
        Godot.Core.SkeletonIK.set_override_tip_basis,
        Godot.Core.SkeletonIK.set_root_bone,
        Godot.Core.SkeletonIK.set_target_node,
        Godot.Core.SkeletonIK.set_target_transform,
        Godot.Core.SkeletonIK.set_tip_bone,
        Godot.Core.SkeletonIK.set_use_magnet, Godot.Core.SkeletonIK.start,
        Godot.Core.SkeletonIK.stop)
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

instance NodeProperty SkeletonIK "interpolation" Float 'False where
        nodeProperty
          = (get_interpolation, wrapDroppingSetter set_interpolation,
             Nothing)

instance NodeProperty SkeletonIK "magnet" Vector3 'False where
        nodeProperty
          = (get_magnet_position, wrapDroppingSetter set_magnet_position,
             Nothing)

instance NodeProperty SkeletonIK "max_iterations" Int 'False where
        nodeProperty
          = (get_max_iterations, wrapDroppingSetter set_max_iterations,
             Nothing)

instance NodeProperty SkeletonIK "min_distance" Float 'False where
        nodeProperty
          = (get_min_distance, wrapDroppingSetter set_min_distance, Nothing)

instance NodeProperty SkeletonIK "override_tip_basis" Bool 'False
         where
        nodeProperty
          = (is_override_tip_basis,
             wrapDroppingSetter set_override_tip_basis, Nothing)

instance NodeProperty SkeletonIK "root_bone" GodotString 'False
         where
        nodeProperty
          = (get_root_bone, wrapDroppingSetter set_root_bone, Nothing)

instance NodeProperty SkeletonIK "target" Transform 'False where
        nodeProperty
          = (get_target_transform, wrapDroppingSetter set_target_transform,
             Nothing)

instance NodeProperty SkeletonIK "target_node" NodePath 'False
         where
        nodeProperty
          = (get_target_node, wrapDroppingSetter set_target_node, Nothing)

instance NodeProperty SkeletonIK "tip_bone" GodotString 'False
         where
        nodeProperty
          = (get_tip_bone, wrapDroppingSetter set_tip_bone, Nothing)

instance NodeProperty SkeletonIK "use_magnet" Bool 'False where
        nodeProperty
          = (is_using_magnet, wrapDroppingSetter set_use_magnet, Nothing)

{-# NOINLINE bindSkeletonIK_get_interpolation #-}

-- | Interpolation value for how much the IK results are applied to the current skeleton bone chain. A value of @1.0@ will overwrite all skeleton bone transforms completely while a value of @0.0@ will visually disable the SkeletonIK. A value at or below @0.01@ also calls @method Skeleton.clear_bones_global_pose_override@.
bindSkeletonIK_get_interpolation :: MethodBind
bindSkeletonIK_get_interpolation
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_interpolation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Interpolation value for how much the IK results are applied to the current skeleton bone chain. A value of @1.0@ will overwrite all skeleton bone transforms completely while a value of @0.0@ will visually disable the SkeletonIK. A value at or below @0.01@ also calls @method Skeleton.clear_bones_global_pose_override@.
get_interpolation ::
                    (SkeletonIK :< cls, Object :< cls) => cls -> IO Float
get_interpolation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_interpolation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_interpolation" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_interpolation

{-# NOINLINE bindSkeletonIK_get_magnet_position #-}

-- | Secondary target position (first is @target@ property or @target_node@) for the IK chain. Use magnet position (pole target) to control the bending of the IK chain. Only works if the bone chain has more than 2 bones. The middle chain bone position will be linearly interpolated with the magnet position.
bindSkeletonIK_get_magnet_position :: MethodBind
bindSkeletonIK_get_magnet_position
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_magnet_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Secondary target position (first is @target@ property or @target_node@) for the IK chain. Use magnet position (pole target) to control the bending of the IK chain. Only works if the bone chain has more than 2 bones. The middle chain bone position will be linearly interpolated with the magnet position.
get_magnet_position ::
                      (SkeletonIK :< cls, Object :< cls) => cls -> IO Vector3
get_magnet_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_magnet_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_magnet_position" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_magnet_position

{-# NOINLINE bindSkeletonIK_get_max_iterations #-}

-- | Number of iteration loops used by the IK solver to produce more accurate (and elegant) bone chain results.
bindSkeletonIK_get_max_iterations :: MethodBind
bindSkeletonIK_get_max_iterations
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_max_iterations" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of iteration loops used by the IK solver to produce more accurate (and elegant) bone chain results.
get_max_iterations ::
                     (SkeletonIK :< cls, Object :< cls) => cls -> IO Int
get_max_iterations cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_max_iterations
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_max_iterations" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_max_iterations

{-# NOINLINE bindSkeletonIK_get_min_distance #-}

-- | The minimum distance between bone and goal target. If the distance is below this value, the IK solver stops further iterations.
bindSkeletonIK_get_min_distance :: MethodBind
bindSkeletonIK_get_min_distance
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_min_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum distance between bone and goal target. If the distance is below this value, the IK solver stops further iterations.
get_min_distance ::
                   (SkeletonIK :< cls, Object :< cls) => cls -> IO Float
get_min_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_min_distance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_min_distance" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_min_distance

{-# NOINLINE bindSkeletonIK_get_parent_skeleton #-}

-- | Returns the parent @Skeleton@ Node that was present when SkeletonIK entered the @SceneTree@. Returns null if the parent node was not a @Skeleton@ Node when SkeletonIK entered the @SceneTree@.
bindSkeletonIK_get_parent_skeleton :: MethodBind
bindSkeletonIK_get_parent_skeleton
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_parent_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent @Skeleton@ Node that was present when SkeletonIK entered the @SceneTree@. Returns null if the parent node was not a @Skeleton@ Node when SkeletonIK entered the @SceneTree@.
get_parent_skeleton ::
                      (SkeletonIK :< cls, Object :< cls) => cls -> IO Skeleton
get_parent_skeleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_parent_skeleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_parent_skeleton" '[]
           (IO Skeleton)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_parent_skeleton

{-# NOINLINE bindSkeletonIK_get_root_bone #-}

-- | The name of the current root bone, the first bone in the IK chain.
bindSkeletonIK_get_root_bone :: MethodBind
bindSkeletonIK_get_root_bone
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_root_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the current root bone, the first bone in the IK chain.
get_root_bone ::
                (SkeletonIK :< cls, Object :< cls) => cls -> IO GodotString
get_root_bone cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_root_bone (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_root_bone" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_root_bone

{-# NOINLINE bindSkeletonIK_get_target_node #-}

-- | Target node @NodePath@ for the IK chain. If available, the node's current @Transform@ is used instead of the @target@ property.
bindSkeletonIK_get_target_node :: MethodBind
bindSkeletonIK_get_target_node
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_target_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Target node @NodePath@ for the IK chain. If available, the node's current @Transform@ is used instead of the @target@ property.
get_target_node ::
                  (SkeletonIK :< cls, Object :< cls) => cls -> IO NodePath
get_target_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_target_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_target_node" '[] (IO NodePath)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_target_node

{-# NOINLINE bindSkeletonIK_get_target_transform #-}

-- | First target of the IK chain where the tip bone is placed and, if @override_tip_basis@ is @true@, how the tip bone is rotated. If a @target_node@ path is available the nodes transform is used instead and this property is ignored.
bindSkeletonIK_get_target_transform :: MethodBind
bindSkeletonIK_get_target_transform
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_target_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | First target of the IK chain where the tip bone is placed and, if @override_tip_basis@ is @true@, how the tip bone is rotated. If a @target_node@ path is available the nodes transform is used instead and this property is ignored.
get_target_transform ::
                       (SkeletonIK :< cls, Object :< cls) => cls -> IO Transform
get_target_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_target_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_target_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_target_transform

{-# NOINLINE bindSkeletonIK_get_tip_bone #-}

-- | The name of the current tip bone, the last bone in the IK chain placed at the @target@ transform (or @target_node@ if defined).
bindSkeletonIK_get_tip_bone :: MethodBind
bindSkeletonIK_get_tip_bone
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "get_tip_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the current tip bone, the last bone in the IK chain placed at the @target@ transform (or @target_node@ if defined).
get_tip_bone ::
               (SkeletonIK :< cls, Object :< cls) => cls -> IO GodotString
get_tip_bone cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_get_tip_bone (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "get_tip_bone" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.SkeletonIK.get_tip_bone

{-# NOINLINE bindSkeletonIK_is_override_tip_basis #-}

-- | If @true@ overwrites the rotation of the tip bone with the rotation of the @target@ (or @target_node@ if defined).
bindSkeletonIK_is_override_tip_basis :: MethodBind
bindSkeletonIK_is_override_tip_basis
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "is_override_tip_basis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ overwrites the rotation of the tip bone with the rotation of the @target@ (or @target_node@ if defined).
is_override_tip_basis ::
                        (SkeletonIK :< cls, Object :< cls) => cls -> IO Bool
is_override_tip_basis cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_is_override_tip_basis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "is_override_tip_basis" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.SkeletonIK.is_override_tip_basis

{-# NOINLINE bindSkeletonIK_is_running #-}

-- | Returns @true@ if SkeletonIK is applying IK effects on continues frames to the @Skeleton@ bones. Returns @false@ if SkeletonIK is stopped or @method start@ was used with the @one_time@ parameter set to @true@.
bindSkeletonIK_is_running :: MethodBind
bindSkeletonIK_is_running
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "is_running" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if SkeletonIK is applying IK effects on continues frames to the @Skeleton@ bones. Returns @false@ if SkeletonIK is stopped or @method start@ was used with the @one_time@ parameter set to @true@.
is_running :: (SkeletonIK :< cls, Object :< cls) => cls -> IO Bool
is_running cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_is_running (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "is_running" '[] (IO Bool) where
        nodeMethod = Godot.Core.SkeletonIK.is_running

{-# NOINLINE bindSkeletonIK_is_using_magnet #-}

-- | If @true@, instructs the IK solver to consider the secondary magnet target (pole target) when calculating the bone chain. Use the magnet position (pole target) to control the bending of the IK chain.
bindSkeletonIK_is_using_magnet :: MethodBind
bindSkeletonIK_is_using_magnet
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "is_using_magnet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, instructs the IK solver to consider the secondary magnet target (pole target) when calculating the bone chain. Use the magnet position (pole target) to control the bending of the IK chain.
is_using_magnet ::
                  (SkeletonIK :< cls, Object :< cls) => cls -> IO Bool
is_using_magnet cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_is_using_magnet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "is_using_magnet" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.SkeletonIK.is_using_magnet

{-# NOINLINE bindSkeletonIK_set_interpolation #-}

-- | Interpolation value for how much the IK results are applied to the current skeleton bone chain. A value of @1.0@ will overwrite all skeleton bone transforms completely while a value of @0.0@ will visually disable the SkeletonIK. A value at or below @0.01@ also calls @method Skeleton.clear_bones_global_pose_override@.
bindSkeletonIK_set_interpolation :: MethodBind
bindSkeletonIK_set_interpolation
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_interpolation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Interpolation value for how much the IK results are applied to the current skeleton bone chain. A value of @1.0@ will overwrite all skeleton bone transforms completely while a value of @0.0@ will visually disable the SkeletonIK. A value at or below @0.01@ also calls @method Skeleton.clear_bones_global_pose_override@.
set_interpolation ::
                    (SkeletonIK :< cls, Object :< cls) => cls -> Float -> IO ()
set_interpolation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_interpolation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_interpolation" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_interpolation

{-# NOINLINE bindSkeletonIK_set_magnet_position #-}

-- | Secondary target position (first is @target@ property or @target_node@) for the IK chain. Use magnet position (pole target) to control the bending of the IK chain. Only works if the bone chain has more than 2 bones. The middle chain bone position will be linearly interpolated with the magnet position.
bindSkeletonIK_set_magnet_position :: MethodBind
bindSkeletonIK_set_magnet_position
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_magnet_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Secondary target position (first is @target@ property or @target_node@) for the IK chain. Use magnet position (pole target) to control the bending of the IK chain. Only works if the bone chain has more than 2 bones. The middle chain bone position will be linearly interpolated with the magnet position.
set_magnet_position ::
                      (SkeletonIK :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_magnet_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_magnet_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_magnet_position" '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_magnet_position

{-# NOINLINE bindSkeletonIK_set_max_iterations #-}

-- | Number of iteration loops used by the IK solver to produce more accurate (and elegant) bone chain results.
bindSkeletonIK_set_max_iterations :: MethodBind
bindSkeletonIK_set_max_iterations
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_max_iterations" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of iteration loops used by the IK solver to produce more accurate (and elegant) bone chain results.
set_max_iterations ::
                     (SkeletonIK :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_iterations cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_max_iterations
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_max_iterations" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_max_iterations

{-# NOINLINE bindSkeletonIK_set_min_distance #-}

-- | The minimum distance between bone and goal target. If the distance is below this value, the IK solver stops further iterations.
bindSkeletonIK_set_min_distance :: MethodBind
bindSkeletonIK_set_min_distance
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_min_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum distance between bone and goal target. If the distance is below this value, the IK solver stops further iterations.
set_min_distance ::
                   (SkeletonIK :< cls, Object :< cls) => cls -> Float -> IO ()
set_min_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_min_distance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_min_distance" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_min_distance

{-# NOINLINE bindSkeletonIK_set_override_tip_basis #-}

-- | If @true@ overwrites the rotation of the tip bone with the rotation of the @target@ (or @target_node@ if defined).
bindSkeletonIK_set_override_tip_basis :: MethodBind
bindSkeletonIK_set_override_tip_basis
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_override_tip_basis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ overwrites the rotation of the tip bone with the rotation of the @target@ (or @target_node@ if defined).
set_override_tip_basis ::
                         (SkeletonIK :< cls, Object :< cls) => cls -> Bool -> IO ()
set_override_tip_basis cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_override_tip_basis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_override_tip_basis" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_override_tip_basis

{-# NOINLINE bindSkeletonIK_set_root_bone #-}

-- | The name of the current root bone, the first bone in the IK chain.
bindSkeletonIK_set_root_bone :: MethodBind
bindSkeletonIK_set_root_bone
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_root_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the current root bone, the first bone in the IK chain.
set_root_bone ::
                (SkeletonIK :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_root_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_root_bone (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_root_bone" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_root_bone

{-# NOINLINE bindSkeletonIK_set_target_node #-}

-- | Target node @NodePath@ for the IK chain. If available, the node's current @Transform@ is used instead of the @target@ property.
bindSkeletonIK_set_target_node :: MethodBind
bindSkeletonIK_set_target_node
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_target_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Target node @NodePath@ for the IK chain. If available, the node's current @Transform@ is used instead of the @target@ property.
set_target_node ::
                  (SkeletonIK :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_target_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_target_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_target_node" '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_target_node

{-# NOINLINE bindSkeletonIK_set_target_transform #-}

-- | First target of the IK chain where the tip bone is placed and, if @override_tip_basis@ is @true@, how the tip bone is rotated. If a @target_node@ path is available the nodes transform is used instead and this property is ignored.
bindSkeletonIK_set_target_transform :: MethodBind
bindSkeletonIK_set_target_transform
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_target_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | First target of the IK chain where the tip bone is placed and, if @override_tip_basis@ is @true@, how the tip bone is rotated. If a @target_node@ path is available the nodes transform is used instead and this property is ignored.
set_target_transform ::
                       (SkeletonIK :< cls, Object :< cls) => cls -> Transform -> IO ()
set_target_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_target_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_target_transform" '[Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_target_transform

{-# NOINLINE bindSkeletonIK_set_tip_bone #-}

-- | The name of the current tip bone, the last bone in the IK chain placed at the @target@ transform (or @target_node@ if defined).
bindSkeletonIK_set_tip_bone :: MethodBind
bindSkeletonIK_set_tip_bone
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_tip_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the current tip bone, the last bone in the IK chain placed at the @target@ transform (or @target_node@ if defined).
set_tip_bone ::
               (SkeletonIK :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_tip_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_tip_bone (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_tip_bone" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_tip_bone

{-# NOINLINE bindSkeletonIK_set_use_magnet #-}

-- | If @true@, instructs the IK solver to consider the secondary magnet target (pole target) when calculating the bone chain. Use the magnet position (pole target) to control the bending of the IK chain.
bindSkeletonIK_set_use_magnet :: MethodBind
bindSkeletonIK_set_use_magnet
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "set_use_magnet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, instructs the IK solver to consider the secondary magnet target (pole target) when calculating the bone chain. Use the magnet position (pole target) to control the bending of the IK chain.
set_use_magnet ::
                 (SkeletonIK :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_magnet cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_set_use_magnet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "set_use_magnet" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.SkeletonIK.set_use_magnet

{-# NOINLINE bindSkeletonIK_start #-}

-- | Starts applying IK effects on each frame to the @Skeleton@ bones but will only take effect starting on the next frame. If @one_time@ is @true@, this will take effect immediately but also reset on the next frame.
bindSkeletonIK_start :: MethodBind
bindSkeletonIK_start
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts applying IK effects on each frame to the @Skeleton@ bones but will only take effect starting on the next frame. If @one_time@ is @true@, this will take effect immediately but also reset on the next frame.
start ::
        (SkeletonIK :< cls, Object :< cls) => cls -> Maybe Bool -> IO ()
start cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_start (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "start" '[Maybe Bool] (IO ()) where
        nodeMethod = Godot.Core.SkeletonIK.start

{-# NOINLINE bindSkeletonIK_stop #-}

-- | Stops applying IK effects on each frame to the @Skeleton@ bones and also calls @method Skeleton.clear_bones_global_pose_override@ to remove existing overrides on all bones.
bindSkeletonIK_stop :: MethodBind
bindSkeletonIK_stop
  = unsafePerformIO $
      withCString "SkeletonIK" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops applying IK effects on each frame to the @Skeleton@ bones and also calls @method Skeleton.clear_bones_global_pose_override@ to remove existing overrides on all bones.
stop :: (SkeletonIK :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeletonIK_stop (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SkeletonIK "stop" '[] (IO ()) where
        nodeMethod = Godot.Core.SkeletonIK.stop