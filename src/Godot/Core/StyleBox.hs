{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Resource()

instance NodeProperty StyleBox "content_margin_bottom" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_default_margin,
             wrapIndexedSetter 3 set_default_margin, Nothing)

instance NodeProperty StyleBox "content_margin_left" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_default_margin,
             wrapIndexedSetter 0 set_default_margin, Nothing)

instance NodeProperty StyleBox "content_margin_right" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_default_margin,
             wrapIndexedSetter 2 set_default_margin, Nothing)

instance NodeProperty StyleBox "content_margin_top" Float 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_default_margin,
             wrapIndexedSetter 1 set_default_margin, Nothing)

{-# NOINLINE bindStyleBox_draw #-}

-- | Draws this stylebox using a @CanvasItem@ with given @RID@.
--   				You can get a @RID@ value using @method Object.get_instance_id@ on a @CanvasItem@-derived node.
bindStyleBox_draw :: MethodBind
bindStyleBox_draw
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws this stylebox using a @CanvasItem@ with given @RID@.
--   				You can get a @RID@ value using @method Object.get_instance_id@ on a @CanvasItem@-derived node.
draw ::
       (StyleBox :< cls, Object :< cls) => cls -> Rid -> Rect2 -> IO ()
draw cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_draw (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StyleBox "draw" '[Rid, Rect2] (IO ()) where
        nodeMethod = Godot.Core.StyleBox.draw

{-# NOINLINE bindStyleBox_get_center_size #-}

-- | Returns the size of this @StyleBox@ without the margins.
bindStyleBox_get_center_size :: MethodBind
bindStyleBox_get_center_size
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_center_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size of this @StyleBox@ without the margins.
get_center_size ::
                  (StyleBox :< cls, Object :< cls) => cls -> IO Vector2
get_center_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_center_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StyleBox "get_center_size" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.StyleBox.get_center_size

{-# NOINLINE bindStyleBox_get_current_item_drawn #-}

-- | Returns the @CanvasItem@ that handles its @CanvasItem.NOTIFICATION_DRAW@ or @method CanvasItem._draw@ callback at this moment.
bindStyleBox_get_current_item_drawn :: MethodBind
bindStyleBox_get_current_item_drawn
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_current_item_drawn" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @CanvasItem@ that handles its @CanvasItem.NOTIFICATION_DRAW@ or @method CanvasItem._draw@ callback at this moment.
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

instance NodeMethod StyleBox "get_current_item_drawn" '[]
           (IO CanvasItem)
         where
        nodeMethod = Godot.Core.StyleBox.get_current_item_drawn

{-# NOINLINE bindStyleBox_get_default_margin #-}

-- | Returns the default value of the specified @enum Margin@.
bindStyleBox_get_default_margin :: MethodBind
bindStyleBox_get_default_margin
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_default_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the default value of the specified @enum Margin@.
get_default_margin ::
                     (StyleBox :< cls, Object :< cls) => cls -> Int -> IO Float
get_default_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_default_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StyleBox "get_default_margin" '[Int] (IO Float)
         where
        nodeMethod = Godot.Core.StyleBox.get_default_margin

{-# NOINLINE bindStyleBox_get_margin #-}

-- | Returns the content margin offset for the specified @enum Margin@.
--   				Positive values reduce size inwards, unlike @Control@'s margin values.
bindStyleBox_get_margin :: MethodBind
bindStyleBox_get_margin
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the content margin offset for the specified @enum Margin@.
--   				Positive values reduce size inwards, unlike @Control@'s margin values.
get_margin ::
             (StyleBox :< cls, Object :< cls) => cls -> Int -> IO Float
get_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_margin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StyleBox "get_margin" '[Int] (IO Float) where
        nodeMethod = Godot.Core.StyleBox.get_margin

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

instance NodeMethod StyleBox "get_minimum_size" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.StyleBox.get_minimum_size

{-# NOINLINE bindStyleBox_get_offset #-}

-- | Returns the "offset" of a stylebox. This helper function returns a value equivalent to @Vector2(style.get_margin(MARGIN_LEFT), style.get_margin(MARGIN_TOP))@.
bindStyleBox_get_offset :: MethodBind
bindStyleBox_get_offset
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the "offset" of a stylebox. This helper function returns a value equivalent to @Vector2(style.get_margin(MARGIN_LEFT), style.get_margin(MARGIN_TOP))@.
get_offset :: (StyleBox :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_get_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StyleBox "get_offset" '[] (IO Vector2) where
        nodeMethod = Godot.Core.StyleBox.get_offset

{-# NOINLINE bindStyleBox_set_default_margin #-}

-- | Sets the default value of the specified @enum Margin@ to given @offset@ in pixels.
bindStyleBox_set_default_margin :: MethodBind
bindStyleBox_set_default_margin
  = unsafePerformIO $
      withCString "StyleBox" $
        \ clsNamePtr ->
          withCString "set_default_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default value of the specified @enum Margin@ to given @offset@ in pixels.
set_default_margin ::
                     (StyleBox :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_default_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBox_set_default_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StyleBox "set_default_margin" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.StyleBox.set_default_margin

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

instance NodeMethod StyleBox "test_mask" '[Vector2, Rect2]
           (IO Bool)
         where
        nodeMethod = Godot.Core.StyleBox.test_mask