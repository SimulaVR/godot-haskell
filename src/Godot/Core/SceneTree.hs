{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
        Godot.Core.SceneTree.sig_connection_failed,
        Godot.Core.SceneTree.sig_files_dropped,
        Godot.Core.SceneTree.sig_global_menu_action,
        Godot.Core.SceneTree.sig_idle_frame,
        Godot.Core.SceneTree.sig_network_peer_connected,
        Godot.Core.SceneTree.sig_network_peer_disconnected,
        Godot.Core.SceneTree.sig_node_added,
        Godot.Core.SceneTree.sig_node_configuration_warning_changed,
        Godot.Core.SceneTree.sig_node_removed,
        Godot.Core.SceneTree.sig_node_renamed,
        Godot.Core.SceneTree.sig_physics_frame,
        Godot.Core.SceneTree.sig_screen_resized,
        Godot.Core.SceneTree.sig_server_disconnected,
        Godot.Core.SceneTree.sig_tree_changed,
        Godot.Core.SceneTree._change_scene,
        Godot.Core.SceneTree._connected_to_server,
        Godot.Core.SceneTree._connection_failed,
        Godot.Core.SceneTree._network_peer_connected,
        Godot.Core.SceneTree._network_peer_disconnected,
        Godot.Core.SceneTree._server_disconnected,
        Godot.Core.SceneTree.call_group,
        Godot.Core.SceneTree.call_group_flags,
        Godot.Core.SceneTree.change_scene,
        Godot.Core.SceneTree.change_scene_to,
        Godot.Core.SceneTree.create_timer,
        Godot.Core.SceneTree.get_current_scene,
        Godot.Core.SceneTree.get_edited_scene_root,
        Godot.Core.SceneTree.get_frame,
        Godot.Core.SceneTree.get_multiplayer,
        Godot.Core.SceneTree.get_network_connected_peers,
        Godot.Core.SceneTree.get_network_peer,
        Godot.Core.SceneTree.get_network_unique_id,
        Godot.Core.SceneTree.get_node_count,
        Godot.Core.SceneTree.get_nodes_in_group,
        Godot.Core.SceneTree.get_root,
        Godot.Core.SceneTree.get_rpc_sender_id,
        Godot.Core.SceneTree.has_group,
        Godot.Core.SceneTree.has_network_peer,
        Godot.Core.SceneTree.is_debugging_collisions_hint,
        Godot.Core.SceneTree.is_debugging_navigation_hint,
        Godot.Core.SceneTree.is_input_handled,
        Godot.Core.SceneTree.is_multiplayer_poll_enabled,
        Godot.Core.SceneTree.is_network_server,
        Godot.Core.SceneTree.is_paused,
        Godot.Core.SceneTree.is_refusing_new_network_connections,
        Godot.Core.SceneTree.is_using_font_oversampling,
        Godot.Core.SceneTree.notify_group,
        Godot.Core.SceneTree.notify_group_flags,
        Godot.Core.SceneTree.queue_delete, Godot.Core.SceneTree.quit,
        Godot.Core.SceneTree.reload_current_scene,
        Godot.Core.SceneTree.set_auto_accept_quit,
        Godot.Core.SceneTree.set_current_scene,
        Godot.Core.SceneTree.set_debug_collisions_hint,
        Godot.Core.SceneTree.set_debug_navigation_hint,
        Godot.Core.SceneTree.set_edited_scene_root,
        Godot.Core.SceneTree.set_group,
        Godot.Core.SceneTree.set_group_flags,
        Godot.Core.SceneTree.set_input_as_handled,
        Godot.Core.SceneTree.set_multiplayer,
        Godot.Core.SceneTree.set_multiplayer_poll_enabled,
        Godot.Core.SceneTree.set_network_peer,
        Godot.Core.SceneTree.set_pause,
        Godot.Core.SceneTree.set_quit_on_go_back,
        Godot.Core.SceneTree.set_refuse_new_network_connections,
        Godot.Core.SceneTree.set_screen_stretch,
        Godot.Core.SceneTree.set_use_font_oversampling)
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
import Godot.Core.MainLoop()

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

-- | Emitted whenever this @SceneTree@'s @network_peer@ successfully connected to a server. Only emitted on clients.
sig_connected_to_server :: Godot.Internal.Dispatch.Signal SceneTree
sig_connected_to_server
  = Godot.Internal.Dispatch.Signal "connected_to_server"

instance NodeSignal SceneTree "connected_to_server" '[]

-- | Emitted whenever this @SceneTree@'s @network_peer@ fails to establish a connection to a server. Only emitted on clients.
sig_connection_failed :: Godot.Internal.Dispatch.Signal SceneTree
sig_connection_failed
  = Godot.Internal.Dispatch.Signal "connection_failed"

instance NodeSignal SceneTree "connection_failed" '[]

-- | Emitted when files are dragged from the OS file manager and dropped in the game window. The arguments are a list of file paths and the identifier of the screen where the drag originated.
sig_files_dropped :: Godot.Internal.Dispatch.Signal SceneTree
sig_files_dropped = Godot.Internal.Dispatch.Signal "files_dropped"

instance NodeSignal SceneTree "files_dropped"
           '[PoolStringArray, Int]

-- | Emitted whenever global menu item is clicked.
sig_global_menu_action :: Godot.Internal.Dispatch.Signal SceneTree
sig_global_menu_action
  = Godot.Internal.Dispatch.Signal "global_menu_action"

instance NodeSignal SceneTree "global_menu_action" '[(), ()]

-- | Emitted immediately before @method Node._process@ is called on every node in the @SceneTree@.
sig_idle_frame :: Godot.Internal.Dispatch.Signal SceneTree
sig_idle_frame = Godot.Internal.Dispatch.Signal "idle_frame"

instance NodeSignal SceneTree "idle_frame" '[]

-- | Emitted whenever this @SceneTree@'s @network_peer@ connects with a new peer. ID is the peer ID of the new peer. Clients get notified when other clients connect to the same server. Upon connecting to a server, a client also receives this signal for the server (with ID being 1).
sig_network_peer_connected ::
                           Godot.Internal.Dispatch.Signal SceneTree
sig_network_peer_connected
  = Godot.Internal.Dispatch.Signal "network_peer_connected"

instance NodeSignal SceneTree "network_peer_connected" '[Int]

-- | Emitted whenever this @SceneTree@'s @network_peer@ disconnects from a peer. Clients get notified when other clients disconnect from the same server.
sig_network_peer_disconnected ::
                              Godot.Internal.Dispatch.Signal SceneTree
sig_network_peer_disconnected
  = Godot.Internal.Dispatch.Signal "network_peer_disconnected"

instance NodeSignal SceneTree "network_peer_disconnected" '[Int]

-- | Emitted whenever a node is added to the @SceneTree@.
sig_node_added :: Godot.Internal.Dispatch.Signal SceneTree
sig_node_added = Godot.Internal.Dispatch.Signal "node_added"

instance NodeSignal SceneTree "node_added" '[Node]

-- | Emitted when a node's configuration changed. Only emitted in @tool@ mode.
sig_node_configuration_warning_changed ::
                                       Godot.Internal.Dispatch.Signal SceneTree
sig_node_configuration_warning_changed
  = Godot.Internal.Dispatch.Signal
      "node_configuration_warning_changed"

instance NodeSignal SceneTree "node_configuration_warning_changed"
           '[Node]

-- | Emitted whenever a node is removed from the @SceneTree@.
sig_node_removed :: Godot.Internal.Dispatch.Signal SceneTree
sig_node_removed = Godot.Internal.Dispatch.Signal "node_removed"

instance NodeSignal SceneTree "node_removed" '[Node]

-- | Emitted whenever a node is renamed.
sig_node_renamed :: Godot.Internal.Dispatch.Signal SceneTree
sig_node_renamed = Godot.Internal.Dispatch.Signal "node_renamed"

instance NodeSignal SceneTree "node_renamed" '[Node]

-- | Emitted immediately before @method Node._physics_process@ is called on every node in the @SceneTree@.
sig_physics_frame :: Godot.Internal.Dispatch.Signal SceneTree
sig_physics_frame = Godot.Internal.Dispatch.Signal "physics_frame"

instance NodeSignal SceneTree "physics_frame" '[]

-- | Emitted when the screen resolution (fullscreen) or window size (windowed) changes.
sig_screen_resized :: Godot.Internal.Dispatch.Signal SceneTree
sig_screen_resized
  = Godot.Internal.Dispatch.Signal "screen_resized"

instance NodeSignal SceneTree "screen_resized" '[]

-- | Emitted whenever this @SceneTree@'s @network_peer@ disconnected from server. Only emitted on clients.
sig_server_disconnected :: Godot.Internal.Dispatch.Signal SceneTree
sig_server_disconnected
  = Godot.Internal.Dispatch.Signal "server_disconnected"

instance NodeSignal SceneTree "server_disconnected" '[]

-- | Emitted whenever the @SceneTree@ hierarchy changed (children being moved or renamed, etc.).
sig_tree_changed :: Godot.Internal.Dispatch.Signal SceneTree
sig_tree_changed = Godot.Internal.Dispatch.Signal "tree_changed"

instance NodeSignal SceneTree "tree_changed" '[]

instance NodeProperty SceneTree "current_scene" Node 'False where
        nodeProperty
          = (get_current_scene, wrapDroppingSetter set_current_scene,
             Nothing)

instance NodeProperty SceneTree "debug_collisions_hint" Bool 'False
         where
        nodeProperty
          = (is_debugging_collisions_hint,
             wrapDroppingSetter set_debug_collisions_hint, Nothing)

instance NodeProperty SceneTree "debug_navigation_hint" Bool 'False
         where
        nodeProperty
          = (is_debugging_navigation_hint,
             wrapDroppingSetter set_debug_navigation_hint, Nothing)

instance NodeProperty SceneTree "edited_scene_root" Node 'False
         where
        nodeProperty
          = (get_edited_scene_root, wrapDroppingSetter set_edited_scene_root,
             Nothing)

instance NodeProperty SceneTree "multiplayer" MultiplayerAPI 'False
         where
        nodeProperty
          = (get_multiplayer, wrapDroppingSetter set_multiplayer, Nothing)

instance NodeProperty SceneTree "multiplayer_poll" Bool 'False
         where
        nodeProperty
          = (is_multiplayer_poll_enabled,
             wrapDroppingSetter set_multiplayer_poll_enabled, Nothing)

instance NodeProperty SceneTree "network_peer"
           NetworkedMultiplayerPeer
           'False
         where
        nodeProperty
          = (get_network_peer, wrapDroppingSetter set_network_peer, Nothing)

instance NodeProperty SceneTree "paused" Bool 'False where
        nodeProperty = (is_paused, wrapDroppingSetter set_pause, Nothing)

instance NodeProperty SceneTree "refuse_new_network_connections"
           Bool
           'False
         where
        nodeProperty
          = (is_refusing_new_network_connections,
             wrapDroppingSetter set_refuse_new_network_connections, Nothing)

instance NodeProperty SceneTree "root" Viewport 'True where
        nodeProperty = (get_root, (), Nothing)

instance NodeProperty SceneTree "use_font_oversampling" Bool 'False
         where
        nodeProperty
          = (is_using_font_oversampling,
             wrapDroppingSetter set_use_font_oversampling, Nothing)

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

instance NodeMethod SceneTree "_change_scene" '[Node] (IO ()) where
        nodeMethod = Godot.Core.SceneTree._change_scene

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

instance NodeMethod SceneTree "_connected_to_server" '[] (IO ())
         where
        nodeMethod = Godot.Core.SceneTree._connected_to_server

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

instance NodeMethod SceneTree "_connection_failed" '[] (IO ())
         where
        nodeMethod = Godot.Core.SceneTree._connection_failed

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

instance NodeMethod SceneTree "_network_peer_connected" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree._network_peer_connected

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

instance NodeMethod SceneTree "_network_peer_disconnected" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree._network_peer_disconnected

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

instance NodeMethod SceneTree "_server_disconnected" '[] (IO ())
         where
        nodeMethod = Godot.Core.SceneTree._server_disconnected

{-# NOINLINE bindSceneTree_call_group #-}

-- | Calls @method@ on each member of the given group.
bindSceneTree_call_group :: MethodBind
bindSceneTree_call_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "call_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls @method@ on each member of the given group.
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

instance NodeMethod SceneTree "call_group"
           '[GodotString, GodotString, [Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.SceneTree.call_group

{-# NOINLINE bindSceneTree_call_group_flags #-}

-- | Calls @method@ on each member of the given group, respecting the given @enum GroupCallFlags@.
bindSceneTree_call_group_flags :: MethodBind
bindSceneTree_call_group_flags
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "call_group_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls @method@ on each member of the given group, respecting the given @enum GroupCallFlags@.
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

instance NodeMethod SceneTree "call_group_flags"
           '[Int, GodotString, GodotString, [Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.SceneTree.call_group_flags

{-# NOINLINE bindSceneTree_change_scene #-}

-- | Changes the running scene to the one at the given @path@, after loading it into a @PackedScene@ and creating a new instance.
--   				Returns @OK@ on success, @ERR_CANT_OPEN@ if the @path@ cannot be loaded into a @PackedScene@, or @ERR_CANT_CREATE@ if that scene cannot be instantiated.
bindSceneTree_change_scene :: MethodBind
bindSceneTree_change_scene
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "change_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the running scene to the one at the given @path@, after loading it into a @PackedScene@ and creating a new instance.
--   				Returns @OK@ on success, @ERR_CANT_OPEN@ if the @path@ cannot be loaded into a @PackedScene@, or @ERR_CANT_CREATE@ if that scene cannot be instantiated.
change_scene ::
               (SceneTree :< cls, Object :< cls) => cls -> GodotString -> IO Int
change_scene cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_change_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "change_scene" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.SceneTree.change_scene

{-# NOINLINE bindSceneTree_change_scene_to #-}

-- | Changes the running scene to a new instance of the given @PackedScene@.
--   				Returns @OK@ on success or @ERR_CANT_CREATE@ if the scene cannot be instantiated.
bindSceneTree_change_scene_to :: MethodBind
bindSceneTree_change_scene_to
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "change_scene_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the running scene to a new instance of the given @PackedScene@.
--   				Returns @OK@ on success or @ERR_CANT_CREATE@ if the scene cannot be instantiated.
change_scene_to ::
                  (SceneTree :< cls, Object :< cls) => cls -> PackedScene -> IO Int
change_scene_to cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_change_scene_to (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "change_scene_to" '[PackedScene]
           (IO Int)
         where
        nodeMethod = Godot.Core.SceneTree.change_scene_to

{-# NOINLINE bindSceneTree_create_timer #-}

-- | Returns a @SceneTreeTimer@ which will @signal SceneTreeTimer.timeout@ after the given time in seconds elapsed in this @SceneTree@. If @pause_mode_process@ is set to @false@, pausing the @SceneTree@ will also pause the timer.
--   				Commonly used to create a one-shot delay timer as in the following example:
--   				
--   @
--   
--   				func some_function():
--   				    print("start")
--   				    yield(get_tree().create_timer(1.0), "timeout")
--   				    print("end")
--   				
--   @
bindSceneTree_create_timer :: MethodBind
bindSceneTree_create_timer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "create_timer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @SceneTreeTimer@ which will @signal SceneTreeTimer.timeout@ after the given time in seconds elapsed in this @SceneTree@. If @pause_mode_process@ is set to @false@, pausing the @SceneTree@ will also pause the timer.
--   				Commonly used to create a one-shot delay timer as in the following example:
--   				
--   @
--   
--   				func some_function():
--   				    print("start")
--   				    yield(get_tree().create_timer(1.0), "timeout")
--   				    print("end")
--   				
--   @
create_timer ::
               (SceneTree :< cls, Object :< cls) =>
               cls -> Float -> Maybe Bool -> IO SceneTreeTimer
create_timer cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_create_timer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "create_timer" '[Float, Maybe Bool]
           (IO SceneTreeTimer)
         where
        nodeMethod = Godot.Core.SceneTree.create_timer

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

instance NodeMethod SceneTree "get_current_scene" '[] (IO Node)
         where
        nodeMethod = Godot.Core.SceneTree.get_current_scene

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

instance NodeMethod SceneTree "get_edited_scene_root" '[] (IO Node)
         where
        nodeMethod = Godot.Core.SceneTree.get_edited_scene_root

{-# NOINLINE bindSceneTree_get_frame #-}

-- | Returns the current frame number, i.e. the total frame count since the application started.
bindSceneTree_get_frame :: MethodBind
bindSceneTree_get_frame
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current frame number, i.e. the total frame count since the application started.
get_frame :: (SceneTree :< cls, Object :< cls) => cls -> IO Int
get_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_frame (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "get_frame" '[] (IO Int) where
        nodeMethod = Godot.Core.SceneTree.get_frame

{-# NOINLINE bindSceneTree_get_multiplayer #-}

-- | The default @MultiplayerAPI@ instance for this @SceneTree@.
bindSceneTree_get_multiplayer :: MethodBind
bindSceneTree_get_multiplayer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_multiplayer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default @MultiplayerAPI@ instance for this @SceneTree@.
get_multiplayer ::
                  (SceneTree :< cls, Object :< cls) => cls -> IO MultiplayerAPI
get_multiplayer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_multiplayer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "get_multiplayer" '[]
           (IO MultiplayerAPI)
         where
        nodeMethod = Godot.Core.SceneTree.get_multiplayer

{-# NOINLINE bindSceneTree_get_network_connected_peers #-}

-- | Returns the peer IDs of all connected peers of this @SceneTree@'s @network_peer@.
bindSceneTree_get_network_connected_peers :: MethodBind
bindSceneTree_get_network_connected_peers
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_network_connected_peers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the peer IDs of all connected peers of this @SceneTree@'s @network_peer@.
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

instance NodeMethod SceneTree "get_network_connected_peers" '[]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.SceneTree.get_network_connected_peers

{-# NOINLINE bindSceneTree_get_network_peer #-}

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the @SceneTree@ will become a network server (check with @method is_network_server@) and will set the root node's network mode to master, or it will become a regular peer with the root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to @SceneTree@'s signals.
bindSceneTree_get_network_peer :: MethodBind
bindSceneTree_get_network_peer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the @SceneTree@ will become a network server (check with @method is_network_server@) and will set the root node's network mode to master, or it will become a regular peer with the root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to @SceneTree@'s signals.
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

instance NodeMethod SceneTree "get_network_peer" '[]
           (IO NetworkedMultiplayerPeer)
         where
        nodeMethod = Godot.Core.SceneTree.get_network_peer

{-# NOINLINE bindSceneTree_get_network_unique_id #-}

-- | Returns the unique peer ID of this @SceneTree@'s @network_peer@.
bindSceneTree_get_network_unique_id :: MethodBind
bindSceneTree_get_network_unique_id
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_network_unique_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the unique peer ID of this @SceneTree@'s @network_peer@.
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

instance NodeMethod SceneTree "get_network_unique_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SceneTree.get_network_unique_id

{-# NOINLINE bindSceneTree_get_node_count #-}

-- | Returns the number of nodes in this @SceneTree@.
bindSceneTree_get_node_count :: MethodBind
bindSceneTree_get_node_count
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_node_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of nodes in this @SceneTree@.
get_node_count ::
                 (SceneTree :< cls, Object :< cls) => cls -> IO Int
get_node_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_node_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "get_node_count" '[] (IO Int) where
        nodeMethod = Godot.Core.SceneTree.get_node_count

{-# NOINLINE bindSceneTree_get_nodes_in_group #-}

-- | Returns a list of all nodes assigned to the given group.
bindSceneTree_get_nodes_in_group :: MethodBind
bindSceneTree_get_nodes_in_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_nodes_in_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of all nodes assigned to the given group.
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

instance NodeMethod SceneTree "get_nodes_in_group" '[GodotString]
           (IO Array)
         where
        nodeMethod = Godot.Core.SceneTree.get_nodes_in_group

{-# NOINLINE bindSceneTree_get_root #-}

-- | The @SceneTree@'s root @Viewport@.
bindSceneTree_get_root :: MethodBind
bindSceneTree_get_root
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "get_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @SceneTree@'s root @Viewport@.
get_root :: (SceneTree :< cls, Object :< cls) => cls -> IO Viewport
get_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_get_root (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "get_root" '[] (IO Viewport) where
        nodeMethod = Godot.Core.SceneTree.get_root

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

instance NodeMethod SceneTree "get_rpc_sender_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SceneTree.get_rpc_sender_id

{-# NOINLINE bindSceneTree_has_group #-}

-- | Returns @true@ if the given group exists.
bindSceneTree_has_group :: MethodBind
bindSceneTree_has_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "has_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given group exists.
has_group ::
            (SceneTree :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_has_group (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "has_group" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTree.has_group

{-# NOINLINE bindSceneTree_has_network_peer #-}

-- | Returns @true@ if there is a @network_peer@ set.
bindSceneTree_has_network_peer :: MethodBind
bindSceneTree_has_network_peer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "has_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if there is a @network_peer@ set.
has_network_peer ::
                   (SceneTree :< cls, Object :< cls) => cls -> IO Bool
has_network_peer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_has_network_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "has_network_peer" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTree.has_network_peer

{-# NOINLINE bindSceneTree_is_debugging_collisions_hint #-}

-- | If @true@, collision shapes will be visible when running the game from the editor for debugging purposes.
bindSceneTree_is_debugging_collisions_hint :: MethodBind
bindSceneTree_is_debugging_collisions_hint
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_debugging_collisions_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, collision shapes will be visible when running the game from the editor for debugging purposes.
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

instance NodeMethod SceneTree "is_debugging_collisions_hint" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTree.is_debugging_collisions_hint

{-# NOINLINE bindSceneTree_is_debugging_navigation_hint #-}

-- | If @true@, navigation polygons will be visible when running the game from the editor for debugging purposes.
bindSceneTree_is_debugging_navigation_hint :: MethodBind
bindSceneTree_is_debugging_navigation_hint
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_debugging_navigation_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, navigation polygons will be visible when running the game from the editor for debugging purposes.
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

instance NodeMethod SceneTree "is_debugging_navigation_hint" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTree.is_debugging_navigation_hint

{-# NOINLINE bindSceneTree_is_input_handled #-}

-- | Returns @true@ if the most recent @InputEvent@ was marked as handled with @method set_input_as_handled@.
bindSceneTree_is_input_handled :: MethodBind
bindSceneTree_is_input_handled
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_input_handled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the most recent @InputEvent@ was marked as handled with @method set_input_as_handled@.
is_input_handled ::
                   (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_input_handled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_input_handled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "is_input_handled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTree.is_input_handled

{-# NOINLINE bindSceneTree_is_multiplayer_poll_enabled #-}

-- | If @true@ (default value), enables automatic polling of the @MultiplayerAPI@ for this SceneTree during @signal idle_frame@.
--   			If @false@, you need to manually call @method MultiplayerAPI.poll@ to process network packets and deliver RPCs/RSETs. This allows running RPCs/RSETs in a different loop (e.g. physics, thread, specific time step) and for manual @Mutex@ protection when accessing the @MultiplayerAPI@ from threads.
bindSceneTree_is_multiplayer_poll_enabled :: MethodBind
bindSceneTree_is_multiplayer_poll_enabled
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_multiplayer_poll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ (default value), enables automatic polling of the @MultiplayerAPI@ for this SceneTree during @signal idle_frame@.
--   			If @false@, you need to manually call @method MultiplayerAPI.poll@ to process network packets and deliver RPCs/RSETs. This allows running RPCs/RSETs in a different loop (e.g. physics, thread, specific time step) and for manual @Mutex@ protection when accessing the @MultiplayerAPI@ from threads.
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

instance NodeMethod SceneTree "is_multiplayer_poll_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTree.is_multiplayer_poll_enabled

{-# NOINLINE bindSceneTree_is_network_server #-}

-- | Returns @true@ if this @SceneTree@'s @network_peer@ is in server mode (listening for connections).
bindSceneTree_is_network_server :: MethodBind
bindSceneTree_is_network_server
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_network_server" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this @SceneTree@'s @network_peer@ is in server mode (listening for connections).
is_network_server ::
                    (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_network_server cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_network_server (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "is_network_server" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTree.is_network_server

{-# NOINLINE bindSceneTree_is_paused #-}

-- | If @true@, the @SceneTree@ is paused. Doing so will have the following behavior:
--   			- 2D and 3D physics will be stopped.
--   			- @method Node._process@, @method Node._physics_process@ and @method Node._input@ will not be called anymore in nodes.
bindSceneTree_is_paused :: MethodBind
bindSceneTree_is_paused
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_paused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @SceneTree@ is paused. Doing so will have the following behavior:
--   			- 2D and 3D physics will be stopped.
--   			- @method Node._process@, @method Node._physics_process@ and @method Node._input@ will not be called anymore in nodes.
is_paused :: (SceneTree :< cls, Object :< cls) => cls -> IO Bool
is_paused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_is_paused (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "is_paused" '[] (IO Bool) where
        nodeMethod = Godot.Core.SceneTree.is_paused

{-# NOINLINE bindSceneTree_is_refusing_new_network_connections #-}

-- | If @true@, the @SceneTree@'s @network_peer@ refuses new incoming connections.
bindSceneTree_is_refusing_new_network_connections :: MethodBind
bindSceneTree_is_refusing_new_network_connections
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_refusing_new_network_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @SceneTree@'s @network_peer@ refuses new incoming connections.
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

instance NodeMethod SceneTree "is_refusing_new_network_connections"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.SceneTree.is_refusing_new_network_connections

{-# NOINLINE bindSceneTree_is_using_font_oversampling #-}

-- | If @true@, font oversampling is used.
bindSceneTree_is_using_font_oversampling :: MethodBind
bindSceneTree_is_using_font_oversampling
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "is_using_font_oversampling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, font oversampling is used.
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

instance NodeMethod SceneTree "is_using_font_oversampling" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.SceneTree.is_using_font_oversampling

{-# NOINLINE bindSceneTree_notify_group #-}

-- | Sends the given notification to all members of the @group@.
bindSceneTree_notify_group :: MethodBind
bindSceneTree_notify_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "notify_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends the given notification to all members of the @group@.
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

instance NodeMethod SceneTree "notify_group" '[GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.notify_group

{-# NOINLINE bindSceneTree_notify_group_flags #-}

-- | Sends the given notification to all members of the @group@, respecting the given @enum GroupCallFlags@.
bindSceneTree_notify_group_flags :: MethodBind
bindSceneTree_notify_group_flags
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "notify_group_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends the given notification to all members of the @group@, respecting the given @enum GroupCallFlags@.
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

instance NodeMethod SceneTree "notify_group_flags"
           '[Int, GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.notify_group_flags

{-# NOINLINE bindSceneTree_queue_delete #-}

-- | Queues the given object for deletion, delaying the call to @method Object.free@ to after the current frame.
bindSceneTree_queue_delete :: MethodBind
bindSceneTree_queue_delete
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "queue_delete" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queues the given object for deletion, delaying the call to @method Object.free@ to after the current frame.
queue_delete ::
               (SceneTree :< cls, Object :< cls) => cls -> Object -> IO ()
queue_delete cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_queue_delete (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "queue_delete" '[Object] (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.queue_delete

{-# NOINLINE bindSceneTree_quit #-}

-- | Quits the application. A process @exit_code@ can optionally be passed as an argument. If this argument is @0@ or greater, it will override the @OS.exit_code@ defined before quitting the application.
bindSceneTree_quit :: MethodBind
bindSceneTree_quit
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "quit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Quits the application. A process @exit_code@ can optionally be passed as an argument. If this argument is @0@ or greater, it will override the @OS.exit_code@ defined before quitting the application.
quit ::
       (SceneTree :< cls, Object :< cls) => cls -> Maybe Int -> IO ()
quit cls arg1
  = withVariantArray [maybe (VariantInt (-1)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_quit (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "quit" '[Maybe Int] (IO ()) where
        nodeMethod = Godot.Core.SceneTree.quit

{-# NOINLINE bindSceneTree_reload_current_scene #-}

-- | Reloads the currently active scene.
--   				Returns @OK@ on success, @ERR_UNCONFIGURED@ if no @current_scene@ was defined yet, @ERR_CANT_OPEN@ if @current_scene@ cannot be loaded into a @PackedScene@, or @ERR_CANT_CREATE@ if the scene cannot be instantiated.
bindSceneTree_reload_current_scene :: MethodBind
bindSceneTree_reload_current_scene
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "reload_current_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reloads the currently active scene.
--   				Returns @OK@ on success, @ERR_UNCONFIGURED@ if no @current_scene@ was defined yet, @ERR_CANT_OPEN@ if @current_scene@ cannot be loaded into a @PackedScene@, or @ERR_CANT_CREATE@ if the scene cannot be instantiated.
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

instance NodeMethod SceneTree "reload_current_scene" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SceneTree.reload_current_scene

{-# NOINLINE bindSceneTree_set_auto_accept_quit #-}

-- | If @true@, the application automatically accepts quitting. Enabled by default.
--   				For mobile platforms, see @method set_quit_on_go_back@.
bindSceneTree_set_auto_accept_quit :: MethodBind
bindSceneTree_set_auto_accept_quit
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_auto_accept_quit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the application automatically accepts quitting. Enabled by default.
--   				For mobile platforms, see @method set_quit_on_go_back@.
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

instance NodeMethod SceneTree "set_auto_accept_quit" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_auto_accept_quit

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

instance NodeMethod SceneTree "set_current_scene" '[Node] (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_current_scene

{-# NOINLINE bindSceneTree_set_debug_collisions_hint #-}

-- | If @true@, collision shapes will be visible when running the game from the editor for debugging purposes.
bindSceneTree_set_debug_collisions_hint :: MethodBind
bindSceneTree_set_debug_collisions_hint
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_debug_collisions_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, collision shapes will be visible when running the game from the editor for debugging purposes.
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

instance NodeMethod SceneTree "set_debug_collisions_hint" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_debug_collisions_hint

{-# NOINLINE bindSceneTree_set_debug_navigation_hint #-}

-- | If @true@, navigation polygons will be visible when running the game from the editor for debugging purposes.
bindSceneTree_set_debug_navigation_hint :: MethodBind
bindSceneTree_set_debug_navigation_hint
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_debug_navigation_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, navigation polygons will be visible when running the game from the editor for debugging purposes.
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

instance NodeMethod SceneTree "set_debug_navigation_hint" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_debug_navigation_hint

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

instance NodeMethod SceneTree "set_edited_scene_root" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_edited_scene_root

{-# NOINLINE bindSceneTree_set_group #-}

-- | Sets the given @property@ to @value@ on all members of the given group.
bindSceneTree_set_group :: MethodBind
bindSceneTree_set_group
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given @property@ to @value@ on all members of the given group.
set_group ::
            (SceneTree :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> GodotVariant -> IO ()
set_group cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_group (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "set_group"
           '[GodotString, GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_group

{-# NOINLINE bindSceneTree_set_group_flags #-}

-- | Sets the given @property@ to @value@ on all members of the given group, respecting the given @enum GroupCallFlags@.
bindSceneTree_set_group_flags :: MethodBind
bindSceneTree_set_group_flags
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_group_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the given @property@ to @value@ on all members of the given group, respecting the given @enum GroupCallFlags@.
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

instance NodeMethod SceneTree "set_group_flags"
           '[Int, GodotString, GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_group_flags

{-# NOINLINE bindSceneTree_set_input_as_handled #-}

-- | Marks the most recent @InputEvent@ as handled.
bindSceneTree_set_input_as_handled :: MethodBind
bindSceneTree_set_input_as_handled
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_input_as_handled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Marks the most recent @InputEvent@ as handled.
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

instance NodeMethod SceneTree "set_input_as_handled" '[] (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_input_as_handled

{-# NOINLINE bindSceneTree_set_multiplayer #-}

-- | The default @MultiplayerAPI@ instance for this @SceneTree@.
bindSceneTree_set_multiplayer :: MethodBind
bindSceneTree_set_multiplayer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_multiplayer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The default @MultiplayerAPI@ instance for this @SceneTree@.
set_multiplayer ::
                  (SceneTree :< cls, Object :< cls) => cls -> MultiplayerAPI -> IO ()
set_multiplayer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_multiplayer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "set_multiplayer" '[MultiplayerAPI]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_multiplayer

{-# NOINLINE bindSceneTree_set_multiplayer_poll_enabled #-}

-- | If @true@ (default value), enables automatic polling of the @MultiplayerAPI@ for this SceneTree during @signal idle_frame@.
--   			If @false@, you need to manually call @method MultiplayerAPI.poll@ to process network packets and deliver RPCs/RSETs. This allows running RPCs/RSETs in a different loop (e.g. physics, thread, specific time step) and for manual @Mutex@ protection when accessing the @MultiplayerAPI@ from threads.
bindSceneTree_set_multiplayer_poll_enabled :: MethodBind
bindSceneTree_set_multiplayer_poll_enabled
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_multiplayer_poll_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ (default value), enables automatic polling of the @MultiplayerAPI@ for this SceneTree during @signal idle_frame@.
--   			If @false@, you need to manually call @method MultiplayerAPI.poll@ to process network packets and deliver RPCs/RSETs. This allows running RPCs/RSETs in a different loop (e.g. physics, thread, specific time step) and for manual @Mutex@ protection when accessing the @MultiplayerAPI@ from threads.
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

instance NodeMethod SceneTree "set_multiplayer_poll_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_multiplayer_poll_enabled

{-# NOINLINE bindSceneTree_set_network_peer #-}

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the @SceneTree@ will become a network server (check with @method is_network_server@) and will set the root node's network mode to master, or it will become a regular peer with the root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to @SceneTree@'s signals.
bindSceneTree_set_network_peer :: MethodBind
bindSceneTree_set_network_peer
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_network_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The peer object to handle the RPC system (effectively enabling networking when set). Depending on the peer itself, the @SceneTree@ will become a network server (check with @method is_network_server@) and will set the root node's network mode to master, or it will become a regular peer with the root node set to puppet. All child nodes are set to inherit the network mode by default. Handling of networking-related events (connection, disconnection, new clients) is done by connecting to @SceneTree@'s signals.
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

instance NodeMethod SceneTree "set_network_peer"
           '[NetworkedMultiplayerPeer]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_network_peer

{-# NOINLINE bindSceneTree_set_pause #-}

-- | If @true@, the @SceneTree@ is paused. Doing so will have the following behavior:
--   			- 2D and 3D physics will be stopped.
--   			- @method Node._process@, @method Node._physics_process@ and @method Node._input@ will not be called anymore in nodes.
bindSceneTree_set_pause :: MethodBind
bindSceneTree_set_pause
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_pause" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @SceneTree@ is paused. Doing so will have the following behavior:
--   			- 2D and 3D physics will be stopped.
--   			- @method Node._process@, @method Node._physics_process@ and @method Node._input@ will not be called anymore in nodes.
set_pause ::
            (SceneTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_pause cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_pause (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "set_pause" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.SceneTree.set_pause

{-# NOINLINE bindSceneTree_set_quit_on_go_back #-}

-- | If @true@, the application quits automatically on going back (e.g. on Android). Enabled by default.
--   				To handle 'Go Back' button when this option is disabled, use @MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST@.
bindSceneTree_set_quit_on_go_back :: MethodBind
bindSceneTree_set_quit_on_go_back
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_quit_on_go_back" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the application quits automatically on going back (e.g. on Android). Enabled by default.
--   				To handle 'Go Back' button when this option is disabled, use @MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST@.
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

instance NodeMethod SceneTree "set_quit_on_go_back" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_quit_on_go_back

{-# NOINLINE bindSceneTree_set_refuse_new_network_connections #-}

-- | If @true@, the @SceneTree@'s @network_peer@ refuses new incoming connections.
bindSceneTree_set_refuse_new_network_connections :: MethodBind
bindSceneTree_set_refuse_new_network_connections
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_refuse_new_network_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @SceneTree@'s @network_peer@ refuses new incoming connections.
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

instance NodeMethod SceneTree "set_refuse_new_network_connections"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.SceneTree.set_refuse_new_network_connections

{-# NOINLINE bindSceneTree_set_screen_stretch #-}

-- | Configures screen stretching to the given @enum StretchMode@, @enum StretchAspect@, minimum size and @shrink@ ratio.
bindSceneTree_set_screen_stretch :: MethodBind
bindSceneTree_set_screen_stretch
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_screen_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Configures screen stretching to the given @enum StretchMode@, @enum StretchAspect@, minimum size and @shrink@ ratio.
set_screen_stretch ::
                     (SceneTree :< cls, Object :< cls) =>
                     cls -> Int -> Int -> Vector2 -> Maybe Float -> IO ()
set_screen_stretch cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantReal (1)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTree_set_screen_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTree "set_screen_stretch"
           '[Int, Int, Vector2, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_screen_stretch

{-# NOINLINE bindSceneTree_set_use_font_oversampling #-}

-- | If @true@, font oversampling is used.
bindSceneTree_set_use_font_oversampling :: MethodBind
bindSceneTree_set_use_font_oversampling
  = unsafePerformIO $
      withCString "SceneTree" $
        \ clsNamePtr ->
          withCString "set_use_font_oversampling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, font oversampling is used.
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

instance NodeMethod SceneTree "set_use_font_oversampling" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SceneTree.set_use_font_oversampling