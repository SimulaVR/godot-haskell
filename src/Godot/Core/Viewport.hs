{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
        Godot.Core.Viewport.sig_gui_focus_changed,
        Godot.Core.Viewport.sig_size_changed,
        Godot.Core.Viewport._gui_remove_focus,
        Godot.Core.Viewport._gui_show_tooltip,
        Godot.Core.Viewport._own_world_changed,
        Godot.Core.Viewport._post_gui_grab_click_focus,
        Godot.Core.Viewport._subwindow_visibility_changed,
        Godot.Core.Viewport._vp_input, Godot.Core.Viewport._vp_input_text,
        Godot.Core.Viewport._vp_unhandled_input,
        Godot.Core.Viewport.find_world, Godot.Core.Viewport.find_world_2d,
        Godot.Core.Viewport.get_camera,
        Godot.Core.Viewport.get_canvas_transform,
        Godot.Core.Viewport.get_clear_mode,
        Godot.Core.Viewport.get_debug_draw,
        Godot.Core.Viewport.get_final_transform,
        Godot.Core.Viewport.get_global_canvas_transform,
        Godot.Core.Viewport.get_hdr,
        Godot.Core.Viewport.get_keep_3d_linear,
        Godot.Core.Viewport.get_modal_stack_top,
        Godot.Core.Viewport.get_mouse_position,
        Godot.Core.Viewport.get_msaa,
        Godot.Core.Viewport.get_physics_object_picking,
        Godot.Core.Viewport.get_render_info,
        Godot.Core.Viewport.get_shadow_atlas_quadrant_subdiv,
        Godot.Core.Viewport.get_shadow_atlas_size,
        Godot.Core.Viewport.get_size,
        Godot.Core.Viewport.get_size_override,
        Godot.Core.Viewport.get_texture,
        Godot.Core.Viewport.get_update_mode, Godot.Core.Viewport.get_usage,
        Godot.Core.Viewport.get_vflip,
        Godot.Core.Viewport.get_viewport_rid,
        Godot.Core.Viewport.get_visible_rect,
        Godot.Core.Viewport.get_world, Godot.Core.Viewport.get_world_2d,
        Godot.Core.Viewport.gui_get_drag_data,
        Godot.Core.Viewport.gui_has_modal_stack,
        Godot.Core.Viewport.gui_is_dragging,
        Godot.Core.Viewport.has_transparent_background,
        Godot.Core.Viewport.input, Godot.Core.Viewport.is_3d_disabled,
        Godot.Core.Viewport.is_audio_listener,
        Godot.Core.Viewport.is_audio_listener_2d,
        Godot.Core.Viewport.is_handling_input_locally,
        Godot.Core.Viewport.is_input_disabled,
        Godot.Core.Viewport.is_input_handled,
        Godot.Core.Viewport.is_size_override_enabled,
        Godot.Core.Viewport.is_size_override_stretch_enabled,
        Godot.Core.Viewport.is_snap_controls_to_pixels_enabled,
        Godot.Core.Viewport.is_using_own_world,
        Godot.Core.Viewport.is_using_render_direct_to_screen,
        Godot.Core.Viewport.set_as_audio_listener,
        Godot.Core.Viewport.set_as_audio_listener_2d,
        Godot.Core.Viewport.set_attach_to_screen_rect,
        Godot.Core.Viewport.set_canvas_transform,
        Godot.Core.Viewport.set_clear_mode,
        Godot.Core.Viewport.set_debug_draw,
        Godot.Core.Viewport.set_disable_3d,
        Godot.Core.Viewport.set_disable_input,
        Godot.Core.Viewport.set_global_canvas_transform,
        Godot.Core.Viewport.set_handle_input_locally,
        Godot.Core.Viewport.set_hdr,
        Godot.Core.Viewport.set_input_as_handled,
        Godot.Core.Viewport.set_keep_3d_linear,
        Godot.Core.Viewport.set_msaa,
        Godot.Core.Viewport.set_physics_object_picking,
        Godot.Core.Viewport.set_shadow_atlas_quadrant_subdiv,
        Godot.Core.Viewport.set_shadow_atlas_size,
        Godot.Core.Viewport.set_size,
        Godot.Core.Viewport.set_size_override,
        Godot.Core.Viewport.set_size_override_stretch,
        Godot.Core.Viewport.set_snap_controls_to_pixels,
        Godot.Core.Viewport.set_transparent_background,
        Godot.Core.Viewport.set_update_mode, Godot.Core.Viewport.set_usage,
        Godot.Core.Viewport.set_use_arvr,
        Godot.Core.Viewport.set_use_own_world,
        Godot.Core.Viewport.set_use_render_direct_to_screen,
        Godot.Core.Viewport.set_vflip, Godot.Core.Viewport.set_world,
        Godot.Core.Viewport.set_world_2d,
        Godot.Core.Viewport.unhandled_input,
        Godot.Core.Viewport.update_worlds, Godot.Core.Viewport.use_arvr,
        Godot.Core.Viewport.warp_mouse)
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

-- | Emitted when a Control node grabs keyboard focus.
sig_gui_focus_changed :: Godot.Internal.Dispatch.Signal Viewport
sig_gui_focus_changed
  = Godot.Internal.Dispatch.Signal "gui_focus_changed"

instance NodeSignal Viewport "gui_focus_changed" '[Control]

-- | Emitted when the size of the viewport is changed, whether by @method set_size_override@, resize of window, or some other means.
sig_size_changed :: Godot.Internal.Dispatch.Signal Viewport
sig_size_changed = Godot.Internal.Dispatch.Signal "size_changed"

instance NodeSignal Viewport "size_changed" '[]

instance NodeProperty Viewport "arvr" Bool 'False where
        nodeProperty = (use_arvr, wrapDroppingSetter set_use_arvr, Nothing)

instance NodeProperty Viewport "audio_listener_enable_2d" Bool
           'False
         where
        nodeProperty
          = (is_audio_listener_2d,
             wrapDroppingSetter set_as_audio_listener_2d, Nothing)

instance NodeProperty Viewport "audio_listener_enable_3d" Bool
           'False
         where
        nodeProperty
          = (is_audio_listener, wrapDroppingSetter set_as_audio_listener,
             Nothing)

instance NodeProperty Viewport "canvas_transform" Transform2d
           'False
         where
        nodeProperty
          = (get_canvas_transform, wrapDroppingSetter set_canvas_transform,
             Nothing)

instance NodeProperty Viewport "debug_draw" Int 'False where
        nodeProperty
          = (get_debug_draw, wrapDroppingSetter set_debug_draw, Nothing)

instance NodeProperty Viewport "disable_3d" Bool 'False where
        nodeProperty
          = (is_3d_disabled, wrapDroppingSetter set_disable_3d, Nothing)

instance NodeProperty Viewport "global_canvas_transform"
           Transform2d
           'False
         where
        nodeProperty
          = (get_global_canvas_transform,
             wrapDroppingSetter set_global_canvas_transform, Nothing)

instance NodeProperty Viewport "gui_disable_input" Bool 'False
         where
        nodeProperty
          = (is_input_disabled, wrapDroppingSetter set_disable_input,
             Nothing)

instance NodeProperty Viewport "gui_snap_controls_to_pixels" Bool
           'False
         where
        nodeProperty
          = (is_snap_controls_to_pixels_enabled,
             wrapDroppingSetter set_snap_controls_to_pixels, Nothing)

instance NodeProperty Viewport "handle_input_locally" Bool 'False
         where
        nodeProperty
          = (is_handling_input_locally,
             wrapDroppingSetter set_handle_input_locally, Nothing)

instance NodeProperty Viewport "hdr" Bool 'False where
        nodeProperty = (get_hdr, wrapDroppingSetter set_hdr, Nothing)

instance NodeProperty Viewport "keep_3d_linear" Bool 'False where
        nodeProperty
          = (get_keep_3d_linear, wrapDroppingSetter set_keep_3d_linear,
             Nothing)

instance NodeProperty Viewport "msaa" Int 'False where
        nodeProperty = (get_msaa, wrapDroppingSetter set_msaa, Nothing)

instance NodeProperty Viewport "own_world" Bool 'False where
        nodeProperty
          = (is_using_own_world, wrapDroppingSetter set_use_own_world,
             Nothing)

instance NodeProperty Viewport "physics_object_picking" Bool 'False
         where
        nodeProperty
          = (get_physics_object_picking,
             wrapDroppingSetter set_physics_object_picking, Nothing)

instance NodeProperty Viewport "render_direct_to_screen" Bool
           'False
         where
        nodeProperty
          = (is_using_render_direct_to_screen,
             wrapDroppingSetter set_use_render_direct_to_screen, Nothing)

instance NodeProperty Viewport "render_target_clear_mode" Int
           'False
         where
        nodeProperty
          = (get_clear_mode, wrapDroppingSetter set_clear_mode, Nothing)

instance NodeProperty Viewport "render_target_update_mode" Int
           'False
         where
        nodeProperty
          = (get_update_mode, wrapDroppingSetter set_update_mode, Nothing)

instance NodeProperty Viewport "render_target_v_flip" Bool 'False
         where
        nodeProperty = (get_vflip, wrapDroppingSetter set_vflip, Nothing)

instance NodeProperty Viewport "shadow_atlas_quad_0" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_shadow_atlas_quadrant_subdiv,
             wrapIndexedSetter 0 set_shadow_atlas_quadrant_subdiv, Nothing)

instance NodeProperty Viewport "shadow_atlas_quad_1" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_shadow_atlas_quadrant_subdiv,
             wrapIndexedSetter 1 set_shadow_atlas_quadrant_subdiv, Nothing)

instance NodeProperty Viewport "shadow_atlas_quad_2" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_shadow_atlas_quadrant_subdiv,
             wrapIndexedSetter 2 set_shadow_atlas_quadrant_subdiv, Nothing)

instance NodeProperty Viewport "shadow_atlas_quad_3" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_shadow_atlas_quadrant_subdiv,
             wrapIndexedSetter 3 set_shadow_atlas_quadrant_subdiv, Nothing)

instance NodeProperty Viewport "shadow_atlas_size" Int 'False where
        nodeProperty
          = (get_shadow_atlas_size, wrapDroppingSetter set_shadow_atlas_size,
             Nothing)

instance NodeProperty Viewport "size" Vector2 'False where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

instance NodeProperty Viewport "size_override_stretch" Bool 'False
         where
        nodeProperty
          = (is_size_override_stretch_enabled,
             wrapDroppingSetter set_size_override_stretch, Nothing)

instance NodeProperty Viewport "transparent_bg" Bool 'False where
        nodeProperty
          = (has_transparent_background,
             wrapDroppingSetter set_transparent_background, Nothing)

instance NodeProperty Viewport "usage" Int 'False where
        nodeProperty = (get_usage, wrapDroppingSetter set_usage, Nothing)

instance NodeProperty Viewport "world" World 'False where
        nodeProperty = (get_world, wrapDroppingSetter set_world, Nothing)

instance NodeProperty Viewport "world_2d" World2D 'False where
        nodeProperty
          = (get_world_2d, wrapDroppingSetter set_world_2d, Nothing)

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

instance NodeMethod Viewport "_gui_remove_focus" '[] (IO ()) where
        nodeMethod = Godot.Core.Viewport._gui_remove_focus

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

instance NodeMethod Viewport "_gui_show_tooltip" '[] (IO ()) where
        nodeMethod = Godot.Core.Viewport._gui_show_tooltip

{-# NOINLINE bindViewport__own_world_changed #-}

bindViewport__own_world_changed :: MethodBind
bindViewport__own_world_changed
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "_own_world_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_own_world_changed ::
                     (Viewport :< cls, Object :< cls) => cls -> IO ()
_own_world_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport__own_world_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "_own_world_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.Viewport._own_world_changed

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

instance NodeMethod Viewport "_post_gui_grab_click_focus" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport._post_gui_grab_click_focus

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

instance NodeMethod Viewport "_subwindow_visibility_changed" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport._subwindow_visibility_changed

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

instance NodeMethod Viewport "_vp_input" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.Viewport._vp_input

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

instance NodeMethod Viewport "_vp_input_text" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport._vp_input_text

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

instance NodeMethod Viewport "_vp_unhandled_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport._vp_unhandled_input

{-# NOINLINE bindViewport_find_world #-}

-- | Returns the first valid @World@ for this viewport, searching the @world@ property of itself and any Viewport ancestor.
bindViewport_find_world :: MethodBind
bindViewport_find_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "find_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the first valid @World@ for this viewport, searching the @world@ property of itself and any Viewport ancestor.
find_world :: (Viewport :< cls, Object :< cls) => cls -> IO World
find_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_find_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "find_world" '[] (IO World) where
        nodeMethod = Godot.Core.Viewport.find_world

{-# NOINLINE bindViewport_find_world_2d #-}

-- | Returns the first valid @World2D@ for this viewport, searching the @world_2d@ property of itself and any Viewport ancestor.
bindViewport_find_world_2d :: MethodBind
bindViewport_find_world_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "find_world_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the first valid @World2D@ for this viewport, searching the @world_2d@ property of itself and any Viewport ancestor.
find_world_2d ::
                (Viewport :< cls, Object :< cls) => cls -> IO World2D
find_world_2d cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_find_world_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "find_world_2d" '[] (IO World2D) where
        nodeMethod = Godot.Core.Viewport.find_world_2d

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

instance NodeMethod Viewport "get_camera" '[] (IO Camera) where
        nodeMethod = Godot.Core.Viewport.get_camera

{-# NOINLINE bindViewport_get_canvas_transform #-}

-- | The canvas transform of the viewport, useful for changing the on-screen positions of all child @CanvasItem@s. This is relative to the global canvas transform of the viewport.
bindViewport_get_canvas_transform :: MethodBind
bindViewport_get_canvas_transform
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The canvas transform of the viewport, useful for changing the on-screen positions of all child @CanvasItem@s. This is relative to the global canvas transform of the viewport.
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

instance NodeMethod Viewport "get_canvas_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.Viewport.get_canvas_transform

{-# NOINLINE bindViewport_get_clear_mode #-}

-- | The clear mode when viewport used as a render target.
--   			__Note:__ This property is intended for 2D usage.
bindViewport_get_clear_mode :: MethodBind
bindViewport_get_clear_mode
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_clear_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The clear mode when viewport used as a render target.
--   			__Note:__ This property is intended for 2D usage.
get_clear_mode :: (Viewport :< cls, Object :< cls) => cls -> IO Int
get_clear_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_clear_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_clear_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Viewport.get_clear_mode

{-# NOINLINE bindViewport_get_debug_draw #-}

-- | The overlay mode for test rendered geometry in debug purposes.
bindViewport_get_debug_draw :: MethodBind
bindViewport_get_debug_draw
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_debug_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The overlay mode for test rendered geometry in debug purposes.
get_debug_draw :: (Viewport :< cls, Object :< cls) => cls -> IO Int
get_debug_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_debug_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_debug_draw" '[] (IO Int) where
        nodeMethod = Godot.Core.Viewport.get_debug_draw

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

instance NodeMethod Viewport "get_final_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.Viewport.get_final_transform

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

instance NodeMethod Viewport "get_global_canvas_transform" '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.Viewport.get_global_canvas_transform

{-# NOINLINE bindViewport_get_hdr #-}

-- | If @true@, the viewport rendering will receive benefits from High Dynamic Range algorithm. High Dynamic Range allows the viewport to receive values that are outside the 0-1 range. In Godot HDR uses 16 bits, meaning it does not store the full range of a floating point number.
--   			__Note:__ Requires @usage@ to be set to @USAGE_3D@ or @USAGE_3D_NO_EFFECTS@, since HDR is not supported for 2D.
bindViewport_get_hdr :: MethodBind
bindViewport_get_hdr
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport rendering will receive benefits from High Dynamic Range algorithm. High Dynamic Range allows the viewport to receive values that are outside the 0-1 range. In Godot HDR uses 16 bits, meaning it does not store the full range of a floating point number.
--   			__Note:__ Requires @usage@ to be set to @USAGE_3D@ or @USAGE_3D_NO_EFFECTS@, since HDR is not supported for 2D.
get_hdr :: (Viewport :< cls, Object :< cls) => cls -> IO Bool
get_hdr cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_hdr (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_hdr" '[] (IO Bool) where
        nodeMethod = Godot.Core.Viewport.get_hdr

{-# NOINLINE bindViewport_get_keep_3d_linear #-}

-- | If @true@, the result after 3D rendering will not have a linear to sRGB color conversion applied. This is important when the viewport is used as a render target where the result is used as a texture on a 3D object rendered in another viewport. It is also important if the viewport is used to create data that is not color based (noise, heightmaps, pickmaps, etc.). Do not enable this when the viewport is used as a texture on a 2D object or if the viewport is your final output. For the GLES2 driver this will convert the sRGB output to linear, this should only be used for VR plugins that require input in linear color space!
bindViewport_get_keep_3d_linear :: MethodBind
bindViewport_get_keep_3d_linear
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_keep_3d_linear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the result after 3D rendering will not have a linear to sRGB color conversion applied. This is important when the viewport is used as a render target where the result is used as a texture on a 3D object rendered in another viewport. It is also important if the viewport is used to create data that is not color based (noise, heightmaps, pickmaps, etc.). Do not enable this when the viewport is used as a texture on a 2D object or if the viewport is your final output. For the GLES2 driver this will convert the sRGB output to linear, this should only be used for VR plugins that require input in linear color space!
get_keep_3d_linear ::
                     (Viewport :< cls, Object :< cls) => cls -> IO Bool
get_keep_3d_linear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_keep_3d_linear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_keep_3d_linear" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.get_keep_3d_linear

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

instance NodeMethod Viewport "get_modal_stack_top" '[] (IO Control)
         where
        nodeMethod = Godot.Core.Viewport.get_modal_stack_top

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

instance NodeMethod Viewport "get_mouse_position" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Viewport.get_mouse_position

{-# NOINLINE bindViewport_get_msaa #-}

-- | The multisample anti-aliasing mode. A higher number results in smoother edges at the cost of significantly worse performance. A value of 4 is best unless targeting very high-end systems.
bindViewport_get_msaa :: MethodBind
bindViewport_get_msaa
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_msaa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The multisample anti-aliasing mode. A higher number results in smoother edges at the cost of significantly worse performance. A value of 4 is best unless targeting very high-end systems.
get_msaa :: (Viewport :< cls, Object :< cls) => cls -> IO Int
get_msaa cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_msaa (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_msaa" '[] (IO Int) where
        nodeMethod = Godot.Core.Viewport.get_msaa

{-# NOINLINE bindViewport_get_physics_object_picking #-}

-- | If @true@, the objects rendered by viewport become subjects of mouse picking process.
bindViewport_get_physics_object_picking :: MethodBind
bindViewport_get_physics_object_picking
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_physics_object_picking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the objects rendered by viewport become subjects of mouse picking process.
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

instance NodeMethod Viewport "get_physics_object_picking" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.get_physics_object_picking

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

instance NodeMethod Viewport "get_render_info" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.Viewport.get_render_info

{-# NOINLINE bindViewport_get_shadow_atlas_quadrant_subdiv #-}

-- | Returns the @enum ShadowAtlasQuadrantSubdiv@ of the specified quadrant.
bindViewport_get_shadow_atlas_quadrant_subdiv :: MethodBind
bindViewport_get_shadow_atlas_quadrant_subdiv
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_shadow_atlas_quadrant_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @enum ShadowAtlasQuadrantSubdiv@ of the specified quadrant.
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

instance NodeMethod Viewport "get_shadow_atlas_quadrant_subdiv"
           '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.Viewport.get_shadow_atlas_quadrant_subdiv

{-# NOINLINE bindViewport_get_shadow_atlas_size #-}

-- | The shadow atlas' resolution (used for omni and spot lights). The value will be rounded up to the nearest power of 2.
--   			__Note:__ If this is set to 0, shadows won't be visible. Since user-created viewports default to a value of 0, this value must be set above 0 manually.
bindViewport_get_shadow_atlas_size :: MethodBind
bindViewport_get_shadow_atlas_size
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_shadow_atlas_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow atlas' resolution (used for omni and spot lights). The value will be rounded up to the nearest power of 2.
--   			__Note:__ If this is set to 0, shadows won't be visible. Since user-created viewports default to a value of 0, this value must be set above 0 manually.
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

instance NodeMethod Viewport "get_shadow_atlas_size" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Viewport.get_shadow_atlas_size

{-# NOINLINE bindViewport_get_size #-}

-- | The width and height of viewport. Must be set to a value greater than or equal to 2 pixels on both dimensions. Otherwise, nothing will be displayed.
bindViewport_get_size :: MethodBind
bindViewport_get_size
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width and height of viewport. Must be set to a value greater than or equal to 2 pixels on both dimensions. Otherwise, nothing will be displayed.
get_size :: (Viewport :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_size" '[] (IO Vector2) where
        nodeMethod = Godot.Core.Viewport.get_size

{-# NOINLINE bindViewport_get_size_override #-}

-- | Returns the size override set with @method set_size_override@.
bindViewport_get_size_override :: MethodBind
bindViewport_get_size_override
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_size_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size override set with @method set_size_override@.
get_size_override ::
                    (Viewport :< cls, Object :< cls) => cls -> IO Vector2
get_size_override cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_size_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_size_override" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Viewport.get_size_override

{-# NOINLINE bindViewport_get_texture #-}

-- | Returns the viewport's texture.
--   				__Note:__ Due to the way OpenGL works, the resulting @ViewportTexture@ is flipped vertically. You can use @method Image.flip_y@ on the result of @method Texture.get_data@ to flip it back, for example:
--   				
--   @
--   
--   				var img = get_viewport().get_texture().get_data()
--   				img.flip_y()
--   				
--   @
bindViewport_get_texture :: MethodBind
bindViewport_get_texture
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the viewport's texture.
--   				__Note:__ Due to the way OpenGL works, the resulting @ViewportTexture@ is flipped vertically. You can use @method Image.flip_y@ on the result of @method Texture.get_data@ to flip it back, for example:
--   				
--   @
--   
--   				var img = get_viewport().get_texture().get_data()
--   				img.flip_y()
--   				
--   @
get_texture ::
              (Viewport :< cls, Object :< cls) => cls -> IO ViewportTexture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_texture" '[] (IO ViewportTexture)
         where
        nodeMethod = Godot.Core.Viewport.get_texture

{-# NOINLINE bindViewport_get_update_mode #-}

-- | The update mode when viewport used as a render target.
bindViewport_get_update_mode :: MethodBind
bindViewport_get_update_mode
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The update mode when viewport used as a render target.
get_update_mode ::
                  (Viewport :< cls, Object :< cls) => cls -> IO Int
get_update_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_update_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_update_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Viewport.get_update_mode

{-# NOINLINE bindViewport_get_usage #-}

-- | The rendering mode of viewport.
bindViewport_get_usage :: MethodBind
bindViewport_get_usage
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rendering mode of viewport.
get_usage :: (Viewport :< cls, Object :< cls) => cls -> IO Int
get_usage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_usage (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_usage" '[] (IO Int) where
        nodeMethod = Godot.Core.Viewport.get_usage

{-# NOINLINE bindViewport_get_vflip #-}

-- | If @true@, the result of rendering will be flipped vertically. Since Viewports in Godot 3.x render upside-down, it's recommended to set this to @true@ in most situations.
bindViewport_get_vflip :: MethodBind
bindViewport_get_vflip
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_vflip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the result of rendering will be flipped vertically. Since Viewports in Godot 3.x render upside-down, it's recommended to set this to @true@ in most situations.
get_vflip :: (Viewport :< cls, Object :< cls) => cls -> IO Bool
get_vflip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_vflip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_vflip" '[] (IO Bool) where
        nodeMethod = Godot.Core.Viewport.get_vflip

{-# NOINLINE bindViewport_get_viewport_rid #-}

-- | Returns the viewport's RID from the @VisualServer@.
bindViewport_get_viewport_rid :: MethodBind
bindViewport_get_viewport_rid
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_viewport_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the viewport's RID from the @VisualServer@.
get_viewport_rid ::
                   (Viewport :< cls, Object :< cls) => cls -> IO Rid
get_viewport_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_viewport_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_viewport_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.Viewport.get_viewport_rid

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

instance NodeMethod Viewport "get_visible_rect" '[] (IO Rect2)
         where
        nodeMethod = Godot.Core.Viewport.get_visible_rect

{-# NOINLINE bindViewport_get_world #-}

-- | The custom @World@ which can be used as 3D environment source.
bindViewport_get_world :: MethodBind
bindViewport_get_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @World@ which can be used as 3D environment source.
get_world :: (Viewport :< cls, Object :< cls) => cls -> IO World
get_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_world" '[] (IO World) where
        nodeMethod = Godot.Core.Viewport.get_world

{-# NOINLINE bindViewport_get_world_2d #-}

-- | The custom @World2D@ which can be used as 2D environment source.
bindViewport_get_world_2d :: MethodBind
bindViewport_get_world_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "get_world_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @World2D@ which can be used as 2D environment source.
get_world_2d ::
               (Viewport :< cls, Object :< cls) => cls -> IO World2D
get_world_2d cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_get_world_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "get_world_2d" '[] (IO World2D) where
        nodeMethod = Godot.Core.Viewport.get_world_2d

{-# NOINLINE bindViewport_gui_get_drag_data #-}

-- | Returns the drag data from the GUI, that was previously returned by @method Control.get_drag_data@.
bindViewport_gui_get_drag_data :: MethodBind
bindViewport_gui_get_drag_data
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "gui_get_drag_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the drag data from the GUI, that was previously returned by @method Control.get_drag_data@.
gui_get_drag_data ::
                    (Viewport :< cls, Object :< cls) => cls -> IO GodotVariant
gui_get_drag_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_gui_get_drag_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "gui_get_drag_data" '[]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Viewport.gui_get_drag_data

{-# NOINLINE bindViewport_gui_has_modal_stack #-}

-- | Returns @true@ if there are visible modals on-screen.
bindViewport_gui_has_modal_stack :: MethodBind
bindViewport_gui_has_modal_stack
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "gui_has_modal_stack" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if there are visible modals on-screen.
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

instance NodeMethod Viewport "gui_has_modal_stack" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.gui_has_modal_stack

{-# NOINLINE bindViewport_gui_is_dragging #-}

-- | Returns @true@ if the viewport is currently performing a drag operation.
bindViewport_gui_is_dragging :: MethodBind
bindViewport_gui_is_dragging
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "gui_is_dragging" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the viewport is currently performing a drag operation.
gui_is_dragging ::
                  (Viewport :< cls, Object :< cls) => cls -> IO Bool
gui_is_dragging cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_gui_is_dragging (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "gui_is_dragging" '[] (IO Bool) where
        nodeMethod = Godot.Core.Viewport.gui_is_dragging

{-# NOINLINE bindViewport_has_transparent_background #-}

-- | If @true@, the viewport should render its background as transparent.
bindViewport_has_transparent_background :: MethodBind
bindViewport_has_transparent_background
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "has_transparent_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport should render its background as transparent.
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

instance NodeMethod Viewport "has_transparent_background" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.has_transparent_background

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

instance NodeMethod Viewport "input" '[InputEvent] (IO ()) where
        nodeMethod = Godot.Core.Viewport.input

{-# NOINLINE bindViewport_is_3d_disabled #-}

-- | If @true@, the viewport will disable 3D rendering. For actual disabling use @usage@.
bindViewport_is_3d_disabled :: MethodBind
bindViewport_is_3d_disabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_3d_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will disable 3D rendering. For actual disabling use @usage@.
is_3d_disabled ::
                 (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_3d_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_3d_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "is_3d_disabled" '[] (IO Bool) where
        nodeMethod = Godot.Core.Viewport.is_3d_disabled

{-# NOINLINE bindViewport_is_audio_listener #-}

-- | If @true@, the viewport will process 3D audio streams.
bindViewport_is_audio_listener :: MethodBind
bindViewport_is_audio_listener
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_audio_listener" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will process 3D audio streams.
is_audio_listener ::
                    (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_audio_listener cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_audio_listener (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "is_audio_listener" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_audio_listener

{-# NOINLINE bindViewport_is_audio_listener_2d #-}

-- | If @true@, the viewport will process 2D audio streams.
bindViewport_is_audio_listener_2d :: MethodBind
bindViewport_is_audio_listener_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_audio_listener_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will process 2D audio streams.
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

instance NodeMethod Viewport "is_audio_listener_2d" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_audio_listener_2d

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

instance NodeMethod Viewport "is_handling_input_locally" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_handling_input_locally

{-# NOINLINE bindViewport_is_input_disabled #-}

-- | If @true@, the viewport will not receive input events.
bindViewport_is_input_disabled :: MethodBind
bindViewport_is_input_disabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_input_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will not receive input events.
is_input_disabled ::
                    (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_input_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_input_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "is_input_disabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_input_disabled

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

instance NodeMethod Viewport "is_input_handled" '[] (IO Bool) where
        nodeMethod = Godot.Core.Viewport.is_input_handled

{-# NOINLINE bindViewport_is_size_override_enabled #-}

-- | Returns @true@ if the size override is enabled. See @method set_size_override@.
bindViewport_is_size_override_enabled :: MethodBind
bindViewport_is_size_override_enabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_size_override_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the size override is enabled. See @method set_size_override@.
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

instance NodeMethod Viewport "is_size_override_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_size_override_enabled

{-# NOINLINE bindViewport_is_size_override_stretch_enabled #-}

-- | If @true@, the size override affects stretch as well.
bindViewport_is_size_override_stretch_enabled :: MethodBind
bindViewport_is_size_override_stretch_enabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_size_override_stretch_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the size override affects stretch as well.
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

instance NodeMethod Viewport "is_size_override_stretch_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_size_override_stretch_enabled

{-# NOINLINE bindViewport_is_snap_controls_to_pixels_enabled #-}

-- | If @true@, the GUI controls on the viewport will lay pixel perfectly.
bindViewport_is_snap_controls_to_pixels_enabled :: MethodBind
bindViewport_is_snap_controls_to_pixels_enabled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_snap_controls_to_pixels_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the GUI controls on the viewport will lay pixel perfectly.
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

instance NodeMethod Viewport "is_snap_controls_to_pixels_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_snap_controls_to_pixels_enabled

{-# NOINLINE bindViewport_is_using_own_world #-}

-- | If @true@, the viewport will use @World@ defined in @world@ property.
bindViewport_is_using_own_world :: MethodBind
bindViewport_is_using_own_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_using_own_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will use @World@ defined in @world@ property.
is_using_own_world ::
                     (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_using_own_world cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_is_using_own_world (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "is_using_own_world" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_using_own_world

{-# NOINLINE bindViewport_is_using_render_direct_to_screen #-}

-- | If @true@, renders the Viewport directly to the screen instead of to the root viewport. Only available in GLES2. This is a low-level optimization and should not be used in most cases. If used, reading from the Viewport or from @SCREEN_TEXTURE@ becomes unavailable. For more information see @method VisualServer.viewport_set_render_direct_to_screen@.
bindViewport_is_using_render_direct_to_screen :: MethodBind
bindViewport_is_using_render_direct_to_screen
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "is_using_render_direct_to_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, renders the Viewport directly to the screen instead of to the root viewport. Only available in GLES2. This is a low-level optimization and should not be used in most cases. If used, reading from the Viewport or from @SCREEN_TEXTURE@ becomes unavailable. For more information see @method VisualServer.viewport_set_render_direct_to_screen@.
is_using_render_direct_to_screen ::
                                   (Viewport :< cls, Object :< cls) => cls -> IO Bool
is_using_render_direct_to_screen cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindViewport_is_using_render_direct_to_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "is_using_render_direct_to_screen" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Viewport.is_using_render_direct_to_screen

{-# NOINLINE bindViewport_set_as_audio_listener #-}

-- | If @true@, the viewport will process 3D audio streams.
bindViewport_set_as_audio_listener :: MethodBind
bindViewport_set_as_audio_listener
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_as_audio_listener" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will process 3D audio streams.
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

instance NodeMethod Viewport "set_as_audio_listener" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_as_audio_listener

{-# NOINLINE bindViewport_set_as_audio_listener_2d #-}

-- | If @true@, the viewport will process 2D audio streams.
bindViewport_set_as_audio_listener_2d :: MethodBind
bindViewport_set_as_audio_listener_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_as_audio_listener_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will process 2D audio streams.
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

instance NodeMethod Viewport "set_as_audio_listener_2d" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_as_audio_listener_2d

{-# NOINLINE bindViewport_set_attach_to_screen_rect #-}

-- | Attaches this @Viewport@ to the root @Viewport@ with the specified rectangle. This bypasses the need for another node to display this @Viewport@ but makes you responsible for updating the position of this @Viewport@ manually.
bindViewport_set_attach_to_screen_rect :: MethodBind
bindViewport_set_attach_to_screen_rect
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_attach_to_screen_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Attaches this @Viewport@ to the root @Viewport@ with the specified rectangle. This bypasses the need for another node to display this @Viewport@ but makes you responsible for updating the position of this @Viewport@ manually.
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

instance NodeMethod Viewport "set_attach_to_screen_rect" '[Rect2]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_attach_to_screen_rect

{-# NOINLINE bindViewport_set_canvas_transform #-}

-- | The canvas transform of the viewport, useful for changing the on-screen positions of all child @CanvasItem@s. This is relative to the global canvas transform of the viewport.
bindViewport_set_canvas_transform :: MethodBind
bindViewport_set_canvas_transform
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The canvas transform of the viewport, useful for changing the on-screen positions of all child @CanvasItem@s. This is relative to the global canvas transform of the viewport.
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

instance NodeMethod Viewport "set_canvas_transform" '[Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_canvas_transform

{-# NOINLINE bindViewport_set_clear_mode #-}

-- | The clear mode when viewport used as a render target.
--   			__Note:__ This property is intended for 2D usage.
bindViewport_set_clear_mode :: MethodBind
bindViewport_set_clear_mode
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_clear_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The clear mode when viewport used as a render target.
--   			__Note:__ This property is intended for 2D usage.
set_clear_mode ::
                 (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_clear_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_clear_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_clear_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_clear_mode

{-# NOINLINE bindViewport_set_debug_draw #-}

-- | The overlay mode for test rendered geometry in debug purposes.
bindViewport_set_debug_draw :: MethodBind
bindViewport_set_debug_draw
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_debug_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The overlay mode for test rendered geometry in debug purposes.
set_debug_draw ::
                 (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_debug_draw cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_debug_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_debug_draw" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_debug_draw

{-# NOINLINE bindViewport_set_disable_3d #-}

-- | If @true@, the viewport will disable 3D rendering. For actual disabling use @usage@.
bindViewport_set_disable_3d :: MethodBind
bindViewport_set_disable_3d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_disable_3d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will disable 3D rendering. For actual disabling use @usage@.
set_disable_3d ::
                 (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_3d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_disable_3d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_disable_3d" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_disable_3d

{-# NOINLINE bindViewport_set_disable_input #-}

-- | If @true@, the viewport will not receive input events.
bindViewport_set_disable_input :: MethodBind
bindViewport_set_disable_input
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_disable_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will not receive input events.
set_disable_input ::
                    (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disable_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_disable_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_disable_input" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_disable_input

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

instance NodeMethod Viewport "set_global_canvas_transform"
           '[Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_global_canvas_transform

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

instance NodeMethod Viewport "set_handle_input_locally" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_handle_input_locally

{-# NOINLINE bindViewport_set_hdr #-}

-- | If @true@, the viewport rendering will receive benefits from High Dynamic Range algorithm. High Dynamic Range allows the viewport to receive values that are outside the 0-1 range. In Godot HDR uses 16 bits, meaning it does not store the full range of a floating point number.
--   			__Note:__ Requires @usage@ to be set to @USAGE_3D@ or @USAGE_3D_NO_EFFECTS@, since HDR is not supported for 2D.
bindViewport_set_hdr :: MethodBind
bindViewport_set_hdr
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport rendering will receive benefits from High Dynamic Range algorithm. High Dynamic Range allows the viewport to receive values that are outside the 0-1 range. In Godot HDR uses 16 bits, meaning it does not store the full range of a floating point number.
--   			__Note:__ Requires @usage@ to be set to @USAGE_3D@ or @USAGE_3D_NO_EFFECTS@, since HDR is not supported for 2D.
set_hdr :: (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_hdr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_hdr (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_hdr" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_hdr

{-# NOINLINE bindViewport_set_input_as_handled #-}

-- | Stops the input from propagating further down the @SceneTree@.
bindViewport_set_input_as_handled :: MethodBind
bindViewport_set_input_as_handled
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_input_as_handled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the input from propagating further down the @SceneTree@.
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

instance NodeMethod Viewport "set_input_as_handled" '[] (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_input_as_handled

{-# NOINLINE bindViewport_set_keep_3d_linear #-}

-- | If @true@, the result after 3D rendering will not have a linear to sRGB color conversion applied. This is important when the viewport is used as a render target where the result is used as a texture on a 3D object rendered in another viewport. It is also important if the viewport is used to create data that is not color based (noise, heightmaps, pickmaps, etc.). Do not enable this when the viewport is used as a texture on a 2D object or if the viewport is your final output. For the GLES2 driver this will convert the sRGB output to linear, this should only be used for VR plugins that require input in linear color space!
bindViewport_set_keep_3d_linear :: MethodBind
bindViewport_set_keep_3d_linear
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_keep_3d_linear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the result after 3D rendering will not have a linear to sRGB color conversion applied. This is important when the viewport is used as a render target where the result is used as a texture on a 3D object rendered in another viewport. It is also important if the viewport is used to create data that is not color based (noise, heightmaps, pickmaps, etc.). Do not enable this when the viewport is used as a texture on a 2D object or if the viewport is your final output. For the GLES2 driver this will convert the sRGB output to linear, this should only be used for VR plugins that require input in linear color space!
set_keep_3d_linear ::
                     (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_keep_3d_linear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_keep_3d_linear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_keep_3d_linear" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_keep_3d_linear

{-# NOINLINE bindViewport_set_msaa #-}

-- | The multisample anti-aliasing mode. A higher number results in smoother edges at the cost of significantly worse performance. A value of 4 is best unless targeting very high-end systems.
bindViewport_set_msaa :: MethodBind
bindViewport_set_msaa
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_msaa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The multisample anti-aliasing mode. A higher number results in smoother edges at the cost of significantly worse performance. A value of 4 is best unless targeting very high-end systems.
set_msaa :: (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_msaa cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_msaa (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_msaa" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_msaa

{-# NOINLINE bindViewport_set_physics_object_picking #-}

-- | If @true@, the objects rendered by viewport become subjects of mouse picking process.
bindViewport_set_physics_object_picking :: MethodBind
bindViewport_set_physics_object_picking
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_physics_object_picking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the objects rendered by viewport become subjects of mouse picking process.
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

instance NodeMethod Viewport "set_physics_object_picking" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_physics_object_picking

{-# NOINLINE bindViewport_set_shadow_atlas_quadrant_subdiv #-}

-- | Sets the number of subdivisions to use in the specified quadrant. A higher number of subdivisions allows you to have more shadows in the scene at once, but reduces the quality of the shadows. A good practice is to have quadrants with a varying number of subdivisions and to have as few subdivisions as possible.
bindViewport_set_shadow_atlas_quadrant_subdiv :: MethodBind
bindViewport_set_shadow_atlas_quadrant_subdiv
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_shadow_atlas_quadrant_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the number of subdivisions to use in the specified quadrant. A higher number of subdivisions allows you to have more shadows in the scene at once, but reduces the quality of the shadows. A good practice is to have quadrants with a varying number of subdivisions and to have as few subdivisions as possible.
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

instance NodeMethod Viewport "set_shadow_atlas_quadrant_subdiv"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_shadow_atlas_quadrant_subdiv

{-# NOINLINE bindViewport_set_shadow_atlas_size #-}

-- | The shadow atlas' resolution (used for omni and spot lights). The value will be rounded up to the nearest power of 2.
--   			__Note:__ If this is set to 0, shadows won't be visible. Since user-created viewports default to a value of 0, this value must be set above 0 manually.
bindViewport_set_shadow_atlas_size :: MethodBind
bindViewport_set_shadow_atlas_size
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_shadow_atlas_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow atlas' resolution (used for omni and spot lights). The value will be rounded up to the nearest power of 2.
--   			__Note:__ If this is set to 0, shadows won't be visible. Since user-created viewports default to a value of 0, this value must be set above 0 manually.
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

instance NodeMethod Viewport "set_shadow_atlas_size" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_shadow_atlas_size

{-# NOINLINE bindViewport_set_size #-}

-- | The width and height of viewport. Must be set to a value greater than or equal to 2 pixels on both dimensions. Otherwise, nothing will be displayed.
bindViewport_set_size :: MethodBind
bindViewport_set_size
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width and height of viewport. Must be set to a value greater than or equal to 2 pixels on both dimensions. Otherwise, nothing will be displayed.
set_size ::
           (Viewport :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_size" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_size

{-# NOINLINE bindViewport_set_size_override #-}

-- | Sets the size override of the viewport. If the @enable@ parameter is @true@ the override is used, otherwise it uses the default size. If the size parameter is @(-1, -1)@, it won't update the size.
bindViewport_set_size_override :: MethodBind
bindViewport_set_size_override
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_size_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size override of the viewport. If the @enable@ parameter is @true@ the override is used, otherwise it uses the default size. If the size parameter is @(-1, -1)@, it won't update the size.
set_size_override ::
                    (Viewport :< cls, Object :< cls) =>
                    cls -> Bool -> Maybe Vector2 -> Maybe Vector2 -> IO ()
set_size_override cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1,
       defaultedVariant VariantVector2 (V2 (-1) (-1)) arg2,
       defaultedVariant VariantVector2 (V2 0 0) arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_size_override (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_size_override"
           '[Bool, Maybe Vector2, Maybe Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_size_override

{-# NOINLINE bindViewport_set_size_override_stretch #-}

-- | If @true@, the size override affects stretch as well.
bindViewport_set_size_override_stretch :: MethodBind
bindViewport_set_size_override_stretch
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_size_override_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the size override affects stretch as well.
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

instance NodeMethod Viewport "set_size_override_stretch" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_size_override_stretch

{-# NOINLINE bindViewport_set_snap_controls_to_pixels #-}

-- | If @true@, the GUI controls on the viewport will lay pixel perfectly.
bindViewport_set_snap_controls_to_pixels :: MethodBind
bindViewport_set_snap_controls_to_pixels
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_snap_controls_to_pixels" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the GUI controls on the viewport will lay pixel perfectly.
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

instance NodeMethod Viewport "set_snap_controls_to_pixels" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_snap_controls_to_pixels

{-# NOINLINE bindViewport_set_transparent_background #-}

-- | If @true@, the viewport should render its background as transparent.
bindViewport_set_transparent_background :: MethodBind
bindViewport_set_transparent_background
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_transparent_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport should render its background as transparent.
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

instance NodeMethod Viewport "set_transparent_background" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_transparent_background

{-# NOINLINE bindViewport_set_update_mode #-}

-- | The update mode when viewport used as a render target.
bindViewport_set_update_mode :: MethodBind
bindViewport_set_update_mode
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The update mode when viewport used as a render target.
set_update_mode ::
                  (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_update_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_update_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_update_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_update_mode

{-# NOINLINE bindViewport_set_usage #-}

-- | The rendering mode of viewport.
bindViewport_set_usage :: MethodBind
bindViewport_set_usage
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rendering mode of viewport.
set_usage ::
            (Viewport :< cls, Object :< cls) => cls -> Int -> IO ()
set_usage cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_usage (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_usage" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_usage

{-# NOINLINE bindViewport_set_use_arvr #-}

-- | If @true@, the viewport will be used in AR/VR process.
bindViewport_set_use_arvr :: MethodBind
bindViewport_set_use_arvr
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_use_arvr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will be used in AR/VR process.
set_use_arvr ::
               (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_arvr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_use_arvr (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_use_arvr" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_use_arvr

{-# NOINLINE bindViewport_set_use_own_world #-}

-- | If @true@, the viewport will use @World@ defined in @world@ property.
bindViewport_set_use_own_world :: MethodBind
bindViewport_set_use_own_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_use_own_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will use @World@ defined in @world@ property.
set_use_own_world ::
                    (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_own_world cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_use_own_world (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_use_own_world" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_use_own_world

{-# NOINLINE bindViewport_set_use_render_direct_to_screen #-}

-- | If @true@, renders the Viewport directly to the screen instead of to the root viewport. Only available in GLES2. This is a low-level optimization and should not be used in most cases. If used, reading from the Viewport or from @SCREEN_TEXTURE@ becomes unavailable. For more information see @method VisualServer.viewport_set_render_direct_to_screen@.
bindViewport_set_use_render_direct_to_screen :: MethodBind
bindViewport_set_use_render_direct_to_screen
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_use_render_direct_to_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, renders the Viewport directly to the screen instead of to the root viewport. Only available in GLES2. This is a low-level optimization and should not be used in most cases. If used, reading from the Viewport or from @SCREEN_TEXTURE@ becomes unavailable. For more information see @method VisualServer.viewport_set_render_direct_to_screen@.
set_use_render_direct_to_screen ::
                                  (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_render_direct_to_screen cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_use_render_direct_to_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_use_render_direct_to_screen"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_use_render_direct_to_screen

{-# NOINLINE bindViewport_set_vflip #-}

-- | If @true@, the result of rendering will be flipped vertically. Since Viewports in Godot 3.x render upside-down, it's recommended to set this to @true@ in most situations.
bindViewport_set_vflip :: MethodBind
bindViewport_set_vflip
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_vflip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the result of rendering will be flipped vertically. Since Viewports in Godot 3.x render upside-down, it's recommended to set this to @true@ in most situations.
set_vflip ::
            (Viewport :< cls, Object :< cls) => cls -> Bool -> IO ()
set_vflip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_vflip (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_vflip" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_vflip

{-# NOINLINE bindViewport_set_world #-}

-- | The custom @World@ which can be used as 3D environment source.
bindViewport_set_world :: MethodBind
bindViewport_set_world
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_world" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @World@ which can be used as 3D environment source.
set_world ::
            (Viewport :< cls, Object :< cls) => cls -> World -> IO ()
set_world cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_world (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_world" '[World] (IO ()) where
        nodeMethod = Godot.Core.Viewport.set_world

{-# NOINLINE bindViewport_set_world_2d #-}

-- | The custom @World2D@ which can be used as 2D environment source.
bindViewport_set_world_2d :: MethodBind
bindViewport_set_world_2d
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "set_world_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @World2D@ which can be used as 2D environment source.
set_world_2d ::
               (Viewport :< cls, Object :< cls) => cls -> World2D -> IO ()
set_world_2d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_set_world_2d (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "set_world_2d" '[World2D] (IO ())
         where
        nodeMethod = Godot.Core.Viewport.set_world_2d

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

instance NodeMethod Viewport "unhandled_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.Viewport.unhandled_input

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

instance NodeMethod Viewport "update_worlds" '[] (IO ()) where
        nodeMethod = Godot.Core.Viewport.update_worlds

{-# NOINLINE bindViewport_use_arvr #-}

-- | If @true@, the viewport will be used in AR/VR process.
bindViewport_use_arvr :: MethodBind
bindViewport_use_arvr
  = unsafePerformIO $
      withCString "Viewport" $
        \ clsNamePtr ->
          withCString "use_arvr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport will be used in AR/VR process.
use_arvr :: (Viewport :< cls, Object :< cls) => cls -> IO Bool
use_arvr cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewport_use_arvr (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Viewport "use_arvr" '[] (IO Bool) where
        nodeMethod = Godot.Core.Viewport.use_arvr

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

instance NodeMethod Viewport "warp_mouse" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.Viewport.warp_mouse