{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Skeleton
       (Godot.Core.Skeleton._NOTIFICATION_UPDATE_SKELETON,
        Godot.Core.Skeleton.add_bone,
        Godot.Core.Skeleton.bind_child_node_to_bone,
        Godot.Core.Skeleton.clear_bones, Godot.Core.Skeleton.find_bone,
        Godot.Core.Skeleton.get_bone_count,
        Godot.Core.Skeleton.get_bone_custom_pose,
        Godot.Core.Skeleton.get_bone_global_pose,
        Godot.Core.Skeleton.get_bone_name,
        Godot.Core.Skeleton.get_bone_parent,
        Godot.Core.Skeleton.get_bone_pose,
        Godot.Core.Skeleton.get_bone_rest,
        Godot.Core.Skeleton.get_bound_child_nodes_to_bone,
        Godot.Core.Skeleton.is_bone_rest_disabled,
        Godot.Core.Skeleton.localize_rests,
        Godot.Core.Skeleton.physical_bones_add_collision_exception,
        Godot.Core.Skeleton.physical_bones_remove_collision_exception,
        Godot.Core.Skeleton.physical_bones_start_simulation,
        Godot.Core.Skeleton.physical_bones_stop_simulation,
        Godot.Core.Skeleton.register_skin,
        Godot.Core.Skeleton.set_bone_custom_pose,
        Godot.Core.Skeleton.set_bone_disable_rest,
        Godot.Core.Skeleton.set_bone_global_pose_override,
        Godot.Core.Skeleton.set_bone_parent,
        Godot.Core.Skeleton.set_bone_pose,
        Godot.Core.Skeleton.set_bone_rest,
        Godot.Core.Skeleton.unbind_child_node_from_bone,
        Godot.Core.Skeleton.unparent_bone_and_rest)
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

-- | Adds a bone, with name [code]name[/code]. [method get_bone_count] will become the bone index.
bindSkeleton_add_bone :: MethodBind
bindSkeleton_add_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "add_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a bone, with name [code]name[/code]. [method get_bone_count] will become the bone index.
add_bone ::
           (Skeleton :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_add_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_bind_child_node_to_bone #-}

-- | [i]Deprecated soon.[/i]
bindSkeleton_bind_child_node_to_bone :: MethodBind
bindSkeleton_bind_child_node_to_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "bind_child_node_to_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [i]Deprecated soon.[/i]
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

{-# NOINLINE bindSkeleton_find_bone #-}

-- | Returns the bone index that matches [code]name[/code] as its name.
bindSkeleton_find_bone :: MethodBind
bindSkeleton_find_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "find_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the bone index that matches [code]name[/code] as its name.
find_bone ::
            (Skeleton :< cls, Object :< cls) => cls -> GodotString -> IO Int
find_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_find_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_count #-}

-- | Returns the amount of bones in the skeleton.
bindSkeleton_get_bone_count :: MethodBind
bindSkeleton_get_bone_count
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of bones in the skeleton.
get_bone_count :: (Skeleton :< cls, Object :< cls) => cls -> IO Int
get_bone_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_custom_pose #-}

-- | Returns the custom pose of the specified bone. Custom pose is applied on top of the rest pose.
bindSkeleton_get_bone_custom_pose :: MethodBind
bindSkeleton_get_bone_custom_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_custom_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the custom pose of the specified bone. Custom pose is applied on top of the rest pose.
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

{-# NOINLINE bindSkeleton_get_bone_global_pose #-}

-- | Returns the overall transform of the specified bone, with respect to the skeleton. Being relative to the skeleton frame, this is not the actual "global" transform of the bone.
bindSkeleton_get_bone_global_pose :: MethodBind
bindSkeleton_get_bone_global_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_global_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the overall transform of the specified bone, with respect to the skeleton. Being relative to the skeleton frame, this is not the actual "global" transform of the bone.
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

{-# NOINLINE bindSkeleton_get_bone_name #-}

-- | Returns the name of the bone at index [code]index[/code].
bindSkeleton_get_bone_name :: MethodBind
bindSkeleton_get_bone_name
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the bone at index [code]index[/code].
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

-- | Returns the bone index which is the parent of the bone at [code]bone_idx[/code]. If -1, then bone has no parent.
--   				[b]Note:[/b] The parent bone returned will always be less than [code]bone_idx[/code].
bindSkeleton_get_bone_parent :: MethodBind
bindSkeleton_get_bone_parent
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the bone index which is the parent of the bone at [code]bone_idx[/code]. If -1, then bone has no parent.
--   				[b]Note:[/b] The parent bone returned will always be less than [code]bone_idx[/code].
get_bone_parent ::
                  (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Int
get_bone_parent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_parent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_pose #-}

-- | Returns the pose transform of the specified bone. Pose is applied on top of the custom pose, which is applied on top the rest pose.
bindSkeleton_get_bone_pose :: MethodBind
bindSkeleton_get_bone_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the pose transform of the specified bone. Pose is applied on top of the custom pose, which is applied on top the rest pose.
get_bone_pose ::
                (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Transform
get_bone_pose cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_pose (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bone_rest #-}

-- | Returns the rest transform for a bone [code]bone_idx[/code].
bindSkeleton_get_bone_rest :: MethodBind
bindSkeleton_get_bone_rest
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bone_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the rest transform for a bone [code]bone_idx[/code].
get_bone_rest ::
                (Skeleton :< cls, Object :< cls) => cls -> Int -> IO Transform
get_bone_rest cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_get_bone_rest (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_get_bound_child_nodes_to_bone #-}

-- | [i]Deprecated soon.[/i]
bindSkeleton_get_bound_child_nodes_to_bone :: MethodBind
bindSkeleton_get_bound_child_nodes_to_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "get_bound_child_nodes_to_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [i]Deprecated soon.[/i]
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

{-# NOINLINE bindSkeleton_localize_rests #-}

bindSkeleton_localize_rests :: MethodBind
bindSkeleton_localize_rests
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "localize_rests" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

localize_rests :: (Skeleton :< cls, Object :< cls) => cls -> IO ()
localize_rests cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_localize_rests (upcast cls)
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

{-# NOINLINE bindSkeleton_register_skin #-}

bindSkeleton_register_skin :: MethodBind
bindSkeleton_register_skin
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "register_skin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

register_skin ::
                (Skeleton :< cls, Object :< cls) => cls -> Skin -> IO SkinReference
register_skin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_register_skin (upcast cls)
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

{-# NOINLINE bindSkeleton_set_bone_global_pose_override #-}

bindSkeleton_set_bone_global_pose_override :: MethodBind
bindSkeleton_set_bone_global_pose_override
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_global_pose_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bone_global_pose_override ::
                                (Skeleton :< cls, Object :< cls) =>
                                cls -> Int -> Transform -> Float -> Bool -> IO ()
set_bone_global_pose_override cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_global_pose_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_parent #-}

-- | Sets the bone index [code]parent_idx[/code] as the parent of the bone at [code]bone_idx[/code]. If -1, then bone has no parent.
--   				[b]Note:[/b] [code]parent_idx[/code] must be less than [code]bone_idx[/code].
bindSkeleton_set_bone_parent :: MethodBind
bindSkeleton_set_bone_parent
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the bone index [code]parent_idx[/code] as the parent of the bone at [code]bone_idx[/code]. If -1, then bone has no parent.
--   				[b]Note:[/b] [code]parent_idx[/code] must be less than [code]bone_idx[/code].
set_bone_parent ::
                  (Skeleton :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_bone_parent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton_set_bone_parent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton_set_bone_pose #-}

-- | Sets the pose transform for bone [code]bone_idx[/code].
bindSkeleton_set_bone_pose :: MethodBind
bindSkeleton_set_bone_pose
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the pose transform for bone [code]bone_idx[/code].
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

{-# NOINLINE bindSkeleton_set_bone_rest #-}

-- | Sets the rest transform for bone [code]bone_idx[/code].
bindSkeleton_set_bone_rest :: MethodBind
bindSkeleton_set_bone_rest
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "set_bone_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the rest transform for bone [code]bone_idx[/code].
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

{-# NOINLINE bindSkeleton_unbind_child_node_from_bone #-}

-- | [i]Deprecated soon.[/i]
bindSkeleton_unbind_child_node_from_bone :: MethodBind
bindSkeleton_unbind_child_node_from_bone
  = unsafePerformIO $
      withCString "Skeleton" $
        \ clsNamePtr ->
          withCString "unbind_child_node_from_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [i]Deprecated soon.[/i]
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