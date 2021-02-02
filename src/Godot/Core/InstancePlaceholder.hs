{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.InstancePlaceholder
       (Godot.Core.InstancePlaceholder.create_instance,
        Godot.Core.InstancePlaceholder.get_instance_path,
        Godot.Core.InstancePlaceholder.get_stored_values,
        Godot.Core.InstancePlaceholder.replace_by_instance)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindInstancePlaceholder_create_instance #-}

bindInstancePlaceholder_create_instance :: MethodBind
bindInstancePlaceholder_create_instance
  = unsafePerformIO $
      withCString "InstancePlaceholder" $
        \ clsNamePtr ->
          withCString "create_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create_instance ::
                  (InstancePlaceholder :< cls, Object :< cls) =>
                  cls -> Bool -> PackedScene -> IO Node
create_instance cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInstancePlaceholder_create_instance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInstancePlaceholder_get_instance_path #-}

-- | Retrieve the path to the [PackedScene] resource file that is loaded by default when calling [method replace_by_instance].
bindInstancePlaceholder_get_instance_path :: MethodBind
bindInstancePlaceholder_get_instance_path
  = unsafePerformIO $
      withCString "InstancePlaceholder" $
        \ clsNamePtr ->
          withCString "get_instance_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Retrieve the path to the [PackedScene] resource file that is loaded by default when calling [method replace_by_instance].
get_instance_path ::
                    (InstancePlaceholder :< cls, Object :< cls) =>
                    cls -> IO GodotString
get_instance_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInstancePlaceholder_get_instance_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInstancePlaceholder_get_stored_values #-}

bindInstancePlaceholder_get_stored_values :: MethodBind
bindInstancePlaceholder_get_stored_values
  = unsafePerformIO $
      withCString "InstancePlaceholder" $
        \ clsNamePtr ->
          withCString "get_stored_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_stored_values ::
                    (InstancePlaceholder :< cls, Object :< cls) =>
                    cls -> Bool -> IO Dictionary
get_stored_values cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInstancePlaceholder_get_stored_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInstancePlaceholder_replace_by_instance #-}

-- | Replace this placeholder by the scene handed as an argument, or the original scene if no argument is given. As for all resources, the scene is loaded only if it's not loaded already. By manually loading the scene beforehand, delays caused by this function can be avoided.
bindInstancePlaceholder_replace_by_instance :: MethodBind
bindInstancePlaceholder_replace_by_instance
  = unsafePerformIO $
      withCString "InstancePlaceholder" $
        \ clsNamePtr ->
          withCString "replace_by_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Replace this placeholder by the scene handed as an argument, or the original scene if no argument is given. As for all resources, the scene is loaded only if it's not loaded already. By manually loading the scene beforehand, delays caused by this function can be avoided.
replace_by_instance ::
                      (InstancePlaceholder :< cls, Object :< cls) =>
                      cls -> PackedScene -> IO ()
replace_by_instance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInstancePlaceholder_replace_by_instance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)