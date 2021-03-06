{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ParallaxBackground
       (Godot.Core.ParallaxBackground._camera_moved,
        Godot.Core.ParallaxBackground.get_limit_begin,
        Godot.Core.ParallaxBackground.get_limit_end,
        Godot.Core.ParallaxBackground.get_scroll_base_offset,
        Godot.Core.ParallaxBackground.get_scroll_base_scale,
        Godot.Core.ParallaxBackground.get_scroll_offset,
        Godot.Core.ParallaxBackground.is_ignore_camera_zoom,
        Godot.Core.ParallaxBackground.set_ignore_camera_zoom,
        Godot.Core.ParallaxBackground.set_limit_begin,
        Godot.Core.ParallaxBackground.set_limit_end,
        Godot.Core.ParallaxBackground.set_scroll_base_offset,
        Godot.Core.ParallaxBackground.set_scroll_base_scale,
        Godot.Core.ParallaxBackground.set_scroll_offset)
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
import Godot.Core.CanvasLayer()

instance NodeProperty ParallaxBackground "scroll_base_offset"
           Vector2
           'False
         where
        nodeProperty
          = (get_scroll_base_offset,
             wrapDroppingSetter set_scroll_base_offset, Nothing)

instance NodeProperty ParallaxBackground "scroll_base_scale"
           Vector2
           'False
         where
        nodeProperty
          = (get_scroll_base_scale, wrapDroppingSetter set_scroll_base_scale,
             Nothing)

instance NodeProperty ParallaxBackground
           "scroll_ignore_camera_zoom"
           Bool
           'False
         where
        nodeProperty
          = (is_ignore_camera_zoom,
             wrapDroppingSetter set_ignore_camera_zoom, Nothing)

instance NodeProperty ParallaxBackground "scroll_limit_begin"
           Vector2
           'False
         where
        nodeProperty
          = (get_limit_begin, wrapDroppingSetter set_limit_begin, Nothing)

instance NodeProperty ParallaxBackground "scroll_limit_end" Vector2
           'False
         where
        nodeProperty
          = (get_limit_end, wrapDroppingSetter set_limit_end, Nothing)

instance NodeProperty ParallaxBackground "scroll_offset" Vector2
           'False
         where
        nodeProperty
          = (get_scroll_offset, wrapDroppingSetter set_scroll_offset,
             Nothing)

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

instance NodeMethod ParallaxBackground "_camera_moved"
           '[Transform2d, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxBackground._camera_moved

{-# NOINLINE bindParallaxBackground_get_limit_begin #-}

-- | Top-left limits for scrolling to begin. If the camera is outside of this limit, the background will stop scrolling. Must be lower than @scroll_limit_end@ to work.
bindParallaxBackground_get_limit_begin :: MethodBind
bindParallaxBackground_get_limit_begin
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_limit_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Top-left limits for scrolling to begin. If the camera is outside of this limit, the background will stop scrolling. Must be lower than @scroll_limit_end@ to work.
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

instance NodeMethod ParallaxBackground "get_limit_begin" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ParallaxBackground.get_limit_begin

{-# NOINLINE bindParallaxBackground_get_limit_end #-}

-- | Bottom-right limits for scrolling to end. If the camera is outside of this limit, the background will stop scrolling. Must be higher than @scroll_limit_begin@ to work.
bindParallaxBackground_get_limit_end :: MethodBind
bindParallaxBackground_get_limit_end
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_limit_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom-right limits for scrolling to end. If the camera is outside of this limit, the background will stop scrolling. Must be higher than @scroll_limit_begin@ to work.
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

instance NodeMethod ParallaxBackground "get_limit_end" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ParallaxBackground.get_limit_end

{-# NOINLINE bindParallaxBackground_get_scroll_base_offset #-}

-- | The base position offset for all @ParallaxLayer@ children.
bindParallaxBackground_get_scroll_base_offset :: MethodBind
bindParallaxBackground_get_scroll_base_offset
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_scroll_base_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The base position offset for all @ParallaxLayer@ children.
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

instance NodeMethod ParallaxBackground "get_scroll_base_offset" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ParallaxBackground.get_scroll_base_offset

{-# NOINLINE bindParallaxBackground_get_scroll_base_scale #-}

-- | The base motion scale for all @ParallaxLayer@ children.
bindParallaxBackground_get_scroll_base_scale :: MethodBind
bindParallaxBackground_get_scroll_base_scale
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_scroll_base_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The base motion scale for all @ParallaxLayer@ children.
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

instance NodeMethod ParallaxBackground "get_scroll_base_scale" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ParallaxBackground.get_scroll_base_scale

{-# NOINLINE bindParallaxBackground_get_scroll_offset #-}

-- | The ParallaxBackground's scroll value. Calculated automatically when using a @Camera2D@, but can be used to manually manage scrolling when no camera is present.
bindParallaxBackground_get_scroll_offset :: MethodBind
bindParallaxBackground_get_scroll_offset
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "get_scroll_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ParallaxBackground's scroll value. Calculated automatically when using a @Camera2D@, but can be used to manually manage scrolling when no camera is present.
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

instance NodeMethod ParallaxBackground "get_scroll_offset" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ParallaxBackground.get_scroll_offset

{-# NOINLINE bindParallaxBackground_is_ignore_camera_zoom #-}

-- | If @true@, elements in @ParallaxLayer@ child aren't affected by the zoom level of the camera.
bindParallaxBackground_is_ignore_camera_zoom :: MethodBind
bindParallaxBackground_is_ignore_camera_zoom
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "is_ignore_camera_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, elements in @ParallaxLayer@ child aren't affected by the zoom level of the camera.
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

instance NodeMethod ParallaxBackground "is_ignore_camera_zoom" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ParallaxBackground.is_ignore_camera_zoom

{-# NOINLINE bindParallaxBackground_set_ignore_camera_zoom #-}

-- | If @true@, elements in @ParallaxLayer@ child aren't affected by the zoom level of the camera.
bindParallaxBackground_set_ignore_camera_zoom :: MethodBind
bindParallaxBackground_set_ignore_camera_zoom
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_ignore_camera_zoom" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, elements in @ParallaxLayer@ child aren't affected by the zoom level of the camera.
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

instance NodeMethod ParallaxBackground "set_ignore_camera_zoom"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxBackground.set_ignore_camera_zoom

{-# NOINLINE bindParallaxBackground_set_limit_begin #-}

-- | Top-left limits for scrolling to begin. If the camera is outside of this limit, the background will stop scrolling. Must be lower than @scroll_limit_end@ to work.
bindParallaxBackground_set_limit_begin :: MethodBind
bindParallaxBackground_set_limit_begin
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_limit_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Top-left limits for scrolling to begin. If the camera is outside of this limit, the background will stop scrolling. Must be lower than @scroll_limit_end@ to work.
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

instance NodeMethod ParallaxBackground "set_limit_begin" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxBackground.set_limit_begin

{-# NOINLINE bindParallaxBackground_set_limit_end #-}

-- | Bottom-right limits for scrolling to end. If the camera is outside of this limit, the background will stop scrolling. Must be higher than @scroll_limit_begin@ to work.
bindParallaxBackground_set_limit_end :: MethodBind
bindParallaxBackground_set_limit_end
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_limit_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Bottom-right limits for scrolling to end. If the camera is outside of this limit, the background will stop scrolling. Must be higher than @scroll_limit_begin@ to work.
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

instance NodeMethod ParallaxBackground "set_limit_end" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxBackground.set_limit_end

{-# NOINLINE bindParallaxBackground_set_scroll_base_offset #-}

-- | The base position offset for all @ParallaxLayer@ children.
bindParallaxBackground_set_scroll_base_offset :: MethodBind
bindParallaxBackground_set_scroll_base_offset
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_scroll_base_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The base position offset for all @ParallaxLayer@ children.
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

instance NodeMethod ParallaxBackground "set_scroll_base_offset"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxBackground.set_scroll_base_offset

{-# NOINLINE bindParallaxBackground_set_scroll_base_scale #-}

-- | The base motion scale for all @ParallaxLayer@ children.
bindParallaxBackground_set_scroll_base_scale :: MethodBind
bindParallaxBackground_set_scroll_base_scale
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_scroll_base_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The base motion scale for all @ParallaxLayer@ children.
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

instance NodeMethod ParallaxBackground "set_scroll_base_scale"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxBackground.set_scroll_base_scale

{-# NOINLINE bindParallaxBackground_set_scroll_offset #-}

-- | The ParallaxBackground's scroll value. Calculated automatically when using a @Camera2D@, but can be used to manually manage scrolling when no camera is present.
bindParallaxBackground_set_scroll_offset :: MethodBind
bindParallaxBackground_set_scroll_offset
  = unsafePerformIO $
      withCString "ParallaxBackground" $
        \ clsNamePtr ->
          withCString "set_scroll_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ParallaxBackground's scroll value. Calculated automatically when using a @Camera2D@, but can be used to manually manage scrolling when no camera is present.
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

instance NodeMethod ParallaxBackground "set_scroll_offset"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxBackground.set_scroll_offset