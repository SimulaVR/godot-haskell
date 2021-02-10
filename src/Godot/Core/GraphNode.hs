{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GraphNode
       (Godot.Core.GraphNode._OVERLAY_DISABLED,
        Godot.Core.GraphNode._OVERLAY_POSITION,
        Godot.Core.GraphNode._OVERLAY_BREAKPOINT,
        Godot.Core.GraphNode.sig_close_request,
        Godot.Core.GraphNode.sig_dragged,
        Godot.Core.GraphNode.sig_offset_changed,
        Godot.Core.GraphNode.sig_raise_request,
        Godot.Core.GraphNode.sig_resize_request,
        Godot.Core.GraphNode._gui_input,
        Godot.Core.GraphNode.clear_all_slots,
        Godot.Core.GraphNode.clear_slot,
        Godot.Core.GraphNode.get_connection_input_color,
        Godot.Core.GraphNode.get_connection_input_count,
        Godot.Core.GraphNode.get_connection_input_position,
        Godot.Core.GraphNode.get_connection_input_type,
        Godot.Core.GraphNode.get_connection_output_color,
        Godot.Core.GraphNode.get_connection_output_count,
        Godot.Core.GraphNode.get_connection_output_position,
        Godot.Core.GraphNode.get_connection_output_type,
        Godot.Core.GraphNode.get_offset, Godot.Core.GraphNode.get_overlay,
        Godot.Core.GraphNode.get_slot_color_left,
        Godot.Core.GraphNode.get_slot_color_right,
        Godot.Core.GraphNode.get_slot_type_left,
        Godot.Core.GraphNode.get_slot_type_right,
        Godot.Core.GraphNode.get_title,
        Godot.Core.GraphNode.is_close_button_visible,
        Godot.Core.GraphNode.is_comment, Godot.Core.GraphNode.is_resizable,
        Godot.Core.GraphNode.is_selected,
        Godot.Core.GraphNode.is_slot_enabled_left,
        Godot.Core.GraphNode.is_slot_enabled_right,
        Godot.Core.GraphNode.set_comment, Godot.Core.GraphNode.set_offset,
        Godot.Core.GraphNode.set_overlay,
        Godot.Core.GraphNode.set_resizable,
        Godot.Core.GraphNode.set_selected,
        Godot.Core.GraphNode.set_show_close_button,
        Godot.Core.GraphNode.set_slot, Godot.Core.GraphNode.set_title)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_OVERLAY_DISABLED :: Int
_OVERLAY_DISABLED = 0

_OVERLAY_POSITION :: Int
_OVERLAY_POSITION = 2

_OVERLAY_BREAKPOINT :: Int
_OVERLAY_BREAKPOINT = 1

-- | Emitted when the GraphNode is requested to be closed. Happens on clicking the close button (see [member show_close]).
sig_close_request :: Godot.Internal.Dispatch.Signal GraphNode
sig_close_request = Godot.Internal.Dispatch.Signal "close_request"

instance NodeSignal GraphNode "close_request" '[]

-- | Emitted when the GraphNode is dragged.
sig_dragged :: Godot.Internal.Dispatch.Signal GraphNode
sig_dragged = Godot.Internal.Dispatch.Signal "dragged"

instance NodeSignal GraphNode "dragged" '[Vector2, Vector2]

-- | Emitted when the GraphNode is moved.
sig_offset_changed :: Godot.Internal.Dispatch.Signal GraphNode
sig_offset_changed
  = Godot.Internal.Dispatch.Signal "offset_changed"

instance NodeSignal GraphNode "offset_changed" '[]

-- | Emitted when the GraphNode is requested to be displayed over other ones. Happens on focusing (clicking into) the GraphNode.
sig_raise_request :: Godot.Internal.Dispatch.Signal GraphNode
sig_raise_request = Godot.Internal.Dispatch.Signal "raise_request"

instance NodeSignal GraphNode "raise_request" '[]

-- | Emitted when the GraphNode is requested to be resized. Happens on dragging the resizer handle (see [member resizable]).
sig_resize_request :: Godot.Internal.Dispatch.Signal GraphNode
sig_resize_request
  = Godot.Internal.Dispatch.Signal "resize_request"

instance NodeSignal GraphNode "resize_request" '[Vector2]

{-# NOINLINE bindGraphNode__gui_input #-}

bindGraphNode__gui_input :: MethodBind
bindGraphNode__gui_input
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (GraphNode :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_clear_all_slots #-}

-- | Disables all input and output slots of the GraphNode.
bindGraphNode_clear_all_slots :: MethodBind
bindGraphNode_clear_all_slots
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "clear_all_slots" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables all input and output slots of the GraphNode.
clear_all_slots ::
                  (GraphNode :< cls, Object :< cls) => cls -> IO ()
clear_all_slots cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_clear_all_slots (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_clear_slot #-}

-- | Disables input and output slot whose index is [code]idx[/code].
bindGraphNode_clear_slot :: MethodBind
bindGraphNode_clear_slot
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "clear_slot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables input and output slot whose index is [code]idx[/code].
clear_slot ::
             (GraphNode :< cls, Object :< cls) => cls -> Int -> IO ()
clear_slot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_clear_slot (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_connection_input_color #-}

-- | Returns the color of the input connection [code]idx[/code].
bindGraphNode_get_connection_input_color :: MethodBind
bindGraphNode_get_connection_input_color
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_input_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color of the input connection [code]idx[/code].
get_connection_input_color ::
                             (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Color
get_connection_input_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_connection_input_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_connection_input_count #-}

-- | Returns the number of enabled input slots (connections) to the GraphNode.
bindGraphNode_get_connection_input_count :: MethodBind
bindGraphNode_get_connection_input_count
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_input_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of enabled input slots (connections) to the GraphNode.
get_connection_input_count ::
                             (GraphNode :< cls, Object :< cls) => cls -> IO Int
get_connection_input_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_connection_input_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_connection_input_position #-}

-- | Returns the position of the input connection [code]idx[/code].
bindGraphNode_get_connection_input_position :: MethodBind
bindGraphNode_get_connection_input_position
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_input_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the input connection [code]idx[/code].
get_connection_input_position ::
                                (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_connection_input_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_connection_input_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_connection_input_type #-}

-- | Returns the type of the input connection [code]idx[/code].
bindGraphNode_get_connection_input_type :: MethodBind
bindGraphNode_get_connection_input_type
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_input_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the type of the input connection [code]idx[/code].
get_connection_input_type ::
                            (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Int
get_connection_input_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_connection_input_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_connection_output_color #-}

-- | Returns the color of the output connection [code]idx[/code].
bindGraphNode_get_connection_output_color :: MethodBind
bindGraphNode_get_connection_output_color
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_output_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color of the output connection [code]idx[/code].
get_connection_output_color ::
                              (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Color
get_connection_output_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_connection_output_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_connection_output_count #-}

-- | Returns the number of enabled output slots (connections) of the GraphNode.
bindGraphNode_get_connection_output_count :: MethodBind
bindGraphNode_get_connection_output_count
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_output_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of enabled output slots (connections) of the GraphNode.
get_connection_output_count ::
                              (GraphNode :< cls, Object :< cls) => cls -> IO Int
get_connection_output_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_connection_output_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_connection_output_position #-}

-- | Returns the position of the output connection [code]idx[/code].
bindGraphNode_get_connection_output_position :: MethodBind
bindGraphNode_get_connection_output_position
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_output_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the output connection [code]idx[/code].
get_connection_output_position ::
                                 (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_connection_output_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_connection_output_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_connection_output_type #-}

-- | Returns the type of the output connection [code]idx[/code].
bindGraphNode_get_connection_output_type :: MethodBind
bindGraphNode_get_connection_output_type
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_output_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the type of the output connection [code]idx[/code].
get_connection_output_type ::
                             (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Int
get_connection_output_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_connection_output_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_offset #-}

-- | The offset of the GraphNode, relative to the scroll offset of the [GraphEdit].
--   			[b]Note:[/b] You cannot use position directly, as [GraphEdit] is a [Container].
bindGraphNode_get_offset :: MethodBind
bindGraphNode_get_offset
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset of the GraphNode, relative to the scroll offset of the [GraphEdit].
--   			[b]Note:[/b] You cannot use position directly, as [GraphEdit] is a [Container].
get_offset ::
             (GraphNode :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_overlay #-}

-- | Sets the overlay shown above the GraphNode. See [enum Overlay].
bindGraphNode_get_overlay :: MethodBind
bindGraphNode_get_overlay
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_overlay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the overlay shown above the GraphNode. See [enum Overlay].
get_overlay :: (GraphNode :< cls, Object :< cls) => cls -> IO Int
get_overlay cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_overlay (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_slot_color_left #-}

-- | Returns the color set to [code]idx[/code] left (input) slot.
bindGraphNode_get_slot_color_left :: MethodBind
bindGraphNode_get_slot_color_left
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_slot_color_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color set to [code]idx[/code] left (input) slot.
get_slot_color_left ::
                      (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Color
get_slot_color_left cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_slot_color_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_slot_color_right #-}

-- | Returns the color set to [code]idx[/code] right (output) slot.
bindGraphNode_get_slot_color_right :: MethodBind
bindGraphNode_get_slot_color_right
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_slot_color_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color set to [code]idx[/code] right (output) slot.
get_slot_color_right ::
                       (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Color
get_slot_color_right cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_slot_color_right
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_slot_type_left #-}

-- | Returns the (integer) type of left (input) [code]idx[/code] slot.
bindGraphNode_get_slot_type_left :: MethodBind
bindGraphNode_get_slot_type_left
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_slot_type_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the (integer) type of left (input) [code]idx[/code] slot.
get_slot_type_left ::
                     (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Int
get_slot_type_left cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_slot_type_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_slot_type_right #-}

-- | Returns the (integer) type of right (output) [code]idx[/code] slot.
bindGraphNode_get_slot_type_right :: MethodBind
bindGraphNode_get_slot_type_right
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_slot_type_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the (integer) type of right (output) [code]idx[/code] slot.
get_slot_type_right ::
                      (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Int
get_slot_type_right cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_slot_type_right
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_get_title #-}

-- | The text displayed in the GraphNode's title bar.
bindGraphNode_get_title :: MethodBind
bindGraphNode_get_title
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text displayed in the GraphNode's title bar.
get_title ::
            (GraphNode :< cls, Object :< cls) => cls -> IO GodotString
get_title cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_title (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_is_close_button_visible #-}

-- | If [code]true[/code], the close button will be visible.
--   			[b]Note:[/b] Pressing it will only emit the [signal close_request] signal, the GraphNode needs to be removed manually.
bindGraphNode_is_close_button_visible :: MethodBind
bindGraphNode_is_close_button_visible
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_close_button_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the close button will be visible.
--   			[b]Note:[/b] Pressing it will only emit the [signal close_request] signal, the GraphNode needs to be removed manually.
is_close_button_visible ::
                          (GraphNode :< cls, Object :< cls) => cls -> IO Bool
is_close_button_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_close_button_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_is_comment #-}

-- | If [code]true[/code], the GraphNode is a comment node.
bindGraphNode_is_comment :: MethodBind
bindGraphNode_is_comment
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_comment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the GraphNode is a comment node.
is_comment :: (GraphNode :< cls, Object :< cls) => cls -> IO Bool
is_comment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_comment (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_is_resizable #-}

-- | If [code]true[/code], the user can resize the GraphNode.
--   			[b]Note:[/b] Dragging the handle will only emit the [signal resize_request] signal, the GraphNode needs to be resized manually.
bindGraphNode_is_resizable :: MethodBind
bindGraphNode_is_resizable
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the user can resize the GraphNode.
--   			[b]Note:[/b] Dragging the handle will only emit the [signal resize_request] signal, the GraphNode needs to be resized manually.
is_resizable :: (GraphNode :< cls, Object :< cls) => cls -> IO Bool
is_resizable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_is_selected #-}

-- | If [code]true[/code], the GraphNode is selected.
bindGraphNode_is_selected :: MethodBind
bindGraphNode_is_selected
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the GraphNode is selected.
is_selected :: (GraphNode :< cls, Object :< cls) => cls -> IO Bool
is_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_is_slot_enabled_left #-}

-- | Returns [code]true[/code] if left (input) slot [code]idx[/code] is enabled, [code]false[/code] otherwise.
bindGraphNode_is_slot_enabled_left :: MethodBind
bindGraphNode_is_slot_enabled_left
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_slot_enabled_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if left (input) slot [code]idx[/code] is enabled, [code]false[/code] otherwise.
is_slot_enabled_left ::
                       (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Bool
is_slot_enabled_left cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_slot_enabled_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_is_slot_enabled_right #-}

-- | Returns [code]true[/code] if right (output) slot [code]idx[/code] is enabled, [code]false[/code] otherwise.
bindGraphNode_is_slot_enabled_right :: MethodBind
bindGraphNode_is_slot_enabled_right
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_slot_enabled_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if right (output) slot [code]idx[/code] is enabled, [code]false[/code] otherwise.
is_slot_enabled_right ::
                        (GraphNode :< cls, Object :< cls) => cls -> Int -> IO Bool
is_slot_enabled_right cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_slot_enabled_right
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_set_comment #-}

-- | If [code]true[/code], the GraphNode is a comment node.
bindGraphNode_set_comment :: MethodBind
bindGraphNode_set_comment
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_comment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the GraphNode is a comment node.
set_comment ::
              (GraphNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_comment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_comment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_set_offset #-}

-- | The offset of the GraphNode, relative to the scroll offset of the [GraphEdit].
--   			[b]Note:[/b] You cannot use position directly, as [GraphEdit] is a [Container].
bindGraphNode_set_offset :: MethodBind
bindGraphNode_set_offset
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset of the GraphNode, relative to the scroll offset of the [GraphEdit].
--   			[b]Note:[/b] You cannot use position directly, as [GraphEdit] is a [Container].
set_offset ::
             (GraphNode :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_set_overlay #-}

-- | Sets the overlay shown above the GraphNode. See [enum Overlay].
bindGraphNode_set_overlay :: MethodBind
bindGraphNode_set_overlay
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_overlay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the overlay shown above the GraphNode. See [enum Overlay].
set_overlay ::
              (GraphNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_overlay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_overlay (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_set_resizable #-}

-- | If [code]true[/code], the user can resize the GraphNode.
--   			[b]Note:[/b] Dragging the handle will only emit the [signal resize_request] signal, the GraphNode needs to be resized manually.
bindGraphNode_set_resizable :: MethodBind
bindGraphNode_set_resizable
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the user can resize the GraphNode.
--   			[b]Note:[/b] Dragging the handle will only emit the [signal resize_request] signal, the GraphNode needs to be resized manually.
set_resizable ::
                (GraphNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_resizable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_set_selected #-}

-- | If [code]true[/code], the GraphNode is selected.
bindGraphNode_set_selected :: MethodBind
bindGraphNode_set_selected
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the GraphNode is selected.
set_selected ::
               (GraphNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_set_show_close_button #-}

-- | If [code]true[/code], the close button will be visible.
--   			[b]Note:[/b] Pressing it will only emit the [signal close_request] signal, the GraphNode needs to be removed manually.
bindGraphNode_set_show_close_button :: MethodBind
bindGraphNode_set_show_close_button
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_show_close_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the close button will be visible.
--   			[b]Note:[/b] Pressing it will only emit the [signal close_request] signal, the GraphNode needs to be removed manually.
set_show_close_button ::
                        (GraphNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_show_close_button cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_show_close_button
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_set_slot #-}

-- | Sets properties of the slot with ID [code]idx[/code].
--   				If [code]enable_left[/code]/[code]right[/code], a port will appear and the slot will be able to be connected from this side.
--   				[code]type_left[/code]/[code]right[/code] is an arbitrary type of the port. Only ports with the same type values can be connected.
--   				[code]color_left[/code]/[code]right[/code] is the tint of the port's icon on this side.
--   				[code]custom_left[/code]/[code]right[/code] is a custom texture for this side's port.
--   				[b]Note:[/b] This method only sets properties of the slot. To create the slot, add a [Control]-derived child to the GraphNode.
bindGraphNode_set_slot :: MethodBind
bindGraphNode_set_slot
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_slot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets properties of the slot with ID [code]idx[/code].
--   				If [code]enable_left[/code]/[code]right[/code], a port will appear and the slot will be able to be connected from this side.
--   				[code]type_left[/code]/[code]right[/code] is an arbitrary type of the port. Only ports with the same type values can be connected.
--   				[code]color_left[/code]/[code]right[/code] is the tint of the port's icon on this side.
--   				[code]custom_left[/code]/[code]right[/code] is a custom texture for this side's port.
--   				[b]Note:[/b] This method only sets properties of the slot. To create the slot, add a [Control]-derived child to the GraphNode.
set_slot ::
           (GraphNode :< cls, Object :< cls) =>
           cls ->
             Int ->
               Bool ->
                 Int -> Color -> Bool -> Int -> Color -> Texture -> Texture -> IO ()
set_slot cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_slot (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGraphNode_set_title #-}

-- | The text displayed in the GraphNode's title bar.
bindGraphNode_set_title :: MethodBind
bindGraphNode_set_title
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text displayed in the GraphNode's title bar.
set_title ::
            (GraphNode :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_title (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)