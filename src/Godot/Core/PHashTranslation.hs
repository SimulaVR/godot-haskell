{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PHashTranslation
       (Godot.Core.PHashTranslation.generate) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPHashTranslation_generate #-}

-- | Generates and sets an optimized translation from the given [Translation] resource.
bindPHashTranslation_generate :: MethodBind
bindPHashTranslation_generate
  = unsafePerformIO $
      withCString "PHashTranslation" $
        \ clsNamePtr ->
          withCString "generate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates and sets an optimized translation from the given [Translation] resource.
generate ::
           (PHashTranslation :< cls, Object :< cls) =>
           cls -> Translation -> IO ()
generate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPHashTranslation_generate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)