{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Font
       (Godot.Core.Font.draw, Godot.Core.Font.get_ascent,
        Godot.Core.Font.get_descent, Godot.Core.Font.get_height,
        Godot.Core.Font.is_distance_field_hint,
        Godot.Core.Font.get_string_size, Godot.Core.Font.has_outline,
        Godot.Core.Font.draw_char, Godot.Core.Font.update_changes)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindFont_draw #-}

-- | Draw "string" into a canvas item using the font at a given position, with "modulate" color, and optionally clipping the width. "position" specifies the baseline, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis.
bindFont_draw :: MethodBind
bindFont_draw
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draw "string" into a canvas item using the font at a given position, with "modulate" color, and optionally clipping the width. "position" specifies the baseline, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis.
draw ::
       (Font :< cls, Object :< cls) =>
       cls ->
         Rid -> Vector2 -> GodotString -> Color -> Int -> Color -> IO ()
draw cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_draw (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFont_get_ascent #-}

-- | Return the font ascent (number of pixels above the baseline).
bindFont_get_ascent :: MethodBind
bindFont_get_ascent
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "get_ascent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the font ascent (number of pixels above the baseline).
get_ascent :: (Font :< cls, Object :< cls) => cls -> IO Float
get_ascent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_get_ascent (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFont_get_descent #-}

-- | Return the font descent (number of pixels below the baseline).
bindFont_get_descent :: MethodBind
bindFont_get_descent
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "get_descent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the font descent (number of pixels below the baseline).
get_descent :: (Font :< cls, Object :< cls) => cls -> IO Float
get_descent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_get_descent (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFont_get_height #-}

-- | Return the total font height (ascent plus descent) in pixels.
bindFont_get_height :: MethodBind
bindFont_get_height
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the total font height (ascent plus descent) in pixels.
get_height :: (Font :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_get_height (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFont_is_distance_field_hint #-}

bindFont_is_distance_field_hint :: MethodBind
bindFont_is_distance_field_hint
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "is_distance_field_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_distance_field_hint ::
                         (Font :< cls, Object :< cls) => cls -> IO Bool
is_distance_field_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_is_distance_field_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFont_get_string_size #-}

-- | Return the size of a string, taking kerning and advance into account.
bindFont_get_string_size :: MethodBind
bindFont_get_string_size
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "get_string_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the size of a string, taking kerning and advance into account.
get_string_size ::
                  (Font :< cls, Object :< cls) => cls -> GodotString -> IO Vector2
get_string_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_get_string_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFont_has_outline #-}

bindFont_has_outline :: MethodBind
bindFont_has_outline
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "has_outline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_outline :: (Font :< cls, Object :< cls) => cls -> IO Bool
has_outline cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_has_outline (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFont_draw_char #-}

-- | Draw character "char" into a canvas item using the font at a given position, with "modulate" color, and optionally kerning if "next" is passed. clipping the width. "position" specifies the baseline, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis. The width used by the character is returned, making this function useful for drawing strings character by character.
bindFont_draw_char :: MethodBind
bindFont_draw_char
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "draw_char" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draw character "char" into a canvas item using the font at a given position, with "modulate" color, and optionally kerning if "next" is passed. clipping the width. "position" specifies the baseline, not the top. To draw from the top, [i]ascent[/i] must be added to the Y axis. The width used by the character is returned, making this function useful for drawing strings character by character.
draw_char ::
            (Font :< cls, Object :< cls) =>
            cls -> Rid -> Vector2 -> Int -> Int -> Color -> Bool -> IO Float
draw_char cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_draw_char (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFont_update_changes #-}

-- | After editing a font (changing size, ascent, char rects, etc.). Call this function to propagate changes to controls that might use it.
bindFont_update_changes :: MethodBind
bindFont_update_changes
  = unsafePerformIO $
      withCString "Font" $
        \ clsNamePtr ->
          withCString "update_changes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | After editing a font (changing size, ascent, char rects, etc.). Call this function to propagate changes to controls that might use it.
update_changes :: (Font :< cls, Object :< cls) => cls -> IO ()
update_changes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFont_update_changes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)