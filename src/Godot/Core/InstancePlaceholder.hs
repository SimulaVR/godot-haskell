{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InstancePlaceholder
       (Godot.Core.InstancePlaceholder.create_instance,
        Godot.Core.InstancePlaceholder.get_instance_path,
        Godot.Core.InstancePlaceholder.get_stored_values,
        Godot.Core.InstancePlaceholder.replace_by_instance)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Node()

{-# NOINLINE bindInstancePlaceholder_create_instance #-}

-- | Not thread-safe. Use @method Object.call_deferred@ if calling from a thread.
bindInstancePlaceholder_create_instance :: MethodBind
bindInstancePlaceholder_create_instance
  = unsafePerformIO $
      withCString "InstancePlaceholder" $
        \ clsNamePtr ->
          withCString "create_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Not thread-safe. Use @method Object.call_deferred@ if calling from a thread.
create_instance ::
                  (InstancePlaceholder :< cls, Object :< cls) =>
                  cls -> Maybe Bool -> Maybe PackedScene -> IO Node
create_instance cls arg1 arg2
  = withVariantArray
      [maybe (VariantBool False) toVariant arg1,
       maybe VariantNil toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInstancePlaceholder_create_instance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InstancePlaceholder "create_instance"
           '[Maybe Bool, Maybe PackedScene]
           (IO Node)
         where
        nodeMethod = Godot.Core.InstancePlaceholder.create_instance

{-# NOINLINE bindInstancePlaceholder_get_instance_path #-}

-- | Gets the path to the @PackedScene@ resource file that is loaded by default when calling @method replace_by_instance@. Not thread-safe. Use @method Object.call_deferred@ if calling from a thread.
bindInstancePlaceholder_get_instance_path :: MethodBind
bindInstancePlaceholder_get_instance_path
  = unsafePerformIO $
      withCString "InstancePlaceholder" $
        \ clsNamePtr ->
          withCString "get_instance_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the path to the @PackedScene@ resource file that is loaded by default when calling @method replace_by_instance@. Not thread-safe. Use @method Object.call_deferred@ if calling from a thread.
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

instance NodeMethod InstancePlaceholder "get_instance_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.InstancePlaceholder.get_instance_path

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
                    cls -> Maybe Bool -> IO Dictionary
get_stored_values cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInstancePlaceholder_get_stored_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InstancePlaceholder "get_stored_values"
           '[Maybe Bool]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.InstancePlaceholder.get_stored_values

{-# NOINLINE bindInstancePlaceholder_replace_by_instance #-}

-- | Replaces this placeholder by the scene handed as an argument, or the original scene if no argument is given. As for all resources, the scene is loaded only if it's not loaded already. By manually loading the scene beforehand, delays caused by this function can be avoided.
bindInstancePlaceholder_replace_by_instance :: MethodBind
bindInstancePlaceholder_replace_by_instance
  = unsafePerformIO $
      withCString "InstancePlaceholder" $
        \ clsNamePtr ->
          withCString "replace_by_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Replaces this placeholder by the scene handed as an argument, or the original scene if no argument is given. As for all resources, the scene is loaded only if it's not loaded already. By manually loading the scene beforehand, delays caused by this function can be avoided.
replace_by_instance ::
                      (InstancePlaceholder :< cls, Object :< cls) =>
                      cls -> Maybe PackedScene -> IO ()
replace_by_instance cls arg1
  = withVariantArray [maybe VariantNil toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInstancePlaceholder_replace_by_instance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InstancePlaceholder "replace_by_instance"
           '[Maybe PackedScene]
           (IO ())
         where
        nodeMethod = Godot.Core.InstancePlaceholder.replace_by_instance