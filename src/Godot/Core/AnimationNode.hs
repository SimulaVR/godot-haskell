{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNode
       (Godot.Core.AnimationNode._FILTER_IGNORE,
        Godot.Core.AnimationNode._FILTER_BLEND,
        Godot.Core.AnimationNode._FILTER_PASS,
        Godot.Core.AnimationNode._FILTER_STOP,
        Godot.Core.AnimationNode.sig_removed_from_graph,
        Godot.Core.AnimationNode.sig_tree_changed,
        Godot.Core.AnimationNode.get_child_nodes,
        Godot.Core.AnimationNode.get_parameter_list,
        Godot.Core.AnimationNode.get_child_by_name,
        Godot.Core.AnimationNode.get_parameter_default_value,
        Godot.Core.AnimationNode.process,
        Godot.Core.AnimationNode.get_caption,
        Godot.Core.AnimationNode.has_filter,
        Godot.Core.AnimationNode.get_input_count,
        Godot.Core.AnimationNode.get_input_name,
        Godot.Core.AnimationNode.add_input,
        Godot.Core.AnimationNode.remove_input,
        Godot.Core.AnimationNode.set_filter_path,
        Godot.Core.AnimationNode.is_path_filtered,
        Godot.Core.AnimationNode.set_filter_enabled,
        Godot.Core.AnimationNode.is_filter_enabled,
        Godot.Core.AnimationNode._set_filters,
        Godot.Core.AnimationNode._get_filters,
        Godot.Core.AnimationNode.blend_animation,
        Godot.Core.AnimationNode.blend_node,
        Godot.Core.AnimationNode.blend_input,
        Godot.Core.AnimationNode.set_parameter,
        Godot.Core.AnimationNode.get_parameter)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FILTER_IGNORE :: Int
_FILTER_IGNORE = 0

_FILTER_BLEND :: Int
_FILTER_BLEND = 3

_FILTER_PASS :: Int
_FILTER_PASS = 1

_FILTER_STOP :: Int
_FILTER_STOP = 2

-- | Called when the node was removed from the graph.
sig_removed_from_graph ::
                       Godot.Internal.Dispatch.Signal AnimationNode
sig_removed_from_graph
  = Godot.Internal.Dispatch.Signal "removed_from_graph"

sig_tree_changed :: Godot.Internal.Dispatch.Signal AnimationNode
sig_tree_changed = Godot.Internal.Dispatch.Signal "tree_changed"

{-# NOINLINE bindAnimationNode_get_child_nodes #-}

-- | Get all children nodes, in order as a name:node dictionary. Only useful when inheriting [AnimationRootNode].
bindAnimationNode_get_child_nodes :: MethodBind
bindAnimationNode_get_child_nodes
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_child_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get all children nodes, in order as a name:node dictionary. Only useful when inheriting [AnimationRootNode].
get_child_nodes ::
                  (AnimationNode :< cls, Object :< cls) => cls -> IO Dictionary
get_child_nodes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_get_child_nodes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_get_parameter_list #-}

-- | Get the property information for parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees. Format is similar to [method Object.get_property_list].
bindAnimationNode_get_parameter_list :: MethodBind
bindAnimationNode_get_parameter_list
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_parameter_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the property information for parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees. Format is similar to [method Object.get_property_list].
get_parameter_list ::
                     (AnimationNode :< cls, Object :< cls) => cls -> IO Array
get_parameter_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_get_parameter_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_get_child_by_name #-}

-- | Get the a child node by index (used by editors inheriting from [AnimationRootNode]).
bindAnimationNode_get_child_by_name :: MethodBind
bindAnimationNode_get_child_by_name
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_child_by_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the a child node by index (used by editors inheriting from [AnimationRootNode]).
get_child_by_name ::
                    (AnimationNode :< cls, Object :< cls) =>
                    cls -> GodotString -> IO Object
get_child_by_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_get_child_by_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_get_parameter_default_value #-}

-- | Get the default value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
bindAnimationNode_get_parameter_default_value :: MethodBind
bindAnimationNode_get_parameter_default_value
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_parameter_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the default value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
get_parameter_default_value ::
                              (AnimationNode :< cls, Object :< cls) =>
                              cls -> GodotString -> IO GodotVariant
get_parameter_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNode_get_parameter_default_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_process #-}

-- | Called when a custom node is processed. The argument "time" is relative, unless "seek" is true (in which case it is absolute).
--   			Here, call the [method blend_input], [method blend_node] or [method blend_animation] functions.
--   			You can also use [method get_parameter] and [method set_parameter] to modify local memory.
--   			This function returns the time left for the current animation to finish (if unsure, just pass  the value from the main blend being called).
bindAnimationNode_process :: MethodBind
bindAnimationNode_process
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when a custom node is processed. The argument "time" is relative, unless "seek" is true (in which case it is absolute).
--   			Here, call the [method blend_input], [method blend_node] or [method blend_animation] functions.
--   			You can also use [method get_parameter] and [method set_parameter] to modify local memory.
--   			This function returns the time left for the current animation to finish (if unsure, just pass  the value from the main blend being called).
process ::
          (AnimationNode :< cls, Object :< cls) =>
          cls -> Float -> Bool -> IO ()
process cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_process (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_get_caption #-}

-- | Get the text caption for this node (used by some editors)
bindAnimationNode_get_caption :: MethodBind
bindAnimationNode_get_caption
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_caption" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the text caption for this node (used by some editors)
get_caption ::
              (AnimationNode :< cls, Object :< cls) => cls -> IO GodotString
get_caption cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_get_caption (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_has_filter #-}

-- | Return true whether you want the blend tree editor to display filter editing on this node.
bindAnimationNode_has_filter :: MethodBind
bindAnimationNode_has_filter
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "has_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return true whether you want the blend tree editor to display filter editing on this node.
has_filter ::
             (AnimationNode :< cls, Object :< cls) => cls -> IO GodotString
has_filter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_has_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_get_input_count #-}

-- | Amount of inputs in this node, only useful for nodes that go into [AnimationNodeBlendTree].
bindAnimationNode_get_input_count :: MethodBind
bindAnimationNode_get_input_count
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_input_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of inputs in this node, only useful for nodes that go into [AnimationNodeBlendTree].
get_input_count ::
                  (AnimationNode :< cls, Object :< cls) => cls -> IO Int
get_input_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_get_input_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_get_input_name #-}

-- | Get the name of an input by index.
bindAnimationNode_get_input_name :: MethodBind
bindAnimationNode_get_input_name
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_input_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the name of an input by index.
get_input_name ::
                 (AnimationNode :< cls, Object :< cls) =>
                 cls -> Int -> IO GodotString
get_input_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_get_input_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_add_input #-}

-- | Add an input to the node. This is only useful for nodes created for use in an [AnimationNodeBlendTree]
bindAnimationNode_add_input :: MethodBind
bindAnimationNode_add_input
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "add_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add an input to the node. This is only useful for nodes created for use in an [AnimationNodeBlendTree]
add_input ::
            (AnimationNode :< cls, Object :< cls) =>
            cls -> GodotString -> IO ()
add_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_add_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_remove_input #-}

-- | Remove an input, call this only when inactive.
bindAnimationNode_remove_input :: MethodBind
bindAnimationNode_remove_input
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "remove_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove an input, call this only when inactive.
remove_input ::
               (AnimationNode :< cls, Object :< cls) => cls -> Int -> IO ()
remove_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_remove_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_set_filter_path #-}

-- | Add/Remove a path for the filter.
bindAnimationNode_set_filter_path :: MethodBind
bindAnimationNode_set_filter_path
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "set_filter_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add/Remove a path for the filter.
set_filter_path ::
                  (AnimationNode :< cls, Object :< cls) =>
                  cls -> NodePath -> Bool -> IO ()
set_filter_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_set_filter_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_is_path_filtered #-}

-- | Return true wether a given path is filtered.
bindAnimationNode_is_path_filtered :: MethodBind
bindAnimationNode_is_path_filtered
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "is_path_filtered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return true wether a given path is filtered.
is_path_filtered ::
                   (AnimationNode :< cls, Object :< cls) => cls -> NodePath -> IO Bool
is_path_filtered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_is_path_filtered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_set_filter_enabled #-}

-- | Return whether filtering is enabled.
bindAnimationNode_set_filter_enabled :: MethodBind
bindAnimationNode_set_filter_enabled
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "set_filter_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether filtering is enabled.
set_filter_enabled ::
                     (AnimationNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_filter_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_set_filter_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_is_filter_enabled #-}

-- | Return whether filtering is enabled.
bindAnimationNode_is_filter_enabled :: MethodBind
bindAnimationNode_is_filter_enabled
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "is_filter_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether filtering is enabled.
is_filter_enabled ::
                    (AnimationNode :< cls, Object :< cls) => cls -> IO Bool
is_filter_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_is_filter_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode__set_filters #-}

bindAnimationNode__set_filters :: MethodBind
bindAnimationNode__set_filters
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "_set_filters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_filters ::
               (AnimationNode :< cls, Object :< cls) => cls -> Array -> IO ()
_set_filters cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode__set_filters (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode__get_filters #-}

bindAnimationNode__get_filters :: MethodBind
bindAnimationNode__get_filters
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "_get_filters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_filters ::
               (AnimationNode :< cls, Object :< cls) => cls -> IO Array
_get_filters cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode__get_filters (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_blend_animation #-}

-- | Blend an animation by "blend" amount (name must be valid in the linked [AnimationPlayer]). A time and delta mas be passed, as well as whether seek happened.
bindAnimationNode_blend_animation :: MethodBind
bindAnimationNode_blend_animation
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "blend_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Blend an animation by "blend" amount (name must be valid in the linked [AnimationPlayer]). A time and delta mas be passed, as well as whether seek happened.
blend_animation ::
                  (AnimationNode :< cls, Object :< cls) =>
                  cls -> GodotString -> Float -> Float -> Bool -> Float -> IO ()
blend_animation cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_blend_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_blend_node #-}

-- | Blend another animaiton node (in case this node contains children animation nodes). This function is only useful if you inherit from [AnimationRootNode] instead, else editors will not display your node for addition.
bindAnimationNode_blend_node :: MethodBind
bindAnimationNode_blend_node
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "blend_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Blend another animaiton node (in case this node contains children animation nodes). This function is only useful if you inherit from [AnimationRootNode] instead, else editors will not display your node for addition.
blend_node ::
             (AnimationNode :< cls, Object :< cls) =>
             cls ->
               GodotString ->
                 AnimationNode -> Float -> Bool -> Float -> Int -> Bool -> IO Float
blend_node cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_blend_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_blend_input #-}

-- | Blend an input. This is only useful for nodes created for an [AnimationNodeBlendTree]. Time is a delta, unless "seek" is true, in which case it is absolute. A filter mode may be optionally passed.
bindAnimationNode_blend_input :: MethodBind
bindAnimationNode_blend_input
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "blend_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Blend an input. This is only useful for nodes created for an [AnimationNodeBlendTree]. Time is a delta, unless "seek" is true, in which case it is absolute. A filter mode may be optionally passed.
blend_input ::
              (AnimationNode :< cls, Object :< cls) =>
              cls -> Int -> Float -> Bool -> Float -> Int -> Bool -> IO Float
blend_input cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_blend_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_set_parameter #-}

-- | Set a custom parameter. These are used as local storage, because resources can be reused across the tree or scenes.
bindAnimationNode_set_parameter :: MethodBind
bindAnimationNode_set_parameter
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "set_parameter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set a custom parameter. These are used as local storage, because resources can be reused across the tree or scenes.
set_parameter ::
                (AnimationNode :< cls, Object :< cls) =>
                cls -> GodotString -> GodotVariant -> IO ()
set_parameter cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_set_parameter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNode_get_parameter #-}

-- | Get the value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
bindAnimationNode_get_parameter :: MethodBind
bindAnimationNode_get_parameter
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_parameter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
get_parameter ::
                (AnimationNode :< cls, Object :< cls) =>
                cls -> GodotString -> IO GodotVariant
get_parameter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_get_parameter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)