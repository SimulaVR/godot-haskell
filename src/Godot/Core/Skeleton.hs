{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Skeleton
       (Godot.Core.Skeleton._NOTIFICATION_UPDATE_SKELETON,
        Godot.Core.Skeleton.add_bone, Godot.Core.Skeleton.find_bone,
        Godot.Core.Skeleton.get_bone_name,
        Godot.Core.Skeleton.get_bone_parent,
        Godot.Core.Skeleton.set_bone_parent,
        Godot.Core.Skeleton.get_bone_count,
        Godot.Core.Skeleton.unparent_bone_and_rest,
        Godot.Core.Skeleton.get_bone_rest,
        Godot.Core.Skeleton.set_bone_rest,
        Godot.Core.Skeleton.set_bone_disable_rest,
        Godot.Core.Skeleton.is_bone_rest_disabled,
        Godot.Core.Skeleton.bind_child_node_to_bone,
        Godot.Core.Skeleton.unbind_child_node_from_bone,
        Godot.Core.Skeleton.get_bound_child_nodes_to_bone,
        Godot.Core.Skeleton.clear_bones, Godot.Core.Skeleton.get_bone_pose,
        Godot.Core.Skeleton.set_bone_pose,
        Godot.Core.Skeleton.set_bone_global_pose,
        Godot.Core.Skeleton.get_bone_global_pose,
        Godot.Core.Skeleton.get_bone_custom_pose,
        Godot.Core.Skeleton.set_bone_custom_pose,
        Godot.Core.Skeleton.get_bone_transform,
        Godot.Core.Skeleton.set_use_bones_in_world_transform,
        Godot.Core.Skeleton.is_using_bones_in_world_transform,
        Godot.Core.Skeleton.physical_bones_stop_simulation,
        Godot.Core.Skeleton.physical_bones_start_simulation,
        Godot.Core.Skeleton.physical_bones_add_collision_exception,
        Godot.Core.Skeleton.physical_bones_remove_collision_exception,
        Godot.Core.Skeleton.set_bone_ignore_animation)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_NOTIFICATION_UPDATE_SKELETON :: Int
_NOTIFICATION_UPDATE_SKELETON = 50

{-# NOINLINE bindSkeleton_add_bone #-}

-- | Add a bone, with name "name". [method get_bone_count] will become the bone index.
bindSkeleton_add_bone :: MethodBind
bindSkeleton_add_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "add_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a bone, with name "name". [method get_bone_count] will become the bone index.
add_bone ::
           (Skeleton :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_add_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_find_bone #-}

-- | Return the bone index that matches "name" as its name.
bindSkeleton_find_bone :: MethodBind
bindSkeleton_find_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "find_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the bone index that matches "name" as its name.
find_bone ::
            (Skeleton :< cls, Object :< cls) => cls -> GodotString -> IO Int
find_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_find_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_name #-}

-- | Return the name of the bone at index "index".
bindSkeleton_get_bone_name :: MethodBind
bindSkeleton_get_bone_name
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the name of the bone at index "index".
get_bone_name ::
                (Skeleton :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_bone_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_parent #-}

-- | Return the bone index which is the parent of the bone at "bone_idx". If -1, then bone has no parent. Note that the parent bone returned will always be less than "bone_idx".
bindSkeleton_get_bone_parent :: MethodBind
bindSkeleton_get_bone_parent
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the bone index which is the parent of the bone at "bone_idx". If -1, then bone has no parent. Note that the parent bone returned will always be less than "bone_idx".
get_bone_parent ::
                  (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Int
get_bone_parent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_parent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_parent #-}

-- | Set the bone index "parent_idx" as the parent of the bone at "bone_idx". If -1, then bone has no parent. Note: "parent_idx" must be less than "bone_idx".
bindSkeleton_set_bone_parent :: MethodBind
bindSkeleton_set_bone_parent
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the bone index "parent_idx" as the parent of the bone at "bone_idx". If -1, then bone has no parent. Note: "parent_idx" must be less than "bone_idx".
set_bone_parent ::
                  (Skeleton :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_bone_parent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_parent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_count #-}

-- | Return the amount of bones in the skeleton.
bindSkeleton_get_bone_count :: MethodBind
bindSkeleton_get_bone_count
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the amount of bones in the skeleton.
get_bone_count :: (Skeleton :< cls, Object :< cls) => cls -> IO Int
get_bone_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_unparent_bone_and_rest #-}

bindSkeleton_unparent_bone_and_rest :: MethodBind
bindSkeleton_unparent_bone_and_rest
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "unparent_bone_and_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

unparent_bone_and_rest ::
                         (Skeleton :< cls, Object :< cls) => cls -> Int -> IO ()
unparent_bone_and_rest cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_unparent_bone_and_rest
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_rest #-}

-- | Return the rest transform for a bone "bone_idx".
bindSkeleton_get_bone_rest :: MethodBind
bindSkeleton_get_bone_rest
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the rest transform for a bone "bone_idx".
get_bone_rest ::
                (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Transform
get_bone_rest cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_rest (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_rest #-}

-- | Set the rest transform for bone "bone_idx"
bindSkeleton_set_bone_rest :: MethodBind
bindSkeleton_set_bone_rest
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the rest transform for bone "bone_idx"
set_bone_rest ::
                (Skeleton :< cls, Object :< cls) =>
                cls -> Int -> Transform -> IO ()
set_bone_rest cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_rest (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_disable_rest #-}

bindSkeleton_set_bone_disable_rest :: MethodBind
bindSkeleton_set_bone_disable_rest
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_disable_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bone_disable_rest ::
                        (Skeleton :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_bone_disable_rest cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_disable_rest
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_is_bone_rest_disabled #-}

bindSkeleton_is_bone_rest_disabled :: MethodBind
bindSkeleton_is_bone_rest_disabled
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "is_bone_rest_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_bone_rest_disabled ::
                        (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Bool
is_bone_rest_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_is_bone_rest_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_bind_child_node_to_bone #-}

-- | Deprecated soon.
bindSkeleton_bind_child_node_to_bone :: MethodBind
bindSkeleton_bind_child_node_to_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "bind_child_node_to_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deprecated soon.
bind_child_node_to_bone ::
                          (Skeleton :< cls, Object :< cls) => cls -> Int -> Node -> IO ()
bind_child_node_to_bone cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_bind_child_node_to_bone
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_unbind_child_node_from_bone #-}

-- | Deprecated soon.
bindSkeleton_unbind_child_node_from_bone :: MethodBind
bindSkeleton_unbind_child_node_from_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "unbind_child_node_from_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deprecated soon.
unbind_child_node_from_bone ::
                              (Skeleton :< cls, Object :< cls) => cls -> Int -> Node -> IO ()
unbind_child_node_from_bone cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_unbind_child_node_from_bone
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bound_child_nodes_to_bone #-}

-- | Deprecated soon.
bindSkeleton_get_bound_child_nodes_to_bone :: MethodBind
bindSkeleton_get_bound_child_nodes_to_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bound_child_nodes_to_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deprecated soon.
get_bound_child_nodes_to_bone ::
                                (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Array
get_bound_child_nodes_to_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bound_child_nodes_to_bone
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_clear_bones #-}

-- | Clear all the bones in this skeleton.
bindSkeleton_clear_bones :: MethodBind
bindSkeleton_clear_bones
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "clear_bones" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear all the bones in this skeleton.
clear_bones :: (Skeleton :< cls, Object :< cls) => cls -> IO ()
clear_bones cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_clear_bones (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_pose #-}

-- | Return the pose transform of the specified bone. Pose is applied on top of the custom pose, which is applied on top the rest pose.
bindSkeleton_get_bone_pose :: MethodBind
bindSkeleton_get_bone_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the pose transform of the specified bone. Pose is applied on top of the custom pose, which is applied on top the rest pose.
get_bone_pose ::
                (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Transform
get_bone_pose cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_pose (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_pose #-}

-- | Return the pose transform for bone "bone_idx".
bindSkeleton_set_bone_pose :: MethodBind
bindSkeleton_set_bone_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the pose transform for bone "bone_idx".
set_bone_pose ::
                (Skeleton :< cls, Object :< cls) =>
                cls -> Int -> Transform -> IO ()
set_bone_pose cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_pose (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_global_pose #-}

bindSkeleton_set_bone_global_pose :: MethodBind
bindSkeleton_set_bone_global_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_global_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bone_global_pose ::
                       (Skeleton :< cls, Object :< cls) =>
                       cls -> Int -> Transform -> IO ()
set_bone_global_pose cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_global_pose
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_global_pose #-}

-- | Return the overall transform of the specified bone, with respect to the skeleton. Being relative to the skeleton frame, this is not the actual "global" transform of the bone.
bindSkeleton_get_bone_global_pose :: MethodBind
bindSkeleton_get_bone_global_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_global_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the overall transform of the specified bone, with respect to the skeleton. Being relative to the skeleton frame, this is not the actual "global" transform of the bone.
get_bone_global_pose ::
                       (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Transform
get_bone_global_pose cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_global_pose
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_custom_pose #-}

-- | Return the custom pose of the specified bone. Custom pose is applied on top of the rest pose.
bindSkeleton_get_bone_custom_pose :: MethodBind
bindSkeleton_get_bone_custom_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_custom_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the custom pose of the specified bone. Custom pose is applied on top of the rest pose.
get_bone_custom_pose ::
                       (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Transform
get_bone_custom_pose cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_custom_pose
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_custom_pose #-}

bindSkeleton_set_bone_custom_pose :: MethodBind
bindSkeleton_set_bone_custom_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_custom_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bone_custom_pose ::
                       (Skeleton :< cls, Object :< cls) =>
                       cls -> Int -> Transform -> IO ()
set_bone_custom_pose cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_custom_pose
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_transform #-}

-- | Return the combination of custom pose and pose. The returned transform is in skeleton's reference frame.
bindSkeleton_get_bone_transform :: MethodBind
bindSkeleton_get_bone_transform
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the combination of custom pose and pose. The returned transform is in skeleton's reference frame.
get_bone_transform ::
                     (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Transform
get_bone_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_use_bones_in_world_transform #-}

bindSkeleton_set_use_bones_in_world_transform :: MethodBind
bindSkeleton_set_use_bones_in_world_transform
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_use_bones_in_world_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_bones_in_world_transform ::
                                   (Skeleton :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_bones_in_world_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSkeleton_set_use_bones_in_world_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_is_using_bones_in_world_transform #-}

bindSkeleton_is_using_bones_in_world_transform :: MethodBind
bindSkeleton_is_using_bones_in_world_transform
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "is_using_bones_in_world_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_using_bones_in_world_transform ::
                                    (Skeleton :< cls, Object :< cls) => cls -> IO Bool
is_using_bones_in_world_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSkeleton_is_using_bones_in_world_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_physical_bones_stop_simulation #-}

bindSkeleton_physical_bones_stop_simulation :: MethodBind
bindSkeleton_physical_bones_stop_simulation
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "physical_bones_stop_simulation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

physical_bones_stop_simulation ::
                                 (Skeleton :< cls, Object :< cls) => cls -> IO ()
physical_bones_stop_simulation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_physical_bones_stop_simulation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_physical_bones_start_simulation #-}

bindSkeleton_physical_bones_start_simulation :: MethodBind
bindSkeleton_physical_bones_start_simulation
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "physical_bones_start_simulation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

physical_bones_start_simulation ::
                                  (Skeleton :< cls, Object :< cls) => cls -> Array -> IO ()
physical_bones_start_simulation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_physical_bones_start_simulation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_physical_bones_add_collision_exception
             #-}

bindSkeleton_physical_bones_add_collision_exception :: MethodBind
bindSkeleton_physical_bones_add_collision_exception
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "physical_bones_add_collision_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

physical_bones_add_collision_exception ::
                                         (Skeleton :< cls, Object :< cls) => cls -> Rid -> IO ()
physical_bones_add_collision_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSkeleton_physical_bones_add_collision_exception
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_physical_bones_remove_collision_exception
             #-}

bindSkeleton_physical_bones_remove_collision_exception ::
                                                       MethodBind
bindSkeleton_physical_bones_remove_collision_exception
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "physical_bones_remove_collision_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

physical_bones_remove_collision_exception ::
                                            (Skeleton :< cls, Object :< cls) => cls -> Rid -> IO ()
physical_bones_remove_collision_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSkeleton_physical_bones_remove_collision_exception
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_ignore_animation #-}

bindSkeleton_set_bone_ignore_animation :: MethodBind
bindSkeleton_set_bone_ignore_animation
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_ignore_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bone_ignore_animation ::
                            (Skeleton :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_bone_ignore_animation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_ignore_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)