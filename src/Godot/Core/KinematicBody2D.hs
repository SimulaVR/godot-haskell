{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.KinematicBody2D
       (Godot.Core.KinematicBody2D.move_and_collide,
        Godot.Core.KinematicBody2D.move_and_slide,
        Godot.Core.KinematicBody2D.move_and_slide_with_snap,
        Godot.Core.KinematicBody2D.test_move,
        Godot.Core.KinematicBody2D.is_on_floor,
        Godot.Core.KinematicBody2D.is_on_ceiling,
        Godot.Core.KinematicBody2D.is_on_wall,
        Godot.Core.KinematicBody2D.get_floor_velocity,
        Godot.Core.KinematicBody2D.set_safe_margin,
        Godot.Core.KinematicBody2D.get_safe_margin,
        Godot.Core.KinematicBody2D.get_slide_count,
        Godot.Core.KinematicBody2D.get_slide_collision,
        Godot.Core.KinematicBody2D.set_sync_to_physics,
        Godot.Core.KinematicBody2D.is_sync_to_physics_enabled,
        Godot.Core.KinematicBody2D._direct_state_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindKinematicBody2D_move_and_collide #-}

-- | Moves the body along the vector [code]rel_vec[/code]. The body will stop if it collides. Returns a [KinematicCollision2D], which contains information about the collision.
bindKinematicBody2D_move_and_collide :: MethodBind
bindKinematicBody2D_move_and_collide
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_collide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the body along the vector [code]rel_vec[/code]. The body will stop if it collides. Returns a [KinematicCollision2D], which contains information about the collision.
move_and_collide ::
                   (KinematicBody2D :< cls, Object :< cls) =>
                   cls -> Vector2 -> Bool -> Bool -> Bool -> IO KinematicCollision2D
move_and_collide cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_collide
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicBody2D_move_and_slide #-}

-- | Moves the body along a vector. If the body collides with another, it will slide along the other body rather than stop immediately. If the other body is a [code]KinematicBody2D[/code] or [RigidBody2D], it will also be affected by the motion of the other body. You can use this to make moving or rotating platforms, or to make nodes push other nodes.
--   				[code]linear_velocity[/code] is the velocity vector in pixels per second. Unlike in [method move_and_collide], you should [i]not[/i] multiply it by [code]delta[/code] — the physics engine handles applying the velocity.
--   				[code]floor_normal[/code] is the up direction, used to determine what is a wall and what is a floor or a ceiling. If set to the default value of [code]Vector2(0, 0)[/code], everything is considered a wall. This is useful for topdown games.
--   				If [code]stop_on_slope[/code] is true, body will not slide on slopes when you include gravity in [code]linear_velocity[/code] and the body is standing still.
--   				If the body collides, it will change direction a maximum of [code]max_slides[/code] times before it stops.
--   				[code]floor_max_angle[/code] is the maximum angle (in radians) where a slope is still considered a floor (or a ceiling), rather than a wall. The default value equals 45 degrees.
--   				If [code]infinite_inertia[/code] is true, body will be able to push [RigidBody2D] nodes, but it won't also detect any collisions with them. When false, it will interact with [RigidBody2D] nodes like with [StaticBody2D].
--   				Returns the [code]linear_velocity[/code] vector, rotated and/or scaled if a slide collision occurred. To get detailed information about collisions that occurred, use [method get_slide_collision].
bindKinematicBody2D_move_and_slide :: MethodBind
bindKinematicBody2D_move_and_slide
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_slide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the body along a vector. If the body collides with another, it will slide along the other body rather than stop immediately. If the other body is a [code]KinematicBody2D[/code] or [RigidBody2D], it will also be affected by the motion of the other body. You can use this to make moving or rotating platforms, or to make nodes push other nodes.
--   				[code]linear_velocity[/code] is the velocity vector in pixels per second. Unlike in [method move_and_collide], you should [i]not[/i] multiply it by [code]delta[/code] — the physics engine handles applying the velocity.
--   				[code]floor_normal[/code] is the up direction, used to determine what is a wall and what is a floor or a ceiling. If set to the default value of [code]Vector2(0, 0)[/code], everything is considered a wall. This is useful for topdown games.
--   				If [code]stop_on_slope[/code] is true, body will not slide on slopes when you include gravity in [code]linear_velocity[/code] and the body is standing still.
--   				If the body collides, it will change direction a maximum of [code]max_slides[/code] times before it stops.
--   				[code]floor_max_angle[/code] is the maximum angle (in radians) where a slope is still considered a floor (or a ceiling), rather than a wall. The default value equals 45 degrees.
--   				If [code]infinite_inertia[/code] is true, body will be able to push [RigidBody2D] nodes, but it won't also detect any collisions with them. When false, it will interact with [RigidBody2D] nodes like with [StaticBody2D].
--   				Returns the [code]linear_velocity[/code] vector, rotated and/or scaled if a slide collision occurred. To get detailed information about collisions that occurred, use [method get_slide_collision].
move_and_slide ::
                 (KinematicBody2D :< cls, Object :< cls) =>
                 cls ->
                   Vector2 -> Vector2 -> Bool -> Int -> Float -> Bool -> IO Vector2
move_and_slide cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_slide
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicBody2D_move_and_slide_with_snap #-}

-- | Moves the body while keeping it attached to slopes. Similar to [method move_and_slide].
--   				As long as the [code]snap[/code] vector is in contact with the ground, the body will remain attached to the surface. This means you must disable snap in order to jump, for example. You can do this by setting [code]snap[/code] to [code](0, 0)[/code] or by using [method move_and_slide] instead.
bindKinematicBody2D_move_and_slide_with_snap :: MethodBind
bindKinematicBody2D_move_and_slide_with_snap
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "move_and_slide_with_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the body while keeping it attached to slopes. Similar to [method move_and_slide].
--   				As long as the [code]snap[/code] vector is in contact with the ground, the body will remain attached to the surface. This means you must disable snap in order to jump, for example. You can do this by setting [code]snap[/code] to [code](0, 0)[/code] or by using [method move_and_slide] instead.
move_and_slide_with_snap ::
                           (KinematicBody2D :< cls, Object :< cls) =>
                           cls ->
                             Vector2 ->
                               Vector2 -> Vector2 -> Bool -> Int -> Float -> Bool -> IO Vector2
move_and_slide_with_snap cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_move_and_slide_with_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicBody2D_test_move #-}

-- | Checks for collisions without moving the body. Virtually sets the node's position, scale and rotation to that of the given [Transform2D], then tries to move the body along the vector [code]rel_vec[/code]. Returns [code]true[/code] if a collision would occur.
bindKinematicBody2D_test_move :: MethodBind
bindKinematicBody2D_test_move
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "test_move" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Checks for collisions without moving the body. Virtually sets the node's position, scale and rotation to that of the given [Transform2D], then tries to move the body along the vector [code]rel_vec[/code]. Returns [code]true[/code] if a collision would occur.
test_move ::
            (KinematicBody2D :< cls, Object :< cls) =>
            cls -> Transform2d -> Vector2 -> Bool -> IO Bool
test_move cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_test_move (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicBody2D_is_on_floor #-}

-- | Returns [code]true[/code] if the body is on the floor. Only updates when calling [method move_and_slide].
bindKinematicBody2D_is_on_floor :: MethodBind
bindKinematicBody2D_is_on_floor
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_floor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the body is on the floor. Only updates when calling [method move_and_slide].
is_on_floor ::
              (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_on_floor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_is_on_floor (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicBody2D_is_on_ceiling #-}

-- | Returns [code]true[/code] if the body is on the ceiling. Only updates when calling [method move_and_slide].
bindKinematicBody2D_is_on_ceiling :: MethodBind
bindKinematicBody2D_is_on_ceiling
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_ceiling" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the body is on the ceiling. Only updates when calling [method move_and_slide].
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

{-# NOINLINE bindKinematicBody2D_is_on_wall #-}

-- | Returns [code]true[/code] if the body is on a wall. Only updates when calling [method move_and_slide].
bindKinematicBody2D_is_on_wall :: MethodBind
bindKinematicBody2D_is_on_wall
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_on_wall" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the body is on a wall. Only updates when calling [method move_and_slide].
is_on_wall ::
             (KinematicBody2D :< cls, Object :< cls) => cls -> IO Bool
is_on_wall cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicBody2D_is_on_wall (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindKinematicBody2D_get_floor_velocity #-}

-- | Returns the velocity of the floor. Only updates when calling [method move_and_slide].
bindKinematicBody2D_get_floor_velocity :: MethodBind
bindKinematicBody2D_get_floor_velocity
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_floor_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the velocity of the floor. Only updates when calling [method move_and_slide].
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

{-# NOINLINE bindKinematicBody2D_get_slide_count #-}

-- | Returns the number of times the body collided and changed direction during the last call to [method move_and_slide].
bindKinematicBody2D_get_slide_count :: MethodBind
bindKinematicBody2D_get_slide_count
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_slide_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of times the body collided and changed direction during the last call to [method move_and_slide].
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

{-# NOINLINE bindKinematicBody2D_get_slide_collision #-}

-- | Returns a [KinematicCollision2D], which contains information about a collision that occurred during the last [method move_and_slide] call. Since the body can collide several times in a single call to [method move_and_slide], you must specify the index of the collision in the range 0 to ([method get_slide_count] - 1).
--   				Example usage:
--   				[codeblock]
--   				for i in get_slide_count():
--   				    var collision = get_slide_collision(i)
--   				    print("Collided with: ", collision.collider.name)
--   				[/codeblock]
bindKinematicBody2D_get_slide_collision :: MethodBind
bindKinematicBody2D_get_slide_collision
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "get_slide_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [KinematicCollision2D], which contains information about a collision that occurred during the last [method move_and_slide] call. Since the body can collide several times in a single call to [method move_and_slide], you must specify the index of the collision in the range 0 to ([method get_slide_count] - 1).
--   				Example usage:
--   				[codeblock]
--   				for i in get_slide_count():
--   				    var collision = get_slide_collision(i)
--   				    print("Collided with: ", collision.collider.name)
--   				[/codeblock]
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

{-# NOINLINE bindKinematicBody2D_set_sync_to_physics #-}

-- | If [code]true[/code], the body's movement will be synchronized to the physics frame. This is useful when animating movement via [AnimationPlayer], for example on moving platforms. Do [b]not[/b] use together with [method move_and_slide] or [method move_and_collide] functions.
bindKinematicBody2D_set_sync_to_physics :: MethodBind
bindKinematicBody2D_set_sync_to_physics
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "set_sync_to_physics" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body's movement will be synchronized to the physics frame. This is useful when animating movement via [AnimationPlayer], for example on moving platforms. Do [b]not[/b] use together with [method move_and_slide] or [method move_and_collide] functions.
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

{-# NOINLINE bindKinematicBody2D_is_sync_to_physics_enabled #-}

-- | If [code]true[/code], the body's movement will be synchronized to the physics frame. This is useful when animating movement via [AnimationPlayer], for example on moving platforms. Do [b]not[/b] use together with [method move_and_slide] or [method move_and_collide] functions.
bindKinematicBody2D_is_sync_to_physics_enabled :: MethodBind
bindKinematicBody2D_is_sync_to_physics_enabled
  = unsafePerformIO $
      withCString "KinematicBody2D" $
        \ clsNamePtr ->
          withCString "is_sync_to_physics_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the body's movement will be synchronized to the physics frame. This is useful when animating movement via [AnimationPlayer], for example on moving platforms. Do [b]not[/b] use together with [method move_and_slide] or [method move_and_collide] functions.
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