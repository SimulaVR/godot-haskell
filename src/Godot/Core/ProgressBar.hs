{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ProgressBar
       (Godot.Core.ProgressBar.set_percent_visible,
        Godot.Core.ProgressBar.is_percent_visible)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindProgressBar_set_percent_visible #-}

-- | If [code]true[/code], the fill percentage is displayed on the bar. Default value: [code]true[/code].
bindProgressBar_set_percent_visible :: MethodBind
bindProgressBar_set_percent_visible
  = unsafePerformIO $
      withCString "ProgressBar" $
        \ clsNamePtr ->
          withCString "set_percent_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the fill percentage is displayed on the bar. Default value: [code]true[/code].
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

{-# NOINLINE bindProgressBar_is_percent_visible #-}

-- | If [code]true[/code], the fill percentage is displayed on the bar. Default value: [code]true[/code].
bindProgressBar_is_percent_visible :: MethodBind
bindProgressBar_is_percent_visible
  = unsafePerformIO $
      withCString "ProgressBar" $
        \ clsNamePtr ->
          withCString "is_percent_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the fill percentage is displayed on the bar. Default value: [code]true[/code].
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