{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Label
       (Godot.Core.Label._ALIGN_CENTER, Godot.Core.Label._ALIGN_LEFT,
        Godot.Core.Label._VALIGN_CENTER, Godot.Core.Label._VALIGN_TOP,
        Godot.Core.Label._ALIGN_RIGHT, Godot.Core.Label._VALIGN_FILL,
        Godot.Core.Label._ALIGN_FILL, Godot.Core.Label._VALIGN_BOTTOM,
        Godot.Core.Label.get_align, Godot.Core.Label.get_line_count,
        Godot.Core.Label.get_line_height,
        Godot.Core.Label.get_lines_skipped,
        Godot.Core.Label.get_max_lines_visible,
        Godot.Core.Label.get_percent_visible, Godot.Core.Label.get_text,
        Godot.Core.Label.get_total_character_count,
        Godot.Core.Label.get_valign,
        Godot.Core.Label.get_visible_characters,
        Godot.Core.Label.get_visible_line_count,
        Godot.Core.Label.has_autowrap, Godot.Core.Label.is_clipping_text,
        Godot.Core.Label.is_uppercase, Godot.Core.Label.set_align,
        Godot.Core.Label.set_autowrap, Godot.Core.Label.set_clip_text,
        Godot.Core.Label.set_lines_skipped,
        Godot.Core.Label.set_max_lines_visible,
        Godot.Core.Label.set_percent_visible, Godot.Core.Label.set_text,
        Godot.Core.Label.set_uppercase, Godot.Core.Label.set_valign,
        Godot.Core.Label.set_visible_characters)
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
import Godot.Core.Control()

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

_ALIGN_LEFT :: Int
_ALIGN_LEFT = 0

_VALIGN_CENTER :: Int
_VALIGN_CENTER = 1

_VALIGN_TOP :: Int
_VALIGN_TOP = 0

_ALIGN_RIGHT :: Int
_ALIGN_RIGHT = 2

_VALIGN_FILL :: Int
_VALIGN_FILL = 3

_ALIGN_FILL :: Int
_ALIGN_FILL = 3

_VALIGN_BOTTOM :: Int
_VALIGN_BOTTOM = 2

instance NodeProperty Label "align" Int 'False where
        nodeProperty = (get_align, wrapDroppingSetter set_align, Nothing)

instance NodeProperty Label "autowrap" Bool 'False where
        nodeProperty
          = (has_autowrap, wrapDroppingSetter set_autowrap, Nothing)

instance NodeProperty Label "clip_text" Bool 'False where
        nodeProperty
          = (is_clipping_text, wrapDroppingSetter set_clip_text, Nothing)

instance NodeProperty Label "lines_skipped" Int 'False where
        nodeProperty
          = (get_lines_skipped, wrapDroppingSetter set_lines_skipped,
             Nothing)

instance NodeProperty Label "max_lines_visible" Int 'False where
        nodeProperty
          = (get_max_lines_visible, wrapDroppingSetter set_max_lines_visible,
             Nothing)

instance NodeProperty Label "percent_visible" Float 'False where
        nodeProperty
          = (get_percent_visible, wrapDroppingSetter set_percent_visible,
             Nothing)

instance NodeProperty Label "text" GodotString 'False where
        nodeProperty = (get_text, wrapDroppingSetter set_text, Nothing)

instance NodeProperty Label "uppercase" Bool 'False where
        nodeProperty
          = (is_uppercase, wrapDroppingSetter set_uppercase, Nothing)

instance NodeProperty Label "valign" Int 'False where
        nodeProperty = (get_valign, wrapDroppingSetter set_valign, Nothing)

instance NodeProperty Label "visible_characters" Int 'False where
        nodeProperty
          = (get_visible_characters,
             wrapDroppingSetter set_visible_characters, Nothing)

{-# NOINLINE bindLabel_get_align #-}

-- | Controls the text's horizontal align. Supports left, center, right, and fill, or justify. Set it to one of the @enum Align@ constants.
bindLabel_get_align :: MethodBind
bindLabel_get_align
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's horizontal align. Supports left, center, right, and fill, or justify. Set it to one of the @enum Align@ constants.
get_align :: (Label :< cls, Object :< cls) => cls -> IO Int
get_align cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_align (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_align" '[] (IO Int) where
        nodeMethod = Godot.Core.Label.get_align

{-# NOINLINE bindLabel_get_line_count #-}

-- | Returns the amount of lines of text the Label has.
bindLabel_get_line_count :: MethodBind
bindLabel_get_line_count
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_line_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of lines of text the Label has.
get_line_count :: (Label :< cls, Object :< cls) => cls -> IO Int
get_line_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_line_count (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_line_count" '[] (IO Int) where
        nodeMethod = Godot.Core.Label.get_line_count

{-# NOINLINE bindLabel_get_line_height #-}

-- | Returns the font size in pixels.
bindLabel_get_line_height :: MethodBind
bindLabel_get_line_height
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_line_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the font size in pixels.
get_line_height :: (Label :< cls, Object :< cls) => cls -> IO Int
get_line_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_line_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_line_height" '[] (IO Int) where
        nodeMethod = Godot.Core.Label.get_line_height

{-# NOINLINE bindLabel_get_lines_skipped #-}

-- | The node ignores the first @lines_skipped@ lines before it starts to display text.
bindLabel_get_lines_skipped :: MethodBind
bindLabel_get_lines_skipped
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_lines_skipped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node ignores the first @lines_skipped@ lines before it starts to display text.
get_lines_skipped :: (Label :< cls, Object :< cls) => cls -> IO Int
get_lines_skipped cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_lines_skipped (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_lines_skipped" '[] (IO Int) where
        nodeMethod = Godot.Core.Label.get_lines_skipped

{-# NOINLINE bindLabel_get_max_lines_visible #-}

-- | Limits the lines of text the node shows on screen.
bindLabel_get_max_lines_visible :: MethodBind
bindLabel_get_max_lines_visible
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_max_lines_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Limits the lines of text the node shows on screen.
get_max_lines_visible ::
                        (Label :< cls, Object :< cls) => cls -> IO Int
get_max_lines_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_max_lines_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_max_lines_visible" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Label.get_max_lines_visible

{-# NOINLINE bindLabel_get_percent_visible #-}

-- | Limits the count of visible characters. If you set @percent_visible@ to 50, only up to half of the text's characters will display on screen. Useful to animate the text in a dialog box.
bindLabel_get_percent_visible :: MethodBind
bindLabel_get_percent_visible
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_percent_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Limits the count of visible characters. If you set @percent_visible@ to 50, only up to half of the text's characters will display on screen. Useful to animate the text in a dialog box.
get_percent_visible ::
                      (Label :< cls, Object :< cls) => cls -> IO Float
get_percent_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_percent_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_percent_visible" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Label.get_percent_visible

{-# NOINLINE bindLabel_get_text #-}

-- | The text to display on screen.
bindLabel_get_text :: MethodBind
bindLabel_get_text
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text to display on screen.
get_text :: (Label :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_text (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_text" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Label.get_text

{-# NOINLINE bindLabel_get_total_character_count #-}

-- | Returns the total number of printable characters in the text (excluding spaces and newlines).
bindLabel_get_total_character_count :: MethodBind
bindLabel_get_total_character_count
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_total_character_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of printable characters in the text (excluding spaces and newlines).
get_total_character_count ::
                            (Label :< cls, Object :< cls) => cls -> IO Int
get_total_character_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_total_character_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_total_character_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Label.get_total_character_count

{-# NOINLINE bindLabel_get_valign #-}

-- | Controls the text's vertical align. Supports top, center, bottom, and fill. Set it to one of the @enum VAlign@ constants.
bindLabel_get_valign :: MethodBind
bindLabel_get_valign
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_valign" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's vertical align. Supports top, center, bottom, and fill. Set it to one of the @enum VAlign@ constants.
get_valign :: (Label :< cls, Object :< cls) => cls -> IO Int
get_valign cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_valign (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_valign" '[] (IO Int) where
        nodeMethod = Godot.Core.Label.get_valign

{-# NOINLINE bindLabel_get_visible_characters #-}

-- | Restricts the number of characters to display. Set to -1 to disable.
bindLabel_get_visible_characters :: MethodBind
bindLabel_get_visible_characters
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_visible_characters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Restricts the number of characters to display. Set to -1 to disable.
get_visible_characters ::
                         (Label :< cls, Object :< cls) => cls -> IO Int
get_visible_characters cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_visible_characters
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_visible_characters" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Label.get_visible_characters

{-# NOINLINE bindLabel_get_visible_line_count #-}

-- | Returns the number of lines shown. Useful if the @Label@'s height cannot currently display all lines.
bindLabel_get_visible_line_count :: MethodBind
bindLabel_get_visible_line_count
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "get_visible_line_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of lines shown. Useful if the @Label@'s height cannot currently display all lines.
get_visible_line_count ::
                         (Label :< cls, Object :< cls) => cls -> IO Int
get_visible_line_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_get_visible_line_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "get_visible_line_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Label.get_visible_line_count

{-# NOINLINE bindLabel_has_autowrap #-}

-- | If @true@, wraps the text inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text.
bindLabel_has_autowrap :: MethodBind
bindLabel_has_autowrap
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "has_autowrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, wraps the text inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text.
has_autowrap :: (Label :< cls, Object :< cls) => cls -> IO Bool
has_autowrap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_has_autowrap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "has_autowrap" '[] (IO Bool) where
        nodeMethod = Godot.Core.Label.has_autowrap

{-# NOINLINE bindLabel_is_clipping_text #-}

-- | If @true@, the Label only shows the text that fits inside its bounding rectangle. It also lets you scale the node down freely.
bindLabel_is_clipping_text :: MethodBind
bindLabel_is_clipping_text
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "is_clipping_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the Label only shows the text that fits inside its bounding rectangle. It also lets you scale the node down freely.
is_clipping_text :: (Label :< cls, Object :< cls) => cls -> IO Bool
is_clipping_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_is_clipping_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "is_clipping_text" '[] (IO Bool) where
        nodeMethod = Godot.Core.Label.is_clipping_text

{-# NOINLINE bindLabel_is_uppercase #-}

-- | If @true@, all the text displays as UPPERCASE.
bindLabel_is_uppercase :: MethodBind
bindLabel_is_uppercase
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "is_uppercase" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, all the text displays as UPPERCASE.
is_uppercase :: (Label :< cls, Object :< cls) => cls -> IO Bool
is_uppercase cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_is_uppercase (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "is_uppercase" '[] (IO Bool) where
        nodeMethod = Godot.Core.Label.is_uppercase

{-# NOINLINE bindLabel_set_align #-}

-- | Controls the text's horizontal align. Supports left, center, right, and fill, or justify. Set it to one of the @enum Align@ constants.
bindLabel_set_align :: MethodBind
bindLabel_set_align
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_align" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's horizontal align. Supports left, center, right, and fill, or justify. Set it to one of the @enum Align@ constants.
set_align :: (Label :< cls, Object :< cls) => cls -> Int -> IO ()
set_align cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_align (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_align" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Label.set_align

{-# NOINLINE bindLabel_set_autowrap #-}

-- | If @true@, wraps the text inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text.
bindLabel_set_autowrap :: MethodBind
bindLabel_set_autowrap
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_autowrap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, wraps the text inside the node's bounding rectangle. If you resize the node, it will change its height automatically to show all the text.
set_autowrap ::
               (Label :< cls, Object :< cls) => cls -> Bool -> IO ()
set_autowrap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_autowrap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_autowrap" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Label.set_autowrap

{-# NOINLINE bindLabel_set_clip_text #-}

-- | If @true@, the Label only shows the text that fits inside its bounding rectangle. It also lets you scale the node down freely.
bindLabel_set_clip_text :: MethodBind
bindLabel_set_clip_text
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_clip_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the Label only shows the text that fits inside its bounding rectangle. It also lets you scale the node down freely.
set_clip_text ::
                (Label :< cls, Object :< cls) => cls -> Bool -> IO ()
set_clip_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_clip_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_clip_text" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Label.set_clip_text

{-# NOINLINE bindLabel_set_lines_skipped #-}

-- | The node ignores the first @lines_skipped@ lines before it starts to display text.
bindLabel_set_lines_skipped :: MethodBind
bindLabel_set_lines_skipped
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_lines_skipped" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node ignores the first @lines_skipped@ lines before it starts to display text.
set_lines_skipped ::
                    (Label :< cls, Object :< cls) => cls -> Int -> IO ()
set_lines_skipped cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_lines_skipped (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_lines_skipped" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Label.set_lines_skipped

{-# NOINLINE bindLabel_set_max_lines_visible #-}

-- | Limits the lines of text the node shows on screen.
bindLabel_set_max_lines_visible :: MethodBind
bindLabel_set_max_lines_visible
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_max_lines_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Limits the lines of text the node shows on screen.
set_max_lines_visible ::
                        (Label :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_lines_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_max_lines_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_max_lines_visible" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Label.set_max_lines_visible

{-# NOINLINE bindLabel_set_percent_visible #-}

-- | Limits the count of visible characters. If you set @percent_visible@ to 50, only up to half of the text's characters will display on screen. Useful to animate the text in a dialog box.
bindLabel_set_percent_visible :: MethodBind
bindLabel_set_percent_visible
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_percent_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Limits the count of visible characters. If you set @percent_visible@ to 50, only up to half of the text's characters will display on screen. Useful to animate the text in a dialog box.
set_percent_visible ::
                      (Label :< cls, Object :< cls) => cls -> Float -> IO ()
set_percent_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_percent_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_percent_visible" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Label.set_percent_visible

{-# NOINLINE bindLabel_set_text #-}

-- | The text to display on screen.
bindLabel_set_text :: MethodBind
bindLabel_set_text
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The text to display on screen.
set_text ::
           (Label :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_text (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_text" '[GodotString] (IO ()) where
        nodeMethod = Godot.Core.Label.set_text

{-# NOINLINE bindLabel_set_uppercase #-}

-- | If @true@, all the text displays as UPPERCASE.
bindLabel_set_uppercase :: MethodBind
bindLabel_set_uppercase
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_uppercase" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, all the text displays as UPPERCASE.
set_uppercase ::
                (Label :< cls, Object :< cls) => cls -> Bool -> IO ()
set_uppercase cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_uppercase (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_uppercase" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Label.set_uppercase

{-# NOINLINE bindLabel_set_valign #-}

-- | Controls the text's vertical align. Supports top, center, bottom, and fill. Set it to one of the @enum VAlign@ constants.
bindLabel_set_valign :: MethodBind
bindLabel_set_valign
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_valign" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the text's vertical align. Supports top, center, bottom, and fill. Set it to one of the @enum VAlign@ constants.
set_valign :: (Label :< cls, Object :< cls) => cls -> Int -> IO ()
set_valign cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_valign (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_valign" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Label.set_valign

{-# NOINLINE bindLabel_set_visible_characters #-}

-- | Restricts the number of characters to display. Set to -1 to disable.
bindLabel_set_visible_characters :: MethodBind
bindLabel_set_visible_characters
  = unsafePerformIO $
      withCString "Label" $
        \ clsNamePtr ->
          withCString "set_visible_characters" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Restricts the number of characters to display. Set to -1 to disable.
set_visible_characters ::
                         (Label :< cls, Object :< cls) => cls -> Int -> IO ()
set_visible_characters cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLabel_set_visible_characters
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Label "set_visible_characters" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Label.set_visible_characters