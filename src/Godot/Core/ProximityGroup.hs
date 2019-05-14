{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ProximityGroup
       (Godot.Core.ProximityGroup._MODE_SIGNAL,
        Godot.Core.ProximityGroup._MODE_PROXY,
        Godot.Core.ProximityGroup.sig_broadcast,
        Godot.Core.ProximityGroup.set_group_name,
        Godot.Core.ProximityGroup.get_group_name,
        Godot.Core.ProximityGroup.set_dispatch_mode,
        Godot.Core.ProximityGroup.get_dispatch_mode,
        Godot.Core.ProximityGroup.set_grid_radius,
        Godot.Core.ProximityGroup.get_grid_radius,
        Godot.Core.ProximityGroup.broadcast,
        Godot.Core.ProximityGroup._proximity_group_broadcast)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MODE_SIGNAL :: Int
_MODE_SIGNAL = 1

_MODE_PROXY :: Int
_MODE_PROXY = 0

sig_broadcast :: Godot.Internal.Dispatch.Signal ProximityGroup
sig_broadcast = Godot.Internal.Dispatch.Signal "broadcast"

{-# NOINLINE bindProximityGroup_set_group_name #-}

bindProximityGroup_set_group_name :: MethodBind
bindProximityGroup_set_group_name
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "set_group_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_group_name ::
                 (ProximityGroup :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
set_group_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_set_group_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProximityGroup_get_group_name #-}

bindProximityGroup_get_group_name :: MethodBind
bindProximityGroup_get_group_name
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "get_group_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_group_name ::
                 (ProximityGroup :< cls, Object :< cls) => cls -> IO GodotString
get_group_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_get_group_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProximityGroup_set_dispatch_mode #-}

bindProximityGroup_set_dispatch_mode :: MethodBind
bindProximityGroup_set_dispatch_mode
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "set_dispatch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_dispatch_mode ::
                    (ProximityGroup :< cls, Object :< cls) => cls -> Int -> IO ()
set_dispatch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_set_dispatch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProximityGroup_get_dispatch_mode #-}

bindProximityGroup_get_dispatch_mode :: MethodBind
bindProximityGroup_get_dispatch_mode
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "get_dispatch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_dispatch_mode ::
                    (ProximityGroup :< cls, Object :< cls) => cls -> IO Int
get_dispatch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_get_dispatch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProximityGroup_set_grid_radius #-}

bindProximityGroup_set_grid_radius :: MethodBind
bindProximityGroup_set_grid_radius
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "set_grid_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_grid_radius ::
                  (ProximityGroup :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_grid_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_set_grid_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProximityGroup_get_grid_radius #-}

bindProximityGroup_get_grid_radius :: MethodBind
bindProximityGroup_get_grid_radius
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "get_grid_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_grid_radius ::
                  (ProximityGroup :< cls, Object :< cls) => cls -> IO Vector3
get_grid_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_get_grid_radius
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProximityGroup_broadcast #-}

bindProximityGroup_broadcast :: MethodBind
bindProximityGroup_broadcast
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "broadcast" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

broadcast ::
            (ProximityGroup :< cls, Object :< cls) =>
            cls -> GodotString -> GodotVariant -> IO ()
broadcast cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProximityGroup_broadcast (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProximityGroup__proximity_group_broadcast #-}

bindProximityGroup__proximity_group_broadcast :: MethodBind
bindProximityGroup__proximity_group_broadcast
  = unsafePerformIO $
      withCString "ProximityGroup" $
        \ clsNamePtr ->
          withCString "_proximity_group_broadcast" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_proximity_group_broadcast ::
                             (ProximityGroup :< cls, Object :< cls) =>
                             cls -> GodotString -> GodotVariant -> IO ()
_proximity_group_broadcast cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindProximityGroup__proximity_group_broadcast
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)