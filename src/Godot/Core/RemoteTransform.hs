{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.RemoteTransform
       (Godot.Core.RemoteTransform.set_remote_node,
        Godot.Core.RemoteTransform.get_remote_node,
        Godot.Core.RemoteTransform.set_use_global_coordinates,
        Godot.Core.RemoteTransform.get_use_global_coordinates,
        Godot.Core.RemoteTransform.set_update_position,
        Godot.Core.RemoteTransform.get_update_position,
        Godot.Core.RemoteTransform.set_update_rotation,
        Godot.Core.RemoteTransform.get_update_rotation,
        Godot.Core.RemoteTransform.set_update_scale,
        Godot.Core.RemoteTransform.get_update_scale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRemoteTransform_set_remote_node #-}

-- | The [NodePath] to the remote node, relative to the RemoteTransform's position in the scene.
bindRemoteTransform_set_remote_node :: MethodBind
bindRemoteTransform_set_remote_node
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_remote_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [NodePath] to the remote node, relative to the RemoteTransform's position in the scene.
set_remote_node ::
                  (RemoteTransform :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_remote_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_set_remote_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_get_remote_node #-}

-- | The [NodePath] to the remote node, relative to the RemoteTransform's position in the scene.
bindRemoteTransform_get_remote_node :: MethodBind
bindRemoteTransform_get_remote_node
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_remote_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [NodePath] to the remote node, relative to the RemoteTransform's position in the scene.
get_remote_node ::
                  (RemoteTransform :< cls, Object :< cls) => cls -> IO NodePath
get_remote_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_get_remote_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_set_use_global_coordinates #-}

-- | If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used. Default value: [code]true[/code].
bindRemoteTransform_set_use_global_coordinates :: MethodBind
bindRemoteTransform_set_use_global_coordinates
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_use_global_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used. Default value: [code]true[/code].
set_use_global_coordinates ::
                             (RemoteTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_global_coordinates cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRemoteTransform_set_use_global_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_get_use_global_coordinates #-}

-- | If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used. Default value: [code]true[/code].
bindRemoteTransform_get_use_global_coordinates :: MethodBind
bindRemoteTransform_get_use_global_coordinates
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_use_global_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], global coordinates are used. If [code]false[/code], local coordinates are used. Default value: [code]true[/code].
get_use_global_coordinates ::
                             (RemoteTransform :< cls, Object :< cls) => cls -> IO Bool
get_use_global_coordinates cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindRemoteTransform_get_use_global_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_set_update_position #-}

-- | If [code]true[/code], the remote node's position is updated. Default value: [code]true[/code].
bindRemoteTransform_set_update_position :: MethodBind
bindRemoteTransform_set_update_position
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's position is updated. Default value: [code]true[/code].
set_update_position ::
                      (RemoteTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_set_update_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_get_update_position #-}

-- | If [code]true[/code], the remote node's position is updated. Default value: [code]true[/code].
bindRemoteTransform_get_update_position :: MethodBind
bindRemoteTransform_get_update_position
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's position is updated. Default value: [code]true[/code].
get_update_position ::
                      (RemoteTransform :< cls, Object :< cls) => cls -> IO Bool
get_update_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_get_update_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_set_update_rotation #-}

-- | If [code]true[/code], the remote node's rotation is updated. Default value: [code]true[/code].
bindRemoteTransform_set_update_rotation :: MethodBind
bindRemoteTransform_set_update_rotation
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_update_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's rotation is updated. Default value: [code]true[/code].
set_update_rotation ::
                      (RemoteTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_set_update_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_get_update_rotation #-}

-- | If [code]true[/code], the remote node's rotation is updated. Default value: [code]true[/code].
bindRemoteTransform_get_update_rotation :: MethodBind
bindRemoteTransform_get_update_rotation
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_update_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's rotation is updated. Default value: [code]true[/code].
get_update_rotation ::
                      (RemoteTransform :< cls, Object :< cls) => cls -> IO Bool
get_update_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_get_update_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_set_update_scale #-}

-- | If [code]true[/code], the remote node's scale is updated. Default value: [code]true[/code].
bindRemoteTransform_set_update_scale :: MethodBind
bindRemoteTransform_set_update_scale
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "set_update_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's scale is updated. Default value: [code]true[/code].
set_update_scale ::
                   (RemoteTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_update_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_set_update_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRemoteTransform_get_update_scale #-}

-- | If [code]true[/code], the remote node's scale is updated. Default value: [code]true[/code].
bindRemoteTransform_get_update_scale :: MethodBind
bindRemoteTransform_get_update_scale
  = unsafePerformIO $
      withCString "RemoteTransform" $
        \ clsNamePtr ->
          withCString "get_update_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the remote node's scale is updated. Default value: [code]true[/code].
get_update_scale ::
                   (RemoteTransform :< cls, Object :< cls) => cls -> IO Bool
get_update_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRemoteTransform_get_update_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)