{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Camera2D
       (Godot.Core.Camera2D._ANCHOR_MODE_FIXED_TOP_LEFT,
        Godot.Core.Camera2D._CAMERA2D_PROCESS_PHYSICS,
        Godot.Core.Camera2D._CAMERA2D_PROCESS_IDLE,
        Godot.Core.Camera2D._ANCHOR_MODE_DRAG_CENTER,
        Godot.Core.Camera2D._make_current,
        Godot.Core.Camera2D._set_current,
        Godot.Core.Camera2D._set_old_smoothing,
        Godot.Core.Camera2D._update_scroll, Godot.Core.Camera2D.align,
        Godot.Core.Camera2D.clear_current,
        Godot.Core.Camera2D.force_update_scroll,
        Godot.Core.Camera2D.get_anchor_mode,
        Godot.Core.Camera2D.get_camera_position,
        Godot.Core.Camera2D.get_camera_screen_center,
        Godot.Core.Camera2D.get_custom_viewport,
        Godot.Core.Camera2D.get_drag_margin,
        Godot.Core.Camera2D.get_follow_smoothing,
        Godot.Core.Camera2D.get_h_offset, Godot.Core.Camera2D.get_limit,
        Godot.Core.Camera2D.get_offset,
        Godot.Core.Camera2D.get_process_mode,
        Godot.Core.Camera2D.get_v_offset, Godot.Core.Camera2D.get_zoom,
        Godot.Core.Camera2D.is_current,
        Godot.Core.Camera2D.is_follow_smoothing_enabled,
        Godot.Core.Camera2D.is_h_drag_enabled,
        Godot.Core.Camera2D.is_limit_drawing_enabled,
        Godot.Core.Camera2D.is_limit_smoothing_enabled,
        Godot.Core.Camera2D.is_margin_drawing_enabled,
        Godot.Core.Camera2D.is_rotating,
        Godot.Core.Camera2D.is_screen_drawing_enabled,
        Godot.Core.Camera2D.is_v_drag_enabled,
        Godot.Core.Camera2D.make_current,
        Godot.Core.Camera2D.reset_smoothing,
        Godot.Core.Camera2D.set_anchor_mode,
        Godot.Core.Camera2D.set_custom_viewport,
        Godot.Core.Camera2D.set_drag_margin,
        Godot.Core.Camera2D.set_enable_follow_smoothing,
        Godot.Core.Camera2D.set_follow_smoothing,
        Godot.Core.Camera2D.set_h_drag_enabled,
        Godot.Core.Camera2D.set_h_offset, Godot.Core.Camera2D.set_limit,
        Godot.Core.Camera2D.set_limit_drawing_enabled,
        Godot.Core.Camera2D.set_limit_smoothing_enabled,
        Godot.Core.Camera2D.set_margin_drawing_enabled,
        Godot.Core.Camera2D.set_offset,
        Godot.Core.Camera2D.set_process_mode,
        Godot.Core.Camera2D.set_rotating,
        Godot.Core.Camera2D.set_screen_drawing_enabled,
        Godot.Core.Camera2D.set_v_drag_enabled,
        Godot.Core.Camera2D.set_v_offset, Godot.Core.Camera2D.set_zoom)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ANCHOR_MODE_FIXED_TOP_LEFT :: Int
_ANCHOR_MODE_FIXED_TOP_LEFT = 0

_CAMERA2D_PROCESS_PHYSICS :: Int
_CAMERA2D_PROCESS_PHYSICS = 0

_CAMERA2D_PROCESS_IDLE :: Int
_CAMERA2D_PROCESS_IDLE = 1

_ANCHOR_MODE_DRAG_CENTER :: Int
_ANCHOR_MODE_DRAG_CENTER = 1

{-# NOINLINE bindCamera2D__make_current #-}

bindCamera2D__make_current :: MethodBind
bindCamera2D__make_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "_make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_make_current ::
                (Camera2D :< cls, Object :< cls) => cls -> Object -> IO ()
_make_current cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D__make_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D__set_current #-}

-- | If [code]true[/code], the camera is the active camera for the current scene. Only one camera can be current, so setting a different camera [code]current[/code] will disable this one.
bindCamera2D__set_current :: MethodBind
bindCamera2D__set_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "_set_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera is the active camera for the current scene. Only one camera can be current, so setting a different camera [code]current[/code] will disable this one.
_set_current ::
               (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_current cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D__set_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D__set_old_smoothing #-}

bindCamera2D__set_old_smoothing :: MethodBind
bindCamera2D__set_old_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "_set_old_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_old_smoothing ::
                     (Camera2D :< cls, Object :< cls) => cls -> Float -> IO ()
_set_old_smoothing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D__set_old_smoothing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D__update_scroll #-}

bindCamera2D__update_scroll :: MethodBind
bindCamera2D__update_scroll
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "_update_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_scroll :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
_update_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D__update_scroll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_align #-}

-- | Align the camera to the tracked node
bindCamera2D_align :: MethodBind
bindCamera2D_align
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Align the camera to the tracked node
align :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_align (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_clear_current #-}

-- | Removes any [code]Camera2D[/code] from the ancestor [Viewport]'s internal currently-assigned camera.
bindCamera2D_clear_current :: MethodBind
bindCamera2D_clear_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "clear_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes any [code]Camera2D[/code] from the ancestor [Viewport]'s internal currently-assigned camera.
clear_current :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
clear_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_clear_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_force_update_scroll #-}

-- | Force the camera to update scroll immediately.
bindCamera2D_force_update_scroll :: MethodBind
bindCamera2D_force_update_scroll
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "force_update_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Force the camera to update scroll immediately.
force_update_scroll ::
                      (Camera2D :< cls, Object :< cls) => cls -> IO ()
force_update_scroll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_force_update_scroll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_anchor_mode #-}

-- | The Camera2D's anchor point. See [code]ANCHOR_MODE_*[/code] constants.
bindCamera2D_get_anchor_mode :: MethodBind
bindCamera2D_get_anchor_mode
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_anchor_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Camera2D's anchor point. See [code]ANCHOR_MODE_*[/code] constants.
get_anchor_mode ::
                  (Camera2D :< cls, Object :< cls) => cls -> IO Int
get_anchor_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_anchor_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_camera_position #-}

-- | Returns the camera position.
bindCamera2D_get_camera_position :: MethodBind
bindCamera2D_get_camera_position
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_camera_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the camera position.
get_camera_position ::
                      (Camera2D :< cls, Object :< cls) => cls -> IO Vector2
get_camera_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_camera_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_camera_screen_center #-}

-- | Returns the location of the [code]Camera2D[/code]'s screen-center, relative to the origin.
bindCamera2D_get_camera_screen_center :: MethodBind
bindCamera2D_get_camera_screen_center
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_camera_screen_center" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the location of the [code]Camera2D[/code]'s screen-center, relative to the origin.
get_camera_screen_center ::
                           (Camera2D :< cls, Object :< cls) => cls -> IO Vector2
get_camera_screen_center cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_camera_screen_center
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_custom_viewport #-}

-- | The custom [Viewport] node attached to the [code]Camera2D[/code]. If null or not a [Viewport], uses the default viewport instead.
bindCamera2D_get_custom_viewport :: MethodBind
bindCamera2D_get_custom_viewport
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_custom_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [Viewport] node attached to the [code]Camera2D[/code]. If null or not a [Viewport], uses the default viewport instead.
get_custom_viewport ::
                      (Camera2D :< cls, Object :< cls) => cls -> IO Node
get_custom_viewport cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_custom_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_drag_margin #-}

-- | Bottom margin needed to drag the camera. A value of [code]1[/code] makes the camera move only when reaching the edge of the screen.
bindCamera2D_get_drag_margin :: MethodBind
bindCamera2D_get_drag_margin
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_drag_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom margin needed to drag the camera. A value of [code]1[/code] makes the camera move only when reaching the edge of the screen.
get_drag_margin ::
                  (Camera2D :< cls, Object :< cls) => cls -> Int -> IO Float
get_drag_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_drag_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_follow_smoothing #-}

-- | Speed in pixels per second of the camera's smoothing effect when [member smoothing_enabled] is [code]true[/code]
bindCamera2D_get_follow_smoothing :: MethodBind
bindCamera2D_get_follow_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_follow_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Speed in pixels per second of the camera's smoothing effect when [member smoothing_enabled] is [code]true[/code]
get_follow_smoothing ::
                       (Camera2D :< cls, Object :< cls) => cls -> IO Float
get_follow_smoothing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_follow_smoothing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_h_offset #-}

-- | The horizontal offset of the camera, relative to the drag margins. Default value: [code]0[/code]
bindCamera2D_get_h_offset :: MethodBind
bindCamera2D_get_h_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The horizontal offset of the camera, relative to the drag margins. Default value: [code]0[/code]
get_h_offset :: (Camera2D :< cls, Object :< cls) => cls -> IO Float
get_h_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_limit #-}

-- | Bottom scroll limit in pixels. The camera stops moving when reaching this value.
bindCamera2D_get_limit :: MethodBind
bindCamera2D_get_limit
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom scroll limit in pixels. The camera stops moving when reaching this value.
get_limit ::
            (Camera2D :< cls, Object :< cls) => cls -> Int -> IO Int
get_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_limit (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_offset #-}

-- | The camera's offset, useful for looking around or camera shake animations.
bindCamera2D_get_offset :: MethodBind
bindCamera2D_get_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's offset, useful for looking around or camera shake animations.
get_offset :: (Camera2D :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_process_mode #-}

bindCamera2D_get_process_mode :: MethodBind
bindCamera2D_get_process_mode
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_process_mode ::
                   (Camera2D :< cls, Object :< cls) => cls -> IO Int
get_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_process_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_v_offset #-}

-- | The vertical offset of the camera, relative to the drag margins. Default value: [code]0[/code]
bindCamera2D_get_v_offset :: MethodBind
bindCamera2D_get_v_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The vertical offset of the camera, relative to the drag margins. Default value: [code]0[/code]
get_v_offset :: (Camera2D :< cls, Object :< cls) => cls -> IO Float
get_v_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_get_zoom #-}

-- | The camera's zoom relative to the viewport. Values larger than [code]Vector2(1, 1)[/code] zoom out and smaller values zoom in. For an example, use [code]Vector2(0.5, 0.5)[/code] for a 2x zoom in, and [code]Vector2(4, 4)[/code] for a 4x zoom out.
bindCamera2D_get_zoom :: MethodBind
bindCamera2D_get_zoom
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's zoom relative to the viewport. Values larger than [code]Vector2(1, 1)[/code] zoom out and smaller values zoom in. For an example, use [code]Vector2(0.5, 0.5)[/code] for a 2x zoom in, and [code]Vector2(4, 4)[/code] for a 4x zoom out.
get_zoom :: (Camera2D :< cls, Object :< cls) => cls -> IO Vector2
get_zoom cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_zoom (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_current #-}

-- | If [code]true[/code], the camera is the active camera for the current scene. Only one camera can be current, so setting a different camera [code]current[/code] will disable this one.
bindCamera2D_is_current :: MethodBind
bindCamera2D_is_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera is the active camera for the current scene. Only one camera can be current, so setting a different camera [code]current[/code] will disable this one.
is_current :: (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_follow_smoothing_enabled #-}

-- | If [code]true[/code], the camera smoothly moves towards the target at [member smoothing_speed]. Default value: [code]false[/code]
bindCamera2D_is_follow_smoothing_enabled :: MethodBind
bindCamera2D_is_follow_smoothing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_follow_smoothing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera smoothly moves towards the target at [member smoothing_speed]. Default value: [code]false[/code]
is_follow_smoothing_enabled ::
                              (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_follow_smoothing_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_follow_smoothing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_h_drag_enabled #-}

-- | If [code]true[/code], the camera only moves when reaching the horizontal drag margins. If [code]false[/code], the camera moves horizontally regardless of margins. Default value: [code]true[/code].
bindCamera2D_is_h_drag_enabled :: MethodBind
bindCamera2D_is_h_drag_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_h_drag_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera only moves when reaching the horizontal drag margins. If [code]false[/code], the camera moves horizontally regardless of margins. Default value: [code]true[/code].
is_h_drag_enabled ::
                    (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_h_drag_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_h_drag_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_limit_drawing_enabled #-}

-- | If [code]true[/code], draws the camera's limits rectangle in the editor. Default value: [code]true[/code]
bindCamera2D_is_limit_drawing_enabled :: MethodBind
bindCamera2D_is_limit_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_limit_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], draws the camera's limits rectangle in the editor. Default value: [code]true[/code]
is_limit_drawing_enabled ::
                           (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_limit_drawing_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_limit_drawing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_limit_smoothing_enabled #-}

-- | If [code]true[/code], the camera smoothly stops when reaches its limits. Default value: [code]false[/code]
bindCamera2D_is_limit_smoothing_enabled :: MethodBind
bindCamera2D_is_limit_smoothing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_limit_smoothing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera smoothly stops when reaches its limits. Default value: [code]false[/code]
is_limit_smoothing_enabled ::
                             (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_limit_smoothing_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_limit_smoothing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_margin_drawing_enabled #-}

-- | If [code]true[/code], draws the camera's drag margin rectangle in the editor. Default value: [code]false[/code]
bindCamera2D_is_margin_drawing_enabled :: MethodBind
bindCamera2D_is_margin_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_margin_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], draws the camera's drag margin rectangle in the editor. Default value: [code]false[/code]
is_margin_drawing_enabled ::
                            (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_margin_drawing_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_margin_drawing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_rotating #-}

-- | If [code]true[/code], the camera rotates with the target. Default value: [code]false[/code]
bindCamera2D_is_rotating :: MethodBind
bindCamera2D_is_rotating
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_rotating" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera rotates with the target. Default value: [code]false[/code]
is_rotating :: (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_rotating cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_rotating (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_screen_drawing_enabled #-}

-- | If [code]true[/code], draws the camera's screen rectangle in the editor. Default value: [code]false[/code]
bindCamera2D_is_screen_drawing_enabled :: MethodBind
bindCamera2D_is_screen_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_screen_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], draws the camera's screen rectangle in the editor. Default value: [code]false[/code]
is_screen_drawing_enabled ::
                            (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_screen_drawing_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_screen_drawing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_is_v_drag_enabled #-}

-- | If [code]true[/code], the camera only moves when reaching the vertical drag margins. If [code]false[/code], the camera moves vertically regardless of margins. Default value: [code]true[/code].
bindCamera2D_is_v_drag_enabled :: MethodBind
bindCamera2D_is_v_drag_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_v_drag_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera only moves when reaching the vertical drag margins. If [code]false[/code], the camera moves vertically regardless of margins. Default value: [code]true[/code].
is_v_drag_enabled ::
                    (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_v_drag_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_v_drag_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_make_current #-}

-- | Make this the current 2D camera for the scene (viewport and layer), in case there's many cameras in the scene.
bindCamera2D_make_current :: MethodBind
bindCamera2D_make_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Make this the current 2D camera for the scene (viewport and layer), in case there's many cameras in the scene.
make_current :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
make_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_make_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_reset_smoothing #-}

-- | Set the camera's position immediately to its current smoothing destination.
--   				This has no effect if smoothing is disabled.
bindCamera2D_reset_smoothing :: MethodBind
bindCamera2D_reset_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "reset_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the camera's position immediately to its current smoothing destination.
--   				This has no effect if smoothing is disabled.
reset_smoothing :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
reset_smoothing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_reset_smoothing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_anchor_mode #-}

-- | The Camera2D's anchor point. See [code]ANCHOR_MODE_*[/code] constants.
bindCamera2D_set_anchor_mode :: MethodBind
bindCamera2D_set_anchor_mode
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_anchor_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Camera2D's anchor point. See [code]ANCHOR_MODE_*[/code] constants.
set_anchor_mode ::
                  (Camera2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_anchor_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_anchor_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_custom_viewport #-}

-- | The custom [Viewport] node attached to the [code]Camera2D[/code]. If null or not a [Viewport], uses the default viewport instead.
bindCamera2D_set_custom_viewport :: MethodBind
bindCamera2D_set_custom_viewport
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_custom_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [Viewport] node attached to the [code]Camera2D[/code]. If null or not a [Viewport], uses the default viewport instead.
set_custom_viewport ::
                      (Camera2D :< cls, Object :< cls) => cls -> Node -> IO ()
set_custom_viewport cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_custom_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_drag_margin #-}

-- | Bottom margin needed to drag the camera. A value of [code]1[/code] makes the camera move only when reaching the edge of the screen.
bindCamera2D_set_drag_margin :: MethodBind
bindCamera2D_set_drag_margin
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_drag_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom margin needed to drag the camera. A value of [code]1[/code] makes the camera move only when reaching the edge of the screen.
set_drag_margin ::
                  (Camera2D :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_drag_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_drag_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_enable_follow_smoothing #-}

-- | If [code]true[/code], the camera smoothly moves towards the target at [member smoothing_speed]. Default value: [code]false[/code]
bindCamera2D_set_enable_follow_smoothing :: MethodBind
bindCamera2D_set_enable_follow_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_enable_follow_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera smoothly moves towards the target at [member smoothing_speed]. Default value: [code]false[/code]
set_enable_follow_smoothing ::
                              (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enable_follow_smoothing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_enable_follow_smoothing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_follow_smoothing #-}

-- | Speed in pixels per second of the camera's smoothing effect when [member smoothing_enabled] is [code]true[/code]
bindCamera2D_set_follow_smoothing :: MethodBind
bindCamera2D_set_follow_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_follow_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Speed in pixels per second of the camera's smoothing effect when [member smoothing_enabled] is [code]true[/code]
set_follow_smoothing ::
                       (Camera2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_follow_smoothing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_follow_smoothing
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_h_drag_enabled #-}

-- | If [code]true[/code], the camera only moves when reaching the horizontal drag margins. If [code]false[/code], the camera moves horizontally regardless of margins. Default value: [code]true[/code].
bindCamera2D_set_h_drag_enabled :: MethodBind
bindCamera2D_set_h_drag_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_h_drag_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera only moves when reaching the horizontal drag margins. If [code]false[/code], the camera moves horizontally regardless of margins. Default value: [code]true[/code].
set_h_drag_enabled ::
                     (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_h_drag_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_h_drag_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_h_offset #-}

-- | The horizontal offset of the camera, relative to the drag margins. Default value: [code]0[/code]
bindCamera2D_set_h_offset :: MethodBind
bindCamera2D_set_h_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The horizontal offset of the camera, relative to the drag margins. Default value: [code]0[/code]
set_h_offset ::
               (Camera2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_h_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_limit #-}

-- | Bottom scroll limit in pixels. The camera stops moving when reaching this value.
bindCamera2D_set_limit :: MethodBind
bindCamera2D_set_limit
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom scroll limit in pixels. The camera stops moving when reaching this value.
set_limit ::
            (Camera2D :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_limit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_limit (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_limit_drawing_enabled #-}

-- | If [code]true[/code], draws the camera's limits rectangle in the editor. Default value: [code]true[/code]
bindCamera2D_set_limit_drawing_enabled :: MethodBind
bindCamera2D_set_limit_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_limit_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], draws the camera's limits rectangle in the editor. Default value: [code]true[/code]
set_limit_drawing_enabled ::
                            (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_limit_drawing_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_limit_drawing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_limit_smoothing_enabled #-}

-- | If [code]true[/code], the camera smoothly stops when reaches its limits. Default value: [code]false[/code]
bindCamera2D_set_limit_smoothing_enabled :: MethodBind
bindCamera2D_set_limit_smoothing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_limit_smoothing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera smoothly stops when reaches its limits. Default value: [code]false[/code]
set_limit_smoothing_enabled ::
                              (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_limit_smoothing_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_limit_smoothing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_margin_drawing_enabled #-}

-- | If [code]true[/code], draws the camera's drag margin rectangle in the editor. Default value: [code]false[/code]
bindCamera2D_set_margin_drawing_enabled :: MethodBind
bindCamera2D_set_margin_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_margin_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], draws the camera's drag margin rectangle in the editor. Default value: [code]false[/code]
set_margin_drawing_enabled ::
                             (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_margin_drawing_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_margin_drawing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_offset #-}

-- | The camera's offset, useful for looking around or camera shake animations.
bindCamera2D_set_offset :: MethodBind
bindCamera2D_set_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's offset, useful for looking around or camera shake animations.
set_offset ::
             (Camera2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_process_mode #-}

bindCamera2D_set_process_mode :: MethodBind
bindCamera2D_set_process_mode
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_process_mode ::
                   (Camera2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_process_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_rotating #-}

-- | If [code]true[/code], the camera rotates with the target. Default value: [code]false[/code]
bindCamera2D_set_rotating :: MethodBind
bindCamera2D_set_rotating
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_rotating" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera rotates with the target. Default value: [code]false[/code]
set_rotating ::
               (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_rotating cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_rotating (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_screen_drawing_enabled #-}

-- | If [code]true[/code], draws the camera's screen rectangle in the editor. Default value: [code]false[/code]
bindCamera2D_set_screen_drawing_enabled :: MethodBind
bindCamera2D_set_screen_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_screen_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], draws the camera's screen rectangle in the editor. Default value: [code]false[/code]
set_screen_drawing_enabled ::
                             (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_screen_drawing_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_screen_drawing_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_v_drag_enabled #-}

-- | If [code]true[/code], the camera only moves when reaching the vertical drag margins. If [code]false[/code], the camera moves vertically regardless of margins. Default value: [code]true[/code].
bindCamera2D_set_v_drag_enabled :: MethodBind
bindCamera2D_set_v_drag_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_v_drag_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the camera only moves when reaching the vertical drag margins. If [code]false[/code], the camera moves vertically regardless of margins. Default value: [code]true[/code].
set_v_drag_enabled ::
                     (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_v_drag_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_v_drag_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_v_offset #-}

-- | The vertical offset of the camera, relative to the drag margins. Default value: [code]0[/code]
bindCamera2D_set_v_offset :: MethodBind
bindCamera2D_set_v_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The vertical offset of the camera, relative to the drag margins. Default value: [code]0[/code]
set_v_offset ::
               (Camera2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera2D_set_zoom #-}

-- | The camera's zoom relative to the viewport. Values larger than [code]Vector2(1, 1)[/code] zoom out and smaller values zoom in. For an example, use [code]Vector2(0.5, 0.5)[/code] for a 2x zoom in, and [code]Vector2(4, 4)[/code] for a 4x zoom out.
bindCamera2D_set_zoom :: MethodBind
bindCamera2D_set_zoom
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's zoom relative to the viewport. Values larger than [code]Vector2(1, 1)[/code] zoom out and smaller values zoom in. For an example, use [code]Vector2(0.5, 0.5)[/code] for a 2x zoom in, and [code]Vector2(4, 4)[/code] for a 4x zoom out.
set_zoom ::
           (Camera2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_zoom cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_zoom (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)