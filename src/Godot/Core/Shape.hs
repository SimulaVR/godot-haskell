{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Shape
       (Godot.Core.Shape.set_margin, Godot.Core.Shape.get_margin) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindShape_set_margin #-}

bindShape_set_margin :: MethodBind
bindShape_set_margin
  = unsafePerformIO $
      withCString "Shape" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_margin ::
             (Shape :< cls, Object :< cls) => cls -> Float -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape_set_margin (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShape_get_margin #-}

bindShape_get_margin :: MethodBind
bindShape_get_margin
  = unsafePerformIO $
      withCString "Shape" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_margin :: (Shape :< cls, Object :< cls) => cls -> IO Float
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape_get_margin (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)