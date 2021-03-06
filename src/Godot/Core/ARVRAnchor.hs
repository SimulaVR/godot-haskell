{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ARVRAnchor
       (Godot.Core.ARVRAnchor.sig_mesh_updated,
        Godot.Core.ARVRAnchor.get_anchor_id,
        Godot.Core.ARVRAnchor.get_anchor_name,
        Godot.Core.ARVRAnchor.get_is_active,
        Godot.Core.ARVRAnchor.get_mesh, Godot.Core.ARVRAnchor.get_plane,
        Godot.Core.ARVRAnchor.get_size,
        Godot.Core.ARVRAnchor.set_anchor_id)
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
import Godot.Core.Spatial()

-- | Emitted when the mesh associated with the anchor changes or when one becomes available. This is especially important for topology that is constantly being @mesh_updated@.
sig_mesh_updated :: Godot.Internal.Dispatch.Signal ARVRAnchor
sig_mesh_updated = Godot.Internal.Dispatch.Signal "mesh_updated"

instance NodeSignal ARVRAnchor "mesh_updated" '[Mesh]

instance NodeProperty ARVRAnchor "anchor_id" Int 'False where
        nodeProperty
          = (get_anchor_id, wrapDroppingSetter set_anchor_id, Nothing)

{-# NOINLINE bindARVRAnchor_get_anchor_id #-}

-- | The anchor's ID. You can set this before the anchor itself exists. The first anchor gets an ID of @1@, the second an ID of @2@, etc. When anchors get removed, the engine can then assign the corresponding ID to new anchors. The most common situation where anchors "disappear" is when the AR server identifies that two anchors represent different parts of the same plane and merges them.
bindARVRAnchor_get_anchor_id :: MethodBind
bindARVRAnchor_get_anchor_id
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_anchor_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The anchor's ID. You can set this before the anchor itself exists. The first anchor gets an ID of @1@, the second an ID of @2@, etc. When anchors get removed, the engine can then assign the corresponding ID to new anchors. The most common situation where anchors "disappear" is when the AR server identifies that two anchors represent different parts of the same plane and merges them.
get_anchor_id ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> IO Int
get_anchor_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_anchor_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_anchor_id" '[] (IO Int) where
        nodeMethod = Godot.Core.ARVRAnchor.get_anchor_id

{-# NOINLINE bindARVRAnchor_get_anchor_name #-}

-- | Returns the name given to this anchor.
bindARVRAnchor_get_anchor_name :: MethodBind
bindARVRAnchor_get_anchor_name
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_anchor_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name given to this anchor.
get_anchor_name ::
                  (ARVRAnchor :< cls, Object :< cls) => cls -> IO GodotString
get_anchor_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_anchor_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_anchor_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ARVRAnchor.get_anchor_name

{-# NOINLINE bindARVRAnchor_get_is_active #-}

-- | Returns @true@ if the anchor is being tracked and @false@ if no anchor with this ID is currently known.
bindARVRAnchor_get_is_active :: MethodBind
bindARVRAnchor_get_is_active
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the anchor is being tracked and @false@ if no anchor with this ID is currently known.
get_is_active ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> IO Bool
get_is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_is_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_is_active" '[] (IO Bool) where
        nodeMethod = Godot.Core.ARVRAnchor.get_is_active

{-# NOINLINE bindARVRAnchor_get_mesh #-}

-- | If provided by the @ARVRInterface@, this returns a mesh object for the anchor. For an anchor, this can be a shape related to the object being tracked or it can be a mesh that provides topology related to the anchor and can be used to create shadows/reflections on surfaces or for generating collision shapes.
bindARVRAnchor_get_mesh :: MethodBind
bindARVRAnchor_get_mesh
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If provided by the @ARVRInterface@, this returns a mesh object for the anchor. For an anchor, this can be a shape related to the object being tracked or it can be a mesh that provides topology related to the anchor and can be used to create shadows/reflections on surfaces or for generating collision shapes.
get_mesh :: (ARVRAnchor :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_mesh (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_mesh" '[] (IO Mesh) where
        nodeMethod = Godot.Core.ARVRAnchor.get_mesh

{-# NOINLINE bindARVRAnchor_get_plane #-}

-- | Returns a plane aligned with our anchor; handy for intersection testing.
bindARVRAnchor_get_plane :: MethodBind
bindARVRAnchor_get_plane
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_plane" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a plane aligned with our anchor; handy for intersection testing.
get_plane :: (ARVRAnchor :< cls, Object :< cls) => cls -> IO Plane
get_plane cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_plane (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_plane" '[] (IO Plane) where
        nodeMethod = Godot.Core.ARVRAnchor.get_plane

{-# NOINLINE bindARVRAnchor_get_size #-}

-- | Returns the estimated size of the plane that was detected. Say when the anchor relates to a table in the real world, this is the estimated size of the surface of that table.
bindARVRAnchor_get_size :: MethodBind
bindARVRAnchor_get_size
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the estimated size of the plane that was detected. Say when the anchor relates to a table in the real world, this is the estimated size of the surface of that table.
get_size :: (ARVRAnchor :< cls, Object :< cls) => cls -> IO Vector3
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "get_size" '[] (IO Vector3) where
        nodeMethod = Godot.Core.ARVRAnchor.get_size

{-# NOINLINE bindARVRAnchor_set_anchor_id #-}

-- | The anchor's ID. You can set this before the anchor itself exists. The first anchor gets an ID of @1@, the second an ID of @2@, etc. When anchors get removed, the engine can then assign the corresponding ID to new anchors. The most common situation where anchors "disappear" is when the AR server identifies that two anchors represent different parts of the same plane and merges them.
bindARVRAnchor_set_anchor_id :: MethodBind
bindARVRAnchor_set_anchor_id
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "set_anchor_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The anchor's ID. You can set this before the anchor itself exists. The first anchor gets an ID of @1@, the second an ID of @2@, etc. When anchors get removed, the engine can then assign the corresponding ID to new anchors. The most common situation where anchors "disappear" is when the AR server identifies that two anchors represent different parts of the same plane and merges them.
set_anchor_id ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> Int -> IO ()
set_anchor_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_set_anchor_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRAnchor "set_anchor_id" '[Int] (IO ()) where
        nodeMethod = Godot.Core.ARVRAnchor.set_anchor_id