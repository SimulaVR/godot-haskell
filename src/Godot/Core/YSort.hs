{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.YSort
       (Godot.Core.YSort.is_sort_enabled,
        Godot.Core.YSort.set_sort_enabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindYSort_is_sort_enabled #-}

-- | If [code]true[/code], child nodes are sorted, otherwise sorting is disabled.
bindYSort_is_sort_enabled :: MethodBind
bindYSort_is_sort_enabled
  = unsafePerformIO $
      withCString "YSort" $
        \ clsNamePtr ->
          withCString "is_sort_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], child nodes are sorted, otherwise sorting is disabled.
is_sort_enabled :: (YSort :< cls, Object :< cls) => cls -> IO Bool
is_sort_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindYSort_is_sort_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindYSort_set_sort_enabled #-}

-- | If [code]true[/code], child nodes are sorted, otherwise sorting is disabled.
bindYSort_set_sort_enabled :: MethodBind
bindYSort_set_sort_enabled
  = unsafePerformIO $
      withCString "YSort" $
        \ clsNamePtr ->
          withCString "set_sort_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], child nodes are sorted, otherwise sorting is disabled.
set_sort_enabled ::
                   (YSort :< cls, Object :< cls) => cls -> Bool -> IO ()
set_sort_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindYSort_set_sort_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)