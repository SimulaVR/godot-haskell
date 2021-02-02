{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.StyleBox
       (Godot.Core.StyleBox.draw, Godot.Core.StyleBox.get_center_size,
        Godot.Core.StyleBox.get_current_item_drawn,
        Godot.Core.StyleBox.get_default_margin,
        Godot.Core.StyleBox.get_margin,
        Godot.Core.StyleBox.get_minimum_size,
        Godot.Core.StyleBox.get_offset,
        Godot.Core.StyleBox.set_default_margin,
        Godot.Core.StyleBox.test_mask)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindStyleBox_draw #-}

bindStyleBox_draw :: MethodBind
bindStyleBox_draw
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

draw ::
       (StyleBox :< cls, Object :< cls) => cls -> Rid -> Rect2 -> IO ()
draw cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_draw (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBox_get_center_size #-}

bindStyleBox_get_center_size :: MethodBind
bindStyleBox_get_center_size
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_center_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_center_size ::
                  (StyleBox :< cls, Object :< cls) => cls -> IO Vector2
get_center_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_center_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBox_get_current_item_drawn #-}

bindStyleBox_get_current_item_drawn :: MethodBind
bindStyleBox_get_current_item_drawn
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_current_item_drawn" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_current_item_drawn ::
                         (StyleBox :< cls, Object :< cls) => cls -> IO CanvasItem
get_current_item_drawn cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_current_item_drawn
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBox_get_default_margin #-}

-- | The bottom margin for the contents of this style box. Increasing this value reduces the space available to the contents from the bottom.
--   			If this value is negative, it is ignored and a child-specific margin is used instead. For example for [StyleBoxFlat] the border thickness (if any) is used instead.
--   			It is up to the code using this style box to decide what these contents are: for example, a [Button] respects this content margin for the textual contents of the button.
--   			[method get_margin] should be used to fetch this value as consumer instead of reading these properties directly. This is because it correctly respects negative values and the fallback mentioned above.
bindStyleBox_get_default_margin :: MethodBind
bindStyleBox_get_default_margin
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_default_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The bottom margin for the contents of this style box. Increasing this value reduces the space available to the contents from the bottom.
--   			If this value is negative, it is ignored and a child-specific margin is used instead. For example for [StyleBoxFlat] the border thickness (if any) is used instead.
--   			It is up to the code using this style box to decide what these contents are: for example, a [Button] respects this content margin for the textual contents of the button.
--   			[method get_margin] should be used to fetch this value as consumer instead of reading these properties directly. This is because it correctly respects negative values and the fallback mentioned above.
get_default_margin ::
                     (StyleBox :< cls, Object :< cls) => cls -> Int -> IO Float
get_default_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_default_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBox_get_margin #-}

-- | Returns the content margin offset for the specified margin
--   				Positive values reduce size inwards, unlike [Control]'s margin values.
bindStyleBox_get_margin :: MethodBind
bindStyleBox_get_margin
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the content margin offset for the specified margin
--   				Positive values reduce size inwards, unlike [Control]'s margin values.
get_margin ::
             (StyleBox :< cls, Object :< cls) => cls -> Int -> IO Float
get_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_margin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBox_get_minimum_size #-}

-- | Returns the minimum size that this stylebox can be shrunk to.
bindStyleBox_get_minimum_size :: MethodBind
bindStyleBox_get_minimum_size
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_minimum_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the minimum size that this stylebox can be shrunk to.
get_minimum_size ::
                   (StyleBox :< cls, Object :< cls) => cls -> IO Vector2
get_minimum_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_minimum_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBox_get_offset #-}

-- | Returns the "offset" of a stylebox, this is a helper function, like writing [code]Vector2(style.get_margin(MARGIN_LEFT), style.get_margin(MARGIN_TOP))[/code].
bindStyleBox_get_offset :: MethodBind
bindStyleBox_get_offset
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the "offset" of a stylebox, this is a helper function, like writing [code]Vector2(style.get_margin(MARGIN_LEFT), style.get_margin(MARGIN_TOP))[/code].
get_offset :: (StyleBox :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBox_set_default_margin #-}

-- | The bottom margin for the contents of this style box. Increasing this value reduces the space available to the contents from the bottom.
--   			If this value is negative, it is ignored and a child-specific margin is used instead. For example for [StyleBoxFlat] the border thickness (if any) is used instead.
--   			It is up to the code using this style box to decide what these contents are: for example, a [Button] respects this content margin for the textual contents of the button.
--   			[method get_margin] should be used to fetch this value as consumer instead of reading these properties directly. This is because it correctly respects negative values and the fallback mentioned above.
bindStyleBox_set_default_margin :: MethodBind
bindStyleBox_set_default_margin
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "set_default_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The bottom margin for the contents of this style box. Increasing this value reduces the space available to the contents from the bottom.
--   			If this value is negative, it is ignored and a child-specific margin is used instead. For example for [StyleBoxFlat] the border thickness (if any) is used instead.
--   			It is up to the code using this style box to decide what these contents are: for example, a [Button] respects this content margin for the textual contents of the button.
--   			[method get_margin] should be used to fetch this value as consumer instead of reading these properties directly. This is because it correctly respects negative values and the fallback mentioned above.
set_default_margin ::
                     (StyleBox :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_default_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_set_default_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBox_test_mask #-}

-- | Test a position in a rectangle, return whether it passes the mask test.
bindStyleBox_test_mask :: MethodBind
bindStyleBox_test_mask
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "test_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Test a position in a rectangle, return whether it passes the mask test.
test_mask ::
            (StyleBox :< cls, Object :< cls) =>
            cls -> Vector2 -> Rect2 -> IO Bool
test_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_test_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)