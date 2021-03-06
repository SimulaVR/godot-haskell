{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CharFXTransform
       (Godot.Core.CharFXTransform.get_absolute_index,
        Godot.Core.CharFXTransform.get_character,
        Godot.Core.CharFXTransform.get_color,
        Godot.Core.CharFXTransform.get_elapsed_time,
        Godot.Core.CharFXTransform.get_environment,
        Godot.Core.CharFXTransform.get_offset,
        Godot.Core.CharFXTransform.get_relative_index,
        Godot.Core.CharFXTransform.is_visible,
        Godot.Core.CharFXTransform.set_absolute_index,
        Godot.Core.CharFXTransform.set_character,
        Godot.Core.CharFXTransform.set_color,
        Godot.Core.CharFXTransform.set_elapsed_time,
        Godot.Core.CharFXTransform.set_environment,
        Godot.Core.CharFXTransform.set_offset,
        Godot.Core.CharFXTransform.set_relative_index,
        Godot.Core.CharFXTransform.set_visibility)
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
import Godot.Core.Reference()

instance NodeProperty CharFXTransform "absolute_index" Int 'False
         where
        nodeProperty
          = (get_absolute_index, wrapDroppingSetter set_absolute_index,
             Nothing)

instance NodeProperty CharFXTransform "character" Int 'False where
        nodeProperty
          = (get_character, wrapDroppingSetter set_character, Nothing)

instance NodeProperty CharFXTransform "color" Color 'False where
        nodeProperty = (get_color, wrapDroppingSetter set_color, Nothing)

instance NodeProperty CharFXTransform "elapsed_time" Float 'False
         where
        nodeProperty
          = (get_elapsed_time, wrapDroppingSetter set_elapsed_time, Nothing)

instance NodeProperty CharFXTransform "env" Dictionary 'False where
        nodeProperty
          = (get_environment, wrapDroppingSetter set_environment, Nothing)

instance NodeProperty CharFXTransform "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty CharFXTransform "relative_index" Int 'False
         where
        nodeProperty
          = (get_relative_index, wrapDroppingSetter set_relative_index,
             Nothing)

instance NodeProperty CharFXTransform "visible" Bool 'False where
        nodeProperty
          = (is_visible, wrapDroppingSetter set_visibility, Nothing)

{-# NOINLINE bindCharFXTransform_get_absolute_index #-}

-- | The index of the current character (starting from 0). Setting this property won't affect drawing.
bindCharFXTransform_get_absolute_index :: MethodBind
bindCharFXTransform_get_absolute_index
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_absolute_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The index of the current character (starting from 0). Setting this property won't affect drawing.
get_absolute_index ::
                     (CharFXTransform :< cls, Object :< cls) => cls -> IO Int
get_absolute_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_absolute_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "get_absolute_index" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.CharFXTransform.get_absolute_index

{-# NOINLINE bindCharFXTransform_get_character #-}

-- | The Unicode codepoint the character will use. This only affects non-whitespace characters. @method @GDScript.ord@ can be useful here. For example, the following will replace all characters with asterisks:
--   			
--   @
--   
--   			# `char_fx` is the CharFXTransform parameter from `_process_custom_fx()`.
--   			# See the RichTextEffect documentation for details.
--   			char_fx.character = ord("*")
--   			
--   @
bindCharFXTransform_get_character :: MethodBind
bindCharFXTransform_get_character
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_character" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Unicode codepoint the character will use. This only affects non-whitespace characters. @method @GDScript.ord@ can be useful here. For example, the following will replace all characters with asterisks:
--   			
--   @
--   
--   			# `char_fx` is the CharFXTransform parameter from `_process_custom_fx()`.
--   			# See the RichTextEffect documentation for details.
--   			char_fx.character = ord("*")
--   			
--   @
get_character ::
                (CharFXTransform :< cls, Object :< cls) => cls -> IO Int
get_character cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_character
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "get_character" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CharFXTransform.get_character

{-# NOINLINE bindCharFXTransform_get_color #-}

-- | The color the character will be drawn with.
bindCharFXTransform_get_color :: MethodBind
bindCharFXTransform_get_color
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color the character will be drawn with.
get_color ::
            (CharFXTransform :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "get_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.CharFXTransform.get_color

{-# NOINLINE bindCharFXTransform_get_elapsed_time #-}

-- | The time elapsed since the @RichTextLabel@ was added to the scene tree (in seconds). Time stops when the project is paused, unless the @RichTextLabel@'s @Node.pause_mode@ is set to @Node.PAUSE_MODE_PROCESS@.
--   			__Note:__ Time still passes while the @RichTextLabel@ is hidden.
bindCharFXTransform_get_elapsed_time :: MethodBind
bindCharFXTransform_get_elapsed_time
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_elapsed_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time elapsed since the @RichTextLabel@ was added to the scene tree (in seconds). Time stops when the project is paused, unless the @RichTextLabel@'s @Node.pause_mode@ is set to @Node.PAUSE_MODE_PROCESS@.
--   			__Note:__ Time still passes while the @RichTextLabel@ is hidden.
get_elapsed_time ::
                   (CharFXTransform :< cls, Object :< cls) => cls -> IO Float
get_elapsed_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_elapsed_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "get_elapsed_time" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.CharFXTransform.get_elapsed_time

{-# NOINLINE bindCharFXTransform_get_environment #-}

-- | Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as @bool@, @int@ or @float@, they will be converted automatically. Color codes in the form @#rrggbb@ or @#rgb@ will be converted to an opaque @Color@. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
--   			For example, the opening BBCode tag @@example foo=hello bar=true baz=42 color=#ffffff@@ will map to the following @Dictionary@:
--   			
--   @
--   
--   			{"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
--   			
--   @
bindCharFXTransform_get_environment :: MethodBind
bindCharFXTransform_get_environment
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as @bool@, @int@ or @float@, they will be converted automatically. Color codes in the form @#rrggbb@ or @#rgb@ will be converted to an opaque @Color@. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
--   			For example, the opening BBCode tag @@example foo=hello bar=true baz=42 color=#ffffff@@ will map to the following @Dictionary@:
--   			
--   @
--   
--   			{"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
--   			
--   @
get_environment ::
                  (CharFXTransform :< cls, Object :< cls) => cls -> IO Dictionary
get_environment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "get_environment" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.CharFXTransform.get_environment

{-# NOINLINE bindCharFXTransform_get_offset #-}

-- | The position offset the character will be drawn with (in pixels).
bindCharFXTransform_get_offset :: MethodBind
bindCharFXTransform_get_offset
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The position offset the character will be drawn with (in pixels).
get_offset ::
             (CharFXTransform :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "get_offset" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.CharFXTransform.get_offset

{-# NOINLINE bindCharFXTransform_get_relative_index #-}

-- | The index of the current character (starting from 0). Setting this property won't affect drawing.
bindCharFXTransform_get_relative_index :: MethodBind
bindCharFXTransform_get_relative_index
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_relative_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The index of the current character (starting from 0). Setting this property won't affect drawing.
get_relative_index ::
                     (CharFXTransform :< cls, Object :< cls) => cls -> IO Int
get_relative_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_relative_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "get_relative_index" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.CharFXTransform.get_relative_index

{-# NOINLINE bindCharFXTransform_is_visible #-}

-- | If @true@, the character will be drawn. If @false@, the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their @color@ to @Color(1, 1, 1, 0)@ instead.
bindCharFXTransform_is_visible :: MethodBind
bindCharFXTransform_is_visible
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the character will be drawn. If @false@, the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their @color@ to @Color(1, 1, 1, 0)@ instead.
is_visible ::
             (CharFXTransform :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_is_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "is_visible" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CharFXTransform.is_visible

{-# NOINLINE bindCharFXTransform_set_absolute_index #-}

-- | The index of the current character (starting from 0). Setting this property won't affect drawing.
bindCharFXTransform_set_absolute_index :: MethodBind
bindCharFXTransform_set_absolute_index
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_absolute_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The index of the current character (starting from 0). Setting this property won't affect drawing.
set_absolute_index ::
                     (CharFXTransform :< cls, Object :< cls) => cls -> Int -> IO ()
set_absolute_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_absolute_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "set_absolute_index" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CharFXTransform.set_absolute_index

{-# NOINLINE bindCharFXTransform_set_character #-}

-- | The Unicode codepoint the character will use. This only affects non-whitespace characters. @method @GDScript.ord@ can be useful here. For example, the following will replace all characters with asterisks:
--   			
--   @
--   
--   			# `char_fx` is the CharFXTransform parameter from `_process_custom_fx()`.
--   			# See the RichTextEffect documentation for details.
--   			char_fx.character = ord("*")
--   			
--   @
bindCharFXTransform_set_character :: MethodBind
bindCharFXTransform_set_character
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_character" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Unicode codepoint the character will use. This only affects non-whitespace characters. @method @GDScript.ord@ can be useful here. For example, the following will replace all characters with asterisks:
--   			
--   @
--   
--   			# `char_fx` is the CharFXTransform parameter from `_process_custom_fx()`.
--   			# See the RichTextEffect documentation for details.
--   			char_fx.character = ord("*")
--   			
--   @
set_character ::
                (CharFXTransform :< cls, Object :< cls) => cls -> Int -> IO ()
set_character cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_character
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "set_character" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.CharFXTransform.set_character

{-# NOINLINE bindCharFXTransform_set_color #-}

-- | The color the character will be drawn with.
bindCharFXTransform_set_color :: MethodBind
bindCharFXTransform_set_color
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color the character will be drawn with.
set_color ::
            (CharFXTransform :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "set_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.CharFXTransform.set_color

{-# NOINLINE bindCharFXTransform_set_elapsed_time #-}

-- | The time elapsed since the @RichTextLabel@ was added to the scene tree (in seconds). Time stops when the project is paused, unless the @RichTextLabel@'s @Node.pause_mode@ is set to @Node.PAUSE_MODE_PROCESS@.
--   			__Note:__ Time still passes while the @RichTextLabel@ is hidden.
bindCharFXTransform_set_elapsed_time :: MethodBind
bindCharFXTransform_set_elapsed_time
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_elapsed_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time elapsed since the @RichTextLabel@ was added to the scene tree (in seconds). Time stops when the project is paused, unless the @RichTextLabel@'s @Node.pause_mode@ is set to @Node.PAUSE_MODE_PROCESS@.
--   			__Note:__ Time still passes while the @RichTextLabel@ is hidden.
set_elapsed_time ::
                   (CharFXTransform :< cls, Object :< cls) => cls -> Float -> IO ()
set_elapsed_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_elapsed_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "set_elapsed_time" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.CharFXTransform.set_elapsed_time

{-# NOINLINE bindCharFXTransform_set_environment #-}

-- | Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as @bool@, @int@ or @float@, they will be converted automatically. Color codes in the form @#rrggbb@ or @#rgb@ will be converted to an opaque @Color@. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
--   			For example, the opening BBCode tag @@example foo=hello bar=true baz=42 color=#ffffff@@ will map to the following @Dictionary@:
--   			
--   @
--   
--   			{"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
--   			
--   @
bindCharFXTransform_set_environment :: MethodBind
bindCharFXTransform_set_environment
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as @bool@, @int@ or @float@, they will be converted automatically. Color codes in the form @#rrggbb@ or @#rgb@ will be converted to an opaque @Color@. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
--   			For example, the opening BBCode tag @@example foo=hello bar=true baz=42 color=#ffffff@@ will map to the following @Dictionary@:
--   			
--   @
--   
--   			{"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
--   			
--   @
set_environment ::
                  (CharFXTransform :< cls, Object :< cls) =>
                  cls -> Dictionary -> IO ()
set_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "set_environment" '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.CharFXTransform.set_environment

{-# NOINLINE bindCharFXTransform_set_offset #-}

-- | The position offset the character will be drawn with (in pixels).
bindCharFXTransform_set_offset :: MethodBind
bindCharFXTransform_set_offset
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The position offset the character will be drawn with (in pixels).
set_offset ::
             (CharFXTransform :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "set_offset" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.CharFXTransform.set_offset

{-# NOINLINE bindCharFXTransform_set_relative_index #-}

-- | The index of the current character (starting from 0). Setting this property won't affect drawing.
bindCharFXTransform_set_relative_index :: MethodBind
bindCharFXTransform_set_relative_index
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_relative_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The index of the current character (starting from 0). Setting this property won't affect drawing.
set_relative_index ::
                     (CharFXTransform :< cls, Object :< cls) => cls -> Int -> IO ()
set_relative_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_relative_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "set_relative_index" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CharFXTransform.set_relative_index

{-# NOINLINE bindCharFXTransform_set_visibility #-}

-- | If @true@, the character will be drawn. If @false@, the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their @color@ to @Color(1, 1, 1, 0)@ instead.
bindCharFXTransform_set_visibility :: MethodBind
bindCharFXTransform_set_visibility
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_visibility" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the character will be drawn. If @false@, the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their @color@ to @Color(1, 1, 1, 0)@ instead.
set_visibility ::
                 (CharFXTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_visibility cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_visibility
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CharFXTransform "set_visibility" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CharFXTransform.set_visibility