{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
        Godot.Core.CanvasItem.sig_draw, Godot.Core.CanvasItem.sig_hide,
        Godot.Core.CanvasItem.sig_item_rect_changed,
        Godot.Core.CanvasItem.sig_visibility_changed,
        Godot.Core.CanvasItem._draw, Godot.Core.CanvasItem._edit_get_pivot,
        Godot.Core.CanvasItem._edit_get_position,
        Godot.Core.CanvasItem._edit_get_rect,
        Godot.Core.CanvasItem._edit_get_rotation,
        Godot.Core.CanvasItem._edit_get_scale,
        Godot.Core.CanvasItem._edit_get_state,
        Godot.Core.CanvasItem._edit_get_transform,
        Godot.Core.CanvasItem._edit_set_pivot,
        Godot.Core.CanvasItem._edit_set_position,
        Godot.Core.CanvasItem._edit_set_rect,
        Godot.Core.CanvasItem._edit_set_rotation,
        Godot.Core.CanvasItem._edit_set_scale,
        Godot.Core.CanvasItem._edit_set_state,
        Godot.Core.CanvasItem._edit_use_pivot,
        Godot.Core.CanvasItem._edit_use_rect,
        Godot.Core.CanvasItem._edit_use_rotation,
        Godot.Core.CanvasItem._is_on_top,
        Godot.Core.CanvasItem._set_on_top,
        Godot.Core.CanvasItem._toplevel_raise_self,
        Godot.Core.CanvasItem._update_callback,
        Godot.Core.CanvasItem.draw_arc, Godot.Core.CanvasItem.draw_char,
        Godot.Core.CanvasItem.draw_circle,
        Godot.Core.CanvasItem.draw_colored_polygon,
        Godot.Core.CanvasItem.draw_line, Godot.Core.CanvasItem.draw_mesh,
        Godot.Core.CanvasItem.draw_multiline,
        Godot.Core.CanvasItem.draw_multiline_colors,
        Godot.Core.CanvasItem.draw_multimesh,
        Godot.Core.CanvasItem.draw_polygon,
        Godot.Core.CanvasItem.draw_polyline,
        Godot.Core.CanvasItem.draw_polyline_colors,
        Godot.Core.CanvasItem.draw_primitive,
        Godot.Core.CanvasItem.draw_rect,
        Godot.Core.CanvasItem.draw_set_transform,
        Godot.Core.CanvasItem.draw_set_transform_matrix,
        Godot.Core.CanvasItem.draw_string,
        Godot.Core.CanvasItem.draw_style_box,
        Godot.Core.CanvasItem.draw_texture,
        Godot.Core.CanvasItem.draw_texture_rect,
        Godot.Core.CanvasItem.draw_texture_rect_region,
        Godot.Core.CanvasItem.force_update_transform,
        Godot.Core.CanvasItem.get_canvas,
        Godot.Core.CanvasItem.get_canvas_item,
        Godot.Core.CanvasItem.get_canvas_transform,
        Godot.Core.CanvasItem.get_global_mouse_position,
        Godot.Core.CanvasItem.get_global_transform,
        Godot.Core.CanvasItem.get_global_transform_with_canvas,
        Godot.Core.CanvasItem.get_light_mask,
        Godot.Core.CanvasItem.get_local_mouse_position,
        Godot.Core.CanvasItem.get_material,
        Godot.Core.CanvasItem.get_modulate,
        Godot.Core.CanvasItem.get_self_modulate,
        Godot.Core.CanvasItem.get_transform,
        Godot.Core.CanvasItem.get_use_parent_material,
        Godot.Core.CanvasItem.get_viewport_rect,
        Godot.Core.CanvasItem.get_viewport_transform,
        Godot.Core.CanvasItem.get_world_2d, Godot.Core.CanvasItem.hide,
        Godot.Core.CanvasItem.is_draw_behind_parent_enabled,
        Godot.Core.CanvasItem.is_local_transform_notification_enabled,
        Godot.Core.CanvasItem.is_set_as_toplevel,
        Godot.Core.CanvasItem.is_transform_notification_enabled,
        Godot.Core.CanvasItem.is_visible,
        Godot.Core.CanvasItem.is_visible_in_tree,
        Godot.Core.CanvasItem.make_canvas_position_local,
        Godot.Core.CanvasItem.make_input_local,
        Godot.Core.CanvasItem.set_as_toplevel,
        Godot.Core.CanvasItem.set_draw_behind_parent,
        Godot.Core.CanvasItem.set_light_mask,
        Godot.Core.CanvasItem.set_material,
        Godot.Core.CanvasItem.set_modulate,
        Godot.Core.CanvasItem.set_notify_local_transform,
        Godot.Core.CanvasItem.set_notify_transform,
        Godot.Core.CanvasItem.set_self_modulate,
        Godot.Core.CanvasItem.set_use_parent_material,
        Godot.Core.CanvasItem.set_visible, Godot.Core.CanvasItem.show,
        Godot.Core.CanvasItem.update)
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
import Godot.Core.Node()

_BLEND_MODE_DISABLED :: Int
_BLEND_MODE_DISABLED = 5

_NOTIFICATION_EXIT_CANVAS :: Int
_NOTIFICATION_EXIT_CANVAS = 33

_NOTIFICATION_ENTER_CANVAS :: Int
_NOTIFICATION_ENTER_CANVAS = 32

_NOTIFICATION_TRANSFORM_CHANGED :: Int
_NOTIFICATION_TRANSFORM_CHANGED = 2000

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

-- | Emitted when the @CanvasItem@ must redraw. This can only be connected realtime, as deferred will not allow drawing.
sig_draw :: Godot.Internal.Dispatch.Signal CanvasItem
sig_draw = Godot.Internal.Dispatch.Signal "draw"

instance NodeSignal CanvasItem "draw" '[]

-- | Emitted when becoming hidden.
sig_hide :: Godot.Internal.Dispatch.Signal CanvasItem
sig_hide = Godot.Internal.Dispatch.Signal "hide"

instance NodeSignal CanvasItem "hide" '[]

-- | Emitted when the item rect has changed.
sig_item_rect_changed :: Godot.Internal.Dispatch.Signal CanvasItem
sig_item_rect_changed
  = Godot.Internal.Dispatch.Signal "item_rect_changed"

instance NodeSignal CanvasItem "item_rect_changed" '[]

-- | Emitted when the visibility (hidden/visible) changes.
sig_visibility_changed :: Godot.Internal.Dispatch.Signal CanvasItem
sig_visibility_changed
  = Godot.Internal.Dispatch.Signal "visibility_changed"

instance NodeSignal CanvasItem "visibility_changed" '[]

instance NodeProperty CanvasItem "light_mask" Int 'False where
        nodeProperty
          = (get_light_mask, wrapDroppingSetter set_light_mask, Nothing)

instance NodeProperty CanvasItem "material" Material 'False where
        nodeProperty
          = (get_material, wrapDroppingSetter set_material, Nothing)

instance NodeProperty CanvasItem "modulate" Color 'False where
        nodeProperty
          = (get_modulate, wrapDroppingSetter set_modulate, Nothing)

instance NodeProperty CanvasItem "self_modulate" Color 'False where
        nodeProperty
          = (get_self_modulate, wrapDroppingSetter set_self_modulate,
             Nothing)

instance NodeProperty CanvasItem "show_behind_parent" Bool 'False
         where
        nodeProperty
          = (is_draw_behind_parent_enabled,
             wrapDroppingSetter set_draw_behind_parent, Nothing)

instance NodeProperty CanvasItem "show_on_top" Bool 'False where
        nodeProperty
          = (_is_on_top, wrapDroppingSetter _set_on_top, Nothing)

instance NodeProperty CanvasItem "use_parent_material" Bool 'False
         where
        nodeProperty
          = (get_use_parent_material,
             wrapDroppingSetter set_use_parent_material, Nothing)

instance NodeProperty CanvasItem "visible" Bool 'False where
        nodeProperty
          = (is_visible, wrapDroppingSetter set_visible, Nothing)

{-# NOINLINE bindCanvasItem__draw #-}

-- | Overridable function called by the engine (if defined) to draw the canvas item.
bindCanvasItem__draw :: MethodBind
bindCanvasItem__draw
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overridable function called by the engine (if defined) to draw the canvas item.
_draw :: (CanvasItem :< cls, Object :< cls) => cls -> IO ()
_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__draw (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "_draw" '[] (IO ()) where
        nodeMethod = Godot.Core.CanvasItem._draw

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

instance NodeMethod CanvasItem "_edit_get_pivot" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_get_pivot

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

instance NodeMethod CanvasItem "_edit_get_position" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_get_position

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

instance NodeMethod CanvasItem "_edit_get_rect" '[] (IO Rect2)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_get_rect

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

instance NodeMethod CanvasItem "_edit_get_rotation" '[] (IO Float)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_get_rotation

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

instance NodeMethod CanvasItem "_edit_get_scale" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_get_scale

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

instance NodeMethod CanvasItem "_edit_get_state" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_get_state

{-# NOINLINE bindCanvasItem__edit_get_transform #-}

bindCanvasItem__edit_get_transform :: MethodBind
bindCanvasItem__edit_get_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_edit_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_edit_get_transform ::
                      (CanvasItem :< cls, Object :< cls) => cls -> IO Transform2d
_edit_get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__edit_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "_edit_get_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_get_transform

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

instance NodeMethod CanvasItem "_edit_set_pivot" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem._edit_set_pivot

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

instance NodeMethod CanvasItem "_edit_set_position" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem._edit_set_position

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

instance NodeMethod CanvasItem "_edit_set_rect" '[Rect2] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem._edit_set_rect

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

instance NodeMethod CanvasItem "_edit_set_rotation" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem._edit_set_rotation

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

instance NodeMethod CanvasItem "_edit_set_scale" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem._edit_set_scale

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

instance NodeMethod CanvasItem "_edit_set_state" '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem._edit_set_state

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

instance NodeMethod CanvasItem "_edit_use_pivot" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_use_pivot

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

instance NodeMethod CanvasItem "_edit_use_rect" '[] (IO Bool) where
        nodeMethod = Godot.Core.CanvasItem._edit_use_rect

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

instance NodeMethod CanvasItem "_edit_use_rotation" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasItem._edit_use_rotation

{-# NOINLINE bindCanvasItem__is_on_top #-}

-- | If @true@, the object draws on top of its parent.
bindCanvasItem__is_on_top :: MethodBind
bindCanvasItem__is_on_top
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_is_on_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the object draws on top of its parent.
_is_on_top :: (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
_is_on_top cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__is_on_top (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "_is_on_top" '[] (IO Bool) where
        nodeMethod = Godot.Core.CanvasItem._is_on_top

{-# NOINLINE bindCanvasItem__set_on_top #-}

-- | If @true@, the object draws on top of its parent.
bindCanvasItem__set_on_top :: MethodBind
bindCanvasItem__set_on_top
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "_set_on_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the object draws on top of its parent.
_set_on_top ::
              (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_on_top cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem__set_on_top (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "_set_on_top" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.CanvasItem._set_on_top

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

instance NodeMethod CanvasItem "_toplevel_raise_self" '[] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem._toplevel_raise_self

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

instance NodeMethod CanvasItem "_update_callback" '[] (IO ()) where
        nodeMethod = Godot.Core.CanvasItem._update_callback

{-# NOINLINE bindCanvasItem_draw_arc #-}

-- | Draws an arc between the given angles. The larger the value of @point_count@, the smoother the curve.
bindCanvasItem_draw_arc :: MethodBind
bindCanvasItem_draw_arc
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_arc" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws an arc between the given angles. The larger the value of @point_count@, the smoother the curve.
draw_arc ::
           (CanvasItem :< cls, Object :< cls) =>
           cls ->
             Vector2 ->
               Float ->
                 Float ->
                   Float -> Int -> Color -> Maybe Float -> Maybe Bool -> IO ()
draw_arc cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6,
       maybe (VariantReal (1)) toVariant arg7,
       maybe (VariantBool False) toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_arc (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_arc"
           '[Vector2, Float, Float, Float, Int, Color, Maybe Float,
             Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_arc

{-# NOINLINE bindCanvasItem_draw_char #-}

-- | Draws a string character using a custom font. Returns the advance, depending on the character width and kerning with an optional next character.
bindCanvasItem_draw_char :: MethodBind
bindCanvasItem_draw_char
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_char" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a string character using a custom font. Returns the advance, depending on the character width and kerning with an optional next character.
draw_char ::
            (CanvasItem :< cls, Object :< cls) =>
            cls ->
              Font ->
                Vector2 -> GodotString -> GodotString -> Maybe Color -> IO Float
draw_char cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_char (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_char"
           '[Font, Vector2, GodotString, GodotString, Maybe Color]
           (IO Float)
         where
        nodeMethod = Godot.Core.CanvasItem.draw_char

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

instance NodeMethod CanvasItem "draw_circle"
           '[Vector2, Float, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_circle

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
                           Color ->
                             Maybe PoolVector2Array ->
                               Maybe Texture -> Maybe Texture -> Maybe Bool -> IO ()
draw_colored_polygon cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantPoolVector2Array V.empty arg3,
       maybe VariantNil toVariant arg4, maybe VariantNil toVariant arg5,
       maybe (VariantBool False) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_colored_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_colored_polygon"
           '[PoolVector2Array, Color, Maybe PoolVector2Array, Maybe Texture,
             Maybe Texture, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_colored_polygon

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
            cls ->
              Vector2 -> Vector2 -> Color -> Maybe Float -> Maybe Bool -> IO ()
draw_line cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantReal (1)) toVariant arg4,
       maybe (VariantBool False) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_line (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_line"
           '[Vector2, Vector2, Color, Maybe Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_line

{-# NOINLINE bindCanvasItem_draw_mesh #-}

-- | Draws a @Mesh@ in 2D, using the provided texture. See @MeshInstance2D@ for related documentation.
bindCanvasItem_draw_mesh :: MethodBind
bindCanvasItem_draw_mesh
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a @Mesh@ in 2D, using the provided texture. See @MeshInstance2D@ for related documentation.
draw_mesh ::
            (CanvasItem :< cls, Object :< cls) =>
            cls ->
              Mesh ->
                Texture ->
                  Maybe Texture -> Maybe Transform2d -> Maybe Color -> IO ()
draw_mesh cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3,
       defaultedVariant VariantTransform2d
         (TF2d (V2 1 0) (V2 0 1) (V2 0 0))
         arg4,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_mesh"
           '[Mesh, Texture, Maybe Texture, Maybe Transform2d, Maybe Color]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_mesh

{-# NOINLINE bindCanvasItem_draw_multiline #-}

-- | Draws multiple, parallel lines with a uniform @color@.
--   				__Note:__ @width@ and @antialiased@ are currently not implemented and have no effect.
bindCanvasItem_draw_multiline :: MethodBind
bindCanvasItem_draw_multiline
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_multiline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws multiple, parallel lines with a uniform @color@.
--   				__Note:__ @width@ and @antialiased@ are currently not implemented and have no effect.
draw_multiline ::
                 (CanvasItem :< cls, Object :< cls) =>
                 cls ->
                   PoolVector2Array -> Color -> Maybe Float -> Maybe Bool -> IO ()
draw_multiline cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantReal (1)) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_multiline (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_multiline"
           '[PoolVector2Array, Color, Maybe Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_multiline

{-# NOINLINE bindCanvasItem_draw_multiline_colors #-}

-- | Draws multiple, parallel lines with a uniform @width@ and segment-by-segment coloring. Colors assigned to line segments match by index between @points@ and @colors@.
--   				__Note:__ @width@ and @antialiased@ are currently not implemented and have no effect.
bindCanvasItem_draw_multiline_colors :: MethodBind
bindCanvasItem_draw_multiline_colors
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_multiline_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws multiple, parallel lines with a uniform @width@ and segment-by-segment coloring. Colors assigned to line segments match by index between @points@ and @colors@.
--   				__Note:__ @width@ and @antialiased@ are currently not implemented and have no effect.
draw_multiline_colors ::
                        (CanvasItem :< cls, Object :< cls) =>
                        cls ->
                          PoolVector2Array ->
                            PoolColorArray -> Maybe Float -> Maybe Bool -> IO ()
draw_multiline_colors cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantReal (1)) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_multiline_colors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_multiline_colors"
           '[PoolVector2Array, PoolColorArray, Maybe Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_multiline_colors

{-# NOINLINE bindCanvasItem_draw_multimesh #-}

-- | Draws a @MultiMesh@ in 2D with the provided texture. See @MultiMeshInstance2D@ for related documentation.
bindCanvasItem_draw_multimesh :: MethodBind
bindCanvasItem_draw_multimesh
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a @MultiMesh@ in 2D with the provided texture. See @MultiMeshInstance2D@ for related documentation.
draw_multimesh ::
                 (CanvasItem :< cls, Object :< cls) =>
                 cls -> MultiMesh -> Texture -> Maybe Texture -> IO ()
draw_multimesh cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_multimesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_multimesh"
           '[MultiMesh, Texture, Maybe Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_multimesh

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
                     Maybe PoolVector2Array ->
                       Maybe Texture -> Maybe Texture -> Maybe Bool -> IO ()
draw_polygon cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantPoolVector2Array V.empty arg3,
       maybe VariantNil toVariant arg4, maybe VariantNil toVariant arg5,
       maybe (VariantBool False) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_polygon"
           '[PoolVector2Array, PoolColorArray, Maybe PoolVector2Array,
             Maybe Texture, Maybe Texture, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_polygon

{-# NOINLINE bindCanvasItem_draw_polyline #-}

-- | Draws interconnected line segments with a uniform @color@ and @width@ and optional antialiasing.
bindCanvasItem_draw_polyline :: MethodBind
bindCanvasItem_draw_polyline
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_polyline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws interconnected line segments with a uniform @color@ and @width@ and optional antialiasing.
draw_polyline ::
                (CanvasItem :< cls, Object :< cls) =>
                cls ->
                  PoolVector2Array -> Color -> Maybe Float -> Maybe Bool -> IO ()
draw_polyline cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantReal (1)) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_polyline (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_polyline"
           '[PoolVector2Array, Color, Maybe Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_polyline

{-# NOINLINE bindCanvasItem_draw_polyline_colors #-}

-- | Draws interconnected line segments with a uniform @width@, segment-by-segment coloring, and optional antialiasing. Colors assigned to line segments match by index between @points@ and @colors@.
bindCanvasItem_draw_polyline_colors :: MethodBind
bindCanvasItem_draw_polyline_colors
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_polyline_colors" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws interconnected line segments with a uniform @width@, segment-by-segment coloring, and optional antialiasing. Colors assigned to line segments match by index between @points@ and @colors@.
draw_polyline_colors ::
                       (CanvasItem :< cls, Object :< cls) =>
                       cls ->
                         PoolVector2Array ->
                           PoolColorArray -> Maybe Float -> Maybe Bool -> IO ()
draw_polyline_colors cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantReal (1)) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_polyline_colors
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_polyline_colors"
           '[PoolVector2Array, PoolColorArray, Maybe Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_polyline_colors

{-# NOINLINE bindCanvasItem_draw_primitive #-}

-- | Draws a custom primitive. 1 point for a point, 2 points for a line, 3 points for a triangle and 4 points for a quad.
bindCanvasItem_draw_primitive :: MethodBind
bindCanvasItem_draw_primitive
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_primitive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a custom primitive. 1 point for a point, 2 points for a line, 3 points for a triangle and 4 points for a quad.
draw_primitive ::
                 (CanvasItem :< cls, Object :< cls) =>
                 cls ->
                   PoolVector2Array ->
                     PoolColorArray ->
                       PoolVector2Array ->
                         Maybe Texture -> Maybe Float -> Maybe Texture -> IO ()
draw_primitive cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4,
       maybe (VariantReal (1)) toVariant arg5,
       maybe VariantNil toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_primitive (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_primitive"
           '[PoolVector2Array, PoolColorArray, PoolVector2Array,
             Maybe Texture, Maybe Float, Maybe Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_primitive

{-# NOINLINE bindCanvasItem_draw_rect #-}

-- | Draws a rectangle. If @filled@ is @true@, the rectangle will be filled with the @color@ specified. If @filled@ is @false@, the rectangle will be drawn as a stroke with the @color@ and @width@ specified. If @antialiased@ is @true@, the lines will be antialiased.
--   				__Note:__ @width@ and @antialiased@ are only effective if @filled@ is @false@.
bindCanvasItem_draw_rect :: MethodBind
bindCanvasItem_draw_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a rectangle. If @filled@ is @true@, the rectangle will be filled with the @color@ specified. If @filled@ is @false@, the rectangle will be drawn as a stroke with the @color@ and @width@ specified. If @antialiased@ is @true@, the lines will be antialiased.
--   				__Note:__ @width@ and @antialiased@ are only effective if @filled@ is @false@.
draw_rect ::
            (CanvasItem :< cls, Object :< cls) =>
            cls ->
              Rect2 -> Color -> Maybe Bool -> Maybe Float -> Maybe Bool -> IO ()
draw_rect cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3,
       maybe (VariantReal (1)) toVariant arg4,
       maybe (VariantBool False) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_rect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_rect"
           '[Rect2, Color, Maybe Bool, Maybe Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_rect

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

instance NodeMethod CanvasItem "draw_set_transform"
           '[Vector2, Float, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_set_transform

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

instance NodeMethod CanvasItem "draw_set_transform_matrix"
           '[Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_set_transform_matrix

{-# NOINLINE bindCanvasItem_draw_string #-}

-- | Draws @text@ using the specified @font@ at the @position@ (top-left corner). The text will have its color multiplied by @modulate@. If @clip_w@ is greater than or equal to 0, the text will be clipped if it exceeds the specified width.
--   				__Example using the default project font:__
--   				
--   @
--   
--   				# If using this method in a script that redraws constantly, move the
--   				# `default_font` declaration to a member variable assigned in `_ready()`
--   				# so the Control is only created once.
--   				var default_font = Control.new().get_font("font")
--   				draw_string(default_font, Vector2(64, 64), "Hello world")
--   				
--   @
--   
--   				See also @method Font.draw@.
bindCanvasItem_draw_string :: MethodBind
bindCanvasItem_draw_string
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws @text@ using the specified @font@ at the @position@ (top-left corner). The text will have its color multiplied by @modulate@. If @clip_w@ is greater than or equal to 0, the text will be clipped if it exceeds the specified width.
--   				__Example using the default project font:__
--   				
--   @
--   
--   				# If using this method in a script that redraws constantly, move the
--   				# `default_font` declaration to a member variable assigned in `_ready()`
--   				# so the Control is only created once.
--   				var default_font = Control.new().get_font("font")
--   				draw_string(default_font, Vector2(64, 64), "Hello world")
--   				
--   @
--   
--   				See also @method Font.draw@.
draw_string ::
              (CanvasItem :< cls, Object :< cls) =>
              cls ->
                Font -> Vector2 -> GodotString -> Maybe Color -> Maybe Int -> IO ()
draw_string cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg4,
       maybe (VariantInt (-1)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_string"
           '[Font, Vector2, GodotString, Maybe Color, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_string

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

instance NodeMethod CanvasItem "draw_style_box" '[StyleBox, Rect2]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_style_box

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
               cls -> Texture -> Vector2 -> Maybe Color -> Maybe Texture -> IO ()
draw_texture cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg3,
       maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_texture"
           '[Texture, Vector2, Maybe Color, Maybe Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_texture

{-# NOINLINE bindCanvasItem_draw_texture_rect #-}

-- | Draws a textured rectangle at a given position, optionally modulated by a color. If @transpose@ is @true@, the texture will have its X and Y coordinates swapped.
bindCanvasItem_draw_texture_rect :: MethodBind
bindCanvasItem_draw_texture_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_texture_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a textured rectangle at a given position, optionally modulated by a color. If @transpose@ is @true@, the texture will have its X and Y coordinates swapped.
draw_texture_rect ::
                    (CanvasItem :< cls, Object :< cls) =>
                    cls ->
                      Texture ->
                        Rect2 ->
                          Bool -> Maybe Color -> Maybe Bool -> Maybe Texture -> IO ()
draw_texture_rect cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg4,
       maybe (VariantBool False) toVariant arg5,
       maybe VariantNil toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_texture_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_texture_rect"
           '[Texture, Rect2, Bool, Maybe Color, Maybe Bool, Maybe Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_texture_rect

{-# NOINLINE bindCanvasItem_draw_texture_rect_region #-}

-- | Draws a textured rectangle region at a given position, optionally modulated by a color. If @transpose@ is @true@, the texture will have its X and Y coordinates swapped.
bindCanvasItem_draw_texture_rect_region :: MethodBind
bindCanvasItem_draw_texture_rect_region
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "draw_texture_rect_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a textured rectangle region at a given position, optionally modulated by a color. If @transpose@ is @true@, the texture will have its X and Y coordinates swapped.
draw_texture_rect_region ::
                           (CanvasItem :< cls, Object :< cls) =>
                           cls ->
                             Texture ->
                               Rect2 ->
                                 Rect2 ->
                                   Maybe Color -> Maybe Bool -> Maybe Texture -> Maybe Bool -> IO ()
draw_texture_rect_region cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg4,
       maybe (VariantBool False) toVariant arg5,
       maybe VariantNil toVariant arg6,
       maybe (VariantBool True) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_draw_texture_rect_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "draw_texture_rect_region"
           '[Texture, Rect2, Rect2, Maybe Color, Maybe Bool, Maybe Texture,
             Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.draw_texture_rect_region

{-# NOINLINE bindCanvasItem_force_update_transform #-}

-- | Forces the transform to update. Transform changes in physics are not instant for performance reasons. Transforms are accumulated and then set. Use this if you need an up-to-date transform when doing physics operations.
bindCanvasItem_force_update_transform :: MethodBind
bindCanvasItem_force_update_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "force_update_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Forces the transform to update. Transform changes in physics are not instant for performance reasons. Transforms are accumulated and then set. Use this if you need an up-to-date transform when doing physics operations.
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

instance NodeMethod CanvasItem "force_update_transform" '[] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.force_update_transform

{-# NOINLINE bindCanvasItem_get_canvas #-}

-- | Returns the @RID@ of the @World2D@ canvas where this item is in.
bindCanvasItem_get_canvas :: MethodBind
bindCanvasItem_get_canvas
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @RID@ of the @World2D@ canvas where this item is in.
get_canvas :: (CanvasItem :< cls, Object :< cls) => cls -> IO Rid
get_canvas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_canvas (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "get_canvas" '[] (IO Rid) where
        nodeMethod = Godot.Core.CanvasItem.get_canvas

{-# NOINLINE bindCanvasItem_get_canvas_item #-}

-- | Returns the canvas item RID used by @VisualServer@ for this item.
bindCanvasItem_get_canvas_item :: MethodBind
bindCanvasItem_get_canvas_item
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_canvas_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the canvas item RID used by @VisualServer@ for this item.
get_canvas_item ::
                  (CanvasItem :< cls, Object :< cls) => cls -> IO Rid
get_canvas_item cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_canvas_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "get_canvas_item" '[] (IO Rid) where
        nodeMethod = Godot.Core.CanvasItem.get_canvas_item

{-# NOINLINE bindCanvasItem_get_canvas_transform #-}

-- | Returns the transform matrix of this item's canvas.
bindCanvasItem_get_canvas_transform :: MethodBind
bindCanvasItem_get_canvas_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform matrix of this item's canvas.
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

instance NodeMethod CanvasItem "get_canvas_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.CanvasItem.get_canvas_transform

{-# NOINLINE bindCanvasItem_get_global_mouse_position #-}

-- | Returns the global position of the mouse.
bindCanvasItem_get_global_mouse_position :: MethodBind
bindCanvasItem_get_global_mouse_position
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_global_mouse_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the global position of the mouse.
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

instance NodeMethod CanvasItem "get_global_mouse_position" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.CanvasItem.get_global_mouse_position

{-# NOINLINE bindCanvasItem_get_global_transform #-}

-- | Returns the global transform matrix of this item.
bindCanvasItem_get_global_transform :: MethodBind
bindCanvasItem_get_global_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the global transform matrix of this item.
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

instance NodeMethod CanvasItem "get_global_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.CanvasItem.get_global_transform

{-# NOINLINE bindCanvasItem_get_global_transform_with_canvas #-}

-- | Returns the global transform matrix of this item in relation to the canvas.
bindCanvasItem_get_global_transform_with_canvas :: MethodBind
bindCanvasItem_get_global_transform_with_canvas
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_global_transform_with_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the global transform matrix of this item in relation to the canvas.
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

instance NodeMethod CanvasItem "get_global_transform_with_canvas"
           '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.CanvasItem.get_global_transform_with_canvas

{-# NOINLINE bindCanvasItem_get_light_mask #-}

-- | The rendering layers in which this @CanvasItem@ responds to @Light2D@ nodes.
bindCanvasItem_get_light_mask :: MethodBind
bindCanvasItem_get_light_mask
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rendering layers in which this @CanvasItem@ responds to @Light2D@ nodes.
get_light_mask ::
                 (CanvasItem :< cls, Object :< cls) => cls -> IO Int
get_light_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_light_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "get_light_mask" '[] (IO Int) where
        nodeMethod = Godot.Core.CanvasItem.get_light_mask

{-# NOINLINE bindCanvasItem_get_local_mouse_position #-}

-- | Returns the mouse position relative to this item's position.
bindCanvasItem_get_local_mouse_position :: MethodBind
bindCanvasItem_get_local_mouse_position
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_local_mouse_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the mouse position relative to this item's position.
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

instance NodeMethod CanvasItem "get_local_mouse_position" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.CanvasItem.get_local_mouse_position

{-# NOINLINE bindCanvasItem_get_material #-}

-- | The material applied to textures on this @CanvasItem@.
bindCanvasItem_get_material :: MethodBind
bindCanvasItem_get_material
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material applied to textures on this @CanvasItem@.
get_material ::
               (CanvasItem :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "get_material" '[] (IO Material)
         where
        nodeMethod = Godot.Core.CanvasItem.get_material

{-# NOINLINE bindCanvasItem_get_modulate #-}

-- | The color applied to textures on this @CanvasItem@.
bindCanvasItem_get_modulate :: MethodBind
bindCanvasItem_get_modulate
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color applied to textures on this @CanvasItem@.
get_modulate ::
               (CanvasItem :< cls, Object :< cls) => cls -> IO Color
get_modulate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "get_modulate" '[] (IO Color) where
        nodeMethod = Godot.Core.CanvasItem.get_modulate

{-# NOINLINE bindCanvasItem_get_self_modulate #-}

-- | The color applied to textures on this @CanvasItem@. This is not inherited by children @CanvasItem@s.
bindCanvasItem_get_self_modulate :: MethodBind
bindCanvasItem_get_self_modulate
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_self_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color applied to textures on this @CanvasItem@. This is not inherited by children @CanvasItem@s.
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

instance NodeMethod CanvasItem "get_self_modulate" '[] (IO Color)
         where
        nodeMethod = Godot.Core.CanvasItem.get_self_modulate

{-# NOINLINE bindCanvasItem_get_transform #-}

-- | Returns the transform matrix of this item.
bindCanvasItem_get_transform :: MethodBind
bindCanvasItem_get_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform matrix of this item.
get_transform ::
                (CanvasItem :< cls, Object :< cls) => cls -> IO Transform2d
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "get_transform" '[] (IO Transform2d)
         where
        nodeMethod = Godot.Core.CanvasItem.get_transform

{-# NOINLINE bindCanvasItem_get_use_parent_material #-}

-- | If @true@, the parent @CanvasItem@'s @material@ property is used as this one's material.
bindCanvasItem_get_use_parent_material :: MethodBind
bindCanvasItem_get_use_parent_material
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_use_parent_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the parent @CanvasItem@'s @material@ property is used as this one's material.
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

instance NodeMethod CanvasItem "get_use_parent_material" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasItem.get_use_parent_material

{-# NOINLINE bindCanvasItem_get_viewport_rect #-}

-- | Returns the viewport's boundaries as a @Rect2@.
bindCanvasItem_get_viewport_rect :: MethodBind
bindCanvasItem_get_viewport_rect
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_viewport_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the viewport's boundaries as a @Rect2@.
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

instance NodeMethod CanvasItem "get_viewport_rect" '[] (IO Rect2)
         where
        nodeMethod = Godot.Core.CanvasItem.get_viewport_rect

{-# NOINLINE bindCanvasItem_get_viewport_transform #-}

-- | Returns this item's transform in relation to the viewport.
bindCanvasItem_get_viewport_transform :: MethodBind
bindCanvasItem_get_viewport_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_viewport_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns this item's transform in relation to the viewport.
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

instance NodeMethod CanvasItem "get_viewport_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.CanvasItem.get_viewport_transform

{-# NOINLINE bindCanvasItem_get_world_2d #-}

-- | Returns the @World2D@ where this item is in.
bindCanvasItem_get_world_2d :: MethodBind
bindCanvasItem_get_world_2d
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "get_world_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @World2D@ where this item is in.
get_world_2d ::
               (CanvasItem :< cls, Object :< cls) => cls -> IO World2D
get_world_2d cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_get_world_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "get_world_2d" '[] (IO World2D)
         where
        nodeMethod = Godot.Core.CanvasItem.get_world_2d

{-# NOINLINE bindCanvasItem_hide #-}

-- | Hide the @CanvasItem@ if it's currently visible.
bindCanvasItem_hide :: MethodBind
bindCanvasItem_hide
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "hide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Hide the @CanvasItem@ if it's currently visible.
hide :: (CanvasItem :< cls, Object :< cls) => cls -> IO ()
hide cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_hide (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "hide" '[] (IO ()) where
        nodeMethod = Godot.Core.CanvasItem.hide

{-# NOINLINE bindCanvasItem_is_draw_behind_parent_enabled #-}

-- | If @true@, the object draws behind its parent.
bindCanvasItem_is_draw_behind_parent_enabled :: MethodBind
bindCanvasItem_is_draw_behind_parent_enabled
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_draw_behind_parent_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the object draws behind its parent.
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

instance NodeMethod CanvasItem "is_draw_behind_parent_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasItem.is_draw_behind_parent_enabled

{-# NOINLINE bindCanvasItem_is_local_transform_notification_enabled
             #-}

-- | Returns @true@ if local transform notifications are communicated to children.
bindCanvasItem_is_local_transform_notification_enabled ::
                                                       MethodBind
bindCanvasItem_is_local_transform_notification_enabled
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_local_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if local transform notifications are communicated to children.
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

instance NodeMethod CanvasItem
           "is_local_transform_notification_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.CanvasItem.is_local_transform_notification_enabled

{-# NOINLINE bindCanvasItem_is_set_as_toplevel #-}

-- | Returns @true@ if the node is set as top-level. See @method set_as_toplevel@.
bindCanvasItem_is_set_as_toplevel :: MethodBind
bindCanvasItem_is_set_as_toplevel
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_set_as_toplevel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the node is set as top-level. See @method set_as_toplevel@.
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

instance NodeMethod CanvasItem "is_set_as_toplevel" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasItem.is_set_as_toplevel

{-# NOINLINE bindCanvasItem_is_transform_notification_enabled #-}

-- | Returns @true@ if global transform notifications are communicated to children.
bindCanvasItem_is_transform_notification_enabled :: MethodBind
bindCanvasItem_is_transform_notification_enabled
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_transform_notification_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if global transform notifications are communicated to children.
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

instance NodeMethod CanvasItem "is_transform_notification_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.CanvasItem.is_transform_notification_enabled

{-# NOINLINE bindCanvasItem_is_visible #-}

-- | If @true@, this @CanvasItem@ is drawn. The node is only visible if all of its antecedents are visible as well (in other words, @method is_visible_in_tree@ must return @true@).
--   			__Note:__ For controls that inherit @Popup@, the correct way to make them visible is to call one of the multiple @popup*()@ functions instead.
bindCanvasItem_is_visible :: MethodBind
bindCanvasItem_is_visible
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this @CanvasItem@ is drawn. The node is only visible if all of its antecedents are visible as well (in other words, @method is_visible_in_tree@ must return @true@).
--   			__Note:__ For controls that inherit @Popup@, the correct way to make them visible is to call one of the multiple @popup*()@ functions instead.
is_visible :: (CanvasItem :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_is_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "is_visible" '[] (IO Bool) where
        nodeMethod = Godot.Core.CanvasItem.is_visible

{-# NOINLINE bindCanvasItem_is_visible_in_tree #-}

-- | Returns @true@ if the node is present in the @SceneTree@, its @visible@ property is @true@ and all its antecedents are also visible. If any antecedent is hidden, this node will not be visible in the scene tree.
bindCanvasItem_is_visible_in_tree :: MethodBind
bindCanvasItem_is_visible_in_tree
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "is_visible_in_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the node is present in the @SceneTree@, its @visible@ property is @true@ and all its antecedents are also visible. If any antecedent is hidden, this node will not be visible in the scene tree.
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

instance NodeMethod CanvasItem "is_visible_in_tree" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CanvasItem.is_visible_in_tree

{-# NOINLINE bindCanvasItem_make_canvas_position_local #-}

-- | Assigns @screen_point@ as this node's new local transform.
bindCanvasItem_make_canvas_position_local :: MethodBind
bindCanvasItem_make_canvas_position_local
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "make_canvas_position_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns @screen_point@ as this node's new local transform.
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

instance NodeMethod CanvasItem "make_canvas_position_local"
           '[Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.CanvasItem.make_canvas_position_local

{-# NOINLINE bindCanvasItem_make_input_local #-}

-- | Transformations issued by @event@'s inputs are applied in local space instead of global space.
bindCanvasItem_make_input_local :: MethodBind
bindCanvasItem_make_input_local
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "make_input_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Transformations issued by @event@'s inputs are applied in local space instead of global space.
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

instance NodeMethod CanvasItem "make_input_local" '[InputEvent]
           (IO InputEvent)
         where
        nodeMethod = Godot.Core.CanvasItem.make_input_local

{-# NOINLINE bindCanvasItem_set_as_toplevel #-}

-- | If @enable@ is @true@, the node won't inherit its transform from parent canvas items.
bindCanvasItem_set_as_toplevel :: MethodBind
bindCanvasItem_set_as_toplevel
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_as_toplevel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @enable@ is @true@, the node won't inherit its transform from parent canvas items.
set_as_toplevel ::
                  (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_as_toplevel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_as_toplevel (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "set_as_toplevel" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_as_toplevel

{-# NOINLINE bindCanvasItem_set_draw_behind_parent #-}

-- | If @true@, the object draws behind its parent.
bindCanvasItem_set_draw_behind_parent :: MethodBind
bindCanvasItem_set_draw_behind_parent
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_draw_behind_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the object draws behind its parent.
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

instance NodeMethod CanvasItem "set_draw_behind_parent" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_draw_behind_parent

{-# NOINLINE bindCanvasItem_set_light_mask #-}

-- | The rendering layers in which this @CanvasItem@ responds to @Light2D@ nodes.
bindCanvasItem_set_light_mask :: MethodBind
bindCanvasItem_set_light_mask
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rendering layers in which this @CanvasItem@ responds to @Light2D@ nodes.
set_light_mask ::
                 (CanvasItem :< cls, Object :< cls) => cls -> Int -> IO ()
set_light_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_light_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "set_light_mask" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_light_mask

{-# NOINLINE bindCanvasItem_set_material #-}

-- | The material applied to textures on this @CanvasItem@.
bindCanvasItem_set_material :: MethodBind
bindCanvasItem_set_material
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material applied to textures on this @CanvasItem@.
set_material ::
               (CanvasItem :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "set_material" '[Material] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_material

{-# NOINLINE bindCanvasItem_set_modulate #-}

-- | The color applied to textures on this @CanvasItem@.
bindCanvasItem_set_modulate :: MethodBind
bindCanvasItem_set_modulate
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color applied to textures on this @CanvasItem@.
set_modulate ::
               (CanvasItem :< cls, Object :< cls) => cls -> Color -> IO ()
set_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "set_modulate" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_modulate

{-# NOINLINE bindCanvasItem_set_notify_local_transform #-}

-- | If @enable@ is @true@, children will be updated with local transform data.
bindCanvasItem_set_notify_local_transform :: MethodBind
bindCanvasItem_set_notify_local_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_notify_local_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @enable@ is @true@, children will be updated with local transform data.
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

instance NodeMethod CanvasItem "set_notify_local_transform" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_notify_local_transform

{-# NOINLINE bindCanvasItem_set_notify_transform #-}

-- | If @enable@ is @true@, children will be updated with global transform data.
bindCanvasItem_set_notify_transform :: MethodBind
bindCanvasItem_set_notify_transform
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_notify_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @enable@ is @true@, children will be updated with global transform data.
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

instance NodeMethod CanvasItem "set_notify_transform" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_notify_transform

{-# NOINLINE bindCanvasItem_set_self_modulate #-}

-- | The color applied to textures on this @CanvasItem@. This is not inherited by children @CanvasItem@s.
bindCanvasItem_set_self_modulate :: MethodBind
bindCanvasItem_set_self_modulate
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_self_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color applied to textures on this @CanvasItem@. This is not inherited by children @CanvasItem@s.
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

instance NodeMethod CanvasItem "set_self_modulate" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_self_modulate

{-# NOINLINE bindCanvasItem_set_use_parent_material #-}

-- | If @true@, the parent @CanvasItem@'s @material@ property is used as this one's material.
bindCanvasItem_set_use_parent_material :: MethodBind
bindCanvasItem_set_use_parent_material
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_use_parent_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the parent @CanvasItem@'s @material@ property is used as this one's material.
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

instance NodeMethod CanvasItem "set_use_parent_material" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CanvasItem.set_use_parent_material

{-# NOINLINE bindCanvasItem_set_visible #-}

-- | If @true@, this @CanvasItem@ is drawn. The node is only visible if all of its antecedents are visible as well (in other words, @method is_visible_in_tree@ must return @true@).
--   			__Note:__ For controls that inherit @Popup@, the correct way to make them visible is to call one of the multiple @popup*()@ functions instead.
bindCanvasItem_set_visible :: MethodBind
bindCanvasItem_set_visible
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this @CanvasItem@ is drawn. The node is only visible if all of its antecedents are visible as well (in other words, @method is_visible_in_tree@ must return @true@).
--   			__Note:__ For controls that inherit @Popup@, the correct way to make them visible is to call one of the multiple @popup*()@ functions instead.
set_visible ::
              (CanvasItem :< cls, Object :< cls) => cls -> Bool -> IO ()
set_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_set_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "set_visible" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.CanvasItem.set_visible

{-# NOINLINE bindCanvasItem_show #-}

-- | Show the @CanvasItem@ if it's currently hidden. For controls that inherit @Popup@, the correct way to make them visible is to call one of the multiple @popup*()@ functions instead.
bindCanvasItem_show :: MethodBind
bindCanvasItem_show
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "show" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Show the @CanvasItem@ if it's currently hidden. For controls that inherit @Popup@, the correct way to make them visible is to call one of the multiple @popup*()@ functions instead.
show :: (CanvasItem :< cls, Object :< cls) => cls -> IO ()
show cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_show (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "show" '[] (IO ()) where
        nodeMethod = Godot.Core.CanvasItem.show

{-# NOINLINE bindCanvasItem_update #-}

-- | Queue the @CanvasItem@ for update. @NOTIFICATION_DRAW@ will be called on idle time to request redraw.
bindCanvasItem_update :: MethodBind
bindCanvasItem_update
  = unsafePerformIO $
      withCString "CanvasItem" $
        \ clsNamePtr ->
          withCString "update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queue the @CanvasItem@ for update. @NOTIFICATION_DRAW@ will be called on idle time to request redraw.
update :: (CanvasItem :< cls, Object :< cls) => cls -> IO ()
update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasItem_update (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasItem "update" '[] (IO ()) where
        nodeMethod = Godot.Core.CanvasItem.update