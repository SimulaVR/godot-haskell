{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Spatial()

instance NodeProperty VehicleWheel "brake" Float 'False where
        nodeProperty = (get_brake, wrapDroppingSetter set_brake, Nothing)

instance NodeProperty VehicleWheel "damping_compression" Float
           'False
         where
        nodeProperty
          = (get_damping_compression,
             wrapDroppingSetter set_damping_compression, Nothing)

instance NodeProperty VehicleWheel "damping_relaxation" Float
           'False
         where
        nodeProperty
          = (get_damping_relaxation,
             wrapDroppingSetter set_damping_relaxation, Nothing)

instance NodeProperty VehicleWheel "engine_force" Float 'False
         where
        nodeProperty
          = (get_engine_force, wrapDroppingSetter set_engine_force, Nothing)

instance NodeProperty VehicleWheel "steering" Float 'False where
        nodeProperty
          = (get_steering, wrapDroppingSetter set_steering, Nothing)

instance NodeProperty VehicleWheel "suspension_max_force" Float
           'False
         where
        nodeProperty
          = (get_suspension_max_force,
             wrapDroppingSetter set_suspension_max_force, Nothing)

instance NodeProperty VehicleWheel "suspension_stiffness" Float
           'False
         where
        nodeProperty
          = (get_suspension_stiffness,
             wrapDroppingSetter set_suspension_stiffness, Nothing)

instance NodeProperty VehicleWheel "suspension_travel" Float 'False
         where
        nodeProperty
          = (get_suspension_travel, wrapDroppingSetter set_suspension_travel,
             Nothing)

instance NodeProperty VehicleWheel "use_as_steering" Bool 'False
         where
        nodeProperty
          = (is_used_as_steering, wrapDroppingSetter set_use_as_steering,
             Nothing)

instance NodeProperty VehicleWheel "use_as_traction" Bool 'False
         where
        nodeProperty
          = (is_used_as_traction, wrapDroppingSetter set_use_as_traction,
             Nothing)

instance NodeProperty VehicleWheel "wheel_friction_slip" Float
           'False
         where
        nodeProperty
          = (get_friction_slip, wrapDroppingSetter set_friction_slip,
             Nothing)

instance NodeProperty VehicleWheel "wheel_radius" Float 'False
         where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

instance NodeProperty VehicleWheel "wheel_rest_length" Float 'False
         where
        nodeProperty
          = (get_suspension_rest_length,
             wrapDroppingSetter set_suspension_rest_length, Nothing)

instance NodeProperty VehicleWheel "wheel_roll_influence" Float
           'False
         where
        nodeProperty
          = (get_roll_influence, wrapDroppingSetter set_roll_influence,
             Nothing)

{-# NOINLINE bindVehicleWheel_get_brake #-}

-- | Slows down the wheel by applying a braking force. The wheel is only slowed down if it is in contact with a surface. The force you need to apply to adequately slow down your vehicle depends on the @RigidBody.mass@ of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 30 range for hard braking.
bindVehicleWheel_get_brake :: MethodBind
bindVehicleWheel_get_brake
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_brake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Slows down the wheel by applying a braking force. The wheel is only slowed down if it is in contact with a surface. The force you need to apply to adequately slow down your vehicle depends on the @RigidBody.mass@ of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 30 range for hard braking.
get_brake ::
            (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_brake cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_brake (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleWheel "get_brake" '[] (IO Float) where
        nodeMethod = Godot.Core.VehicleWheel.get_brake

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

instance NodeMethod VehicleWheel "get_damping_compression" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_damping_compression

{-# NOINLINE bindVehicleWheel_get_damping_relaxation #-}

-- | The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the @damping_compression@ property. For a @damping_compression@ value of 0.3, try a relaxation value of 0.5.
bindVehicleWheel_get_damping_relaxation :: MethodBind
bindVehicleWheel_get_damping_relaxation
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_damping_relaxation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the @damping_compression@ property. For a @damping_compression@ value of 0.3, try a relaxation value of 0.5.
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

instance NodeMethod VehicleWheel "get_damping_relaxation" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_damping_relaxation

{-# NOINLINE bindVehicleWheel_get_engine_force #-}

-- | Accelerates the wheel by applying an engine force. The wheel is only speed up if it is in contact with a surface. The @RigidBody.mass@ of the vehicle has an effect on the acceleration of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 50 range for acceleration.
--   			__Note:__ The simulation does not take the effect of gears into account, you will need to add logic for this if you wish to simulate gears.
--   			A negative value will result in the wheel reversing.
bindVehicleWheel_get_engine_force :: MethodBind
bindVehicleWheel_get_engine_force
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_engine_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Accelerates the wheel by applying an engine force. The wheel is only speed up if it is in contact with a surface. The @RigidBody.mass@ of the vehicle has an effect on the acceleration of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 50 range for acceleration.
--   			__Note:__ The simulation does not take the effect of gears into account, you will need to add logic for this if you wish to simulate gears.
--   			A negative value will result in the wheel reversing.
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

instance NodeMethod VehicleWheel "get_engine_force" '[] (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_engine_force

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

instance NodeMethod VehicleWheel "get_friction_slip" '[] (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_friction_slip

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

instance NodeMethod VehicleWheel "get_radius" '[] (IO Float) where
        nodeMethod = Godot.Core.VehicleWheel.get_radius

{-# NOINLINE bindVehicleWheel_get_roll_influence #-}

-- | This value affects the roll of your vehicle. If set to 1.0 for all wheels, your vehicle will be prone to rolling over, while a value of 0.0 will resist body roll.
bindVehicleWheel_get_roll_influence :: MethodBind
bindVehicleWheel_get_roll_influence
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_roll_influence" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value affects the roll of your vehicle. If set to 1.0 for all wheels, your vehicle will be prone to rolling over, while a value of 0.0 will resist body roll.
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

instance NodeMethod VehicleWheel "get_roll_influence" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_roll_influence

{-# NOINLINE bindVehicleWheel_get_rpm #-}

-- | Returns the rotational speed of the wheel in revolutions per minute.
bindVehicleWheel_get_rpm :: MethodBind
bindVehicleWheel_get_rpm
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_rpm" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the rotational speed of the wheel in revolutions per minute.
get_rpm :: (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_rpm cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_rpm (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleWheel "get_rpm" '[] (IO Float) where
        nodeMethod = Godot.Core.VehicleWheel.get_rpm

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

instance NodeMethod VehicleWheel "get_skidinfo" '[] (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_skidinfo

{-# NOINLINE bindVehicleWheel_get_steering #-}

-- | The steering angle for the wheel. Setting this to a non-zero value will result in the vehicle turning when it's moving.
bindVehicleWheel_get_steering :: MethodBind
bindVehicleWheel_get_steering
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The steering angle for the wheel. Setting this to a non-zero value will result in the vehicle turning when it's moving.
get_steering ::
               (VehicleWheel :< cls, Object :< cls) => cls -> IO Float
get_steering cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_get_steering (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleWheel "get_steering" '[] (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_steering

{-# NOINLINE bindVehicleWheel_get_suspension_max_force #-}

-- | The maximum force the spring can resist. This value should be higher than a quarter of the @RigidBody.mass@ of the @VehicleBody@ or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3× to 4× this number.
bindVehicleWheel_get_suspension_max_force :: MethodBind
bindVehicleWheel_get_suspension_max_force
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_suspension_max_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum force the spring can resist. This value should be higher than a quarter of the @RigidBody.mass@ of the @VehicleBody@ or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3× to 4× this number.
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

instance NodeMethod VehicleWheel "get_suspension_max_force" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_suspension_max_force

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

instance NodeMethod VehicleWheel "get_suspension_rest_length" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_suspension_rest_length

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

instance NodeMethod VehicleWheel "get_suspension_stiffness" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_suspension_stiffness

{-# NOINLINE bindVehicleWheel_get_suspension_travel #-}

-- | This is the distance the suspension can travel. As Godot units are equivalent to meters, keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car.
bindVehicleWheel_get_suspension_travel :: MethodBind
bindVehicleWheel_get_suspension_travel
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "get_suspension_travel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is the distance the suspension can travel. As Godot units are equivalent to meters, keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car.
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

instance NodeMethod VehicleWheel "get_suspension_travel" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VehicleWheel.get_suspension_travel

{-# NOINLINE bindVehicleWheel_is_in_contact #-}

-- | Returns @true@ if this wheel is in contact with a surface.
bindVehicleWheel_is_in_contact :: MethodBind
bindVehicleWheel_is_in_contact
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "is_in_contact" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this wheel is in contact with a surface.
is_in_contact ::
                (VehicleWheel :< cls, Object :< cls) => cls -> IO Bool
is_in_contact cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_is_in_contact (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleWheel "is_in_contact" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.VehicleWheel.is_in_contact

{-# NOINLINE bindVehicleWheel_is_used_as_steering #-}

-- | If @true@, this wheel will be turned when the car steers. This value is used in conjunction with @VehicleBody.steering@ and ignored if you are using the per-wheel @steering@ value instead.
bindVehicleWheel_is_used_as_steering :: MethodBind
bindVehicleWheel_is_used_as_steering
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "is_used_as_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this wheel will be turned when the car steers. This value is used in conjunction with @VehicleBody.steering@ and ignored if you are using the per-wheel @steering@ value instead.
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

instance NodeMethod VehicleWheel "is_used_as_steering" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VehicleWheel.is_used_as_steering

{-# NOINLINE bindVehicleWheel_is_used_as_traction #-}

-- | If @true@, this wheel transfers engine force to the ground to propel the vehicle forward. This value is used in conjunction with @VehicleBody.engine_force@ and ignored if you are using the per-wheel @engine_force@ value instead.
bindVehicleWheel_is_used_as_traction :: MethodBind
bindVehicleWheel_is_used_as_traction
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "is_used_as_traction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this wheel transfers engine force to the ground to propel the vehicle forward. This value is used in conjunction with @VehicleBody.engine_force@ and ignored if you are using the per-wheel @engine_force@ value instead.
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

instance NodeMethod VehicleWheel "is_used_as_traction" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VehicleWheel.is_used_as_traction

{-# NOINLINE bindVehicleWheel_set_brake #-}

-- | Slows down the wheel by applying a braking force. The wheel is only slowed down if it is in contact with a surface. The force you need to apply to adequately slow down your vehicle depends on the @RigidBody.mass@ of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 30 range for hard braking.
bindVehicleWheel_set_brake :: MethodBind
bindVehicleWheel_set_brake
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_brake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Slows down the wheel by applying a braking force. The wheel is only slowed down if it is in contact with a surface. The force you need to apply to adequately slow down your vehicle depends on the @RigidBody.mass@ of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 30 range for hard braking.
set_brake ::
            (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_brake cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_brake (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleWheel "set_brake" '[Float] (IO ()) where
        nodeMethod = Godot.Core.VehicleWheel.set_brake

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

instance NodeMethod VehicleWheel "set_damping_compression" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_damping_compression

{-# NOINLINE bindVehicleWheel_set_damping_relaxation #-}

-- | The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the @damping_compression@ property. For a @damping_compression@ value of 0.3, try a relaxation value of 0.5.
bindVehicleWheel_set_damping_relaxation :: MethodBind
bindVehicleWheel_set_damping_relaxation
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_damping_relaxation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The damping applied to the spring when relaxing. This value should be between 0.0 (no damping) and 1.0. This value should always be slightly higher than the @damping_compression@ property. For a @damping_compression@ value of 0.3, try a relaxation value of 0.5.
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

instance NodeMethod VehicleWheel "set_damping_relaxation" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_damping_relaxation

{-# NOINLINE bindVehicleWheel_set_engine_force #-}

-- | Accelerates the wheel by applying an engine force. The wheel is only speed up if it is in contact with a surface. The @RigidBody.mass@ of the vehicle has an effect on the acceleration of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 50 range for acceleration.
--   			__Note:__ The simulation does not take the effect of gears into account, you will need to add logic for this if you wish to simulate gears.
--   			A negative value will result in the wheel reversing.
bindVehicleWheel_set_engine_force :: MethodBind
bindVehicleWheel_set_engine_force
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_engine_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Accelerates the wheel by applying an engine force. The wheel is only speed up if it is in contact with a surface. The @RigidBody.mass@ of the vehicle has an effect on the acceleration of the vehicle. For a vehicle with a mass set to 1000, try a value in the 25 - 50 range for acceleration.
--   			__Note:__ The simulation does not take the effect of gears into account, you will need to add logic for this if you wish to simulate gears.
--   			A negative value will result in the wheel reversing.
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

instance NodeMethod VehicleWheel "set_engine_force" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_engine_force

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

instance NodeMethod VehicleWheel "set_friction_slip" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_friction_slip

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

instance NodeMethod VehicleWheel "set_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_radius

{-# NOINLINE bindVehicleWheel_set_roll_influence #-}

-- | This value affects the roll of your vehicle. If set to 1.0 for all wheels, your vehicle will be prone to rolling over, while a value of 0.0 will resist body roll.
bindVehicleWheel_set_roll_influence :: MethodBind
bindVehicleWheel_set_roll_influence
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_roll_influence" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This value affects the roll of your vehicle. If set to 1.0 for all wheels, your vehicle will be prone to rolling over, while a value of 0.0 will resist body roll.
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

instance NodeMethod VehicleWheel "set_roll_influence" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_roll_influence

{-# NOINLINE bindVehicleWheel_set_steering #-}

-- | The steering angle for the wheel. Setting this to a non-zero value will result in the vehicle turning when it's moving.
bindVehicleWheel_set_steering :: MethodBind
bindVehicleWheel_set_steering
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The steering angle for the wheel. Setting this to a non-zero value will result in the vehicle turning when it's moving.
set_steering ::
               (VehicleWheel :< cls, Object :< cls) => cls -> Float -> IO ()
set_steering cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVehicleWheel_set_steering (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VehicleWheel "set_steering" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_steering

{-# NOINLINE bindVehicleWheel_set_suspension_max_force #-}

-- | The maximum force the spring can resist. This value should be higher than a quarter of the @RigidBody.mass@ of the @VehicleBody@ or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3× to 4× this number.
bindVehicleWheel_set_suspension_max_force :: MethodBind
bindVehicleWheel_set_suspension_max_force
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_suspension_max_force" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum force the spring can resist. This value should be higher than a quarter of the @RigidBody.mass@ of the @VehicleBody@ or the spring will not carry the weight of the vehicle. Good results are often obtained by a value that is about 3× to 4× this number.
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

instance NodeMethod VehicleWheel "set_suspension_max_force"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_suspension_max_force

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

instance NodeMethod VehicleWheel "set_suspension_rest_length"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_suspension_rest_length

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

instance NodeMethod VehicleWheel "set_suspension_stiffness"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_suspension_stiffness

{-# NOINLINE bindVehicleWheel_set_suspension_travel #-}

-- | This is the distance the suspension can travel. As Godot units are equivalent to meters, keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car.
bindVehicleWheel_set_suspension_travel :: MethodBind
bindVehicleWheel_set_suspension_travel
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_suspension_travel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is the distance the suspension can travel. As Godot units are equivalent to meters, keep this setting relatively low. Try a value between 0.1 and 0.3 depending on the type of car.
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

instance NodeMethod VehicleWheel "set_suspension_travel" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_suspension_travel

{-# NOINLINE bindVehicleWheel_set_use_as_steering #-}

-- | If @true@, this wheel will be turned when the car steers. This value is used in conjunction with @VehicleBody.steering@ and ignored if you are using the per-wheel @steering@ value instead.
bindVehicleWheel_set_use_as_steering :: MethodBind
bindVehicleWheel_set_use_as_steering
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_use_as_steering" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this wheel will be turned when the car steers. This value is used in conjunction with @VehicleBody.steering@ and ignored if you are using the per-wheel @steering@ value instead.
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

instance NodeMethod VehicleWheel "set_use_as_steering" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_use_as_steering

{-# NOINLINE bindVehicleWheel_set_use_as_traction #-}

-- | If @true@, this wheel transfers engine force to the ground to propel the vehicle forward. This value is used in conjunction with @VehicleBody.engine_force@ and ignored if you are using the per-wheel @engine_force@ value instead.
bindVehicleWheel_set_use_as_traction :: MethodBind
bindVehicleWheel_set_use_as_traction
  = unsafePerformIO $
      withCString "VehicleWheel" $
        \ clsNamePtr ->
          withCString "set_use_as_traction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this wheel transfers engine force to the ground to propel the vehicle forward. This value is used in conjunction with @VehicleBody.engine_force@ and ignored if you are using the per-wheel @engine_force@ value instead.
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

instance NodeMethod VehicleWheel "set_use_as_traction" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VehicleWheel.set_use_as_traction