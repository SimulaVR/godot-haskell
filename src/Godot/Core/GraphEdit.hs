{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Signal sent at the beginning of a GraphNode movement.
sig__begin_node_move :: Godot.Internal.Dispatch.Signal GraphEdit
sig__begin_node_move
  = Godot.Internal.Dispatch.Signal "_begin_node_move"

-- | Signal sent at the end of a GraphNode movement.
sig__end_node_move :: Godot.Internal.Dispatch.Signal GraphEdit
sig__end_node_move
  = Godot.Internal.Dispatch.Signal "_end_node_move"

sig_connection_from_empty ::
                          Godot.Internal.Dispatch.Signal GraphEdit
sig_connection_from_empty
  = Godot.Internal.Dispatch.Signal "connection_from_empty"

-- | Signal sent to the GraphEdit when the connection between 'from_slot' slot of 'from' GraphNode and 'to_slot' slot of 'to' GraphNode is attempted to be created.
sig_connection_request :: Godot.Internal.Dispatch.Signal GraphEdit
sig_connection_request
  = Godot.Internal.Dispatch.Signal "connection_request"

sig_connection_to_empty :: Godot.Internal.Dispatch.Signal GraphEdit
sig_connection_to_empty
  = Godot.Internal.Dispatch.Signal "connection_to_empty"

sig_copy_nodes_request :: Godot.Internal.Dispatch.Signal GraphEdit
sig_copy_nodes_request
  = Godot.Internal.Dispatch.Signal "copy_nodes_request"

-- | Signal sent when a GraphNode is attempted to be removed from the GraphEdit.
sig_delete_nodes_request ::
                         Godot.Internal.Dispatch.Signal GraphEdit
sig_delete_nodes_request
  = Godot.Internal.Dispatch.Signal "delete_nodes_request"

-- | Signal sent to the GraphEdit when the connection between 'from_slot' slot of 'from' GraphNode and 'to_slot' slot of 'to' GraphNode is attempted to be removed.
sig_disconnection_request ::
                          Godot.Internal.Dispatch.Signal GraphEdit
sig_disconnection_request
  = Godot.Internal.Dispatch.Signal "disconnection_request"

-- | Signal sent when a GraphNode is attempted to be duplicated in the GraphEdit.
sig_duplicate_nodes_request ::
                            Godot.Internal.Dispatch.Signal GraphEdit
sig_duplicate_nodes_request
  = Godot.Internal.Dispatch.Signal "duplicate_nodes_request"

-- | Emitted when a GraphNode is selected.
sig_node_selected :: Godot.Internal.Dispatch.Signal GraphEdit
sig_node_selected = Godot.Internal.Dispatch.Signal "node_selected"

sig_paste_nodes_request :: Godot.Internal.Dispatch.Signal GraphEdit
sig_paste_nodes_request
  = Godot.Internal.Dispatch.Signal "paste_nodes_request"

-- | Signal sent when a popup is requested. Happens on right-clicking in the GraphEdit. 'p_position' is the position of the mouse pointer when the signal is sent.
sig_popup_request :: Godot.Internal.Dispatch.Signal GraphEdit
sig_popup_request = Godot.Internal.Dispatch.Signal "popup_request"

sig_scroll_offset_changed ::
                          Godot.Internal.Dispatch.Signal GraphEdit
sig_scroll_offset_changed
  = Godot.Internal.Dispatch.Signal "scroll_offset_changed"

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

{-# NOINLINE bindGraphEdit_add_valid_connection_type #-}

-- | Makes possible the connection between two different slot types. The type is defined with the [method GraphNode.set_slot] method.
bindGraphEdit_add_valid_connection_type :: MethodBind
bindGraphEdit_add_valid_connection_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "add_valid_connection_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes possible the connection between two different slot types. The type is defined with the [method GraphNode.set_slot] method.
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

{-# NOINLINE bindGraphEdit_clear_connections #-}

-- | Remove all connections between nodes.
bindGraphEdit_clear_connections :: MethodBind
bindGraphEdit_clear_connections
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "clear_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove all connections between nodes.
clear_connections ::
                    (GraphEdit :< cls, Object :< cls) => cls -> IO ()
clear_connections cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_clear_connections (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphEdit_connect_node #-}

-- | Create a connection between 'from_port' slot of 'from' GraphNode and 'to_port' slot of 'to' GraphNode. If the connection already exists, no connection is created.
bindGraphEdit_connect_node :: MethodBind
bindGraphEdit_connect_node
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "connect_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a connection between 'from_port' slot of 'from' GraphNode and 'to_port' slot of 'to' GraphNode. If the connection already exists, no connection is created.
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

{-# NOINLINE bindGraphEdit_disconnect_node #-}

-- | Remove the connection between 'from_port' slot of 'from' GraphNode and 'to_port' slot of 'to' GraphNode, if connection exists.
bindGraphEdit_disconnect_node :: MethodBind
bindGraphEdit_disconnect_node
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "disconnect_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove the connection between 'from_port' slot of 'from' GraphNode and 'to_port' slot of 'to' GraphNode, if connection exists.
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

{-# NOINLINE bindGraphEdit_get_connection_list #-}

-- | Returns an Array containing the list of connections. A connection consists in a structure of the form {from_port: 0, from: "GraphNode name 0", to_port: 1, to: "GraphNode name 1" }
bindGraphEdit_get_connection_list :: MethodBind
bindGraphEdit_get_connection_list
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "get_connection_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an Array containing the list of connections. A connection consists in a structure of the form {from_port: 0, from: "GraphNode name 0", to_port: 1, to: "GraphNode name 1" }
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

{-# NOINLINE bindGraphEdit_get_zoom_hbox #-}

bindGraphEdit_get_zoom_hbox :: MethodBind
bindGraphEdit_get_zoom_hbox
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "get_zoom_hbox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_zoom_hbox ::
                (GraphEdit :< cls, Object :< cls) => cls -> IO HBoxContainer
get_zoom_hbox cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_get_zoom_hbox (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphEdit_is_node_connected #-}

-- | Returns [code]true[/code] if the 'from_port' slot of 'from' GraphNode is connected to the 'to_port' slot of 'to' GraphNode.
bindGraphEdit_is_node_connected :: MethodBind
bindGraphEdit_is_node_connected
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "is_node_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the 'from_port' slot of 'from' GraphNode is connected to the 'to_port' slot of 'to' GraphNode.
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

{-# NOINLINE bindGraphEdit_is_right_disconnects_enabled #-}

-- | If [code]true[/code], enables disconnection of existing connections in the GraphEdit by dragging the right end.
bindGraphEdit_is_right_disconnects_enabled :: MethodBind
bindGraphEdit_is_right_disconnects_enabled
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "is_right_disconnects_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables disconnection of existing connections in the GraphEdit by dragging the right end.
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

{-# NOINLINE bindGraphEdit_is_using_snap #-}

-- | If [code]true[/code], enables snapping.
bindGraphEdit_is_using_snap :: MethodBind
bindGraphEdit_is_using_snap
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "is_using_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables snapping.
is_using_snap ::
                (GraphEdit :< cls, Object :< cls) => cls -> IO Bool
is_using_snap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_is_using_snap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindGraphEdit_remove_valid_connection_type #-}

-- | Makes it not possible to connect between two different slot types. The type is defined with the [method GraphNode.set_slot] method.
bindGraphEdit_remove_valid_connection_type :: MethodBind
bindGraphEdit_remove_valid_connection_type
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "remove_valid_connection_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes it not possible to connect between two different slot types. The type is defined with the [method GraphNode.set_slot] method.
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

{-# NOINLINE bindGraphEdit_set_connection_activity #-}

bindGraphEdit_set_connection_activity :: MethodBind
bindGraphEdit_set_connection_activity
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_connection_activity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindGraphEdit_set_right_disconnects #-}

-- | If [code]true[/code], enables disconnection of existing connections in the GraphEdit by dragging the right end.
bindGraphEdit_set_right_disconnects :: MethodBind
bindGraphEdit_set_right_disconnects
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_right_disconnects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables disconnection of existing connections in the GraphEdit by dragging the right end.
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

{-# NOINLINE bindGraphEdit_set_selected #-}

-- | Sets the specified [code]node[/code] as the one selected.
bindGraphEdit_set_selected :: MethodBind
bindGraphEdit_set_selected
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified [code]node[/code] as the one selected.
set_selected ::
               (GraphEdit :< cls, Object :< cls) => cls -> Node -> IO ()
set_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindGraphEdit_set_use_snap #-}

-- | If [code]true[/code], enables snapping.
bindGraphEdit_set_use_snap :: MethodBind
bindGraphEdit_set_use_snap
  = unsafePerformIO $
      withCString "GraphEdit" $
        \ clsNamePtr ->
          withCString "set_use_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], enables snapping.
set_use_snap ::
               (GraphEdit :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_snap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphEdit_set_use_snap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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