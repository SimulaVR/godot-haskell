{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Node2D()

_ANCHOR_MODE_FIXED_TOP_LEFT :: Int
_ANCHOR_MODE_FIXED_TOP_LEFT = 0

_CAMERA2D_PROCESS_PHYSICS :: Int
_CAMERA2D_PROCESS_PHYSICS = 0

_CAMERA2D_PROCESS_IDLE :: Int
_CAMERA2D_PROCESS_IDLE = 1

_ANCHOR_MODE_DRAG_CENTER :: Int
_ANCHOR_MODE_DRAG_CENTER = 1

instance NodeProperty Camera2D "anchor_mode" Int 'False where
        nodeProperty
          = (get_anchor_mode, wrapDroppingSetter set_anchor_mode, Nothing)

instance NodeProperty Camera2D "current" Bool 'False where
        nodeProperty
          = (is_current, wrapDroppingSetter _set_current, Nothing)

instance NodeProperty Camera2D "custom_viewport" Node 'False where
        nodeProperty
          = (get_custom_viewport, wrapDroppingSetter set_custom_viewport,
             Nothing)

instance NodeProperty Camera2D "drag_margin_bottom" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_drag_margin,
             wrapIndexedSetter 3 set_drag_margin, Nothing)

instance NodeProperty Camera2D "drag_margin_h_enabled" Bool 'False
         where
        nodeProperty
          = (is_h_drag_enabled, wrapDroppingSetter set_h_drag_enabled,
             Nothing)

instance NodeProperty Camera2D "drag_margin_left" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_drag_margin,
             wrapIndexedSetter 0 set_drag_margin, Nothing)

instance NodeProperty Camera2D "drag_margin_right" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_drag_margin,
             wrapIndexedSetter 2 set_drag_margin, Nothing)

instance NodeProperty Camera2D "drag_margin_top" Float 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_drag_margin,
             wrapIndexedSetter 1 set_drag_margin, Nothing)

instance NodeProperty Camera2D "drag_margin_v_enabled" Bool 'False
         where
        nodeProperty
          = (is_v_drag_enabled, wrapDroppingSetter set_v_drag_enabled,
             Nothing)

instance NodeProperty Camera2D "editor_draw_drag_margin" Bool
           'False
         where
        nodeProperty
          = (is_margin_drawing_enabled,
             wrapDroppingSetter set_margin_drawing_enabled, Nothing)

instance NodeProperty Camera2D "editor_draw_limits" Bool 'False
         where
        nodeProperty
          = (is_limit_drawing_enabled,
             wrapDroppingSetter set_limit_drawing_enabled, Nothing)

instance NodeProperty Camera2D "editor_draw_screen" Bool 'False
         where
        nodeProperty
          = (is_screen_drawing_enabled,
             wrapDroppingSetter set_screen_drawing_enabled, Nothing)

instance NodeProperty Camera2D "limit_bottom" Int 'False where
        nodeProperty
          = (wrapIndexedGetter 3 get_limit, wrapIndexedSetter 3 set_limit,
             Nothing)

instance NodeProperty Camera2D "limit_left" Int 'False where
        nodeProperty
          = (wrapIndexedGetter 0 get_limit, wrapIndexedSetter 0 set_limit,
             Nothing)

instance NodeProperty Camera2D "limit_right" Int 'False where
        nodeProperty
          = (wrapIndexedGetter 2 get_limit, wrapIndexedSetter 2 set_limit,
             Nothing)

instance NodeProperty Camera2D "limit_smoothed" Bool 'False where
        nodeProperty
          = (is_limit_smoothing_enabled,
             wrapDroppingSetter set_limit_smoothing_enabled, Nothing)

instance NodeProperty Camera2D "limit_top" Int 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_limit, wrapIndexedSetter 1 set_limit,
             Nothing)

instance NodeProperty Camera2D "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty Camera2D "offset_h" Float 'False where
        nodeProperty
          = (get_h_offset, wrapDroppingSetter set_h_offset, Nothing)

instance NodeProperty Camera2D "offset_v" Float 'False where
        nodeProperty
          = (get_v_offset, wrapDroppingSetter set_v_offset, Nothing)

instance NodeProperty Camera2D "process_mode" Int 'False where
        nodeProperty
          = (get_process_mode, wrapDroppingSetter set_process_mode, Nothing)

instance NodeProperty Camera2D "rotating" Bool 'False where
        nodeProperty
          = (is_rotating, wrapDroppingSetter set_rotating, Nothing)

instance NodeProperty Camera2D "smoothing_enabled" Bool 'False
         where
        nodeProperty
          = (is_follow_smoothing_enabled,
             wrapDroppingSetter set_enable_follow_smoothing, Nothing)

instance NodeProperty Camera2D "smoothing_speed" Float 'False where
        nodeProperty
          = (get_follow_smoothing, wrapDroppingSetter set_follow_smoothing,
             Nothing)

instance NodeProperty Camera2D "zoom" Vector2 'False where
        nodeProperty = (get_zoom, wrapDroppingSetter set_zoom, Nothing)

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

instance NodeMethod Camera2D "_make_current" '[Object] (IO ())
         where
        nodeMethod = Godot.Core.Camera2D._make_current

{-# NOINLINE bindCamera2D__set_current #-}

-- | If @true@, the camera is the active camera for the current scene. Only one camera can be current, so setting a different camera @current@ will disable this one.
bindCamera2D__set_current :: MethodBind
bindCamera2D__set_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "_set_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera is the active camera for the current scene. Only one camera can be current, so setting a different camera @current@ will disable this one.
_set_current ::
               (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_current cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D__set_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "_set_current" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Camera2D._set_current

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

instance NodeMethod Camera2D "_set_old_smoothing" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Camera2D._set_old_smoothing

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

instance NodeMethod Camera2D "_update_scroll" '[] (IO ()) where
        nodeMethod = Godot.Core.Camera2D._update_scroll

{-# NOINLINE bindCamera2D_align #-}

-- | Aligns the camera to the tracked node.
bindCamera2D_align :: MethodBind
bindCamera2D_align
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Aligns the camera to the tracked node.
align :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_align (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "align" '[] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.align

{-# NOINLINE bindCamera2D_clear_current #-}

-- | Removes any @Camera2D@ from the ancestor @Viewport@'s internal currently-assigned camera.
bindCamera2D_clear_current :: MethodBind
bindCamera2D_clear_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "clear_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes any @Camera2D@ from the ancestor @Viewport@'s internal currently-assigned camera.
clear_current :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
clear_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_clear_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "clear_current" '[] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.clear_current

{-# NOINLINE bindCamera2D_force_update_scroll #-}

-- | Forces the camera to update scroll immediately.
bindCamera2D_force_update_scroll :: MethodBind
bindCamera2D_force_update_scroll
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "force_update_scroll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Forces the camera to update scroll immediately.
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

instance NodeMethod Camera2D "force_update_scroll" '[] (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.force_update_scroll

{-# NOINLINE bindCamera2D_get_anchor_mode #-}

-- | The Camera2D's anchor point. See @enum AnchorMode@ constants.
bindCamera2D_get_anchor_mode :: MethodBind
bindCamera2D_get_anchor_mode
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_anchor_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Camera2D's anchor point. See @enum AnchorMode@ constants.
get_anchor_mode ::
                  (Camera2D :< cls, Object :< cls) => cls -> IO Int
get_anchor_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_anchor_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "get_anchor_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Camera2D.get_anchor_mode

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

instance NodeMethod Camera2D "get_camera_position" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Camera2D.get_camera_position

{-# NOINLINE bindCamera2D_get_camera_screen_center #-}

-- | Returns the location of the @Camera2D@'s screen-center, relative to the origin.
bindCamera2D_get_camera_screen_center :: MethodBind
bindCamera2D_get_camera_screen_center
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_camera_screen_center" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the location of the @Camera2D@'s screen-center, relative to the origin.
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

instance NodeMethod Camera2D "get_camera_screen_center" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Camera2D.get_camera_screen_center

{-# NOINLINE bindCamera2D_get_custom_viewport #-}

-- | The custom @Viewport@ node attached to the @Camera2D@. If @null@ or not a @Viewport@, uses the default viewport instead.
bindCamera2D_get_custom_viewport :: MethodBind
bindCamera2D_get_custom_viewport
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_custom_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @Viewport@ node attached to the @Camera2D@. If @null@ or not a @Viewport@, uses the default viewport instead.
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

instance NodeMethod Camera2D "get_custom_viewport" '[] (IO Node)
         where
        nodeMethod = Godot.Core.Camera2D.get_custom_viewport

{-# NOINLINE bindCamera2D_get_drag_margin #-}

-- | Returns the specified margin. See also @drag_margin_bottom@, @drag_margin_top@, @drag_margin_left@, and @drag_margin_right@.
bindCamera2D_get_drag_margin :: MethodBind
bindCamera2D_get_drag_margin
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_drag_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the specified margin. See also @drag_margin_bottom@, @drag_margin_top@, @drag_margin_left@, and @drag_margin_right@.
get_drag_margin ::
                  (Camera2D :< cls, Object :< cls) => cls -> Int -> IO Float
get_drag_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_drag_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "get_drag_margin" '[Int] (IO Float)
         where
        nodeMethod = Godot.Core.Camera2D.get_drag_margin

{-# NOINLINE bindCamera2D_get_follow_smoothing #-}

-- | Speed in pixels per second of the camera's smoothing effect when @smoothing_enabled@ is @true@.
bindCamera2D_get_follow_smoothing :: MethodBind
bindCamera2D_get_follow_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_follow_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Speed in pixels per second of the camera's smoothing effect when @smoothing_enabled@ is @true@.
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

instance NodeMethod Camera2D "get_follow_smoothing" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Camera2D.get_follow_smoothing

{-# NOINLINE bindCamera2D_get_h_offset #-}

-- | The horizontal offset of the camera, relative to the drag margins.
--   			__Note:__ Offset H is used only to force offset relative to margins. It's not updated in any way if drag margins are enabled and can be used to set initial offset.
bindCamera2D_get_h_offset :: MethodBind
bindCamera2D_get_h_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The horizontal offset of the camera, relative to the drag margins.
--   			__Note:__ Offset H is used only to force offset relative to margins. It's not updated in any way if drag margins are enabled and can be used to set initial offset.
get_h_offset :: (Camera2D :< cls, Object :< cls) => cls -> IO Float
get_h_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "get_h_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera2D.get_h_offset

{-# NOINLINE bindCamera2D_get_limit #-}

-- | Returns the specified camera limit. See also @limit_bottom@, @limit_top@, @limit_left@, and @limit_right@.
bindCamera2D_get_limit :: MethodBind
bindCamera2D_get_limit
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the specified camera limit. See also @limit_bottom@, @limit_top@, @limit_left@, and @limit_right@.
get_limit ::
            (Camera2D :< cls, Object :< cls) => cls -> Int -> IO Int
get_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_limit (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "get_limit" '[Int] (IO Int) where
        nodeMethod = Godot.Core.Camera2D.get_limit

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

instance NodeMethod Camera2D "get_offset" '[] (IO Vector2) where
        nodeMethod = Godot.Core.Camera2D.get_offset

{-# NOINLINE bindCamera2D_get_process_mode #-}

-- | The camera's process callback. See @enum Camera2DProcessMode@.
bindCamera2D_get_process_mode :: MethodBind
bindCamera2D_get_process_mode
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's process callback. See @enum Camera2DProcessMode@.
get_process_mode ::
                   (Camera2D :< cls, Object :< cls) => cls -> IO Int
get_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_process_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "get_process_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Camera2D.get_process_mode

{-# NOINLINE bindCamera2D_get_v_offset #-}

-- | The vertical offset of the camera, relative to the drag margins.
--   			__Note:__ Used the same as @offset_h@.
bindCamera2D_get_v_offset :: MethodBind
bindCamera2D_get_v_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The vertical offset of the camera, relative to the drag margins.
--   			__Note:__ Used the same as @offset_h@.
get_v_offset :: (Camera2D :< cls, Object :< cls) => cls -> IO Float
get_v_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "get_v_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera2D.get_v_offset

{-# NOINLINE bindCamera2D_get_zoom #-}

-- | The camera's zoom relative to the viewport. Values larger than @Vector2(1, 1)@ zoom out and smaller values zoom in. For an example, use @Vector2(0.5, 0.5)@ for a 2× zoom-in, and @Vector2(4, 4)@ for a 4× zoom-out.
bindCamera2D_get_zoom :: MethodBind
bindCamera2D_get_zoom
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "get_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's zoom relative to the viewport. Values larger than @Vector2(1, 1)@ zoom out and smaller values zoom in. For an example, use @Vector2(0.5, 0.5)@ for a 2× zoom-in, and @Vector2(4, 4)@ for a 4× zoom-out.
get_zoom :: (Camera2D :< cls, Object :< cls) => cls -> IO Vector2
get_zoom cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_get_zoom (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "get_zoom" '[] (IO Vector2) where
        nodeMethod = Godot.Core.Camera2D.get_zoom

{-# NOINLINE bindCamera2D_is_current #-}

-- | If @true@, the camera is the active camera for the current scene. Only one camera can be current, so setting a different camera @current@ will disable this one.
bindCamera2D_is_current :: MethodBind
bindCamera2D_is_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera is the active camera for the current scene. Only one camera can be current, so setting a different camera @current@ will disable this one.
is_current :: (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "is_current" '[] (IO Bool) where
        nodeMethod = Godot.Core.Camera2D.is_current

{-# NOINLINE bindCamera2D_is_follow_smoothing_enabled #-}

-- | If @true@, the camera smoothly moves towards the target at @smoothing_speed@.
bindCamera2D_is_follow_smoothing_enabled :: MethodBind
bindCamera2D_is_follow_smoothing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_follow_smoothing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera smoothly moves towards the target at @smoothing_speed@.
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

instance NodeMethod Camera2D "is_follow_smoothing_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Camera2D.is_follow_smoothing_enabled

{-# NOINLINE bindCamera2D_is_h_drag_enabled #-}

-- | If @true@, the camera only moves when reaching the horizontal drag margins. If @false@, the camera moves horizontally regardless of margins.
bindCamera2D_is_h_drag_enabled :: MethodBind
bindCamera2D_is_h_drag_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_h_drag_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera only moves when reaching the horizontal drag margins. If @false@, the camera moves horizontally regardless of margins.
is_h_drag_enabled ::
                    (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_h_drag_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_h_drag_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "is_h_drag_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Camera2D.is_h_drag_enabled

{-# NOINLINE bindCamera2D_is_limit_drawing_enabled #-}

-- | If @true@, draws the camera's limits rectangle in the editor.
bindCamera2D_is_limit_drawing_enabled :: MethodBind
bindCamera2D_is_limit_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_limit_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, draws the camera's limits rectangle in the editor.
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

instance NodeMethod Camera2D "is_limit_drawing_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Camera2D.is_limit_drawing_enabled

{-# NOINLINE bindCamera2D_is_limit_smoothing_enabled #-}

-- | If @true@, the camera smoothly stops when reaches its limits.
bindCamera2D_is_limit_smoothing_enabled :: MethodBind
bindCamera2D_is_limit_smoothing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_limit_smoothing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera smoothly stops when reaches its limits.
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

instance NodeMethod Camera2D "is_limit_smoothing_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Camera2D.is_limit_smoothing_enabled

{-# NOINLINE bindCamera2D_is_margin_drawing_enabled #-}

-- | If @true@, draws the camera's drag margin rectangle in the editor.
bindCamera2D_is_margin_drawing_enabled :: MethodBind
bindCamera2D_is_margin_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_margin_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, draws the camera's drag margin rectangle in the editor.
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

instance NodeMethod Camera2D "is_margin_drawing_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Camera2D.is_margin_drawing_enabled

{-# NOINLINE bindCamera2D_is_rotating #-}

-- | If @true@, the camera rotates with the target.
bindCamera2D_is_rotating :: MethodBind
bindCamera2D_is_rotating
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_rotating" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera rotates with the target.
is_rotating :: (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_rotating cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_rotating (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "is_rotating" '[] (IO Bool) where
        nodeMethod = Godot.Core.Camera2D.is_rotating

{-# NOINLINE bindCamera2D_is_screen_drawing_enabled #-}

-- | If @true@, draws the camera's screen rectangle in the editor.
bindCamera2D_is_screen_drawing_enabled :: MethodBind
bindCamera2D_is_screen_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_screen_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, draws the camera's screen rectangle in the editor.
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

instance NodeMethod Camera2D "is_screen_drawing_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Camera2D.is_screen_drawing_enabled

{-# NOINLINE bindCamera2D_is_v_drag_enabled #-}

-- | If @true@, the camera only moves when reaching the vertical drag margins. If @false@, the camera moves vertically regardless of margins.
bindCamera2D_is_v_drag_enabled :: MethodBind
bindCamera2D_is_v_drag_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "is_v_drag_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera only moves when reaching the vertical drag margins. If @false@, the camera moves vertically regardless of margins.
is_v_drag_enabled ::
                    (Camera2D :< cls, Object :< cls) => cls -> IO Bool
is_v_drag_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_is_v_drag_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "is_v_drag_enabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Camera2D.is_v_drag_enabled

{-# NOINLINE bindCamera2D_make_current #-}

-- | Make this the current 2D camera for the scene (viewport and layer), in case there are many cameras in the scene.
bindCamera2D_make_current :: MethodBind
bindCamera2D_make_current
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Make this the current 2D camera for the scene (viewport and layer), in case there are many cameras in the scene.
make_current :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
make_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_make_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "make_current" '[] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.make_current

{-# NOINLINE bindCamera2D_reset_smoothing #-}

-- | Sets the camera's position immediately to its current smoothing destination.
--   				This has no effect if smoothing is disabled.
bindCamera2D_reset_smoothing :: MethodBind
bindCamera2D_reset_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "reset_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the camera's position immediately to its current smoothing destination.
--   				This has no effect if smoothing is disabled.
reset_smoothing :: (Camera2D :< cls, Object :< cls) => cls -> IO ()
reset_smoothing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_reset_smoothing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "reset_smoothing" '[] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.reset_smoothing

{-# NOINLINE bindCamera2D_set_anchor_mode #-}

-- | The Camera2D's anchor point. See @enum AnchorMode@ constants.
bindCamera2D_set_anchor_mode :: MethodBind
bindCamera2D_set_anchor_mode
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_anchor_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Camera2D's anchor point. See @enum AnchorMode@ constants.
set_anchor_mode ::
                  (Camera2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_anchor_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_anchor_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_anchor_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.set_anchor_mode

{-# NOINLINE bindCamera2D_set_custom_viewport #-}

-- | The custom @Viewport@ node attached to the @Camera2D@. If @null@ or not a @Viewport@, uses the default viewport instead.
bindCamera2D_set_custom_viewport :: MethodBind
bindCamera2D_set_custom_viewport
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_custom_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom @Viewport@ node attached to the @Camera2D@. If @null@ or not a @Viewport@, uses the default viewport instead.
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

instance NodeMethod Camera2D "set_custom_viewport" '[Node] (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_custom_viewport

{-# NOINLINE bindCamera2D_set_drag_margin #-}

-- | Sets the specified margin. See also @drag_margin_bottom@, @drag_margin_top@, @drag_margin_left@, and @drag_margin_right@.
bindCamera2D_set_drag_margin :: MethodBind
bindCamera2D_set_drag_margin
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_drag_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified margin. See also @drag_margin_bottom@, @drag_margin_top@, @drag_margin_left@, and @drag_margin_right@.
set_drag_margin ::
                  (Camera2D :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_drag_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_drag_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_drag_margin" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_drag_margin

{-# NOINLINE bindCamera2D_set_enable_follow_smoothing #-}

-- | If @true@, the camera smoothly moves towards the target at @smoothing_speed@.
bindCamera2D_set_enable_follow_smoothing :: MethodBind
bindCamera2D_set_enable_follow_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_enable_follow_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera smoothly moves towards the target at @smoothing_speed@.
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

instance NodeMethod Camera2D "set_enable_follow_smoothing" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_enable_follow_smoothing

{-# NOINLINE bindCamera2D_set_follow_smoothing #-}

-- | Speed in pixels per second of the camera's smoothing effect when @smoothing_enabled@ is @true@.
bindCamera2D_set_follow_smoothing :: MethodBind
bindCamera2D_set_follow_smoothing
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_follow_smoothing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Speed in pixels per second of the camera's smoothing effect when @smoothing_enabled@ is @true@.
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

instance NodeMethod Camera2D "set_follow_smoothing" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_follow_smoothing

{-# NOINLINE bindCamera2D_set_h_drag_enabled #-}

-- | If @true@, the camera only moves when reaching the horizontal drag margins. If @false@, the camera moves horizontally regardless of margins.
bindCamera2D_set_h_drag_enabled :: MethodBind
bindCamera2D_set_h_drag_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_h_drag_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera only moves when reaching the horizontal drag margins. If @false@, the camera moves horizontally regardless of margins.
set_h_drag_enabled ::
                     (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_h_drag_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_h_drag_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_h_drag_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_h_drag_enabled

{-# NOINLINE bindCamera2D_set_h_offset #-}

-- | The horizontal offset of the camera, relative to the drag margins.
--   			__Note:__ Offset H is used only to force offset relative to margins. It's not updated in any way if drag margins are enabled and can be used to set initial offset.
bindCamera2D_set_h_offset :: MethodBind
bindCamera2D_set_h_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The horizontal offset of the camera, relative to the drag margins.
--   			__Note:__ Offset H is used only to force offset relative to margins. It's not updated in any way if drag margins are enabled and can be used to set initial offset.
set_h_offset ::
               (Camera2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_h_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_h_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_h_offset" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.set_h_offset

{-# NOINLINE bindCamera2D_set_limit #-}

-- | Sets the specified camera limit. See also @limit_bottom@, @limit_top@, @limit_left@, and @limit_right@.
bindCamera2D_set_limit :: MethodBind
bindCamera2D_set_limit
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified camera limit. See also @limit_bottom@, @limit_top@, @limit_left@, and @limit_right@.
set_limit ::
            (Camera2D :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_limit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_limit (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_limit" '[Int, Int] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.set_limit

{-# NOINLINE bindCamera2D_set_limit_drawing_enabled #-}

-- | If @true@, draws the camera's limits rectangle in the editor.
bindCamera2D_set_limit_drawing_enabled :: MethodBind
bindCamera2D_set_limit_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_limit_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, draws the camera's limits rectangle in the editor.
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

instance NodeMethod Camera2D "set_limit_drawing_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_limit_drawing_enabled

{-# NOINLINE bindCamera2D_set_limit_smoothing_enabled #-}

-- | If @true@, the camera smoothly stops when reaches its limits.
bindCamera2D_set_limit_smoothing_enabled :: MethodBind
bindCamera2D_set_limit_smoothing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_limit_smoothing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera smoothly stops when reaches its limits.
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

instance NodeMethod Camera2D "set_limit_smoothing_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_limit_smoothing_enabled

{-# NOINLINE bindCamera2D_set_margin_drawing_enabled #-}

-- | If @true@, draws the camera's drag margin rectangle in the editor.
bindCamera2D_set_margin_drawing_enabled :: MethodBind
bindCamera2D_set_margin_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_margin_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, draws the camera's drag margin rectangle in the editor.
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

instance NodeMethod Camera2D "set_margin_drawing_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_margin_drawing_enabled

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

instance NodeMethod Camera2D "set_offset" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.set_offset

{-# NOINLINE bindCamera2D_set_process_mode #-}

-- | The camera's process callback. See @enum Camera2DProcessMode@.
bindCamera2D_set_process_mode :: MethodBind
bindCamera2D_set_process_mode
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's process callback. See @enum Camera2DProcessMode@.
set_process_mode ::
                   (Camera2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_process_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_process_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_process_mode

{-# NOINLINE bindCamera2D_set_rotating #-}

-- | If @true@, the camera rotates with the target.
bindCamera2D_set_rotating :: MethodBind
bindCamera2D_set_rotating
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_rotating" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera rotates with the target.
set_rotating ::
               (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_rotating cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_rotating (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_rotating" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.set_rotating

{-# NOINLINE bindCamera2D_set_screen_drawing_enabled #-}

-- | If @true@, draws the camera's screen rectangle in the editor.
bindCamera2D_set_screen_drawing_enabled :: MethodBind
bindCamera2D_set_screen_drawing_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_screen_drawing_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, draws the camera's screen rectangle in the editor.
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

instance NodeMethod Camera2D "set_screen_drawing_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_screen_drawing_enabled

{-# NOINLINE bindCamera2D_set_v_drag_enabled #-}

-- | If @true@, the camera only moves when reaching the vertical drag margins. If @false@, the camera moves vertically regardless of margins.
bindCamera2D_set_v_drag_enabled :: MethodBind
bindCamera2D_set_v_drag_enabled
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_v_drag_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the camera only moves when reaching the vertical drag margins. If @false@, the camera moves vertically regardless of margins.
set_v_drag_enabled ::
                     (Camera2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_v_drag_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_v_drag_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_v_drag_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Camera2D.set_v_drag_enabled

{-# NOINLINE bindCamera2D_set_v_offset #-}

-- | The vertical offset of the camera, relative to the drag margins.
--   			__Note:__ Used the same as @offset_h@.
bindCamera2D_set_v_offset :: MethodBind
bindCamera2D_set_v_offset
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The vertical offset of the camera, relative to the drag margins.
--   			__Note:__ Used the same as @offset_h@.
set_v_offset ::
               (Camera2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_v_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_v_offset" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.set_v_offset

{-# NOINLINE bindCamera2D_set_zoom #-}

-- | The camera's zoom relative to the viewport. Values larger than @Vector2(1, 1)@ zoom out and smaller values zoom in. For an example, use @Vector2(0.5, 0.5)@ for a 2× zoom-in, and @Vector2(4, 4)@ for a 4× zoom-out.
bindCamera2D_set_zoom :: MethodBind
bindCamera2D_set_zoom
  = unsafePerformIO $
      withCString "Camera2D" $
        \ clsNamePtr ->
          withCString "set_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's zoom relative to the viewport. Values larger than @Vector2(1, 1)@ zoom out and smaller values zoom in. For an example, use @Vector2(0.5, 0.5)@ for a 2× zoom-in, and @Vector2(4, 4)@ for a 4× zoom-out.
set_zoom ::
           (Camera2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_zoom cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera2D_set_zoom (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera2D "set_zoom" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.Camera2D.set_zoom