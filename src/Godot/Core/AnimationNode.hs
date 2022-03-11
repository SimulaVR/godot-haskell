{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNode
       (Godot.Core.AnimationNode._FILTER_IGNORE,
        Godot.Core.AnimationNode._FILTER_BLEND,
        Godot.Core.AnimationNode._FILTER_PASS,
        Godot.Core.AnimationNode._FILTER_STOP,
        Godot.Core.AnimationNode.sig_removed_from_graph,
        Godot.Core.AnimationNode.sig_tree_changed,
        Godot.Core.AnimationNode._get_filters,
        Godot.Core.AnimationNode._set_filters,
        Godot.Core.AnimationNode.add_input,
        Godot.Core.AnimationNode.blend_animation,
        Godot.Core.AnimationNode.blend_input,
        Godot.Core.AnimationNode.blend_node,
        Godot.Core.AnimationNode.get_caption,
        Godot.Core.AnimationNode.get_child_by_name,
        Godot.Core.AnimationNode.get_child_nodes,
        Godot.Core.AnimationNode.get_input_count,
        Godot.Core.AnimationNode.get_input_name,
        Godot.Core.AnimationNode.get_parameter,
        Godot.Core.AnimationNode.get_parameter_default_value,
        Godot.Core.AnimationNode.get_parameter_list,
        Godot.Core.AnimationNode.has_filter,
        Godot.Core.AnimationNode.is_filter_enabled,
        Godot.Core.AnimationNode.is_path_filtered,
        Godot.Core.AnimationNode.process,
        Godot.Core.AnimationNode.remove_input,
        Godot.Core.AnimationNode.set_filter_enabled,
        Godot.Core.AnimationNode.set_filter_path,
        Godot.Core.AnimationNode.set_parameter)
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
import Godot.Core.Resource()

_FILTER_IGNORE :: Int
_FILTER_IGNORE = 0

_FILTER_BLEND :: Int
_FILTER_BLEND = 3

_FILTER_PASS :: Int
_FILTER_PASS = 1

_FILTER_STOP :: Int
_FILTER_STOP = 2

-- | Emitted when the node was removed from the graph.
sig_removed_from_graph ::
                       Godot.Internal.Dispatch.Signal AnimationNode
sig_removed_from_graph
  = Godot.Internal.Dispatch.Signal "removed_from_graph"

instance NodeSignal AnimationNode "removed_from_graph" '[]

-- | Emitted by nodes that inherit from this class and that have an internal tree when one of their nodes changes. The nodes that emit this signal are @AnimationNodeBlendSpace1D@, @AnimationNodeBlendSpace2D@, @AnimationNodeStateMachine@, and @AnimationNodeBlendTree@.
sig_tree_changed :: Godot.Internal.Dispatch.Signal AnimationNode
sig_tree_changed = Godot.Internal.Dispatch.Signal "tree_changed"

instance NodeSignal AnimationNode "tree_changed" '[]

instance NodeProperty AnimationNode "filter_enabled" Bool 'False
         where
        nodeProperty
          = (is_filter_enabled, wrapDroppingSetter set_filter_enabled,
             Nothing)

instance NodeProperty AnimationNode "filters" Array 'False where
        nodeProperty
          = (_get_filters, wrapDroppingSetter _set_filters, Nothing)

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

instance NodeMethod AnimationNode "_get_filters" '[] (IO Array)
         where
        nodeMethod = Godot.Core.AnimationNode._get_filters

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

instance NodeMethod AnimationNode "_set_filters" '[Array] (IO ())
         where
        nodeMethod = Godot.Core.AnimationNode._set_filters

{-# NOINLINE bindAnimationNode_add_input #-}

-- | Adds an input to the node. This is only useful for nodes created for use in an @AnimationNodeBlendTree@.
bindAnimationNode_add_input :: MethodBind
bindAnimationNode_add_input
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "add_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an input to the node. This is only useful for nodes created for use in an @AnimationNodeBlendTree@.
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

instance NodeMethod AnimationNode "add_input" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNode.add_input

{-# NOINLINE bindAnimationNode_blend_animation #-}

-- | Blend an animation by @blend@ amount (name must be valid in the linked @AnimationPlayer@). A @time@ and @delta@ may be passed, as well as whether @seek@ happened.
bindAnimationNode_blend_animation :: MethodBind
bindAnimationNode_blend_animation
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "blend_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Blend an animation by @blend@ amount (name must be valid in the linked @AnimationPlayer@). A @time@ and @delta@ may be passed, as well as whether @seek@ happened.
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

instance NodeMethod AnimationNode "blend_animation"
           '[GodotString, Float, Float, Bool, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNode.blend_animation

{-# NOINLINE bindAnimationNode_blend_input #-}

-- | Blend an input. This is only useful for nodes created for an @AnimationNodeBlendTree@. The @time@ parameter is a relative delta, unless @seek@ is @true@, in which case it is absolute. A filter mode may be optionally passed (see @enum FilterAction@ for options).
bindAnimationNode_blend_input :: MethodBind
bindAnimationNode_blend_input
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "blend_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Blend an input. This is only useful for nodes created for an @AnimationNodeBlendTree@. The @time@ parameter is a relative delta, unless @seek@ is @true@, in which case it is absolute. A filter mode may be optionally passed (see @enum FilterAction@ for options).
blend_input ::
              (AnimationNode :< cls, Object :< cls) =>
              cls ->
                Int ->
                  Float -> Bool -> Float -> Maybe Int -> Maybe Bool -> IO Float
blend_input cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (0)) toVariant arg5,
       maybe (VariantBool True) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_blend_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNode "blend_input"
           '[Int, Float, Bool, Float, Maybe Int, Maybe Bool]
           (IO Float)
         where
        nodeMethod = Godot.Core.AnimationNode.blend_input

{-# NOINLINE bindAnimationNode_blend_node #-}

-- | Blend another animation node (in case this node contains children animation nodes). This function is only useful if you inherit from @AnimationRootNode@ instead, else editors will not display your node for addition.
bindAnimationNode_blend_node :: MethodBind
bindAnimationNode_blend_node
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "blend_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Blend another animation node (in case this node contains children animation nodes). This function is only useful if you inherit from @AnimationRootNode@ instead, else editors will not display your node for addition.
blend_node ::
             (AnimationNode :< cls, Object :< cls) =>
             cls ->
               GodotString ->
                 AnimationNode ->
                   Float -> Bool -> Float -> Maybe Int -> Maybe Bool -> IO Float
blend_node cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, maybe (VariantInt (0)) toVariant arg6,
       maybe (VariantBool True) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_blend_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNode "blend_node"
           '[GodotString, AnimationNode, Float, Bool, Float, Maybe Int,
             Maybe Bool]
           (IO Float)
         where
        nodeMethod = Godot.Core.AnimationNode.blend_node

{-# NOINLINE bindAnimationNode_get_caption #-}

-- | Gets the text caption for this node (used by some editors).
bindAnimationNode_get_caption :: MethodBind
bindAnimationNode_get_caption
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_caption" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the text caption for this node (used by some editors).
get_caption ::
              (AnimationNode :< cls, Object :< cls) => cls -> IO GodotString
get_caption cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_get_caption (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNode "get_caption" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AnimationNode.get_caption

{-# NOINLINE bindAnimationNode_get_child_by_name #-}

-- | Gets a child node by index (used by editors inheriting from @AnimationRootNode@).
bindAnimationNode_get_child_by_name :: MethodBind
bindAnimationNode_get_child_by_name
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_child_by_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a child node by index (used by editors inheriting from @AnimationRootNode@).
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

instance NodeMethod AnimationNode "get_child_by_name"
           '[GodotString]
           (IO Object)
         where
        nodeMethod = Godot.Core.AnimationNode.get_child_by_name

{-# NOINLINE bindAnimationNode_get_child_nodes #-}

-- | Gets all children nodes in order as a @name: node@ dictionary. Only useful when inheriting @AnimationRootNode@.
bindAnimationNode_get_child_nodes :: MethodBind
bindAnimationNode_get_child_nodes
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_child_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets all children nodes in order as a @name: node@ dictionary. Only useful when inheriting @AnimationRootNode@.
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

instance NodeMethod AnimationNode "get_child_nodes" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.AnimationNode.get_child_nodes

{-# NOINLINE bindAnimationNode_get_input_count #-}

-- | Amount of inputs in this node, only useful for nodes that go into @AnimationNodeBlendTree@.
bindAnimationNode_get_input_count :: MethodBind
bindAnimationNode_get_input_count
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_input_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of inputs in this node, only useful for nodes that go into @AnimationNodeBlendTree@.
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

instance NodeMethod AnimationNode "get_input_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AnimationNode.get_input_count

{-# NOINLINE bindAnimationNode_get_input_name #-}

-- | Gets the name of an input by index.
bindAnimationNode_get_input_name :: MethodBind
bindAnimationNode_get_input_name
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_input_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the name of an input by index.
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

instance NodeMethod AnimationNode "get_input_name" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AnimationNode.get_input_name

{-# NOINLINE bindAnimationNode_get_parameter #-}

-- | Gets the value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
bindAnimationNode_get_parameter :: MethodBind
bindAnimationNode_get_parameter
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_parameter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
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

instance NodeMethod AnimationNode "get_parameter" '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.AnimationNode.get_parameter

{-# NOINLINE bindAnimationNode_get_parameter_default_value #-}

-- | Gets the default value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
bindAnimationNode_get_parameter_default_value :: MethodBind
bindAnimationNode_get_parameter_default_value
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_parameter_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the default value of a parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees.
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

instance NodeMethod AnimationNode "get_parameter_default_value"
           '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.AnimationNode.get_parameter_default_value

{-# NOINLINE bindAnimationNode_get_parameter_list #-}

-- | Gets the property information for parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees. Format is similar to @method Object.get_property_list@.
bindAnimationNode_get_parameter_list :: MethodBind
bindAnimationNode_get_parameter_list
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "get_parameter_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the property information for parameter. Parameters are custom local memory used for your nodes, given a resource can be reused in multiple trees. Format is similar to @method Object.get_property_list@.
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

instance NodeMethod AnimationNode "get_parameter_list" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.AnimationNode.get_parameter_list

{-# NOINLINE bindAnimationNode_has_filter #-}

-- | Returns @true@ whether you want the blend tree editor to display filter editing on this node.
bindAnimationNode_has_filter :: MethodBind
bindAnimationNode_has_filter
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "has_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ whether you want the blend tree editor to display filter editing on this node.
has_filter ::
             (AnimationNode :< cls, Object :< cls) => cls -> IO GodotString
has_filter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_has_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNode "has_filter" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.AnimationNode.has_filter

{-# NOINLINE bindAnimationNode_is_filter_enabled #-}

-- | If @true@, filtering is enabled.
bindAnimationNode_is_filter_enabled :: MethodBind
bindAnimationNode_is_filter_enabled
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "is_filter_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, filtering is enabled.
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

instance NodeMethod AnimationNode "is_filter_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AnimationNode.is_filter_enabled

{-# NOINLINE bindAnimationNode_is_path_filtered #-}

-- | Returns whether the given path is filtered.
bindAnimationNode_is_path_filtered :: MethodBind
bindAnimationNode_is_path_filtered
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "is_path_filtered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the given path is filtered.
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

instance NodeMethod AnimationNode "is_path_filtered" '[NodePath]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AnimationNode.is_path_filtered

{-# NOINLINE bindAnimationNode_process #-}

-- | User-defined callback called when a custom node is processed. The @time@ parameter is a relative delta, unless @seek@ is @true@, in which case it is absolute.
--   				Here, call the @method blend_input@, @method blend_node@ or @method blend_animation@ functions. You can also use @method get_parameter@ and @method set_parameter@ to modify local memory.
--   				This function should return the time left for the current animation to finish (if unsure, pass the value from the main blend being called).
bindAnimationNode_process :: MethodBind
bindAnimationNode_process
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | User-defined callback called when a custom node is processed. The @time@ parameter is a relative delta, unless @seek@ is @true@, in which case it is absolute.
--   				Here, call the @method blend_input@, @method blend_node@ or @method blend_animation@ functions. You can also use @method get_parameter@ and @method set_parameter@ to modify local memory.
--   				This function should return the time left for the current animation to finish (if unsure, pass the value from the main blend being called).
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

instance NodeMethod AnimationNode "process" '[Float, Bool] (IO ())
         where
        nodeMethod = Godot.Core.AnimationNode.process

{-# NOINLINE bindAnimationNode_remove_input #-}

-- | Removes an input, call this only when inactive.
bindAnimationNode_remove_input :: MethodBind
bindAnimationNode_remove_input
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "remove_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes an input, call this only when inactive.
remove_input ::
               (AnimationNode :< cls, Object :< cls) => cls -> Int -> IO ()
remove_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNode_remove_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNode "remove_input" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.AnimationNode.remove_input

{-# NOINLINE bindAnimationNode_set_filter_enabled #-}

-- | If @true@, filtering is enabled.
bindAnimationNode_set_filter_enabled :: MethodBind
bindAnimationNode_set_filter_enabled
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "set_filter_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, filtering is enabled.
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

instance NodeMethod AnimationNode "set_filter_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNode.set_filter_enabled

{-# NOINLINE bindAnimationNode_set_filter_path #-}

-- | Adds or removes a path for the filter.
bindAnimationNode_set_filter_path :: MethodBind
bindAnimationNode_set_filter_path
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "set_filter_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds or removes a path for the filter.
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

instance NodeMethod AnimationNode "set_filter_path"
           '[NodePath, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNode.set_filter_path

{-# NOINLINE bindAnimationNode_set_parameter #-}

-- | Sets a custom parameter. These are used as local memory, because resources can be reused across the tree or scenes.
bindAnimationNode_set_parameter :: MethodBind
bindAnimationNode_set_parameter
  = unsafePerformIO $
      withCString "AnimationNode" $
        \ clsNamePtr ->
          withCString "set_parameter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom parameter. These are used as local memory, because resources can be reused across the tree or scenes.
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

instance NodeMethod AnimationNode "set_parameter"
           '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNode.set_parameter