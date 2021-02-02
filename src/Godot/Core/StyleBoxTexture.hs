{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.StyleBoxTexture
       (Godot.Core.StyleBoxTexture._AXIS_STRETCH_MODE_TILE_FIT,
        Godot.Core.StyleBoxTexture._AXIS_STRETCH_MODE_TILE,
        Godot.Core.StyleBoxTexture._AXIS_STRETCH_MODE_STRETCH,
        Godot.Core.StyleBoxTexture.sig_texture_changed,
        Godot.Core.StyleBoxTexture.get_expand_margin_size,
        Godot.Core.StyleBoxTexture.get_h_axis_stretch_mode,
        Godot.Core.StyleBoxTexture.get_margin_size,
        Godot.Core.StyleBoxTexture.get_modulate,
        Godot.Core.StyleBoxTexture.get_normal_map,
        Godot.Core.StyleBoxTexture.get_region_rect,
        Godot.Core.StyleBoxTexture.get_texture,
        Godot.Core.StyleBoxTexture.get_v_axis_stretch_mode,
        Godot.Core.StyleBoxTexture.is_draw_center_enabled,
        Godot.Core.StyleBoxTexture.set_draw_center,
        Godot.Core.StyleBoxTexture.set_expand_margin_all,
        Godot.Core.StyleBoxTexture.set_expand_margin_individual,
        Godot.Core.StyleBoxTexture.set_expand_margin_size,
        Godot.Core.StyleBoxTexture.set_h_axis_stretch_mode,
        Godot.Core.StyleBoxTexture.set_margin_size,
        Godot.Core.StyleBoxTexture.set_modulate,
        Godot.Core.StyleBoxTexture.set_normal_map,
        Godot.Core.StyleBoxTexture.set_region_rect,
        Godot.Core.StyleBoxTexture.set_texture,
        Godot.Core.StyleBoxTexture.set_v_axis_stretch_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_AXIS_STRETCH_MODE_TILE_FIT :: Int
_AXIS_STRETCH_MODE_TILE_FIT = 2

_AXIS_STRETCH_MODE_TILE :: Int
_AXIS_STRETCH_MODE_TILE = 1

_AXIS_STRETCH_MODE_STRETCH :: Int
_AXIS_STRETCH_MODE_STRETCH = 0

sig_texture_changed ::
                    Godot.Internal.Dispatch.Signal StyleBoxTexture
sig_texture_changed
  = Godot.Internal.Dispatch.Signal "texture_changed"

{-# NOINLINE bindStyleBoxTexture_get_expand_margin_size #-}

-- | Expands the bottom margin of this style box when drawing, causing it be drawn larger than requested.
bindStyleBoxTexture_get_expand_margin_size :: MethodBind
bindStyleBoxTexture_get_expand_margin_size
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "get_expand_margin_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Expands the bottom margin of this style box when drawing, causing it be drawn larger than requested.
get_expand_margin_size ::
                         (StyleBoxTexture :< cls, Object :< cls) => cls -> Int -> IO Float
get_expand_margin_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_get_expand_margin_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_get_h_axis_stretch_mode #-}

bindStyleBoxTexture_get_h_axis_stretch_mode :: MethodBind
bindStyleBoxTexture_get_h_axis_stretch_mode
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "get_h_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_h_axis_stretch_mode ::
                          (StyleBoxTexture :< cls, Object :< cls) => cls -> IO Int
get_h_axis_stretch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_get_h_axis_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_get_margin_size #-}

-- | Increases the bottom margin of the 3x3 texture box.
--   			A higher value means more of the source texture is considered to be part of the bottom border of the 3x3 box.
--   			This is also the value used as fallback for [member StyleBox.content_margin_bottom] if it is negative.
bindStyleBoxTexture_get_margin_size :: MethodBind
bindStyleBoxTexture_get_margin_size
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "get_margin_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increases the bottom margin of the 3x3 texture box.
--   			A higher value means more of the source texture is considered to be part of the bottom border of the 3x3 box.
--   			This is also the value used as fallback for [member StyleBox.content_margin_bottom] if it is negative.
get_margin_size ::
                  (StyleBoxTexture :< cls, Object :< cls) => cls -> Int -> IO Float
get_margin_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_get_margin_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_get_modulate #-}

-- | Modulates the color of the texture when this style box is drawn.
bindStyleBoxTexture_get_modulate :: MethodBind
bindStyleBoxTexture_get_modulate
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "get_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Modulates the color of the texture when this style box is drawn.
get_modulate ::
               (StyleBoxTexture :< cls, Object :< cls) => cls -> IO Color
get_modulate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_get_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_get_normal_map #-}

-- | The normal map to use when drawing this style box.
bindStyleBoxTexture_get_normal_map :: MethodBind
bindStyleBoxTexture_get_normal_map
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map to use when drawing this style box.
get_normal_map ::
                 (StyleBoxTexture :< cls, Object :< cls) => cls -> IO Texture
get_normal_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_get_normal_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_get_region_rect #-}

-- | Species a sub region of the texture to use.
--   			This is equivalent to first wrapping the texture in an [AtlasTexture] with the same region.
bindStyleBoxTexture_get_region_rect :: MethodBind
bindStyleBoxTexture_get_region_rect
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "get_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Species a sub region of the texture to use.
--   			This is equivalent to first wrapping the texture in an [AtlasTexture] with the same region.
get_region_rect ::
                  (StyleBoxTexture :< cls, Object :< cls) => cls -> IO Rect2
get_region_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_get_region_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_get_texture #-}

-- | The texture to use when drawing this style box.
bindStyleBoxTexture_get_texture :: MethodBind
bindStyleBoxTexture_get_texture
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture to use when drawing this style box.
get_texture ::
              (StyleBoxTexture :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_get_v_axis_stretch_mode #-}

bindStyleBoxTexture_get_v_axis_stretch_mode :: MethodBind
bindStyleBoxTexture_get_v_axis_stretch_mode
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "get_v_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_v_axis_stretch_mode ::
                          (StyleBoxTexture :< cls, Object :< cls) => cls -> IO Int
get_v_axis_stretch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_get_v_axis_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_is_draw_center_enabled #-}

bindStyleBoxTexture_is_draw_center_enabled :: MethodBind
bindStyleBoxTexture_is_draw_center_enabled
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "is_draw_center_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_draw_center_enabled ::
                         (StyleBoxTexture :< cls, Object :< cls) => cls -> IO Bool
is_draw_center_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_is_draw_center_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_draw_center #-}

bindStyleBoxTexture_set_draw_center :: MethodBind
bindStyleBoxTexture_set_draw_center
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_draw_center" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_draw_center ::
                  (StyleBoxTexture :< cls, Object :< cls) => cls -> Bool -> IO ()
set_draw_center cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_draw_center
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_expand_margin_all #-}

bindStyleBoxTexture_set_expand_margin_all :: MethodBind
bindStyleBoxTexture_set_expand_margin_all
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_expand_margin_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_expand_margin_all ::
                        (StyleBoxTexture :< cls, Object :< cls) => cls -> Float -> IO ()
set_expand_margin_all cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_expand_margin_all
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_expand_margin_individual #-}

bindStyleBoxTexture_set_expand_margin_individual :: MethodBind
bindStyleBoxTexture_set_expand_margin_individual
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_expand_margin_individual" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_expand_margin_individual ::
                               (StyleBoxTexture :< cls, Object :< cls) =>
                               cls -> Float -> Float -> Float -> Float -> IO ()
set_expand_margin_individual cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStyleBoxTexture_set_expand_margin_individual
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_expand_margin_size #-}

-- | Expands the bottom margin of this style box when drawing, causing it be drawn larger than requested.
bindStyleBoxTexture_set_expand_margin_size :: MethodBind
bindStyleBoxTexture_set_expand_margin_size
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_expand_margin_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Expands the bottom margin of this style box when drawing, causing it be drawn larger than requested.
set_expand_margin_size ::
                         (StyleBoxTexture :< cls, Object :< cls) =>
                         cls -> Int -> Float -> IO ()
set_expand_margin_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_expand_margin_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_h_axis_stretch_mode #-}

bindStyleBoxTexture_set_h_axis_stretch_mode :: MethodBind
bindStyleBoxTexture_set_h_axis_stretch_mode
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_h_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_h_axis_stretch_mode ::
                          (StyleBoxTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_h_axis_stretch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_h_axis_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_margin_size #-}

-- | Increases the bottom margin of the 3x3 texture box.
--   			A higher value means more of the source texture is considered to be part of the bottom border of the 3x3 box.
--   			This is also the value used as fallback for [member StyleBox.content_margin_bottom] if it is negative.
bindStyleBoxTexture_set_margin_size :: MethodBind
bindStyleBoxTexture_set_margin_size
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_margin_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increases the bottom margin of the 3x3 texture box.
--   			A higher value means more of the source texture is considered to be part of the bottom border of the 3x3 box.
--   			This is also the value used as fallback for [member StyleBox.content_margin_bottom] if it is negative.
set_margin_size ::
                  (StyleBoxTexture :< cls, Object :< cls) =>
                  cls -> Int -> Float -> IO ()
set_margin_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_margin_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_modulate #-}

-- | Modulates the color of the texture when this style box is drawn.
bindStyleBoxTexture_set_modulate :: MethodBind
bindStyleBoxTexture_set_modulate
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Modulates the color of the texture when this style box is drawn.
set_modulate ::
               (StyleBoxTexture :< cls, Object :< cls) => cls -> Color -> IO ()
set_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_normal_map #-}

-- | The normal map to use when drawing this style box.
bindStyleBoxTexture_set_normal_map :: MethodBind
bindStyleBoxTexture_set_normal_map
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map to use when drawing this style box.
set_normal_map ::
                 (StyleBoxTexture :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_normal_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_region_rect #-}

-- | Species a sub region of the texture to use.
--   			This is equivalent to first wrapping the texture in an [AtlasTexture] with the same region.
bindStyleBoxTexture_set_region_rect :: MethodBind
bindStyleBoxTexture_set_region_rect
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Species a sub region of the texture to use.
--   			This is equivalent to first wrapping the texture in an [AtlasTexture] with the same region.
set_region_rect ::
                  (StyleBoxTexture :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_region_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_region_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_texture #-}

-- | The texture to use when drawing this style box.
bindStyleBoxTexture_set_texture :: MethodBind
bindStyleBoxTexture_set_texture
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture to use when drawing this style box.
set_texture ::
              (StyleBoxTexture :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxTexture_set_v_axis_stretch_mode #-}

bindStyleBoxTexture_set_v_axis_stretch_mode :: MethodBind
bindStyleBoxTexture_set_v_axis_stretch_mode
  = unsafePerformIO $
      withCString "StyleBoxTexture" $
        \ clsNamePtr ->
          withCString "set_v_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_v_axis_stretch_mode ::
                          (StyleBoxTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_v_axis_stretch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxTexture_set_v_axis_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)