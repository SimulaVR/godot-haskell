{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeBlendTree
       (Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_NO_INPUT_INDEX,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_NO_OUTPUT,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_OK,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_SAME_NODE,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_CONNECTION_EXISTS,
        Godot.Core.AnimationNodeBlendTree._CONNECTION_ERROR_NO_INPUT,
        Godot.Core.AnimationNodeBlendTree.add_node,
        Godot.Core.AnimationNodeBlendTree.get_node,
        Godot.Core.AnimationNodeBlendTree.remove_node,
        Godot.Core.AnimationNodeBlendTree.rename_node,
        Godot.Core.AnimationNodeBlendTree.has_node,
        Godot.Core.AnimationNodeBlendTree.connect_node,
        Godot.Core.AnimationNodeBlendTree.disconnect_node,
        Godot.Core.AnimationNodeBlendTree.set_node_position,
        Godot.Core.AnimationNodeBlendTree.get_node_position,
        Godot.Core.AnimationNodeBlendTree.set_graph_offset,
        Godot.Core.AnimationNodeBlendTree.get_graph_offset,
        Godot.Core.AnimationNodeBlendTree._tree_changed,
        Godot.Core.AnimationNodeBlendTree._node_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindAnimationNodeBlendTree_add_node #-}

bindAnimationNodeBlendTree_add_node :: MethodBind
bindAnimationNodeBlendTree_add_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "add_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_node ::
           (AnimationNodeBlendTree :< cls, Object :< cls) =>
           cls -> GodotString -> AnimationNode -> Vector2 -> IO ()
add_node cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendTree_add_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendTree_get_node #-}

bindAnimationNodeBlendTree_get_node :: MethodBind
bindAnimationNodeBlendTree_get_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "get_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_remove_node #-}

bindAnimationNodeBlendTree_remove_node :: MethodBind
bindAnimationNodeBlendTree_remove_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "remove_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_rename_node #-}

bindAnimationNodeBlendTree_rename_node :: MethodBind
bindAnimationNodeBlendTree_rename_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "rename_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_has_node #-}

bindAnimationNodeBlendTree_has_node :: MethodBind
bindAnimationNodeBlendTree_has_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "has_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_connect_node #-}

bindAnimationNodeBlendTree_connect_node :: MethodBind
bindAnimationNodeBlendTree_connect_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "connect_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_disconnect_node #-}

bindAnimationNodeBlendTree_disconnect_node :: MethodBind
bindAnimationNodeBlendTree_disconnect_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "disconnect_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_set_node_position #-}

bindAnimationNodeBlendTree_set_node_position :: MethodBind
bindAnimationNodeBlendTree_set_node_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "set_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_get_node_position #-}

bindAnimationNodeBlendTree_get_node_position :: MethodBind
bindAnimationNodeBlendTree_get_node_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "get_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_set_graph_offset #-}

bindAnimationNodeBlendTree_set_graph_offset :: MethodBind
bindAnimationNodeBlendTree_set_graph_offset
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "set_graph_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationNodeBlendTree_get_graph_offset #-}

bindAnimationNodeBlendTree_get_graph_offset :: MethodBind
bindAnimationNodeBlendTree_get_graph_offset
  = unsafePerformIO $
      withCString "AnimationNodeBlendTree" $
        \ clsNamePtr ->
          withCString "get_graph_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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