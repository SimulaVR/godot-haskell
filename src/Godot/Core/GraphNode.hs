{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GraphNode
       (Godot.Core.GraphNode._OVERLAY_POSITION,
        Godot.Core.GraphNode._OVERLAY_DISABLED,
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Container()

_OVERLAY_POSITION :: Int
_OVERLAY_POSITION = 2

_OVERLAY_DISABLED :: Int
_OVERLAY_DISABLED = 0

_OVERLAY_BREAKPOINT :: Int
_OVERLAY_BREAKPOINT = 1

-- | Emitted when the GraphNode is requested to be closed. Happens on clicking the close button (see @show_close@).
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

-- | Emitted when the GraphNode is requested to be resized. Happens on dragging the resizer handle (see @resizable@).
sig_resize_request :: Godot.Internal.Dispatch.Signal GraphNode
sig_resize_request
  = Godot.Internal.Dispatch.Signal "resize_request"

instance NodeSignal GraphNode "resize_request" '[Vector2]

instance NodeProperty GraphNode "comment" Bool 'False where
        nodeProperty
          = (is_comment, wrapDroppingSetter set_comment, Nothing)

instance NodeProperty GraphNode "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty GraphNode "overlay" Int 'False where
        nodeProperty
          = (get_overlay, wrapDroppingSetter set_overlay, Nothing)

instance NodeProperty GraphNode "resizable" Bool 'False where
        nodeProperty
          = (is_resizable, wrapDroppingSetter set_resizable, Nothing)

instance NodeProperty GraphNode "selected" Bool 'False where
        nodeProperty
          = (is_selected, wrapDroppingSetter set_selected, Nothing)

instance NodeProperty GraphNode "show_close" Bool 'False where
        nodeProperty
          = (is_close_button_visible,
             wrapDroppingSetter set_show_close_button, Nothing)

instance NodeProperty GraphNode "title" GodotString 'False where
        nodeProperty = (get_title, wrapDroppingSetter set_title, Nothing)

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

instance NodeMethod GraphNode "_gui_input" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.GraphNode._gui_input

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

instance NodeMethod GraphNode "clear_all_slots" '[] (IO ()) where
        nodeMethod = Godot.Core.GraphNode.clear_all_slots

{-# NOINLINE bindGraphNode_clear_slot #-}

-- | Disables input and output slot whose index is @idx@.
bindGraphNode_clear_slot :: MethodBind
bindGraphNode_clear_slot
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "clear_slot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables input and output slot whose index is @idx@.
clear_slot ::
             (GraphNode :< cls, Object :< cls) => cls -> Int -> IO ()
clear_slot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_clear_slot (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "clear_slot" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GraphNode.clear_slot

{-# NOINLINE bindGraphNode_get_connection_input_color #-}

-- | Returns the color of the input connection @idx@.
bindGraphNode_get_connection_input_color :: MethodBind
bindGraphNode_get_connection_input_color
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_input_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color of the input connection @idx@.
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

instance NodeMethod GraphNode "get_connection_input_color" '[Int]
           (IO Color)
         where
        nodeMethod = Godot.Core.GraphNode.get_connection_input_color

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

instance NodeMethod GraphNode "get_connection_input_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GraphNode.get_connection_input_count

{-# NOINLINE bindGraphNode_get_connection_input_position #-}

-- | Returns the position of the input connection @idx@.
bindGraphNode_get_connection_input_position :: MethodBind
bindGraphNode_get_connection_input_position
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_input_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the input connection @idx@.
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

instance NodeMethod GraphNode "get_connection_input_position"
           '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.GraphNode.get_connection_input_position

{-# NOINLINE bindGraphNode_get_connection_input_type #-}

-- | Returns the type of the input connection @idx@.
bindGraphNode_get_connection_input_type :: MethodBind
bindGraphNode_get_connection_input_type
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_input_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the type of the input connection @idx@.
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

instance NodeMethod GraphNode "get_connection_input_type" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.GraphNode.get_connection_input_type

{-# NOINLINE bindGraphNode_get_connection_output_color #-}

-- | Returns the color of the output connection @idx@.
bindGraphNode_get_connection_output_color :: MethodBind
bindGraphNode_get_connection_output_color
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_output_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color of the output connection @idx@.
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

instance NodeMethod GraphNode "get_connection_output_color" '[Int]
           (IO Color)
         where
        nodeMethod = Godot.Core.GraphNode.get_connection_output_color

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

instance NodeMethod GraphNode "get_connection_output_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GraphNode.get_connection_output_count

{-# NOINLINE bindGraphNode_get_connection_output_position #-}

-- | Returns the position of the output connection @idx@.
bindGraphNode_get_connection_output_position :: MethodBind
bindGraphNode_get_connection_output_position
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_output_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the output connection @idx@.
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

instance NodeMethod GraphNode "get_connection_output_position"
           '[Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.GraphNode.get_connection_output_position

{-# NOINLINE bindGraphNode_get_connection_output_type #-}

-- | Returns the type of the output connection @idx@.
bindGraphNode_get_connection_output_type :: MethodBind
bindGraphNode_get_connection_output_type
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_connection_output_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the type of the output connection @idx@.
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

instance NodeMethod GraphNode "get_connection_output_type" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.GraphNode.get_connection_output_type

{-# NOINLINE bindGraphNode_get_offset #-}

-- | The offset of the GraphNode, relative to the scroll offset of the @GraphEdit@.
--   			__Note:__ You cannot use position directly, as @GraphEdit@ is a @Container@.
bindGraphNode_get_offset :: MethodBind
bindGraphNode_get_offset
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset of the GraphNode, relative to the scroll offset of the @GraphEdit@.
--   			__Note:__ You cannot use position directly, as @GraphEdit@ is a @Container@.
get_offset ::
             (GraphNode :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "get_offset" '[] (IO Vector2) where
        nodeMethod = Godot.Core.GraphNode.get_offset

{-# NOINLINE bindGraphNode_get_overlay #-}

-- | Sets the overlay shown above the GraphNode. See @enum Overlay@.
bindGraphNode_get_overlay :: MethodBind
bindGraphNode_get_overlay
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_overlay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the overlay shown above the GraphNode. See @enum Overlay@.
get_overlay :: (GraphNode :< cls, Object :< cls) => cls -> IO Int
get_overlay cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_get_overlay (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "get_overlay" '[] (IO Int) where
        nodeMethod = Godot.Core.GraphNode.get_overlay

{-# NOINLINE bindGraphNode_get_slot_color_left #-}

-- | Returns the color set to @idx@ left (input) slot.
bindGraphNode_get_slot_color_left :: MethodBind
bindGraphNode_get_slot_color_left
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_slot_color_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color set to @idx@ left (input) slot.
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

instance NodeMethod GraphNode "get_slot_color_left" '[Int]
           (IO Color)
         where
        nodeMethod = Godot.Core.GraphNode.get_slot_color_left

{-# NOINLINE bindGraphNode_get_slot_color_right #-}

-- | Returns the color set to @idx@ right (output) slot.
bindGraphNode_get_slot_color_right :: MethodBind
bindGraphNode_get_slot_color_right
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_slot_color_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color set to @idx@ right (output) slot.
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

instance NodeMethod GraphNode "get_slot_color_right" '[Int]
           (IO Color)
         where
        nodeMethod = Godot.Core.GraphNode.get_slot_color_right

{-# NOINLINE bindGraphNode_get_slot_type_left #-}

-- | Returns the (integer) type of left (input) @idx@ slot.
bindGraphNode_get_slot_type_left :: MethodBind
bindGraphNode_get_slot_type_left
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_slot_type_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the (integer) type of left (input) @idx@ slot.
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

instance NodeMethod GraphNode "get_slot_type_left" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.GraphNode.get_slot_type_left

{-# NOINLINE bindGraphNode_get_slot_type_right #-}

-- | Returns the (integer) type of right (output) @idx@ slot.
bindGraphNode_get_slot_type_right :: MethodBind
bindGraphNode_get_slot_type_right
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "get_slot_type_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the (integer) type of right (output) @idx@ slot.
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

instance NodeMethod GraphNode "get_slot_type_right" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.GraphNode.get_slot_type_right

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

instance NodeMethod GraphNode "get_title" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.GraphNode.get_title

{-# NOINLINE bindGraphNode_is_close_button_visible #-}

-- | If @true@, the close button will be visible.
--   			__Note:__ Pressing it will only emit the @signal close_request@ signal, the GraphNode needs to be removed manually.
bindGraphNode_is_close_button_visible :: MethodBind
bindGraphNode_is_close_button_visible
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_close_button_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the close button will be visible.
--   			__Note:__ Pressing it will only emit the @signal close_request@ signal, the GraphNode needs to be removed manually.
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

instance NodeMethod GraphNode "is_close_button_visible" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GraphNode.is_close_button_visible

{-# NOINLINE bindGraphNode_is_comment #-}

-- | If @true@, the GraphNode is a comment node.
bindGraphNode_is_comment :: MethodBind
bindGraphNode_is_comment
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_comment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the GraphNode is a comment node.
is_comment :: (GraphNode :< cls, Object :< cls) => cls -> IO Bool
is_comment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_comment (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "is_comment" '[] (IO Bool) where
        nodeMethod = Godot.Core.GraphNode.is_comment

{-# NOINLINE bindGraphNode_is_resizable #-}

-- | If @true@, the user can resize the GraphNode.
--   			__Note:__ Dragging the handle will only emit the @signal resize_request@ signal, the GraphNode needs to be resized manually.
bindGraphNode_is_resizable :: MethodBind
bindGraphNode_is_resizable
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the user can resize the GraphNode.
--   			__Note:__ Dragging the handle will only emit the @signal resize_request@ signal, the GraphNode needs to be resized manually.
is_resizable :: (GraphNode :< cls, Object :< cls) => cls -> IO Bool
is_resizable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "is_resizable" '[] (IO Bool) where
        nodeMethod = Godot.Core.GraphNode.is_resizable

{-# NOINLINE bindGraphNode_is_selected #-}

-- | If @true@, the GraphNode is selected.
bindGraphNode_is_selected :: MethodBind
bindGraphNode_is_selected
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the GraphNode is selected.
is_selected :: (GraphNode :< cls, Object :< cls) => cls -> IO Bool
is_selected cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_is_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "is_selected" '[] (IO Bool) where
        nodeMethod = Godot.Core.GraphNode.is_selected

{-# NOINLINE bindGraphNode_is_slot_enabled_left #-}

-- | Returns @true@ if left (input) slot @idx@ is enabled, @false@ otherwise.
bindGraphNode_is_slot_enabled_left :: MethodBind
bindGraphNode_is_slot_enabled_left
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_slot_enabled_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if left (input) slot @idx@ is enabled, @false@ otherwise.
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

instance NodeMethod GraphNode "is_slot_enabled_left" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GraphNode.is_slot_enabled_left

{-# NOINLINE bindGraphNode_is_slot_enabled_right #-}

-- | Returns @true@ if right (output) slot @idx@ is enabled, @false@ otherwise.
bindGraphNode_is_slot_enabled_right :: MethodBind
bindGraphNode_is_slot_enabled_right
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "is_slot_enabled_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if right (output) slot @idx@ is enabled, @false@ otherwise.
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

instance NodeMethod GraphNode "is_slot_enabled_right" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GraphNode.is_slot_enabled_right

{-# NOINLINE bindGraphNode_set_comment #-}

-- | If @true@, the GraphNode is a comment node.
bindGraphNode_set_comment :: MethodBind
bindGraphNode_set_comment
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_comment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the GraphNode is a comment node.
set_comment ::
              (GraphNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_comment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_comment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "set_comment" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.GraphNode.set_comment

{-# NOINLINE bindGraphNode_set_offset #-}

-- | The offset of the GraphNode, relative to the scroll offset of the @GraphEdit@.
--   			__Note:__ You cannot use position directly, as @GraphEdit@ is a @Container@.
bindGraphNode_set_offset :: MethodBind
bindGraphNode_set_offset
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset of the GraphNode, relative to the scroll offset of the @GraphEdit@.
--   			__Note:__ You cannot use position directly, as @GraphEdit@ is a @Container@.
set_offset ::
             (GraphNode :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "set_offset" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.GraphNode.set_offset

{-# NOINLINE bindGraphNode_set_overlay #-}

-- | Sets the overlay shown above the GraphNode. See @enum Overlay@.
bindGraphNode_set_overlay :: MethodBind
bindGraphNode_set_overlay
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_overlay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the overlay shown above the GraphNode. See @enum Overlay@.
set_overlay ::
              (GraphNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_overlay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_overlay (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "set_overlay" '[Int] (IO ()) where
        nodeMethod = Godot.Core.GraphNode.set_overlay

{-# NOINLINE bindGraphNode_set_resizable #-}

-- | If @true@, the user can resize the GraphNode.
--   			__Note:__ Dragging the handle will only emit the @signal resize_request@ signal, the GraphNode needs to be resized manually.
bindGraphNode_set_resizable :: MethodBind
bindGraphNode_set_resizable
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the user can resize the GraphNode.
--   			__Note:__ Dragging the handle will only emit the @signal resize_request@ signal, the GraphNode needs to be resized manually.
set_resizable ::
                (GraphNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_resizable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "set_resizable" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.GraphNode.set_resizable

{-# NOINLINE bindGraphNode_set_selected #-}

-- | If @true@, the GraphNode is selected.
bindGraphNode_set_selected :: MethodBind
bindGraphNode_set_selected
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_selected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the GraphNode is selected.
set_selected ::
               (GraphNode :< cls, Object :< cls) => cls -> Bool -> IO ()
set_selected cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_selected (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "set_selected" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.GraphNode.set_selected

{-# NOINLINE bindGraphNode_set_show_close_button #-}

-- | If @true@, the close button will be visible.
--   			__Note:__ Pressing it will only emit the @signal close_request@ signal, the GraphNode needs to be removed manually.
bindGraphNode_set_show_close_button :: MethodBind
bindGraphNode_set_show_close_button
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_show_close_button" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the close button will be visible.
--   			__Note:__ Pressing it will only emit the @signal close_request@ signal, the GraphNode needs to be removed manually.
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

instance NodeMethod GraphNode "set_show_close_button" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphNode.set_show_close_button

{-# NOINLINE bindGraphNode_set_slot #-}

-- | Sets properties of the slot with ID @idx@.
--   				If @enable_left@/@right@, a port will appear and the slot will be able to be connected from this side.
--   				@type_left@/@right@ is an arbitrary type of the port. Only ports with the same type values can be connected.
--   				@color_left@/@right@ is the tint of the port's icon on this side.
--   				@custom_left@/@right@ is a custom texture for this side's port.
--   				__Note:__ This method only sets properties of the slot. To create the slot, add a @Control@-derived child to the GraphNode.
bindGraphNode_set_slot :: MethodBind
bindGraphNode_set_slot
  = unsafePerformIO $
      withCString "GraphNode" $
        \ clsNamePtr ->
          withCString "set_slot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets properties of the slot with ID @idx@.
--   				If @enable_left@/@right@, a port will appear and the slot will be able to be connected from this side.
--   				@type_left@/@right@ is an arbitrary type of the port. Only ports with the same type values can be connected.
--   				@color_left@/@right@ is the tint of the port's icon on this side.
--   				@custom_left@/@right@ is a custom texture for this side's port.
--   				__Note:__ This method only sets properties of the slot. To create the slot, add a @Control@-derived child to the GraphNode.
set_slot ::
           (GraphNode :< cls, Object :< cls) =>
           cls ->
             Int ->
               Bool ->
                 Int ->
                   Color ->
                     Bool -> Int -> Color -> Maybe Texture -> Maybe Texture -> IO ()
set_slot cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7,
       maybe VariantNil toVariant arg8, maybe VariantNil toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGraphNode_set_slot (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GraphNode "set_slot"
           '[Int, Bool, Int, Color, Bool, Int, Color, Maybe Texture,
             Maybe Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.GraphNode.set_slot

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

instance NodeMethod GraphNode "set_title" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.GraphNode.set_title