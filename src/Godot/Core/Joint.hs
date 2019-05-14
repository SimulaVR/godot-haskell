{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Joint
       (Godot.Core.Joint.set_node_a, Godot.Core.Joint.get_node_a,
        Godot.Core.Joint.set_node_b, Godot.Core.Joint.get_node_b,
        Godot.Core.Joint.set_solver_priority,
        Godot.Core.Joint.get_solver_priority,
        Godot.Core.Joint.set_exclude_nodes_from_collision,
        Godot.Core.Joint.get_exclude_nodes_from_collision)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindJoint_set_node_a #-}

-- | The node attached to the first side (A) of the joint.
bindJoint_set_node_a :: MethodBind
bindJoint_set_node_a
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "set_node_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node attached to the first side (A) of the joint.
set_node_a ::
             (Joint :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_node_a cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint_set_node_a (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint_get_node_a #-}

-- | The node attached to the first side (A) of the joint.
bindJoint_get_node_a :: MethodBind
bindJoint_get_node_a
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "get_node_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node attached to the first side (A) of the joint.
get_node_a :: (Joint :< cls, Object :< cls) => cls -> IO NodePath
get_node_a cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint_get_node_a (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint_set_node_b #-}

-- | The node attached to the second side (B) of the joint.
bindJoint_set_node_b :: MethodBind
bindJoint_set_node_b
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "set_node_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node attached to the second side (B) of the joint.
set_node_b ::
             (Joint :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_node_b cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint_set_node_b (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint_get_node_b #-}

-- | The node attached to the second side (B) of the joint.
bindJoint_get_node_b :: MethodBind
bindJoint_get_node_b
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "get_node_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node attached to the second side (B) of the joint.
get_node_b :: (Joint :< cls, Object :< cls) => cls -> IO NodePath
get_node_b cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint_get_node_b (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint_set_solver_priority #-}

-- | The priority used to define which solver is executed first for multiple joints. The lower the value, the higher the priority.
bindJoint_set_solver_priority :: MethodBind
bindJoint_set_solver_priority
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "set_solver_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The priority used to define which solver is executed first for multiple joints. The lower the value, the higher the priority.
set_solver_priority ::
                      (Joint :< cls, Object :< cls) => cls -> Int -> IO ()
set_solver_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint_set_solver_priority (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint_get_solver_priority #-}

-- | The priority used to define which solver is executed first for multiple joints. The lower the value, the higher the priority.
bindJoint_get_solver_priority :: MethodBind
bindJoint_get_solver_priority
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "get_solver_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The priority used to define which solver is executed first for multiple joints. The lower the value, the higher the priority.
get_solver_priority ::
                      (Joint :< cls, Object :< cls) => cls -> IO Int
get_solver_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint_get_solver_priority (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint_set_exclude_nodes_from_collision #-}

-- | If [code]true[/code], the two bodies of the nodes are not able to collide with each other.
bindJoint_set_exclude_nodes_from_collision :: MethodBind
bindJoint_set_exclude_nodes_from_collision
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "set_exclude_nodes_from_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the two bodies of the nodes are not able to collide with each other.
set_exclude_nodes_from_collision ::
                                   (Joint :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exclude_nodes_from_collision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint_set_exclude_nodes_from_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint_get_exclude_nodes_from_collision #-}

-- | If [code]true[/code], the two bodies of the nodes are not able to collide with each other.
bindJoint_get_exclude_nodes_from_collision :: MethodBind
bindJoint_get_exclude_nodes_from_collision
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "get_exclude_nodes_from_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the two bodies of the nodes are not able to collide with each other.
get_exclude_nodes_from_collision ::
                                   (Joint :< cls, Object :< cls) => cls -> IO Bool
get_exclude_nodes_from_collision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint_get_exclude_nodes_from_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)