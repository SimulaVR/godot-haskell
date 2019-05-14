{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CanvasItem
       (Godot.Core.CanvasItem._BLEND_MODE_DISABLED,
        Godot.Core.CanvasItem._NOTIFICATION_EXIT_CANVAS,
        Godot.Core.CanvasItem._NOTIFICATION_ENTER_CANVAS,
        Godot.Core.CanvasItem._NOTIFICATION_TRANSFORM_CHANGED,
        Godot.Core.CanvasItem._BLEND_MODE_ADD,
        Godot.Core.CanvasItem._BLEND_MODE_MIX,
        Godot.Core.CanvasItem._NOTIFICATION_DRAW,
        Godot.Core.CanvasItem._BLEND_MODE_MUL,
        Godot.Core.CanvasItem._BLEND_MODE_PREMULT_ALPHA,
        Godot.Core.CanvasItem._BLEND_MODE_SUB,
        Godot.Core.CanvasItem._NOTIFICATION_VISIBILITY_CHANGED,
        Godot.Core.CanvasItem.sig_item_rect_changed,
        Godot.Core.CanvasItem.sig_draw,
        Godot.Core.CanvasItem.sig_visibility_changed,
        Godot.Core.CanvasItem.sig_hide, Godot.Core.CanvasItem._draw,
        Godot.Core.CanvasItem._toplevel_raise_self,
        Godot.Core.CanvasItem._update_callback,
        Godot.Core.CanvasItem._edit_set_state,
        Godot.Core.CanvasItem._edit_get_state,
        Godot.Core.CanvasItem._edit_set_position,
        Godot.Core.CanvasItem._edit_get_position,
        Godot.Core.CanvasItem._edit_set_scale,
        Godot.Core.CanvasItem._edit_get_scale,
        Godot.Core.CanvasItem._edit_set_rect,
        Godot.Core.CanvasItem._edit_get_rect,
        Godot.Core.CanvasItem._edit_use_rect,
        Godot.Core.CanvasItem._edit_set_rotation,
        Godot.Core.CanvasItem._edit_get_rotation,
        Godot.Core.CanvasItem._edit_use_rotation,
        Godot.Core.CanvasItem._edit_set_pivot,
        Godot.Core.CanvasItem._edit_get_pivot,
        Godot.Core.CanvasItem._edit_use_pivot,
        Godot.Core.CanvasItem.get_canvas_item,
        Godot.Core.CanvasItem.set_visible,
        Godot.Core.CanvasItem.is_visible,
        Godot.Core.CanvasItem.is_visible_in_tree,
        Godot.Core.CanvasItem.show, Godot.Core.CanvasItem.hide,
        Godot.Core.CanvasItem.update,
        Godot.Core.CanvasItem.set_as_toplevel,
        Godot.Core.CanvasItem.is_set_as_toplevel,
        Godot.Core.CanvasItem.set_light_mask,
        Godot.Core.CanvasItem.get_light_mask,
        Godot.Core.CanvasItem.set_modulate,
        Godot.Core.CanvasItem.get_modulate,
        Godot.Core.CanvasItem.set_self_modulate,
        Godot.Core.CanvasItem.get_self_modulate,
        Godot.Core.CanvasItem.set_draw_behind_parent,
        Godot.Core.CanvasItem.is_draw_behind_parent_enabled,
        Godot.Core.CanvasItem._set_on_top,
        Godot.Core.CanvasItem._is_on_top, Godot.Core.CanvasItem.draw_line,
        Godot.Core.CanvasItem.draw_polyline,
        Godot.Core.CanvasItem.draw_polyline_colors,
        Godot.Core.CanvasItem.draw_multiline,
        Godot.Core.CanvasItem.draw_multiline_colors,
        Godot.Core.CanvasItem.draw_rect, Godot.Core.CanvasItem.draw_circle,
        Godot.Core.CanvasItem.draw_texture,
        Godot.Core.CanvasItem.draw_texture_rect,
        Godot.Core.CanvasItem.draw_texture_rect_region,
        Godot.Core.CanvasItem.draw_style_box,
        Godot.Core.CanvasItem.draw_primitive,
        Godot.Core.CanvasItem.draw_polygon,
        Godot.Core.CanvasItem.draw_colored_polygon,
        Godot.Core.CanvasItem.draw_string, Godot.Core.CanvasItem.draw_char,
        Godot.Core.CanvasItem.draw_mesh,
        Godot.Core.CanvasItem.draw_multimesh,
        Godot.Core.CanvasItem.draw_set_transform,
        Godot.Core.CanvasItem.draw_set_transform_matrix,
        Godot.Core.CanvasItem.get_transform,
        Godot.Core.CanvasItem.get_global_transform,
        Godot.Core.CanvasItem.get_global_transform_with_canvas,
        Godot.Core.CanvasItem.get_viewport_transform,
        Godot.Core.CanvasItem.get_viewport_rect,
        Godot.Core.CanvasItem.get_canvas_transform,
        Godot.Core.CanvasItem.get_local_mouse_position,
        Godot.Core.CanvasItem.get_global_mouse_position,
        Godot.Core.CanvasItem.get_canvas,
        Godot.Core.CanvasItem.get_world_2d,
        Godot.Core.CanvasItem.set_material,
        Godot.Core.CanvasItem.get_material,
        Godot.Core.CanvasItem.set_use_parent_material,
        Godot.Core.CanvasItem.get_use_parent_material,
        Godot.Core.CanvasItem.set_notify_local_transform,
        Godot.Core.CanvasItem.is_local_transform_notification_enabled,
        Godot.Core.CanvasItem.set_notify_transform,
        Godot.Core.CanvasItem.is_transform_notification_enabled,
        Godot.Core.CanvasItem.force_update_transform,
        Godot.Core.CanvasItem.make_canvas_position_local,
        Godot.Core.CanvasItem.make_input_local)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_BLEND_MODE_DISABLED :: Int
_BLEND_MODE_DISABLED = 5

_NOTIFICATION_EXIT_CANVAS :: Int
_NOTIFICATION_EXIT_CANVAS = 33

_NOTIFICATION_ENTER_CANVAS :: Int
_NOTIFICATION_ENTER_CANVAS = 32

_NOTIFICATION_TRANSFORM_CHANGED :: Int
_NOTIFICATION_TRANSFORM_CHANGED = 29

_BLEND_MODE_ADD :: Int
_BLEND_MODE_ADD = 1

_BLEND_MODE_MIX :: Int
_BLEND_MODE_MIX = 0

_NOTIFICATION_DRAW :: Int
_NOTIFICATION_DRAW = 30

_BLEND_MODE_MUL :: Int
_BLEND_MODE_MUL = 3

_BLEND_MODE_PREMULT_ALPHA :: Int
_BLEND_MODE_PREMULT_ALPHA = 4

_BLEND_MODE_SUB :: Int
_BLEND_MODE_SUB = 2

_NOTIFICATION_VISIBILITY_CHANGED :: Int
_NOTIFICATION_VISIBILITY_CHANGED = 31

-- | Emitted when the item rect has changed.
sig_item_rect_changed :: Godot.Internal.Dispatch.Signal CanvasItem
sig_item_rect_changed
  = Godot.Internal.Dispatch.Signal "item_rect_changed"

-- | Emitted when the CanvasItem must redraw. This can only be connected realtime, as deferred will not allow drawing.
sig_draw :: Godot.Internal.Dispatch.Signal CanvasItem
sig_draw = Godot.Internal.Dispatch.Signal "draw"

-- | Emitted when the visibility (hidden/visible) changes.
sig_visibility_changed :: Godot.Internal.Dispatch.Signal CanvasItem
sig_visibility_changed
  = Godot.Internal.Dispatch.Signal "visibility_changed"

-- | Emitted when becoming hidden.
sig_hide :: Godot.Internal.Dispatch.Signal CanvasItem
sig_hide = Godot.Internal.Dispatch.Signal "hide"

{-# NOINLINE bindCanvasItem__draw #-}

-- | Called (if exists) to draw the canvas item.
bindCanvasItem__draw :: MethodBind
bindCanvasItem__draw
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called (if exists) to draw the canvas item.
_draw :: (CanvasItem :< cls, Object :< cls) => cls -> IO ()
_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__draw (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__toplevel_raise_self #-}

bindCanvasItem__toplevel_raise_self :: MethodBind
bindCanvasItem__toplevel_raise_self
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_toplevel_raise_self" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_toplevel_raise_self ::
                       (CanvasItem :< cls, Object :< cls) => cls -> IO ()
_toplevel_raise_self cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__toplevel_raise_self
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__update_callback #-}

bindCanvasItem__update_callback :: MethodBind
bindCanvasItem__update_callback
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_update_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_callback ::
                   (CanvasItem :< cls, Object :< cls) => cls -> IO ()
_update_callback cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__update_callback (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_set_state #-}

bindCanvasItem__edit_set_state :: MethodBind
bindCanvasItem__edit_set_state
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_set_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_set_state ::
                  (CanvasItem :< cls, Object :< cls) => cls -> Dictionary -> IO ()
_edit_set_state cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_set_state (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_get_state #-}

bindCanvasItem__edit_get_state :: MethodBind
bindCanvasItem__edit_get_state
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_get_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_get_state ::
                  (CanvasItem :< cls, Object :< cls) => cls -> IO Dictionary
_edit_get_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_get_state (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_set_position #-}

bindCanvasItem__edit_set_position :: MethodBind
bindCanvasItem__edit_set_position
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_set_position ::
                     (CanvasItem :< cls, Object :< cls) => cls -> Vector2 -> IO ()
_edit_set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_set_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_get_position #-}

bindCanvasItem__edit_get_position :: MethodBind
bindCanvasItem__edit_get_position
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_get_position ::
                     (CanvasItem :< cls, Object :< cls) => cls -> IO Vector2
_edit_get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_set_scale #-}

bindCanvasItem__edit_set_scale :: MethodBind
bindCanvasItem__edit_set_scale
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_set_scale ::
                  (CanvasItem :< cls, Object :< cls) => cls -> Vector2 -> IO ()
_edit_set_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_set_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_get_scale #-}

bindCanvasItem__edit_get_scale :: MethodBind
bindCanvasItem__edit_get_scale
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_get_scale ::
                  (CanvasItem :< cls, Object :< cls) => cls -> IO Vector2
_edit_get_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_get_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_set_rect #-}

bindCanvasItem__edit_set_rect :: MethodBind
bindCanvasItem__edit_set_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_set_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_set_rect ::
                 (CanvasItem :< cls, Object :< cls) => cls -> Rect2 -> IO ()
_edit_set_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_set_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_get_rect #-}

bindCanvasItem__edit_get_rect :: MethodBind
bindCanvasItem__edit_get_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_get_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_get_rect ::
                 (CanvasItem :< cls, Object :< cls) => cls -> IO Rect2
_edit_get_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_get_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_use_rect #-}

bindCanvasItem__edit_use_rect :: MethodBind
bindCanvasItem__edit_use_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_use_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_use_rect ::
                 (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
_edit_use_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_use_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_set_rotation #-}

bindCanvasItem__edit_set_rotation :: MethodBind
bindCanvasItem__edit_set_rotation
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_set_rotation ::
                     (CanvasItem :< cls, Object :< cls) => cls -> Float -> IO ()
_edit_set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_set_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_get_rotation #-}

bindCanvasItem__edit_get_rotation :: MethodBind
bindCanvasItem__edit_get_rotation
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_get_rotation ::
                     (CanvasItem :< cls, Object :< cls) => cls -> IO Float
_edit_get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_get_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_use_rotation #-}

bindCanvasItem__edit_use_rotation :: MethodBind
bindCanvasItem__edit_use_rotation
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_use_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_use_rotation ::
                     (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
_edit_use_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_use_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_set_pivot #-}

bindCanvasItem__edit_set_pivot :: MethodBind
bindCanvasItem__edit_set_pivot
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_set_pivot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_set_pivot ::
                  (CanvasItem :< cls, Object :< cls) => cls -> Vector2 -> IO ()
_edit_set_pivot cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_set_pivot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_get_pivot #-}

bindCanvasItem__edit_get_pivot :: MethodBind
bindCanvasItem__edit_get_pivot
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_get_pivot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_get_pivot ::
                  (CanvasItem :< cls, Object :< cls) => cls -> IO Vector2
_edit_get_pivot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_get_pivot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__edit_use_pivot #-}

bindCanvasItem__edit_use_pivot :: MethodBind
bindCanvasItem__edit_use_pivot
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_use_pivot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_use_pivot ::
                  (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
_edit_use_pivot cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_use_pivot (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_canvas_item #-}

-- | Return the canvas item RID used by [VisualServer] for this item.
bindCanvasItem_get_canvas_item :: MethodBind
bindCanvasItem_get_canvas_item
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_canvas_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the canvas item RID used by [VisualServer] for this item.
get_canvas_item ::
                  (CanvasItem :< cls, Object :< cls) => cls -> IO Rid
get_canvas_item cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_canvas_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_visible #-}

-- | If [code]true[/code], this [code]CanvasItem[/code] is drawn. Default value: [code]true[/code]. For controls that inherit [Popup], the correct way to make them visible is to call one of the multiple popup*() functions instead.
bindCanvasItem_set_visible :: MethodBind
bindCanvasItem_set_visible
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this [code]CanvasItem[/code] is drawn. Default value: [code]true[/code]. For controls that inherit [Popup], the correct way to make them visible is to call one of the multiple popup*() functions instead.
set_visible ::
              (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_is_visible #-}

-- | If [code]true[/code], this [code]CanvasItem[/code] is drawn. Default value: [code]true[/code]. For controls that inherit [Popup], the correct way to make them visible is to call one of the multiple popup*() functions instead.
bindCanvasItem_is_visible :: MethodBind
bindCanvasItem_is_visible
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this [code]CanvasItem[/code] is drawn. Default value: [code]true[/code]. For controls that inherit [Popup], the correct way to make them visible is to call one of the multiple popup*() functions instead.
is_visible :: (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_is_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_is_visible_in_tree #-}

-- | Returns [code]true[/code] if the node is present in the [SceneTree], its [member visible] property is [code]true[/code] and its inherited visibility is also [code]true[/code].
bindCanvasItem_is_visible_in_tree :: MethodBind
bindCanvasItem_is_visible_in_tree
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_visible_in_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the node is present in the [SceneTree], its [member visible] property is [code]true[/code] and its inherited visibility is also [code]true[/code].
is_visible_in_tree ::
                     (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
is_visible_in_tree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_is_visible_in_tree
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_show #-}

-- | Show the CanvasItem currently hidden. For controls that inherit [Popup], the correct way to make them visible is to call one of the multiple popup*() functions instead.
bindCanvasItem_show :: MethodBind
bindCanvasItem_show
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "show" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Show the CanvasItem currently hidden. For controls that inherit [Popup], the correct way to make them visible is to call one of the multiple popup*() functions instead.
show :: (CanvasItem :< cls, Object :< cls) => cls -> IO ()
show cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_show (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_hide #-}

-- | Hide the CanvasItem currently visible.
bindCanvasItem_hide :: MethodBind
bindCanvasItem_hide
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "hide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Hide the CanvasItem currently visible.
hide :: (CanvasItem :< cls, Object :< cls) => cls -> IO ()
hide cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_hide (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_update #-}

-- | Queue the CanvasItem for update. [code]NOTIFICATION_DRAW[/code] will be called on idle time to request redraw.
bindCanvasItem_update :: MethodBind
bindCanvasItem_update
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queue the CanvasItem for update. [code]NOTIFICATION_DRAW[/code] will be called on idle time to request redraw.
update :: (CanvasItem :< cls, Object :< cls) => cls -> IO ()
update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_update (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_as_toplevel #-}

-- | Sets as top level. This means that it will not inherit transform from parent canvas items.
bindCanvasItem_set_as_toplevel :: MethodBind
bindCanvasItem_set_as_toplevel
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_as_toplevel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets as top level. This means that it will not inherit transform from parent canvas items.
set_as_toplevel ::
                  (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_as_toplevel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_as_toplevel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_is_set_as_toplevel #-}

-- | Return if set as toplevel. See [method set_as_toplevel].
bindCanvasItem_is_set_as_toplevel :: MethodBind
bindCanvasItem_is_set_as_toplevel
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_set_as_toplevel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return if set as toplevel. See [method set_as_toplevel].
is_set_as_toplevel ::
                     (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
is_set_as_toplevel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_is_set_as_toplevel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_light_mask #-}

-- | The rendering layers in which this [code]CanvasItem[/code] responds to [Light2D] nodes. Default value: [code]1[/code].
bindCanvasItem_set_light_mask :: MethodBind
bindCanvasItem_set_light_mask
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rendering layers in which this [code]CanvasItem[/code] responds to [Light2D] nodes. Default value: [code]1[/code].
set_light_mask ::
                 (CanvasItem :< cls, Object :< cls) => cls -> Int -> IO ()
set_light_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_light_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_light_mask #-}

-- | The rendering layers in which this [code]CanvasItem[/code] responds to [Light2D] nodes. Default value: [code]1[/code].
bindCanvasItem_get_light_mask :: MethodBind
bindCanvasItem_get_light_mask
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rendering layers in which this [code]CanvasItem[/code] responds to [Light2D] nodes. Default value: [code]1[/code].
get_light_mask ::
                 (CanvasItem :< cls, Object :< cls) => cls -> IO Int
get_light_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_light_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_modulate #-}

-- | The color applied to textures on this [code]CanvasItem[/code]. Default value: [code]Color(1, 1, 1, 1)[/code] (opaque "white").
bindCanvasItem_set_modulate :: MethodBind
bindCanvasItem_set_modulate
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color applied to textures on this [code]CanvasItem[/code]. Default value: [code]Color(1, 1, 1, 1)[/code] (opaque "white").
set_modulate ::
               (CanvasItem :< cls, Object :< cls) => cls -> Color -> IO ()
set_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_modulate #-}

-- | The color applied to textures on this [code]CanvasItem[/code]. Default value: [code]Color(1, 1, 1, 1)[/code] (opaque "white").
bindCanvasItem_get_modulate :: MethodBind
bindCanvasItem_get_modulate
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color applied to textures on this [code]CanvasItem[/code]. Default value: [code]Color(1, 1, 1, 1)[/code] (opaque "white").
get_modulate ::
               (CanvasItem :< cls, Object :< cls) => cls -> IO Color
get_modulate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_self_modulate #-}

-- | The color applied to textures on this [code]CanvasItem[/code]. This is not inherited by children [code]CanvasItem[/code]s. Default value: [code]Color(1, 1, 1, 1)[/code] (opaque "white")..
bindCanvasItem_set_self_modulate :: MethodBind
bindCanvasItem_set_self_modulate
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_self_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color applied to textures on this [code]CanvasItem[/code]. This is not inherited by children [code]CanvasItem[/code]s. Default value: [code]Color(1, 1, 1, 1)[/code] (opaque "white")..
set_self_modulate ::
                    (CanvasItem :< cls, Object :< cls) => cls -> Color -> IO ()
set_self_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_self_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_self_modulate #-}

-- | The color applied to textures on this [code]CanvasItem[/code]. This is not inherited by children [code]CanvasItem[/code]s. Default value: [code]Color(1, 1, 1, 1)[/code] (opaque "white")..
bindCanvasItem_get_self_modulate :: MethodBind
bindCanvasItem_get_self_modulate
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_self_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color applied to textures on this [code]CanvasItem[/code]. This is not inherited by children [code]CanvasItem[/code]s. Default value: [code]Color(1, 1, 1, 1)[/code] (opaque "white")..
get_self_modulate ::
                    (CanvasItem :< cls, Object :< cls) => cls -> IO Color
get_self_modulate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_self_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_draw_behind_parent #-}

-- | If [code]true[/code], the object draws behind its parent. Default value: [code]false[/code].
bindCanvasItem_set_draw_behind_parent :: MethodBind
bindCanvasItem_set_draw_behind_parent
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_draw_behind_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the object draws behind its parent. Default value: [code]false[/code].
set_draw_behind_parent ::
                         (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_draw_behind_parent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_draw_behind_parent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_is_draw_behind_parent_enabled #-}

-- | If [code]true[/code], the object draws behind its parent. Default value: [code]false[/code].
bindCanvasItem_is_draw_behind_parent_enabled :: MethodBind
bindCanvasItem_is_draw_behind_parent_enabled
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_draw_behind_parent_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the object draws behind its parent. Default value: [code]false[/code].
is_draw_behind_parent_enabled ::
                                (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
is_draw_behind_parent_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_is_draw_behind_parent_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__set_on_top #-}

-- | If [code]true[/code], the object draws on top of its parent. Default value: [code]true[/code].
bindCanvasItem__set_on_top :: MethodBind
bindCanvasItem__set_on_top
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_set_on_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the object draws on top of its parent. Default value: [code]true[/code].
_set_on_top ::
              (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_on_top cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__set_on_top (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem__is_on_top #-}

-- | If [code]true[/code], the object draws on top of its parent. Default value: [code]true[/code].
bindCanvasItem__is_on_top :: MethodBind
bindCanvasItem__is_on_top
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_is_on_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the object draws on top of its parent. Default value: [code]true[/code].
_is_on_top :: (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
_is_on_top cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__is_on_top (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_line #-}

-- | Draws a line from a 2D point to another, with a given color and width. It can be optionally antialiased.
bindCanvasItem_draw_line :: MethodBind
bindCanvasItem_draw_line
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a line from a 2D point to another, with a given color and width. It can be optionally antialiased.
draw_line ::
            (CanvasItem :< cls, Object :< cls) =>
            cls -> Vector2 -> Vector2 -> Color -> Float -> Bool -> IO ()
draw_line cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_line (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_polyline #-}

-- | Draws interconnected line segments with a uniform [code]color[/code] and [code]width[/code] and optional antialiasing.
bindCanvasItem_draw_polyline :: MethodBind
bindCanvasItem_draw_polyline
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_polyline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws interconnected line segments with a uniform [code]color[/code] and [code]width[/code] and optional antialiasing.
draw_polyline ::
                (CanvasItem :< cls, Object :< cls) =>
                cls -> PoolVector2Array -> Color -> Float -> Bool -> IO ()
draw_polyline cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_polyline (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_polyline_colors #-}

-- | Draws interconnected line segments with a uniform [code]width[/code], segment-by-segment coloring, and optional antialiasing. Colors assigned to line segments match by index between [code]points[/code] and [code]colors[/code].
bindCanvasItem_draw_polyline_colors :: MethodBind
bindCanvasItem_draw_polyline_colors
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_polyline_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws interconnected line segments with a uniform [code]width[/code], segment-by-segment coloring, and optional antialiasing. Colors assigned to line segments match by index between [code]points[/code] and [code]colors[/code].
draw_polyline_colors ::
                       (CanvasItem :< cls, Object :< cls) =>
                       cls -> PoolVector2Array -> PoolColorArray -> Float -> Bool -> IO ()
draw_polyline_colors cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_polyline_colors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_multiline #-}

-- | Draws multiple, parallel lines with a uniform [code]color[/code] and [code]width[/code] and optional antialiasing.
bindCanvasItem_draw_multiline :: MethodBind
bindCanvasItem_draw_multiline
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_multiline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws multiple, parallel lines with a uniform [code]color[/code] and [code]width[/code] and optional antialiasing.
draw_multiline ::
                 (CanvasItem :< cls, Object :< cls) =>
                 cls -> PoolVector2Array -> Color -> Float -> Bool -> IO ()
draw_multiline cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_multiline (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_multiline_colors #-}

-- | Draws multiple, parallel lines with a uniform [code]width[/code], segment-by-segment coloring, and optional antialiasing. Colors assigned to line segments match by index between [code]points[/code] and [code]colors[/code].
bindCanvasItem_draw_multiline_colors :: MethodBind
bindCanvasItem_draw_multiline_colors
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_multiline_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws multiple, parallel lines with a uniform [code]width[/code], segment-by-segment coloring, and optional antialiasing. Colors assigned to line segments match by index between [code]points[/code] and [code]colors[/code].
draw_multiline_colors ::
                        (CanvasItem :< cls, Object :< cls) =>
                        cls -> PoolVector2Array -> PoolColorArray -> Float -> Bool -> IO ()
draw_multiline_colors cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_multiline_colors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_rect #-}

-- | Draws a colored rectangle.
bindCanvasItem_draw_rect :: MethodBind
bindCanvasItem_draw_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a colored rectangle.
draw_rect ::
            (CanvasItem :< cls, Object :< cls) =>
            cls -> Rect2 -> Color -> Bool -> IO ()
draw_rect cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_rect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_circle #-}

-- | Draws a colored circle.
bindCanvasItem_draw_circle :: MethodBind
bindCanvasItem_draw_circle
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_circle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a colored circle.
draw_circle ::
              (CanvasItem :< cls, Object :< cls) =>
              cls -> Vector2 -> Float -> Color -> IO ()
draw_circle cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_circle (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_texture #-}

-- | Draws a texture at a given position.
bindCanvasItem_draw_texture :: MethodBind
bindCanvasItem_draw_texture
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a texture at a given position.
draw_texture ::
               (CanvasItem :< cls, Object :< cls) =>
               cls -> Texture -> Vector2 -> Color -> Texture -> IO ()
draw_texture cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_texture_rect #-}

-- | Draws a textured rectangle at a given position, optionally modulated by a color. Transpose swaps the x and y coordinates when reading the texture.
bindCanvasItem_draw_texture_rect :: MethodBind
bindCanvasItem_draw_texture_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_texture_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a textured rectangle at a given position, optionally modulated by a color. Transpose swaps the x and y coordinates when reading the texture.
draw_texture_rect ::
                    (CanvasItem :< cls, Object :< cls) =>
                    cls ->
                      Texture -> Rect2 -> Bool -> Color -> Bool -> Texture -> IO ()
draw_texture_rect cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_texture_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_texture_rect_region #-}

-- | Draws a textured rectangle region at a given position, optionally modulated by a color. Transpose swaps the x and y coordinates when reading the texture.
bindCanvasItem_draw_texture_rect_region :: MethodBind
bindCanvasItem_draw_texture_rect_region
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_texture_rect_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a textured rectangle region at a given position, optionally modulated by a color. Transpose swaps the x and y coordinates when reading the texture.
draw_texture_rect_region ::
                           (CanvasItem :< cls, Object :< cls) =>
                           cls ->
                             Texture ->
                               Rect2 -> Rect2 -> Color -> Bool -> Texture -> Bool -> IO ()
draw_texture_rect_region cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_texture_rect_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_style_box #-}

-- | Draws a styled rectangle.
bindCanvasItem_draw_style_box :: MethodBind
bindCanvasItem_draw_style_box
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_style_box" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a styled rectangle.
draw_style_box ::
                 (CanvasItem :< cls, Object :< cls) =>
                 cls -> StyleBox -> Rect2 -> IO ()
draw_style_box cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_style_box (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_primitive #-}

-- | Draws a custom primitive, 1 point for a point, 2 points for a line, 3 points for a triangle and 4 points for a quad.
bindCanvasItem_draw_primitive :: MethodBind
bindCanvasItem_draw_primitive
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_primitive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a custom primitive, 1 point for a point, 2 points for a line, 3 points for a triangle and 4 points for a quad.
draw_primitive ::
                 (CanvasItem :< cls, Object :< cls) =>
                 cls ->
                   PoolVector2Array ->
                     PoolColorArray ->
                       PoolVector2Array -> Texture -> Float -> Texture -> IO ()
draw_primitive cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_primitive (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_polygon #-}

-- | Draws a polygon of any amount of points, convex or concave.
bindCanvasItem_draw_polygon :: MethodBind
bindCanvasItem_draw_polygon
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a polygon of any amount of points, convex or concave.
draw_polygon ::
               (CanvasItem :< cls, Object :< cls) =>
               cls ->
                 PoolVector2Array ->
                   PoolColorArray ->
                     PoolVector2Array -> Texture -> Texture -> Bool -> IO ()
draw_polygon cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_colored_polygon #-}

-- | Draws a colored polygon of any amount of points, convex or concave.
bindCanvasItem_draw_colored_polygon :: MethodBind
bindCanvasItem_draw_colored_polygon
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_colored_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a colored polygon of any amount of points, convex or concave.
draw_colored_polygon ::
                       (CanvasItem :< cls, Object :< cls) =>
                       cls ->
                         PoolVector2Array ->
                           Color -> PoolVector2Array -> Texture -> Texture -> Bool -> IO ()
draw_colored_polygon cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_colored_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_string #-}

-- | Draws a string using a custom font.
bindCanvasItem_draw_string :: MethodBind
bindCanvasItem_draw_string
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a string using a custom font.
draw_string ::
              (CanvasItem :< cls, Object :< cls) =>
              cls -> Font -> Vector2 -> GodotString -> Color -> Int -> IO ()
draw_string cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_char #-}

-- | Draws a string character using a custom font. Returns the advance, depending on the char width and kerning with an optional next char.
bindCanvasItem_draw_char :: MethodBind
bindCanvasItem_draw_char
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_char" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a string character using a custom font. Returns the advance, depending on the char width and kerning with an optional next char.
draw_char ::
            (CanvasItem :< cls, Object :< cls) =>
            cls ->
              Font -> Vector2 -> GodotString -> GodotString -> Color -> IO Float
draw_char cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_char (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_mesh #-}

bindCanvasItem_draw_mesh :: MethodBind
bindCanvasItem_draw_mesh
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

draw_mesh ::
            (CanvasItem :< cls, Object :< cls) =>
            cls -> Mesh -> Texture -> Texture -> IO ()
draw_mesh cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_multimesh #-}

bindCanvasItem_draw_multimesh :: MethodBind
bindCanvasItem_draw_multimesh
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

draw_multimesh ::
                 (CanvasItem :< cls, Object :< cls) =>
                 cls -> MultiMesh -> Texture -> Texture -> IO ()
draw_multimesh cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_multimesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_set_transform #-}

-- | Sets a custom transform for drawing via components. Anything drawn afterwards will be transformed by this.
bindCanvasItem_draw_set_transform :: MethodBind
bindCanvasItem_draw_set_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom transform for drawing via components. Anything drawn afterwards will be transformed by this.
draw_set_transform ::
                     (CanvasItem :< cls, Object :< cls) =>
                     cls -> Vector2 -> Float -> Vector2 -> IO ()
draw_set_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_draw_set_transform_matrix #-}

-- | Sets a custom transform for drawing via matrix. Anything drawn afterwards will be transformed by this.
bindCanvasItem_draw_set_transform_matrix :: MethodBind
bindCanvasItem_draw_set_transform_matrix
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_set_transform_matrix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom transform for drawing via matrix. Anything drawn afterwards will be transformed by this.
draw_set_transform_matrix ::
                            (CanvasItem :< cls, Object :< cls) => cls -> Transform2d -> IO ()
draw_set_transform_matrix cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_set_transform_matrix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_transform #-}

-- | Get the transform matrix of this item.
bindCanvasItem_get_transform :: MethodBind
bindCanvasItem_get_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the transform matrix of this item.
get_transform ::
                (CanvasItem :< cls, Object :< cls) => cls -> IO Transform2d
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_global_transform #-}

-- | Get the global transform matrix of this item.
bindCanvasItem_get_global_transform :: MethodBind
bindCanvasItem_get_global_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the global transform matrix of this item.
get_global_transform ::
                       (CanvasItem :< cls, Object :< cls) => cls -> IO Transform2d
get_global_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_global_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_global_transform_with_canvas #-}

-- | Get the global transform matrix of this item in relation to the canvas.
bindCanvasItem_get_global_transform_with_canvas :: MethodBind
bindCanvasItem_get_global_transform_with_canvas
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_global_transform_with_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the global transform matrix of this item in relation to the canvas.
get_global_transform_with_canvas ::
                                   (CanvasItem :< cls, Object :< cls) => cls -> IO Transform2d
get_global_transform_with_canvas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItem_get_global_transform_with_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_viewport_transform #-}

-- | Get this item's transform in relation to the viewport.
bindCanvasItem_get_viewport_transform :: MethodBind
bindCanvasItem_get_viewport_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_viewport_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get this item's transform in relation to the viewport.
get_viewport_transform ::
                         (CanvasItem :< cls, Object :< cls) => cls -> IO Transform2d
get_viewport_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_viewport_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_viewport_rect #-}

-- | Get the viewport's boundaries as a [Rect2].
bindCanvasItem_get_viewport_rect :: MethodBind
bindCanvasItem_get_viewport_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_viewport_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the viewport's boundaries as a [Rect2].
get_viewport_rect ::
                    (CanvasItem :< cls, Object :< cls) => cls -> IO Rect2
get_viewport_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_viewport_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_canvas_transform #-}

-- | Get the transform matrix of this item's canvas.
bindCanvasItem_get_canvas_transform :: MethodBind
bindCanvasItem_get_canvas_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the transform matrix of this item's canvas.
get_canvas_transform ::
                       (CanvasItem :< cls, Object :< cls) => cls -> IO Transform2d
get_canvas_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_canvas_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_local_mouse_position #-}

-- | Get the mouse position relative to this item's position.
bindCanvasItem_get_local_mouse_position :: MethodBind
bindCanvasItem_get_local_mouse_position
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_local_mouse_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the mouse position relative to this item's position.
get_local_mouse_position ::
                           (CanvasItem :< cls, Object :< cls) => cls -> IO Vector2
get_local_mouse_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_local_mouse_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_global_mouse_position #-}

-- | Get the global position of the mouse.
bindCanvasItem_get_global_mouse_position :: MethodBind
bindCanvasItem_get_global_mouse_position
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_global_mouse_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the global position of the mouse.
get_global_mouse_position ::
                            (CanvasItem :< cls, Object :< cls) => cls -> IO Vector2
get_global_mouse_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_global_mouse_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_canvas #-}

-- | Return the [RID] of the [World2D] canvas where this item is in.
bindCanvasItem_get_canvas :: MethodBind
bindCanvasItem_get_canvas
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the [RID] of the [World2D] canvas where this item is in.
get_canvas :: (CanvasItem :< cls, Object :< cls) => cls -> IO Rid
get_canvas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_canvas (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_world_2d #-}

-- | Get the [World2D] where this item is in.
bindCanvasItem_get_world_2d :: MethodBind
bindCanvasItem_get_world_2d
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_world_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the [World2D] where this item is in.
get_world_2d ::
               (CanvasItem :< cls, Object :< cls) => cls -> IO World2D
get_world_2d cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_world_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_material #-}

-- | The material applied to textures on this [code]CanvasItem[/code]. Default value: [code]null[/code].
bindCanvasItem_set_material :: MethodBind
bindCanvasItem_set_material
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material applied to textures on this [code]CanvasItem[/code]. Default value: [code]null[/code].
set_material ::
               (CanvasItem :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_material #-}

-- | The material applied to textures on this [code]CanvasItem[/code]. Default value: [code]null[/code].
bindCanvasItem_get_material :: MethodBind
bindCanvasItem_get_material
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material applied to textures on this [code]CanvasItem[/code]. Default value: [code]null[/code].
get_material ::
               (CanvasItem :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_use_parent_material #-}

-- | If [code]true[/code], the parent [code]CanvasItem[/code]'s [member material] property is used as this one's material. Default value: [code]false[/code].
bindCanvasItem_set_use_parent_material :: MethodBind
bindCanvasItem_set_use_parent_material
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_use_parent_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the parent [code]CanvasItem[/code]'s [member material] property is used as this one's material. Default value: [code]false[/code].
set_use_parent_material ::
                          (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_parent_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_use_parent_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_get_use_parent_material #-}

-- | If [code]true[/code], the parent [code]CanvasItem[/code]'s [member material] property is used as this one's material. Default value: [code]false[/code].
bindCanvasItem_get_use_parent_material :: MethodBind
bindCanvasItem_get_use_parent_material
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_use_parent_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the parent [code]CanvasItem[/code]'s [member material] property is used as this one's material. Default value: [code]false[/code].
get_use_parent_material ::
                          (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
get_use_parent_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_use_parent_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_notify_local_transform #-}

-- | If [code]enable[/code] is [code]true[/code], children will be updated with local transform data.
bindCanvasItem_set_notify_local_transform :: MethodBind
bindCanvasItem_set_notify_local_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_notify_local_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]enable[/code] is [code]true[/code], children will be updated with local transform data.
set_notify_local_transform ::
                             (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_notify_local_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_notify_local_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_is_local_transform_notification_enabled
             #-}

-- | Returns [code]true[/code] if local transform notifications are communicated to children.
bindCanvasItem_is_local_transform_notification_enabled ::
                                                       MethodBind
bindCanvasItem_is_local_transform_notification_enabled
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_local_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if local transform notifications are communicated to children.
is_local_transform_notification_enabled ::
                                          (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
is_local_transform_notification_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItem_is_local_transform_notification_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_set_notify_transform #-}

-- | If [code]enable[/code] is [code]true[/code], children will be updated with global transform data.
bindCanvasItem_set_notify_transform :: MethodBind
bindCanvasItem_set_notify_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_notify_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]enable[/code] is [code]true[/code], children will be updated with global transform data.
set_notify_transform ::
                       (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_notify_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_notify_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_is_transform_notification_enabled #-}

-- | Returns [code]true[/code] if global transform notifications are communicated to children.
bindCanvasItem_is_transform_notification_enabled :: MethodBind
bindCanvasItem_is_transform_notification_enabled
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if global transform notifications are communicated to children.
is_transform_notification_enabled ::
                                    (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
is_transform_notification_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCanvasItem_is_transform_notification_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_force_update_transform #-}

bindCanvasItem_force_update_transform :: MethodBind
bindCanvasItem_force_update_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "force_update_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

force_update_transform ::
                         (CanvasItem :< cls, Object :< cls) => cls -> IO ()
force_update_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_force_update_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_make_canvas_position_local #-}

-- | Assigns [code]screen_point[/code] as this node's new local transform.
bindCanvasItem_make_canvas_position_local :: MethodBind
bindCanvasItem_make_canvas_position_local
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "make_canvas_position_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns [code]screen_point[/code] as this node's new local transform.
make_canvas_position_local ::
                             (CanvasItem :< cls, Object :< cls) => cls -> Vector2 -> IO Vector2
make_canvas_position_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_make_canvas_position_local
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasItem_make_input_local #-}

-- | Transformations issued by [code]event[/code]'s inputs are applied in local space instead of global space.
bindCanvasItem_make_input_local :: MethodBind
bindCanvasItem_make_input_local
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "make_input_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Transformations issued by [code]event[/code]'s inputs are applied in local space instead of global space.
make_input_local ::
                   (CanvasItem :< cls, Object :< cls) =>
                   cls -> InputEvent -> IO InputEvent
make_input_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_make_input_local (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)