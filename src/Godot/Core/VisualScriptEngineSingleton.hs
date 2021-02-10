{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptEngineSingleton
       (Godot.Core.VisualScriptEngineSingleton.get_singleton,
        Godot.Core.VisualScriptEngineSingleton.set_singleton)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptEngineSingleton_get_singleton #-}

bindVisualScriptEngineSingleton_get_singleton :: MethodBind
bindVisualScriptEngineSingleton_get_singleton
  = unsafePerformIO $
      withCString "VisualScriptEngineSingleton" $
        \ clsNamePtr ->
          withCString "get_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_singleton ::
                (VisualScriptEngineSingleton :< cls, Object :< cls) =>
                cls -> IO GodotString
get_singleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptEngineSingleton_get_singleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptEngineSingleton_set_singleton #-}

bindVisualScriptEngineSingleton_set_singleton :: MethodBind
bindVisualScriptEngineSingleton_set_singleton
  = unsafePerformIO $
      withCString "VisualScriptEngineSingleton" $
        \ clsNamePtr ->
          withCString "set_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_singleton ::
                (VisualScriptEngineSingleton :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_singleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptEngineSingleton_set_singleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)