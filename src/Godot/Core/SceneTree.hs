{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SceneTree
       (Godot.Core.SceneTree._STRETCH_ASPECT_KEEP,
        Godot.Core.SceneTree._STRETCH_ASPECT_IGNORE,
        Godot.Core.SceneTree._GROUP_CALL_REALTIME,
        Godot.Core.SceneTree._GROUP_CALL_UNIQUE,
        Godot.Core.SceneTree._STRETCH_MODE_DISABLED,
        Godot.Core.SceneTree._STRETCH_ASPECT_KEEP_HEIGHT,
        Godot.Core.SceneTree._STRETCH_MODE_2D,
        Godot.Core.SceneTree._GROUP_CALL_REVERSE,
        Godot.Core.SceneTree._STRETCH_ASPECT_KEEP_WIDTH,
        Godot.Core.SceneTree._STRETCH_MODE_VIEWPORT,
        Godot.Core.SceneTree._GROUP_CALL_DEFAULT,
        Godot.Core.SceneTree._STRETCH_ASPECT_EXPAND,
        Godot.Core.SceneTree.sig_connected_to_server,
        Godot.Core.SceneTree.sig_node_configuration_warning_changed,
        Godot.Core.SceneTree.sig_connection_failed,
        Godot.Core.SceneTree.sig_physics_frame,
        Godot.Core.SceneTree.sig_screen_resized,
        Godot.Core.SceneTree.sig_network_peer_disconnected,
        Godot.Core.SceneTree.sig_network_peer_connected,
        Godot.Core.SceneTree.sig_node_removed,
        Godot.Core.SceneTree.sig_node_added,
        Godot.Core.SceneTree.sig_files_dropped,
        Godot.Core.SceneTree.sig_idle_frame,
        Godot.Core.SceneTree.sig_server_disconnected,
        Godot.Core.SceneTree.sig_tree_changed,
        Godot.Core.SceneTree.get_root, Godot.Core.SceneTree.has_group,
        Godot.Core.SceneTree.set_auto_accept_quit,
        Godot.Core.SceneTree.set_quit_on_go_back,
        Godot.Core.SceneTree.set_debug_collisions_hint,
        Godot.Core.SceneTree.is_debugging_collisions_hint,
        Godot.Core.SceneTree.set_debug_navigation_hint,
        Godot.Core.SceneTree.is_debugging_navigation_hint,
        Godot.Core.SceneTree.set_edited_scene_root,
        Godot.Core.SceneTree.get_edited_scene_root,
        Godot.Core.SceneTree.set_pause, Godot.Core.SceneTree.is_paused,
        Godot.Core.SceneTree.set_input_as_handled,
        Godot.Core.SceneTree.is_input_handled,
        Godot.Core.SceneTree.create_timer,
        Godot.Core.SceneTree.get_node_count,
        Godot.Core.SceneTree.get_frame, Godot.Core.SceneTree.quit,
        Godot.Core.SceneTree.set_screen_stretch,
        Godot.Core.SceneTree.queue_delete,
        Godot.Core.SceneTree.call_group_flags,
        Godot.Core.SceneTree.notify_group_flags,
        Godot.Core.SceneTree.set_group_flags,
        Godot.Core.SceneTree.call_group, Godot.Core.SceneTree.notify_group,
        Godot.Core.SceneTree.set_group,
        Godot.Core.SceneTree.get_nodes_in_group,
        Godot.Core.SceneTree.set_current_scene,
        Godot.Core.SceneTree.get_current_scene,
        Godot.Core.SceneTree.change_scene,
        Godot.Core.SceneTree.change_scene_to,
        Godot.Core.SceneTree.reload_current_scene,
        Godot.Core.SceneTree._change_scene,
        Godot.Core.SceneTree.set_multiplayer,
        Godot.Core.SceneTree.get_multiplayer,
        Godot.Core.SceneTree.set_multiplayer_poll_enabled,
        Godot.Core.SceneTree.is_multiplayer_poll_enabled,
        Godot.Core.SceneTree.set_network_peer,
        Godot.Core.SceneTree.get_network_peer,
        Godot.Core.SceneTree.is_network_server,
        Godot.Core.SceneTree.has_network_peer,
        Godot.Core.SceneTree.get_network_connected_peers,
        Godot.Core.SceneTree.get_network_unique_id,
        Godot.Core.SceneTree.get_rpc_sender_id,
        Godot.Core.SceneTree.set_refuse_new_network_connections,
        Godot.Core.SceneTree.is_refusing_new_network_connections,
        Godot.Core.SceneTree._network_peer_connected,
        Godot.Core.SceneTree._network_peer_disconnected,
        Godot.Core.SceneTree._connected_to_server,
        Godot.Core.SceneTree._connection_failed,
        Godot.Core.SceneTree._server_disconnected,
        Godot.Core.SceneTree.set_use_font_oversampling,
        Godot.Core.SceneTree.is_using_font_oversampling)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_STRETCH_ASPECT_KEEP :: Int
_STRETCH_ASPECT_KEEP = 1

_STRETCH_ASPECT_IGNORE :: Int
_STRETCH_ASPECT_IGNORE = 0

_GROUP_CALL_REALTIME :: Int
_GROUP_CALL_REALTIME = 2

_GROUP_CALL_UNIQUE :: Int
_GROUP_CALL_UNIQUE = 4

_STRETCH_MODE_DISABLED :: Int
_STRETCH_MODE_DISABLED = 0

_STRETCH_ASPECT_KEEP_HEIGHT :: Int
_STRETCH_ASPECT_KEEP_HEIGHT = 3

_STRETCH_MODE_2D :: Int
_STRETCH_MODE_2D = 1

_GROUP_CALL_REVERSE :: Int
_GROUP_CALL_REVERSE = 1

_STRETCH_ASPECT_KEEP_WIDTH :: Int
_STRETCH_ASPECT_KEEP_WIDTH = 2

_STRETCH_MODE_VIEWPORT :: Int
_STRETCH_MODE_VIEWPORT = 2

_GROUP_CALL_DEFAULT :: Int
_GROUP_CALL_DEFAULT = 0

_STRETCH_ASPECT_EXPAND :: Int
_STRETCH_ASPECT_EXPAND = 4

-- | Emitted whenever this SceneTree's [member network_peer] successfully connected to a server. Only emitted on clients.
sig_connected_to_server :: Godot.Internal.Dispatch.Signal SceneTree
sig_connected_to_server
  = Godot.Internal.Dispatch.Signal "connected_to_server"

-- | Emitted when a node's configuration changed. Only emitted in tool mode.
sig_node_configuration_warning_changed ::
                                       Godot.Internal.Dispatch.Signal SceneTree
sig_node_configuration_warning_changed
  = Godot.Internal.Dispatch.Signal
      "node_configuration_warning_changed"

-- | Emitted whenever this SceneTree's [member network_peer] fails to establish a connection to a server. Only emitted on clients.
sig_connection_failed :: Godot.Internal.Dispatch.Signal SceneTree
sig_connection_failed
  = Godot.Internal.Dispatch.Signal "connection_failed"

-- | Emitted immediately before [method Node._physics_process] is called on every node in the SceneTree.
sig_physics_frame :: Godot.Internal.Dispatch.Signal SceneTree
sig_physics_frame = Godot.Internal.Dispatch.Signal "physics_frame"

-- | Emitted whenever the screen resolution (fullscreen) or window size (windowed) changes.
sig_screen_resized :: Godot.Internal.Dispatch.Signal SceneTree
sig_screen_resized
  = Godot.Internal.Dispatch.Signal "screen_resized"

-- | Emitted whenever this SceneTree's [member network_peer] disconnects from a peer. Clients get notified when other clients disconnect from the same server.
sig_network_peer_disconnected ::
                              Godot.Internal.Dispatch.Signal SceneTree
sig_network_peer_disconnected
  = Godot.Internal.Dispatch.Signal "network_peer_disconnected"

-- | Emitted whenever this SceneTree's [member network_peer] connects with a new peer. ID is the peer ID of the new peer. Clients get notified when other clients connect to the same server. Upon connecting to a server, a client also receives this signal for the server (with ID being 1).
sig_network_peer_connected ::
                           Godot.Internal.Dispatch.Signal SceneTree
sig_network_peer_connected
  = Godot.Internal.Dispatch.Signal "network_peer_connected"

-- | Emitted whenever a node is removed from the SceneTree.
sig_node_removed :: Godot.Internal.Dispatch.Signal SceneTree
sig_node_removed = Godot.Internal.Dispatch.Signal "node_removed"

-- | Emitted whenever a node is added to the SceneTree.
sig_node_added :: Godot.Internal.Dispatch.Signal SceneTree
sig_node_added = Godot.Internal.Dispatch.Signal "node_added"

-- | Emitted whenever files are drag-and-dropped onto the window.
sig_files_dropped :: Godot.Internal.Dispatch.Signal SceneTree
sig_files_dropped = Godot.Internal.Dispatch.Signal "files_dropped"

-- | Emitted immediately before [method Node._process] is called on every node in the SceneTree.
sig_idle_frame :: Godot.Internal.Dispatch.Signal SceneTree
sig_idle_frame = Godot.Internal.Dispatch.Signal "idle_frame"

-- | Emitted whenever this SceneTree's [member network_peer] disconnected from server. Only emitted on clients.
sig_server_disconnected :: Godot.Internal.Dispatch.Signal SceneTree
sig_server_disconnected
  = Godot.Internal.Dispatch.Signal "server_disconnected"

-- | Emitted whenever the SceneTree hierarchy changed (children being moved or renamed, etc.).
sig_tree_changed :: Godot.Internal.Dispatch.Signal SceneTree
sig_tree_changed = Godot.Internal.Dispatch.Signal "tree_changed"

{-# NOINLINE bindSceneTree_get_root #-}

-- | The SceneTree's [Viewport].
bindSceneTree_get_root :: MethodBind
bindSceneTree_get_root
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The SceneTree's [Viewport].
get_root :: (SceneTree :< cls, Object :< cls) => cls -> IO Viewport
get_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_root (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_has_group #-}

-- | Returns [code]true[/code] if the given group exists.
bindSceneTree_has_group :: MethodBind
bindSceneTree_has_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "has_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given group exists.
has_group ::
            (SceneTree :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_has_group (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_auto_accept_quit #-}

-- | If [code]true[/code], the application automatically accepts quitting.
bindSceneTree_set_auto_accept_quit :: MethodBind
bindSceneTree_set_auto_accept_quit
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_auto_accept_quit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the application automatically accepts quitting.
set_auto_accept_quit ::
                       (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_auto_accept_quit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_auto_accept_quit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_quit_on_go_back #-}

-- | If [code]true[/code], the application quits automatically on going back (e.g. on Android).
bindSceneTree_set_quit_on_go_back :: MethodBind
bindSceneTree_set_quit_on_go_back
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_quit_on_go_back" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the application quits automatically on going back (e.g. on Android).
set_quit_on_go_back ::
                      (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_quit_on_go_back cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_quit_on_go_back
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_debug_collisions_hint #-}

bindSceneTree_set_debug_collisions_hint :: MethodBind
bindSceneTree_set_debug_collisions_hint
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_debug_collisions_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_debug_collisions_hint ::
                            (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_debug_collisions_hint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_debug_collisions_hint
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_is_debugging_collisions_hint #-}

bindSceneTree_is_debugging_collisions_hint :: MethodBind
bindSceneTree_is_debugging_collisions_hint
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_debugging_collisions_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_debugging_collisions_hint ::
                               (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_debugging_collisions_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_debugging_collisions_hint
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_debug_navigation_hint #-}

bindSceneTree_set_debug_navigation_hint :: MethodBind
bindSceneTree_set_debug_navigation_hint
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_debug_navigation_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_debug_navigation_hint ::
                            (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_debug_navigation_hint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_debug_navigation_hint
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_is_debugging_navigation_hint #-}

bindSceneTree_is_debugging_navigation_hint :: MethodBind
bindSceneTree_is_debugging_navigation_hint
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_debugging_navigation_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_debugging_navigation_hint ::
                               (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_debugging_navigation_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_debugging_navigation_hint
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_edited_scene_root #-}

-- | The root of the edited scene.
bindSceneTree_set_edited_scene_root :: MethodBind
bindSceneTree_set_edited_scene_root
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_edited_scene_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The root of the edited scene.
set_edited_scene_root ::
                        (SceneTree :< cls, Object :< cls) => cls -> Node -> IO ()
set_edited_scene_root cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_edited_scene_root
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_edited_scene_root #-}

-- | The root of the edited scene.
bindSceneTree_get_edited_scene_root :: MethodBind
bindSceneTree_get_edited_scene_root
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_edited_scene_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The root of the edited scene.
get_edited_scene_root ::
                        (SceneTree :< cls, Object :< cls) => cls -> IO Node
get_edited_scene_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_edited_scene_root
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_pause #-}

-- | If [code]true[/code], the SceneTree is paused.
--   			Doing so will have the following behavior:
--   			* 2D and 3D physics will be stopped.
--   			* _process and _physics_process will not be called anymore in nodes.
--   			* _input and _input_event will not be called anymore either.
bindSceneTree_set_pause :: MethodBind
bindSceneTree_set_pause
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_pause" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the SceneTree is paused.
--   			Doing so will have the following behavior:
--   			* 2D and 3D physics will be stopped.
--   			* _process and _physics_process will not be called anymore in nodes.
--   			* _input and _input_event will not be called anymore either.
set_pause ::
            (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_pause cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_pause (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_is_paused #-}

-- | If [code]true[/code], the SceneTree is paused.
--   			Doing so will have the following behavior:
--   			* 2D and 3D physics will be stopped.
--   			* _process and _physics_process will not be called anymore in nodes.
--   			* _input and _input_event will not be called anymore either.
bindSceneTree_is_paused :: MethodBind
bindSceneTree_is_paused
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the SceneTree is paused.
--   			Doing so will have the following behavior:
--   			* 2D and 3D physics will be stopped.
--   			* _process and _physics_process will not be called anymore in nodes.
--   			* _input and _input_event will not be called anymore either.
is_paused :: (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_paused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_paused (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_input_as_handled #-}

-- | Marks the most recent input event as handled.
bindSceneTree_set_input_as_handled :: MethodBind
bindSceneTree_set_input_as_handled
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_input_as_handled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Marks the most recent input event as handled.
set_input_as_handled ::
                       (SceneTree :< cls, Object :< cls) => cls -> IO ()
set_input_as_handled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_input_as_handled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_is_input_handled #-}

-- | Returns [code]true[/code] if the most recent InputEvent was marked as handled with [method set_input_as_handled].
bindSceneTree_is_input_handled :: MethodBind
bindSceneTree_is_input_handled
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_input_handled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the most recent InputEvent was marked as handled with [method set_input_as_handled].
is_input_handled ::
                   (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_input_handled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_input_handled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_create_timer #-}

-- | Returns a [SceneTreeTimer] which will [signal SceneTreeTimer.timeout] after the given time in seconds elapsed in this SceneTree. If [code]pause_mode_process[/code] is set to false, pausing the SceneTree will also pause the timer.
--   				Commonly used to create a one-shot delay timer as in the following example:
--   				[codeblock]
--   				func some_function():
--   					print("start")
--   					yield(get_tree().create_timer(1.0), "timeout")
--   					print("end")
--   				[/codeblock]
bindSceneTree_create_timer :: MethodBind
bindSceneTree_create_timer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "create_timer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [SceneTreeTimer] which will [signal SceneTreeTimer.timeout] after the given time in seconds elapsed in this SceneTree. If [code]pause_mode_process[/code] is set to false, pausing the SceneTree will also pause the timer.
--   				Commonly used to create a one-shot delay timer as in the following example:
--   				[codeblock]
--   				func some_function():
--   					print("start")
--   					yield(get_tree().create_timer(1.0), "timeout")
--   					print("end")
--   				[/codeblock]
create_timer ::
               (SceneTree :< cls, Object :< cls) =>
               cls -> Float -> Bool -> IO SceneTreeTimer
create_timer cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_create_timer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_node_count #-}

-- | Returns the number of nodes in this SceneTree.
bindSceneTree_get_node_count :: MethodBind
bindSceneTree_get_node_count
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_node_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of nodes in this SceneTree.
get_node_count ::
                 (SceneTree :< cls, Object :< cls) => cls -> IO Int
get_node_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_node_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_frame #-}

-- | Returns the current frame, i.e. number of frames since the application started.
bindSceneTree_get_frame :: MethodBind
bindSceneTree_get_frame
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current frame, i.e. number of frames since the application started.
get_frame :: (SceneTree :< cls, Object :< cls) => cls -> IO Int
get_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_frame (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_quit #-}

-- | Quits the application.
bindSceneTree_quit :: MethodBind
bindSceneTree_quit
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "quit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Quits the application.
quit :: (SceneTree :< cls, Object :< cls) => cls -> IO ()
quit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_quit (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_screen_stretch #-}

-- | Configures screen stretching to the given [enum StretchMode], [enum StretchAspect], minimum size and [code]shrink[/code].
bindSceneTree_set_screen_stretch :: MethodBind
bindSceneTree_set_screen_stretch
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_screen_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Configures screen stretching to the given [enum StretchMode], [enum StretchAspect], minimum size and [code]shrink[/code].
set_screen_stretch ::
                     (SceneTree :< cls, Object :< cls) =>
                     cls -> Int -> Int -> Vector2 -> Float -> IO ()
set_screen_stretch cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_screen_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_queue_delete #-}

-- | Queues the given object for deletion, delaying the call to [method Object.free] to after the current frame.
bindSceneTree_queue_delete :: MethodBind
bindSceneTree_queue_delete
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "queue_delete" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queues the given object for deletion, delaying the call to [method Object.free] to after the current frame.
queue_delete ::
               (SceneTree :< cls, Object :< cls) => cls -> Object -> IO ()
queue_delete cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_queue_delete (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_call_group_flags #-}

-- | Calls [code]method[/code] on each member of the given group, respecting the given [enum GroupCallFlags].
bindSceneTree_call_group_flags :: MethodBind
bindSceneTree_call_group_flags
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "call_group_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls [code]method[/code] on each member of the given group, respecting the given [enum GroupCallFlags].
call_group_flags ::
                   (SceneTree :< cls, Object :< cls) =>
                   cls ->
                     Int ->
                       GodotString -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
call_group_flags cls arg1 arg2 arg3 varargs
  = withVariantArray
      ([toVariant arg1, toVariant arg2, toVariant arg3] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_call_group_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_notify_group_flags #-}

-- | Sends the given notification to all members of the [code]group[/code], respecting the given [enum GroupCallFlags].
bindSceneTree_notify_group_flags :: MethodBind
bindSceneTree_notify_group_flags
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "notify_group_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends the given notification to all members of the [code]group[/code], respecting the given [enum GroupCallFlags].
notify_group_flags ::
                     (SceneTree :< cls, Object :< cls) =>
                     cls -> Int -> GodotString -> Int -> IO ()
notify_group_flags cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_notify_group_flags
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_group_flags #-}

-- | Sets the given [code]property[/code] to [code]value[/code] on all members of the given group, respecting the given [enum GroupCallFlags].
bindSceneTree_set_group_flags :: MethodBind
bindSceneTree_set_group_flags
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_group_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given [code]property[/code] to [code]value[/code] on all members of the given group, respecting the given [enum GroupCallFlags].
set_group_flags ::
                  (SceneTree :< cls, Object :< cls) =>
                  cls -> Int -> GodotString -> GodotString -> GodotVariant -> IO ()
set_group_flags cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_group_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_call_group #-}

-- | Calls [code]method[/code] on each member of the given group.
bindSceneTree_call_group :: MethodBind
bindSceneTree_call_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "call_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls [code]method[/code] on each member of the given group.
call_group ::
             (SceneTree :< cls, Object :< cls) =>
             cls ->
               GodotString -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
call_group cls arg1 arg2 varargs
  = withVariantArray ([toVariant arg1, toVariant arg2] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_call_group (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_notify_group #-}

-- | Sends the given notification to all members of the [code]group[/code].
bindSceneTree_notify_group :: MethodBind
bindSceneTree_notify_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "notify_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends the given notification to all members of the [code]group[/code].
notify_group ::
               (SceneTree :< cls, Object :< cls) =>
               cls -> GodotString -> Int -> IO ()
notify_group cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_notify_group (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_group #-}

-- | Sets the given [code]property[/code] to [code]value[/code] on all members of the given group.
bindSceneTree_set_group :: MethodBind
bindSceneTree_set_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given [code]property[/code] to [code]value[/code] on all members of the given group.
set_group ::
            (SceneTree :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> GodotVariant -> IO ()
set_group cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_group (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_nodes_in_group #-}

-- | Returns all nodes assigned to the given group.
bindSceneTree_get_nodes_in_group :: MethodBind
bindSceneTree_get_nodes_in_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_nodes_in_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all nodes assigned to the given group.
get_nodes_in_group ::
                     (SceneTree :< cls, Object :< cls) => cls -> GodotString -> IO Array
get_nodes_in_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_nodes_in_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_current_scene #-}

-- | The current scene.
bindSceneTree_set_current_scene :: MethodBind
bindSceneTree_set_current_scene
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_current_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current scene.
set_current_scene ::
                    (SceneTree :< cls, Object :< cls) => cls -> Node -> IO ()
set_current_scene cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_current_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_current_scene #-}

-- | The current scene.
bindSceneTree_get_current_scene :: MethodBind
bindSceneTree_get_current_scene
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_current_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current scene.
get_current_scene ::
                    (SceneTree :< cls, Object :< cls) => cls -> IO Node
get_current_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_current_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_change_scene #-}

-- | Changes to the scene at the given [code]path[/code].
bindSceneTree_change_scene :: MethodBind
bindSceneTree_change_scene
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "change_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes to the scene at the given [code]path[/code].
change_scene ::
               (SceneTree :< cls, Object :< cls) => cls -> GodotString -> IO Int
change_scene cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_change_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_change_scene_to #-}

-- | Changes to the given [PackedScene].
bindSceneTree_change_scene_to :: MethodBind
bindSceneTree_change_scene_to
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "change_scene_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes to the given [PackedScene].
change_scene_to ::
                  (SceneTree :< cls, Object :< cls) => cls -> PackedScene -> IO Int
change_scene_to cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_change_scene_to (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_reload_current_scene #-}

-- | Reloads the currently active scene.
bindSceneTree_reload_current_scene :: MethodBind
bindSceneTree_reload_current_scene
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "reload_current_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reloads the currently active scene.
reload_current_scene ::
                       (SceneTree :< cls, Object :< cls) => cls -> IO Int
reload_current_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_reload_current_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree__change_scene #-}

bindSceneTree__change_scene :: MethodBind
bindSceneTree__change_scene
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "_change_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_change_scene ::
                (SceneTree :< cls, Object :< cls) => cls -> Node -> IO ()
_change_scene cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree__change_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_multiplayer #-}

-- | The default [MultiplayerAPI] instance for this SceneTree.
bindSceneTree_set_multiplayer :: MethodBind
bindSceneTree_set_multiplayer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_multiplayer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default [MultiplayerAPI] instance for this SceneTree.
set_multiplayer ::
                  (SceneTree :< cls, Object :< cls) => cls -> MultiplayerAPI -> IO ()
set_multiplayer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_multiplayer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_multiplayer #-}

-- | The default [MultiplayerAPI] instance for this SceneTree.
bindSceneTree_get_multiplayer :: MethodBind
bindSceneTree_get_multiplayer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_multiplayer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default [MultiplayerAPI] instance for this SceneTree.
get_multiplayer ::
                  (SceneTree :< cls, Object :< cls) => cls -> IO MultiplayerAPI
get_multiplayer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_multiplayer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_multiplayer_poll_enabled #-}

-- | If [code]true[/code], (default) enable the automatic polling of the [MultiplayerAPI] for this SceneTree during [signal idle_frame].
--   			When [code]false[/code] you need to manually call [method MultiplayerAPI.poll] for processing network packets and delivering RPCs/RSETs. This allows to run RPCs/RSETs in a different loop (e.g. physics, thread, specific time step) and for manual [Mutex] protection when accessing the [MultiplayerAPI] from threads.
bindSceneTree_set_multiplayer_poll_enabled :: MethodBind
bindSceneTree_set_multiplayer_poll_enabled
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_multiplayer_poll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], (default) enable the automatic polling of the [MultiplayerAPI] for this SceneTree during [signal idle_frame].
--   			When [code]false[/code] you need to manually call [method MultiplayerAPI.poll] for processing network packets and delivering RPCs/RSETs. This allows to run RPCs/RSETs in a different loop (e.g. physics, thread, specific time step) and for manual [Mutex] protection when accessing the [MultiplayerAPI] from threads.
set_multiplayer_poll_enabled ::
                               (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_multiplayer_poll_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_multiplayer_poll_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_is_multiplayer_poll_enabled #-}

-- | If [code]true[/code], (default) enable the automatic polling of the [MultiplayerAPI] for this SceneTree during [signal idle_frame].
--   			When [code]false[/code] you need to manually call [method MultiplayerAPI.poll] for processing network packets and delivering RPCs/RSETs. This allows to run RPCs/RSETs in a different loop (e.g. physics, thread, specific time step) and for manual [Mutex] protection when accessing the [MultiplayerAPI] from threads.
bindSceneTree_is_multiplayer_poll_enabled :: MethodBind
bindSceneTree_is_multiplayer_poll_enabled
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_multiplayer_poll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], (default) enable the automatic polling of the [MultiplayerAPI] for this SceneTree during [signal idle_frame].
--   			When [code]false[/code] you need to manually call [method MultiplayerAPI.poll] for processing network packets and delivering RPCs/RSETs. This allows to run RPCs/RSETs in a different loop (e.g. physics, thread, specific time step) and for manual [Mutex] protection when accessing the [MultiplayerAPI] from threads.
is_multiplayer_poll_enabled ::
                              (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_multiplayer_poll_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_multiplayer_poll_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_network_peer #-}

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the SceneTree will become a network server (check with [method is_network_server]) and will set root node's network mode to master (see NETWORK_MODE_* constants in [Node]), or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to SceneTree's signals.
bindSceneTree_set_network_peer :: MethodBind
bindSceneTree_set_network_peer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the SceneTree will become a network server (check with [method is_network_server]) and will set root node's network mode to master (see NETWORK_MODE_* constants in [Node]), or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to SceneTree's signals.
set_network_peer ::
                   (SceneTree :< cls, Object :< cls) =>
                   cls -> NetworkedMultiplayerPeer -> IO ()
set_network_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_network_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_network_peer #-}

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the SceneTree will become a network server (check with [method is_network_server]) and will set root node's network mode to master (see NETWORK_MODE_* constants in [Node]), or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to SceneTree's signals.
bindSceneTree_get_network_peer :: MethodBind
bindSceneTree_get_network_peer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the SceneTree will become a network server (check with [method is_network_server]) and will set root node's network mode to master (see NETWORK_MODE_* constants in [Node]), or it will become a regular peer with root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to SceneTree's signals.
get_network_peer ::
                   (SceneTree :< cls, Object :< cls) =>
                   cls -> IO NetworkedMultiplayerPeer
get_network_peer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_network_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_is_network_server #-}

-- | Returns [code]true[/code] if this SceneTree's [member network_peer] is in server mode (listening for connections).
bindSceneTree_is_network_server :: MethodBind
bindSceneTree_is_network_server
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_network_server" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this SceneTree's [member network_peer] is in server mode (listening for connections).
is_network_server ::
                    (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_network_server cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_network_server (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_has_network_peer #-}

-- | Returns [code]true[/code] if there is a [member network_peer] set.
bindSceneTree_has_network_peer :: MethodBind
bindSceneTree_has_network_peer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "has_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if there is a [member network_peer] set.
has_network_peer ::
                   (SceneTree :< cls, Object :< cls) => cls -> IO Bool
has_network_peer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_has_network_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_network_connected_peers #-}

-- | Returns the peer IDs of all connected peers of this SceneTree's [member network_peer].
bindSceneTree_get_network_connected_peers :: MethodBind
bindSceneTree_get_network_connected_peers
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_network_connected_peers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the peer IDs of all connected peers of this SceneTree's [member network_peer].
get_network_connected_peers ::
                              (SceneTree :< cls, Object :< cls) => cls -> IO PoolIntArray
get_network_connected_peers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_network_connected_peers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_network_unique_id #-}

-- | Returns the unique peer ID of this SceneTree's [member network_peer].
bindSceneTree_get_network_unique_id :: MethodBind
bindSceneTree_get_network_unique_id
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_network_unique_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the unique peer ID of this SceneTree's [member network_peer].
get_network_unique_id ::
                        (SceneTree :< cls, Object :< cls) => cls -> IO Int
get_network_unique_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_network_unique_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_get_rpc_sender_id #-}

-- | Returns the sender's peer ID for the most recently received RPC call.
bindSceneTree_get_rpc_sender_id :: MethodBind
bindSceneTree_get_rpc_sender_id
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_rpc_sender_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the sender's peer ID for the most recently received RPC call.
get_rpc_sender_id ::
                    (SceneTree :< cls, Object :< cls) => cls -> IO Int
get_rpc_sender_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_rpc_sender_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_refuse_new_network_connections #-}

-- | If [code]true[/code], the SceneTree's [member network_peer] refuses new incoming connections.
bindSceneTree_set_refuse_new_network_connections :: MethodBind
bindSceneTree_set_refuse_new_network_connections
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_refuse_new_network_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the SceneTree's [member network_peer] refuses new incoming connections.
set_refuse_new_network_connections ::
                                     (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_refuse_new_network_connections cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSceneTree_set_refuse_new_network_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_is_refusing_new_network_connections #-}

-- | If [code]true[/code], the SceneTree's [member network_peer] refuses new incoming connections.
bindSceneTree_is_refusing_new_network_connections :: MethodBind
bindSceneTree_is_refusing_new_network_connections
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_refusing_new_network_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the SceneTree's [member network_peer] refuses new incoming connections.
is_refusing_new_network_connections ::
                                      (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_refusing_new_network_connections cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSceneTree_is_refusing_new_network_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree__network_peer_connected #-}

bindSceneTree__network_peer_connected :: MethodBind
bindSceneTree__network_peer_connected
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "_network_peer_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_network_peer_connected ::
                          (SceneTree :< cls, Object :< cls) => cls -> Int -> IO ()
_network_peer_connected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree__network_peer_connected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree__network_peer_disconnected #-}

bindSceneTree__network_peer_disconnected :: MethodBind
bindSceneTree__network_peer_disconnected
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "_network_peer_disconnected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_network_peer_disconnected ::
                             (SceneTree :< cls, Object :< cls) => cls -> Int -> IO ()
_network_peer_disconnected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree__network_peer_disconnected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree__connected_to_server #-}

bindSceneTree__connected_to_server :: MethodBind
bindSceneTree__connected_to_server
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "_connected_to_server" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_connected_to_server ::
                       (SceneTree :< cls, Object :< cls) => cls -> IO ()
_connected_to_server cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree__connected_to_server
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree__connection_failed #-}

bindSceneTree__connection_failed :: MethodBind
bindSceneTree__connection_failed
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "_connection_failed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_connection_failed ::
                     (SceneTree :< cls, Object :< cls) => cls -> IO ()
_connection_failed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree__connection_failed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree__server_disconnected #-}

bindSceneTree__server_disconnected :: MethodBind
bindSceneTree__server_disconnected
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "_server_disconnected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_server_disconnected ::
                       (SceneTree :< cls, Object :< cls) => cls -> IO ()
_server_disconnected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree__server_disconnected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_set_use_font_oversampling #-}

-- | If [code]true[/code], font oversampling is used.
bindSceneTree_set_use_font_oversampling :: MethodBind
bindSceneTree_set_use_font_oversampling
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_use_font_oversampling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], font oversampling is used.
set_use_font_oversampling ::
                            (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_font_oversampling cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_use_font_oversampling
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneTree_is_using_font_oversampling #-}

-- | If [code]true[/code], font oversampling is used.
bindSceneTree_is_using_font_oversampling :: MethodBind
bindSceneTree_is_using_font_oversampling
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_using_font_oversampling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], font oversampling is used.
is_using_font_oversampling ::
                             (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_using_font_oversampling cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_using_font_oversampling
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)