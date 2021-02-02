{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CenterContainer
       (Godot.Core.CenterContainer.is_using_top_left,
        Godot.Core.CenterContainer.set_use_top_left)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCenterContainer_is_using_top_left #-}

-- | If [code]true[/code], centers children relative to the [code]CenterContainer[/code]'s top left corner. Default value: [code]false[/code].
bindCenterContainer_is_using_top_left :: MethodBind
bindCenterContainer_is_using_top_left
  = unsafePerformIO $
      withCString "CenterContainer" $
        \ clsNamePtr ->
          withCString "is_using_top_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], centers children relative to the [code]CenterContainer[/code]'s top left corner. Default value: [code]false[/code].
is_using_top_left ::
                    (CenterContainer :< cls, Object :< cls) => cls -> IO Bool
is_using_top_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCenterContainer_is_using_top_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCenterContainer_set_use_top_left #-}

-- | If [code]true[/code], centers children relative to the [code]CenterContainer[/code]'s top left corner. Default value: [code]false[/code].
bindCenterContainer_set_use_top_left :: MethodBind
bindCenterContainer_set_use_top_left
  = unsafePerformIO $
      withCString "CenterContainer" $
        \ clsNamePtr ->
          withCString "set_use_top_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], centers children relative to the [code]CenterContainer[/code]'s top left corner. Default value: [code]false[/code].
set_use_top_left ::
                   (CenterContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_top_left cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCenterContainer_set_use_top_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)