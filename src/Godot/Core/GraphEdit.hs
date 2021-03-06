{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GraphEdit
       (Godot.Core.GraphEdit.sig__begin_node_move,
        Godot.Core.GraphEdit.sig__end_node_move,
        Godot.Core.GraphEdit.sig_connection_from_empty,
        Godot.Core.GraphEdit.sig_connection_request,
        Godot.Core.GraphEdit.sig_connection_to_empty,
        Godot.Core.GraphEdit.sig_copy_nodes_request,
        Godot.Core.GraphEdit.sig_delete_nodes_request,
        Godot.Core.GraphEdit.sig_disconnection_request,
        Godot.Core.GraphEdit.sig_duplicate_nodes_request,
        Godot.Core.GraphEdit.sig_node_selected,
        Godot.Core.GraphEdit.sig_paste_nodes_request,
        Godot.Core.GraphEdit.sig_popup_request,
        Godot.Core.GraphEdit.sig_scroll_offset_changed,
        Godot.Core.GraphEdit._connections_layer_draw,
        Godot.Core.GraphEdit._graph_node_moved,
        Godot.Core.GraphEdit._graph_node_raised,
        Godot.Core.GraphEdit._gui_input,
        Godot.Core.GraphEdit._scroll_moved,
        Godot.Core.GraphEdit._snap_toggled,
        Godot.Core.GraphEdit._snap_value_changed,
        Godot.Core.GraphEdit._top_layer_draw,
        Godot.Core.GraphEdit._top_layer_input,
        Godot.Core.GraphEdit._update_scroll_offset,
        Godot.Core.GraphEdit._zoom_minus, Godot.Core.GraphEdit._zoom_plus,
        Godot.Core.GraphEdit._zoom_reset,
        Godot.Core.GraphEdit.add_valid_connection_type,
        Godot.Core.GraphEdit.add_valid_left_disconnect_type,
        Godot.Core.GraphEdit.add_valid_right_disconnect_type,
        Godot.Core.GraphEdit.clear_connections,
        Godot.Core.GraphEdit.connect_node,
        Godot.Core.GraphEdit.disconnect_node,
        Godot.Core.GraphEdit.get_connection_list,
        Godot.Core.GraphEdit.get_scroll_ofs, Godot.Core.GraphEdit.get_snap,
        Godot.Core.GraphEdit.get_zoom, Godot.Core.GraphEdit.get_zoom_hbox,
        Godot.Core.GraphEdit.is_node_connected,
        Godot.Core.GraphEdit.is_right_disconnects_enabled,
        Godot.Core.GraphEdit.is_using_snap,
        Godot.Core.GraphEdit.is_valid_connection_type,
        Godot.Core.GraphEdit.remove_valid_connection_type,
        Godot.Core.GraphEdit.remove_valid_left_disconnect_type,
        Godot.Core.GraphEdit.remove_valid_right_disconnect_type,
        Godot.Core.GraphEdit.set_connection_activity,
        Godot.Core.GraphEdit.set_right_disconnects,
        Godot.Core.GraphEdit.set_scroll_ofs,
        Godot.Core.GraphEdit.set_selected, Godot.Core.GraphEdit.set_snap,
        Godot.Core.GraphEdit.set_use_snap, Godot.Core.GraphEdit.set_zoom)
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
import Godot.Core.Control()

-- | Emitted at the beginning of a GraphNode movement.
sig__begin_node_move :: Godot.Internal.Dispatch.Signal GraphEdit
sig__begin_node_move
  = Godot.Internal.Dispatch.Signal "_begin_node_move"

instance NodeSignal GraphEdit "_begin_node_move" '[]

-- | Emitted at the end of a GraphNode movement.
sig__end_node_move :: Godot.Internal.Dispatch.Signal GraphEdit
sig__end_node_move
  = Godot.Internal.Dispatch.Signal "_end_node_move"

instance NodeSignal GraphEdit "_end_node_move" '[]

-- | Emitted when user dragging connection from input port into empty space of the graph.
sig_connection_from_empty ::
                          Godot.Internal.Dispatch.Signal GraphEdit
sig_connection_from_empty
  = Godot.Internal.Dispatch.Signal "connection_from_empty"

instance NodeSignal GraphEdit "connection_from_empty"
           '[GodotString, Int, Vector2]

-- | Emitted to the GraphEdit when the connection between the @from_slot@ slot of the @from@ GraphNode and the @to_slot@ slot of the @to@ GraphNode is attempted to be created.
sig_connection_request :: Godot.Internal.Dispatch.Signal GraphEdit
sig_connection_request
  = Godot.Internal.Dispatch.Signal "connection_request"

instance NodeSignal GraphEdit "connection_request"
           '[GodotString, Int, GodotString, Int]

-- | Emitted when user dragging connection from output port into empty space of the graph.
sig_connection_to_empty :: Godot.Internal.Dispatch.Signal GraphEdit
sig_connection_to_empty
  = Godot.Internal.Dispatch.Signal "connection_to_empty"

instance NodeSignal GraphEdit "connection_to_empty"
           '[GodotString, Int, Vector2]

-- | Emitted when the user presses @Ctrl + C@.
sig_copy_nodes_request :: Godot.Internal.Dispatch.Signal GraphEdit
sig_copy_nodes_request
  = Godot.Internal.Dispatch.Signal "copy_nodes_request"

instance NodeSignal GraphEdit "copy_nodes_request" '[]

-- | Emitted when a GraphNode is attempted to be removed from the GraphEdit.
sig_delete_nodes_request ::
                         Godot.Internal.Dispatch.Signal GraphEdit
sig_delete_nodes_request
  = Godot.Internal.Dispatch.Signal "delete_nodes_request"

instance NodeSignal GraphEdit "delete_nodes_request" '[]

-- | Emitted to the GraphEdit when the connection between @from_slot@ slot of @from@ GraphNode and @to_slot@ slot of @to@ GraphNode is attempted to be removed.
sig_disconnection_request ::
                          Godot.Internal.Dispatch.Signal GraphEdit
sig_disconnection_request
  = Godot.Internal.Dispatch.Signal "disconnection_request"

instance NodeSignal GraphEdit "disconnection_request"
           '[GodotString, Int, GodotString, Int]

-- | Emitted when a GraphNode is attempted to be duplicated in the GraphEdit.
sig_duplicate_nodes_request ::
                            Godot.Internal.Dispatch.Signal GraphEdit
sig_duplicate_nodes_request
  = Godot.Internal.Dispatch.Signal "duplicate_nodes_request"

instance NodeSignal GraphEdit "duplicate_nodes_request" '[]

-- | Emitted when a GraphNode is selected.
sig_node_selected :: Godot.Internal.Dispatch.Signal GraphEdit
sig_node_selected = Godot.Internal.Dispatch.Signal "node_selected"

instance NodeSignal GraphEdit "node_selected" '[Node]

-- | Emitted when the user presses @Ctrl + V@.
sig_paste_nodes_request :: Godot.Internal.Dispatch.Signal GraphEdit
sig_paste_nodes_request
  = Godot.Internal.Dispatch.Signal "paste_nodes_request"

instance NodeSignal GraphEdit "paste_nodes_request" '[]

-- | Emitted when a popup is requested. Happens on right-clicking in the GraphEdit. @position@ is the position of the mouse pointer when the signal is sent.
sig_popup_request :: Godot.Internal.Dispatch.Signal GraphEdit
sig_popup_request = Godot.Internal.Dispatch.Signal "popup_request"

instance NodeSignal GraphEdit "popup_request" '[Vector2]

-- | Emitted when the scroll offset is changed by the user. It will not be emitted when changed in code.
sig_scroll_offset_changed ::
                          Godot.Internal.Dispatch.Signal GraphEdit
sig_scroll_offset_changed
  = Godot.Internal.Dispatch.Signal "scroll_offset_changed"

instance NodeSignal GraphEdit "scroll_offset_changed" '[Vector2]

instance NodeProperty GraphEdit "right_disconnects" Bool 'False
         where
        nodeProperty
          = (is_right_disconnects_enabled,
             wrapDroppingSetter set_right_disconnects, Nothing)

instance NodeProperty GraphEdit "scroll_offset" Vector2 'False
         where
        nodeProperty
          = (get_scroll_ofs, wrapDroppingSetter set_scroll_ofs, Nothing)

instance NodeProperty GraphEdit "snap_distance" Int 'False where
        nodeProperty = (get_snap, wrapDroppingSetter set_snap, Nothing)

instance NodeProperty GraphEdit "use_snap" Bool 'False where
        nodeProperty
          = (is_using_snap, wrapDroppingSetter set_use_snap, Nothing)

instance NodeProperty GraphEdit "zoom" Float 'False where
        nodeProperty = (get_zoom, wrapDroppingSetter set_zoom, Nothing)

{-# NOINLINE bindGraphEdit__connections_layer_draw #-}

bindGraphEdit__connections_layer_draw :: MethodBind
bindGraphEdit__connections_layer_draw
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_connections_layer_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_connections_layer_draw ::
                          (GraphEdit :< cls, Object :< cls) => cls -> IO ()
_connections_layer_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__connections_layer_draw
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_connections_layer_draw" '[] (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit._connections_layer_draw

{-# NOINLINE bindGraphEdit__graph_node_moved #-}

bindGraphEdit__graph_node_moved :: MethodBind
bindGraphEdit__graph_node_moved
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_graph_node_moved" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_graph_node_moved ::
                    (GraphEdit :< cls, Object :< cls) => cls -> Node -> IO ()
_graph_node_moved cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__graph_node_moved (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_graph_node_moved" '[Node] (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit._graph_node_moved

{-# NOINLINE bindGraphEdit__graph_node_raised #-}

bindGraphEdit__graph_node_raised :: MethodBind
bindGraphEdit__graph_node_raised
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_graph_node_raised" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_graph_node_raised ::
                     (GraphEdit :< cls, Object :< cls) => cls -> Node -> IO ()
_graph_node_raised cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__graph_node_raised
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_graph_node_raised" '[Node] (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit._graph_node_raised

{-# NOINLINE bindGraphEdit__gui_input #-}

bindGraphEdit__gui_input :: MethodBind
bindGraphEdit__gui_input
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (GraphEdit :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_gui_input" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit._gui_input

{-# NOINLINE bindGraphEdit__scroll_moved #-}

bindGraphEdit__scroll_moved :: MethodBind
bindGraphEdit__scroll_moved
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_scroll_moved" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_scroll_moved ::
                (GraphEdit :< cls, Object :< cls) => cls -> Float -> IO ()
_scroll_moved cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__scroll_moved (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_scroll_moved" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit._scroll_moved

{-# NOINLINE bindGraphEdit__snap_toggled #-}

bindGraphEdit__snap_toggled :: MethodBind
bindGraphEdit__snap_toggled
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_snap_toggled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_snap_toggled :: (GraphEdit :< cls, Object :< cls) => cls -> IO ()
_snap_toggled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__snap_toggled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_snap_toggled" '[] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit._snap_toggled

{-# NOINLINE bindGraphEdit__snap_value_changed #-}

bindGraphEdit__snap_value_changed :: MethodBind
bindGraphEdit__snap_value_changed
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_snap_value_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_snap_value_changed ::
                      (GraphEdit :< cls, Object :< cls) => cls -> Float -> IO ()
_snap_value_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__snap_value_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_snap_value_changed" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit._snap_value_changed

{-# NOINLINE bindGraphEdit__top_layer_draw #-}

bindGraphEdit__top_layer_draw :: MethodBind
bindGraphEdit__top_layer_draw
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_top_layer_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_top_layer_draw ::
                  (GraphEdit :< cls, Object :< cls) => cls -> IO ()
_top_layer_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__top_layer_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_top_layer_draw" '[] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit._top_layer_draw

{-# NOINLINE bindGraphEdit__top_layer_input #-}

bindGraphEdit__top_layer_input :: MethodBind
bindGraphEdit__top_layer_input
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_top_layer_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_top_layer_input ::
                   (GraphEdit :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_top_layer_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__top_layer_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_top_layer_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit._top_layer_input

{-# NOINLINE bindGraphEdit__update_scroll_offset #-}

bindGraphEdit__update_scroll_offset :: MethodBind
bindGraphEdit__update_scroll_offset
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_update_scroll_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_scroll_offset ::
                        (GraphEdit :< cls, Object :< cls) => cls -> IO ()
_update_scroll_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__update_scroll_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_update_scroll_offset" '[] (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit._update_scroll_offset

{-# NOINLINE bindGraphEdit__zoom_minus #-}

bindGraphEdit__zoom_minus :: MethodBind
bindGraphEdit__zoom_minus
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_zoom_minus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_zoom_minus :: (GraphEdit :< cls, Object :< cls) => cls -> IO ()
_zoom_minus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__zoom_minus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_zoom_minus" '[] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit._zoom_minus

{-# NOINLINE bindGraphEdit__zoom_plus #-}

bindGraphEdit__zoom_plus :: MethodBind
bindGraphEdit__zoom_plus
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_zoom_plus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_zoom_plus :: (GraphEdit :< cls, Object :< cls) => cls -> IO ()
_zoom_plus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__zoom_plus (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_zoom_plus" '[] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit._zoom_plus

{-# NOINLINE bindGraphEdit__zoom_reset #-}

bindGraphEdit__zoom_reset :: MethodBind
bindGraphEdit__zoom_reset
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "_zoom_reset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_zoom_reset :: (GraphEdit :< cls, Object :< cls) => cls -> IO ()
_zoom_reset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit__zoom_reset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "_zoom_reset" '[] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit._zoom_reset

{-# NOINLINE bindGraphEdit_add_valid_connection_type #-}

-- | Makes possible the connection between two different slot types. The type is defined with the @method GraphNode.set_slot@ method.
bindGraphEdit_add_valid_connection_type :: MethodBind
bindGraphEdit_add_valid_connection_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "add_valid_connection_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes possible the connection between two different slot types. The type is defined with the @method GraphNode.set_slot@ method.
add_valid_connection_type ::
                            (GraphEdit :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
add_valid_connection_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_add_valid_connection_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "add_valid_connection_type"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.add_valid_connection_type

{-# NOINLINE bindGraphEdit_add_valid_left_disconnect_type #-}

-- | Makes possible to disconnect nodes when dragging from the slot at the left if it has the specified type.
bindGraphEdit_add_valid_left_disconnect_type :: MethodBind
bindGraphEdit_add_valid_left_disconnect_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "add_valid_left_disconnect_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes possible to disconnect nodes when dragging from the slot at the left if it has the specified type.
add_valid_left_disconnect_type ::
                                 (GraphEdit :< cls, Object :< cls) => cls -> Int -> IO ()
add_valid_left_disconnect_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_add_valid_left_disconnect_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "add_valid_left_disconnect_type"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.add_valid_left_disconnect_type

{-# NOINLINE bindGraphEdit_add_valid_right_disconnect_type #-}

-- | Makes possible to disconnect nodes when dragging from the slot at the right if it has the specified type.
bindGraphEdit_add_valid_right_disconnect_type :: MethodBind
bindGraphEdit_add_valid_right_disconnect_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "add_valid_right_disconnect_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes possible to disconnect nodes when dragging from the slot at the right if it has the specified type.
add_valid_right_disconnect_type ::
                                  (GraphEdit :< cls, Object :< cls) => cls -> Int -> IO ()
add_valid_right_disconnect_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGraphEdit_add_valid_right_disconnect_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "add_valid_right_disconnect_type"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.add_valid_right_disconnect_type

{-# NOINLINE bindGraphEdit_clear_connections #-}

-- | Removes all connections between nodes.
bindGraphEdit_clear_connections :: MethodBind
bindGraphEdit_clear_connections
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "clear_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all connections between nodes.
clear_connections ::
                    (GraphEdit :< cls, Object :< cls) => cls -> IO ()
clear_connections cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_clear_connections (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "clear_connections" '[] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit.clear_connections

{-# NOINLINE bindGraphEdit_connect_node #-}

-- | Create a connection between the @from_port@ slot of the @from@ GraphNode and the @to_port@ slot of the @to@ GraphNode. If the connection already exists, no connection is created.
bindGraphEdit_connect_node :: MethodBind
bindGraphEdit_connect_node
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "connect_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a connection between the @from_port@ slot of the @from@ GraphNode and the @to_port@ slot of the @to@ GraphNode. If the connection already exists, no connection is created.
connect_node ::
               (GraphEdit :< cls, Object :< cls) =>
               cls -> GodotString -> Int -> GodotString -> Int -> IO Int
connect_node cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_connect_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "connect_node"
           '[GodotString, Int, GodotString, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.GraphEdit.connect_node

{-# NOINLINE bindGraphEdit_disconnect_node #-}

-- | Removes the connection between the @from_port@ slot of the @from@ GraphNode and the @to_port@ slot of the @to@ GraphNode. If the connection does not exist, no connection is removed.
bindGraphEdit_disconnect_node :: MethodBind
bindGraphEdit_disconnect_node
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "disconnect_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the connection between the @from_port@ slot of the @from@ GraphNode and the @to_port@ slot of the @to@ GraphNode. If the connection does not exist, no connection is removed.
disconnect_node ::
                  (GraphEdit :< cls, Object :< cls) =>
                  cls -> GodotString -> Int -> GodotString -> Int -> IO ()
disconnect_node cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_disconnect_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "disconnect_node"
           '[GodotString, Int, GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.disconnect_node

{-# NOINLINE bindGraphEdit_get_connection_list #-}

-- | Returns an Array containing the list of connections. A connection consists in a structure of the form @{ from_port: 0, from: "GraphNode name 0", to_port: 1, to: "GraphNode name 1" }@.
bindGraphEdit_get_connection_list :: MethodBind
bindGraphEdit_get_connection_list
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "get_connection_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an Array containing the list of connections. A connection consists in a structure of the form @{ from_port: 0, from: "GraphNode name 0", to_port: 1, to: "GraphNode name 1" }@.
get_connection_list ::
                      (GraphEdit :< cls, Object :< cls) => cls -> IO Array
get_connection_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_get_connection_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "get_connection_list" '[] (IO Array)
         where
        nodeMethod = Godot.Core.GraphEdit.get_connection_list

{-# NOINLINE bindGraphEdit_get_scroll_ofs #-}

-- | The scroll offset.
bindGraphEdit_get_scroll_ofs :: MethodBind
bindGraphEdit_get_scroll_ofs
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "get_scroll_ofs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The scroll offset.
get_scroll_ofs ::
                 (GraphEdit :< cls, Object :< cls) => cls -> IO Vector2
get_scroll_ofs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_get_scroll_ofs (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "get_scroll_ofs" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.GraphEdit.get_scroll_ofs

{-# NOINLINE bindGraphEdit_get_snap #-}

-- | The snapping distance in pixels.
bindGraphEdit_get_snap :: MethodBind
bindGraphEdit_get_snap
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "get_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The snapping distance in pixels.
get_snap :: (GraphEdit :< cls, Object :< cls) => cls -> IO Int
get_snap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_get_snap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "get_snap" '[] (IO Int) where
        nodeMethod = Godot.Core.GraphEdit.get_snap

{-# NOINLINE bindGraphEdit_get_zoom #-}

-- | The current zoom value.
bindGraphEdit_get_zoom :: MethodBind
bindGraphEdit_get_zoom
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "get_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current zoom value.
get_zoom :: (GraphEdit :< cls, Object :< cls) => cls -> IO Float
get_zoom cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_get_zoom (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "get_zoom" '[] (IO Float) where
        nodeMethod = Godot.Core.GraphEdit.get_zoom

{-# NOINLINE bindGraphEdit_get_zoom_hbox #-}

-- | Gets the @HBoxContainer@ that contains the zooming and grid snap controls in the top left of the graph.
--   				Warning: The intended usage of this function is to allow you to reposition or add your own custom controls to the container. This is an internal control and as such should not be freed. If you wish to hide this or any of it's children use their @CanvasItem.visible@ property instead.
bindGraphEdit_get_zoom_hbox :: MethodBind
bindGraphEdit_get_zoom_hbox
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "get_zoom_hbox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the @HBoxContainer@ that contains the zooming and grid snap controls in the top left of the graph.
--   				Warning: The intended usage of this function is to allow you to reposition or add your own custom controls to the container. This is an internal control and as such should not be freed. If you wish to hide this or any of it's children use their @CanvasItem.visible@ property instead.
get_zoom_hbox ::
                (GraphEdit :< cls, Object :< cls) => cls -> IO HBoxContainer
get_zoom_hbox cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_get_zoom_hbox (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "get_zoom_hbox" '[]
           (IO HBoxContainer)
         where
        nodeMethod = Godot.Core.GraphEdit.get_zoom_hbox

{-# NOINLINE bindGraphEdit_is_node_connected #-}

-- | Returns @true@ if the @from_port@ slot of the @from@ GraphNode is connected to the @to_port@ slot of the @to@ GraphNode.
bindGraphEdit_is_node_connected :: MethodBind
bindGraphEdit_is_node_connected
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "is_node_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the @from_port@ slot of the @from@ GraphNode is connected to the @to_port@ slot of the @to@ GraphNode.
is_node_connected ::
                    (GraphEdit :< cls, Object :< cls) =>
                    cls -> GodotString -> Int -> GodotString -> Int -> IO Bool
is_node_connected cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_is_node_connected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "is_node_connected"
           '[GodotString, Int, GodotString, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GraphEdit.is_node_connected

{-# NOINLINE bindGraphEdit_is_right_disconnects_enabled #-}

-- | If @true@, enables disconnection of existing connections in the GraphEdit by dragging the right end.
bindGraphEdit_is_right_disconnects_enabled :: MethodBind
bindGraphEdit_is_right_disconnects_enabled
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "is_right_disconnects_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables disconnection of existing connections in the GraphEdit by dragging the right end.
is_right_disconnects_enabled ::
                               (GraphEdit :< cls, Object :< cls) => cls -> IO Bool
is_right_disconnects_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_is_right_disconnects_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "is_right_disconnects_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GraphEdit.is_right_disconnects_enabled

{-# NOINLINE bindGraphEdit_is_using_snap #-}

-- | If @true@, enables snapping.
bindGraphEdit_is_using_snap :: MethodBind
bindGraphEdit_is_using_snap
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "is_using_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables snapping.
is_using_snap ::
                (GraphEdit :< cls, Object :< cls) => cls -> IO Bool
is_using_snap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_is_using_snap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "is_using_snap" '[] (IO Bool) where
        nodeMethod = Godot.Core.GraphEdit.is_using_snap

{-# NOINLINE bindGraphEdit_is_valid_connection_type #-}

-- | Returns whether it's possible to connect slots of the specified types.
bindGraphEdit_is_valid_connection_type :: MethodBind
bindGraphEdit_is_valid_connection_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "is_valid_connection_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether it's possible to connect slots of the specified types.
is_valid_connection_type ::
                           (GraphEdit :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_valid_connection_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_is_valid_connection_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "is_valid_connection_type"
           '[Int, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GraphEdit.is_valid_connection_type

{-# NOINLINE bindGraphEdit_remove_valid_connection_type #-}

-- | Makes it not possible to connect between two different slot types. The type is defined with the @method GraphNode.set_slot@ method.
bindGraphEdit_remove_valid_connection_type :: MethodBind
bindGraphEdit_remove_valid_connection_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "remove_valid_connection_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes it not possible to connect between two different slot types. The type is defined with the @method GraphNode.set_slot@ method.
remove_valid_connection_type ::
                               (GraphEdit :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
remove_valid_connection_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_remove_valid_connection_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "remove_valid_connection_type"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.remove_valid_connection_type

{-# NOINLINE bindGraphEdit_remove_valid_left_disconnect_type #-}

-- | Removes the possibility to disconnect nodes when dragging from the slot at the left if it has the specified type.
bindGraphEdit_remove_valid_left_disconnect_type :: MethodBind
bindGraphEdit_remove_valid_left_disconnect_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "remove_valid_left_disconnect_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the possibility to disconnect nodes when dragging from the slot at the left if it has the specified type.
remove_valid_left_disconnect_type ::
                                    (GraphEdit :< cls, Object :< cls) => cls -> Int -> IO ()
remove_valid_left_disconnect_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGraphEdit_remove_valid_left_disconnect_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "remove_valid_left_disconnect_type"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.remove_valid_left_disconnect_type

{-# NOINLINE bindGraphEdit_remove_valid_right_disconnect_type #-}

-- | Removes the possibility to disconnect nodes when dragging from the slot at the right if it has the specified type.
bindGraphEdit_remove_valid_right_disconnect_type :: MethodBind
bindGraphEdit_remove_valid_right_disconnect_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "remove_valid_right_disconnect_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the possibility to disconnect nodes when dragging from the slot at the right if it has the specified type.
remove_valid_right_disconnect_type ::
                                     (GraphEdit :< cls, Object :< cls) => cls -> Int -> IO ()
remove_valid_right_disconnect_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGraphEdit_remove_valid_right_disconnect_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "remove_valid_right_disconnect_type"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.GraphEdit.remove_valid_right_disconnect_type

{-# NOINLINE bindGraphEdit_set_connection_activity #-}

-- | Sets the coloration of the connection between @from@'s @from_port@ and @to@'s @to_port@ with the color provided in the @activity@ theme property.
bindGraphEdit_set_connection_activity :: MethodBind
bindGraphEdit_set_connection_activity
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_connection_activity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the coloration of the connection between @from@'s @from_port@ and @to@'s @to_port@ with the color provided in the @activity@ theme property.
set_connection_activity ::
                          (GraphEdit :< cls, Object :< cls) =>
                          cls -> GodotString -> Int -> GodotString -> Int -> Float -> IO ()
set_connection_activity cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_connection_activity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "set_connection_activity"
           '[GodotString, Int, GodotString, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.set_connection_activity

{-# NOINLINE bindGraphEdit_set_right_disconnects #-}

-- | If @true@, enables disconnection of existing connections in the GraphEdit by dragging the right end.
bindGraphEdit_set_right_disconnects :: MethodBind
bindGraphEdit_set_right_disconnects
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_right_disconnects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables disconnection of existing connections in the GraphEdit by dragging the right end.
set_right_disconnects ::
                        (GraphEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_right_disconnects cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_right_disconnects
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "set_right_disconnects" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.set_right_disconnects

{-# NOINLINE bindGraphEdit_set_scroll_ofs #-}

-- | The scroll offset.
bindGraphEdit_set_scroll_ofs :: MethodBind
bindGraphEdit_set_scroll_ofs
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_scroll_ofs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The scroll offset.
set_scroll_ofs ::
                 (GraphEdit :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_scroll_ofs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_scroll_ofs (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "set_scroll_ofs" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.GraphEdit.set_scroll_ofs

{-# NOINLINE bindGraphEdit_set_selected #-}

-- | Sets the specified @node@ as the one selected.
bindGraphEdit_set_selected :: MethodBind
bindGraphEdit_set_selected
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified @node@ as the one selected.
set_selected ::
               (GraphEdit :< cls, Object :< cls) => cls -> Node -> IO ()
set_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "set_selected" '[Node] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit.set_selected

{-# NOINLINE bindGraphEdit_set_snap #-}

-- | The snapping distance in pixels.
bindGraphEdit_set_snap :: MethodBind
bindGraphEdit_set_snap
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The snapping distance in pixels.
set_snap ::
           (GraphEdit :< cls, Object :< cls) => cls -> Int -> IO ()
set_snap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_snap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "set_snap" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit.set_snap

{-# NOINLINE bindGraphEdit_set_use_snap #-}

-- | If @true@, enables snapping.
bindGraphEdit_set_use_snap :: MethodBind
bindGraphEdit_set_use_snap
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_use_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, enables snapping.
set_use_snap ::
               (GraphEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_snap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_use_snap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "set_use_snap" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit.set_use_snap

{-# NOINLINE bindGraphEdit_set_zoom #-}

-- | The current zoom value.
bindGraphEdit_set_zoom :: MethodBind
bindGraphEdit_set_zoom
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current zoom value.
set_zoom ::
           (GraphEdit :< cls, Object :< cls) => cls -> Float -> IO ()
set_zoom cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_zoom (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphEdit "set_zoom" '[Float] (IO ()) where
        nodeMethod = Godot.Core.GraphEdit.set_zoom