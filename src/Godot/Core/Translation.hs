{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Translation
       (Godot.Core.Translation._get_messages,
        Godot.Core.Translation._set_messages,
        Godot.Core.Translation.add_message,
        Godot.Core.Translation.erase_message,
        Godot.Core.Translation.get_locale,
        Godot.Core.Translation.get_message,
        Godot.Core.Translation.get_message_count,
        Godot.Core.Translation.get_message_list,
        Godot.Core.Translation.set_locale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindTranslation__get_messages #-}

bindTranslation__get_messages :: MethodBind
bindTranslation__get_messages
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "_get_messages" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_messages ::
                (Translation :< cls, Object :< cls) => cls -> IO PoolStringArray
_get_messages cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation__get_messages (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslation__set_messages #-}

bindTranslation__set_messages :: MethodBind
bindTranslation__set_messages
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "_set_messages" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_messages ::
                (Translation :< cls, Object :< cls) =>
                cls -> PoolStringArray -> IO ()
_set_messages cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation__set_messages (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslation_add_message #-}

-- | Adds a message if nonexistent, followed by its translation.
bindTranslation_add_message :: MethodBind
bindTranslation_add_message
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "add_message" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a message if nonexistent, followed by its translation.
add_message ::
              (Translation :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> IO ()
add_message cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation_add_message (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslation_erase_message #-}

-- | Erases a message.
bindTranslation_erase_message :: MethodBind
bindTranslation_erase_message
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "erase_message" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Erases a message.
erase_message ::
                (Translation :< cls, Object :< cls) => cls -> GodotString -> IO ()
erase_message cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation_erase_message (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslation_get_locale #-}

-- | The locale of the translation.
bindTranslation_get_locale :: MethodBind
bindTranslation_get_locale
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "get_locale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The locale of the translation.
get_locale ::
             (Translation :< cls, Object :< cls) => cls -> IO GodotString
get_locale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation_get_locale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslation_get_message #-}

-- | Returns a message's translation.
bindTranslation_get_message :: MethodBind
bindTranslation_get_message
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "get_message" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a message's translation.
get_message ::
              (Translation :< cls, Object :< cls) =>
              cls -> GodotString -> IO GodotString
get_message cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation_get_message (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslation_get_message_count #-}

-- | Returns the number of existing messages.
bindTranslation_get_message_count :: MethodBind
bindTranslation_get_message_count
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "get_message_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of existing messages.
get_message_count ::
                    (Translation :< cls, Object :< cls) => cls -> IO Int
get_message_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation_get_message_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslation_get_message_list #-}

-- | Returns all the messages (keys).
bindTranslation_get_message_list :: MethodBind
bindTranslation_get_message_list
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "get_message_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the messages (keys).
get_message_list ::
                   (Translation :< cls, Object :< cls) => cls -> IO PoolStringArray
get_message_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation_get_message_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTranslation_set_locale #-}

-- | The locale of the translation.
bindTranslation_set_locale :: MethodBind
bindTranslation_set_locale
  = unsafePerformIO $
      withCString "Translation" $
        \ clsNamePtr ->
          withCString "set_locale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The locale of the translation.
set_locale ::
             (Translation :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_locale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTranslation_set_locale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)