{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.StyleBox()

instance NodeProperty StyleBoxFlat "anti_aliasing" Bool 'False
         where
        nodeProperty
          = (is_anti_aliased, wrapDroppingSetter set_anti_aliased, Nothing)

instance NodeProperty StyleBoxFlat "anti_aliasing_size" Int 'False
         where
        nodeProperty
          = (get_aa_size, wrapDroppingSetter set_aa_size, Nothing)

instance NodeProperty StyleBoxFlat "bg_color" Color 'False where
        nodeProperty
          = (get_bg_color, wrapDroppingSetter set_bg_color, Nothing)

instance NodeProperty StyleBoxFlat "border_blend" Bool 'False where
        nodeProperty
          = (get_border_blend, wrapDroppingSetter set_border_blend, Nothing)

instance NodeProperty StyleBoxFlat "border_color" Color 'False
         where
        nodeProperty
          = (get_border_color, wrapDroppingSetter set_border_color, Nothing)

instance NodeProperty StyleBoxFlat "border_width_bottom" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_border_width,
             wrapIndexedSetter 3 set_border_width, Nothing)

instance NodeProperty StyleBoxFlat "border_width_left" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_border_width,
             wrapIndexedSetter 0 set_border_width, Nothing)

instance NodeProperty StyleBoxFlat "border_width_right" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_border_width,
             wrapIndexedSetter 2 set_border_width, Nothing)

instance NodeProperty StyleBoxFlat "border_width_top" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_border_width,
             wrapIndexedSetter 1 set_border_width, Nothing)

instance NodeProperty StyleBoxFlat "corner_detail" Int 'False where
        nodeProperty
          = (get_corner_detail, wrapDroppingSetter set_corner_detail,
             Nothing)

instance NodeProperty StyleBoxFlat "corner_radius_bottom_left" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_corner_radius,
             wrapIndexedSetter 3 set_corner_radius, Nothing)

instance NodeProperty StyleBoxFlat "corner_radius_bottom_right" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_corner_radius,
             wrapIndexedSetter 2 set_corner_radius, Nothing)

instance NodeProperty StyleBoxFlat "corner_radius_top_left" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_corner_radius,
             wrapIndexedSetter 0 set_corner_radius, Nothing)

instance NodeProperty StyleBoxFlat "corner_radius_top_right" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_corner_radius,
             wrapIndexedSetter 1 set_corner_radius, Nothing)

instance NodeProperty StyleBoxFlat "draw_center" Bool 'False where
        nodeProperty
          = (is_draw_center_enabled, wrapDroppingSetter set_draw_center,
             Nothing)

instance NodeProperty StyleBoxFlat "expand_margin_bottom" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_expand_margin,
             wrapIndexedSetter 3 set_expand_margin, Nothing)

instance NodeProperty StyleBoxFlat "expand_margin_left" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_expand_margin,
             wrapIndexedSetter 0 set_expand_margin, Nothing)

instance NodeProperty StyleBoxFlat "expand_margin_right" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_expand_margin,
             wrapIndexedSetter 2 set_expand_margin, Nothing)

instance NodeProperty StyleBoxFlat "expand_margin_top" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_expand_margin,
             wrapIndexedSetter 1 set_expand_margin, Nothing)

instance NodeProperty StyleBoxFlat "shadow_color" Color 'False
         where
        nodeProperty
          = (get_shadow_color, wrapDroppingSetter set_shadow_color, Nothing)

instance NodeProperty StyleBoxFlat "shadow_offset" Vector2 'False
         where
        nodeProperty
          = (get_shadow_offset, wrapDroppingSetter set_shadow_offset,
             Nothing)

instance NodeProperty StyleBoxFlat "shadow_size" Int 'False where
        nodeProperty
          = (get_shadow_size, wrapDroppingSetter set_shadow_size, Nothing)

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

instance NodeMethod StyleBoxFlat "get_aa_size" '[] (IO Int) where
        nodeMethod = Godot.Core.StyleBoxFlat.get_aa_size

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

instance NodeMethod StyleBoxFlat "get_bg_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_bg_color

{-# NOINLINE bindStyleBoxFlat_get_border_blend #-}

-- | If @true@, the border will fade into the background color.
bindStyleBoxFlat_get_border_blend :: MethodBind
bindStyleBoxFlat_get_border_blend
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_border_blend" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the border will fade into the background color.
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

instance NodeMethod StyleBoxFlat "get_border_blend" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_border_blend

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

instance NodeMethod StyleBoxFlat "get_border_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_border_color

{-# NOINLINE bindStyleBoxFlat_get_border_width #-}

-- | Returns the given @margin@'s border width. See @enum Margin@ for possible values.
bindStyleBoxFlat_get_border_width :: MethodBind
bindStyleBoxFlat_get_border_width
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_border_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given @margin@'s border width. See @enum Margin@ for possible values.
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

instance NodeMethod StyleBoxFlat "get_border_width" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_border_width

{-# NOINLINE bindStyleBoxFlat_get_border_width_min #-}

-- | Returns the smallest border width out of all four borders.
bindStyleBoxFlat_get_border_width_min :: MethodBind
bindStyleBoxFlat_get_border_width_min
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_border_width_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the smallest border width out of all four borders.
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

instance NodeMethod StyleBoxFlat "get_border_width_min" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_border_width_min

{-# NOINLINE bindStyleBoxFlat_get_corner_detail #-}

-- | This sets the amount of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value, you should take the corner radius (@method set_corner_radius_all@) into account.
--   			For corner radii smaller than 10, @4@ or @5@ should be enough. For corner radii smaller than 30, values between @8@ and @12@ should be enough.
--   			A corner detail of @1@ will result in chamfered corners instead of rounded corners, which is useful for some artistic effects.
bindStyleBoxFlat_get_corner_detail :: MethodBind
bindStyleBoxFlat_get_corner_detail
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_corner_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This sets the amount of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value, you should take the corner radius (@method set_corner_radius_all@) into account.
--   			For corner radii smaller than 10, @4@ or @5@ should be enough. For corner radii smaller than 30, values between @8@ and @12@ should be enough.
--   			A corner detail of @1@ will result in chamfered corners instead of rounded corners, which is useful for some artistic effects.
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

instance NodeMethod StyleBoxFlat "get_corner_detail" '[] (IO Int)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_corner_detail

{-# NOINLINE bindStyleBoxFlat_get_corner_radius #-}

-- | Returns the given @corner@'s radius. See @enum Corner@ for possible values.
bindStyleBoxFlat_get_corner_radius :: MethodBind
bindStyleBoxFlat_get_corner_radius
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_corner_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given @corner@'s radius. See @enum Corner@ for possible values.
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

instance NodeMethod StyleBoxFlat "get_corner_radius" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_corner_radius

{-# NOINLINE bindStyleBoxFlat_get_expand_margin #-}

-- | Returns the size of the given @margin@'s expand margin. See @enum Margin@ for possible values.
bindStyleBoxFlat_get_expand_margin :: MethodBind
bindStyleBoxFlat_get_expand_margin
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_expand_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size of the given @margin@'s expand margin. See @enum Margin@ for possible values.
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

instance NodeMethod StyleBoxFlat "get_expand_margin" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_expand_margin

{-# NOINLINE bindStyleBoxFlat_get_shadow_color #-}

-- | The color of the shadow. This has no effect if @shadow_size@ is lower than 1.
bindStyleBoxFlat_get_shadow_color :: MethodBind
bindStyleBoxFlat_get_shadow_color
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color of the shadow. This has no effect if @shadow_size@ is lower than 1.
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

instance NodeMethod StyleBoxFlat "get_shadow_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_shadow_color

{-# NOINLINE bindStyleBoxFlat_get_shadow_offset #-}

-- | The shadow offset in pixels. Adjusts the position of the shadow relatively to the stylebox.
bindStyleBoxFlat_get_shadow_offset :: MethodBind
bindStyleBoxFlat_get_shadow_offset
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "get_shadow_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow offset in pixels. Adjusts the position of the shadow relatively to the stylebox.
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

instance NodeMethod StyleBoxFlat "get_shadow_offset" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_shadow_offset

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

instance NodeMethod StyleBoxFlat "get_shadow_size" '[] (IO Int)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.get_shadow_size

{-# NOINLINE bindStyleBoxFlat_is_anti_aliased #-}

-- | Antialiasing draws a small ring around the edges, which fades to transparency. As a result, edges look much smoother. This is only noticeable when using rounded corners.
bindStyleBoxFlat_is_anti_aliased :: MethodBind
bindStyleBoxFlat_is_anti_aliased
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "is_anti_aliased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Antialiasing draws a small ring around the edges, which fades to transparency. As a result, edges look much smoother. This is only noticeable when using rounded corners.
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

instance NodeMethod StyleBoxFlat "is_anti_aliased" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.is_anti_aliased

{-# NOINLINE bindStyleBoxFlat_is_draw_center_enabled #-}

-- | Toggles drawing of the inner part of the stylebox.
bindStyleBoxFlat_is_draw_center_enabled :: MethodBind
bindStyleBoxFlat_is_draw_center_enabled
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "is_draw_center_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Toggles drawing of the inner part of the stylebox.
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

instance NodeMethod StyleBoxFlat "is_draw_center_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.StyleBoxFlat.is_draw_center_enabled

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

instance NodeMethod StyleBoxFlat "set_aa_size" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StyleBoxFlat.set_aa_size

{-# NOINLINE bindStyleBoxFlat_set_anti_aliased #-}

-- | Antialiasing draws a small ring around the edges, which fades to transparency. As a result, edges look much smoother. This is only noticeable when using rounded corners.
bindStyleBoxFlat_set_anti_aliased :: MethodBind
bindStyleBoxFlat_set_anti_aliased
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_anti_aliased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Antialiasing draws a small ring around the edges, which fades to transparency. As a result, edges look much smoother. This is only noticeable when using rounded corners.
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

instance NodeMethod StyleBoxFlat "set_anti_aliased" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_anti_aliased

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

instance NodeMethod StyleBoxFlat "set_bg_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_bg_color

{-# NOINLINE bindStyleBoxFlat_set_border_blend #-}

-- | If @true@, the border will fade into the background color.
bindStyleBoxFlat_set_border_blend :: MethodBind
bindStyleBoxFlat_set_border_blend
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_border_blend" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the border will fade into the background color.
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

instance NodeMethod StyleBoxFlat "set_border_blend" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_border_blend

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

instance NodeMethod StyleBoxFlat "set_border_color" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_border_color

{-# NOINLINE bindStyleBoxFlat_set_border_width #-}

-- | Sets the border width to @width@ pixels for the given @margin@. See @enum Margin@ for possible values.
bindStyleBoxFlat_set_border_width :: MethodBind
bindStyleBoxFlat_set_border_width
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_border_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the border width to @width@ pixels for the given @margin@. See @enum Margin@ for possible values.
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

instance NodeMethod StyleBoxFlat "set_border_width" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_border_width

{-# NOINLINE bindStyleBoxFlat_set_border_width_all #-}

-- | Sets the border width to @width@ pixels for all margins.
bindStyleBoxFlat_set_border_width_all :: MethodBind
bindStyleBoxFlat_set_border_width_all
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_border_width_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the border width to @width@ pixels for all margins.
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

instance NodeMethod StyleBoxFlat "set_border_width_all" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_border_width_all

{-# NOINLINE bindStyleBoxFlat_set_corner_detail #-}

-- | This sets the amount of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value, you should take the corner radius (@method set_corner_radius_all@) into account.
--   			For corner radii smaller than 10, @4@ or @5@ should be enough. For corner radii smaller than 30, values between @8@ and @12@ should be enough.
--   			A corner detail of @1@ will result in chamfered corners instead of rounded corners, which is useful for some artistic effects.
bindStyleBoxFlat_set_corner_detail :: MethodBind
bindStyleBoxFlat_set_corner_detail
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_corner_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This sets the amount of vertices used for each corner. Higher values result in rounder corners but take more processing power to compute. When choosing a value, you should take the corner radius (@method set_corner_radius_all@) into account.
--   			For corner radii smaller than 10, @4@ or @5@ should be enough. For corner radii smaller than 30, values between @8@ and @12@ should be enough.
--   			A corner detail of @1@ will result in chamfered corners instead of rounded corners, which is useful for some artistic effects.
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

instance NodeMethod StyleBoxFlat "set_corner_detail" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_corner_detail

{-# NOINLINE bindStyleBoxFlat_set_corner_radius #-}

-- | Sets the corner radius to @radius@ pixels for the given @corner@. See @enum Corner@ for possible values.
bindStyleBoxFlat_set_corner_radius :: MethodBind
bindStyleBoxFlat_set_corner_radius
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_corner_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the corner radius to @radius@ pixels for the given @corner@. See @enum Corner@ for possible values.
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

instance NodeMethod StyleBoxFlat "set_corner_radius" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_corner_radius

{-# NOINLINE bindStyleBoxFlat_set_corner_radius_all #-}

-- | Sets the corner radius to @radius@ pixels for all corners.
bindStyleBoxFlat_set_corner_radius_all :: MethodBind
bindStyleBoxFlat_set_corner_radius_all
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_corner_radius_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the corner radius to @radius@ pixels for all corners.
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

instance NodeMethod StyleBoxFlat "set_corner_radius_all" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_corner_radius_all

{-# NOINLINE bindStyleBoxFlat_set_corner_radius_individual #-}

-- | Sets the corner radius for each corner to @radius_top_left@, @radius_top_right@, @radius_bottom_right@, and @radius_bottom_left@ pixels.
bindStyleBoxFlat_set_corner_radius_individual :: MethodBind
bindStyleBoxFlat_set_corner_radius_individual
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_corner_radius_individual" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the corner radius for each corner to @radius_top_left@, @radius_top_right@, @radius_bottom_right@, and @radius_bottom_left@ pixels.
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

instance NodeMethod StyleBoxFlat "set_corner_radius_individual"
           '[Int, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_corner_radius_individual

{-# NOINLINE bindStyleBoxFlat_set_draw_center #-}

-- | Toggles drawing of the inner part of the stylebox.
bindStyleBoxFlat_set_draw_center :: MethodBind
bindStyleBoxFlat_set_draw_center
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_draw_center" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Toggles drawing of the inner part of the stylebox.
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

instance NodeMethod StyleBoxFlat "set_draw_center" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_draw_center

{-# NOINLINE bindStyleBoxFlat_set_expand_margin #-}

-- | Sets the expand margin to @size@ pixels for the given @margin@. See @enum Margin@ for possible values.
bindStyleBoxFlat_set_expand_margin :: MethodBind
bindStyleBoxFlat_set_expand_margin
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_expand_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the expand margin to @size@ pixels for the given @margin@. See @enum Margin@ for possible values.
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

instance NodeMethod StyleBoxFlat "set_expand_margin" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_expand_margin

{-# NOINLINE bindStyleBoxFlat_set_expand_margin_all #-}

-- | Sets the expand margin to @size@ pixels for all margins.
bindStyleBoxFlat_set_expand_margin_all :: MethodBind
bindStyleBoxFlat_set_expand_margin_all
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_expand_margin_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the expand margin to @size@ pixels for all margins.
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

instance NodeMethod StyleBoxFlat "set_expand_margin_all" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_expand_margin_all

{-# NOINLINE bindStyleBoxFlat_set_expand_margin_individual #-}

-- | Sets the expand margin for each margin to @size_left@, @size_top@, @size_right@, and @size_bottom@ pixels.
bindStyleBoxFlat_set_expand_margin_individual :: MethodBind
bindStyleBoxFlat_set_expand_margin_individual
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_expand_margin_individual" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the expand margin for each margin to @size_left@, @size_top@, @size_right@, and @size_bottom@ pixels.
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

instance NodeMethod StyleBoxFlat "set_expand_margin_individual"
           '[Float, Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_expand_margin_individual

{-# NOINLINE bindStyleBoxFlat_set_shadow_color #-}

-- | The color of the shadow. This has no effect if @shadow_size@ is lower than 1.
bindStyleBoxFlat_set_shadow_color :: MethodBind
bindStyleBoxFlat_set_shadow_color
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color of the shadow. This has no effect if @shadow_size@ is lower than 1.
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

instance NodeMethod StyleBoxFlat "set_shadow_color" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_shadow_color

{-# NOINLINE bindStyleBoxFlat_set_shadow_offset #-}

-- | The shadow offset in pixels. Adjusts the position of the shadow relatively to the stylebox.
bindStyleBoxFlat_set_shadow_offset :: MethodBind
bindStyleBoxFlat_set_shadow_offset
  = unsafePerformIO $
      withCString "StyleBoxFlat" $
        \ clsNamePtr ->
          withCString "set_shadow_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow offset in pixels. Adjusts the position of the shadow relatively to the stylebox.
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

instance NodeMethod StyleBoxFlat "set_shadow_offset" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_shadow_offset

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

instance NodeMethod StyleBoxFlat "set_shadow_size" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.StyleBoxFlat.set_shadow_size