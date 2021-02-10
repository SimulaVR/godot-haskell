{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TranslationServer
       (Godot.Core.TranslationServer.add_translation,
        Godot.Core.TranslationServer.clear,
        Godot.Core.TranslationServer.get_loaded_locales,
        Godot.Core.TranslationServer.get_locale,
        Godot.Core.TranslationServer.get_locale_name,
        Godot.Core.TranslationServer.remove_translation,
        Godot.Core.TranslationServer.set_locale,
        Godot.Core.TranslationServer.translate)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindTranslationServer_add_translation #-}

-- | Adds a [Translation] resource.
bindTranslationServer_add_translation :: MethodBind
bindTranslationServer_add_translation
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "add_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [Translation] resource.
add_translation ::
                  (TranslationServer :< cls, Object :< cls) =>
                  cls -> Translation -> IO ()
add_translation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_add_translation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslationServer_clear #-}

-- | Clears the server from all translations.
bindTranslationServer_clear :: MethodBind
bindTranslationServer_clear
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the server from all translations.
clear :: (TranslationServer :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslationServer_get_loaded_locales #-}

-- | Returns an Array of all loaded locales of the game.
bindTranslationServer_get_loaded_locales :: MethodBind
bindTranslationServer_get_loaded_locales
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_loaded_locales" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an Array of all loaded locales of the game.
get_loaded_locales ::
                     (TranslationServer :< cls, Object :< cls) => cls -> IO Array
get_loaded_locales cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_loaded_locales
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslationServer_get_locale #-}

-- | Returns the current locale of the game.
bindTranslationServer_get_locale :: MethodBind
bindTranslationServer_get_locale
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_locale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current locale of the game.
get_locale ::
             (TranslationServer :< cls, Object :< cls) => cls -> IO GodotString
get_locale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_locale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslationServer_get_locale_name #-}

-- | Returns a locale's language and its variant (e.g. [code]"en_US"[/code] would return [code]"English (United States)"[/code]).
bindTranslationServer_get_locale_name :: MethodBind
bindTranslationServer_get_locale_name
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "get_locale_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a locale's language and its variant (e.g. [code]"en_US"[/code] would return [code]"English (United States)"[/code]).
get_locale_name ::
                  (TranslationServer :< cls, Object :< cls) =>
                  cls -> GodotString -> IO GodotString
get_locale_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_get_locale_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslationServer_remove_translation #-}

-- | Removes the given translation from the server.
bindTranslationServer_remove_translation :: MethodBind
bindTranslationServer_remove_translation
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "remove_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given translation from the server.
remove_translation ::
                     (TranslationServer :< cls, Object :< cls) =>
                     cls -> Translation -> IO ()
remove_translation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_remove_translation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslationServer_set_locale #-}

-- | Sets the locale of the game.
bindTranslationServer_set_locale :: MethodBind
bindTranslationServer_set_locale
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "set_locale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the locale of the game.
set_locale ::
             (TranslationServer :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_locale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_set_locale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslationServer_translate #-}

-- | Returns the current locale's translation for the given message (key).
bindTranslationServer_translate :: MethodBind
bindTranslationServer_translate
  = unsafePerformIO $
      withCString "TranslationServer" $
        \ clsNamePtr ->
          withCString "translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current locale's translation for the given message (key).
translate ::
            (TranslationServer :< cls, Object :< cls) =>
            cls -> GodotString -> IO GodotString
translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslationServer_translate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)