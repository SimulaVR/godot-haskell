{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorSelection
       (Godot.Tools.EditorSelection.sig_selection_changed,
        Godot.Tools.EditorSelection._emit_change,
        Godot.Tools.EditorSelection._node_removed,
        Godot.Tools.EditorSelection.add_node,
        Godot.Tools.EditorSelection.clear,
        Godot.Tools.EditorSelection.get_selected_nodes,
        Godot.Tools.EditorSelection.get_transformable_selected_nodes,
        Godot.Tools.EditorSelection.remove_node)
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
import Godot.Core.Object()

-- | Emitted when the selection changes.
sig_selection_changed ::
                      Godot.Internal.Dispatch.Signal EditorSelection
sig_selection_changed
  = Godot.Internal.Dispatch.Signal "selection_changed"

instance NodeSignal EditorSelection "selection_changed" '[]

{-# NOINLINE bindEditorSelection__emit_change #-}

bindEditorSelection__emit_change :: MethodBind
bindEditorSelection__emit_change
  = unsafePerformIO $
      withCString "EditorSelection" $
        \ clsNamePtr ->
          withCString "_emit_change" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_emit_change ::
               (EditorSelection :< cls, Object :< cls) => cls -> IO ()
_emit_change cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSelection__emit_change
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSelection "_emit_change" '[] (IO ())
         where
        nodeMethod = Godot.Tools.EditorSelection._emit_change

{-# NOINLINE bindEditorSelection__node_removed #-}

bindEditorSelection__node_removed :: MethodBind
bindEditorSelection__node_removed
  = unsafePerformIO $
      withCString "EditorSelection" $
        \ clsNamePtr ->
          withCString "_node_removed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_removed ::
                (EditorSelection :< cls, Object :< cls) => cls -> Node -> IO ()
_node_removed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSelection__node_removed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSelection "_node_removed" '[Node] (IO ())
         where
        nodeMethod = Godot.Tools.EditorSelection._node_removed

{-# NOINLINE bindEditorSelection_add_node #-}

-- | Adds a node to the selection.
--   				__Note:__ The newly selected node will not be automatically edited in the inspector. If you want to edit a node, use @method EditorInterface.edit_node@.
bindEditorSelection_add_node :: MethodBind
bindEditorSelection_add_node
  = unsafePerformIO $
      withCString "EditorSelection" $
        \ clsNamePtr ->
          withCString "add_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a node to the selection.
--   				__Note:__ The newly selected node will not be automatically edited in the inspector. If you want to edit a node, use @method EditorInterface.edit_node@.
add_node ::
           (EditorSelection :< cls, Object :< cls) => cls -> Node -> IO ()
add_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSelection_add_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSelection "add_node" '[Node] (IO ())
         where
        nodeMethod = Godot.Tools.EditorSelection.add_node

{-# NOINLINE bindEditorSelection_clear #-}

-- | Clear the selection.
bindEditorSelection_clear :: MethodBind
bindEditorSelection_clear
  = unsafePerformIO $
      withCString "EditorSelection" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear the selection.
clear :: (EditorSelection :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSelection_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSelection "clear" '[] (IO ()) where
        nodeMethod = Godot.Tools.EditorSelection.clear

{-# NOINLINE bindEditorSelection_get_selected_nodes #-}

-- | Gets the list of selected nodes.
bindEditorSelection_get_selected_nodes :: MethodBind
bindEditorSelection_get_selected_nodes
  = unsafePerformIO $
      withCString "EditorSelection" $
        \ clsNamePtr ->
          withCString "get_selected_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the list of selected nodes.
get_selected_nodes ::
                     (EditorSelection :< cls, Object :< cls) => cls -> IO Array
get_selected_nodes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSelection_get_selected_nodes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSelection "get_selected_nodes" '[]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorSelection.get_selected_nodes

{-# NOINLINE bindEditorSelection_get_transformable_selected_nodes
             #-}

-- | Gets the list of selected nodes, optimized for transform operations (i.e. moving them, rotating, etc). This list avoids situations where a node is selected and also child/grandchild.
bindEditorSelection_get_transformable_selected_nodes :: MethodBind
bindEditorSelection_get_transformable_selected_nodes
  = unsafePerformIO $
      withCString "EditorSelection" $
        \ clsNamePtr ->
          withCString "get_transformable_selected_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the list of selected nodes, optimized for transform operations (i.e. moving them, rotating, etc). This list avoids situations where a node is selected and also child/grandchild.
get_transformable_selected_nodes ::
                                   (EditorSelection :< cls, Object :< cls) => cls -> IO Array
get_transformable_selected_nodes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSelection_get_transformable_selected_nodes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSelection
           "get_transformable_selected_nodes"
           '[]
           (IO Array)
         where
        nodeMethod
          = Godot.Tools.EditorSelection.get_transformable_selected_nodes

{-# NOINLINE bindEditorSelection_remove_node #-}

-- | Removes a node from the selection.
bindEditorSelection_remove_node :: MethodBind
bindEditorSelection_remove_node
  = unsafePerformIO $
      withCString "EditorSelection" $
        \ clsNamePtr ->
          withCString "remove_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a node from the selection.
remove_node ::
              (EditorSelection :< cls, Object :< cls) => cls -> Node -> IO ()
remove_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSelection_remove_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSelection "remove_node" '[Node] (IO ())
         where
        nodeMethod = Godot.Tools.EditorSelection.remove_node