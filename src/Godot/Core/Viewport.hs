{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Viewport
       (Godot.Core.Viewport._CLEAR_MODE_ONLY_NEXT_FRAME,
        Godot.Core.Viewport._DEBUG_DRAW_OVERDRAW,
        Godot.Core.Viewport._UPDATE_ALWAYS,
        Godot.Core.Viewport._RENDER_INFO_MATERIAL_CHANGES_IN_FRAME,
        Godot.Core.Viewport._USAGE_3D, Godot.Core.Viewport._MSAA_4X,
        Godot.Core.Viewport._SHADOW_ATLAS_QUADRANT_SUBDIV_1024,
        Godot.Core.Viewport._SHADOW_ATLAS_QUADRANT_SUBDIV_16,
        Godot.Core.Viewport._RENDER_INFO_SHADER_CHANGES_IN_FRAME,
        Godot.Core.Viewport._RENDER_INFO_MAX,
        Godot.Core.Viewport._CLEAR_MODE_NEVER,
        Godot.Core.Viewport._SHADOW_ATLAS_QUADRANT_SUBDIV_64,
        Godot.Core.Viewport._USAGE_3D_NO_EFFECTS,
        Godot.Core.Viewport._RENDER_INFO_OBJECTS_IN_FRAME,
        Godot.Core.Viewport._MSAA_2X,
        Godot.Core.Viewport._SHADOW_ATLAS_QUADRANT_SUBDIV_256,
        Godot.Core.Viewport._SHADOW_ATLAS_QUADRANT_SUBDIV_MAX,
        Godot.Core.Viewport._UPDATE_DISABLED,
        Godot.Core.Viewport._MSAA_DISABLED,
        Godot.Core.Viewport._DEBUG_DRAW_DISABLED,
        Godot.Core.Viewport._MSAA_8X, Godot.Core.Viewport._USAGE_2D,
        Godot.Core.Viewport._RENDER_INFO_VERTICES_IN_FRAME,
        Godot.Core.Viewport._SHADOW_ATLAS_QUADRANT_SUBDIV_DISABLED,
        Godot.Core.Viewport._DEBUG_DRAW_UNSHADED,
        Godot.Core.Viewport._DEBUG_DRAW_WIREFRAME,
        Godot.Core.Viewport._RENDER_INFO_DRAW_CALLS_IN_FRAME,
        Godot.Core.Viewport._UPDATE_WHEN_VISIBLE,
        Godot.Core.Viewport._CLEAR_MODE_ALWAYS,
        Godot.Core.Viewport._SHADOW_ATLAS_QUADRANT_SUBDIV_1,
        Godot.Core.Viewport._MSAA_16X,
        Godot.Core.Viewport._SHADOW_ATLAS_QUADRANT_SUBDIV_4,
        Godot.Core.Viewport._USAGE_2D_NO_SAMPLING,
        Godot.Core.Viewport._UPDATE_ONCE,
        Godot.Core.Viewport._RENDER_INFO_SURFACE_CHANGES_IN_FRAME,
        Godot.Core.Viewport.sig_size_changed,
        Godot.Core.Viewport.set_use_arvr, Godot.Core.Viewport.use_arvr,
        Godot.Core.Viewport.set_size, Godot.Core.Viewport.get_size,
        Godot.Core.Viewport.set_world_2d, Godot.Core.Viewport.get_world_2d,
        Godot.Core.Viewport.find_world_2d, Godot.Core.Viewport.set_world,
        Godot.Core.Viewport.get_world, Godot.Core.Viewport.find_world,
        Godot.Core.Viewport.set_canvas_transform,
        Godot.Core.Viewport.get_canvas_transform,
        Godot.Core.Viewport.set_global_canvas_transform,
        Godot.Core.Viewport.get_global_canvas_transform,
        Godot.Core.Viewport.get_final_transform,
        Godot.Core.Viewport.get_visible_rect,
        Godot.Core.Viewport.set_transparent_background,
        Godot.Core.Viewport.has_transparent_background,
        Godot.Core.Viewport._vp_input, Godot.Core.Viewport._vp_input_text,
        Godot.Core.Viewport._vp_unhandled_input,
        Godot.Core.Viewport.set_size_override,
        Godot.Core.Viewport.get_size_override,
        Godot.Core.Viewport.is_size_override_enabled,
        Godot.Core.Viewport.set_size_override_stretch,
        Godot.Core.Viewport.is_size_override_stretch_enabled,
        Godot.Core.Viewport.set_vflip, Godot.Core.Viewport.get_vflip,
        Godot.Core.Viewport.set_clear_mode,
        Godot.Core.Viewport.get_clear_mode,
        Godot.Core.Viewport.set_update_mode,
        Godot.Core.Viewport.get_update_mode, Godot.Core.Viewport.set_msaa,
        Godot.Core.Viewport.get_msaa, Godot.Core.Viewport.set_hdr,
        Godot.Core.Viewport.get_hdr, Godot.Core.Viewport.set_usage,
        Godot.Core.Viewport.get_usage, Godot.Core.Viewport.set_debug_draw,
        Godot.Core.Viewport.get_debug_draw,
        Godot.Core.Viewport.get_render_info,
        Godot.Core.Viewport.get_texture,
        Godot.Core.Viewport.set_physics_object_picking,
        Godot.Core.Viewport.get_physics_object_picking,
        Godot.Core.Viewport.get_viewport_rid, Godot.Core.Viewport.input,
        Godot.Core.Viewport.unhandled_input,
        Godot.Core.Viewport.update_worlds,
        Godot.Core.Viewport.set_use_own_world,
        Godot.Core.Viewport.is_using_own_world,
        Godot.Core.Viewport.get_camera,
        Godot.Core.Viewport.set_as_audio_listener,
        Godot.Core.Viewport.is_audio_listener,
        Godot.Core.Viewport.set_as_audio_listener_2d,
        Godot.Core.Viewport.is_audio_listener_2d,
        Godot.Core.Viewport.set_attach_to_screen_rect,
        Godot.Core.Viewport.get_mouse_position,
        Godot.Core.Viewport.warp_mouse,
        Godot.Core.Viewport.gui_has_modal_stack,
        Godot.Core.Viewport.gui_get_drag_data,
        Godot.Core.Viewport.gui_is_dragging,
        Godot.Core.Viewport.get_modal_stack_top,
        Godot.Core.Viewport.set_disable_input,
        Godot.Core.Viewport.is_input_disabled,
        Godot.Core.Viewport.set_disable_3d,
        Godot.Core.Viewport.is_3d_disabled,
        Godot.Core.Viewport.set_keep_3d_linear,
        Godot.Core.Viewport.get_keep_3d_linear,
        Godot.Core.Viewport._gui_show_tooltip,
        Godot.Core.Viewport._gui_remove_focus,
        Godot.Core.Viewport._post_gui_grab_click_focus,
        Godot.Core.Viewport.set_shadow_atlas_size,
        Godot.Core.Viewport.get_shadow_atlas_size,
        Godot.Core.Viewport.set_snap_controls_to_pixels,
        Godot.Core.Viewport.is_snap_controls_to_pixels_enabled,
        Godot.Core.Viewport.set_shadow_atlas_quadrant_subdiv,
        Godot.Core.Viewport.get_shadow_atlas_quadrant_subdiv,
        Godot.Core.Viewport.set_input_as_handled,
        Godot.Core.Viewport.is_input_handled,
        Godot.Core.Viewport.set_handle_input_locally,
        Godot.Core.Viewport.is_handling_input_locally,
        Godot.Core.Viewport._subwindow_visibility_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_CLEAR_MODE_ONLY_NEXT_FRAME :: Int
_CLEAR_MODE_ONLY_NEXT_FRAME = 2

_DEBUG_DRAW_OVERDRAW :: Int
_DEBUG_DRAW_OVERDRAW = 2

_UPDATE_ALWAYS :: Int
_UPDATE_ALWAYS = 3

_RENDER_INFO_MATERIAL_CHANGES_IN_FRAME :: Int
_RENDER_INFO_MATERIAL_CHANGES_IN_FRAME = 2

_USAGE_3D :: Int
_USAGE_3D = 2

_MSAA_4X :: Int
_MSAA_4X = 2

_SHADOW_ATLAS_QUADRANT_SUBDIV_1024 :: Int
_SHADOW_ATLAS_QUADRANT_SUBDIV_1024 = 6

_SHADOW_ATLAS_QUADRANT_SUBDIV_16 :: Int
_SHADOW_ATLAS_QUADRANT_SUBDIV_16 = 3

_RENDER_INFO_SHADER_CHANGES_IN_FRAME :: Int
_RENDER_INFO_SHADER_CHANGES_IN_FRAME = 3

_RENDER_INFO_MAX :: Int
_RENDER_INFO_MAX = 6

_CLEAR_MODE_NEVER :: Int
_CLEAR_MODE_NEVER = 1

_SHADOW_ATLAS_QUADRANT_SUBDIV_64 :: Int
_SHADOW_ATLAS_QUADRANT_SUBDIV_64 = 4

_USAGE_3D_NO_EFFECTS :: Int
_USAGE_3D_NO_EFFECTS = 3

_RENDER_INFO_OBJECTS_IN_FRAME :: Int
_RENDER_INFO_OBJECTS_IN_FRAME = 0

_MSAA_2X :: Int
_MSAA_2X = 1

_SHADOW_ATLAS_QUADRANT_SUBDIV_256 :: Int
_SHADOW_ATLAS_QUADRANT_SUBDIV_256 = 5

_SHADOW_ATLAS_QUADRANT_SUBDIV_MAX :: Int
_SHADOW_ATLAS_QUADRANT_SUBDIV_MAX = 7

_UPDATE_DISABLED :: Int
_UPDATE_DISABLED = 0

_MSAA_DISABLED :: Int
_MSAA_DISABLED = 0

_DEBUG_DRAW_DISABLED :: Int
_DEBUG_DRAW_DISABLED = 0

_MSAA_8X :: Int
_MSAA_8X = 3

_USAGE_2D :: Int
_USAGE_2D = 0

_RENDER_INFO_VERTICES_IN_FRAME :: Int
_RENDER_INFO_VERTICES_IN_FRAME = 1

_SHADOW_ATLAS_QUADRANT_SUBDIV_DISABLED :: Int
_SHADOW_ATLAS_QUADRANT_SUBDIV_DISABLED = 0

_DEBUG_DRAW_UNSHADED :: Int
_DEBUG_DRAW_UNSHADED = 1

_DEBUG_DRAW_WIREFRAME :: Int
_DEBUG_DRAW_WIREFRAME = 3

_RENDER_INFO_DRAW_CALLS_IN_FRAME :: Int
_RENDER_INFO_DRAW_CALLS_IN_FRAME = 5

_UPDATE_WHEN_VISIBLE :: Int
_UPDATE_WHEN_VISIBLE = 2

_CLEAR_MODE_ALWAYS :: Int
_CLEAR_MODE_ALWAYS = 0

_SHADOW_ATLAS_QUADRANT_SUBDIV_1 :: Int
_SHADOW_ATLAS_QUADRANT_SUBDIV_1 = 1

_MSAA_16X :: Int
_MSAA_16X = 4

_SHADOW_ATLAS_QUADRANT_SUBDIV_4 :: Int
_SHADOW_ATLAS_QUADRANT_SUBDIV_4 = 2

_USAGE_2D_NO_SAMPLING :: Int
_USAGE_2D_NO_SAMPLING = 1

_UPDATE_ONCE :: Int
_UPDATE_ONCE = 1

_RENDER_INFO_SURFACE_CHANGES_IN_FRAME :: Int
_RENDER_INFO_SURFACE_CHANGES_IN_FRAME = 4

-- | Emitted when the size of the viewport is changed, whether by [method set_size_override], resize of window, or some other means.
sig_size_changed :: Godot.Internal.Dispatch.Signal Viewport
sig_size_changed = Godot.Internal.Dispatch.Signal "size_changed"

{-# NOINLINE bindViewport_set_use_arvr #-}

-- | If [code]true[/code], the viewport will be used in AR/VR process. Default value: [code]false[/code].
bindViewport_set_use_arvr :: MethodBind
bindViewport_set_use_arvr
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_use_arvr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will be used in AR/VR process. Default value: [code]false[/code].
set_use_arvr ::
               (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_arvr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_use_arvr (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_use_arvr #-}

-- | If [code]true[/code], the viewport will be used in AR/VR process. Default value: [code]false[/code].
bindViewport_use_arvr :: MethodBind
bindViewport_use_arvr
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "use_arvr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will be used in AR/VR process. Default value: [code]false[/code].
use_arvr :: (Viewport :< cls, Object :< cls) => cls -> IO Bool
use_arvr cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_use_arvr (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_size #-}

-- | The width and height of viewport.
bindViewport_set_size :: MethodBind
bindViewport_set_size
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width and height of viewport.
set_size ::
           (Viewport :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_size #-}

-- | The width and height of viewport.
bindViewport_get_size :: MethodBind
bindViewport_get_size
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width and height of viewport.
get_size :: (Viewport :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_world_2d #-}

-- | The custom [World2D] which can be used as 2D environment source.
bindViewport_set_world_2d :: MethodBind
bindViewport_set_world_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_world_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [World2D] which can be used as 2D environment source.
set_world_2d ::
               (Viewport :< cls, Object :< cls) => cls -> World2D -> IO ()
set_world_2d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_world_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_world_2d #-}

-- | The custom [World2D] which can be used as 2D environment source.
bindViewport_get_world_2d :: MethodBind
bindViewport_get_world_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_world_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [World2D] which can be used as 2D environment source.
get_world_2d ::
               (Viewport :< cls, Object :< cls) => cls -> IO World2D
get_world_2d cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_world_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_find_world_2d #-}

-- | Returns the 2D world of the viewport.
bindViewport_find_world_2d :: MethodBind
bindViewport_find_world_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "find_world_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 2D world of the viewport.
find_world_2d ::
                (Viewport :< cls, Object :< cls) => cls -> IO World2D
find_world_2d cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_find_world_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_world #-}

-- | The custom [World] which can be used as 3D environment source.
bindViewport_set_world :: MethodBind
bindViewport_set_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [World] which can be used as 3D environment source.
set_world ::
            (Viewport :< cls, Object :< cls) => cls -> World -> IO ()
set_world cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_world #-}

-- | The custom [World] which can be used as 3D environment source.
bindViewport_get_world :: MethodBind
bindViewport_get_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [World] which can be used as 3D environment source.
get_world :: (Viewport :< cls, Object :< cls) => cls -> IO World
get_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_find_world #-}

-- | Returns the 3D world of the viewport, or if none the world of the parent viewport.
bindViewport_find_world :: MethodBind
bindViewport_find_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "find_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 3D world of the viewport, or if none the world of the parent viewport.
find_world :: (Viewport :< cls, Object :< cls) => cls -> IO World
find_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_find_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_canvas_transform #-}

-- | The canvas transform of the viewport, useful for changing the on-screen positions of all child [CanvasItem]s. This is relative to the global canvas transform of the viewport.
bindViewport_set_canvas_transform :: MethodBind
bindViewport_set_canvas_transform
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The canvas transform of the viewport, useful for changing the on-screen positions of all child [CanvasItem]s. This is relative to the global canvas transform of the viewport.
set_canvas_transform ::
                       (Viewport :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_canvas_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_canvas_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_canvas_transform #-}

-- | The canvas transform of the viewport, useful for changing the on-screen positions of all child [CanvasItem]s. This is relative to the global canvas transform of the viewport.
bindViewport_get_canvas_transform :: MethodBind
bindViewport_get_canvas_transform
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The canvas transform of the viewport, useful for changing the on-screen positions of all child [CanvasItem]s. This is relative to the global canvas transform of the viewport.
get_canvas_transform ::
                       (Viewport :< cls, Object :< cls) => cls -> IO Transform2d
get_canvas_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_canvas_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_global_canvas_transform #-}

-- | The global canvas transform of the viewport. The canvas transform is relative to this.
bindViewport_set_global_canvas_transform :: MethodBind
bindViewport_set_global_canvas_transform
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_global_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global canvas transform of the viewport. The canvas transform is relative to this.
set_global_canvas_transform ::
                              (Viewport :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_global_canvas_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_global_canvas_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_global_canvas_transform #-}

-- | The global canvas transform of the viewport. The canvas transform is relative to this.
bindViewport_get_global_canvas_transform :: MethodBind
bindViewport_get_global_canvas_transform
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_global_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The global canvas transform of the viewport. The canvas transform is relative to this.
get_global_canvas_transform ::
                              (Viewport :< cls, Object :< cls) => cls -> IO Transform2d
get_global_canvas_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_global_canvas_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_final_transform #-}

-- | Returns the total transform of the viewport.
bindViewport_get_final_transform :: MethodBind
bindViewport_get_final_transform
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_final_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total transform of the viewport.
get_final_transform ::
                      (Viewport :< cls, Object :< cls) => cls -> IO Transform2d
get_final_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_final_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_visible_rect #-}

-- | Returns the visible rectangle in global screen coordinates.
bindViewport_get_visible_rect :: MethodBind
bindViewport_get_visible_rect
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_visible_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the visible rectangle in global screen coordinates.
get_visible_rect ::
                   (Viewport :< cls, Object :< cls) => cls -> IO Rect2
get_visible_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_visible_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_transparent_background #-}

-- | If [code]true[/code], the viewport should render its background as transparent. Default value: [code]false[/code].
bindViewport_set_transparent_background :: MethodBind
bindViewport_set_transparent_background
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_transparent_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport should render its background as transparent. Default value: [code]false[/code].
set_transparent_background ::
                             (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_transparent_background cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_transparent_background
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_has_transparent_background #-}

-- | If [code]true[/code], the viewport should render its background as transparent. Default value: [code]false[/code].
bindViewport_has_transparent_background :: MethodBind
bindViewport_has_transparent_background
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "has_transparent_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport should render its background as transparent. Default value: [code]false[/code].
has_transparent_background ::
                             (Viewport :< cls, Object :< cls) => cls -> IO Bool
has_transparent_background cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_has_transparent_background
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport__vp_input #-}

bindViewport__vp_input :: MethodBind
bindViewport__vp_input
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "_vp_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_vp_input ::
            (Viewport :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_vp_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport__vp_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport__vp_input_text #-}

bindViewport__vp_input_text :: MethodBind
bindViewport__vp_input_text
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "_vp_input_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_vp_input_text ::
                 (Viewport :< cls, Object :< cls) => cls -> GodotString -> IO ()
_vp_input_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport__vp_input_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport__vp_unhandled_input #-}

bindViewport__vp_unhandled_input :: MethodBind
bindViewport__vp_unhandled_input
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "_vp_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_vp_unhandled_input ::
                      (Viewport :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_vp_unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport__vp_unhandled_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_size_override #-}

-- | Sets the size override of the viewport. If the [code]enable[/code] parameter is [code]true[/code] the override is used, otherwise it uses the default size. If the size parameter is [code](-1, -1)[/code], it won't update the size.
bindViewport_set_size_override :: MethodBind
bindViewport_set_size_override
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_size_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size override of the viewport. If the [code]enable[/code] parameter is [code]true[/code] the override is used, otherwise it uses the default size. If the size parameter is [code](-1, -1)[/code], it won't update the size.
set_size_override ::
                    (Viewport :< cls, Object :< cls) =>
                    cls -> Bool -> Vector2 -> Vector2 -> IO ()
set_size_override cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_size_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_size_override #-}

-- | Returns the size override set with [method set_size_override].
bindViewport_get_size_override :: MethodBind
bindViewport_get_size_override
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_size_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size override set with [method set_size_override].
get_size_override ::
                    (Viewport :< cls, Object :< cls) => cls -> IO Vector2
get_size_override cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_size_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_size_override_enabled #-}

-- | Returns [code]true[/code] if the size override is enabled. See [method set_size_override].
bindViewport_is_size_override_enabled :: MethodBind
bindViewport_is_size_override_enabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_size_override_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the size override is enabled. See [method set_size_override].
is_size_override_enabled ::
                           (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_size_override_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_size_override_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_size_override_stretch #-}

-- | If [code]true[/code], the size override affects stretch as well.
bindViewport_set_size_override_stretch :: MethodBind
bindViewport_set_size_override_stretch
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_size_override_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the size override affects stretch as well.
set_size_override_stretch ::
                            (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_size_override_stretch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_size_override_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_size_override_stretch_enabled #-}

-- | Returns [code]true[/code] if the size stretch override is enabled. See [method set_size_override_stretch].
bindViewport_is_size_override_stretch_enabled :: MethodBind
bindViewport_is_size_override_stretch_enabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_size_override_stretch_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the size stretch override is enabled. See [method set_size_override_stretch].
is_size_override_stretch_enabled ::
                                   (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_size_override_stretch_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindViewport_is_size_override_stretch_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_vflip #-}

-- | If [code]true[/code], the result of rendering will be flipped vertically. Default value: [code]false[/code].
bindViewport_set_vflip :: MethodBind
bindViewport_set_vflip
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_vflip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the result of rendering will be flipped vertically. Default value: [code]false[/code].
set_vflip ::
            (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_vflip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_vflip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_vflip #-}

-- | If [code]true[/code], the result of rendering will be flipped vertically. Default value: [code]false[/code].
bindViewport_get_vflip :: MethodBind
bindViewport_get_vflip
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_vflip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the result of rendering will be flipped vertically. Default value: [code]false[/code].
get_vflip :: (Viewport :< cls, Object :< cls) => cls -> IO Bool
get_vflip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_vflip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_clear_mode #-}

-- | The clear mode when viewport used as a render target. Default value: [code]CLEAR_MODE_ALWAYS[/code].
bindViewport_set_clear_mode :: MethodBind
bindViewport_set_clear_mode
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_clear_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The clear mode when viewport used as a render target. Default value: [code]CLEAR_MODE_ALWAYS[/code].
set_clear_mode ::
                 (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_clear_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_clear_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_clear_mode #-}

-- | The clear mode when viewport used as a render target. Default value: [code]CLEAR_MODE_ALWAYS[/code].
bindViewport_get_clear_mode :: MethodBind
bindViewport_get_clear_mode
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_clear_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The clear mode when viewport used as a render target. Default value: [code]CLEAR_MODE_ALWAYS[/code].
get_clear_mode :: (Viewport :< cls, Object :< cls) => cls -> IO Int
get_clear_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_clear_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_update_mode #-}

-- | The update mode when viewport used as a render target. Default value: [code]UPDATE_WHEN_VISIBLE[/code].
bindViewport_set_update_mode :: MethodBind
bindViewport_set_update_mode
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The update mode when viewport used as a render target. Default value: [code]UPDATE_WHEN_VISIBLE[/code].
set_update_mode ::
                  (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_update_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_update_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_update_mode #-}

-- | The update mode when viewport used as a render target. Default value: [code]UPDATE_WHEN_VISIBLE[/code].
bindViewport_get_update_mode :: MethodBind
bindViewport_get_update_mode
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The update mode when viewport used as a render target. Default value: [code]UPDATE_WHEN_VISIBLE[/code].
get_update_mode ::
                  (Viewport :< cls, Object :< cls) => cls -> IO Int
get_update_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_update_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_msaa #-}

-- | The multisample anti-aliasing mode. Default value: [code]MSAA_DISABLED[/code].
bindViewport_set_msaa :: MethodBind
bindViewport_set_msaa
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_msaa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The multisample anti-aliasing mode. Default value: [code]MSAA_DISABLED[/code].
set_msaa :: (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_msaa cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_msaa (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_msaa #-}

-- | The multisample anti-aliasing mode. Default value: [code]MSAA_DISABLED[/code].
bindViewport_get_msaa :: MethodBind
bindViewport_get_msaa
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_msaa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The multisample anti-aliasing mode. Default value: [code]MSAA_DISABLED[/code].
get_msaa :: (Viewport :< cls, Object :< cls) => cls -> IO Int
get_msaa cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_msaa (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_hdr #-}

-- | If [code]true[/code], the viewport rendering will receive benefits from High Dynamic Range algorithm. Default value: [code]true[/code].
bindViewport_set_hdr :: MethodBind
bindViewport_set_hdr
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport rendering will receive benefits from High Dynamic Range algorithm. Default value: [code]true[/code].
set_hdr :: (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hdr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_hdr (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_hdr #-}

-- | If [code]true[/code], the viewport rendering will receive benefits from High Dynamic Range algorithm. Default value: [code]true[/code].
bindViewport_get_hdr :: MethodBind
bindViewport_get_hdr
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport rendering will receive benefits from High Dynamic Range algorithm. Default value: [code]true[/code].
get_hdr :: (Viewport :< cls, Object :< cls) => cls -> IO Bool
get_hdr cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_hdr (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_usage #-}

-- | The rendering mode of viewport. Default value: [code]USAGE_3D[/code].
bindViewport_set_usage :: MethodBind
bindViewport_set_usage
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rendering mode of viewport. Default value: [code]USAGE_3D[/code].
set_usage ::
            (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_usage cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_usage (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_usage #-}

-- | The rendering mode of viewport. Default value: [code]USAGE_3D[/code].
bindViewport_get_usage :: MethodBind
bindViewport_get_usage
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rendering mode of viewport. Default value: [code]USAGE_3D[/code].
get_usage :: (Viewport :< cls, Object :< cls) => cls -> IO Int
get_usage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_usage (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_debug_draw #-}

-- | The overlay mode for test rendered geometry in debug purposes. Default value: [code]DEBUG_DRAW_DISABLED[/code].
bindViewport_set_debug_draw :: MethodBind
bindViewport_set_debug_draw
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_debug_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The overlay mode for test rendered geometry in debug purposes. Default value: [code]DEBUG_DRAW_DISABLED[/code].
set_debug_draw ::
                 (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_debug_draw cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_debug_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_debug_draw #-}

-- | The overlay mode for test rendered geometry in debug purposes. Default value: [code]DEBUG_DRAW_DISABLED[/code].
bindViewport_get_debug_draw :: MethodBind
bindViewport_get_debug_draw
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_debug_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The overlay mode for test rendered geometry in debug purposes. Default value: [code]DEBUG_DRAW_DISABLED[/code].
get_debug_draw :: (Viewport :< cls, Object :< cls) => cls -> IO Int
get_debug_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_debug_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_render_info #-}

-- | Returns information about the viewport from the rendering pipeline.
bindViewport_get_render_info :: MethodBind
bindViewport_get_render_info
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_render_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns information about the viewport from the rendering pipeline.
get_render_info ::
                  (Viewport :< cls, Object :< cls) => cls -> Int -> IO Int
get_render_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_render_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_texture #-}

-- | Returns the viewport's texture. Note that due to the way OpenGL works, the resulting [ViewportTexture] is flipped vertically. You can use [method Image.flip_y] on the result of [method Texture.get_data] to flip it back, for example:
--   				[codeblock]
--   				var img = get_viewport().get_texture().get_data()
--   				img.flip_y()
--   				[/codeblock]
bindViewport_get_texture :: MethodBind
bindViewport_get_texture
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the viewport's texture. Note that due to the way OpenGL works, the resulting [ViewportTexture] is flipped vertically. You can use [method Image.flip_y] on the result of [method Texture.get_data] to flip it back, for example:
--   				[codeblock]
--   				var img = get_viewport().get_texture().get_data()
--   				img.flip_y()
--   				[/codeblock]
get_texture ::
              (Viewport :< cls, Object :< cls) => cls -> IO ViewportTexture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_physics_object_picking #-}

-- | If [code]true[/code], the objects rendered by viewport become subjects of mouse picking process. Default value: [code]false[/code].
bindViewport_set_physics_object_picking :: MethodBind
bindViewport_set_physics_object_picking
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_physics_object_picking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the objects rendered by viewport become subjects of mouse picking process. Default value: [code]false[/code].
set_physics_object_picking ::
                             (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_physics_object_picking cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_physics_object_picking
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_physics_object_picking #-}

-- | If [code]true[/code], the objects rendered by viewport become subjects of mouse picking process. Default value: [code]false[/code].
bindViewport_get_physics_object_picking :: MethodBind
bindViewport_get_physics_object_picking
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_physics_object_picking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the objects rendered by viewport become subjects of mouse picking process. Default value: [code]false[/code].
get_physics_object_picking ::
                             (Viewport :< cls, Object :< cls) => cls -> IO Bool
get_physics_object_picking cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_physics_object_picking
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_viewport_rid #-}

-- | Returns the viewport's RID from the [VisualServer].
bindViewport_get_viewport_rid :: MethodBind
bindViewport_get_viewport_rid
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_viewport_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the viewport's RID from the [VisualServer].
get_viewport_rid ::
                   (Viewport :< cls, Object :< cls) => cls -> IO Rid
get_viewport_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_viewport_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_input #-}

bindViewport_input :: MethodBind
bindViewport_input
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

input ::
        (Viewport :< cls, Object :< cls) => cls -> InputEvent -> IO ()
input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_input (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_unhandled_input #-}

bindViewport_unhandled_input :: MethodBind
bindViewport_unhandled_input
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

unhandled_input ::
                  (Viewport :< cls, Object :< cls) => cls -> InputEvent -> IO ()
unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_unhandled_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_update_worlds #-}

-- | Forces update of the 2D and 3D worlds.
bindViewport_update_worlds :: MethodBind
bindViewport_update_worlds
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "update_worlds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Forces update of the 2D and 3D worlds.
update_worlds :: (Viewport :< cls, Object :< cls) => cls -> IO ()
update_worlds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_update_worlds (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_use_own_world #-}

-- | If [code]true[/code], the viewport will use [World] defined in [code]world[/code] property. Default value: [code]false[/code].
bindViewport_set_use_own_world :: MethodBind
bindViewport_set_use_own_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_use_own_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will use [World] defined in [code]world[/code] property. Default value: [code]false[/code].
set_use_own_world ::
                    (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_own_world cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_use_own_world (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_using_own_world #-}

-- | If [code]true[/code], the viewport will use [World] defined in [code]world[/code] property. Default value: [code]false[/code].
bindViewport_is_using_own_world :: MethodBind
bindViewport_is_using_own_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_using_own_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will use [World] defined in [code]world[/code] property. Default value: [code]false[/code].
is_using_own_world ::
                     (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_using_own_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_using_own_world (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_camera #-}

-- | Returns the active 3D camera.
bindViewport_get_camera :: MethodBind
bindViewport_get_camera
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_camera" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the active 3D camera.
get_camera :: (Viewport :< cls, Object :< cls) => cls -> IO Camera
get_camera cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_camera (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_as_audio_listener #-}

-- | If [code]true[/code], the viewport will process 3D audio streams. Default value: [code]false[/code].
bindViewport_set_as_audio_listener :: MethodBind
bindViewport_set_as_audio_listener
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_as_audio_listener" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will process 3D audio streams. Default value: [code]false[/code].
set_as_audio_listener ::
                        (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_as_audio_listener cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_as_audio_listener
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_audio_listener #-}

-- | If [code]true[/code], the viewport will process 3D audio streams. Default value: [code]false[/code].
bindViewport_is_audio_listener :: MethodBind
bindViewport_is_audio_listener
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_audio_listener" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will process 3D audio streams. Default value: [code]false[/code].
is_audio_listener ::
                    (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_audio_listener cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_audio_listener (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_as_audio_listener_2d #-}

-- | If [code]true[/code], the viewport will process 2D audio streams. Default value: [code]false[/code].
bindViewport_set_as_audio_listener_2d :: MethodBind
bindViewport_set_as_audio_listener_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_as_audio_listener_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will process 2D audio streams. Default value: [code]false[/code].
set_as_audio_listener_2d ::
                           (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_as_audio_listener_2d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_as_audio_listener_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_audio_listener_2d #-}

-- | If [code]true[/code], the viewport will process 2D audio streams. Default value: [code]false[/code].
bindViewport_is_audio_listener_2d :: MethodBind
bindViewport_is_audio_listener_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_audio_listener_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will process 2D audio streams. Default value: [code]false[/code].
is_audio_listener_2d ::
                       (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_audio_listener_2d cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_audio_listener_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_attach_to_screen_rect #-}

bindViewport_set_attach_to_screen_rect :: MethodBind
bindViewport_set_attach_to_screen_rect
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_attach_to_screen_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_attach_to_screen_rect ::
                            (Viewport :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_attach_to_screen_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_attach_to_screen_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_mouse_position #-}

-- | Returns the mouse position relative to the viewport.
bindViewport_get_mouse_position :: MethodBind
bindViewport_get_mouse_position
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_mouse_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the mouse position relative to the viewport.
get_mouse_position ::
                     (Viewport :< cls, Object :< cls) => cls -> IO Vector2
get_mouse_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_mouse_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_warp_mouse #-}

-- | Warps the mouse to a position relative to the viewport.
bindViewport_warp_mouse :: MethodBind
bindViewport_warp_mouse
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "warp_mouse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Warps the mouse to a position relative to the viewport.
warp_mouse ::
             (Viewport :< cls, Object :< cls) => cls -> Vector2 -> IO ()
warp_mouse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_warp_mouse (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_gui_has_modal_stack #-}

-- | Returns [code]true[/code] if there are visible modals on-screen.
bindViewport_gui_has_modal_stack :: MethodBind
bindViewport_gui_has_modal_stack
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "gui_has_modal_stack" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if there are visible modals on-screen.
gui_has_modal_stack ::
                      (Viewport :< cls, Object :< cls) => cls -> IO Bool
gui_has_modal_stack cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_gui_has_modal_stack
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_gui_get_drag_data #-}

-- | Returns the drag data from the GUI, that was previously returned by [method Control.get_drag_data].
bindViewport_gui_get_drag_data :: MethodBind
bindViewport_gui_get_drag_data
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "gui_get_drag_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the drag data from the GUI, that was previously returned by [method Control.get_drag_data].
gui_get_drag_data ::
                    (Viewport :< cls, Object :< cls) => cls -> IO GodotVariant
gui_get_drag_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_gui_get_drag_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_gui_is_dragging #-}

bindViewport_gui_is_dragging :: MethodBind
bindViewport_gui_is_dragging
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "gui_is_dragging" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gui_is_dragging ::
                  (Viewport :< cls, Object :< cls) => cls -> IO Bool
gui_is_dragging cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_gui_is_dragging (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_modal_stack_top #-}

-- | Returns the topmost modal in the stack.
bindViewport_get_modal_stack_top :: MethodBind
bindViewport_get_modal_stack_top
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_modal_stack_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the topmost modal in the stack.
get_modal_stack_top ::
                      (Viewport :< cls, Object :< cls) => cls -> IO Control
get_modal_stack_top cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_modal_stack_top
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_disable_input #-}

-- | If [code]true[/code], the viewport will not receive input event. Default value: [code]false[/code].
bindViewport_set_disable_input :: MethodBind
bindViewport_set_disable_input
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_disable_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will not receive input event. Default value: [code]false[/code].
set_disable_input ::
                    (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_disable_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_input_disabled #-}

-- | If [code]true[/code], the viewport will not receive input event. Default value: [code]false[/code].
bindViewport_is_input_disabled :: MethodBind
bindViewport_is_input_disabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_input_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will not receive input event. Default value: [code]false[/code].
is_input_disabled ::
                    (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_input_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_input_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_disable_3d #-}

-- | If [code]true[/code], the viewport will disable 3D rendering. For actual disabling use [code]usage[/code]. Default value: [code]false[/code].
bindViewport_set_disable_3d :: MethodBind
bindViewport_set_disable_3d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_disable_3d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will disable 3D rendering. For actual disabling use [code]usage[/code]. Default value: [code]false[/code].
set_disable_3d ::
                 (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_3d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_disable_3d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_3d_disabled #-}

-- | If [code]true[/code], the viewport will disable 3D rendering. For actual disabling use [code]usage[/code]. Default value: [code]false[/code].
bindViewport_is_3d_disabled :: MethodBind
bindViewport_is_3d_disabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_3d_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will disable 3D rendering. For actual disabling use [code]usage[/code]. Default value: [code]false[/code].
is_3d_disabled ::
                 (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_3d_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_3d_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_keep_3d_linear #-}

-- | If [code]true[/code], the result after 3D rendering will not have a linear to sRGB color conversion applied. This is important when the viewport is used as a render target where the result is used as a texture on a 3D object rendered in another viewport. It is also important if the viewport is used to create data that is not color based (noise, heightmaps, pickmaps, etc.). Do not enable this when the viewport is used as a texture on a 2D object or if the viewport is your final output.
bindViewport_set_keep_3d_linear :: MethodBind
bindViewport_set_keep_3d_linear
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_keep_3d_linear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the result after 3D rendering will not have a linear to sRGB color conversion applied. This is important when the viewport is used as a render target where the result is used as a texture on a 3D object rendered in another viewport. It is also important if the viewport is used to create data that is not color based (noise, heightmaps, pickmaps, etc.). Do not enable this when the viewport is used as a texture on a 2D object or if the viewport is your final output.
set_keep_3d_linear ::
                     (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_keep_3d_linear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_keep_3d_linear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_keep_3d_linear #-}

-- | If [code]true[/code], the result after 3D rendering will not have a linear to sRGB color conversion applied. This is important when the viewport is used as a render target where the result is used as a texture on a 3D object rendered in another viewport. It is also important if the viewport is used to create data that is not color based (noise, heightmaps, pickmaps, etc.). Do not enable this when the viewport is used as a texture on a 2D object or if the viewport is your final output.
bindViewport_get_keep_3d_linear :: MethodBind
bindViewport_get_keep_3d_linear
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_keep_3d_linear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the result after 3D rendering will not have a linear to sRGB color conversion applied. This is important when the viewport is used as a render target where the result is used as a texture on a 3D object rendered in another viewport. It is also important if the viewport is used to create data that is not color based (noise, heightmaps, pickmaps, etc.). Do not enable this when the viewport is used as a texture on a 2D object or if the viewport is your final output.
get_keep_3d_linear ::
                     (Viewport :< cls, Object :< cls) => cls -> IO Bool
get_keep_3d_linear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_keep_3d_linear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport__gui_show_tooltip #-}

bindViewport__gui_show_tooltip :: MethodBind
bindViewport__gui_show_tooltip
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "_gui_show_tooltip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_show_tooltip ::
                    (Viewport :< cls, Object :< cls) => cls -> IO ()
_gui_show_tooltip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport__gui_show_tooltip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport__gui_remove_focus #-}

bindViewport__gui_remove_focus :: MethodBind
bindViewport__gui_remove_focus
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "_gui_remove_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_remove_focus ::
                    (Viewport :< cls, Object :< cls) => cls -> IO ()
_gui_remove_focus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport__gui_remove_focus (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport__post_gui_grab_click_focus #-}

bindViewport__post_gui_grab_click_focus :: MethodBind
bindViewport__post_gui_grab_click_focus
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "_post_gui_grab_click_focus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_post_gui_grab_click_focus ::
                             (Viewport :< cls, Object :< cls) => cls -> IO ()
_post_gui_grab_click_focus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport__post_gui_grab_click_focus
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_shadow_atlas_size #-}

-- | The resolution of shadow atlas. Both width and height is equal to one value.
bindViewport_set_shadow_atlas_size :: MethodBind
bindViewport_set_shadow_atlas_size
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_shadow_atlas_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The resolution of shadow atlas. Both width and height is equal to one value.
set_shadow_atlas_size ::
                        (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_atlas_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_shadow_atlas_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_shadow_atlas_size #-}

-- | The resolution of shadow atlas. Both width and height is equal to one value.
bindViewport_get_shadow_atlas_size :: MethodBind
bindViewport_get_shadow_atlas_size
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_shadow_atlas_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The resolution of shadow atlas. Both width and height is equal to one value.
get_shadow_atlas_size ::
                        (Viewport :< cls, Object :< cls) => cls -> IO Int
get_shadow_atlas_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_shadow_atlas_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_snap_controls_to_pixels #-}

-- | If [code]true[/code], the GUI controls on the viewport will lay pixel perfectly. Default value: [code]true[/code].
bindViewport_set_snap_controls_to_pixels :: MethodBind
bindViewport_set_snap_controls_to_pixels
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_snap_controls_to_pixels" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the GUI controls on the viewport will lay pixel perfectly. Default value: [code]true[/code].
set_snap_controls_to_pixels ::
                              (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_snap_controls_to_pixels cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_snap_controls_to_pixels
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_snap_controls_to_pixels_enabled #-}

-- | If [code]true[/code], the GUI controls on the viewport will lay pixel perfectly. Default value: [code]true[/code].
bindViewport_is_snap_controls_to_pixels_enabled :: MethodBind
bindViewport_is_snap_controls_to_pixels_enabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_snap_controls_to_pixels_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the GUI controls on the viewport will lay pixel perfectly. Default value: [code]true[/code].
is_snap_controls_to_pixels_enabled ::
                                     (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_snap_controls_to_pixels_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindViewport_is_snap_controls_to_pixels_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_shadow_atlas_quadrant_subdiv #-}

-- | The subdivision amount of first quadrant on shadow atlas. Default value: [code]SHADOW_ATLAS_QUADRANT_SUBDIV_4[/code].
bindViewport_set_shadow_atlas_quadrant_subdiv :: MethodBind
bindViewport_set_shadow_atlas_quadrant_subdiv
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_shadow_atlas_quadrant_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The subdivision amount of first quadrant on shadow atlas. Default value: [code]SHADOW_ATLAS_QUADRANT_SUBDIV_4[/code].
set_shadow_atlas_quadrant_subdiv ::
                                   (Viewport :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_shadow_atlas_quadrant_subdiv cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindViewport_set_shadow_atlas_quadrant_subdiv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_get_shadow_atlas_quadrant_subdiv #-}

-- | The subdivision amount of first quadrant on shadow atlas. Default value: [code]SHADOW_ATLAS_QUADRANT_SUBDIV_4[/code].
bindViewport_get_shadow_atlas_quadrant_subdiv :: MethodBind
bindViewport_get_shadow_atlas_quadrant_subdiv
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_shadow_atlas_quadrant_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The subdivision amount of first quadrant on shadow atlas. Default value: [code]SHADOW_ATLAS_QUADRANT_SUBDIV_4[/code].
get_shadow_atlas_quadrant_subdiv ::
                                   (Viewport :< cls, Object :< cls) => cls -> Int -> IO Int
get_shadow_atlas_quadrant_subdiv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindViewport_get_shadow_atlas_quadrant_subdiv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_input_as_handled #-}

bindViewport_set_input_as_handled :: MethodBind
bindViewport_set_input_as_handled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_input_as_handled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_as_handled ::
                       (Viewport :< cls, Object :< cls) => cls -> IO ()
set_input_as_handled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_input_as_handled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_input_handled #-}

bindViewport_is_input_handled :: MethodBind
bindViewport_is_input_handled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_input_handled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_input_handled ::
                   (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_input_handled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_input_handled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_set_handle_input_locally #-}

bindViewport_set_handle_input_locally :: MethodBind
bindViewport_set_handle_input_locally
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_handle_input_locally" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_handle_input_locally ::
                           (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_handle_input_locally cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_handle_input_locally
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport_is_handling_input_locally #-}

bindViewport_is_handling_input_locally :: MethodBind
bindViewport_is_handling_input_locally
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_handling_input_locally" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_handling_input_locally ::
                            (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_handling_input_locally cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_handling_input_locally
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewport__subwindow_visibility_changed #-}

bindViewport__subwindow_visibility_changed :: MethodBind
bindViewport__subwindow_visibility_changed
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "_subwindow_visibility_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_subwindow_visibility_changed ::
                                (Viewport :< cls, Object :< cls) => cls -> IO ()
_subwindow_visibility_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport__subwindow_visibility_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)