{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Script
       (Godot.Core.Script.can_instance, Godot.Core.Script.get_base_script,
        Godot.Core.Script.get_instance_base_type,
        Godot.Core.Script.get_property_default_value,
        Godot.Core.Script.get_script_constant_map,
        Godot.Core.Script.get_script_method_list,
        Godot.Core.Script.get_script_property_list,
        Godot.Core.Script.get_script_signal_list,
        Godot.Core.Script.get_source_code,
        Godot.Core.Script.has_script_signal,
        Godot.Core.Script.has_source_code, Godot.Core.Script.instance_has,
        Godot.Core.Script.is_tool, Godot.Core.Script.reload,
        Godot.Core.Script.set_source_code)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindScript_can_instance #-}

-- | Returns [code]true[/code] if the script can be instanced.
bindScript_can_instance :: MethodBind
bindScript_can_instance
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "can_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the script can be instanced.
can_instance :: (Script :< cls, Object :< cls) => cls -> IO Bool
can_instance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_can_instance (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_get_base_script #-}

-- | Returns the script directly inherited by this script.
bindScript_get_base_script :: MethodBind
bindScript_get_base_script
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "get_base_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the script directly inherited by this script.
get_base_script ::
                  (Script :< cls, Object :< cls) => cls -> IO Script
get_base_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_get_base_script (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_get_instance_base_type #-}

-- | Returns the script's base type.
bindScript_get_instance_base_type :: MethodBind
bindScript_get_instance_base_type
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "get_instance_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the script's base type.
get_instance_base_type ::
                         (Script :< cls, Object :< cls) => cls -> IO GodotString
get_instance_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_get_instance_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_get_property_default_value #-}

-- | Returns the default value of the specified property.
bindScript_get_property_default_value :: MethodBind
bindScript_get_property_default_value
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "get_property_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the default value of the specified property.
get_property_default_value ::
                             (Script :< cls, Object :< cls) =>
                             cls -> GodotString -> IO GodotVariant
get_property_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_get_property_default_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_get_script_constant_map #-}

-- | Returns a dictionary containing constant names and their values.
bindScript_get_script_constant_map :: MethodBind
bindScript_get_script_constant_map
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "get_script_constant_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a dictionary containing constant names and their values.
get_script_constant_map ::
                          (Script :< cls, Object :< cls) => cls -> IO Dictionary
get_script_constant_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_get_script_constant_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_get_script_method_list #-}

-- | Returns the list of methods in this [Script].
bindScript_get_script_method_list :: MethodBind
bindScript_get_script_method_list
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "get_script_method_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of methods in this [Script].
get_script_method_list ::
                         (Script :< cls, Object :< cls) => cls -> IO Array
get_script_method_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_get_script_method_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_get_script_property_list #-}

-- | Returns the list of properties in this [Script].
bindScript_get_script_property_list :: MethodBind
bindScript_get_script_property_list
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "get_script_property_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of properties in this [Script].
get_script_property_list ::
                           (Script :< cls, Object :< cls) => cls -> IO Array
get_script_property_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_get_script_property_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_get_script_signal_list #-}

-- | Returns the list of user signals defined in this [Script].
bindScript_get_script_signal_list :: MethodBind
bindScript_get_script_signal_list
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "get_script_signal_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of user signals defined in this [Script].
get_script_signal_list ::
                         (Script :< cls, Object :< cls) => cls -> IO Array
get_script_signal_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_get_script_signal_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_get_source_code #-}

-- | The script source code or an empty string if source code is not available. When set, does not reload the class implementation automatically.
bindScript_get_source_code :: MethodBind
bindScript_get_source_code
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "get_source_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The script source code or an empty string if source code is not available. When set, does not reload the class implementation automatically.
get_source_code ::
                  (Script :< cls, Object :< cls) => cls -> IO GodotString
get_source_code cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_get_source_code (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_has_script_signal #-}

-- | Returns [code]true[/code] if the script, or a base class, defines a signal with the given name.
bindScript_has_script_signal :: MethodBind
bindScript_has_script_signal
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "has_script_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the script, or a base class, defines a signal with the given name.
has_script_signal ::
                    (Script :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_script_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_has_script_signal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_has_source_code #-}

-- | Returns [code]true[/code] if the script contains non-empty source code.
bindScript_has_source_code :: MethodBind
bindScript_has_source_code
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "has_source_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the script contains non-empty source code.
has_source_code :: (Script :< cls, Object :< cls) => cls -> IO Bool
has_source_code cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_has_source_code (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_instance_has #-}

-- | Returns [code]true[/code] if [code]base_object[/code] is an instance of this script.
bindScript_instance_has :: MethodBind
bindScript_instance_has
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "instance_has" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if [code]base_object[/code] is an instance of this script.
instance_has ::
               (Script :< cls, Object :< cls) => cls -> Object -> IO Bool
instance_has cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_instance_has (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_is_tool #-}

-- | Returns [code]true[/code] if the script is a tool script. A tool script can run in the editor.
bindScript_is_tool :: MethodBind
bindScript_is_tool
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "is_tool" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the script is a tool script. A tool script can run in the editor.
is_tool :: (Script :< cls, Object :< cls) => cls -> IO Bool
is_tool cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_is_tool (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_reload #-}

-- | Reloads the script's class implementation. Returns an error code.
bindScript_reload :: MethodBind
bindScript_reload
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "reload" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reloads the script's class implementation. Returns an error code.
reload :: (Script :< cls, Object :< cls) => cls -> Bool -> IO Int
reload cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_reload (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindScript_set_source_code #-}

-- | The script source code or an empty string if source code is not available. When set, does not reload the class implementation automatically.
bindScript_set_source_code :: MethodBind
bindScript_set_source_code
  = unsafePerformIO $
      withCString "Script" $
        \ clsNamePtr ->
          withCString "set_source_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The script source code or an empty string if source code is not available. When set, does not reload the class implementation automatically.
set_source_code ::
                  (Script :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_source_code cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScript_set_source_code (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)