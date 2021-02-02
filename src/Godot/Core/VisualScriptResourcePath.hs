{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptResourcePath
       (Godot.Core.VisualScriptResourcePath.get_resource_path,
        Godot.Core.VisualScriptResourcePath.set_resource_path)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptResourcePath_get_resource_path #-}

bindVisualScriptResourcePath_get_resource_path :: MethodBind
bindVisualScriptResourcePath_get_resource_path
  = unsafePerformIO $
      withCString "VisualScriptResourcePath" $
        \ clsNamePtr ->
          withCString "get_resource_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_resource_path ::
                    (VisualScriptResourcePath :< cls, Object :< cls) =>
                    cls -> IO GodotString
get_resource_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptResourcePath_get_resource_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptResourcePath_set_resource_path #-}

bindVisualScriptResourcePath_set_resource_path :: MethodBind
bindVisualScriptResourcePath_set_resource_path
  = unsafePerformIO $
      withCString "VisualScriptResourcePath" $
        \ clsNamePtr ->
          withCString "set_resource_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_resource_path ::
                    (VisualScriptResourcePath :< cls, Object :< cls) =>
                    cls -> GodotString -> IO ()
set_resource_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptResourcePath_set_resource_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)