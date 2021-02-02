{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.RemoteTransform2D
       (Godot.Core.RemoteTransform2D.force_update_cache,
        Godot.Core.RemoteTransform2D.get_remote_node,
        Godot.Core.RemoteTransform2D.get_update_position,
        Godot.Core.RemoteTransform2D.get_update_rotation,
        Godot.Core.RemoteTransform2D.get_update_scale,
        Godot.Core.RemoteTransform2D.get_use_global_coordinates,
        Godot.Core.RemoteTransform2D.set_remote_node,
        Godot.Core.RemoteTransform2D.set_update_position,
        Godot.Core.RemoteTransform2D.set_update_rotation,
        Godot.Core.RemoteTransform2D.set_update_scale,
        Godot.Core.RemoteTransform2D.set_use_global_coordinates)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRemoteTransform2D_force_update_cache #-}

bindRemoteTransform2D_force_update_cache :: MethodBind
bindRemoteTransform2D_force_update_cache
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "force_update_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

force_update_cache ::
                     (RemoteTransform2D :< cls, Object :< cls) => cls -> IO ()
force_update_cache cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_force_update_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_get_remote_node #-}

-- | The [NodePath] to the remote node, relative to the RemoteTransform2D's position in the scene.
bindRemoteTransform2D_get_remote_node :: MethodBind
bindRemoteTransform2D_get_remote_node
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_remote_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [NodePath] to the remote node, relative to the RemoteTransform2D's position in the scene.
get_remote_node ::
                  (RemoteTransform2D :< cls, Object :< cls) => cls -> IO NodePath
get_remote_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_get_remote_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_get_update_position #-}

-- | If [code]true[/code], the remote node's position is updated. Default value: [code]true[/code].
bindRemoteTransform2D_get_update_position :: MethodBind
bindRemoteTransform2D_get_update_position
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's position is updated. Default value: [code]true[/code].
get_update_position ::
                      (RemoteTransform2D :< cls, Object :< cls) => cls -> IO Bool
get_update_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_get_update_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_get_update_rotation #-}

-- | If [code]true[/code], the remote node's rotation is updated. Default value: [code]true[/code].
bindRemoteTransform2D_get_update_rotation :: MethodBind
bindRemoteTransform2D_get_update_rotation
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_update_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's rotation is updated. Default value: [code]true[/code].
get_update_rotation ::
                      (RemoteTransform2D :< cls, Object :< cls) => cls -> IO Bool
get_update_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_get_update_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_get_update_scale #-}

-- | If [code]true[/code], the remote node's scale is updated. Default value: [code]true[/code].
bindRemoteTransform2D_get_update_scale :: MethodBind
bindRemoteTransform2D_get_update_scale
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_update_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's scale is updated. Default value: [code]true[/code].
get_update_scale ::
                   (RemoteTransform2D :< cls, Object :< cls) => cls -> IO Bool
get_update_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_get_update_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_get_use_global_coordinates #-}

-- | If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used. Default value: [code]true[/code].
bindRemoteTransform2D_get_use_global_coordinates :: MethodBind
bindRemoteTransform2D_get_use_global_coordinates
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_use_global_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used. Default value: [code]true[/code].
get_use_global_coordinates ::
                             (RemoteTransform2D :< cls, Object :< cls) => cls -> IO Bool
get_use_global_coordinates cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRemoteTransform2D_get_use_global_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_set_remote_node #-}

-- | The [NodePath] to the remote node, relative to the RemoteTransform2D's position in the scene.
bindRemoteTransform2D_set_remote_node :: MethodBind
bindRemoteTransform2D_set_remote_node
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_remote_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [NodePath] to the remote node, relative to the RemoteTransform2D's position in the scene.
set_remote_node ::
                  (RemoteTransform2D :< cls, Object :< cls) =>
                  cls -> NodePath -> IO ()
set_remote_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_set_remote_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_set_update_position #-}

-- | If [code]true[/code], the remote node's position is updated. Default value: [code]true[/code].
bindRemoteTransform2D_set_update_position :: MethodBind
bindRemoteTransform2D_set_update_position
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's position is updated. Default value: [code]true[/code].
set_update_position ::
                      (RemoteTransform2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_set_update_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_set_update_rotation #-}

-- | If [code]true[/code], the remote node's rotation is updated. Default value: [code]true[/code].
bindRemoteTransform2D_set_update_rotation :: MethodBind
bindRemoteTransform2D_set_update_rotation
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_update_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's rotation is updated. Default value: [code]true[/code].
set_update_rotation ::
                      (RemoteTransform2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_set_update_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_set_update_scale #-}

-- | If [code]true[/code], the remote node's scale is updated. Default value: [code]true[/code].
bindRemoteTransform2D_set_update_scale :: MethodBind
bindRemoteTransform2D_set_update_scale
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_update_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's scale is updated. Default value: [code]true[/code].
set_update_scale ::
                   (RemoteTransform2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform2D_set_update_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform2D_set_use_global_coordinates #-}

-- | If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used. Default value: [code]true[/code].
bindRemoteTransform2D_set_use_global_coordinates :: MethodBind
bindRemoteTransform2D_set_use_global_coordinates
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_use_global_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used. Default value: [code]true[/code].
set_use_global_coordinates ::
                             (RemoteTransform2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_global_coordinates cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRemoteTransform2D_set_use_global_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)