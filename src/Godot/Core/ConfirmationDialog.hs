{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ConfirmationDialog
       (Godot.Core.ConfirmationDialog.get_cancel) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindConfirmationDialog_get_cancel #-}

-- | Return the cancel button.
bindConfirmationDialog_get_cancel :: MethodBind
bindConfirmationDialog_get_cancel
  = unsafePerformIO $
      withCString "ConfirmationDialog" $
        \ clsNamePtr ->
          withCString "get_cancel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the cancel button.
get_cancel ::
             (ConfirmationDialog :< cls, Object :< cls) => cls -> IO Button
get_cancel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfirmationDialog_get_cancel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)