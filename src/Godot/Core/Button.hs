{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Button
       (Godot.Core.Button._ALIGN_CENTER, Godot.Core.Button._ALIGN_LEFT,
        Godot.Core.Button._ALIGN_RIGHT, Godot.Core.Button.get_button_icon,
        Godot.Core.Button.get_clip_text, Godot.Core.Button.get_text,
        Godot.Core.Button.get_text_align, Godot.Core.Button.is_expand_icon,
        Godot.Core.Button.is_flat, Godot.Core.Button.set_button_icon,
        Godot.Core.Button.set_clip_text, Godot.Core.Button.set_expand_icon,
        Godot.Core.Button.set_flat, Godot.Core.Button.set_text,
        Godot.Core.Button.set_text_align)
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
import Godot.Core.BaseButton()

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

instance NodeProperty Button "align" Int 'False where
        nodeProperty
          = (get_text_align, wrapDroppingSetter set_text_align, Nothing)

instance NodeProperty Button "clip_text" Bool 'False where
        nodeProperty
          = (get_clip_text, wrapDroppingSetter set_clip_text, Nothing)

instance NodeProperty Button "expand_icon" Bool 'False where
        nodeProperty
          = (is_expand_icon, wrapDroppingSetter set_expand_icon, Nothing)

instance NodeProperty Button "flat" Bool 'False where
        nodeProperty = (is_flat, wrapDroppingSetter set_flat, Nothing)

instance NodeProperty Button "icon" Texture 'False where
        nodeProperty
          = (get_button_icon, wrapDroppingSetter set_button_icon, Nothing)

instance NodeProperty Button "text" GodotString 'False where
        nodeProperty = (get_text, wrapDroppingSetter set_text, Nothing)

{-# NOINLINE bindButton_get_button_icon #-}

-- | Button's icon, if text is present the icon will be placed before the text.
bindButton_get_button_icon :: MethodBind
bindButton_get_button_icon
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "get_button_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Button's icon, if text is present the icon will be placed before the text.
get_button_icon ::
                  (Button :< cls, Object :< cls) => cls -> IO Texture
get_button_icon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_get_button_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "get_button_icon" '[] (IO Texture) where
        nodeMethod = Godot.Core.Button.get_button_icon

{-# NOINLINE bindButton_get_clip_text #-}

-- | When this property is enabled, text that is too large to fit the button is clipped, when disabled the Button will always be wide enough to hold the text.
bindButton_get_clip_text :: MethodBind
bindButton_get_clip_text
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "get_clip_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When this property is enabled, text that is too large to fit the button is clipped, when disabled the Button will always be wide enough to hold the text.
get_clip_text :: (Button :< cls, Object :< cls) => cls -> IO Bool
get_clip_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_get_clip_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "get_clip_text" '[] (IO Bool) where
        nodeMethod = Godot.Core.Button.get_clip_text

{-# NOINLINE bindButton_get_text #-}

-- | The button's text that will be displayed inside the button's area.
bindButton_get_text :: MethodBind
bindButton_get_text
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's text that will be displayed inside the button's area.
get_text :: (Button :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_get_text (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "get_text" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Button.get_text

{-# NOINLINE bindButton_get_text_align #-}

-- | Text alignment policy for the button's text, use one of the @enum TextAlign@ constants.
bindButton_get_text_align :: MethodBind
bindButton_get_text_align
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "get_text_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text alignment policy for the button's text, use one of the @enum TextAlign@ constants.
get_text_align :: (Button :< cls, Object :< cls) => cls -> IO Int
get_text_align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_get_text_align (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "get_text_align" '[] (IO Int) where
        nodeMethod = Godot.Core.Button.get_text_align

{-# NOINLINE bindButton_is_expand_icon #-}

-- | When enabled, the button's icon will expand/shrink to fit the button's size while keeping its aspect.
bindButton_is_expand_icon :: MethodBind
bindButton_is_expand_icon
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "is_expand_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When enabled, the button's icon will expand/shrink to fit the button's size while keeping its aspect.
is_expand_icon :: (Button :< cls, Object :< cls) => cls -> IO Bool
is_expand_icon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_is_expand_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "is_expand_icon" '[] (IO Bool) where
        nodeMethod = Godot.Core.Button.is_expand_icon

{-# NOINLINE bindButton_is_flat #-}

-- | Flat buttons don't display decoration.
bindButton_is_flat :: MethodBind
bindButton_is_flat
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "is_flat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Flat buttons don't display decoration.
is_flat :: (Button :< cls, Object :< cls) => cls -> IO Bool
is_flat cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_is_flat (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "is_flat" '[] (IO Bool) where
        nodeMethod = Godot.Core.Button.is_flat

{-# NOINLINE bindButton_set_button_icon #-}

-- | Button's icon, if text is present the icon will be placed before the text.
bindButton_set_button_icon :: MethodBind
bindButton_set_button_icon
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "set_button_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Button's icon, if text is present the icon will be placed before the text.
set_button_icon ::
                  (Button :< cls, Object :< cls) => cls -> Texture -> IO ()
set_button_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_set_button_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "set_button_icon" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.Button.set_button_icon

{-# NOINLINE bindButton_set_clip_text #-}

-- | When this property is enabled, text that is too large to fit the button is clipped, when disabled the Button will always be wide enough to hold the text.
bindButton_set_clip_text :: MethodBind
bindButton_set_clip_text
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "set_clip_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When this property is enabled, text that is too large to fit the button is clipped, when disabled the Button will always be wide enough to hold the text.
set_clip_text ::
                (Button :< cls, Object :< cls) => cls -> Bool -> IO ()
set_clip_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_set_clip_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "set_clip_text" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Button.set_clip_text

{-# NOINLINE bindButton_set_expand_icon #-}

-- | When enabled, the button's icon will expand/shrink to fit the button's size while keeping its aspect.
bindButton_set_expand_icon :: MethodBind
bindButton_set_expand_icon
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "set_expand_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When enabled, the button's icon will expand/shrink to fit the button's size while keeping its aspect.
set_expand_icon ::
                  (Button :< cls, Object :< cls) => cls -> Bool -> IO ()
set_expand_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_set_expand_icon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "set_expand_icon" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Button.set_expand_icon

{-# NOINLINE bindButton_set_flat #-}

-- | Flat buttons don't display decoration.
bindButton_set_flat :: MethodBind
bindButton_set_flat
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "set_flat" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Flat buttons don't display decoration.
set_flat :: (Button :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flat cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_set_flat (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "set_flat" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Button.set_flat

{-# NOINLINE bindButton_set_text #-}

-- | The button's text that will be displayed inside the button's area.
bindButton_set_text :: MethodBind
bindButton_set_text
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's text that will be displayed inside the button's area.
set_text ::
           (Button :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_set_text (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "set_text" '[GodotString] (IO ()) where
        nodeMethod = Godot.Core.Button.set_text

{-# NOINLINE bindButton_set_text_align #-}

-- | Text alignment policy for the button's text, use one of the @enum TextAlign@ constants.
bindButton_set_text_align :: MethodBind
bindButton_set_text_align
  = unsafePerformIO $
      withCString "Button" $
        \ clsNamePtr ->
          withCString "set_text_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Text alignment policy for the button's text, use one of the @enum TextAlign@ constants.
set_text_align ::
                 (Button :< cls, Object :< cls) => cls -> Int -> IO ()
set_text_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindButton_set_text_align (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Button "set_text_align" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Button.set_text_align