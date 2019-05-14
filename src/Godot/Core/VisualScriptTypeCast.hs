{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptTypeCast
       (Godot.Core.VisualScriptTypeCast.set_base_type,
        Godot.Core.VisualScriptTypeCast.get_base_type,
        Godot.Core.VisualScriptTypeCast.set_base_script,
        Godot.Core.VisualScriptTypeCast.get_base_script)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptTypeCast_set_base_type #-}

bindVisualScriptTypeCast_set_base_type :: MethodBind
bindVisualScriptTypeCast_set_base_type
  = unsafePerformIO $
      withCString "VisualScriptTypeCast" $
        \ clsNamePtr ->
          withCString "set_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_type ::
                (VisualScriptTypeCast :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptTypeCast_set_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptTypeCast_get_base_type #-}

bindVisualScriptTypeCast_get_base_type :: MethodBind
bindVisualScriptTypeCast_get_base_type
  = unsafePerformIO $
      withCString "VisualScriptTypeCast" $
        \ clsNamePtr ->
          withCString "get_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_type ::
                (VisualScriptTypeCast :< cls, Object :< cls) =>
                cls -> IO GodotString
get_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptTypeCast_get_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptTypeCast_set_base_script #-}

bindVisualScriptTypeCast_set_base_script :: MethodBind
bindVisualScriptTypeCast_set_base_script
  = unsafePerformIO $
      withCString "VisualScriptTypeCast" $
        \ clsNamePtr ->
          withCString "set_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_script ::
                  (VisualScriptTypeCast :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
set_base_script cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptTypeCast_set_base_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptTypeCast_get_base_script #-}

bindVisualScriptTypeCast_get_base_script :: MethodBind
bindVisualScriptTypeCast_get_base_script
  = unsafePerformIO $
      withCString "VisualScriptTypeCast" $
        \ clsNamePtr ->
          withCString "get_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_script ::
                  (VisualScriptTypeCast :< cls, Object :< cls) =>
                  cls -> IO GodotString
get_base_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptTypeCast_get_base_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)