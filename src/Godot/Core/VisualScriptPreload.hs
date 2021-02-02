{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptPreload
       (Godot.Core.VisualScriptPreload.get_preload,
        Godot.Core.VisualScriptPreload.set_preload)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptPreload_get_preload #-}

bindVisualScriptPreload_get_preload :: MethodBind
bindVisualScriptPreload_get_preload
  = unsafePerformIO $
      withCString "VisualScriptPreload" $
        \ clsNamePtr ->
          withCString "get_preload" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_preload ::
              (VisualScriptPreload :< cls, Object :< cls) => cls -> IO Resource
get_preload cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPreload_get_preload
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptPreload_set_preload #-}

bindVisualScriptPreload_set_preload :: MethodBind
bindVisualScriptPreload_set_preload
  = unsafePerformIO $
      withCString "VisualScriptPreload" $
        \ clsNamePtr ->
          withCString "set_preload" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_preload ::
              (VisualScriptPreload :< cls, Object :< cls) =>
              cls -> Resource -> IO ()
set_preload cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptPreload_set_preload
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)