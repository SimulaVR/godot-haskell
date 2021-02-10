{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeIs
       (Godot.Core.VisualShaderNodeIs._FUNC_IS_NAN,
        Godot.Core.VisualShaderNodeIs._FUNC_IS_INF,
        Godot.Core.VisualShaderNodeIs.get_function,
        Godot.Core.VisualShaderNodeIs.set_function)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FUNC_IS_NAN :: Int
_FUNC_IS_NAN = 1

_FUNC_IS_INF :: Int
_FUNC_IS_INF = 0

{-# NOINLINE bindVisualShaderNodeIs_get_function #-}

-- | The comparison function. See [enum Function] for options.
bindVisualShaderNodeIs_get_function :: MethodBind
bindVisualShaderNodeIs_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeIs" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The comparison function. See [enum Function] for options.
get_function ::
               (VisualShaderNodeIs :< cls, Object :< cls) => cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeIs_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeIs_set_function #-}

-- | The comparison function. See [enum Function] for options.
bindVisualShaderNodeIs_set_function :: MethodBind
bindVisualShaderNodeIs_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeIs" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The comparison function. See [enum Function] for options.
set_function ::
               (VisualShaderNodeIs :< cls, Object :< cls) => cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeIs_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)