{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ParallaxBackground
       (Godot.Core.ParallaxBackground._camera_moved,
        Godot.Core.ParallaxBackground.set_scroll_offset,
        Godot.Core.ParallaxBackground.get_scroll_offset,
        Godot.Core.ParallaxBackground.set_scroll_base_offset,
        Godot.Core.ParallaxBackground.get_scroll_base_offset,
        Godot.Core.ParallaxBackground.set_scroll_base_scale,
        Godot.Core.ParallaxBackground.get_scroll_base_scale,
        Godot.Core.ParallaxBackground.set_limit_begin,
        Godot.Core.ParallaxBackground.get_limit_begin,
        Godot.Core.ParallaxBackground.set_limit_end,
        Godot.Core.ParallaxBackground.get_limit_end,
        Godot.Core.ParallaxBackground.set_ignore_camera_zoom,
        Godot.Core.ParallaxBackground.is_ignore_camera_zoom)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindParallaxBackground__camera_moved #-}

bindParallaxBackground__camera_moved :: MethodBind
bindParallaxBackground__camera_moved
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "_camera_moved" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_camera_moved ::
                (ParallaxBackground :< cls, Object :< cls) =>
                cls -> Transform2d -> Vector2 -> IO ()
_camera_moved cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground__camera_moved
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_set_scroll_offset #-}

-- | The ParallaxBackground's scroll value. Calculated automatically when using a [Camera2D], but can be used to manually manage scrolling when no camera is present.
bindParallaxBackground_set_scroll_offset :: MethodBind
bindParallaxBackground_set_scroll_offset
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_scroll_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ParallaxBackground's scroll value. Calculated automatically when using a [Camera2D], but can be used to manually manage scrolling when no camera is present.
set_scroll_offset ::
                    (ParallaxBackground :< cls, Object :< cls) =>
                    cls -> Vector2 -> IO ()
set_scroll_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_set_scroll_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_get_scroll_offset #-}

-- | The ParallaxBackground's scroll value. Calculated automatically when using a [Camera2D], but can be used to manually manage scrolling when no camera is present.
bindParallaxBackground_get_scroll_offset :: MethodBind
bindParallaxBackground_get_scroll_offset
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_scroll_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ParallaxBackground's scroll value. Calculated automatically when using a [Camera2D], but can be used to manually manage scrolling when no camera is present.
get_scroll_offset ::
                    (ParallaxBackground :< cls, Object :< cls) => cls -> IO Vector2
get_scroll_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_get_scroll_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_set_scroll_base_offset #-}

-- | Base position offset of all [ParallaxLayer] children.
bindParallaxBackground_set_scroll_base_offset :: MethodBind
bindParallaxBackground_set_scroll_base_offset
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_scroll_base_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Base position offset of all [ParallaxLayer] children.
set_scroll_base_offset ::
                         (ParallaxBackground :< cls, Object :< cls) =>
                         cls -> Vector2 -> IO ()
set_scroll_base_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParallaxBackground_set_scroll_base_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_get_scroll_base_offset #-}

-- | Base position offset of all [ParallaxLayer] children.
bindParallaxBackground_get_scroll_base_offset :: MethodBind
bindParallaxBackground_get_scroll_base_offset
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_scroll_base_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Base position offset of all [ParallaxLayer] children.
get_scroll_base_offset ::
                         (ParallaxBackground :< cls, Object :< cls) => cls -> IO Vector2
get_scroll_base_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParallaxBackground_get_scroll_base_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_set_scroll_base_scale #-}

-- | Base motion scale of all [ParallaxLayer] children.
bindParallaxBackground_set_scroll_base_scale :: MethodBind
bindParallaxBackground_set_scroll_base_scale
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_scroll_base_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Base motion scale of all [ParallaxLayer] children.
set_scroll_base_scale ::
                        (ParallaxBackground :< cls, Object :< cls) =>
                        cls -> Vector2 -> IO ()
set_scroll_base_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_set_scroll_base_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_get_scroll_base_scale #-}

-- | Base motion scale of all [ParallaxLayer] children.
bindParallaxBackground_get_scroll_base_scale :: MethodBind
bindParallaxBackground_get_scroll_base_scale
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_scroll_base_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Base motion scale of all [ParallaxLayer] children.
get_scroll_base_scale ::
                        (ParallaxBackground :< cls, Object :< cls) => cls -> IO Vector2
get_scroll_base_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_get_scroll_base_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_set_limit_begin #-}

-- | Top left limits for scrolling to begin. If the camera is outside of this limit the background will stop scrolling. Must be lower than [member scroll_limit_end] to work.
bindParallaxBackground_set_limit_begin :: MethodBind
bindParallaxBackground_set_limit_begin
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_limit_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Top left limits for scrolling to begin. If the camera is outside of this limit the background will stop scrolling. Must be lower than [member scroll_limit_end] to work.
set_limit_begin ::
                  (ParallaxBackground :< cls, Object :< cls) =>
                  cls -> Vector2 -> IO ()
set_limit_begin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_set_limit_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_get_limit_begin #-}

-- | Top left limits for scrolling to begin. If the camera is outside of this limit the background will stop scrolling. Must be lower than [member scroll_limit_end] to work.
bindParallaxBackground_get_limit_begin :: MethodBind
bindParallaxBackground_get_limit_begin
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_limit_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Top left limits for scrolling to begin. If the camera is outside of this limit the background will stop scrolling. Must be lower than [member scroll_limit_end] to work.
get_limit_begin ::
                  (ParallaxBackground :< cls, Object :< cls) => cls -> IO Vector2
get_limit_begin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_get_limit_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_set_limit_end #-}

-- | Right bottom limits for scrolling to end. If the camera is outside of this limit the background will stop scrolling. Must be higher than [member scroll_limit_begin] to work.
bindParallaxBackground_set_limit_end :: MethodBind
bindParallaxBackground_set_limit_end
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_limit_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Right bottom limits for scrolling to end. If the camera is outside of this limit the background will stop scrolling. Must be higher than [member scroll_limit_begin] to work.
set_limit_end ::
                (ParallaxBackground :< cls, Object :< cls) =>
                cls -> Vector2 -> IO ()
set_limit_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_set_limit_end
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_get_limit_end #-}

-- | Right bottom limits for scrolling to end. If the camera is outside of this limit the background will stop scrolling. Must be higher than [member scroll_limit_begin] to work.
bindParallaxBackground_get_limit_end :: MethodBind
bindParallaxBackground_get_limit_end
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_limit_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Right bottom limits for scrolling to end. If the camera is outside of this limit the background will stop scrolling. Must be higher than [member scroll_limit_begin] to work.
get_limit_end ::
                (ParallaxBackground :< cls, Object :< cls) => cls -> IO Vector2
get_limit_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_get_limit_end
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_set_ignore_camera_zoom #-}

-- | If [code]true[/code], elements in [ParallaxLayer] child aren't affected by the zoom level of the camera.
bindParallaxBackground_set_ignore_camera_zoom :: MethodBind
bindParallaxBackground_set_ignore_camera_zoom
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_ignore_camera_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], elements in [ParallaxLayer] child aren't affected by the zoom level of the camera.
set_ignore_camera_zoom ::
                         (ParallaxBackground :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ignore_camera_zoom cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindParallaxBackground_set_ignore_camera_zoom
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindParallaxBackground_is_ignore_camera_zoom #-}

-- | If [code]true[/code], elements in [ParallaxLayer] child aren't affected by the zoom level of the camera.
bindParallaxBackground_is_ignore_camera_zoom :: MethodBind
bindParallaxBackground_is_ignore_camera_zoom
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "is_ignore_camera_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], elements in [ParallaxLayer] child aren't affected by the zoom level of the camera.
is_ignore_camera_zoom ::
                        (ParallaxBackground :< cls, Object :< cls) => cls -> IO Bool
is_ignore_camera_zoom cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxBackground_is_ignore_camera_zoom
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)