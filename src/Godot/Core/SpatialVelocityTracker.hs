{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SpatialVelocityTracker
       (Godot.Core.SpatialVelocityTracker.set_track_physics_step,
        Godot.Core.SpatialVelocityTracker.is_tracking_physics_step,
        Godot.Core.SpatialVelocityTracker.update_position,
        Godot.Core.SpatialVelocityTracker.get_tracked_linear_velocity,
        Godot.Core.SpatialVelocityTracker.reset)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSpatialVelocityTracker_set_track_physics_step #-}

bindSpatialVelocityTracker_set_track_physics_step :: MethodBind
bindSpatialVelocityTracker_set_track_physics_step
  = unsafePerformIO $
      withCString "SpatialVelocityTracker" $
        \ clsNamePtr ->
          withCString "set_track_physics_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_track_physics_step ::
                         (SpatialVelocityTracker :< cls, Object :< cls) =>
                         cls -> Bool -> IO ()
set_track_physics_step cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialVelocityTracker_set_track_physics_step
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatialVelocityTracker_is_tracking_physics_step
             #-}

bindSpatialVelocityTracker_is_tracking_physics_step :: MethodBind
bindSpatialVelocityTracker_is_tracking_physics_step
  = unsafePerformIO $
      withCString "SpatialVelocityTracker" $
        \ clsNamePtr ->
          withCString "is_tracking_physics_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_tracking_physics_step ::
                           (SpatialVelocityTracker :< cls, Object :< cls) => cls -> IO Bool
is_tracking_physics_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialVelocityTracker_is_tracking_physics_step
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatialVelocityTracker_update_position #-}

bindSpatialVelocityTracker_update_position :: MethodBind
bindSpatialVelocityTracker_update_position
  = unsafePerformIO $
      withCString "SpatialVelocityTracker" $
        \ clsNamePtr ->
          withCString "update_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

update_position ::
                  (SpatialVelocityTracker :< cls, Object :< cls) =>
                  cls -> Vector3 -> IO ()
update_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialVelocityTracker_update_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatialVelocityTracker_get_tracked_linear_velocity
             #-}

bindSpatialVelocityTracker_get_tracked_linear_velocity ::
                                                       MethodBind
bindSpatialVelocityTracker_get_tracked_linear_velocity
  = unsafePerformIO $
      withCString "SpatialVelocityTracker" $
        \ clsNamePtr ->
          withCString "get_tracked_linear_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tracked_linear_velocity ::
                              (SpatialVelocityTracker :< cls, Object :< cls) => cls -> IO Vector3
get_tracked_linear_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindSpatialVelocityTracker_get_tracked_linear_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpatialVelocityTracker_reset #-}

bindSpatialVelocityTracker_reset :: MethodBind
bindSpatialVelocityTracker_reset
  = unsafePerformIO $
      withCString "SpatialVelocityTracker" $
        \ clsNamePtr ->
          withCString "reset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reset ::
        (SpatialVelocityTracker :< cls, Object :< cls) =>
        cls -> Vector3 -> IO ()
reset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpatialVelocityTracker_reset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)