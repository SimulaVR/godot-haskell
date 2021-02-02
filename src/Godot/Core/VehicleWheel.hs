{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VehicleWheel
       (Godot.Core.VehicleWheel.get_brake,
        Godot.Core.VehicleWheel.get_damping_compression,
        Godot.Core.VehicleWheel.get_damping_relaxation,
        Godot.Core.VehicleWheel.get_engine_force,
        Godot.Core.VehicleWheel.get_friction_slip,
        Godot.Core.VehicleWheel.get_radius,
        Godot.Core.VehicleWheel.get_roll_influence,
        Godot.Core.VehicleWheel.get_rpm,
        Godot.Core.VehicleWheel.get_skidinfo,
        Godot.Core.VehicleWheel.get_steering,
        Godot.Core.VehicleWheel.get_suspension_max_force,
        Godot.Core.VehicleWheel.get_suspension_rest_length,
        Godot.Core.VehicleWheel.get_suspension_stiffness,
        Godot.Core.VehicleWheel.get_suspension_travel,
        Godot.Core.VehicleWheel.is_in_contact,
        Godot.Core.VehicleWheel.is_used_as_steering,
        Godot.Core.VehicleWheel.is_used_as_traction,
        Godot.Core.VehicleWheel.set_brake,
        Godot.Core.VehicleWheel.set_damping_compression,
        Godot.Core.VehicleWheel.set_damping_relaxation,
        Godot.Core.VehicleWheel.set_engine_force,
        Godot.Core.VehicleWheel.set_friction_slip,
        Godot.Core.VehicleWheel.set_radius,
        Godot.Core.VehicleWheel.set_roll_influence,
        Godot.Core.VehicleWheel.set_steering,
        Godot.Core.VehicleWheel.set_suspension_max_force,
        Godot.Core.VehicleWheel.set_suspension_rest_length,
        Godot.Core.VehicleWheel.set_suspension_stiffness,
        Godot.Core.VehicleWheel.set_suspension_travel,
        Godot.Core.VehicleWheel.set_use_as_steering,
        Godot.Core.VehicleWheel.set_use_as_traction)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVehicleWheel_get_brake #-}

bindVehicleWheel_get_brake :: MethodBind
bindVehicleWheel_get_brake
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_brake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_brake ::
            (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_brake cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_brake (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_damping_compression #-}

-- | The damping applied to the spring when the spring is being compressed. This value should be between 0.0 (no damping) and 1.0. A value of 0.0 means the car will keep bouncing as the spring keeps its energy. A good value for this is around 0.3 for a normal car, 0.5 for a race car.
bindVehicleWheel_get_damping_compression :: MethodBind
bindVehicleWheel_get_damping_compression
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_damping_compression" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The damping applied to the spring when the spring is being compressed. This value should be between 0.0 (no damping) and 1.0. A value of 0.0 means the car will keep bouncing as the spring keeps its energy. A good value for this is around 0.3 for a normal car, 0.5 for a race car.
get_damping_compression ::
                          (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_damping_compression cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_damping_compression
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_damping_relaxation #-}

-- | The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the [member damping_compression] property. For a [member damping_compression] value of 0.3, try a relaxation value of 0.5
bindVehicleWheel_get_damping_relaxation :: MethodBind
bindVehicleWheel_get_damping_relaxation
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_damping_relaxation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the [member damping_compression] property. For a [member damping_compression] value of 0.3, try a relaxation value of 0.5
get_damping_relaxation ::
                         (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_damping_relaxation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_damping_relaxation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_engine_force #-}

bindVehicleWheel_get_engine_force :: MethodBind
bindVehicleWheel_get_engine_force
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_engine_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_engine_force ::
                   (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_engine_force cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_engine_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_friction_slip #-}

-- | This determines how much grip this wheel has. It is combined with the friction setting of the surface the wheel is in contact with. 0.0 means no grip, 1.0 is normal grip. For a drift car setup, try setting the grip of the rear wheels slightly lower than the front wheels, or use a lower value to simulate tire wear.
--   			It's best to set this to 1.0 when starting out.
bindVehicleWheel_get_friction_slip :: MethodBind
bindVehicleWheel_get_friction_slip
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_friction_slip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This determines how much grip this wheel has. It is combined with the friction setting of the surface the wheel is in contact with. 0.0 means no grip, 1.0 is normal grip. For a drift car setup, try setting the grip of the rear wheels slightly lower than the front wheels, or use a lower value to simulate tire wear.
--   			It's best to set this to 1.0 when starting out.
get_friction_slip ::
                    (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_friction_slip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_friction_slip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_radius #-}

-- | The radius of the wheel in meters.
bindVehicleWheel_get_radius :: MethodBind
bindVehicleWheel_get_radius
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the wheel in meters.
get_radius ::
             (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_roll_influence #-}

-- | This value effects the roll of your vehicle. If set to 0.0 for all wheels your vehicle will be prone to rolling over while a value of 1.0 will resist body roll.
bindVehicleWheel_get_roll_influence :: MethodBind
bindVehicleWheel_get_roll_influence
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_roll_influence" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value effects the roll of your vehicle. If set to 0.0 for all wheels your vehicle will be prone to rolling over while a value of 1.0 will resist body roll.
get_roll_influence ::
                     (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_roll_influence cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_roll_influence
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_rpm #-}

bindVehicleWheel_get_rpm :: MethodBind
bindVehicleWheel_get_rpm
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_rpm" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_rpm :: (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_rpm cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_rpm (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_skidinfo #-}

-- | Returns a value between 0.0 and 1.0 that indicates whether this wheel is skidding. 0.0 is skidding (the wheel has lost grip, e.g. icy terrain), 1.0 means not skidding (the wheel has full grip, e.g. dry asphalt road).
bindVehicleWheel_get_skidinfo :: MethodBind
bindVehicleWheel_get_skidinfo
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_skidinfo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a value between 0.0 and 1.0 that indicates whether this wheel is skidding. 0.0 is skidding (the wheel has lost grip, e.g. icy terrain), 1.0 means not skidding (the wheel has full grip, e.g. dry asphalt road).
get_skidinfo ::
               (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_skidinfo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_skidinfo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_steering #-}

bindVehicleWheel_get_steering :: MethodBind
bindVehicleWheel_get_steering
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_steering ::
               (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_steering cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_steering (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_suspension_max_force #-}

-- | The maximum force the spring can resist. This value should be higher than a quarter of the [member RigidBody.mass] of the [VehicleBody] or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3x to 4x this number.
bindVehicleWheel_get_suspension_max_force :: MethodBind
bindVehicleWheel_get_suspension_max_force
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_suspension_max_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum force the spring can resist. This value should be higher than a quarter of the [member RigidBody.mass] of the [VehicleBody] or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3x to 4x this number.
get_suspension_max_force ::
                           (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_suspension_max_force cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_suspension_max_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_suspension_rest_length #-}

-- | This is the distance in meters the wheel is lowered from its origin point. Don't set this to 0.0 and move the wheel into position, instead move the origin point of your wheel (the gizmo in Godot) to the position the wheel will take when bottoming out, then use the rest length to move the wheel down to the position it should be in when the car is in rest.
bindVehicleWheel_get_suspension_rest_length :: MethodBind
bindVehicleWheel_get_suspension_rest_length
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_suspension_rest_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is the distance in meters the wheel is lowered from its origin point. Don't set this to 0.0 and move the wheel into position, instead move the origin point of your wheel (the gizmo in Godot) to the position the wheel will take when bottoming out, then use the rest length to move the wheel down to the position it should be in when the car is in rest.
get_suspension_rest_length ::
                             (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_suspension_rest_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_suspension_rest_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_suspension_stiffness #-}

-- | This value defines the stiffness of the suspension. Use a value lower than 50 for an off-road car, a value between 50 and 100 for a race car and try something around 200 for something like a Formula 1 car.
bindVehicleWheel_get_suspension_stiffness :: MethodBind
bindVehicleWheel_get_suspension_stiffness
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_suspension_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value defines the stiffness of the suspension. Use a value lower than 50 for an off-road car, a value between 50 and 100 for a race car and try something around 200 for something like a Formula 1 car.
get_suspension_stiffness ::
                           (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_suspension_stiffness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_suspension_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_get_suspension_travel #-}

-- | This is the distance the suspension can travel. As Godot measures are in meters keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car .
bindVehicleWheel_get_suspension_travel :: MethodBind
bindVehicleWheel_get_suspension_travel
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_suspension_travel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is the distance the suspension can travel. As Godot measures are in meters keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car .
get_suspension_travel ::
                        (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_suspension_travel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_suspension_travel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_is_in_contact #-}

-- | Returns [code]true[/code] if this wheel is in contact with a surface.
bindVehicleWheel_is_in_contact :: MethodBind
bindVehicleWheel_is_in_contact
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "is_in_contact" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this wheel is in contact with a surface.
is_in_contact ::
                (VehicleWheel :< cls, Object :< cls) => cls -> IO Bool
is_in_contact cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_is_in_contact (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_is_used_as_steering #-}

-- | If [code]true[/code] this wheel will be turned when the car steers.
bindVehicleWheel_is_used_as_steering :: MethodBind
bindVehicleWheel_is_used_as_steering
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "is_used_as_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code] this wheel will be turned when the car steers.
is_used_as_steering ::
                      (VehicleWheel :< cls, Object :< cls) => cls -> IO Bool
is_used_as_steering cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_is_used_as_steering
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_is_used_as_traction #-}

-- | If [code]true[/code] this wheel transfers engine force to the ground to propel the vehicle forward.
bindVehicleWheel_is_used_as_traction :: MethodBind
bindVehicleWheel_is_used_as_traction
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "is_used_as_traction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code] this wheel transfers engine force to the ground to propel the vehicle forward.
is_used_as_traction ::
                      (VehicleWheel :< cls, Object :< cls) => cls -> IO Bool
is_used_as_traction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_is_used_as_traction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_brake #-}

bindVehicleWheel_set_brake :: MethodBind
bindVehicleWheel_set_brake
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_brake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_brake ::
            (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_brake cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_brake (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_damping_compression #-}

-- | The damping applied to the spring when the spring is being compressed. This value should be between 0.0 (no damping) and 1.0. A value of 0.0 means the car will keep bouncing as the spring keeps its energy. A good value for this is around 0.3 for a normal car, 0.5 for a race car.
bindVehicleWheel_set_damping_compression :: MethodBind
bindVehicleWheel_set_damping_compression
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_damping_compression" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The damping applied to the spring when the spring is being compressed. This value should be between 0.0 (no damping) and 1.0. A value of 0.0 means the car will keep bouncing as the spring keeps its energy. A good value for this is around 0.3 for a normal car, 0.5 for a race car.
set_damping_compression ::
                          (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_damping_compression cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_damping_compression
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_damping_relaxation #-}

-- | The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the [member damping_compression] property. For a [member damping_compression] value of 0.3, try a relaxation value of 0.5
bindVehicleWheel_set_damping_relaxation :: MethodBind
bindVehicleWheel_set_damping_relaxation
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_damping_relaxation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the [member damping_compression] property. For a [member damping_compression] value of 0.3, try a relaxation value of 0.5
set_damping_relaxation ::
                         (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_damping_relaxation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_damping_relaxation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_engine_force #-}

bindVehicleWheel_set_engine_force :: MethodBind
bindVehicleWheel_set_engine_force
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_engine_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_engine_force ::
                   (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_engine_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_engine_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_friction_slip #-}

-- | This determines how much grip this wheel has. It is combined with the friction setting of the surface the wheel is in contact with. 0.0 means no grip, 1.0 is normal grip. For a drift car setup, try setting the grip of the rear wheels slightly lower than the front wheels, or use a lower value to simulate tire wear.
--   			It's best to set this to 1.0 when starting out.
bindVehicleWheel_set_friction_slip :: MethodBind
bindVehicleWheel_set_friction_slip
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_friction_slip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This determines how much grip this wheel has. It is combined with the friction setting of the surface the wheel is in contact with. 0.0 means no grip, 1.0 is normal grip. For a drift car setup, try setting the grip of the rear wheels slightly lower than the front wheels, or use a lower value to simulate tire wear.
--   			It's best to set this to 1.0 when starting out.
set_friction_slip ::
                    (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction_slip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_friction_slip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_radius #-}

-- | The radius of the wheel in meters.
bindVehicleWheel_set_radius :: MethodBind
bindVehicleWheel_set_radius
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The radius of the wheel in meters.
set_radius ::
             (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_roll_influence #-}

-- | This value effects the roll of your vehicle. If set to 0.0 for all wheels your vehicle will be prone to rolling over while a value of 1.0 will resist body roll.
bindVehicleWheel_set_roll_influence :: MethodBind
bindVehicleWheel_set_roll_influence
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_roll_influence" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value effects the roll of your vehicle. If set to 0.0 for all wheels your vehicle will be prone to rolling over while a value of 1.0 will resist body roll.
set_roll_influence ::
                     (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_roll_influence cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_roll_influence
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_steering #-}

bindVehicleWheel_set_steering :: MethodBind
bindVehicleWheel_set_steering
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_steering ::
               (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_steering cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_steering (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_suspension_max_force #-}

-- | The maximum force the spring can resist. This value should be higher than a quarter of the [member RigidBody.mass] of the [VehicleBody] or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3x to 4x this number.
bindVehicleWheel_set_suspension_max_force :: MethodBind
bindVehicleWheel_set_suspension_max_force
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_suspension_max_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum force the spring can resist. This value should be higher than a quarter of the [member RigidBody.mass] of the [VehicleBody] or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3x to 4x this number.
set_suspension_max_force ::
                           (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_suspension_max_force cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_suspension_max_force
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_suspension_rest_length #-}

-- | This is the distance in meters the wheel is lowered from its origin point. Don't set this to 0.0 and move the wheel into position, instead move the origin point of your wheel (the gizmo in Godot) to the position the wheel will take when bottoming out, then use the rest length to move the wheel down to the position it should be in when the car is in rest.
bindVehicleWheel_set_suspension_rest_length :: MethodBind
bindVehicleWheel_set_suspension_rest_length
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_suspension_rest_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is the distance in meters the wheel is lowered from its origin point. Don't set this to 0.0 and move the wheel into position, instead move the origin point of your wheel (the gizmo in Godot) to the position the wheel will take when bottoming out, then use the rest length to move the wheel down to the position it should be in when the car is in rest.
set_suspension_rest_length ::
                             (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_suspension_rest_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_suspension_rest_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_suspension_stiffness #-}

-- | This value defines the stiffness of the suspension. Use a value lower than 50 for an off-road car, a value between 50 and 100 for a race car and try something around 200 for something like a Formula 1 car.
bindVehicleWheel_set_suspension_stiffness :: MethodBind
bindVehicleWheel_set_suspension_stiffness
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_suspension_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value defines the stiffness of the suspension. Use a value lower than 50 for an off-road car, a value between 50 and 100 for a race car and try something around 200 for something like a Formula 1 car.
set_suspension_stiffness ::
                           (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_suspension_stiffness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_suspension_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_suspension_travel #-}

-- | This is the distance the suspension can travel. As Godot measures are in meters keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car .
bindVehicleWheel_set_suspension_travel :: MethodBind
bindVehicleWheel_set_suspension_travel
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_suspension_travel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is the distance the suspension can travel. As Godot measures are in meters keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car .
set_suspension_travel ::
                        (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_suspension_travel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_suspension_travel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_use_as_steering #-}

-- | If [code]true[/code] this wheel will be turned when the car steers.
bindVehicleWheel_set_use_as_steering :: MethodBind
bindVehicleWheel_set_use_as_steering
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_use_as_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code] this wheel will be turned when the car steers.
set_use_as_steering ::
                      (VehicleWheel :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_as_steering cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_use_as_steering
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVehicleWheel_set_use_as_traction #-}

-- | If [code]true[/code] this wheel transfers engine force to the ground to propel the vehicle forward.
bindVehicleWheel_set_use_as_traction :: MethodBind
bindVehicleWheel_set_use_as_traction
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_use_as_traction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code] this wheel transfers engine force to the ground to propel the vehicle forward.
set_use_as_traction ::
                      (VehicleWheel :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_as_traction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_use_as_traction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)