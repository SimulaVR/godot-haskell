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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindCharFXTransform_get_character #-}

-- | The Unicode codepoint the character will use. This only affects non-whitespace characters. [method @GDScript.ord] can be useful here. For example, the following will replace all characters with asterisks:
--   			[codeblock]
--   			# `char_fx` is the CharFXTransform parameter from `_process_custom_fx()`.
--   			# See the RichTextEffect documentation for details.
--   			char_fx.character = ord("*")
--   			[/codeblock]
bindCharFXTransform_get_character :: MethodBind
bindCharFXTransform_get_character
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_character" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Unicode codepoint the character will use. This only affects non-whitespace characters. [method @GDScript.ord] can be useful here. For example, the following will replace all characters with asterisks:
--   			[codeblock]
--   			# `char_fx` is the CharFXTransform parameter from `_process_custom_fx()`.
--   			# See the RichTextEffect documentation for details.
--   			char_fx.character = ord("*")
--   			[/codeblock]
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

{-# NOINLINE bindCharFXTransform_get_elapsed_time #-}

-- | The time elapsed since the [RichTextLabel] was added to the scene tree (in seconds). Time stops when the project is paused, unless the [RichTextLabel]'s [member Node.pause_mode] is set to [constant Node.PAUSE_MODE_PROCESS].
--   			[b]Note:[/b] Time still passes while the [RichTextLabel] is hidden.
bindCharFXTransform_get_elapsed_time :: MethodBind
bindCharFXTransform_get_elapsed_time
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_elapsed_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time elapsed since the [RichTextLabel] was added to the scene tree (in seconds). Time stops when the project is paused, unless the [RichTextLabel]'s [member Node.pause_mode] is set to [constant Node.PAUSE_MODE_PROCESS].
--   			[b]Note:[/b] Time still passes while the [RichTextLabel] is hidden.
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

{-# NOINLINE bindCharFXTransform_get_environment #-}

-- | Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as [bool], [int] or [float], they will be converted automatically. Color codes in the form [code]#rrggbb[/code] or [code]#rgb[/code] will be converted to an opaque [Color]. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
--   			For example, the opening BBCode tag [code][example foo=hello bar=true baz=42 color=#ffffff][/code] will map to the following [Dictionary]:
--   			[codeblock]
--   			{"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
--   			[/codeblock]
bindCharFXTransform_get_environment :: MethodBind
bindCharFXTransform_get_environment
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as [bool], [int] or [float], they will be converted automatically. Color codes in the form [code]#rrggbb[/code] or [code]#rgb[/code] will be converted to an opaque [Color]. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
--   			For example, the opening BBCode tag [code][example foo=hello bar=true baz=42 color=#ffffff][/code] will map to the following [Dictionary]:
--   			[codeblock]
--   			{"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
--   			[/codeblock]
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

{-# NOINLINE bindCharFXTransform_is_visible #-}

-- | If [code]true[/code], the character will be drawn. If [code]false[/code], the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their [member color] to [code]Color(1, 1, 1, 0)[/code] instead.
bindCharFXTransform_is_visible :: MethodBind
bindCharFXTransform_is_visible
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the character will be drawn. If [code]false[/code], the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their [member color] to [code]Color(1, 1, 1, 0)[/code] instead.
is_visible ::
             (CharFXTransform :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_is_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindCharFXTransform_set_character #-}

-- | The Unicode codepoint the character will use. This only affects non-whitespace characters. [method @GDScript.ord] can be useful here. For example, the following will replace all characters with asterisks:
--   			[codeblock]
--   			# `char_fx` is the CharFXTransform parameter from `_process_custom_fx()`.
--   			# See the RichTextEffect documentation for details.
--   			char_fx.character = ord("*")
--   			[/codeblock]
bindCharFXTransform_set_character :: MethodBind
bindCharFXTransform_set_character
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_character" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Unicode codepoint the character will use. This only affects non-whitespace characters. [method @GDScript.ord] can be useful here. For example, the following will replace all characters with asterisks:
--   			[codeblock]
--   			# `char_fx` is the CharFXTransform parameter from `_process_custom_fx()`.
--   			# See the RichTextEffect documentation for details.
--   			char_fx.character = ord("*")
--   			[/codeblock]
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

{-# NOINLINE bindCharFXTransform_set_elapsed_time #-}

-- | The time elapsed since the [RichTextLabel] was added to the scene tree (in seconds). Time stops when the project is paused, unless the [RichTextLabel]'s [member Node.pause_mode] is set to [constant Node.PAUSE_MODE_PROCESS].
--   			[b]Note:[/b] Time still passes while the [RichTextLabel] is hidden.
bindCharFXTransform_set_elapsed_time :: MethodBind
bindCharFXTransform_set_elapsed_time
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_elapsed_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time elapsed since the [RichTextLabel] was added to the scene tree (in seconds). Time stops when the project is paused, unless the [RichTextLabel]'s [member Node.pause_mode] is set to [constant Node.PAUSE_MODE_PROCESS].
--   			[b]Note:[/b] Time still passes while the [RichTextLabel] is hidden.
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

{-# NOINLINE bindCharFXTransform_set_environment #-}

-- | Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as [bool], [int] or [float], they will be converted automatically. Color codes in the form [code]#rrggbb[/code] or [code]#rgb[/code] will be converted to an opaque [Color]. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
--   			For example, the opening BBCode tag [code][example foo=hello bar=true baz=42 color=#ffffff][/code] will map to the following [Dictionary]:
--   			[codeblock]
--   			{"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
--   			[/codeblock]
bindCharFXTransform_set_environment :: MethodBind
bindCharFXTransform_set_environment
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Contains the arguments passed in the opening BBCode tag. By default, arguments are strings; if their contents match a type such as [bool], [int] or [float], they will be converted automatically. Color codes in the form [code]#rrggbb[/code] or [code]#rgb[/code] will be converted to an opaque [Color]. String arguments may not contain spaces, even if they're quoted. If present, quotes will also be present in the final string.
--   			For example, the opening BBCode tag [code][example foo=hello bar=true baz=42 color=#ffffff][/code] will map to the following [Dictionary]:
--   			[codeblock]
--   			{"foo": "hello", "bar": true, "baz": 42, "color": Color(1, 1, 1, 1)}
--   			[/codeblock]
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

{-# NOINLINE bindCharFXTransform_set_visibility #-}

-- | If [code]true[/code], the character will be drawn. If [code]false[/code], the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their [member color] to [code]Color(1, 1, 1, 0)[/code] instead.
bindCharFXTransform_set_visibility :: MethodBind
bindCharFXTransform_set_visibility
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_visibility" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the character will be drawn. If [code]false[/code], the character will be hidden. Characters around hidden characters will reflow to take the space of hidden characters. If this is not desired, set their [member color] to [code]Color(1, 1, 1, 0)[/code] instead.
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