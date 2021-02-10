{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RichTextEffect
       (Godot.Core.RichTextEffect._process_custom_fx) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRichTextEffect__process_custom_fx #-}

-- | Override this method to modify properties in [code]char_fx[/code]. The method must return [code]true[/code] if the character could be transformed successfully. If the method returns [code]false[/code], it will skip transformation to avoid displaying broken text.
bindRichTextEffect__process_custom_fx :: MethodBind
bindRichTextEffect__process_custom_fx
  = unsafePerformIO $
      withCString "RichTextEffect" $
        \ clsNamePtr ->
          withCString "_process_custom_fx" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override this method to modify properties in [code]char_fx[/code]. The method must return [code]true[/code] if the character could be transformed successfully. If the method returns [code]false[/code], it will skip transformation to avoid displaying broken text.
_process_custom_fx ::
                     (RichTextEffect :< cls, Object :< cls) =>
                     cls -> CharFXTransform -> IO Bool
_process_custom_fx cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRichTextEffect__process_custom_fx
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)