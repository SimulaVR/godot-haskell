{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.KinematicBody2D
       (Godot.Core.KinematicBody2D._direct_state_changed,
        Godot.Core.KinematicBody2D.get_floor_normal,
        Godot.Core.KinematicBody2D.get_floor_velocity,
        Godot.Core.KinematicBody2D.get_safe_margin,
        Godot.Core.KinematicBody2D.get_slide_collision,
        Godot.Core.KinematicBody2D.get_slide_count,
        Godot.Core.KinematicBody2D.is_on_ceiling,
        Godot.Core.KinematicBody2D.is_on_floor,
        Godot.Core.KinematicBody2D.is_on_wall,
        Godot.Core.KinematicBody2D.is_sync_to_physics_enabled,
        Godot.Core.KinematicBody2D.move_and_collide,
        Godot.Core.KinematicBody2D.move_and_slide,
        Godot.Core.KinematicBody2D.move_and_slide_with_snap,
        Godot.Core.KinematicBody2D.set_safe_margin,
        Godot.Core.KinematicBody2D.set_sync_to_physics,
        Godot.Core.KinematicBody2D.test_move)
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
import Godot.Core.PhysicsBody2D()

instance NodeProperty KinematicBody2D "collision/safe_margin" Float
           'False
         where
        nodeProperty
          = (get_safe_margin, wrapDroppingSetter set_safe_margin, Nothing)

instance NodeProperty KinematicBody2D "motion/sync_to_physics" Bool
           'False
         where
        nodeProperty
          = (is_sync_to_physics_enabled,
             wrapDroppingSetter set_sync_to_physics, Nothing)

{-# NOINLINE bindKinematicBody2D__direct_state_changed #-}

bindKinematicBody2D__direct_state_changed :: MethodBind
bindKinematicBody2D__direct_state_changed
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "_direct_state_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_direct_state_changed ::
                        (KinematicBody2D :< cls, Object :< cls) => cls -> Object -> IO ()
_direct_state_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D__direct_state_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "_direct_state_changed"
           '[Object]
           (IO ())
         where
        nodeMethod = Godot.Core.KinematicBody2D._direct_state_changed

{-# NOINLINE bindKinematicBody2D_get_floor_normal #-}

-- | Returns the surface normal of the floor at the last collision point. Only valid after calling @method move_and_slide@ or @method move_and_slide_with_snap@ and when @method is_on_floor@ returns @true@.
bindKinematicBody2D_get_floor_normal :: MethodBind
bindKinematicBody2D_get_floor_normal
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_floor_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the surface normal of the floor at the last collision point. Only valid after calling @method move_and_slide@ or @method move_and_slide_with_snap@ and when @method is_on_floor@ returns @true@.
get_floor_normal ::
                   (KinematicBody2D :< cls, Object :< cls) => cls -> IO Vector2
get_floor_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_floor_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_floor_normal" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_floor_normal

{-# NOINLINE bindKinematicBody2D_get_floor_velocity #-}

-- | Returns the linear velocity of the floor at the last collision point. Only valid after calling @method move_and_slide@ or @method move_and_slide_with_snap@ and when @method is_on_floor@ returns @true@.
bindKinematicBody2D_get_floor_velocity :: MethodBind
bindKinematicBody2D_get_floor_velocity
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_floor_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the linear velocity of the floor at the last collision point. Only valid after calling @method move_and_slide@ or @method move_and_slide_with_snap@ and when @method is_on_floor@ returns @true@.
get_floor_velocity ::
                     (KinematicBody2D :< cls, Object :< cls) => cls -> IO Vector2
get_floor_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_floor_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_floor_velocity" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_floor_velocity

{-# NOINLINE bindKinematicBody2D_get_safe_margin #-}

-- | If the body is at least this close to another body, this body will consider them to be colliding.
bindKinematicBody2D_get_safe_margin :: MethodBind
bindKinematicBody2D_get_safe_margin
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_safe_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the body is at least this close to another body, this body will consider them to be colliding.
get_safe_margin ::
                  (KinematicBody2D :< cls, Object :< cls) => cls -> IO Float
get_safe_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_safe_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_safe_margin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_safe_margin

{-# NOINLINE bindKinematicBody2D_get_slide_collision #-}

-- | Returns a @KinematicCollision2D@, which contains information about a collision that occurred during the last @method move_and_slide@ call. Since the body can collide several times in a single call to @method move_and_slide@, you must specify the index of the collision in the range 0 to (@method get_slide_count@ - 1).
--   				__Example usage:__
--   				
--   @
--   
--   				for i in get_slide_count():
--   				    var collision = get_slide_collision(i)
--   				    print("Collided with: ", collision.collider.name)
--   				
--   @
bindKinematicBody2D_get_slide_collision :: MethodBind
bindKinematicBody2D_get_slide_collision
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_slide_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @KinematicCollision2D@, which contains information about a collision that occurred during the last @method move_and_slide@ call. Since the body can collide several times in a single call to @method move_and_slide@, you must specify the index of the collision in the range 0 to (@method get_slide_count@ - 1).
--   				__Example usage:__
--   				
--   @
--   
--   				for i in get_slide_count():
--   				    var collision = get_slide_collision(i)
--   				    print("Collided with: ", collision.collider.name)
--   				
--   @
get_slide_collision ::
                      (KinematicBody2D :< cls, Object :< cls) =>
                      cls -> Int -> IO KinematicCollision2D
get_slide_collision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_slide_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_slide_collision" '[Int]
           (IO KinematicCollision2D)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_slide_collision

{-# NOINLINE bindKinematicBody2D_get_slide_count #-}

-- | Returns the number of times the body collided and changed direction during the last call to @method move_and_slide@.
bindKinematicBody2D_get_slide_count :: MethodBind
bindKinematicBody2D_get_slide_count
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_slide_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of times the body collided and changed direction during the last call to @method move_and_slide@.
get_slide_count ::
                  (KinematicBody2D :< cls, Object :< cls) => cls -> IO Int
get_slide_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_get_slide_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "get_slide_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.KinematicBody2D.get_slide_count

{-# NOINLINE bindKinematicBody2D_is_on_ceiling #-}

-- | Returns @true@ if the body is on the ceiling. Only updates when calling @method move_and_slide@.
bindKinematicBody2D_is_on_ceiling :: MethodBind
bindKinematicBody2D_is_on_ceiling
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_ceiling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the body is on the ceiling. Only updates when calling @method move_and_slide@.
is_on_ceiling ::
                (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_on_ceiling cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_is_on_ceiling
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "is_on_ceiling" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.is_on_ceiling

{-# NOINLINE bindKinematicBody2D_is_on_floor #-}

-- | Returns @true@ if the body is on the floor. Only updates when calling @method move_and_slide@.
bindKinematicBody2D_is_on_floor :: MethodBind
bindKinematicBody2D_is_on_floor
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_floor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the body is on the floor. Only updates when calling @method move_and_slide@.
is_on_floor ::
              (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_on_floor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_is_on_floor (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "is_on_floor" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.is_on_floor

{-# NOINLINE bindKinematicBody2D_is_on_wall #-}

-- | Returns @true@ if the body is on a wall. Only updates when calling @method move_and_slide@.
bindKinematicBody2D_is_on_wall :: MethodBind
bindKinematicBody2D_is_on_wall
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_wall" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the body is on a wall. Only updates when calling @method move_and_slide@.
is_on_wall ::
             (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_on_wall cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_is_on_wall (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "is_on_wall" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.is_on_wall

{-# NOINLINE bindKinematicBody2D_is_sync_to_physics_enabled #-}

-- | If @true@, the body's movement will be synchronized to the physics frame. This is useful when animating movement via @AnimationPlayer@, for example on moving platforms. Do __not__ use together with @method move_and_slide@ or @method move_and_collide@ functions.
bindKinematicBody2D_is_sync_to_physics_enabled :: MethodBind
bindKinematicBody2D_is_sync_to_physics_enabled
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_sync_to_physics_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body's movement will be synchronized to the physics frame. This is useful when animating movement via @AnimationPlayer@, for example on moving platforms. Do __not__ use together with @method move_and_slide@ or @method move_and_collide@ functions.
is_sync_to_physics_enabled ::
                             (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_sync_to_physics_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindKinematicBody2D_is_sync_to_physics_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "is_sync_to_physics_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.is_sync_to_physics_enabled

{-# NOINLINE bindKinematicBody2D_move_and_collide #-}

-- | Moves the body along the vector @rel_vec@. The body will stop if it collides. Returns a @KinematicCollision2D@, which contains information about the collision.
--   				If @test_only@ is @true@, the body does not move but the would-be collision information is given.
bindKinematicBody2D_move_and_collide :: MethodBind
bindKinematicBody2D_move_and_collide
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_collide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the body along the vector @rel_vec@. The body will stop if it collides. Returns a @KinematicCollision2D@, which contains information about the collision.
--   				If @test_only@ is @true@, the body does not move but the would-be collision information is given.
move_and_collide ::
                   (KinematicBody2D :< cls, Object :< cls) =>
                   cls ->
                     Vector2 ->
                       Maybe Bool -> Maybe Bool -> Maybe Bool -> IO KinematicCollision2D
move_and_collide cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, maybe (VariantBool True) toVariant arg2,
       maybe (VariantBool True) toVariant arg3,
       maybe (VariantBool False) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_collide
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "move_and_collide"
           '[Vector2, Maybe Bool, Maybe Bool, Maybe Bool]
           (IO KinematicCollision2D)
         where
        nodeMethod = Godot.Core.KinematicBody2D.move_and_collide

{-# NOINLINE bindKinematicBody2D_move_and_slide #-}

-- | Moves the body along a vector. If the body collides with another, it will slide along the other body rather than stop immediately. If the other body is a @KinematicBody2D@ or @RigidBody2D@, it will also be affected by the motion of the other body. You can use this to make moving or rotating platforms, or to make nodes push other nodes.
--   				This method should be used in @method Node._physics_process@ (or in a method called by @method Node._physics_process@), as it uses the physics step's @delta@ value automatically in calculations. Otherwise, the simulation will run at an incorrect speed.
--   				@linear_velocity@ is the velocity vector in pixels per second. Unlike in @method move_and_collide@, you should @i@not@/i@ multiply it by @delta@ — the physics engine handles applying the velocity.
--   				@up_direction@ is the up direction, used to determine what is a wall and what is a floor or a ceiling. If set to the default value of @Vector2(0, 0)@, everything is considered a wall. This is useful for topdown games.
--   				If @stop_on_slope@ is @true@, body will not slide on slopes when you include gravity in @linear_velocity@ and the body is standing still.
--   				If the body collides, it will change direction a maximum of @max_slides@ times before it stops.
--   				@floor_max_angle@ is the maximum angle (in radians) where a slope is still considered a floor (or a ceiling), rather than a wall. The default value equals 45 degrees.
--   				If @infinite_inertia@ is @true@, body will be able to push @RigidBody2D@ nodes, but it won't also detect any collisions with them. If @false@, it will interact with @RigidBody2D@ nodes like with @StaticBody2D@.
--   				Returns the @linear_velocity@ vector, rotated and/or scaled if a slide collision occurred. To get detailed information about collisions that occurred, use @method get_slide_collision@.
bindKinematicBody2D_move_and_slide :: MethodBind
bindKinematicBody2D_move_and_slide
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_slide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the body along a vector. If the body collides with another, it will slide along the other body rather than stop immediately. If the other body is a @KinematicBody2D@ or @RigidBody2D@, it will also be affected by the motion of the other body. You can use this to make moving or rotating platforms, or to make nodes push other nodes.
--   				This method should be used in @method Node._physics_process@ (or in a method called by @method Node._physics_process@), as it uses the physics step's @delta@ value automatically in calculations. Otherwise, the simulation will run at an incorrect speed.
--   				@linear_velocity@ is the velocity vector in pixels per second. Unlike in @method move_and_collide@, you should @i@not@/i@ multiply it by @delta@ — the physics engine handles applying the velocity.
--   				@up_direction@ is the up direction, used to determine what is a wall and what is a floor or a ceiling. If set to the default value of @Vector2(0, 0)@, everything is considered a wall. This is useful for topdown games.
--   				If @stop_on_slope@ is @true@, body will not slide on slopes when you include gravity in @linear_velocity@ and the body is standing still.
--   				If the body collides, it will change direction a maximum of @max_slides@ times before it stops.
--   				@floor_max_angle@ is the maximum angle (in radians) where a slope is still considered a floor (or a ceiling), rather than a wall. The default value equals 45 degrees.
--   				If @infinite_inertia@ is @true@, body will be able to push @RigidBody2D@ nodes, but it won't also detect any collisions with them. If @false@, it will interact with @RigidBody2D@ nodes like with @StaticBody2D@.
--   				Returns the @linear_velocity@ vector, rotated and/or scaled if a slide collision occurred. To get detailed information about collisions that occurred, use @method get_slide_collision@.
move_and_slide ::
                 (KinematicBody2D :< cls, Object :< cls) =>
                 cls ->
                   Vector2 ->
                     Maybe Vector2 ->
                       Maybe Bool -> Maybe Int -> Maybe Float -> Maybe Bool -> IO Vector2
move_and_slide cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantVector2 (V2 0 0) arg2,
       maybe (VariantBool False) toVariant arg3,
       maybe (VariantInt (4)) toVariant arg4,
       maybe (VariantReal (0.785398)) toVariant arg5,
       maybe (VariantBool True) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_slide
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "move_and_slide"
           '[Vector2, Maybe Vector2, Maybe Bool, Maybe Int, Maybe Float,
             Maybe Bool]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.KinematicBody2D.move_and_slide

{-# NOINLINE bindKinematicBody2D_move_and_slide_with_snap #-}

-- | Moves the body while keeping it attached to slopes. Similar to @method move_and_slide@.
--   				As long as the @snap@ vector is in contact with the ground, the body will remain attached to the surface. This means you must disable snap in order to jump, for example. You can do this by setting @snap@ to @(0, 0)@ or by using @method move_and_slide@ instead.
bindKinematicBody2D_move_and_slide_with_snap :: MethodBind
bindKinematicBody2D_move_and_slide_with_snap
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_slide_with_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the body while keeping it attached to slopes. Similar to @method move_and_slide@.
--   				As long as the @snap@ vector is in contact with the ground, the body will remain attached to the surface. This means you must disable snap in order to jump, for example. You can do this by setting @snap@ to @(0, 0)@ or by using @method move_and_slide@ instead.
move_and_slide_with_snap ::
                           (KinematicBody2D :< cls, Object :< cls) =>
                           cls ->
                             Vector2 ->
                               Vector2 ->
                                 Maybe Vector2 ->
                                   Maybe Bool ->
                                     Maybe Int -> Maybe Float -> Maybe Bool -> IO Vector2
move_and_slide_with_snap cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantVector2 (V2 0 0) arg3,
       maybe (VariantBool False) toVariant arg4,
       maybe (VariantInt (4)) toVariant arg5,
       maybe (VariantReal (0.785398)) toVariant arg6,
       maybe (VariantBool True) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_slide_with_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "move_and_slide_with_snap"
           '[Vector2, Vector2, Maybe Vector2, Maybe Bool, Maybe Int,
             Maybe Float, Maybe Bool]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.KinematicBody2D.move_and_slide_with_snap

{-# NOINLINE bindKinematicBody2D_set_safe_margin #-}

-- | If the body is at least this close to another body, this body will consider them to be colliding.
bindKinematicBody2D_set_safe_margin :: MethodBind
bindKinematicBody2D_set_safe_margin
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "set_safe_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the body is at least this close to another body, this body will consider them to be colliding.
set_safe_margin ::
                  (KinematicBody2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_safe_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_set_safe_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "set_safe_margin" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.KinematicBody2D.set_safe_margin

{-# NOINLINE bindKinematicBody2D_set_sync_to_physics #-}

-- | If @true@, the body's movement will be synchronized to the physics frame. This is useful when animating movement via @AnimationPlayer@, for example on moving platforms. Do __not__ use together with @method move_and_slide@ or @method move_and_collide@ functions.
bindKinematicBody2D_set_sync_to_physics :: MethodBind
bindKinematicBody2D_set_sync_to_physics
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "set_sync_to_physics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the body's movement will be synchronized to the physics frame. This is useful when animating movement via @AnimationPlayer@, for example on moving platforms. Do __not__ use together with @method move_and_slide@ or @method move_and_collide@ functions.
set_sync_to_physics ::
                      (KinematicBody2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_sync_to_physics cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_set_sync_to_physics
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "set_sync_to_physics" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.KinematicBody2D.set_sync_to_physics

{-# NOINLINE bindKinematicBody2D_test_move #-}

-- | Checks for collisions without moving the body. Virtually sets the node's position, scale and rotation to that of the given @Transform2D@, then tries to move the body along the vector @rel_vec@. Returns @true@ if a collision would occur.
bindKinematicBody2D_test_move :: MethodBind
bindKinematicBody2D_test_move
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "test_move" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks for collisions without moving the body. Virtually sets the node's position, scale and rotation to that of the given @Transform2D@, then tries to move the body along the vector @rel_vec@. Returns @true@ if a collision would occur.
test_move ::
            (KinematicBody2D :< cls, Object :< cls) =>
            cls -> Transform2d -> Vector2 -> Maybe Bool -> IO Bool
test_move cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_test_move (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicBody2D "test_move"
           '[Transform2d, Vector2, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.KinematicBody2D.test_move