{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Joint
       (Godot.Core.Joint.get_exclude_nodes_from_collision,
        Godot.Core.Joint.get_node_a, Godot.Core.Joint.get_node_b,
        Godot.Core.Joint.get_solver_priority,
        Godot.Core.Joint.set_exclude_nodes_from_collision,
        Godot.Core.Joint.set_node_a, Godot.Core.Joint.set_node_b,
        Godot.Core.Joint.set_solver_priority)
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
import Godot.Core.Spatial()

instance NodeProperty Joint "collision/exclude_nodes" Bool 'False
         where
        nodeProperty
          = (get_exclude_nodes_from_collision,
             wrapDroppingSetter set_exclude_nodes_from_collision, Nothing)

instance NodeProperty Joint "nodes/node_a" NodePath 'False where
        nodeProperty = (get_node_a, wrapDroppingSetter set_node_a, Nothing)

instance NodeProperty Joint "nodes/node_b" NodePath 'False where
        nodeProperty = (get_node_b, wrapDroppingSetter set_node_b, Nothing)

instance NodeProperty Joint "solver/priority" Int 'False where
        nodeProperty
          = (get_solver_priority, wrapDroppingSetter set_solver_priority,
             Nothing)

{-# NOINLINE bindJoint_get_exclude_nodes_from_collision #-}

-- | If @true@, the two bodies of the nodes are not able to collide with each other.
bindJoint_get_exclude_nodes_from_collision :: MethodBind
bindJoint_get_exclude_nodes_from_collision
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "get_exclude_nodes_from_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the two bodies of the nodes are not able to collide with each other.
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

instance NodeMethod Joint "get_exclude_nodes_from_collision" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Joint.get_exclude_nodes_from_collision

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

instance NodeMethod Joint "get_node_a" '[] (IO NodePath) where
        nodeMethod = Godot.Core.Joint.get_node_a

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

instance NodeMethod Joint "get_node_b" '[] (IO NodePath) where
        nodeMethod = Godot.Core.Joint.get_node_b

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

instance NodeMethod Joint "get_solver_priority" '[] (IO Int) where
        nodeMethod = Godot.Core.Joint.get_solver_priority

{-# NOINLINE bindJoint_set_exclude_nodes_from_collision #-}

-- | If @true@, the two bodies of the nodes are not able to collide with each other.
bindJoint_set_exclude_nodes_from_collision :: MethodBind
bindJoint_set_exclude_nodes_from_collision
  = unsafePerformIO $
      withCString "Joint" $
        \ clsNamePtr ->
          withCString "set_exclude_nodes_from_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the two bodies of the nodes are not able to collide with each other.
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

instance NodeMethod Joint "set_exclude_nodes_from_collision"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Joint.set_exclude_nodes_from_collision

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

instance NodeMethod Joint "set_node_a" '[NodePath] (IO ()) where
        nodeMethod = Godot.Core.Joint.set_node_a

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

instance NodeMethod Joint "set_node_b" '[NodePath] (IO ()) where
        nodeMethod = Godot.Core.Joint.set_node_b

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

instance NodeMethod Joint "set_solver_priority" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Joint.set_solver_priority