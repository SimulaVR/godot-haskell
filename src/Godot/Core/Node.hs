{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Node
       (Godot.Core.Node._DUPLICATE_GROUPS,
        Godot.Core.Node._DUPLICATE_SCRIPTS,
        Godot.Core.Node._NOTIFICATION_PAUSED,
        Godot.Core.Node._NOTIFICATION_MOVED_IN_PARENT,
        Godot.Core.Node._NOTIFICATION_UNPARENTED,
        Godot.Core.Node._PAUSE_MODE_PROCESS,
        Godot.Core.Node._NOTIFICATION_WM_ABOUT,
        Godot.Core.Node._NOTIFICATION_DRAG_END,
        Godot.Core.Node._NOTIFICATION_PATH_CHANGED,
        Godot.Core.Node._NOTIFICATION_APP_PAUSED,
        Godot.Core.Node._NOTIFICATION_PHYSICS_PROCESS,
        Godot.Core.Node._NOTIFICATION_INTERNAL_PHYSICS_PROCESS,
        Godot.Core.Node._NOTIFICATION_WM_GO_BACK_REQUEST,
        Godot.Core.Node._NOTIFICATION_WM_QUIT_REQUEST,
        Godot.Core.Node._DUPLICATE_USE_INSTANCING,
        Godot.Core.Node._NOTIFICATION_ENTER_TREE,
        Godot.Core.Node._NOTIFICATION_EXIT_TREE,
        Godot.Core.Node._NOTIFICATION_WM_FOCUS_IN,
        Godot.Core.Node._NOTIFICATION_WM_MOUSE_EXIT,
        Godot.Core.Node._NOTIFICATION_PROCESS,
        Godot.Core.Node._NOTIFICATION_INTERNAL_PROCESS,
        Godot.Core.Node._PAUSE_MODE_STOP,
        Godot.Core.Node._PAUSE_MODE_INHERIT,
        Godot.Core.Node._NOTIFICATION_TRANSLATION_CHANGED,
        Godot.Core.Node._NOTIFICATION_INSTANCED,
        Godot.Core.Node._NOTIFICATION_UNPAUSED,
        Godot.Core.Node._NOTIFICATION_PARENTED,
        Godot.Core.Node._NOTIFICATION_WM_FOCUS_OUT,
        Godot.Core.Node._NOTIFICATION_DRAG_BEGIN,
        Godot.Core.Node._DUPLICATE_SIGNALS,
        Godot.Core.Node._NOTIFICATION_OS_MEMORY_WARNING,
        Godot.Core.Node._NOTIFICATION_WM_UNFOCUS_REQUEST,
        Godot.Core.Node._NOTIFICATION_OS_IME_UPDATE,
        Godot.Core.Node._NOTIFICATION_APP_RESUMED,
        Godot.Core.Node._NOTIFICATION_READY,
        Godot.Core.Node._NOTIFICATION_WM_MOUSE_ENTER,
        Godot.Core.Node._NOTIFICATION_CRASH, Godot.Core.Node.sig_ready,
        Godot.Core.Node.sig_renamed, Godot.Core.Node.sig_tree_entered,
        Godot.Core.Node.sig_tree_exited, Godot.Core.Node.sig_tree_exiting,
        Godot.Core.Node._enter_tree, Godot.Core.Node._exit_tree,
        Godot.Core.Node._get_configuration_warning,
        Godot.Core.Node._get_editor_description,
        Godot.Core.Node._get_import_path, Godot.Core.Node._input,
        Godot.Core.Node._physics_process, Godot.Core.Node._process,
        Godot.Core.Node._ready, Godot.Core.Node._set_editor_description,
        Godot.Core.Node._set_import_path, Godot.Core.Node._unhandled_input,
        Godot.Core.Node._unhandled_key_input, Godot.Core.Node.add_child,
        Godot.Core.Node.add_child_below_node, Godot.Core.Node.add_to_group,
        Godot.Core.Node.can_process, Godot.Core.Node.duplicate,
        Godot.Core.Node.find_node, Godot.Core.Node.find_parent,
        Godot.Core.Node.get_child, Godot.Core.Node.get_child_count,
        Godot.Core.Node.get_children,
        Godot.Core.Node.get_custom_multiplayer,
        Godot.Core.Node.get_filename, Godot.Core.Node.get_groups,
        Godot.Core.Node.get_index, Godot.Core.Node.get_multiplayer,
        Godot.Core.Node.get_name, Godot.Core.Node.get_network_master,
        Godot.Core.Node.get_node, Godot.Core.Node.get_node_and_resource,
        Godot.Core.Node.get_node_or_null, Godot.Core.Node.get_owner,
        Godot.Core.Node.get_parent, Godot.Core.Node.get_path,
        Godot.Core.Node.get_path_to, Godot.Core.Node.get_pause_mode,
        Godot.Core.Node.get_physics_process_delta_time,
        Godot.Core.Node.get_position_in_parent,
        Godot.Core.Node.get_process_delta_time,
        Godot.Core.Node.get_process_priority,
        Godot.Core.Node.get_scene_instance_load_placeholder,
        Godot.Core.Node.get_tree, Godot.Core.Node.get_viewport,
        Godot.Core.Node.has_node, Godot.Core.Node.has_node_and_resource,
        Godot.Core.Node.is_a_parent_of,
        Godot.Core.Node.is_displayed_folded,
        Godot.Core.Node.is_greater_than, Godot.Core.Node.is_in_group,
        Godot.Core.Node.is_inside_tree, Godot.Core.Node.is_network_master,
        Godot.Core.Node.is_physics_processing,
        Godot.Core.Node.is_physics_processing_internal,
        Godot.Core.Node.is_processing, Godot.Core.Node.is_processing_input,
        Godot.Core.Node.is_processing_internal,
        Godot.Core.Node.is_processing_unhandled_input,
        Godot.Core.Node.is_processing_unhandled_key_input,
        Godot.Core.Node.move_child, Godot.Core.Node.print_stray_nodes,
        Godot.Core.Node.print_tree, Godot.Core.Node.print_tree_pretty,
        Godot.Core.Node.propagate_call,
        Godot.Core.Node.propagate_notification, Godot.Core.Node.queue_free,
        Godot.Core.Node.raise, Godot.Core.Node.remove_and_skip,
        Godot.Core.Node.remove_child, Godot.Core.Node.remove_from_group,
        Godot.Core.Node.replace_by, Godot.Core.Node.request_ready,
        Godot.Core.Node.rpc, Godot.Core.Node.rpc_config,
        Godot.Core.Node.rpc_id, Godot.Core.Node.rpc_unreliable,
        Godot.Core.Node.rpc_unreliable_id, Godot.Core.Node.rset,
        Godot.Core.Node.rset_config, Godot.Core.Node.rset_id,
        Godot.Core.Node.rset_unreliable,
        Godot.Core.Node.rset_unreliable_id,
        Godot.Core.Node.set_custom_multiplayer,
        Godot.Core.Node.set_display_folded, Godot.Core.Node.set_filename,
        Godot.Core.Node.set_name, Godot.Core.Node.set_network_master,
        Godot.Core.Node.set_owner, Godot.Core.Node.set_pause_mode,
        Godot.Core.Node.set_physics_process,
        Godot.Core.Node.set_physics_process_internal,
        Godot.Core.Node.set_process, Godot.Core.Node.set_process_input,
        Godot.Core.Node.set_process_internal,
        Godot.Core.Node.set_process_priority,
        Godot.Core.Node.set_process_unhandled_input,
        Godot.Core.Node.set_process_unhandled_key_input,
        Godot.Core.Node.set_scene_instance_load_placeholder,
        Godot.Core.Node.update_configuration_warning)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_DUPLICATE_GROUPS :: Int
_DUPLICATE_GROUPS = 2

_DUPLICATE_SCRIPTS :: Int
_DUPLICATE_SCRIPTS = 4

_NOTIFICATION_PAUSED :: Int
_NOTIFICATION_PAUSED = 14

_NOTIFICATION_MOVED_IN_PARENT :: Int
_NOTIFICATION_MOVED_IN_PARENT = 12

_NOTIFICATION_UNPARENTED :: Int
_NOTIFICATION_UNPARENTED = 19

_PAUSE_MODE_PROCESS :: Int
_PAUSE_MODE_PROCESS = 2

_NOTIFICATION_WM_ABOUT :: Int
_NOTIFICATION_WM_ABOUT = 1011

_NOTIFICATION_DRAG_END :: Int
_NOTIFICATION_DRAG_END = 22

_NOTIFICATION_PATH_CHANGED :: Int
_NOTIFICATION_PATH_CHANGED = 23

_NOTIFICATION_APP_PAUSED :: Int
_NOTIFICATION_APP_PAUSED = 1015

_NOTIFICATION_PHYSICS_PROCESS :: Int
_NOTIFICATION_PHYSICS_PROCESS = 16

_NOTIFICATION_INTERNAL_PHYSICS_PROCESS :: Int
_NOTIFICATION_INTERNAL_PHYSICS_PROCESS = 26

_NOTIFICATION_WM_GO_BACK_REQUEST :: Int
_NOTIFICATION_WM_GO_BACK_REQUEST = 1007

_NOTIFICATION_WM_QUIT_REQUEST :: Int
_NOTIFICATION_WM_QUIT_REQUEST = 1006

_DUPLICATE_USE_INSTANCING :: Int
_DUPLICATE_USE_INSTANCING = 8

_NOTIFICATION_ENTER_TREE :: Int
_NOTIFICATION_ENTER_TREE = 10

_NOTIFICATION_EXIT_TREE :: Int
_NOTIFICATION_EXIT_TREE = 11

_NOTIFICATION_WM_FOCUS_IN :: Int
_NOTIFICATION_WM_FOCUS_IN = 1004

_NOTIFICATION_WM_MOUSE_EXIT :: Int
_NOTIFICATION_WM_MOUSE_EXIT = 1003

_NOTIFICATION_PROCESS :: Int
_NOTIFICATION_PROCESS = 17

_NOTIFICATION_INTERNAL_PROCESS :: Int
_NOTIFICATION_INTERNAL_PROCESS = 25

_PAUSE_MODE_STOP :: Int
_PAUSE_MODE_STOP = 1

_PAUSE_MODE_INHERIT :: Int
_PAUSE_MODE_INHERIT = 0

_NOTIFICATION_TRANSLATION_CHANGED :: Int
_NOTIFICATION_TRANSLATION_CHANGED = 1010

_NOTIFICATION_INSTANCED :: Int
_NOTIFICATION_INSTANCED = 20

_NOTIFICATION_UNPAUSED :: Int
_NOTIFICATION_UNPAUSED = 15

_NOTIFICATION_PARENTED :: Int
_NOTIFICATION_PARENTED = 18

_NOTIFICATION_WM_FOCUS_OUT :: Int
_NOTIFICATION_WM_FOCUS_OUT = 1005

_NOTIFICATION_DRAG_BEGIN :: Int
_NOTIFICATION_DRAG_BEGIN = 21

_DUPLICATE_SIGNALS :: Int
_DUPLICATE_SIGNALS = 1

_NOTIFICATION_OS_MEMORY_WARNING :: Int
_NOTIFICATION_OS_MEMORY_WARNING = 1009

_NOTIFICATION_WM_UNFOCUS_REQUEST :: Int
_NOTIFICATION_WM_UNFOCUS_REQUEST = 1008

_NOTIFICATION_OS_IME_UPDATE :: Int
_NOTIFICATION_OS_IME_UPDATE = 1013

_NOTIFICATION_APP_RESUMED :: Int
_NOTIFICATION_APP_RESUMED = 1014

_NOTIFICATION_READY :: Int
_NOTIFICATION_READY = 13

_NOTIFICATION_WM_MOUSE_ENTER :: Int
_NOTIFICATION_WM_MOUSE_ENTER = 1002

_NOTIFICATION_CRASH :: Int
_NOTIFICATION_CRASH = 1012

-- | Emitted when the node is ready.
sig_ready :: Godot.Internal.Dispatch.Signal Node
sig_ready = Godot.Internal.Dispatch.Signal "ready"

instance NodeSignal Node "ready" '[]

-- | Emitted when the node is renamed.
sig_renamed :: Godot.Internal.Dispatch.Signal Node
sig_renamed = Godot.Internal.Dispatch.Signal "renamed"

instance NodeSignal Node "renamed" '[]

-- | Emitted when the node enters the tree.
sig_tree_entered :: Godot.Internal.Dispatch.Signal Node
sig_tree_entered = Godot.Internal.Dispatch.Signal "tree_entered"

instance NodeSignal Node "tree_entered" '[]

-- | Emitted after the node exits the tree and is no longer active.
sig_tree_exited :: Godot.Internal.Dispatch.Signal Node
sig_tree_exited = Godot.Internal.Dispatch.Signal "tree_exited"

instance NodeSignal Node "tree_exited" '[]

-- | Emitted when the node is still active but about to exit the tree. This is the right place for de-initialization (or a "destructor", if you will).
sig_tree_exiting :: Godot.Internal.Dispatch.Signal Node
sig_tree_exiting = Godot.Internal.Dispatch.Signal "tree_exiting"

instance NodeSignal Node "tree_exiting" '[]

{-# NOINLINE bindNode__enter_tree #-}

-- | Called when the node enters the [SceneTree] (e.g. upon instancing, scene changing, or after calling [method add_child] in a script). If the node has children, its [method _enter_tree] callback will be called first, and then that of the children.
--   				Corresponds to the [constant NOTIFICATION_ENTER_TREE] notification in [method Object._notification].
bindNode__enter_tree :: MethodBind
bindNode__enter_tree
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when the node enters the [SceneTree] (e.g. upon instancing, scene changing, or after calling [method add_child] in a script). If the node has children, its [method _enter_tree] callback will be called first, and then that of the children.
--   				Corresponds to the [constant NOTIFICATION_ENTER_TREE] notification in [method Object._notification].
_enter_tree :: (Node :< cls, Object :< cls) => cls -> IO ()
_enter_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__enter_tree (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__exit_tree #-}

-- | Called when the node is about to leave the [SceneTree] (e.g. upon freeing, scene changing, or after calling [method remove_child] in a script). If the node has children, its [method _exit_tree] callback will be called last, after all its children have left the tree.
--   				Corresponds to the [constant NOTIFICATION_EXIT_TREE] notification in [method Object._notification] and signal [signal tree_exiting]. To get notified when the node has already left the active tree, connect to the [signal tree_exited].
bindNode__exit_tree :: MethodBind
bindNode__exit_tree
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when the node is about to leave the [SceneTree] (e.g. upon freeing, scene changing, or after calling [method remove_child] in a script). If the node has children, its [method _exit_tree] callback will be called last, after all its children have left the tree.
--   				Corresponds to the [constant NOTIFICATION_EXIT_TREE] notification in [method Object._notification] and signal [signal tree_exiting]. To get notified when the node has already left the active tree, connect to the [signal tree_exited].
_exit_tree :: (Node :< cls, Object :< cls) => cls -> IO ()
_exit_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__exit_tree (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__get_configuration_warning #-}

-- | The string returned from this method is displayed as a warning in the Scene Dock if the script that overrides it is a [code]tool[/code] script.
--   				Returning an empty string produces no warning.
--   				Call [method update_configuration_warning] when the warning needs to be updated for this node.
bindNode__get_configuration_warning :: MethodBind
bindNode__get_configuration_warning
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_get_configuration_warning" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The string returned from this method is displayed as a warning in the Scene Dock if the script that overrides it is a [code]tool[/code] script.
--   				Returning an empty string produces no warning.
--   				Call [method update_configuration_warning] when the warning needs to be updated for this node.
_get_configuration_warning ::
                             (Node :< cls, Object :< cls) => cls -> IO GodotString
_get_configuration_warning cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__get_configuration_warning
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__get_editor_description #-}

bindNode__get_editor_description :: MethodBind
bindNode__get_editor_description
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_get_editor_description" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_editor_description ::
                          (Node :< cls, Object :< cls) => cls -> IO GodotString
_get_editor_description cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__get_editor_description
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__get_import_path #-}

bindNode__get_import_path :: MethodBind
bindNode__get_import_path
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_get_import_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_import_path ::
                   (Node :< cls, Object :< cls) => cls -> IO NodePath
_get_import_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__get_import_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__input #-}

-- | Called when there is an input event. The input event propagates up through the node tree until a node consumes it.
--   				It is only called if input processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_process_input].
--   				To consume the input event and stop it propagating further to other nodes, [method SceneTree.set_input_as_handled] can be called.
--   				For gameplay input, [method _unhandled_input] and [method _unhandled_key_input] are usually a better fit as they allow the GUI to intercept the events first.
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
bindNode__input :: MethodBind
bindNode__input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when there is an input event. The input event propagates up through the node tree until a node consumes it.
--   				It is only called if input processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_process_input].
--   				To consume the input event and stop it propagating further to other nodes, [method SceneTree.set_input_as_handled] can be called.
--   				For gameplay input, [method _unhandled_input] and [method _unhandled_key_input] are usually a better fit as they allow the GUI to intercept the events first.
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
_input ::
         (Node :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__input (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__physics_process #-}

-- | Called during the physics processing step of the main loop. Physics processing means that the frame rate is synced to the physics, i.e. the [code]delta[/code] variable should be constant.
--   				It is only called if physics processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_physics_process].
--   				Corresponds to the [constant NOTIFICATION_PHYSICS_PROCESS] notification in [method Object._notification].
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
bindNode__physics_process :: MethodBind
bindNode__physics_process
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_physics_process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called during the physics processing step of the main loop. Physics processing means that the frame rate is synced to the physics, i.e. the [code]delta[/code] variable should be constant.
--   				It is only called if physics processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_physics_process].
--   				Corresponds to the [constant NOTIFICATION_PHYSICS_PROCESS] notification in [method Object._notification].
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
_physics_process ::
                   (Node :< cls, Object :< cls) => cls -> Float -> IO ()
_physics_process cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__physics_process (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__process #-}

-- | Called during the processing step of the main loop. Processing happens at every frame and as fast as possible, so the [code]delta[/code] time since the previous frame is not constant.
--   				It is only called if processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_process].
--   				Corresponds to the [constant NOTIFICATION_PROCESS] notification in [method Object._notification].
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
bindNode__process :: MethodBind
bindNode__process
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called during the processing step of the main loop. Processing happens at every frame and as fast as possible, so the [code]delta[/code] time since the previous frame is not constant.
--   				It is only called if processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_process].
--   				Corresponds to the [constant NOTIFICATION_PROCESS] notification in [method Object._notification].
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
_process :: (Node :< cls, Object :< cls) => cls -> Float -> IO ()
_process cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__process (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__ready #-}

-- | Called when the node is "ready", i.e. when both the node and its children have entered the scene tree. If the node has children, their [method _ready] callbacks get triggered first, and the parent node will receive the ready notification afterwards.
--   				Corresponds to the [constant NOTIFICATION_READY] notification in [method Object._notification]. See also the [code]onready[/code] keyword for variables.
--   				Usually used for initialization. For even earlier initialization, [method Object._init] may be used. See also [method _enter_tree].
--   				[b]Note:[/b] [method _ready] may be called only once for each node. After removing a node from the scene tree and adding again, [code]_ready[/code] will not be called for the second time. This can be bypassed with requesting another call with [method request_ready], which may be called anywhere before adding the node again.
bindNode__ready :: MethodBind
bindNode__ready
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_ready" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when the node is "ready", i.e. when both the node and its children have entered the scene tree. If the node has children, their [method _ready] callbacks get triggered first, and the parent node will receive the ready notification afterwards.
--   				Corresponds to the [constant NOTIFICATION_READY] notification in [method Object._notification]. See also the [code]onready[/code] keyword for variables.
--   				Usually used for initialization. For even earlier initialization, [method Object._init] may be used. See also [method _enter_tree].
--   				[b]Note:[/b] [method _ready] may be called only once for each node. After removing a node from the scene tree and adding again, [code]_ready[/code] will not be called for the second time. This can be bypassed with requesting another call with [method request_ready], which may be called anywhere before adding the node again.
_ready :: (Node :< cls, Object :< cls) => cls -> IO ()
_ready cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__ready (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__set_editor_description #-}

bindNode__set_editor_description :: MethodBind
bindNode__set_editor_description
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_set_editor_description" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_editor_description ::
                          (Node :< cls, Object :< cls) => cls -> GodotString -> IO ()
_set_editor_description cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__set_editor_description
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__set_import_path #-}

bindNode__set_import_path :: MethodBind
bindNode__set_import_path
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_set_import_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_import_path ::
                   (Node :< cls, Object :< cls) => cls -> NodePath -> IO ()
_set_import_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__set_import_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__unhandled_input #-}

-- | Called when an [InputEvent] hasn't been consumed by [method _input] or any GUI. The input event propagates up through the node tree until a node consumes it.
--   				It is only called if unhandled input processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_process_unhandled_input].
--   				To consume the input event and stop it propagating further to other nodes, [method SceneTree.set_input_as_handled] can be called.
--   				For gameplay input, this and [method _unhandled_key_input] are usually a better fit than [method _input] as they allow the GUI to intercept the events first.
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
bindNode__unhandled_input :: MethodBind
bindNode__unhandled_input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when an [InputEvent] hasn't been consumed by [method _input] or any GUI. The input event propagates up through the node tree until a node consumes it.
--   				It is only called if unhandled input processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_process_unhandled_input].
--   				To consume the input event and stop it propagating further to other nodes, [method SceneTree.set_input_as_handled] can be called.
--   				For gameplay input, this and [method _unhandled_key_input] are usually a better fit than [method _input] as they allow the GUI to intercept the events first.
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
_unhandled_input ::
                   (Node :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__unhandled_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode__unhandled_key_input #-}

-- | Called when an [InputEventKey] hasn't been consumed by [method _input] or any GUI. The input event propagates up through the node tree until a node consumes it.
--   				It is only called if unhandled key input processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_process_unhandled_key_input].
--   				To consume the input event and stop it propagating further to other nodes, [method SceneTree.set_input_as_handled] can be called.
--   				For gameplay input, this and [method _unhandled_input] are usually a better fit than [method _input] as they allow the GUI to intercept the events first.
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
bindNode__unhandled_key_input :: MethodBind
bindNode__unhandled_key_input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "_unhandled_key_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when an [InputEventKey] hasn't been consumed by [method _input] or any GUI. The input event propagates up through the node tree until a node consumes it.
--   				It is only called if unhandled key input processing is enabled, which is done automatically if this method is overridden, and can be toggled with [method set_process_unhandled_key_input].
--   				To consume the input event and stop it propagating further to other nodes, [method SceneTree.set_input_as_handled] can be called.
--   				For gameplay input, this and [method _unhandled_input] are usually a better fit than [method _input] as they allow the GUI to intercept the events first.
--   				[b]Note:[/b] This method is only called if the node is present in the scene tree (i.e. if it's not orphan).
_unhandled_key_input ::
                       (Node :< cls, Object :< cls) => cls -> InputEventKey -> IO ()
_unhandled_key_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode__unhandled_key_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_add_child #-}

-- | Adds a child node. Nodes can have any number of children, but every child must have a unique name. Child nodes are automatically deleted when the parent node is deleted, so an entire scene can be removed by deleting its topmost node.
--   				If [code]legible_unique_name[/code] is [code]true[/code], the child node will have an human-readable name based on the name of the node being instanced instead of its type.
--   				[b]Note:[/b] If the child node already has a parent, the function will fail. Use [method remove_child] first to remove the node from its current parent. For example:
--   				[codeblock]
--   				if child_node.get_parent():
--   				    child_node.get_parent().remove_child(child_node)
--   				add_child(child_node)
--   				[/codeblock]
--   				[b]Note:[/b] If you want a child to be persisted to a [PackedScene], you must set [member owner] in addition to calling [method add_child]. This is typically relevant for [url=https://godot.readthedocs.io/en/latest/tutorials/misc/running_code_in_the_editor.html]tool scripts[/url] and [url=https://godot.readthedocs.io/en/latest/tutorials/plugins/editor/index.html]editor plugins[/url]. If [method add_child] is called without setting [member owner], the newly added [Node] will not be visible in the scene tree, though it will be visible in the 2D/3D view.
bindNode_add_child :: MethodBind
bindNode_add_child
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "add_child" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a child node. Nodes can have any number of children, but every child must have a unique name. Child nodes are automatically deleted when the parent node is deleted, so an entire scene can be removed by deleting its topmost node.
--   				If [code]legible_unique_name[/code] is [code]true[/code], the child node will have an human-readable name based on the name of the node being instanced instead of its type.
--   				[b]Note:[/b] If the child node already has a parent, the function will fail. Use [method remove_child] first to remove the node from its current parent. For example:
--   				[codeblock]
--   				if child_node.get_parent():
--   				    child_node.get_parent().remove_child(child_node)
--   				add_child(child_node)
--   				[/codeblock]
--   				[b]Note:[/b] If you want a child to be persisted to a [PackedScene], you must set [member owner] in addition to calling [method add_child]. This is typically relevant for [url=https://godot.readthedocs.io/en/latest/tutorials/misc/running_code_in_the_editor.html]tool scripts[/url] and [url=https://godot.readthedocs.io/en/latest/tutorials/plugins/editor/index.html]editor plugins[/url]. If [method add_child] is called without setting [member owner], the newly added [Node] will not be visible in the scene tree, though it will be visible in the 2D/3D view.
add_child ::
            (Node :< cls, Object :< cls) => cls -> Node -> Bool -> IO ()
add_child cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_add_child (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_add_child_below_node #-}

-- | Adds [code]child_node[/code] as a child. The child is placed below the given [code]node[/code] in the list of children.
--   				If [code]legible_unique_name[/code] is [code]true[/code], the child node will have an human-readable name based on the name of the node being instanced instead of its type.
bindNode_add_child_below_node :: MethodBind
bindNode_add_child_below_node
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "add_child_below_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds [code]child_node[/code] as a child. The child is placed below the given [code]node[/code] in the list of children.
--   				If [code]legible_unique_name[/code] is [code]true[/code], the child node will have an human-readable name based on the name of the node being instanced instead of its type.
add_child_below_node ::
                       (Node :< cls, Object :< cls) =>
                       cls -> Node -> Node -> Bool -> IO ()
add_child_below_node cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_add_child_below_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_add_to_group #-}

-- | Adds the node to a group. Groups are helpers to name and organize a subset of nodes, for example "enemies" or "collectables". A node can be in any number of groups. Nodes can be assigned a group at any time, but will not be added until they are inside the scene tree (see [method is_inside_tree]). See notes in the description, and the group methods in [SceneTree].
--   				The [code]persistent[/code] option is used when packing node to [PackedScene] and saving to file. Non-persistent groups aren't stored.
bindNode_add_to_group :: MethodBind
bindNode_add_to_group
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "add_to_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the node to a group. Groups are helpers to name and organize a subset of nodes, for example "enemies" or "collectables". A node can be in any number of groups. Nodes can be assigned a group at any time, but will not be added until they are inside the scene tree (see [method is_inside_tree]). See notes in the description, and the group methods in [SceneTree].
--   				The [code]persistent[/code] option is used when packing node to [PackedScene] and saving to file. Non-persistent groups aren't stored.
add_to_group ::
               (Node :< cls, Object :< cls) => cls -> GodotString -> Bool -> IO ()
add_to_group cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_add_to_group (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_can_process #-}

-- | Returns [code]true[/code] if the node can process while the scene tree is paused (see [member pause_mode]). Always returns [code]true[/code] if the scene tree is not paused, and [code]false[/code] if the node is not in the tree.
bindNode_can_process :: MethodBind
bindNode_can_process
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "can_process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the node can process while the scene tree is paused (see [member pause_mode]). Always returns [code]true[/code] if the scene tree is not paused, and [code]false[/code] if the node is not in the tree.
can_process :: (Node :< cls, Object :< cls) => cls -> IO Bool
can_process cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_can_process (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_duplicate #-}

-- | Duplicates the node, returning a new node.
--   				You can fine-tune the behavior using the [code]flags[/code] (see [enum DuplicateFlags]).
--   				[b]Note:[/b] It will not work properly if the node contains a script with constructor arguments (i.e. needs to supply arguments to [method Object._init] method). In that case, the node will be duplicated without a script.
bindNode_duplicate :: MethodBind
bindNode_duplicate
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "duplicate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Duplicates the node, returning a new node.
--   				You can fine-tune the behavior using the [code]flags[/code] (see [enum DuplicateFlags]).
--   				[b]Note:[/b] It will not work properly if the node contains a script with constructor arguments (i.e. needs to supply arguments to [method Object._init] method). In that case, the node will be duplicated without a script.
duplicate :: (Node :< cls, Object :< cls) => cls -> Int -> IO Node
duplicate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_duplicate (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_find_node #-}

-- | Finds a descendant of this node whose name matches [code]mask[/code] as in [method String.match] (i.e. case-sensitive, but [code]"*"[/code] matches zero or more characters and [code]"?"[/code] matches any single character except [code]"."[/code]).
--   				[b]Note:[/b] It does not match against the full path, just against individual node names.
--   				If [code]owned[/code] is [code]true[/code], this method only finds nodes whose owner is this node. This is especially important for scenes instantiated through a script, because those scenes don't have an owner.
--   				[b]Note:[/b] As this method walks through all the descendants of the node, it is the slowest way to get a reference to another node. Whenever possible, consider using [method get_node] instead. To avoid using [method find_node] too often, consider caching the node reference into a variable.
bindNode_find_node :: MethodBind
bindNode_find_node
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "find_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Finds a descendant of this node whose name matches [code]mask[/code] as in [method String.match] (i.e. case-sensitive, but [code]"*"[/code] matches zero or more characters and [code]"?"[/code] matches any single character except [code]"."[/code]).
--   				[b]Note:[/b] It does not match against the full path, just against individual node names.
--   				If [code]owned[/code] is [code]true[/code], this method only finds nodes whose owner is this node. This is especially important for scenes instantiated through a script, because those scenes don't have an owner.
--   				[b]Note:[/b] As this method walks through all the descendants of the node, it is the slowest way to get a reference to another node. Whenever possible, consider using [method get_node] instead. To avoid using [method find_node] too often, consider caching the node reference into a variable.
find_node ::
            (Node :< cls, Object :< cls) =>
            cls -> GodotString -> Bool -> Bool -> IO Node
find_node cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_find_node (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_find_parent #-}

-- | Finds the first parent of the current node whose name matches [code]mask[/code] as in [method String.match] (i.e. case-sensitive, but [code]"*"[/code] matches zero or more characters and [code]"?"[/code] matches any single character except [code]"."[/code]).
--   				[b]Note:[/b] It does not match against the full path, just against individual node names.
--   				[b]Note:[/b] As this method walks upwards in the scene tree, it can be slow in large, deeply nested scene trees. Whenever possible, consider using [method get_node] instead. To avoid using [method find_parent] too often, consider caching the node reference into a variable.
bindNode_find_parent :: MethodBind
bindNode_find_parent
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "find_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Finds the first parent of the current node whose name matches [code]mask[/code] as in [method String.match] (i.e. case-sensitive, but [code]"*"[/code] matches zero or more characters and [code]"?"[/code] matches any single character except [code]"."[/code]).
--   				[b]Note:[/b] It does not match against the full path, just against individual node names.
--   				[b]Note:[/b] As this method walks upwards in the scene tree, it can be slow in large, deeply nested scene trees. Whenever possible, consider using [method get_node] instead. To avoid using [method find_parent] too often, consider caching the node reference into a variable.
find_parent ::
              (Node :< cls, Object :< cls) => cls -> GodotString -> IO Node
find_parent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_find_parent (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_child #-}

-- | Returns a child node by its index (see [method get_child_count]). This method is often used for iterating all children of a node.
--   				To access a child node via its name, use [method get_node].
bindNode_get_child :: MethodBind
bindNode_get_child
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_child" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a child node by its index (see [method get_child_count]). This method is often used for iterating all children of a node.
--   				To access a child node via its name, use [method get_node].
get_child :: (Node :< cls, Object :< cls) => cls -> Int -> IO Node
get_child cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_child (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_child_count #-}

-- | Returns the number of child nodes.
bindNode_get_child_count :: MethodBind
bindNode_get_child_count
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_child_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of child nodes.
get_child_count :: (Node :< cls, Object :< cls) => cls -> IO Int
get_child_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_child_count (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_children #-}

-- | Returns an array of references to node's children.
bindNode_get_children :: MethodBind
bindNode_get_children
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_children" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of references to node's children.
get_children :: (Node :< cls, Object :< cls) => cls -> IO Array
get_children cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_children (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_custom_multiplayer #-}

-- | The override to the default [MultiplayerAPI]. Set to [code]null[/code] to use the default [SceneTree] one.
bindNode_get_custom_multiplayer :: MethodBind
bindNode_get_custom_multiplayer
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_custom_multiplayer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The override to the default [MultiplayerAPI]. Set to [code]null[/code] to use the default [SceneTree] one.
get_custom_multiplayer ::
                         (Node :< cls, Object :< cls) => cls -> IO MultiplayerAPI
get_custom_multiplayer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_custom_multiplayer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_filename #-}

-- | When a scene is instanced from a file, its topmost node contains the filename from which it was loaded.
bindNode_get_filename :: MethodBind
bindNode_get_filename
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_filename" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When a scene is instanced from a file, its topmost node contains the filename from which it was loaded.
get_filename ::
               (Node :< cls, Object :< cls) => cls -> IO GodotString
get_filename cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_filename (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_groups #-}

-- | Returns an array listing the groups that the node is a member of.
bindNode_get_groups :: MethodBind
bindNode_get_groups
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_groups" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array listing the groups that the node is a member of.
get_groups :: (Node :< cls, Object :< cls) => cls -> IO Array
get_groups cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_groups (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_index #-}

-- | Returns the node's index, i.e. its position among the siblings of its parent.
bindNode_get_index :: MethodBind
bindNode_get_index
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the node's index, i.e. its position among the siblings of its parent.
get_index :: (Node :< cls, Object :< cls) => cls -> IO Int
get_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_index (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_multiplayer #-}

-- | The [MultiplayerAPI] instance associated with this node. Either the [member custom_multiplayer], or the default SceneTree one (if inside tree).
bindNode_get_multiplayer :: MethodBind
bindNode_get_multiplayer
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_multiplayer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [MultiplayerAPI] instance associated with this node. Either the [member custom_multiplayer], or the default SceneTree one (if inside tree).
get_multiplayer ::
                  (Node :< cls, Object :< cls) => cls -> IO MultiplayerAPI
get_multiplayer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_multiplayer (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_name #-}

-- | The name of the node. This name is unique among the siblings (other child nodes from the same parent). When set to an existing name, the node will be automatically renamed.
bindNode_get_name :: MethodBind
bindNode_get_name
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the node. This name is unique among the siblings (other child nodes from the same parent). When set to an existing name, the node will be automatically renamed.
get_name :: (Node :< cls, Object :< cls) => cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_name (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_network_master #-}

-- | Returns the peer ID of the network master for this node. See [method set_network_master].
bindNode_get_network_master :: MethodBind
bindNode_get_network_master
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_network_master" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the peer ID of the network master for this node. See [method set_network_master].
get_network_master :: (Node :< cls, Object :< cls) => cls -> IO Int
get_network_master cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_network_master (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_node #-}

-- | Fetches a node. The [NodePath] can be either a relative path (from the current node) or an absolute path (in the scene tree) to a node. If the path does not exist, a [code]null instance[/code] is returned and an error is logged. Attempts to access methods on the return value will result in an "Attempt to call <method> on a null instance." error.
--   				[b]Note:[/b] Fetching absolute paths only works when the node is inside the scene tree (see [method is_inside_tree]).
--   				[b]Example:[/b] Assume your current node is Character and the following tree:
--   				[codeblock]
--   				/root
--   				/root/Character
--   				/root/Character/Sword
--   				/root/Character/Backpack/Dagger
--   				/root/MyGame
--   				/root/Swamp/Alligator
--   				/root/Swamp/Mosquito
--   				/root/Swamp/Goblin
--   				[/codeblock]
--   				Possible paths are:
--   				[codeblock]
--   				get_node("Sword")
--   				get_node("Backpack/Dagger")
--   				get_node("../Swamp/Alligator")
--   				get_node("/root/MyGame")
--   				[/codeblock]
bindNode_get_node :: MethodBind
bindNode_get_node
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Fetches a node. The [NodePath] can be either a relative path (from the current node) or an absolute path (in the scene tree) to a node. If the path does not exist, a [code]null instance[/code] is returned and an error is logged. Attempts to access methods on the return value will result in an "Attempt to call <method> on a null instance." error.
--   				[b]Note:[/b] Fetching absolute paths only works when the node is inside the scene tree (see [method is_inside_tree]).
--   				[b]Example:[/b] Assume your current node is Character and the following tree:
--   				[codeblock]
--   				/root
--   				/root/Character
--   				/root/Character/Sword
--   				/root/Character/Backpack/Dagger
--   				/root/MyGame
--   				/root/Swamp/Alligator
--   				/root/Swamp/Mosquito
--   				/root/Swamp/Goblin
--   				[/codeblock]
--   				Possible paths are:
--   				[codeblock]
--   				get_node("Sword")
--   				get_node("Backpack/Dagger")
--   				get_node("../Swamp/Alligator")
--   				get_node("/root/MyGame")
--   				[/codeblock]
get_node ::
           (Node :< cls, Object :< cls) => cls -> NodePath -> IO Node
get_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_node (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_node_and_resource #-}

-- | Fetches a node and one of its resources as specified by the [NodePath]'s subname (e.g. [code]Area2D/CollisionShape2D:shape[/code]). If several nested resources are specified in the [NodePath], the last one will be fetched.
--   				The return value is an array of size 3: the first index points to the [Node] (or [code]null[/code] if not found), the second index points to the [Resource] (or [code]null[/code] if not found), and the third index is the remaining [NodePath], if any.
--   				For example, assuming that [code]Area2D/CollisionShape2D[/code] is a valid node and that its [code]shape[/code] property has been assigned a [RectangleShape2D] resource, one could have this kind of output:
--   				[codeblock]
--   				print(get_node_and_resource("Area2D/CollisionShape2D")) # [[CollisionShape2D:1161], Null, ]
--   				print(get_node_and_resource("Area2D/CollisionShape2D:shape")) # [[CollisionShape2D:1161], [RectangleShape2D:1156], ]
--   				print(get_node_and_resource("Area2D/CollisionShape2D:shape:extents")) # [[CollisionShape2D:1161], [RectangleShape2D:1156], :extents]
--   				[/codeblock]
bindNode_get_node_and_resource :: MethodBind
bindNode_get_node_and_resource
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_node_and_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Fetches a node and one of its resources as specified by the [NodePath]'s subname (e.g. [code]Area2D/CollisionShape2D:shape[/code]). If several nested resources are specified in the [NodePath], the last one will be fetched.
--   				The return value is an array of size 3: the first index points to the [Node] (or [code]null[/code] if not found), the second index points to the [Resource] (or [code]null[/code] if not found), and the third index is the remaining [NodePath], if any.
--   				For example, assuming that [code]Area2D/CollisionShape2D[/code] is a valid node and that its [code]shape[/code] property has been assigned a [RectangleShape2D] resource, one could have this kind of output:
--   				[codeblock]
--   				print(get_node_and_resource("Area2D/CollisionShape2D")) # [[CollisionShape2D:1161], Null, ]
--   				print(get_node_and_resource("Area2D/CollisionShape2D:shape")) # [[CollisionShape2D:1161], [RectangleShape2D:1156], ]
--   				print(get_node_and_resource("Area2D/CollisionShape2D:shape:extents")) # [[CollisionShape2D:1161], [RectangleShape2D:1156], :extents]
--   				[/codeblock]
get_node_and_resource ::
                        (Node :< cls, Object :< cls) => cls -> NodePath -> IO Array
get_node_and_resource cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_node_and_resource (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_node_or_null #-}

-- | Similar to [method get_node], but does not log an error if [code]path[/code] does not point to a valid [Node].
bindNode_get_node_or_null :: MethodBind
bindNode_get_node_or_null
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_node_or_null" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Similar to [method get_node], but does not log an error if [code]path[/code] does not point to a valid [Node].
get_node_or_null ::
                   (Node :< cls, Object :< cls) => cls -> NodePath -> IO Node
get_node_or_null cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_node_or_null (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_owner #-}

-- | The node owner. A node can have any other node as owner (as long as it is a valid parent, grandparent, etc. ascending in the tree). When saving a node (using [PackedScene]), all the nodes it owns will be saved with it. This allows for the creation of complex [SceneTree]s, with instancing and subinstancing.
bindNode_get_owner :: MethodBind
bindNode_get_owner
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node owner. A node can have any other node as owner (as long as it is a valid parent, grandparent, etc. ascending in the tree). When saving a node (using [PackedScene]), all the nodes it owns will be saved with it. This allows for the creation of complex [SceneTree]s, with instancing and subinstancing.
get_owner :: (Node :< cls, Object :< cls) => cls -> IO Node
get_owner cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_owner (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_parent #-}

-- | Returns the parent node of the current node, or a [code]null instance[/code] if the node lacks a parent.
bindNode_get_parent :: MethodBind
bindNode_get_parent
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent node of the current node, or a [code]null instance[/code] if the node lacks a parent.
get_parent :: (Node :< cls, Object :< cls) => cls -> IO Node
get_parent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_parent (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_path #-}

-- | Returns the absolute path of the current node. This only works if the current node is inside the scene tree (see [method is_inside_tree]).
bindNode_get_path :: MethodBind
bindNode_get_path
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the absolute path of the current node. This only works if the current node is inside the scene tree (see [method is_inside_tree]).
get_path :: (Node :< cls, Object :< cls) => cls -> IO NodePath
get_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_path (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_path_to #-}

-- | Returns the relative [NodePath] from this node to the specified [code]node[/code]. Both nodes must be in the same scene or the function will fail.
bindNode_get_path_to :: MethodBind
bindNode_get_path_to
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_path_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the relative [NodePath] from this node to the specified [code]node[/code]. Both nodes must be in the same scene or the function will fail.
get_path_to ::
              (Node :< cls, Object :< cls) => cls -> Node -> IO NodePath
get_path_to cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_path_to (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_pause_mode #-}

-- | Pause mode. How the node will behave if the [SceneTree] is paused.
bindNode_get_pause_mode :: MethodBind
bindNode_get_pause_mode
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_pause_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pause mode. How the node will behave if the [SceneTree] is paused.
get_pause_mode :: (Node :< cls, Object :< cls) => cls -> IO Int
get_pause_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_pause_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_physics_process_delta_time #-}

-- | Returns the time elapsed since the last physics-bound frame (see [method _physics_process]). This is always a constant value in physics processing unless the frames per second is changed via [member Engine.iterations_per_second].
bindNode_get_physics_process_delta_time :: MethodBind
bindNode_get_physics_process_delta_time
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_physics_process_delta_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the time elapsed since the last physics-bound frame (see [method _physics_process]). This is always a constant value in physics processing unless the frames per second is changed via [member Engine.iterations_per_second].
get_physics_process_delta_time ::
                                 (Node :< cls, Object :< cls) => cls -> IO Float
get_physics_process_delta_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_physics_process_delta_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_position_in_parent #-}

-- | Returns the node's order in the scene tree branch. For example, if called on the first child node the position is [code]0[/code].
bindNode_get_position_in_parent :: MethodBind
bindNode_get_position_in_parent
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_position_in_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the node's order in the scene tree branch. For example, if called on the first child node the position is [code]0[/code].
get_position_in_parent ::
                         (Node :< cls, Object :< cls) => cls -> IO Int
get_position_in_parent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_position_in_parent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_process_delta_time #-}

-- | Returns the time elapsed (in seconds) since the last process callback. This value may vary from frame to frame.
bindNode_get_process_delta_time :: MethodBind
bindNode_get_process_delta_time
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_process_delta_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the time elapsed (in seconds) since the last process callback. This value may vary from frame to frame.
get_process_delta_time ::
                         (Node :< cls, Object :< cls) => cls -> IO Float
get_process_delta_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_process_delta_time (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_process_priority #-}

-- | The node's priority in the execution order of the enabled processing callbacks (i.e. [constant NOTIFICATION_PROCESS], [constant NOTIFICATION_PHYSICS_PROCESS] and their internal counterparts). Nodes whose process priority value is [i]lower[/i] will have their processing callbacks executed first.
bindNode_get_process_priority :: MethodBind
bindNode_get_process_priority
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_process_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's priority in the execution order of the enabled processing callbacks (i.e. [constant NOTIFICATION_PROCESS], [constant NOTIFICATION_PHYSICS_PROCESS] and their internal counterparts). Nodes whose process priority value is [i]lower[/i] will have their processing callbacks executed first.
get_process_priority ::
                       (Node :< cls, Object :< cls) => cls -> IO Int
get_process_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_process_priority (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_scene_instance_load_placeholder #-}

-- | Returns [code]true[/code] if this is an instance load placeholder. See [InstancePlaceholder].
bindNode_get_scene_instance_load_placeholder :: MethodBind
bindNode_get_scene_instance_load_placeholder
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_scene_instance_load_placeholder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this is an instance load placeholder. See [InstancePlaceholder].
get_scene_instance_load_placeholder ::
                                      (Node :< cls, Object :< cls) => cls -> IO Bool
get_scene_instance_load_placeholder cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_scene_instance_load_placeholder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_tree #-}

-- | Returns the [SceneTree] that contains this node.
bindNode_get_tree :: MethodBind
bindNode_get_tree
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [SceneTree] that contains this node.
get_tree :: (Node :< cls, Object :< cls) => cls -> IO SceneTree
get_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_tree (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_get_viewport #-}

-- | Returns the node's [Viewport].
bindNode_get_viewport :: MethodBind
bindNode_get_viewport
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "get_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the node's [Viewport].
get_viewport :: (Node :< cls, Object :< cls) => cls -> IO Viewport
get_viewport cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_get_viewport (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_has_node #-}

-- | Returns [code]true[/code] if the node that the [NodePath] points to exists.
bindNode_has_node :: MethodBind
bindNode_has_node
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "has_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the node that the [NodePath] points to exists.
has_node ::
           (Node :< cls, Object :< cls) => cls -> NodePath -> IO Bool
has_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_has_node (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_has_node_and_resource #-}

-- | Returns [code]true[/code] if the [NodePath] points to a valid node and its subname points to a valid resource, e.g. [code]Area2D/CollisionShape2D:shape[/code]. Properties with a non-[Resource] type (e.g. nodes or primitive math types) are not considered resources.
bindNode_has_node_and_resource :: MethodBind
bindNode_has_node_and_resource
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "has_node_and_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the [NodePath] points to a valid node and its subname points to a valid resource, e.g. [code]Area2D/CollisionShape2D:shape[/code]. Properties with a non-[Resource] type (e.g. nodes or primitive math types) are not considered resources.
has_node_and_resource ::
                        (Node :< cls, Object :< cls) => cls -> NodePath -> IO Bool
has_node_and_resource cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_has_node_and_resource (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_a_parent_of #-}

-- | Returns [code]true[/code] if the given node is a direct or indirect child of the current node.
bindNode_is_a_parent_of :: MethodBind
bindNode_is_a_parent_of
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_a_parent_of" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given node is a direct or indirect child of the current node.
is_a_parent_of ::
                 (Node :< cls, Object :< cls) => cls -> Node -> IO Bool
is_a_parent_of cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_a_parent_of (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_displayed_folded #-}

-- | Returns [code]true[/code] if the node is folded (collapsed) in the Scene dock.
bindNode_is_displayed_folded :: MethodBind
bindNode_is_displayed_folded
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_displayed_folded" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the node is folded (collapsed) in the Scene dock.
is_displayed_folded ::
                      (Node :< cls, Object :< cls) => cls -> IO Bool
is_displayed_folded cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_displayed_folded (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_greater_than #-}

-- | Returns [code]true[/code] if the given node occurs later in the scene hierarchy than the current node.
bindNode_is_greater_than :: MethodBind
bindNode_is_greater_than
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_greater_than" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given node occurs later in the scene hierarchy than the current node.
is_greater_than ::
                  (Node :< cls, Object :< cls) => cls -> Node -> IO Bool
is_greater_than cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_greater_than (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_in_group #-}

-- | Returns [code]true[/code] if this node is in the specified group. See notes in the description, and the group methods in [SceneTree].
bindNode_is_in_group :: MethodBind
bindNode_is_in_group
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_in_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this node is in the specified group. See notes in the description, and the group methods in [SceneTree].
is_in_group ::
              (Node :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_in_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_in_group (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_inside_tree #-}

-- | Returns [code]true[/code] if this node is currently inside a [SceneTree].
bindNode_is_inside_tree :: MethodBind
bindNode_is_inside_tree
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_inside_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this node is currently inside a [SceneTree].
is_inside_tree :: (Node :< cls, Object :< cls) => cls -> IO Bool
is_inside_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_inside_tree (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_network_master #-}

-- | Returns [code]true[/code] if the local system is the master of this node.
bindNode_is_network_master :: MethodBind
bindNode_is_network_master
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_network_master" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the local system is the master of this node.
is_network_master :: (Node :< cls, Object :< cls) => cls -> IO Bool
is_network_master cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_network_master (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_physics_processing #-}

-- | Returns [code]true[/code] if physics processing is enabled (see [method set_physics_process]).
bindNode_is_physics_processing :: MethodBind
bindNode_is_physics_processing
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_physics_processing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if physics processing is enabled (see [method set_physics_process]).
is_physics_processing ::
                        (Node :< cls, Object :< cls) => cls -> IO Bool
is_physics_processing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_physics_processing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_physics_processing_internal #-}

-- | Returns [code]true[/code] if internal physics processing is enabled (see [method set_physics_process_internal]).
bindNode_is_physics_processing_internal :: MethodBind
bindNode_is_physics_processing_internal
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_physics_processing_internal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if internal physics processing is enabled (see [method set_physics_process_internal]).
is_physics_processing_internal ::
                                 (Node :< cls, Object :< cls) => cls -> IO Bool
is_physics_processing_internal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_physics_processing_internal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_processing #-}

-- | Returns [code]true[/code] if processing is enabled (see [method set_process]).
bindNode_is_processing :: MethodBind
bindNode_is_processing
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_processing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if processing is enabled (see [method set_process]).
is_processing :: (Node :< cls, Object :< cls) => cls -> IO Bool
is_processing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_processing (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_processing_input #-}

-- | Returns [code]true[/code] if the node is processing input (see [method set_process_input]).
bindNode_is_processing_input :: MethodBind
bindNode_is_processing_input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_processing_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the node is processing input (see [method set_process_input]).
is_processing_input ::
                      (Node :< cls, Object :< cls) => cls -> IO Bool
is_processing_input cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_processing_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_processing_internal #-}

-- | Returns [code]true[/code] if internal processing is enabled (see [method set_process_internal]).
bindNode_is_processing_internal :: MethodBind
bindNode_is_processing_internal
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_processing_internal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if internal processing is enabled (see [method set_process_internal]).
is_processing_internal ::
                         (Node :< cls, Object :< cls) => cls -> IO Bool
is_processing_internal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_processing_internal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_processing_unhandled_input #-}

-- | Returns [code]true[/code] if the node is processing unhandled input (see [method set_process_unhandled_input]).
bindNode_is_processing_unhandled_input :: MethodBind
bindNode_is_processing_unhandled_input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_processing_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the node is processing unhandled input (see [method set_process_unhandled_input]).
is_processing_unhandled_input ::
                                (Node :< cls, Object :< cls) => cls -> IO Bool
is_processing_unhandled_input cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_processing_unhandled_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_is_processing_unhandled_key_input #-}

-- | Returns [code]true[/code] if the node is processing unhandled key input (see [method set_process_unhandled_key_input]).
bindNode_is_processing_unhandled_key_input :: MethodBind
bindNode_is_processing_unhandled_key_input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "is_processing_unhandled_key_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the node is processing unhandled key input (see [method set_process_unhandled_key_input]).
is_processing_unhandled_key_input ::
                                    (Node :< cls, Object :< cls) => cls -> IO Bool
is_processing_unhandled_key_input cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_is_processing_unhandled_key_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_move_child #-}

-- | Moves a child node to a different position (order) among the other children. Since calls, signals, etc are performed by tree order, changing the order of children nodes may be useful.
bindNode_move_child :: MethodBind
bindNode_move_child
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "move_child" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves a child node to a different position (order) among the other children. Since calls, signals, etc are performed by tree order, changing the order of children nodes may be useful.
move_child ::
             (Node :< cls, Object :< cls) => cls -> Node -> Int -> IO ()
move_child cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_move_child (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_print_stray_nodes #-}

-- | Prints all stray nodes (nodes outside the [SceneTree]). Used for debugging. Works only in debug builds.
bindNode_print_stray_nodes :: MethodBind
bindNode_print_stray_nodes
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "print_stray_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Prints all stray nodes (nodes outside the [SceneTree]). Used for debugging. Works only in debug builds.
print_stray_nodes :: (Node :< cls, Object :< cls) => cls -> IO ()
print_stray_nodes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_print_stray_nodes (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_print_tree #-}

-- | Prints the tree to stdout. Used mainly for debugging purposes. This version displays the path relative to the current node, and is good for copy/pasting into the [method get_node] function.
--   				[b]Example output:[/b]
--   				[codeblock]
--   				TheGame
--   				TheGame/Menu
--   				TheGame/Menu/Label
--   				TheGame/Menu/Camera2D
--   				TheGame/SplashScreen
--   				TheGame/SplashScreen/Camera2D
--   				[/codeblock]
bindNode_print_tree :: MethodBind
bindNode_print_tree
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "print_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Prints the tree to stdout. Used mainly for debugging purposes. This version displays the path relative to the current node, and is good for copy/pasting into the [method get_node] function.
--   				[b]Example output:[/b]
--   				[codeblock]
--   				TheGame
--   				TheGame/Menu
--   				TheGame/Menu/Label
--   				TheGame/Menu/Camera2D
--   				TheGame/SplashScreen
--   				TheGame/SplashScreen/Camera2D
--   				[/codeblock]
print_tree :: (Node :< cls, Object :< cls) => cls -> IO ()
print_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_print_tree (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_print_tree_pretty #-}

-- | Similar to [method print_tree], this prints the tree to stdout. This version displays a more graphical representation similar to what is displayed in the scene inspector. It is useful for inspecting larger trees.
--   				[b]Example output:[/b]
--   				[codeblock]
--   				 ┖╴TheGame
--   				    ┠╴Menu
--   				    ┃  ┠╴Label
--   				    ┃  ┖╴Camera2D
--   				    ┖╴SplashScreen
--   				       ┖╴Camera2D
--   				[/codeblock]
bindNode_print_tree_pretty :: MethodBind
bindNode_print_tree_pretty
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "print_tree_pretty" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Similar to [method print_tree], this prints the tree to stdout. This version displays a more graphical representation similar to what is displayed in the scene inspector. It is useful for inspecting larger trees.
--   				[b]Example output:[/b]
--   				[codeblock]
--   				 ┖╴TheGame
--   				    ┠╴Menu
--   				    ┃  ┠╴Label
--   				    ┃  ┖╴Camera2D
--   				    ┖╴SplashScreen
--   				       ┖╴Camera2D
--   				[/codeblock]
print_tree_pretty :: (Node :< cls, Object :< cls) => cls -> IO ()
print_tree_pretty cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_print_tree_pretty (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_propagate_call #-}

-- | Calls the given method (if present) with the arguments given in [code]args[/code] on this node and recursively on all its children. If the [code]parent_first[/code] argument is [code]true[/code], the method will be called on the current node first, then on all its children. If [code]parent_first[/code] is [code]false[/code], the children will be called first.
bindNode_propagate_call :: MethodBind
bindNode_propagate_call
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "propagate_call" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the given method (if present) with the arguments given in [code]args[/code] on this node and recursively on all its children. If the [code]parent_first[/code] argument is [code]true[/code], the method will be called on the current node first, then on all its children. If [code]parent_first[/code] is [code]false[/code], the children will be called first.
propagate_call ::
                 (Node :< cls, Object :< cls) =>
                 cls -> GodotString -> Array -> Bool -> IO ()
propagate_call cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_propagate_call (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_propagate_notification #-}

-- | Notifies the current node and all its children recursively by calling [method Object.notification] on all of them.
bindNode_propagate_notification :: MethodBind
bindNode_propagate_notification
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "propagate_notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Notifies the current node and all its children recursively by calling [method Object.notification] on all of them.
propagate_notification ::
                         (Node :< cls, Object :< cls) => cls -> Int -> IO ()
propagate_notification cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_propagate_notification (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_queue_free #-}

-- | Queues a node for deletion at the end of the current frame. When deleted, all of its child nodes will be deleted as well. This method ensures it's safe to delete the node, contrary to [method Object.free]. Use [method Object.is_queued_for_deletion] to check whether a node will be deleted at the end of the frame.
bindNode_queue_free :: MethodBind
bindNode_queue_free
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "queue_free" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queues a node for deletion at the end of the current frame. When deleted, all of its child nodes will be deleted as well. This method ensures it's safe to delete the node, contrary to [method Object.free]. Use [method Object.is_queued_for_deletion] to check whether a node will be deleted at the end of the frame.
queue_free :: (Node :< cls, Object :< cls) => cls -> IO ()
queue_free cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_queue_free (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_raise #-}

-- | Moves this node to the bottom of parent node's children hierarchy. This is often useful in GUIs ([Control] nodes), because their order of drawing depends on their order in the tree, i.e. the further they are on the node list, the higher they are drawn. After using [code]raise[/code], a Control will be drawn on top of their siblings.
bindNode_raise :: MethodBind
bindNode_raise
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "raise" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves this node to the bottom of parent node's children hierarchy. This is often useful in GUIs ([Control] nodes), because their order of drawing depends on their order in the tree, i.e. the further they are on the node list, the higher they are drawn. After using [code]raise[/code], a Control will be drawn on top of their siblings.
raise :: (Node :< cls, Object :< cls) => cls -> IO ()
raise cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_raise (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_remove_and_skip #-}

-- | Removes a node and sets all its children as children of the parent node (if it exists). All event subscriptions that pass by the removed node will be unsubscribed.
bindNode_remove_and_skip :: MethodBind
bindNode_remove_and_skip
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "remove_and_skip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a node and sets all its children as children of the parent node (if it exists). All event subscriptions that pass by the removed node will be unsubscribed.
remove_and_skip :: (Node :< cls, Object :< cls) => cls -> IO ()
remove_and_skip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_remove_and_skip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_remove_child #-}

-- | Removes a child node. The node is NOT deleted and must be deleted manually.
bindNode_remove_child :: MethodBind
bindNode_remove_child
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "remove_child" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a child node. The node is NOT deleted and must be deleted manually.
remove_child ::
               (Node :< cls, Object :< cls) => cls -> Node -> IO ()
remove_child cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_remove_child (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_remove_from_group #-}

-- | Removes a node from a group. See notes in the description, and the group methods in [SceneTree].
bindNode_remove_from_group :: MethodBind
bindNode_remove_from_group
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "remove_from_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a node from a group. See notes in the description, and the group methods in [SceneTree].
remove_from_group ::
                    (Node :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_from_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_remove_from_group (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_replace_by #-}

-- | Replaces a node in a scene by the given one. Subscriptions that pass through this node will be lost.
bindNode_replace_by :: MethodBind
bindNode_replace_by
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "replace_by" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Replaces a node in a scene by the given one. Subscriptions that pass through this node will be lost.
replace_by ::
             (Node :< cls, Object :< cls) => cls -> Node -> Bool -> IO ()
replace_by cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_replace_by (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_request_ready #-}

-- | Requests that [code]_ready[/code] be called again. Note that the method won't be called immediately, but is scheduled for when the node is added to the scene tree again (see [method _ready]). [code]_ready[/code] is called only for the node which requested it, which means that you need to request ready for each child if you want them to call [code]_ready[/code] too (in which case, [code]_ready[/code] will be called in the same order as it would normally).
bindNode_request_ready :: MethodBind
bindNode_request_ready
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "request_ready" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Requests that [code]_ready[/code] be called again. Note that the method won't be called immediately, but is scheduled for when the node is added to the scene tree again (see [method _ready]). [code]_ready[/code] is called only for the node which requested it, which means that you need to request ready for each child if you want them to call [code]_ready[/code] too (in which case, [code]_ready[/code] will be called in the same order as it would normally).
request_ready :: (Node :< cls, Object :< cls) => cls -> IO ()
request_ready cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_request_ready (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rpc #-}

-- | Sends a remote procedure call request for the given [code]method[/code] to peers on the network (and locally), optionally sending all additional arguments as arguments to the method called by the RPC. The call request will only be received by nodes with the same [NodePath], including the exact same node name. Behaviour depends on the RPC configuration for the given method, see [method rpc_config]. Methods are not exposed to RPCs by default. See also [method rset] and [method rset_config] for properties. Returns an empty [Variant].
--   				[b]Note:[/b] You can only safely use RPCs on clients after you received the [code]connected_to_server[/code] signal from the [SceneTree]. You also need to keep track of the connection state, either by the [SceneTree] signals like [code]server_disconnected[/code] or by checking [code]SceneTree.network_peer.get_connection_status() == CONNECTION_CONNECTED[/code].
bindNode_rpc :: MethodBind
bindNode_rpc
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a remote procedure call request for the given [code]method[/code] to peers on the network (and locally), optionally sending all additional arguments as arguments to the method called by the RPC. The call request will only be received by nodes with the same [NodePath], including the exact same node name. Behaviour depends on the RPC configuration for the given method, see [method rpc_config]. Methods are not exposed to RPCs by default. See also [method rset] and [method rset_config] for properties. Returns an empty [Variant].
--   				[b]Note:[/b] You can only safely use RPCs on clients after you received the [code]connected_to_server[/code] signal from the [SceneTree]. You also need to keep track of the connection state, either by the [SceneTree] signals like [code]server_disconnected[/code] or by checking [code]SceneTree.network_peer.get_connection_status() == CONNECTION_CONNECTED[/code].
rpc ::
      (Node :< cls, Object :< cls) =>
      cls -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
rpc cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rpc (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rpc_config #-}

-- | Changes the RPC mode for the given [code]method[/code] to the given [code]mode[/code]. See [enum MultiplayerAPI.RPCMode]. An alternative is annotating methods and properties with the corresponding keywords ([code]remote[/code], [code]master[/code], [code]puppet[/code], [code]remotesync[/code], [code]mastersync[/code], [code]puppetsync[/code]). By default, methods are not exposed to networking (and RPCs). See also [method rset] and [method rset_config] for properties.
bindNode_rpc_config :: MethodBind
bindNode_rpc_config
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc_config" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the RPC mode for the given [code]method[/code] to the given [code]mode[/code]. See [enum MultiplayerAPI.RPCMode]. An alternative is annotating methods and properties with the corresponding keywords ([code]remote[/code], [code]master[/code], [code]puppet[/code], [code]remotesync[/code], [code]mastersync[/code], [code]puppetsync[/code]). By default, methods are not exposed to networking (and RPCs). See also [method rset] and [method rset_config] for properties.
rpc_config ::
             (Node :< cls, Object :< cls) => cls -> GodotString -> Int -> IO ()
rpc_config cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rpc_config (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rpc_id #-}

-- | Sends a [method rpc] to a specific peer identified by [code]peer_id[/code] (see [method NetworkedMultiplayerPeer.set_target_peer]). Returns an empty [Variant].
bindNode_rpc_id :: MethodBind
bindNode_rpc_id
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a [method rpc] to a specific peer identified by [code]peer_id[/code] (see [method NetworkedMultiplayerPeer.set_target_peer]). Returns an empty [Variant].
rpc_id ::
         (Node :< cls, Object :< cls) =>
         cls -> Int -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
rpc_id cls arg1 arg2 varargs
  = withVariantArray ([toVariant arg1, toVariant arg2] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rpc_id (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rpc_unreliable #-}

-- | Sends a [method rpc] using an unreliable protocol. Returns an empty [Variant].
bindNode_rpc_unreliable :: MethodBind
bindNode_rpc_unreliable
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc_unreliable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a [method rpc] using an unreliable protocol. Returns an empty [Variant].
rpc_unreliable ::
                 (Node :< cls, Object :< cls) =>
                 cls -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
rpc_unreliable cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rpc_unreliable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rpc_unreliable_id #-}

-- | Sends a [method rpc] to a specific peer identified by [code]peer_id[/code] using an unreliable protocol (see [method NetworkedMultiplayerPeer.set_target_peer]). Returns an empty [Variant].
bindNode_rpc_unreliable_id :: MethodBind
bindNode_rpc_unreliable_id
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rpc_unreliable_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a [method rpc] to a specific peer identified by [code]peer_id[/code] using an unreliable protocol (see [method NetworkedMultiplayerPeer.set_target_peer]). Returns an empty [Variant].
rpc_unreliable_id ::
                    (Node :< cls, Object :< cls) =>
                    cls -> Int -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
rpc_unreliable_id cls arg1 arg2 varargs
  = withVariantArray ([toVariant arg1, toVariant arg2] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rpc_unreliable_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rset #-}

-- | Remotely changes a property's value on other peers (and locally). Behaviour depends on the RPC configuration for the given property, see [method rset_config]. See also [method rpc] for RPCs for methods, most information applies to this method as well.
bindNode_rset :: MethodBind
bindNode_rset
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remotely changes a property's value on other peers (and locally). Behaviour depends on the RPC configuration for the given property, see [method rset_config]. See also [method rpc] for RPCs for methods, most information applies to this method as well.
rset ::
       (Node :< cls, Object :< cls) =>
       cls -> GodotString -> GodotVariant -> IO ()
rset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rset (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rset_config #-}

-- | Changes the RPC mode for the given [code]property[/code] to the given [code]mode[/code]. See [enum MultiplayerAPI.RPCMode]. An alternative is annotating methods and properties with the corresponding keywords ([code]remote[/code], [code]master[/code], [code]puppet[/code], [code]remotesync[/code], [code]mastersync[/code], [code]puppetsync[/code]). By default, properties are not exposed to networking (and RPCs). See also [method rpc] and [method rpc_config] for methods.
bindNode_rset_config :: MethodBind
bindNode_rset_config
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rset_config" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the RPC mode for the given [code]property[/code] to the given [code]mode[/code]. See [enum MultiplayerAPI.RPCMode]. An alternative is annotating methods and properties with the corresponding keywords ([code]remote[/code], [code]master[/code], [code]puppet[/code], [code]remotesync[/code], [code]mastersync[/code], [code]puppetsync[/code]). By default, properties are not exposed to networking (and RPCs). See also [method rpc] and [method rpc_config] for methods.
rset_config ::
              (Node :< cls, Object :< cls) => cls -> GodotString -> Int -> IO ()
rset_config cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rset_config (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rset_id #-}

-- | Remotely changes the property's value on a specific peer identified by [code]peer_id[/code] (see [method NetworkedMultiplayerPeer.set_target_peer]).
bindNode_rset_id :: MethodBind
bindNode_rset_id
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rset_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remotely changes the property's value on a specific peer identified by [code]peer_id[/code] (see [method NetworkedMultiplayerPeer.set_target_peer]).
rset_id ::
          (Node :< cls, Object :< cls) =>
          cls -> Int -> GodotString -> GodotVariant -> IO ()
rset_id cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rset_id (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rset_unreliable #-}

-- | Remotely changes the property's value on other peers (and locally) using an unreliable protocol.
bindNode_rset_unreliable :: MethodBind
bindNode_rset_unreliable
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rset_unreliable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remotely changes the property's value on other peers (and locally) using an unreliable protocol.
rset_unreliable ::
                  (Node :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotVariant -> IO ()
rset_unreliable cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rset_unreliable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_rset_unreliable_id #-}

-- | Remotely changes property's value on a specific peer identified by [code]peer_id[/code] using an unreliable protocol (see [method NetworkedMultiplayerPeer.set_target_peer]).
bindNode_rset_unreliable_id :: MethodBind
bindNode_rset_unreliable_id
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "rset_unreliable_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remotely changes property's value on a specific peer identified by [code]peer_id[/code] using an unreliable protocol (see [method NetworkedMultiplayerPeer.set_target_peer]).
rset_unreliable_id ::
                     (Node :< cls, Object :< cls) =>
                     cls -> Int -> GodotString -> GodotVariant -> IO ()
rset_unreliable_id cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_rset_unreliable_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_custom_multiplayer #-}

-- | The override to the default [MultiplayerAPI]. Set to [code]null[/code] to use the default [SceneTree] one.
bindNode_set_custom_multiplayer :: MethodBind
bindNode_set_custom_multiplayer
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_custom_multiplayer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The override to the default [MultiplayerAPI]. Set to [code]null[/code] to use the default [SceneTree] one.
set_custom_multiplayer ::
                         (Node :< cls, Object :< cls) => cls -> MultiplayerAPI -> IO ()
set_custom_multiplayer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_custom_multiplayer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_display_folded #-}

-- | Sets the folded state of the node in the Scene dock.
bindNode_set_display_folded :: MethodBind
bindNode_set_display_folded
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_display_folded" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the folded state of the node in the Scene dock.
set_display_folded ::
                     (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_display_folded cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_display_folded (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_filename #-}

-- | When a scene is instanced from a file, its topmost node contains the filename from which it was loaded.
bindNode_set_filename :: MethodBind
bindNode_set_filename
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_filename" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When a scene is instanced from a file, its topmost node contains the filename from which it was loaded.
set_filename ::
               (Node :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_filename cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_filename (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_name #-}

-- | The name of the node. This name is unique among the siblings (other child nodes from the same parent). When set to an existing name, the node will be automatically renamed.
bindNode_set_name :: MethodBind
bindNode_set_name
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the node. This name is unique among the siblings (other child nodes from the same parent). When set to an existing name, the node will be automatically renamed.
set_name ::
           (Node :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_name (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_network_master #-}

-- | Sets the node's network master to the peer with the given peer ID. The network master is the peer that has authority over the node on the network. Useful in conjunction with the [code]master[/code] and [code]puppet[/code] keywords. Inherited from the parent node by default, which ultimately defaults to peer ID 1 (the server). If [code]recursive[/code], the given peer is recursively set as the master for all children of this node.
bindNode_set_network_master :: MethodBind
bindNode_set_network_master
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_network_master" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the node's network master to the peer with the given peer ID. The network master is the peer that has authority over the node on the network. Useful in conjunction with the [code]master[/code] and [code]puppet[/code] keywords. Inherited from the parent node by default, which ultimately defaults to peer ID 1 (the server). If [code]recursive[/code], the given peer is recursively set as the master for all children of this node.
set_network_master ::
                     (Node :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_network_master cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_network_master (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_owner #-}

-- | The node owner. A node can have any other node as owner (as long as it is a valid parent, grandparent, etc. ascending in the tree). When saving a node (using [PackedScene]), all the nodes it owns will be saved with it. This allows for the creation of complex [SceneTree]s, with instancing and subinstancing.
bindNode_set_owner :: MethodBind
bindNode_set_owner
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node owner. A node can have any other node as owner (as long as it is a valid parent, grandparent, etc. ascending in the tree). When saving a node (using [PackedScene]), all the nodes it owns will be saved with it. This allows for the creation of complex [SceneTree]s, with instancing and subinstancing.
set_owner :: (Node :< cls, Object :< cls) => cls -> Node -> IO ()
set_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_owner (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_pause_mode #-}

-- | Pause mode. How the node will behave if the [SceneTree] is paused.
bindNode_set_pause_mode :: MethodBind
bindNode_set_pause_mode
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_pause_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pause mode. How the node will behave if the [SceneTree] is paused.
set_pause_mode ::
                 (Node :< cls, Object :< cls) => cls -> Int -> IO ()
set_pause_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_pause_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_physics_process #-}

-- | Enables or disables physics (i.e. fixed framerate) processing. When a node is being processed, it will receive a [constant NOTIFICATION_PHYSICS_PROCESS] at a fixed (usually 60 FPS, see [member Engine.iterations_per_second] to change) interval (and the [method _physics_process] callback will be called if exists). Enabled automatically if [method _physics_process] is overridden. Any calls to this before [method _ready] will be ignored.
bindNode_set_physics_process :: MethodBind
bindNode_set_physics_process
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_physics_process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables physics (i.e. fixed framerate) processing. When a node is being processed, it will receive a [constant NOTIFICATION_PHYSICS_PROCESS] at a fixed (usually 60 FPS, see [member Engine.iterations_per_second] to change) interval (and the [method _physics_process] callback will be called if exists). Enabled automatically if [method _physics_process] is overridden. Any calls to this before [method _ready] will be ignored.
set_physics_process ::
                      (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_physics_process cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_physics_process (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_physics_process_internal #-}

-- | Enables or disables internal physics for this node. Internal physics processing happens in isolation from the normal [method _physics_process] calls and is used by some nodes internally to guarantee proper functioning even if the node is paused or physics processing is disabled for scripting ([method set_physics_process]). Only useful for advanced uses to manipulate built-in nodes' behaviour.
bindNode_set_physics_process_internal :: MethodBind
bindNode_set_physics_process_internal
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_physics_process_internal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables internal physics for this node. Internal physics processing happens in isolation from the normal [method _physics_process] calls and is used by some nodes internally to guarantee proper functioning even if the node is paused or physics processing is disabled for scripting ([method set_physics_process]). Only useful for advanced uses to manipulate built-in nodes' behaviour.
set_physics_process_internal ::
                               (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_physics_process_internal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_physics_process_internal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_process #-}

-- | Enables or disables processing. When a node is being processed, it will receive a [constant NOTIFICATION_PROCESS] on every drawn frame (and the [method _process] callback will be called if exists). Enabled automatically if [method _process] is overridden. Any calls to this before [method _ready] will be ignored.
bindNode_set_process :: MethodBind
bindNode_set_process
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables processing. When a node is being processed, it will receive a [constant NOTIFICATION_PROCESS] on every drawn frame (and the [method _process] callback will be called if exists). Enabled automatically if [method _process] is overridden. Any calls to this before [method _ready] will be ignored.
set_process :: (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_process cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_process (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_process_input #-}

-- | Enables or disables input processing. This is not required for GUI controls! Enabled automatically if [method _input] is overridden. Any calls to this before [method _ready] will be ignored.
bindNode_set_process_input :: MethodBind
bindNode_set_process_input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_process_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables input processing. This is not required for GUI controls! Enabled automatically if [method _input] is overridden. Any calls to this before [method _ready] will be ignored.
set_process_input ::
                    (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_process_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_process_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_process_internal #-}

-- | Enables or disabled internal processing for this node. Internal processing happens in isolation from the normal [method _process] calls and is used by some nodes internally to guarantee proper functioning even if the node is paused or processing is disabled for scripting ([method set_process]). Only useful for advanced uses to manipulate built-in nodes' behaviour.
bindNode_set_process_internal :: MethodBind
bindNode_set_process_internal
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_process_internal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disabled internal processing for this node. Internal processing happens in isolation from the normal [method _process] calls and is used by some nodes internally to guarantee proper functioning even if the node is paused or processing is disabled for scripting ([method set_process]). Only useful for advanced uses to manipulate built-in nodes' behaviour.
set_process_internal ::
                       (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_process_internal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_process_internal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_process_priority #-}

-- | The node's priority in the execution order of the enabled processing callbacks (i.e. [constant NOTIFICATION_PROCESS], [constant NOTIFICATION_PHYSICS_PROCESS] and their internal counterparts). Nodes whose process priority value is [i]lower[/i] will have their processing callbacks executed first.
bindNode_set_process_priority :: MethodBind
bindNode_set_process_priority
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_process_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's priority in the execution order of the enabled processing callbacks (i.e. [constant NOTIFICATION_PROCESS], [constant NOTIFICATION_PHYSICS_PROCESS] and their internal counterparts). Nodes whose process priority value is [i]lower[/i] will have their processing callbacks executed first.
set_process_priority ::
                       (Node :< cls, Object :< cls) => cls -> Int -> IO ()
set_process_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_process_priority (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_process_unhandled_input #-}

-- | Enables unhandled input processing. This is not required for GUI controls! It enables the node to receive all input that was not previously handled (usually by a [Control]). Enabled automatically if [method _unhandled_input] is overridden. Any calls to this before [method _ready] will be ignored.
bindNode_set_process_unhandled_input :: MethodBind
bindNode_set_process_unhandled_input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_process_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables unhandled input processing. This is not required for GUI controls! It enables the node to receive all input that was not previously handled (usually by a [Control]). Enabled automatically if [method _unhandled_input] is overridden. Any calls to this before [method _ready] will be ignored.
set_process_unhandled_input ::
                              (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_process_unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_process_unhandled_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_process_unhandled_key_input #-}

-- | Enables unhandled key input processing. Enabled automatically if [method _unhandled_key_input] is overridden. Any calls to this before [method _ready] will be ignored.
bindNode_set_process_unhandled_key_input :: MethodBind
bindNode_set_process_unhandled_key_input
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_process_unhandled_key_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables unhandled key input processing. Enabled automatically if [method _unhandled_key_input] is overridden. Any calls to this before [method _ready] will be ignored.
set_process_unhandled_key_input ::
                                  (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_process_unhandled_key_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_process_unhandled_key_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_set_scene_instance_load_placeholder #-}

-- | Sets whether this is an instance load placeholder. See [InstancePlaceholder].
bindNode_set_scene_instance_load_placeholder :: MethodBind
bindNode_set_scene_instance_load_placeholder
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "set_scene_instance_load_placeholder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether this is an instance load placeholder. See [InstancePlaceholder].
set_scene_instance_load_placeholder ::
                                      (Node :< cls, Object :< cls) => cls -> Bool -> IO ()
set_scene_instance_load_placeholder cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_set_scene_instance_load_placeholder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode_update_configuration_warning #-}

-- | Updates the warning displayed for this node in the Scene Dock.
--   				Use [method _get_configuration_warning] to setup the warning message to display.
bindNode_update_configuration_warning :: MethodBind
bindNode_update_configuration_warning
  = unsafePerformIO $
      withCString "Node" $
        \ clsNamePtr ->
          withCString "update_configuration_warning" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the warning displayed for this node in the Scene Dock.
--   				Use [method _get_configuration_warning] to setup the warning message to display.
update_configuration_warning ::
                               (Node :< cls, Object :< cls) => cls -> IO ()
update_configuration_warning cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode_update_configuration_warning
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)