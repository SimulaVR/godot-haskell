{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Node2D()

instance NodeProperty RemoteTransform2D "remote_path" NodePath
           'False
         where
        nodeProperty
          = (get_remote_node, wrapDroppingSetter set_remote_node, Nothing)

instance NodeProperty RemoteTransform2D "update_position" Bool
           'False
         where
        nodeProperty
          = (get_update_position, wrapDroppingSetter set_update_position,
             Nothing)

instance NodeProperty RemoteTransform2D "update_rotation" Bool
           'False
         where
        nodeProperty
          = (get_update_rotation, wrapDroppingSetter set_update_rotation,
             Nothing)

instance NodeProperty RemoteTransform2D "update_scale" Bool 'False
         where
        nodeProperty
          = (get_update_scale, wrapDroppingSetter set_update_scale, Nothing)

instance NodeProperty RemoteTransform2D "use_global_coordinates"
           Bool
           'False
         where
        nodeProperty
          = (get_use_global_coordinates,
             wrapDroppingSetter set_use_global_coordinates, Nothing)

{-# NOINLINE bindRemoteTransform2D_force_update_cache #-}

-- | @RemoteTransform2D@ caches the remote node. It may not notice if the remote node disappears; @method force_update_cache@ forces it to update the cache again.
bindRemoteTransform2D_force_update_cache :: MethodBind
bindRemoteTransform2D_force_update_cache
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "force_update_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @RemoteTransform2D@ caches the remote node. It may not notice if the remote node disappears; @method force_update_cache@ forces it to update the cache again.
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

instance NodeMethod RemoteTransform2D "force_update_cache" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform2D.force_update_cache

{-# NOINLINE bindRemoteTransform2D_get_remote_node #-}

-- | The @NodePath@ to the remote node, relative to the RemoteTransform2D's position in the scene.
bindRemoteTransform2D_get_remote_node :: MethodBind
bindRemoteTransform2D_get_remote_node
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_remote_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @NodePath@ to the remote node, relative to the RemoteTransform2D's position in the scene.
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

instance NodeMethod RemoteTransform2D "get_remote_node" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.RemoteTransform2D.get_remote_node

{-# NOINLINE bindRemoteTransform2D_get_update_position #-}

-- | If @true@, the remote node's position is updated.
bindRemoteTransform2D_get_update_position :: MethodBind
bindRemoteTransform2D_get_update_position
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the remote node's position is updated.
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

instance NodeMethod RemoteTransform2D "get_update_position" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RemoteTransform2D.get_update_position

{-# NOINLINE bindRemoteTransform2D_get_update_rotation #-}

-- | If @true@, the remote node's rotation is updated.
bindRemoteTransform2D_get_update_rotation :: MethodBind
bindRemoteTransform2D_get_update_rotation
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_update_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the remote node's rotation is updated.
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

instance NodeMethod RemoteTransform2D "get_update_rotation" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RemoteTransform2D.get_update_rotation

{-# NOINLINE bindRemoteTransform2D_get_update_scale #-}

-- | If @true@, the remote node's scale is updated.
bindRemoteTransform2D_get_update_scale :: MethodBind
bindRemoteTransform2D_get_update_scale
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_update_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the remote node's scale is updated.
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

instance NodeMethod RemoteTransform2D "get_update_scale" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.RemoteTransform2D.get_update_scale

{-# NOINLINE bindRemoteTransform2D_get_use_global_coordinates #-}

-- | If @true@, global coordinates are used. If @false@, local coordinates are used.
bindRemoteTransform2D_get_use_global_coordinates :: MethodBind
bindRemoteTransform2D_get_use_global_coordinates
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "get_use_global_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, global coordinates are used. If @false@, local coordinates are used.
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

instance NodeMethod RemoteTransform2D "get_use_global_coordinates"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.RemoteTransform2D.get_use_global_coordinates

{-# NOINLINE bindRemoteTransform2D_set_remote_node #-}

-- | The @NodePath@ to the remote node, relative to the RemoteTransform2D's position in the scene.
bindRemoteTransform2D_set_remote_node :: MethodBind
bindRemoteTransform2D_set_remote_node
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_remote_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @NodePath@ to the remote node, relative to the RemoteTransform2D's position in the scene.
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

instance NodeMethod RemoteTransform2D "set_remote_node" '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform2D.set_remote_node

{-# NOINLINE bindRemoteTransform2D_set_update_position #-}

-- | If @true@, the remote node's position is updated.
bindRemoteTransform2D_set_update_position :: MethodBind
bindRemoteTransform2D_set_update_position
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the remote node's position is updated.
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

instance NodeMethod RemoteTransform2D "set_update_position" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform2D.set_update_position

{-# NOINLINE bindRemoteTransform2D_set_update_rotation #-}

-- | If @true@, the remote node's rotation is updated.
bindRemoteTransform2D_set_update_rotation :: MethodBind
bindRemoteTransform2D_set_update_rotation
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_update_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the remote node's rotation is updated.
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

instance NodeMethod RemoteTransform2D "set_update_rotation" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform2D.set_update_rotation

{-# NOINLINE bindRemoteTransform2D_set_update_scale #-}

-- | If @true@, the remote node's scale is updated.
bindRemoteTransform2D_set_update_scale :: MethodBind
bindRemoteTransform2D_set_update_scale
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_update_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the remote node's scale is updated.
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

instance NodeMethod RemoteTransform2D "set_update_scale" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.RemoteTransform2D.set_update_scale

{-# NOINLINE bindRemoteTransform2D_set_use_global_coordinates #-}

-- | If @true@, global coordinates are used. If @false@, local coordinates are used.
bindRemoteTransform2D_set_use_global_coordinates :: MethodBind
bindRemoteTransform2D_set_use_global_coordinates
  = unsafePerformIO $
      withCString "RemoteTransform2D" $
        \ clsNamePtr ->
          withCString "set_use_global_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, global coordinates are used. If @false@, local coordinates are used.
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

instance NodeMethod RemoteTransform2D "set_use_global_coordinates"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.RemoteTransform2D.set_use_global_coordinates