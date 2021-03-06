{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShader
       (Godot.Core.VisualShader._NODE_ID_INVALID,
        Godot.Core.VisualShader._TYPE_VERTEX,
        Godot.Core.VisualShader._TYPE_FRAGMENT,
        Godot.Core.VisualShader._NODE_ID_OUTPUT,
        Godot.Core.VisualShader._TYPE_MAX,
        Godot.Core.VisualShader._TYPE_LIGHT,
        Godot.Core.VisualShader._input_type_changed,
        Godot.Core.VisualShader._queue_update,
        Godot.Core.VisualShader._update_shader,
        Godot.Core.VisualShader.add_node,
        Godot.Core.VisualShader.can_connect_nodes,
        Godot.Core.VisualShader.connect_nodes,
        Godot.Core.VisualShader.connect_nodes_forced,
        Godot.Core.VisualShader.disconnect_nodes,
        Godot.Core.VisualShader.get_graph_offset,
        Godot.Core.VisualShader.get_node,
        Godot.Core.VisualShader.get_node_connections,
        Godot.Core.VisualShader.get_node_list,
        Godot.Core.VisualShader.get_node_position,
        Godot.Core.VisualShader.get_valid_node_id,
        Godot.Core.VisualShader.is_node_connection,
        Godot.Core.VisualShader.remove_node,
        Godot.Core.VisualShader.set_graph_offset,
        Godot.Core.VisualShader.set_mode,
        Godot.Core.VisualShader.set_node_position)
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
import Godot.Core.Shader()

_NODE_ID_INVALID :: Int
_NODE_ID_INVALID = -1

_TYPE_VERTEX :: Int
_TYPE_VERTEX = 0

_TYPE_FRAGMENT :: Int
_TYPE_FRAGMENT = 1

_NODE_ID_OUTPUT :: Int
_NODE_ID_OUTPUT = 0

_TYPE_MAX :: Int
_TYPE_MAX = 3

_TYPE_LIGHT :: Int
_TYPE_LIGHT = 2

instance NodeProperty VisualShader "graph_offset" Vector2 'False
         where
        nodeProperty
          = (get_graph_offset, wrapDroppingSetter set_graph_offset, Nothing)

{-# NOINLINE bindVisualShader__input_type_changed #-}

bindVisualShader__input_type_changed :: MethodBind
bindVisualShader__input_type_changed
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "_input_type_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_input_type_changed ::
                      (VisualShader :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
_input_type_changed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader__input_type_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "_input_type_changed" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShader._input_type_changed

{-# NOINLINE bindVisualShader__queue_update #-}

bindVisualShader__queue_update :: MethodBind
bindVisualShader__queue_update
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "_queue_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_queue_update ::
                (VisualShader :< cls, Object :< cls) => cls -> IO ()
_queue_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader__queue_update (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "_queue_update" '[] (IO ()) where
        nodeMethod = Godot.Core.VisualShader._queue_update

{-# NOINLINE bindVisualShader__update_shader #-}

bindVisualShader__update_shader :: MethodBind
bindVisualShader__update_shader
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "_update_shader" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_shader ::
                 (VisualShader :< cls, Object :< cls) => cls -> IO ()
_update_shader cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader__update_shader (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "_update_shader" '[] (IO ()) where
        nodeMethod = Godot.Core.VisualShader._update_shader

{-# NOINLINE bindVisualShader_add_node #-}

-- | Adds the specified node to the shader.
bindVisualShader_add_node :: MethodBind
bindVisualShader_add_node
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "add_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the specified node to the shader.
add_node ::
           (VisualShader :< cls, Object :< cls) =>
           cls -> Int -> VisualShaderNode -> Vector2 -> Int -> IO ()
add_node cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_add_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "add_node"
           '[Int, VisualShaderNode, Vector2, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShader.add_node

{-# NOINLINE bindVisualShader_can_connect_nodes #-}

-- | Returns @true@ if the specified nodes and ports can be connected together.
bindVisualShader_can_connect_nodes :: MethodBind
bindVisualShader_can_connect_nodes
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "can_connect_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified nodes and ports can be connected together.
can_connect_nodes ::
                    (VisualShader :< cls, Object :< cls) =>
                    cls -> Int -> Int -> Int -> Int -> Int -> IO Bool
can_connect_nodes cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_can_connect_nodes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "can_connect_nodes"
           '[Int, Int, Int, Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualShader.can_connect_nodes

{-# NOINLINE bindVisualShader_connect_nodes #-}

-- | Connects the specified nodes and ports.
bindVisualShader_connect_nodes :: MethodBind
bindVisualShader_connect_nodes
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "connect_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects the specified nodes and ports.
connect_nodes ::
                (VisualShader :< cls, Object :< cls) =>
                cls -> Int -> Int -> Int -> Int -> Int -> IO Int
connect_nodes cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_connect_nodes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "connect_nodes"
           '[Int, Int, Int, Int, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShader.connect_nodes

{-# NOINLINE bindVisualShader_connect_nodes_forced #-}

-- | Connects the specified nodes and ports, even if they can't be connected. Such connection is invalid and will not function properly.
bindVisualShader_connect_nodes_forced :: MethodBind
bindVisualShader_connect_nodes_forced
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "connect_nodes_forced" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects the specified nodes and ports, even if they can't be connected. Such connection is invalid and will not function properly.
connect_nodes_forced ::
                       (VisualShader :< cls, Object :< cls) =>
                       cls -> Int -> Int -> Int -> Int -> Int -> IO ()
connect_nodes_forced cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_connect_nodes_forced
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "connect_nodes_forced"
           '[Int, Int, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShader.connect_nodes_forced

{-# NOINLINE bindVisualShader_disconnect_nodes #-}

-- | Connects the specified nodes and ports.
bindVisualShader_disconnect_nodes :: MethodBind
bindVisualShader_disconnect_nodes
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "disconnect_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects the specified nodes and ports.
disconnect_nodes ::
                   (VisualShader :< cls, Object :< cls) =>
                   cls -> Int -> Int -> Int -> Int -> Int -> IO ()
disconnect_nodes cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_disconnect_nodes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "disconnect_nodes"
           '[Int, Int, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShader.disconnect_nodes

{-# NOINLINE bindVisualShader_get_graph_offset #-}

-- | The offset vector of the whole graph.
bindVisualShader_get_graph_offset :: MethodBind
bindVisualShader_get_graph_offset
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "get_graph_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset vector of the whole graph.
get_graph_offset ::
                   (VisualShader :< cls, Object :< cls) => cls -> IO Vector2
get_graph_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_get_graph_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "get_graph_offset" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.VisualShader.get_graph_offset

{-# NOINLINE bindVisualShader_get_node #-}

-- | Returns the shader node instance with specified @type@ and @id@.
bindVisualShader_get_node :: MethodBind
bindVisualShader_get_node
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "get_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shader node instance with specified @type@ and @id@.
get_node ::
           (VisualShader :< cls, Object :< cls) =>
           cls -> Int -> Int -> IO VisualShaderNode
get_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_get_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "get_node" '[Int, Int]
           (IO VisualShaderNode)
         where
        nodeMethod = Godot.Core.VisualShader.get_node

{-# NOINLINE bindVisualShader_get_node_connections #-}

-- | Returns the list of connected nodes with the specified type.
bindVisualShader_get_node_connections :: MethodBind
bindVisualShader_get_node_connections
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "get_node_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of connected nodes with the specified type.
get_node_connections ::
                       (VisualShader :< cls, Object :< cls) => cls -> Int -> IO Array
get_node_connections cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_get_node_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "get_node_connections" '[Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualShader.get_node_connections

{-# NOINLINE bindVisualShader_get_node_list #-}

-- | Returns the list of all nodes in the shader with the specified type.
bindVisualShader_get_node_list :: MethodBind
bindVisualShader_get_node_list
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "get_node_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of all nodes in the shader with the specified type.
get_node_list ::
                (VisualShader :< cls, Object :< cls) =>
                cls -> Int -> IO PoolIntArray
get_node_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_get_node_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "get_node_list" '[Int]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.VisualShader.get_node_list

{-# NOINLINE bindVisualShader_get_node_position #-}

-- | Returns the position of the specified node within the shader graph.
bindVisualShader_get_node_position :: MethodBind
bindVisualShader_get_node_position
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "get_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the specified node within the shader graph.
get_node_position ::
                    (VisualShader :< cls, Object :< cls) =>
                    cls -> Int -> Int -> IO Vector2
get_node_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_get_node_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "get_node_position" '[Int, Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.VisualShader.get_node_position

{-# NOINLINE bindVisualShader_get_valid_node_id #-}

bindVisualShader_get_valid_node_id :: MethodBind
bindVisualShader_get_valid_node_id
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "get_valid_node_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_valid_node_id ::
                    (VisualShader :< cls, Object :< cls) => cls -> Int -> IO Int
get_valid_node_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_get_valid_node_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "get_valid_node_id" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShader.get_valid_node_id

{-# NOINLINE bindVisualShader_is_node_connection #-}

-- | Returns @true@ if the specified node and port connection exist.
bindVisualShader_is_node_connection :: MethodBind
bindVisualShader_is_node_connection
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "is_node_connection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified node and port connection exist.
is_node_connection ::
                     (VisualShader :< cls, Object :< cls) =>
                     cls -> Int -> Int -> Int -> Int -> Int -> IO Bool
is_node_connection cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_is_node_connection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "is_node_connection"
           '[Int, Int, Int, Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualShader.is_node_connection

{-# NOINLINE bindVisualShader_remove_node #-}

-- | Removes the specified node from the shader.
bindVisualShader_remove_node :: MethodBind
bindVisualShader_remove_node
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "remove_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the specified node from the shader.
remove_node ::
              (VisualShader :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
remove_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_remove_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "remove_node" '[Int, Int] (IO ())
         where
        nodeMethod = Godot.Core.VisualShader.remove_node

{-# NOINLINE bindVisualShader_set_graph_offset #-}

-- | The offset vector of the whole graph.
bindVisualShader_set_graph_offset :: MethodBind
bindVisualShader_set_graph_offset
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "set_graph_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset vector of the whole graph.
set_graph_offset ::
                   (VisualShader :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_graph_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_set_graph_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "set_graph_offset" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShader.set_graph_offset

{-# NOINLINE bindVisualShader_set_mode #-}

-- | Sets the mode of this shader.
bindVisualShader_set_mode :: MethodBind
bindVisualShader_set_mode
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the mode of this shader.
set_mode ::
           (VisualShader :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_set_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "set_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.VisualShader.set_mode

{-# NOINLINE bindVisualShader_set_node_position #-}

-- | Sets the position of the specified node.
bindVisualShader_set_node_position :: MethodBind
bindVisualShader_set_node_position
  = unsafePerformIO $
      withCString "VisualShader" $
        \ clsNamePtr ->
          withCString "set_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of the specified node.
set_node_position ::
                    (VisualShader :< cls, Object :< cls) =>
                    cls -> Int -> Int -> Vector2 -> IO ()
set_node_position cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShader_set_node_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShader "set_node_position"
           '[Int, Int, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShader.set_node_position