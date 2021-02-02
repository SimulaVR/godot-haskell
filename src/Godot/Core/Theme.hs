{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Theme
       (Godot.Core.Theme._emit_theme_changed, Godot.Core.Theme.clear,
        Godot.Core.Theme.clear_color, Godot.Core.Theme.clear_constant,
        Godot.Core.Theme.clear_font, Godot.Core.Theme.clear_icon,
        Godot.Core.Theme.clear_stylebox,
        Godot.Core.Theme.copy_default_theme, Godot.Core.Theme.copy_theme,
        Godot.Core.Theme.get_color, Godot.Core.Theme.get_color_list,
        Godot.Core.Theme.get_constant, Godot.Core.Theme.get_constant_list,
        Godot.Core.Theme.get_default_font, Godot.Core.Theme.get_font,
        Godot.Core.Theme.get_font_list, Godot.Core.Theme.get_icon,
        Godot.Core.Theme.get_icon_list, Godot.Core.Theme.get_stylebox,
        Godot.Core.Theme.get_stylebox_list,
        Godot.Core.Theme.get_stylebox_types,
        Godot.Core.Theme.get_type_list, Godot.Core.Theme.has_color,
        Godot.Core.Theme.has_constant, Godot.Core.Theme.has_font,
        Godot.Core.Theme.has_icon, Godot.Core.Theme.has_stylebox,
        Godot.Core.Theme.set_color, Godot.Core.Theme.set_constant,
        Godot.Core.Theme.set_default_font, Godot.Core.Theme.set_font,
        Godot.Core.Theme.set_icon, Godot.Core.Theme.set_stylebox)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindTheme__emit_theme_changed #-}

bindTheme__emit_theme_changed :: MethodBind
bindTheme__emit_theme_changed
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "_emit_theme_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_emit_theme_changed ::
                      (Theme :< cls, Object :< cls) => cls -> IO ()
_emit_theme_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme__emit_theme_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_clear #-}

bindTheme_clear :: MethodBind
bindTheme_clear
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (Theme :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_clear_color #-}

-- | Clears theme [Color] at [code]name[/code] if Theme has [code]type[/code].
bindTheme_clear_color :: MethodBind
bindTheme_clear_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears theme [Color] at [code]name[/code] if Theme has [code]type[/code].
clear_color ::
              (Theme :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> IO ()
clear_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_clear_constant #-}

-- | Clears theme constant at [code]name[/code] if Theme has [code]type[/code].
bindTheme_clear_constant :: MethodBind
bindTheme_clear_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears theme constant at [code]name[/code] if Theme has [code]type[/code].
clear_constant ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> IO ()
clear_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_constant (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_clear_font #-}

-- | Clears [Font] at [code]name[/code] if Theme has [code]type[/code].
bindTheme_clear_font :: MethodBind
bindTheme_clear_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears [Font] at [code]name[/code] if Theme has [code]type[/code].
clear_font ::
             (Theme :< cls, Object :< cls) =>
             cls -> GodotString -> GodotString -> IO ()
clear_font cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_font (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_clear_icon #-}

-- | Clears icon at [code]name[/code] if Theme has [code]type[/code].
bindTheme_clear_icon :: MethodBind
bindTheme_clear_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears icon at [code]name[/code] if Theme has [code]type[/code].
clear_icon ::
             (Theme :< cls, Object :< cls) =>
             cls -> GodotString -> GodotString -> IO ()
clear_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_icon (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_clear_stylebox #-}

-- | Clears [StyleBox] at [code]name[/code] if Theme has [code]type[/code].
bindTheme_clear_stylebox :: MethodBind
bindTheme_clear_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "clear_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears [StyleBox] at [code]name[/code] if Theme has [code]type[/code].
clear_stylebox ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> IO ()
clear_stylebox cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_clear_stylebox (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_copy_default_theme #-}

-- | Sets theme values to a copy of the default theme values.
bindTheme_copy_default_theme :: MethodBind
bindTheme_copy_default_theme
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "copy_default_theme" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets theme values to a copy of the default theme values.
copy_default_theme :: (Theme :< cls, Object :< cls) => cls -> IO ()
copy_default_theme cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_copy_default_theme (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_copy_theme #-}

bindTheme_copy_theme :: MethodBind
bindTheme_copy_theme
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "copy_theme" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

copy_theme ::
             (Theme :< cls, Object :< cls) => cls -> Theme -> IO ()
copy_theme cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_copy_theme (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_color #-}

-- | Returns the [Color] at [code]name[/code] if Theme has [code]type[/code].
bindTheme_get_color :: MethodBind
bindTheme_get_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Color] at [code]name[/code] if Theme has [code]type[/code].
get_color ::
            (Theme :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> IO Color
get_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_color (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_color_list #-}

-- | Returns all of the [Color]s as a [PoolStringArray] filled with each [Color]'s name, for use in [method get_color], if Theme has [code]type[/code].
bindTheme_get_color_list :: MethodBind
bindTheme_get_color_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_color_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all of the [Color]s as a [PoolStringArray] filled with each [Color]'s name, for use in [method get_color], if Theme has [code]type[/code].
get_color_list ::
                 (Theme :< cls, Object :< cls) =>
                 cls -> GodotString -> IO PoolStringArray
get_color_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_color_list (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_constant #-}

-- | Returns the constant at [code]name[/code] if Theme has [code]type[/code].
bindTheme_get_constant :: MethodBind
bindTheme_get_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the constant at [code]name[/code] if Theme has [code]type[/code].
get_constant ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Int
get_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_constant (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_constant_list #-}

-- | Returns all of the constants as a [PoolStringArray] filled with each constant's name, for use in [method get_constant], if Theme has [code]type[/code].
bindTheme_get_constant_list :: MethodBind
bindTheme_get_constant_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_constant_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all of the constants as a [PoolStringArray] filled with each constant's name, for use in [method get_constant], if Theme has [code]type[/code].
get_constant_list ::
                    (Theme :< cls, Object :< cls) =>
                    cls -> GodotString -> IO PoolStringArray
get_constant_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_constant_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_default_font #-}

-- | The theme's default font.
bindTheme_get_default_font :: MethodBind
bindTheme_get_default_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_default_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The theme's default font.
get_default_font :: (Theme :< cls, Object :< cls) => cls -> IO Font
get_default_font cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_default_font (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_font #-}

-- | Returns the [Font] at [code]name[/code] if Theme has [code]type[/code].
bindTheme_get_font :: MethodBind
bindTheme_get_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Font] at [code]name[/code] if Theme has [code]type[/code].
get_font ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Font
get_font cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_font (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_font_list #-}

-- | Returns all of the [Font]s as a [PoolStringArray] filled with each [Font]'s name, for use in [method get_font], if Theme has [code]type[/code].
bindTheme_get_font_list :: MethodBind
bindTheme_get_font_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_font_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all of the [Font]s as a [PoolStringArray] filled with each [Font]'s name, for use in [method get_font], if Theme has [code]type[/code].
get_font_list ::
                (Theme :< cls, Object :< cls) =>
                cls -> GodotString -> IO PoolStringArray
get_font_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_font_list (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_icon #-}

-- | Returns the icon [Texture] at [code]name[/code] if Theme has [code]type[/code].
bindTheme_get_icon :: MethodBind
bindTheme_get_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon [Texture] at [code]name[/code] if Theme has [code]type[/code].
get_icon ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Texture
get_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_icon (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_icon_list #-}

-- | Returns all of the icons as a [PoolStringArray] filled with each [Texture]'s name, for use in [method get_icon], if Theme has [code]type[/code].
bindTheme_get_icon_list :: MethodBind
bindTheme_get_icon_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_icon_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all of the icons as a [PoolStringArray] filled with each [Texture]'s name, for use in [method get_icon], if Theme has [code]type[/code].
get_icon_list ::
                (Theme :< cls, Object :< cls) =>
                cls -> GodotString -> IO PoolStringArray
get_icon_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_icon_list (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_stylebox #-}

-- | Returns the icon [StyleBox] at [code]name[/code] if Theme has [code]type[/code].
bindTheme_get_stylebox :: MethodBind
bindTheme_get_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the icon [StyleBox] at [code]name[/code] if Theme has [code]type[/code].
get_stylebox ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO StyleBox
get_stylebox cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_stylebox (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_stylebox_list #-}

-- | Returns all of the [StyleBox]s as a [PoolStringArray] filled with each [StyleBox]'s name, for use in [method get_stylebox], if Theme has [code]type[/code].
bindTheme_get_stylebox_list :: MethodBind
bindTheme_get_stylebox_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_stylebox_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all of the [StyleBox]s as a [PoolStringArray] filled with each [StyleBox]'s name, for use in [method get_stylebox], if Theme has [code]type[/code].
get_stylebox_list ::
                    (Theme :< cls, Object :< cls) =>
                    cls -> GodotString -> IO PoolStringArray
get_stylebox_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_stylebox_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_stylebox_types #-}

-- | Returns all of the [StyleBox] types as a [PoolStringArray] filled with each [StyleBox]'s type, for use in [method get_stylebox] and/or [method get_stylebox_list], if Theme has [code]type[/code].
bindTheme_get_stylebox_types :: MethodBind
bindTheme_get_stylebox_types
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_stylebox_types" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all of the [StyleBox] types as a [PoolStringArray] filled with each [StyleBox]'s type, for use in [method get_stylebox] and/or [method get_stylebox_list], if Theme has [code]type[/code].
get_stylebox_types ::
                     (Theme :< cls, Object :< cls) => cls -> IO PoolStringArray
get_stylebox_types cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_stylebox_types (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_get_type_list #-}

-- | Returns all of the types in [code]type[/code] as a [PoolStringArray] for use in any of the get_* functions, if Theme has [code]type[/code].
bindTheme_get_type_list :: MethodBind
bindTheme_get_type_list
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "get_type_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all of the types in [code]type[/code] as a [PoolStringArray] for use in any of the get_* functions, if Theme has [code]type[/code].
get_type_list ::
                (Theme :< cls, Object :< cls) =>
                cls -> GodotString -> IO PoolStringArray
get_type_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_get_type_list (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_has_color #-}

-- | Returns [code]true[/code] if [Color] with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
bindTheme_has_color :: MethodBind
bindTheme_has_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if [Color] with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
has_color ::
            (Theme :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> IO Bool
has_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_color (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_has_constant #-}

-- | Returns [code]true[/code] if constant with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
bindTheme_has_constant :: MethodBind
bindTheme_has_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if constant with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
has_constant ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Bool
has_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_constant (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_has_font #-}

-- | Returns [code]true[/code] if [Font] with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
bindTheme_has_font :: MethodBind
bindTheme_has_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if [Font] with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
has_font ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Bool
has_font cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_font (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_has_icon #-}

-- | Returns [code]true[/code] if icon [Texture] with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
bindTheme_has_icon :: MethodBind
bindTheme_has_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if icon [Texture] with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
has_icon ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Bool
has_icon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_icon (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_has_stylebox #-}

-- | Returns [code]true[/code] if [StyleBox] with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
bindTheme_has_stylebox :: MethodBind
bindTheme_has_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "has_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if [StyleBox] with [code]name[/code] is in [code]type[/code].
--   				Returns [code]false[/code] if Theme does not have [code]type[/code].
has_stylebox ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> IO Bool
has_stylebox cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_has_stylebox (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_set_color #-}

-- | Sets Theme's [Color] to [code]color[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
bindTheme_set_color :: MethodBind
bindTheme_set_color
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets Theme's [Color] to [code]color[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
set_color ::
            (Theme :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> Color -> IO ()
set_color cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_color (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_set_constant #-}

-- | Sets Theme's constant to [code]constant[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
bindTheme_set_constant :: MethodBind
bindTheme_set_constant
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets Theme's constant to [code]constant[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
set_constant ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> Int -> IO ()
set_constant cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_constant (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_set_default_font #-}

-- | The theme's default font.
bindTheme_set_default_font :: MethodBind
bindTheme_set_default_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_default_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The theme's default font.
set_default_font ::
                   (Theme :< cls, Object :< cls) => cls -> Font -> IO ()
set_default_font cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_default_font (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_set_font #-}

-- | Sets Theme's [Font] to [code]font[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
bindTheme_set_font :: MethodBind
bindTheme_set_font
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_font" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets Theme's [Font] to [code]font[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
set_font ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> Font -> IO ()
set_font cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_font (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_set_icon #-}

-- | Sets Theme's icon [Texture] to [code]texture[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
bindTheme_set_icon :: MethodBind
bindTheme_set_icon
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets Theme's icon [Texture] to [code]texture[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
set_icon ::
           (Theme :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> Texture -> IO ()
set_icon cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_icon (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTheme_set_stylebox #-}

-- | Sets Theme's [StyleBox] to [code]stylebox[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
bindTheme_set_stylebox :: MethodBind
bindTheme_set_stylebox
  = unsafePerformIO $
      withCString "Theme" $
        \ clsNamePtr ->
          withCString "set_stylebox" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets Theme's [StyleBox] to [code]stylebox[/code] at [code]name[/code] in [code]type[/code].
--   				Does nothing if Theme does not have [code]type[/code].
set_stylebox ::
               (Theme :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> StyleBox -> IO ()
set_stylebox cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTheme_set_stylebox (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)