{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SceneState
       (Godot.Core.SceneState._GEN_EDIT_STATE_DISABLED,
        Godot.Core.SceneState._GEN_EDIT_STATE_MAIN,
        Godot.Core.SceneState._GEN_EDIT_STATE_INSTANCE,
        Godot.Core.SceneState.get_connection_binds,
        Godot.Core.SceneState.get_connection_count,
        Godot.Core.SceneState.get_connection_flags,
        Godot.Core.SceneState.get_connection_method,
        Godot.Core.SceneState.get_connection_signal,
        Godot.Core.SceneState.get_connection_source,
        Godot.Core.SceneState.get_connection_target,
        Godot.Core.SceneState.get_node_count,
        Godot.Core.SceneState.get_node_groups,
        Godot.Core.SceneState.get_node_index,
        Godot.Core.SceneState.get_node_instance,
        Godot.Core.SceneState.get_node_instance_placeholder,
        Godot.Core.SceneState.get_node_name,
        Godot.Core.SceneState.get_node_owner_path,
        Godot.Core.SceneState.get_node_path,
        Godot.Core.SceneState.get_node_property_count,
        Godot.Core.SceneState.get_node_property_name,
        Godot.Core.SceneState.get_node_property_value,
        Godot.Core.SceneState.get_node_type,
        Godot.Core.SceneState.is_node_instance_placeholder)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_GEN_EDIT_STATE_DISABLED :: Int
_GEN_EDIT_STATE_DISABLED = 0

_GEN_EDIT_STATE_MAIN :: Int
_GEN_EDIT_STATE_MAIN = 2

_GEN_EDIT_STATE_INSTANCE :: Int
_GEN_EDIT_STATE_INSTANCE = 1

{-# NOINLINE bindSceneState_get_connection_binds #-}

-- | Returns the list of bound parameters for the signal at [code]idx[/code].
bindSceneState_get_connection_binds :: MethodBind
bindSceneState_get_connection_binds
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_connection_binds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of bound parameters for the signal at [code]idx[/code].
get_connection_binds ::
                       (SceneState :< cls, Object :< cls) => cls -> Int -> IO Array
get_connection_binds cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_connection_binds
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_connection_count #-}

-- | Returns the number of signal connections in the scene.
--   				The [code]idx[/code] argument used to query connection metadata in other [code]get_connection_*[/code] methods in the interval [code][0, get_connection_count() - 1][/code].
bindSceneState_get_connection_count :: MethodBind
bindSceneState_get_connection_count
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_connection_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of signal connections in the scene.
--   				The [code]idx[/code] argument used to query connection metadata in other [code]get_connection_*[/code] methods in the interval [code][0, get_connection_count() - 1][/code].
get_connection_count ::
                       (SceneState :< cls, Object :< cls) => cls -> IO Int
get_connection_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_connection_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_connection_flags #-}

-- | Returns the connection flags for the signal at [code]idx[/code]. See [enum Object.ConnectFlags] constants.
bindSceneState_get_connection_flags :: MethodBind
bindSceneState_get_connection_flags
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_connection_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the connection flags for the signal at [code]idx[/code]. See [enum Object.ConnectFlags] constants.
get_connection_flags ::
                       (SceneState :< cls, Object :< cls) => cls -> Int -> IO Int
get_connection_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_connection_flags
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_connection_method #-}

-- | Returns the method connected to the signal at [code]idx[/code].
bindSceneState_get_connection_method :: MethodBind
bindSceneState_get_connection_method
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_connection_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the method connected to the signal at [code]idx[/code].
get_connection_method ::
                        (SceneState :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_connection_method cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_connection_method
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_connection_signal #-}

-- | Returns the name of the signal at [code]idx[/code].
bindSceneState_get_connection_signal :: MethodBind
bindSceneState_get_connection_signal
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_connection_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the signal at [code]idx[/code].
get_connection_signal ::
                        (SceneState :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_connection_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_connection_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_connection_source #-}

-- | Returns the path to the node that owns the signal at [code]idx[/code], relative to the root node.
bindSceneState_get_connection_source :: MethodBind
bindSceneState_get_connection_source
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_connection_source" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to the node that owns the signal at [code]idx[/code], relative to the root node.
get_connection_source ::
                        (SceneState :< cls, Object :< cls) => cls -> Int -> IO NodePath
get_connection_source cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_connection_source
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_connection_target #-}

-- | Returns the path to the node that owns the method connected to the signal at [code]idx[/code], relative to the root node.
bindSceneState_get_connection_target :: MethodBind
bindSceneState_get_connection_target
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_connection_target" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to the node that owns the method connected to the signal at [code]idx[/code], relative to the root node.
get_connection_target ::
                        (SceneState :< cls, Object :< cls) => cls -> Int -> IO NodePath
get_connection_target cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_connection_target
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_count #-}

-- | Returns the number of nodes in the scene.
--   				The [code]idx[/code] argument used to query node data in other [code]get_node_*[/code] methods in the interval [code][0, get_node_count() - 1][/code].
bindSceneState_get_node_count :: MethodBind
bindSceneState_get_node_count
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of nodes in the scene.
--   				The [code]idx[/code] argument used to query node data in other [code]get_node_*[/code] methods in the interval [code][0, get_node_count() - 1][/code].
get_node_count ::
                 (SceneState :< cls, Object :< cls) => cls -> IO Int
get_node_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_groups #-}

-- | Returns the list of group names associated with the node at [code]idx[/code].
bindSceneState_get_node_groups :: MethodBind
bindSceneState_get_node_groups
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_groups" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of group names associated with the node at [code]idx[/code].
get_node_groups ::
                  (SceneState :< cls, Object :< cls) =>
                  cls -> Int -> IO PoolStringArray
get_node_groups cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_groups (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_index #-}

-- | Returns the node's index, which is its position relative to its siblings. This is only relevant and saved in scenes for cases where new nodes are added to an instanced or inherited scene among siblings from the base scene. Despite the name, this index is not related to the [code]idx[/code] argument used here and in other methods.
bindSceneState_get_node_index :: MethodBind
bindSceneState_get_node_index
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the node's index, which is its position relative to its siblings. This is only relevant and saved in scenes for cases where new nodes are added to an instanced or inherited scene among siblings from the base scene. Despite the name, this index is not related to the [code]idx[/code] argument used here and in other methods.
get_node_index ::
                 (SceneState :< cls, Object :< cls) => cls -> Int -> IO Int
get_node_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_instance #-}

-- | Returns a [PackedScene] for the node at [code]idx[/code] (i.e. the whole branch starting at this node, with its child nodes and resources), or [code]null[/code] if the node is not an instance.
bindSceneState_get_node_instance :: MethodBind
bindSceneState_get_node_instance
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [PackedScene] for the node at [code]idx[/code] (i.e. the whole branch starting at this node, with its child nodes and resources), or [code]null[/code] if the node is not an instance.
get_node_instance ::
                    (SceneState :< cls, Object :< cls) => cls -> Int -> IO PackedScene
get_node_instance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_instance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_instance_placeholder #-}

-- | Returns the path to the represented scene file if the node at [code]idx[/code] is an [InstancePlaceholder].
bindSceneState_get_node_instance_placeholder :: MethodBind
bindSceneState_get_node_instance_placeholder
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_instance_placeholder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to the represented scene file if the node at [code]idx[/code] is an [InstancePlaceholder].
get_node_instance_placeholder ::
                                (SceneState :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_node_instance_placeholder cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_instance_placeholder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_name #-}

-- | Returns the name of the node at [code]idx[/code].
bindSceneState_get_node_name :: MethodBind
bindSceneState_get_node_name
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the node at [code]idx[/code].
get_node_name ::
                (SceneState :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_node_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_owner_path #-}

-- | Returns the path to the owner of the node at [code]idx[/code], relative to the root node.
bindSceneState_get_node_owner_path :: MethodBind
bindSceneState_get_node_owner_path
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_owner_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to the owner of the node at [code]idx[/code], relative to the root node.
get_node_owner_path ::
                      (SceneState :< cls, Object :< cls) => cls -> Int -> IO NodePath
get_node_owner_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_owner_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_path #-}

-- | Returns the path to the node at [code]idx[/code].
--   				If [code]for_parent[/code] is [code]true[/code], returns the path of the [code]idx[/code] node's parent instead.
bindSceneState_get_node_path :: MethodBind
bindSceneState_get_node_path
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to the node at [code]idx[/code].
--   				If [code]for_parent[/code] is [code]true[/code], returns the path of the [code]idx[/code] node's parent instead.
get_node_path ::
                (SceneState :< cls, Object :< cls) =>
                cls -> Int -> Bool -> IO NodePath
get_node_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_property_count #-}

-- | Returns the number of exported or overridden properties for the node at [code]idx[/code].
--   				The [code]prop_idx[/code] argument used to query node property data in other [code]get_node_property_*[/code] methods in the interval [code][0, get_node_property_count() - 1][/code].
bindSceneState_get_node_property_count :: MethodBind
bindSceneState_get_node_property_count
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_property_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of exported or overridden properties for the node at [code]idx[/code].
--   				The [code]prop_idx[/code] argument used to query node property data in other [code]get_node_property_*[/code] methods in the interval [code][0, get_node_property_count() - 1][/code].
get_node_property_count ::
                          (SceneState :< cls, Object :< cls) => cls -> Int -> IO Int
get_node_property_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_property_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_property_name #-}

-- | Returns the name of the property at [code]prop_idx[/code] for the node at [code]idx[/code].
bindSceneState_get_node_property_name :: MethodBind
bindSceneState_get_node_property_name
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_property_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the property at [code]prop_idx[/code] for the node at [code]idx[/code].
get_node_property_name ::
                         (SceneState :< cls, Object :< cls) =>
                         cls -> Int -> Int -> IO GodotString
get_node_property_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_property_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_property_value #-}

-- | Returns the value of the property at [code]prop_idx[/code] for the node at [code]idx[/code].
bindSceneState_get_node_property_value :: MethodBind
bindSceneState_get_node_property_value
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_property_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the property at [code]prop_idx[/code] for the node at [code]idx[/code].
get_node_property_value ::
                          (SceneState :< cls, Object :< cls) =>
                          cls -> Int -> Int -> IO GodotVariant
get_node_property_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_property_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_get_node_type #-}

-- | Returns the type of the node at [code]idx[/code].
bindSceneState_get_node_type :: MethodBind
bindSceneState_get_node_type
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "get_node_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the type of the node at [code]idx[/code].
get_node_type ::
                (SceneState :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_node_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_get_node_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSceneState_is_node_instance_placeholder #-}

-- | Returns [code]true[/code] if the node at [code]idx[/code] is an [InstancePlaceholder].
bindSceneState_is_node_instance_placeholder :: MethodBind
bindSceneState_is_node_instance_placeholder
  = unsafePerformIO $
      withCString "SceneState" $
        \ clsNamePtr ->
          withCString "is_node_instance_placeholder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the node at [code]idx[/code] is an [InstancePlaceholder].
is_node_instance_placeholder ::
                               (SceneState :< cls, Object :< cls) => cls -> Int -> IO Bool
is_node_instance_placeholder cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneState_is_node_instance_placeholder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)