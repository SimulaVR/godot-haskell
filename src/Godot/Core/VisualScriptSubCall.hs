{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptSubCall
       (Godot.Core.VisualScriptSubCall._subcall) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptSubCall__subcall #-}

bindVisualScriptSubCall__subcall :: MethodBind
bindVisualScriptSubCall__subcall
  = unsafePerformIO $
      withCString "VisualScriptSubCall" $
        \ clsNamePtr ->
          withCString "_subcall" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_subcall ::
           (VisualScriptSubCall :< cls, Object :< cls) =>
           cls -> GodotVariant -> IO GodotVariant
_subcall cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSubCall__subcall
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)