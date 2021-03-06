{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ConfirmationDialog
       (Godot.Core.ConfirmationDialog.get_cancel) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.AcceptDialog()

{-# NOINLINE bindConfirmationDialog_get_cancel #-}

-- | Returns the cancel button.
bindConfirmationDialog_get_cancel :: MethodBind
bindConfirmationDialog_get_cancel
  = unsafePerformIO $
      withCString "ConfirmationDialog" $
        \ clsNamePtr ->
          withCString "get_cancel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cancel button.
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

instance NodeMethod ConfirmationDialog "get_cancel" '[] (IO Button)
         where
        nodeMethod = Godot.Core.ConfirmationDialog.get_cancel