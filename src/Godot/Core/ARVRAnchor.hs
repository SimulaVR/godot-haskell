{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ARVRAnchor
       (Godot.Core.ARVRAnchor.set_anchor_id,
        Godot.Core.ARVRAnchor.get_anchor_id,
        Godot.Core.ARVRAnchor.get_anchor_name,
        Godot.Core.ARVRAnchor.get_is_active,
        Godot.Core.ARVRAnchor.get_size, Godot.Core.ARVRAnchor.get_plane)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindARVRAnchor_set_anchor_id #-}

-- | The anchor's id. You can set this before the anchor itself exists. The first anchor gets an id of [code]1[/code], the second an id of [code]2[/code], etc. When anchors get removed, the engine can then assign the corresponding id to new anchors. The most common situation where anchors 'disappear' is when the AR server identifies that two anchors represent different parts of the same plane and merges them.
bindARVRAnchor_set_anchor_id :: MethodBind
bindARVRAnchor_set_anchor_id
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "set_anchor_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The anchor's id. You can set this before the anchor itself exists. The first anchor gets an id of [code]1[/code], the second an id of [code]2[/code], etc. When anchors get removed, the engine can then assign the corresponding id to new anchors. The most common situation where anchors 'disappear' is when the AR server identifies that two anchors represent different parts of the same plane and merges them.
set_anchor_id ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> Int -> IO ()
set_anchor_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_set_anchor_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRAnchor_get_anchor_id #-}

-- | The anchor's id. You can set this before the anchor itself exists. The first anchor gets an id of [code]1[/code], the second an id of [code]2[/code], etc. When anchors get removed, the engine can then assign the corresponding id to new anchors. The most common situation where anchors 'disappear' is when the AR server identifies that two anchors represent different parts of the same plane and merges them.
bindARVRAnchor_get_anchor_id :: MethodBind
bindARVRAnchor_get_anchor_id
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_anchor_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The anchor's id. You can set this before the anchor itself exists. The first anchor gets an id of [code]1[/code], the second an id of [code]2[/code], etc. When anchors get removed, the engine can then assign the corresponding id to new anchors. The most common situation where anchors 'disappear' is when the AR server identifies that two anchors represent different parts of the same plane and merges them.
get_anchor_id ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> IO Int
get_anchor_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_anchor_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindARVRAnchor_get_is_active #-}

-- | Returns true if the anchor is being tracked and false if no anchor with this id is currently known.
bindARVRAnchor_get_is_active :: MethodBind
bindARVRAnchor_get_is_active
  = unsafePerformIO $
      withCString "ARVRAnchor" $
        \ clsNamePtr ->
          withCString "get_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns true if the anchor is being tracked and false if no anchor with this id is currently known.
get_is_active ::
                (ARVRAnchor :< cls, Object :< cls) => cls -> IO Bool
get_is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRAnchor_get_is_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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