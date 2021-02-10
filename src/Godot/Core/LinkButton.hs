{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.LinkButton
       (Godot.Core.LinkButton._UNDERLINE_MODE_ALWAYS,
        Godot.Core.LinkButton._UNDERLINE_MODE_NEVER,
        Godot.Core.LinkButton._UNDERLINE_MODE_ON_HOVER,
        Godot.Core.LinkButton.get_text,
        Godot.Core.LinkButton.get_underline_mode,
        Godot.Core.LinkButton.set_text,
        Godot.Core.LinkButton.set_underline_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_UNDERLINE_MODE_ALWAYS :: Int
_UNDERLINE_MODE_ALWAYS = 0

_UNDERLINE_MODE_NEVER :: Int
_UNDERLINE_MODE_NEVER = 2

_UNDERLINE_MODE_ON_HOVER :: Int
_UNDERLINE_MODE_ON_HOVER = 1

{-# NOINLINE bindLinkButton_get_text #-}

-- | The button's text that will be displayed inside the button's area.
bindLinkButton_get_text :: MethodBind
bindLinkButton_get_text
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "get_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's text that will be displayed inside the button's area.
get_text ::
           (LinkButton :< cls, Object :< cls) => cls -> IO GodotString
get_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_get_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLinkButton_get_underline_mode #-}

-- | Determines when to show the underline. See [enum UnderlineMode] for options.
bindLinkButton_get_underline_mode :: MethodBind
bindLinkButton_get_underline_mode
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "get_underline_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines when to show the underline. See [enum UnderlineMode] for options.
get_underline_mode ::
                     (LinkButton :< cls, Object :< cls) => cls -> IO Int
get_underline_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_get_underline_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLinkButton_set_text #-}

-- | The button's text that will be displayed inside the button's area.
bindLinkButton_set_text :: MethodBind
bindLinkButton_set_text
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "set_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The button's text that will be displayed inside the button's area.
set_text ::
           (LinkButton :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_set_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLinkButton_set_underline_mode #-}

-- | Determines when to show the underline. See [enum UnderlineMode] for options.
bindLinkButton_set_underline_mode :: MethodBind
bindLinkButton_set_underline_mode
  = unsafePerformIO $
      withCString "LinkButton" $
        \ clsNamePtr ->
          withCString "set_underline_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines when to show the underline. See [enum UnderlineMode] for options.
set_underline_mode ::
                     (LinkButton :< cls, Object :< cls) => cls -> Int -> IO ()
set_underline_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLinkButton_set_underline_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)