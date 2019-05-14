{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.GridContainer
       (Godot.Core.GridContainer.set_columns,
        Godot.Core.GridContainer.get_columns)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindGridContainer_set_columns #-}

-- | The number of columns in the [code]GridContainer[/code]. If modified, [code]GridContainer[/code] reorders its children to accommodate the new layout.
bindGridContainer_set_columns :: MethodBind
bindGridContainer_set_columns
  = unsafePerformIO $
      withCString "GridContainer" $
        \ clsNamePtr ->
          withCString "set_columns" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the [code]GridContainer[/code]. If modified, [code]GridContainer[/code] reorders its children to accommodate the new layout.
set_columns ::
              (GridContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_columns cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridContainer_set_columns (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGridContainer_get_columns #-}

-- | The number of columns in the [code]GridContainer[/code]. If modified, [code]GridContainer[/code] reorders its children to accommodate the new layout.
bindGridContainer_get_columns :: MethodBind
bindGridContainer_get_columns
  = unsafePerformIO $
      withCString "GridContainer" $
        \ clsNamePtr ->
          withCString "get_columns" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the [code]GridContainer[/code]. If modified, [code]GridContainer[/code] reorders its children to accommodate the new layout.
get_columns ::
              (GridContainer :< cls, Object :< cls) => cls -> IO Int
get_columns cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGridContainer_get_columns (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)