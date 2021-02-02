{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.StyleBoxFlat
       (Godot.Core.StyleBoxFlat.get_aa_size,
        Godot.Core.StyleBoxFlat.get_bg_color,
        Godot.Core.StyleBoxFlat.get_border_blend,
        Godot.Core.StyleBoxFlat.get_border_color,
        Godot.Core.StyleBoxFlat.get_border_width,
        Godot.Core.StyleBoxFlat.get_border_width_min,
        Godot.Core.StyleBoxFlat.get_corner_detail,
        Godot.Core.StyleBoxFlat.get_corner_radius,
        Godot.Core.StyleBoxFlat.get_expand_margin,
        Godot.Core.StyleBoxFlat.get_shadow_color,
        Godot.Core.StyleBoxFlat.get_shadow_offset,
        Godot.Core.StyleBoxFlat.get_shadow_size,
        Godot.Core.StyleBoxFlat.is_anti_aliased,
        Godot.Core.StyleBoxFlat.is_draw_center_enabled,
        Godot.Core.StyleBoxFlat.set_aa_size,
        Godot.Core.StyleBoxFlat.set_anti_aliased,
        Godot.Core.StyleBoxFlat.set_bg_color,
        Godot.Core.StyleBoxFlat.set_border_blend,
        Godot.Core.StyleBoxFlat.set_border_color,
        Godot.Core.StyleBoxFlat.set_border_width,
        Godot.Core.StyleBoxFlat.set_border_width_all,
        Godot.Core.StyleBoxFlat.set_corner_detail,
        Godot.Core.StyleBoxFlat.set_corner_radius,
        Godot.Core.StyleBoxFlat.set_corner_radius_all,
        Godot.Core.StyleBoxFlat.set_corner_radius_individual,
        Godot.Core.StyleBoxFlat.set_draw_center,
        Godot.Core.StyleBoxFlat.set_expand_margin,
        Godot.Core.StyleBoxFlat.set_expand_margin_all,
        Godot.Core.StyleBoxFlat.set_expand_margin_individual,
        Godot.Core.StyleBoxFlat.set_shadow_color,
        Godot.Core.StyleBoxFlat.set_shadow_offset,
        Godot.Core.StyleBoxFlat.set_shadow_size)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindStyleBoxFlat_get_aa_size #-}

-- | This changes the size of the faded ring. Higher values can be used to achieve a "blurry" effect.
bindStyleBoxFlat_get_aa_size :: MethodBind
bindStyleBoxFlat_get_aa_size
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_aa_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This changes the size of the faded ring. Higher values can be used to achieve a "blurry" effect.
get_aa_size ::
              (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Int
get_aa_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_aa_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_bg_color #-}

-- | The background color of the stylebox.
bindStyleBoxFlat_get_bg_color :: MethodBind
bindStyleBoxFlat_get_bg_color
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The background color of the stylebox.
get_bg_color ::
               (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Color
get_bg_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_bg_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_border_blend #-}

-- | When set to [code]true[/code], the border will fade into the background color.
bindStyleBoxFlat_get_border_blend :: MethodBind
bindStyleBoxFlat_get_border_blend
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_border_blend" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When set to [code]true[/code], the border will fade into the background color.
get_border_blend ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Bool
get_border_blend cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_border_blend
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_border_color #-}

-- | Sets the color of the border.
bindStyleBoxFlat_get_border_color :: MethodBind
bindStyleBoxFlat_get_border_color
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_border_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color of the border.
get_border_color ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Color
get_border_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_border_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_border_width #-}

-- | Border width for the bottom border.
bindStyleBoxFlat_get_border_width :: MethodBind
bindStyleBoxFlat_get_border_width
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_border_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Border width for the bottom border.
get_border_width ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> IO Int
get_border_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_border_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_border_width_min #-}

bindStyleBoxFlat_get_border_width_min :: MethodBind
bindStyleBoxFlat_get_border_width_min
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_border_width_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_border_width_min ::
                       (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Int
get_border_width_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_border_width_min
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_corner_detail #-}

-- | This sets the amount of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value you should take the corner radius ([method set_corner_radius_all]) into account.
--   			For corner radius smaller than 10, 4-5 should be enough.
--   			For corner radius smaller than 30, 8-12 should be enough.
bindStyleBoxFlat_get_corner_detail :: MethodBind
bindStyleBoxFlat_get_corner_detail
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_corner_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This sets the amount of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value you should take the corner radius ([method set_corner_radius_all]) into account.
--   			For corner radius smaller than 10, 4-5 should be enough.
--   			For corner radius smaller than 30, 8-12 should be enough.
get_corner_detail ::
                    (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Int
get_corner_detail cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_corner_detail
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_corner_radius #-}

-- | The corner radius of the bottom left corner. When set to 0 the corner is not rounded.
bindStyleBoxFlat_get_corner_radius :: MethodBind
bindStyleBoxFlat_get_corner_radius
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_corner_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The corner radius of the bottom left corner. When set to 0 the corner is not rounded.
get_corner_radius ::
                    (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> IO Int
get_corner_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_corner_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_expand_margin #-}

-- | Expands the stylebox outside of the control rect on the bottom edge. Useful in combination with border_width_bottom. To draw a border outside the control rect.
bindStyleBoxFlat_get_expand_margin :: MethodBind
bindStyleBoxFlat_get_expand_margin
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_expand_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Expands the stylebox outside of the control rect on the bottom edge. Useful in combination with border_width_bottom. To draw a border outside the control rect.
get_expand_margin ::
                    (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> IO Float
get_expand_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_expand_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_shadow_color #-}

-- | The color of the shadow. (This has no effect when shadow_size < 1)
bindStyleBoxFlat_get_shadow_color :: MethodBind
bindStyleBoxFlat_get_shadow_color
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color of the shadow. (This has no effect when shadow_size < 1)
get_shadow_color ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Color
get_shadow_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_shadow_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_shadow_offset #-}

bindStyleBoxFlat_get_shadow_offset :: MethodBind
bindStyleBoxFlat_get_shadow_offset
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_shadow_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shadow_offset ::
                    (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Vector2
get_shadow_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_shadow_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_get_shadow_size #-}

-- | The shadow size in pixels.
bindStyleBoxFlat_get_shadow_size :: MethodBind
bindStyleBoxFlat_get_shadow_size
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_shadow_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow size in pixels.
get_shadow_size ::
                  (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Int
get_shadow_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_get_shadow_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_is_anti_aliased #-}

-- | Anti Aliasing draws a small ring around edges. This ring fades to transparent. As a result edges look much smoother. This is only noticeable when using rounded corners.
bindStyleBoxFlat_is_anti_aliased :: MethodBind
bindStyleBoxFlat_is_anti_aliased
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "is_anti_aliased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Anti Aliasing draws a small ring around edges. This ring fades to transparent. As a result edges look much smoother. This is only noticeable when using rounded corners.
is_anti_aliased ::
                  (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Bool
is_anti_aliased cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_is_anti_aliased
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_is_draw_center_enabled #-}

-- | Toggels drawing of the inner part of the stylebox.
bindStyleBoxFlat_is_draw_center_enabled :: MethodBind
bindStyleBoxFlat_is_draw_center_enabled
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "is_draw_center_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Toggels drawing of the inner part of the stylebox.
is_draw_center_enabled ::
                         (StyleBoxFlat :< cls, Object :< cls) => cls -> IO Bool
is_draw_center_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_is_draw_center_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_aa_size #-}

-- | This changes the size of the faded ring. Higher values can be used to achieve a "blurry" effect.
bindStyleBoxFlat_set_aa_size :: MethodBind
bindStyleBoxFlat_set_aa_size
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_aa_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This changes the size of the faded ring. Higher values can be used to achieve a "blurry" effect.
set_aa_size ::
              (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> IO ()
set_aa_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_aa_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_anti_aliased #-}

-- | Anti Aliasing draws a small ring around edges. This ring fades to transparent. As a result edges look much smoother. This is only noticeable when using rounded corners.
bindStyleBoxFlat_set_anti_aliased :: MethodBind
bindStyleBoxFlat_set_anti_aliased
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_anti_aliased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Anti Aliasing draws a small ring around edges. This ring fades to transparent. As a result edges look much smoother. This is only noticeable when using rounded corners.
set_anti_aliased ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> Bool -> IO ()
set_anti_aliased cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_anti_aliased
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_bg_color #-}

-- | The background color of the stylebox.
bindStyleBoxFlat_set_bg_color :: MethodBind
bindStyleBoxFlat_set_bg_color
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The background color of the stylebox.
set_bg_color ::
               (StyleBoxFlat :< cls, Object :< cls) => cls -> Color -> IO ()
set_bg_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_bg_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_border_blend #-}

-- | When set to [code]true[/code], the border will fade into the background color.
bindStyleBoxFlat_set_border_blend :: MethodBind
bindStyleBoxFlat_set_border_blend
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_border_blend" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When set to [code]true[/code], the border will fade into the background color.
set_border_blend ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> Bool -> IO ()
set_border_blend cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_border_blend
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_border_color #-}

-- | Sets the color of the border.
bindStyleBoxFlat_set_border_color :: MethodBind
bindStyleBoxFlat_set_border_color
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_border_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color of the border.
set_border_color ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> Color -> IO ()
set_border_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_border_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_border_width #-}

-- | Border width for the bottom border.
bindStyleBoxFlat_set_border_width :: MethodBind
bindStyleBoxFlat_set_border_width
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_border_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Border width for the bottom border.
set_border_width ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_border_width cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_border_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_border_width_all #-}

bindStyleBoxFlat_set_border_width_all :: MethodBind
bindStyleBoxFlat_set_border_width_all
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_border_width_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_border_width_all ::
                       (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> IO ()
set_border_width_all cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_border_width_all
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_corner_detail #-}

-- | This sets the amount of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value you should take the corner radius ([method set_corner_radius_all]) into account.
--   			For corner radius smaller than 10, 4-5 should be enough.
--   			For corner radius smaller than 30, 8-12 should be enough.
bindStyleBoxFlat_set_corner_detail :: MethodBind
bindStyleBoxFlat_set_corner_detail
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_corner_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This sets the amount of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value you should take the corner radius ([method set_corner_radius_all]) into account.
--   			For corner radius smaller than 10, 4-5 should be enough.
--   			For corner radius smaller than 30, 8-12 should be enough.
set_corner_detail ::
                    (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> IO ()
set_corner_detail cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_corner_detail
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_corner_radius #-}

-- | The corner radius of the bottom left corner. When set to 0 the corner is not rounded.
bindStyleBoxFlat_set_corner_radius :: MethodBind
bindStyleBoxFlat_set_corner_radius
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_corner_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The corner radius of the bottom left corner. When set to 0 the corner is not rounded.
set_corner_radius ::
                    (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_corner_radius cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_corner_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_corner_radius_all #-}

bindStyleBoxFlat_set_corner_radius_all :: MethodBind
bindStyleBoxFlat_set_corner_radius_all
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_corner_radius_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_corner_radius_all ::
                        (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> IO ()
set_corner_radius_all cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_corner_radius_all
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_corner_radius_individual #-}

bindStyleBoxFlat_set_corner_radius_individual :: MethodBind
bindStyleBoxFlat_set_corner_radius_individual
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_corner_radius_individual" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_corner_radius_individual ::
                               (StyleBoxFlat :< cls, Object :< cls) =>
                               cls -> Int -> Int -> Int -> Int -> IO ()
set_corner_radius_individual cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStyleBoxFlat_set_corner_radius_individual
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_draw_center #-}

-- | Toggels drawing of the inner part of the stylebox.
bindStyleBoxFlat_set_draw_center :: MethodBind
bindStyleBoxFlat_set_draw_center
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_draw_center" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Toggels drawing of the inner part of the stylebox.
set_draw_center ::
                  (StyleBoxFlat :< cls, Object :< cls) => cls -> Bool -> IO ()
set_draw_center cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_draw_center
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_expand_margin #-}

-- | Expands the stylebox outside of the control rect on the bottom edge. Useful in combination with border_width_bottom. To draw a border outside the control rect.
bindStyleBoxFlat_set_expand_margin :: MethodBind
bindStyleBoxFlat_set_expand_margin
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_expand_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Expands the stylebox outside of the control rect on the bottom edge. Useful in combination with border_width_bottom. To draw a border outside the control rect.
set_expand_margin ::
                    (StyleBoxFlat :< cls, Object :< cls) =>
                    cls -> Int -> Float -> IO ()
set_expand_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_expand_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_expand_margin_all #-}

bindStyleBoxFlat_set_expand_margin_all :: MethodBind
bindStyleBoxFlat_set_expand_margin_all
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_expand_margin_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_expand_margin_all ::
                        (StyleBoxFlat :< cls, Object :< cls) => cls -> Float -> IO ()
set_expand_margin_all cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_expand_margin_all
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_expand_margin_individual #-}

bindStyleBoxFlat_set_expand_margin_individual :: MethodBind
bindStyleBoxFlat_set_expand_margin_individual
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_expand_margin_individual" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_expand_margin_individual ::
                               (StyleBoxFlat :< cls, Object :< cls) =>
                               cls -> Float -> Float -> Float -> Float -> IO ()
set_expand_margin_individual cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStyleBoxFlat_set_expand_margin_individual
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_shadow_color #-}

-- | The color of the shadow. (This has no effect when shadow_size < 1)
bindStyleBoxFlat_set_shadow_color :: MethodBind
bindStyleBoxFlat_set_shadow_color
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color of the shadow. (This has no effect when shadow_size < 1)
set_shadow_color ::
                   (StyleBoxFlat :< cls, Object :< cls) => cls -> Color -> IO ()
set_shadow_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_shadow_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_shadow_offset #-}

bindStyleBoxFlat_set_shadow_offset :: MethodBind
bindStyleBoxFlat_set_shadow_offset
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_shadow_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shadow_offset ::
                    (StyleBoxFlat :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_shadow_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_shadow_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxFlat_set_shadow_size #-}

-- | The shadow size in pixels.
bindStyleBoxFlat_set_shadow_size :: MethodBind
bindStyleBoxFlat_set_shadow_size
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_shadow_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow size in pixels.
set_shadow_size ::
                  (StyleBoxFlat :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxFlat_set_shadow_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)