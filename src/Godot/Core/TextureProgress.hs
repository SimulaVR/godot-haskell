{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TextureProgress
       (Godot.Core.TextureProgress._FILL_BOTTOM_TO_TOP,
        Godot.Core.TextureProgress._FILL_TOP_TO_BOTTOM,
        Godot.Core.TextureProgress._FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_RIGHT_TO_LEFT,
        Godot.Core.TextureProgress._FILL_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_LEFT_TO_RIGHT,
        Godot.Core.TextureProgress._FILL_BILINEAR_LEFT_AND_RIGHT,
        Godot.Core.TextureProgress._FILL_COUNTER_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_BILINEAR_TOP_AND_BOTTOM,
        Godot.Core.TextureProgress.set_under_texture,
        Godot.Core.TextureProgress.get_under_texture,
        Godot.Core.TextureProgress.set_progress_texture,
        Godot.Core.TextureProgress.get_progress_texture,
        Godot.Core.TextureProgress.set_over_texture,
        Godot.Core.TextureProgress.get_over_texture,
        Godot.Core.TextureProgress.set_fill_mode,
        Godot.Core.TextureProgress.get_fill_mode,
        Godot.Core.TextureProgress.set_tint_under,
        Godot.Core.TextureProgress.get_tint_under,
        Godot.Core.TextureProgress.set_tint_progress,
        Godot.Core.TextureProgress.get_tint_progress,
        Godot.Core.TextureProgress.set_tint_over,
        Godot.Core.TextureProgress.get_tint_over,
        Godot.Core.TextureProgress.set_radial_initial_angle,
        Godot.Core.TextureProgress.get_radial_initial_angle,
        Godot.Core.TextureProgress.set_radial_center_offset,
        Godot.Core.TextureProgress.get_radial_center_offset,
        Godot.Core.TextureProgress.set_fill_degrees,
        Godot.Core.TextureProgress.get_fill_degrees,
        Godot.Core.TextureProgress.set_stretch_margin,
        Godot.Core.TextureProgress.get_stretch_margin,
        Godot.Core.TextureProgress.set_nine_patch_stretch,
        Godot.Core.TextureProgress.get_nine_patch_stretch)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FILL_BOTTOM_TO_TOP :: Int
_FILL_BOTTOM_TO_TOP = 3

_FILL_TOP_TO_BOTTOM :: Int
_FILL_TOP_TO_BOTTOM = 2

_FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE :: Int
_FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE = 8

_FILL_RIGHT_TO_LEFT :: Int
_FILL_RIGHT_TO_LEFT = 1

_FILL_CLOCKWISE :: Int
_FILL_CLOCKWISE = 4

_FILL_LEFT_TO_RIGHT :: Int
_FILL_LEFT_TO_RIGHT = 0

_FILL_BILINEAR_LEFT_AND_RIGHT :: Int
_FILL_BILINEAR_LEFT_AND_RIGHT = 6

_FILL_COUNTER_CLOCKWISE :: Int
_FILL_COUNTER_CLOCKWISE = 5

_FILL_BILINEAR_TOP_AND_BOTTOM :: Int
_FILL_BILINEAR_TOP_AND_BOTTOM = 7

{-# NOINLINE bindTextureProgress_set_under_texture #-}

-- | [Texture] that draws under the progress bar. The bar's background.
bindTextureProgress_set_under_texture :: MethodBind
bindTextureProgress_set_under_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_under_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] that draws under the progress bar. The bar's background.
set_under_texture ::
                    (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_under_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_under_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_under_texture #-}

-- | [Texture] that draws under the progress bar. The bar's background.
bindTextureProgress_get_under_texture :: MethodBind
bindTextureProgress_get_under_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_under_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] that draws under the progress bar. The bar's background.
get_under_texture ::
                    (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_under_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_under_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_progress_texture #-}

-- | [Texture] that clips based on the node's [code]value[/code] and [member fill_mode]. As [code]value[/code] increased, the texture fills up. It shows entirely when [code]value[/code] reaches [code]max_value[/code]. It doesn't show at all if [code]value[/code] is equal to [code]min_value[/code].
--   			The [code]value[/code] property comes from [Range]. See [member Range.value], [member Range.min_value], [member Range.max_value].
bindTextureProgress_set_progress_texture :: MethodBind
bindTextureProgress_set_progress_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_progress_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] that clips based on the node's [code]value[/code] and [member fill_mode]. As [code]value[/code] increased, the texture fills up. It shows entirely when [code]value[/code] reaches [code]max_value[/code]. It doesn't show at all if [code]value[/code] is equal to [code]min_value[/code].
--   			The [code]value[/code] property comes from [Range]. See [member Range.value], [member Range.min_value], [member Range.max_value].
set_progress_texture ::
                       (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_progress_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_progress_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_progress_texture #-}

-- | [Texture] that clips based on the node's [code]value[/code] and [member fill_mode]. As [code]value[/code] increased, the texture fills up. It shows entirely when [code]value[/code] reaches [code]max_value[/code]. It doesn't show at all if [code]value[/code] is equal to [code]min_value[/code].
--   			The [code]value[/code] property comes from [Range]. See [member Range.value], [member Range.min_value], [member Range.max_value].
bindTextureProgress_get_progress_texture :: MethodBind
bindTextureProgress_get_progress_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_progress_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] that clips based on the node's [code]value[/code] and [member fill_mode]. As [code]value[/code] increased, the texture fills up. It shows entirely when [code]value[/code] reaches [code]max_value[/code]. It doesn't show at all if [code]value[/code] is equal to [code]min_value[/code].
--   			The [code]value[/code] property comes from [Range]. See [member Range.value], [member Range.min_value], [member Range.max_value].
get_progress_texture ::
                       (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_progress_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_progress_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_over_texture #-}

-- | [Texture] that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of [member texture_progress].
bindTextureProgress_set_over_texture :: MethodBind
bindTextureProgress_set_over_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_over_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of [member texture_progress].
set_over_texture ::
                   (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_over_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_over_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_over_texture #-}

-- | [Texture] that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of [member texture_progress].
bindTextureProgress_get_over_texture :: MethodBind
bindTextureProgress_get_over_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_over_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | [Texture] that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of [member texture_progress].
get_over_texture ::
                   (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_over_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_over_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_fill_mode #-}

-- | The fill direction. Uses FILL_* constants.
bindTextureProgress_set_fill_mode :: MethodBind
bindTextureProgress_set_fill_mode
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_fill_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fill direction. Uses FILL_* constants.
set_fill_mode ::
                (TextureProgress :< cls, Object :< cls) => cls -> Int -> IO ()
set_fill_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_fill_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_fill_mode #-}

-- | The fill direction. Uses FILL_* constants.
bindTextureProgress_get_fill_mode :: MethodBind
bindTextureProgress_get_fill_mode
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_fill_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fill direction. Uses FILL_* constants.
get_fill_mode ::
                (TextureProgress :< cls, Object :< cls) => cls -> IO Int
get_fill_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_fill_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_tint_under #-}

-- | Multiplies the color of the bar's [code]texture_under[/code] texture.
bindTextureProgress_set_tint_under :: MethodBind
bindTextureProgress_set_tint_under
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_under" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's [code]texture_under[/code] texture.
set_tint_under ::
                 (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_under cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_under
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_tint_under #-}

-- | Multiplies the color of the bar's [code]texture_under[/code] texture.
bindTextureProgress_get_tint_under :: MethodBind
bindTextureProgress_get_tint_under
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_under" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's [code]texture_under[/code] texture.
get_tint_under ::
                 (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_under cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_under
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_tint_progress #-}

-- | Multiplies the color of the bar's [code]texture_progress[/code] texture.
bindTextureProgress_set_tint_progress :: MethodBind
bindTextureProgress_set_tint_progress
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_progress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's [code]texture_progress[/code] texture.
set_tint_progress ::
                    (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_progress cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_progress
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_tint_progress #-}

-- | Multiplies the color of the bar's [code]texture_progress[/code] texture.
bindTextureProgress_get_tint_progress :: MethodBind
bindTextureProgress_get_tint_progress
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_progress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's [code]texture_progress[/code] texture.
get_tint_progress ::
                    (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_progress cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_progress
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_tint_over #-}

-- | Multiplies the color of the bar's [code]texture_over[/code] texture. The effect is similar to [member CanvasItem.modulate], except it only affects this specific texture instead of the entire node.
bindTextureProgress_set_tint_over :: MethodBind
bindTextureProgress_set_tint_over
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_over" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's [code]texture_over[/code] texture. The effect is similar to [member CanvasItem.modulate], except it only affects this specific texture instead of the entire node.
set_tint_over ::
                (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_over cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_over
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_tint_over #-}

-- | Multiplies the color of the bar's [code]texture_over[/code] texture. The effect is similar to [member CanvasItem.modulate], except it only affects this specific texture instead of the entire node.
bindTextureProgress_get_tint_over :: MethodBind
bindTextureProgress_get_tint_over
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_over" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's [code]texture_over[/code] texture. The effect is similar to [member CanvasItem.modulate], except it only affects this specific texture instead of the entire node.
get_tint_over ::
                (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_over cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_over
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_radial_initial_angle #-}

-- | Starting angle for the fill of [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code]. When the node's [code]value[/code] is equal to its [code]min_value[/code], the texture doesn't show up at all. When the [code]value[/code] increases, the texture fills and tends towards [member radial_fill_degrees].
bindTextureProgress_set_radial_initial_angle :: MethodBind
bindTextureProgress_set_radial_initial_angle
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_radial_initial_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starting angle for the fill of [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code]. When the node's [code]value[/code] is equal to its [code]min_value[/code], the texture doesn't show up at all. When the [code]value[/code] increases, the texture fills and tends towards [member radial_fill_degrees].
set_radial_initial_angle ::
                           (TextureProgress :< cls, Object :< cls) => cls -> Float -> IO ()
set_radial_initial_angle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_radial_initial_angle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_radial_initial_angle #-}

-- | Starting angle for the fill of [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code]. When the node's [code]value[/code] is equal to its [code]min_value[/code], the texture doesn't show up at all. When the [code]value[/code] increases, the texture fills and tends towards [member radial_fill_degrees].
bindTextureProgress_get_radial_initial_angle :: MethodBind
bindTextureProgress_get_radial_initial_angle
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_radial_initial_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starting angle for the fill of [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code]. When the node's [code]value[/code] is equal to its [code]min_value[/code], the texture doesn't show up at all. When the [code]value[/code] increases, the texture fills and tends towards [member radial_fill_degrees].
get_radial_initial_angle ::
                           (TextureProgress :< cls, Object :< cls) => cls -> IO Float
get_radial_initial_angle cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_radial_initial_angle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_radial_center_offset #-}

-- | Offsets [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code].
bindTextureProgress_set_radial_center_offset :: MethodBind
bindTextureProgress_set_radial_center_offset
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_radial_center_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Offsets [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code].
set_radial_center_offset ::
                           (TextureProgress :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_radial_center_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_radial_center_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_radial_center_offset #-}

-- | Offsets [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code].
bindTextureProgress_get_radial_center_offset :: MethodBind
bindTextureProgress_get_radial_center_offset
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_radial_center_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Offsets [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code].
get_radial_center_offset ::
                           (TextureProgress :< cls, Object :< cls) => cls -> IO Vector2
get_radial_center_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_radial_center_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_fill_degrees #-}

-- | Upper limit for the fill of [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code]. When the node's [code]value[/code] is equal to its [code]max_value[/code], the texture fills up to this angle.
--   			See [member Range.value], [member Range.max_value].
bindTextureProgress_set_fill_degrees :: MethodBind
bindTextureProgress_set_fill_degrees
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_fill_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Upper limit for the fill of [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code]. When the node's [code]value[/code] is equal to its [code]max_value[/code], the texture fills up to this angle.
--   			See [member Range.value], [member Range.max_value].
set_fill_degrees ::
                   (TextureProgress :< cls, Object :< cls) => cls -> Float -> IO ()
set_fill_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_fill_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_fill_degrees #-}

-- | Upper limit for the fill of [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code]. When the node's [code]value[/code] is equal to its [code]max_value[/code], the texture fills up to this angle.
--   			See [member Range.value], [member Range.max_value].
bindTextureProgress_get_fill_degrees :: MethodBind
bindTextureProgress_get_fill_degrees
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_fill_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Upper limit for the fill of [member texture_progress] if [member fill_mode] is [code]FILL_CLOCKWISE[/code] or [code]FILL_COUNTER_CLOCKWISE[/code]. When the node's [code]value[/code] is equal to its [code]max_value[/code], the texture fills up to this angle.
--   			See [member Range.value], [member Range.max_value].
get_fill_degrees ::
                   (TextureProgress :< cls, Object :< cls) => cls -> IO Float
get_fill_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_fill_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_stretch_margin #-}

-- | The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
bindTextureProgress_set_stretch_margin :: MethodBind
bindTextureProgress_set_stretch_margin
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_stretch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
set_stretch_margin ::
                     (TextureProgress :< cls, Object :< cls) =>
                     cls -> Int -> Int -> IO ()
set_stretch_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_stretch_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_stretch_margin #-}

-- | The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
bindTextureProgress_get_stretch_margin :: MethodBind
bindTextureProgress_get_stretch_margin
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_stretch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
get_stretch_margin ::
                     (TextureProgress :< cls, Object :< cls) => cls -> Int -> IO Int
get_stretch_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_stretch_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_set_nine_patch_stretch #-}

-- | If [code]true[/code], Godot treats the bar's textures like [NinePatchRect]. Use [code]stretch_margin_*[/code], like [member stretch_margin_bottom], to set up the nine patch's 3x3 grid. Default value: [code]false[/code].
bindTextureProgress_set_nine_patch_stretch :: MethodBind
bindTextureProgress_set_nine_patch_stretch
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_nine_patch_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], Godot treats the bar's textures like [NinePatchRect]. Use [code]stretch_margin_*[/code], like [member stretch_margin_bottom], to set up the nine patch's 3x3 grid. Default value: [code]false[/code].
set_nine_patch_stretch ::
                         (TextureProgress :< cls, Object :< cls) => cls -> Bool -> IO ()
set_nine_patch_stretch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_nine_patch_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureProgress_get_nine_patch_stretch #-}

-- | If [code]true[/code], Godot treats the bar's textures like [NinePatchRect]. Use [code]stretch_margin_*[/code], like [member stretch_margin_bottom], to set up the nine patch's 3x3 grid. Default value: [code]false[/code].
bindTextureProgress_get_nine_patch_stretch :: MethodBind
bindTextureProgress_get_nine_patch_stretch
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_nine_patch_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], Godot treats the bar's textures like [NinePatchRect]. Use [code]stretch_margin_*[/code], like [member stretch_margin_bottom], to set up the nine patch's 3x3 grid. Default value: [code]false[/code].
get_nine_patch_stretch ::
                         (TextureProgress :< cls, Object :< cls) => cls -> IO Bool
get_nine_patch_stretch cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_nine_patch_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)