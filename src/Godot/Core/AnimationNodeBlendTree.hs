{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNodeBlendTree
       (Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_NO_INPUT_INDEX,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_NO_OUTPUT,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_OK,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_SAME_NODE,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_CONNECTION_EXISTS,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_NO_INPUT,
        Godot.Core.AnimationNodeBlendTree._node_changed,
        Godot.Core.AnimationNodeBlendTree._tree_changed,
        Godot.Core.AnimationNodeBlendTree.add_node,
        Godot.Core.AnimationNodeBlendTree.connect_node,
        Godot.Core.AnimationNodeBlendTree.disconnect_node,
        Godot.Core.AnimationNodeBlendTree.get_graph_offset,
        Godot.Core.AnimationNodeBlendTree.get_node,
        Godot.Core.AnimationNodeBlendTree.get_node_position,
        Godot.Core.AnimationNodeBlendTree.has_node,
        Godot.Core.AnimationNodeBlendTree.remove_node,
        Godot.Core.AnimationNodeBlendTree.rename_node,
        Godot.Core.AnimationNodeBlendTree.set_graph_offset,
        Godot.Core.AnimationNodeBlendTree.set_node_position)
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
import Godot.Core.AnimationRootNode()

_CONNECTION_ERROR_NO_INPUT_INDEX :: Int
_CONNECTION_ERROR_NO_INPUT_INDEX = 2

_CONNECTION_ERROR_NO_OUTPUT :: Int
_CONNECTION_ERROR_NO_OUTPUT = 3

_CONNECTION_OK :: Int
_CONNECTION_OK = 0

_CONNECTION_ERROR_SAME_NODE :: Int
_CONNECTION_ERROR_SAME_NODE = 4

_CONNECTION_ERROR_CONNECTION_EXISTS :: Int
_CONNECTION_ERROR_CONNECTION_EXISTS = 5

_CONNECTION_ERROR_NO_INPUT :: Int
_CONNECTION_ERROR_NO_INPUT = 1

instance NodeProperty AnimationNodeBlendTree "graph_offset" Vector2
           'False
         where
        nodeProperty
          = (get_graph_offset, wrapDroppingSetter set_graph_offset, Nothing)

{-# NOINLINE bindAnimationNodeBlendTree__node_changed #-}

bindAnimationNodeBlendTree__node_changed :: MethodBind
bindAnimationNodeBlendTree__node_changed
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "_node_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_changed ::
                (AnimationNodeBlendTree :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
_node_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree__node_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "_node_changed"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree._node_changed

{-# NOINLINE bindAnimationNodeBlendTree__tree_changed #-}

bindAnimationNodeBlendTree__tree_changed :: MethodBind
bindAnimationNodeBlendTree__tree_changed
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "_tree_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_changed ::
                (AnimationNodeBlendTree :< cls, Object :< cls) => cls -> IO ()
_tree_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree__tree_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "_tree_changed" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree._tree_changed

{-# NOINLINE bindAnimationNodeBlendTree_add_node #-}

-- | Adds an @AnimationNode@ at the given @position@. The @name@ is used to identify the created sub-node later.
bindAnimationNodeBlendTree_add_node :: MethodBind
bindAnimationNodeBlendTree_add_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "add_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an @AnimationNode@ at the given @position@. The @name@ is used to identify the created sub-node later.
add_node ::
           (AnimationNodeBlendTree :< cls, Object :< cls) =>
           cls -> GodotString -> AnimationNode -> Maybe Vector2 -> IO ()
add_node cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantVector2 (V2 0 0) arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_add_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "add_node"
           '[GodotString, AnimationNode, Maybe Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.add_node

{-# NOINLINE bindAnimationNodeBlendTree_connect_node #-}

-- | Connects the output of an @AnimationNode@ as input for another @AnimationNode@, at the input port specified by @input_index@.
bindAnimationNodeBlendTree_connect_node :: MethodBind
bindAnimationNodeBlendTree_connect_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "connect_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects the output of an @AnimationNode@ as input for another @AnimationNode@, at the input port specified by @input_index@.
connect_node ::
               (AnimationNodeBlendTree :< cls, Object :< cls) =>
               cls -> GodotString -> Int -> GodotString -> IO ()
connect_node cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_connect_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "connect_node"
           '[GodotString, Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.connect_node

{-# NOINLINE bindAnimationNodeBlendTree_disconnect_node #-}

-- | Disconnects the node connected to the specified input.
bindAnimationNodeBlendTree_disconnect_node :: MethodBind
bindAnimationNodeBlendTree_disconnect_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "disconnect_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disconnects the node connected to the specified input.
disconnect_node ::
                  (AnimationNodeBlendTree :< cls, Object :< cls) =>
                  cls -> GodotString -> Int -> IO ()
disconnect_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_disconnect_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "disconnect_node"
           '[GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.disconnect_node

{-# NOINLINE bindAnimationNodeBlendTree_get_graph_offset #-}

-- | The global offset of all sub-nodes.
bindAnimationNodeBlendTree_get_graph_offset :: MethodBind
bindAnimationNodeBlendTree_get_graph_offset
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "get_graph_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global offset of all sub-nodes.
get_graph_offset ::
                   (AnimationNodeBlendTree :< cls, Object :< cls) => cls -> IO Vector2
get_graph_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_get_graph_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "get_graph_offset" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.get_graph_offset

{-# NOINLINE bindAnimationNodeBlendTree_get_node #-}

-- | Returns the sub-node with the specified @name@.
bindAnimationNodeBlendTree_get_node :: MethodBind
bindAnimationNodeBlendTree_get_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "get_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the sub-node with the specified @name@.
get_node ::
           (AnimationNodeBlendTree :< cls, Object :< cls) =>
           cls -> GodotString -> IO AnimationNode
get_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_get_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "get_node"
           '[GodotString]
           (IO AnimationNode)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.get_node

{-# NOINLINE bindAnimationNodeBlendTree_get_node_position #-}

-- | Returns the position of the sub-node with the specified @name@.
bindAnimationNodeBlendTree_get_node_position :: MethodBind
bindAnimationNodeBlendTree_get_node_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "get_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the sub-node with the specified @name@.
get_node_position ::
                    (AnimationNodeBlendTree :< cls, Object :< cls) =>
                    cls -> GodotString -> IO Vector2
get_node_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_get_node_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "get_node_position"
           '[GodotString]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.get_node_position

{-# NOINLINE bindAnimationNodeBlendTree_has_node #-}

-- | Returns @true@ if a sub-node with specified @name@ exists.
bindAnimationNodeBlendTree_has_node :: MethodBind
bindAnimationNodeBlendTree_has_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "has_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a sub-node with specified @name@ exists.
has_node ::
           (AnimationNodeBlendTree :< cls, Object :< cls) =>
           cls -> GodotString -> IO Bool
has_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_has_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "has_node"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.has_node

{-# NOINLINE bindAnimationNodeBlendTree_remove_node #-}

-- | Removes a sub-node.
bindAnimationNodeBlendTree_remove_node :: MethodBind
bindAnimationNodeBlendTree_remove_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "remove_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a sub-node.
remove_node ::
              (AnimationNodeBlendTree :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
remove_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_remove_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "remove_node"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.remove_node

{-# NOINLINE bindAnimationNodeBlendTree_rename_node #-}

-- | Changes the name of a sub-node.
bindAnimationNodeBlendTree_rename_node :: MethodBind
bindAnimationNodeBlendTree_rename_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "rename_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the name of a sub-node.
rename_node ::
              (AnimationNodeBlendTree :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> IO ()
rename_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_rename_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "rename_node"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.rename_node

{-# NOINLINE bindAnimationNodeBlendTree_set_graph_offset #-}

-- | The global offset of all sub-nodes.
bindAnimationNodeBlendTree_set_graph_offset :: MethodBind
bindAnimationNodeBlendTree_set_graph_offset
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "set_graph_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global offset of all sub-nodes.
set_graph_offset ::
                   (AnimationNodeBlendTree :< cls, Object :< cls) =>
                   cls -> Vector2 -> IO ()
set_graph_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_set_graph_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "set_graph_offset"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.set_graph_offset

{-# NOINLINE bindAnimationNodeBlendTree_set_node_position #-}

-- | Modifies the position of a sub-node.
bindAnimationNodeBlendTree_set_node_position :: MethodBind
bindAnimationNodeBlendTree_set_node_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "set_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Modifies the position of a sub-node.
set_node_position ::
                    (AnimationNodeBlendTree :< cls, Object :< cls) =>
                    cls -> GodotString -> Vector2 -> IO ()
set_node_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_set_node_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendTree "set_node_position"
           '[GodotString, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendTree.set_node_position