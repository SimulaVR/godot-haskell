{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ProgressBar
       (Godot.Core.ProgressBar.is_percent_visible,
        Godot.Core.ProgressBar.set_percent_visible)
       where
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
import Godot.Core.Range()

instance NodeProperty ProgressBar "percent_visible" Bool 'False
         where
        nodeProperty
          = (is_percent_visible, wrapDroppingSetter set_percent_visible,
             Nothing)

{-# NOINLINE bindProgressBar_is_percent_visible #-}

-- | If @true@, the fill percentage is displayed on the bar.
bindProgressBar_is_percent_visible :: MethodBind
bindProgressBar_is_percent_visible
  = unsafePerformIO $
      withCString "ProgressBar" $
        \ clsNamePtr ->
          withCString "is_percent_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the fill percentage is displayed on the bar.
is_percent_visible ::
                     (ProgressBar :< cls, Object :< cls) => cls -> IO Bool
is_percent_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProgressBar_is_percent_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ProgressBar "is_percent_visible" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.ProgressBar.is_percent_visible

{-# NOINLINE bindProgressBar_set_percent_visible #-}

-- | If @true@, the fill percentage is displayed on the bar.
bindProgressBar_set_percent_visible :: MethodBind
bindProgressBar_set_percent_visible
  = unsafePerformIO $
      withCString "ProgressBar" $
        \ clsNamePtr ->
          withCString "set_percent_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the fill percentage is displayed on the bar.
set_percent_visible ::
                      (ProgressBar :< cls, Object :< cls) => cls -> Bool -> IO ()
set_percent_visible cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProgressBar_set_percent_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ProgressBar "set_percent_visible" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ProgressBar.set_percent_visible