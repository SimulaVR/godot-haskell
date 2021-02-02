{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ShortCut
       (Godot.Core.ShortCut.get_as_text, Godot.Core.ShortCut.get_shortcut,
        Godot.Core.ShortCut.is_shortcut, Godot.Core.ShortCut.is_valid,
        Godot.Core.ShortCut.set_shortcut)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindShortCut_get_as_text #-}

-- | Returns the shortcut's [InputEvent] as a [String].
bindShortCut_get_as_text :: MethodBind
bindShortCut_get_as_text
  = unsafePerformIO $
      withCString "ShortCut" $
        \ clsNamePtr ->
          withCString "get_as_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shortcut's [InputEvent] as a [String].
get_as_text ::
              (ShortCut :< cls, Object :< cls) => cls -> IO GodotString
get_as_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShortCut_get_as_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShortCut_get_shortcut #-}

-- | The shortcut's [InputEvent].
--   			Generally the [InputEvent] is a keyboard key, though it can be any [InputEvent].
bindShortCut_get_shortcut :: MethodBind
bindShortCut_get_shortcut
  = unsafePerformIO $
      withCString "ShortCut" $
        \ clsNamePtr ->
          withCString "get_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shortcut's [InputEvent].
--   			Generally the [InputEvent] is a keyboard key, though it can be any [InputEvent].
get_shortcut ::
               (ShortCut :< cls, Object :< cls) => cls -> IO InputEvent
get_shortcut cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShortCut_get_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShortCut_is_shortcut #-}

-- | Returns [code]true[/code] if the shortcut's [InputEvent] equals [code]event[/code].
bindShortCut_is_shortcut :: MethodBind
bindShortCut_is_shortcut
  = unsafePerformIO $
      withCString "ShortCut" $
        \ clsNamePtr ->
          withCString "is_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the shortcut's [InputEvent] equals [code]event[/code].
is_shortcut ::
              (ShortCut :< cls, Object :< cls) => cls -> InputEvent -> IO Bool
is_shortcut cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShortCut_is_shortcut (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShortCut_is_valid #-}

-- | If [code]true[/code], this shortcut is valid.
bindShortCut_is_valid :: MethodBind
bindShortCut_is_valid
  = unsafePerformIO $
      withCString "ShortCut" $
        \ clsNamePtr ->
          withCString "is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this shortcut is valid.
is_valid :: (ShortCut :< cls, Object :< cls) => cls -> IO Bool
is_valid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShortCut_is_valid (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShortCut_set_shortcut #-}

-- | The shortcut's [InputEvent].
--   			Generally the [InputEvent] is a keyboard key, though it can be any [InputEvent].
bindShortCut_set_shortcut :: MethodBind
bindShortCut_set_shortcut
  = unsafePerformIO $
      withCString "ShortCut" $
        \ clsNamePtr ->
          withCString "set_shortcut" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shortcut's [InputEvent].
--   			Generally the [InputEvent] is a keyboard key, though it can be any [InputEvent].
set_shortcut ::
               (ShortCut :< cls, Object :< cls) => cls -> InputEvent -> IO ()
set_shortcut cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShortCut_set_shortcut (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)