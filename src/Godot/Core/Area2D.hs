{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Area2D
       (Godot.Core.Area2D._SPACE_OVERRIDE_REPLACE,
        Godot.Core.Area2D._SPACE_OVERRIDE_DISABLED,
        Godot.Core.Area2D._SPACE_OVERRIDE_COMBINE_REPLACE,
        Godot.Core.Area2D._SPACE_OVERRIDE_REPLACE_COMBINE,
        Godot.Core.Area2D._SPACE_OVERRIDE_COMBINE,
        Godot.Core.Area2D.sig_area_exited,
        Godot.Core.Area2D.sig_area_shape_exited,
        Godot.Core.Area2D.sig_body_entered,
        Godot.Core.Area2D.sig_body_shape_entered,
        Godot.Core.Area2D.sig_area_entered,
        Godot.Core.Area2D.sig_area_shape_entered,
        Godot.Core.Area2D.sig_body_exited,
        Godot.Core.Area2D.sig_body_shape_exited,
        Godot.Core.Area2D._body_enter_tree,
        Godot.Core.Area2D._body_exit_tree,
        Godot.Core.Area2D._area_enter_tree,
        Godot.Core.Area2D._area_exit_tree,
        Godot.Core.Area2D.set_space_override_mode,
        Godot.Core.Area2D.get_space_override_mode,
        Godot.Core.Area2D.set_gravity_is_point,
        Godot.Core.Area2D.is_gravity_a_point,
        Godot.Core.Area2D.set_gravity_distance_scale,
        Godot.Core.Area2D.get_gravity_distance_scale,
        Godot.Core.Area2D.set_gravity_vector,
        Godot.Core.Area2D.get_gravity_vector,
        Godot.Core.Area2D.set_gravity, Godot.Core.Area2D.get_gravity,
        Godot.Core.Area2D.set_linear_damp,
        Godot.Core.Area2D.get_linear_damp,
        Godot.Core.Area2D.set_angular_damp,
        Godot.Core.Area2D.get_angular_damp, Godot.Core.Area2D.set_priority,
        Godot.Core.Area2D.get_priority,
        Godot.Core.Area2D.set_collision_mask,
        Godot.Core.Area2D.get_collision_mask,
        Godot.Core.Area2D.set_collision_layer,
        Godot.Core.Area2D.get_collision_layer,
        Godot.Core.Area2D.set_collision_mask_bit,
        Godot.Core.Area2D.get_collision_mask_bit,
        Godot.Core.Area2D.set_collision_layer_bit,
        Godot.Core.Area2D.get_collision_layer_bit,
        Godot.Core.Area2D.set_monitoring, Godot.Core.Area2D.is_monitoring,
        Godot.Core.Area2D.set_monitorable,
        Godot.Core.Area2D.is_monitorable,
        Godot.Core.Area2D.get_overlapping_bodies,
        Godot.Core.Area2D.get_overlapping_areas,
        Godot.Core.Area2D.overlaps_body, Godot.Core.Area2D.overlaps_area,
        Godot.Core.Area2D.set_audio_bus_name,
        Godot.Core.Area2D.get_audio_bus_name,
        Godot.Core.Area2D.set_audio_bus_override,
        Godot.Core.Area2D.is_overriding_audio_bus,
        Godot.Core.Area2D._body_inout, Godot.Core.Area2D._area_inout)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_SPACE_OVERRIDE_REPLACE :: Int
_SPACE_OVERRIDE_REPLACE = 3

_SPACE_OVERRIDE_DISABLED :: Int
_SPACE_OVERRIDE_DISABLED = 0

_SPACE_OVERRIDE_COMBINE_REPLACE :: Int
_SPACE_OVERRIDE_COMBINE_REPLACE = 2

_SPACE_OVERRIDE_REPLACE_COMBINE :: Int
_SPACE_OVERRIDE_REPLACE_COMBINE = 4

_SPACE_OVERRIDE_COMBINE :: Int
_SPACE_OVERRIDE_COMBINE = 1

-- | Emitted when another area exits.
sig_area_exited :: Godot.Internal.Dispatch.Signal Area2D
sig_area_exited = Godot.Internal.Dispatch.Signal "area_exited"

-- | Emitted when another area exits, reporting which shapes were overlapping.
sig_area_shape_exited :: Godot.Internal.Dispatch.Signal Area2D
sig_area_shape_exited
  = Godot.Internal.Dispatch.Signal "area_shape_exited"

-- | Emitted when a [PhysicsBody2D] object enters.
sig_body_entered :: Godot.Internal.Dispatch.Signal Area2D
sig_body_entered = Godot.Internal.Dispatch.Signal "body_entered"

-- | Emitted when a [PhysicsBody2D] object enters, reporting which shapes overlapped.
sig_body_shape_entered :: Godot.Internal.Dispatch.Signal Area2D
sig_body_shape_entered
  = Godot.Internal.Dispatch.Signal "body_shape_entered"

-- | Emitted when another area enters.
sig_area_entered :: Godot.Internal.Dispatch.Signal Area2D
sig_area_entered = Godot.Internal.Dispatch.Signal "area_entered"

-- | Emitted when another area enters, reporting which shapes overlapped.
sig_area_shape_entered :: Godot.Internal.Dispatch.Signal Area2D
sig_area_shape_entered
  = Godot.Internal.Dispatch.Signal "area_shape_entered"

-- | Emitted when a [PhysicsBody2D] object exits.
sig_body_exited :: Godot.Internal.Dispatch.Signal Area2D
sig_body_exited = Godot.Internal.Dispatch.Signal "body_exited"

-- | Emitted when a [PhysicsBody2D] object exits, reporting which shapes were overlapping.
sig_body_shape_exited :: Godot.Internal.Dispatch.Signal Area2D
sig_body_shape_exited
  = Godot.Internal.Dispatch.Signal "body_shape_exited"

{-# NOINLINE bindArea2D__body_enter_tree #-}

bindArea2D__body_enter_tree :: MethodBind
bindArea2D__body_enter_tree
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_body_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_enter_tree ::
                   (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
_body_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__body_enter_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D__body_exit_tree #-}

bindArea2D__body_exit_tree :: MethodBind
bindArea2D__body_exit_tree
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_body_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_exit_tree ::
                  (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
_body_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__body_exit_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D__area_enter_tree #-}

bindArea2D__area_enter_tree :: MethodBind
bindArea2D__area_enter_tree
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_area_enter_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_enter_tree ::
                   (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
_area_enter_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__area_enter_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D__area_exit_tree #-}

bindArea2D__area_exit_tree :: MethodBind
bindArea2D__area_exit_tree
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_area_exit_tree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_exit_tree ::
                  (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
_area_exit_tree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__area_exit_tree (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_space_override_mode #-}

-- | Override mode for gravity and damping calculations within this area. See [enum Area2D.SpaceOverride] for possible values.
bindArea2D_set_space_override_mode :: MethodBind
bindArea2D_set_space_override_mode
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override mode for gravity and damping calculations within this area. See [enum Area2D.SpaceOverride] for possible values.
set_space_override_mode ::
                          (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_space_override_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_space_override_mode #-}

-- | Override mode for gravity and damping calculations within this area. See [enum Area2D.SpaceOverride] for possible values.
bindArea2D_get_space_override_mode :: MethodBind
bindArea2D_get_space_override_mode
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_space_override_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Override mode for gravity and damping calculations within this area. See [enum Area2D.SpaceOverride] for possible values.
get_space_override_mode ::
                          (Area2D :< cls, Object :< cls) => cls -> IO Int
get_space_override_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_space_override_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_gravity_is_point #-}

-- | If [code]true[/code], gravity is calculated from a point (set via [member gravity_vec]). Also see [member space_override]. Default value: [code]false[/code].
bindArea2D_set_gravity_is_point :: MethodBind
bindArea2D_set_gravity_is_point
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_gravity_is_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], gravity is calculated from a point (set via [member gravity_vec]). Also see [member space_override]. Default value: [code]false[/code].
set_gravity_is_point ::
                       (Area2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_gravity_is_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_gravity_is_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_is_gravity_a_point #-}

-- | If [code]true[/code], gravity is calculated from a point (set via [member gravity_vec]). Also see [member space_override]. Default value: [code]false[/code].
bindArea2D_is_gravity_a_point :: MethodBind
bindArea2D_is_gravity_a_point
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "is_gravity_a_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], gravity is calculated from a point (set via [member gravity_vec]). Also see [member space_override]. Default value: [code]false[/code].
is_gravity_a_point ::
                     (Area2D :< cls, Object :< cls) => cls -> IO Bool
is_gravity_a_point cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_is_gravity_a_point (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_gravity_distance_scale #-}

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
bindArea2D_set_gravity_distance_scale :: MethodBind
bindArea2D_set_gravity_distance_scale
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_gravity_distance_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
set_gravity_distance_scale ::
                             (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity_distance_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_gravity_distance_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_gravity_distance_scale #-}

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
bindArea2D_get_gravity_distance_scale :: MethodBind
bindArea2D_get_gravity_distance_scale
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_gravity_distance_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The falloff factor for point gravity. The greater the value, the faster gravity decreases with distance.
get_gravity_distance_scale ::
                             (Area2D :< cls, Object :< cls) => cls -> IO Float
get_gravity_distance_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_gravity_distance_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_gravity_vector #-}

-- | The area's gravity vector (not normalized). If gravity is a point (see [member gravity_point]), this will be the point of attraction.
bindArea2D_set_gravity_vector :: MethodBind
bindArea2D_set_gravity_vector
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_gravity_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity vector (not normalized). If gravity is a point (see [member gravity_point]), this will be the point of attraction.
set_gravity_vector ::
                     (Area2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_gravity_vector cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_gravity_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_gravity_vector #-}

-- | The area's gravity vector (not normalized). If gravity is a point (see [member gravity_point]), this will be the point of attraction.
bindArea2D_get_gravity_vector :: MethodBind
bindArea2D_get_gravity_vector
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_gravity_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity vector (not normalized). If gravity is a point (see [member gravity_point]), this will be the point of attraction.
get_gravity_vector ::
                     (Area2D :< cls, Object :< cls) => cls -> IO Vector2
get_gravity_vector cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_gravity_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_gravity #-}

-- | The area's gravity intensity (ranges from -1024 to 1024). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
bindArea2D_set_gravity :: MethodBind
bindArea2D_set_gravity
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity intensity (ranges from -1024 to 1024). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
set_gravity ::
              (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_gravity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_gravity (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_gravity #-}

-- | The area's gravity intensity (ranges from -1024 to 1024). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
bindArea2D_get_gravity :: MethodBind
bindArea2D_get_gravity
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's gravity intensity (ranges from -1024 to 1024). This value multiplies the gravity vector. This is useful to alter the force of gravity without altering its direction.
get_gravity :: (Area2D :< cls, Object :< cls) => cls -> IO Float
get_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_gravity (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_linear_damp #-}

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second. Values range from [code]0[/code] (no damping) to [code]1[/code] (full damping).
bindArea2D_set_linear_damp :: MethodBind
bindArea2D_set_linear_damp
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second. Values range from [code]0[/code] (no damping) to [code]1[/code] (full damping).
set_linear_damp ::
                  (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_linear_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_linear_damp #-}

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second. Values range from [code]0[/code] (no damping) to [code]1[/code] (full damping).
bindArea2D_get_linear_damp :: MethodBind
bindArea2D_get_linear_damp
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_linear_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop moving in this area. Represents the linear velocity lost per second. Values range from [code]0[/code] (no damping) to [code]1[/code] (full damping).
get_linear_damp ::
                  (Area2D :< cls, Object :< cls) => cls -> IO Float
get_linear_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_linear_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_angular_damp #-}

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second. Values range from [code]0[/code] (no damping) to [code]1[/code] (full damping).
bindArea2D_set_angular_damp :: MethodBind
bindArea2D_set_angular_damp
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second. Values range from [code]0[/code] (no damping) to [code]1[/code] (full damping).
set_angular_damp ::
                   (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_angular_damp cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_angular_damp #-}

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second. Values range from [code]0[/code] (no damping) to [code]1[/code] (full damping).
bindArea2D_get_angular_damp :: MethodBind
bindArea2D_get_angular_damp
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_angular_damp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rate at which objects stop spinning in this area. Represents the angular velocity lost per second. Values range from [code]0[/code] (no damping) to [code]1[/code] (full damping).
get_angular_damp ::
                   (Area2D :< cls, Object :< cls) => cls -> IO Float
get_angular_damp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_angular_damp (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_priority #-}

-- | The area's priority. Higher priority areas are processed first. Default value: 0.
bindArea2D_set_priority :: MethodBind
bindArea2D_set_priority
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's priority. Higher priority areas are processed first. Default value: 0.
set_priority ::
               (Area2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_priority (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_priority #-}

-- | The area's priority. Higher priority areas are processed first. Default value: 0.
bindArea2D_get_priority :: MethodBind
bindArea2D_get_priority
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's priority. Higher priority areas are processed first. Default value: 0.
get_priority :: (Area2D :< cls, Object :< cls) => cls -> IO Float
get_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_priority (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_collision_mask #-}

-- | The physics layers this area scans to determine collision detection.
bindArea2D_set_collision_mask :: MethodBind
bindArea2D_set_collision_mask
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area scans to determine collision detection.
set_collision_mask ::
                     (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_collision_mask #-}

-- | The physics layers this area scans to determine collision detection.
bindArea2D_get_collision_mask :: MethodBind
bindArea2D_get_collision_mask
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layers this area scans to determine collision detection.
get_collision_mask ::
                     (Area2D :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_collision_layer #-}

-- | The area's physics layer(s). Collidable objects can exist in any of 32 different layers. A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See also [member collision_mask].
bindArea2D_set_collision_layer :: MethodBind
bindArea2D_set_collision_layer
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's physics layer(s). Collidable objects can exist in any of 32 different layers. A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See also [member collision_mask].
set_collision_layer ::
                      (Area2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_collision_layer #-}

-- | The area's physics layer(s). Collidable objects can exist in any of 32 different layers. A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See also [member collision_mask].
bindArea2D_get_collision_layer :: MethodBind
bindArea2D_get_collision_layer
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area's physics layer(s). Collidable objects can exist in any of 32 different layers. A contact is detected if object A is in any of the layers that object B scans, or object B is in any layers that object A scans. See also [member collision_mask].
get_collision_layer ::
                      (Area2D :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_collision_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_collision_mask_bit #-}

-- | Set/clear individual bits on the collision mask. This makes selecting the areas scanned easier.
bindArea2D_set_collision_mask_bit :: MethodBind
bindArea2D_set_collision_mask_bit
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set/clear individual bits on the collision mask. This makes selecting the areas scanned easier.
set_collision_mask_bit ::
                         (Area2D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_collision_mask_bit #-}

-- | Return an individual bit on the collision mask. Describes whether this area will collide with others on the given layer.
bindArea2D_get_collision_mask_bit :: MethodBind
bindArea2D_get_collision_mask_bit
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return an individual bit on the collision mask. Describes whether this area will collide with others on the given layer.
get_collision_mask_bit ::
                         (Area2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_collision_layer_bit #-}

-- | Set/clear individual bits on the layer mask. This makes getting an area in/out of only one layer easier.
bindArea2D_set_collision_layer_bit :: MethodBind
bindArea2D_set_collision_layer_bit
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set/clear individual bits on the layer mask. This makes getting an area in/out of only one layer easier.
set_collision_layer_bit ::
                          (Area2D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_collision_layer_bit #-}

-- | Return an individual bit on the layer mask. Describes whether other areas will collide with this one on the given layer.
bindArea2D_get_collision_layer_bit :: MethodBind
bindArea2D_get_collision_layer_bit
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return an individual bit on the layer mask. Describes whether other areas will collide with this one on the given layer.
get_collision_layer_bit ::
                          (Area2D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_monitoring #-}

-- | If [code]true[/code], the area detects bodies or areas entering and exiting it. Default value: [code]true[/code].
bindArea2D_set_monitoring :: MethodBind
bindArea2D_set_monitoring
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_monitoring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the area detects bodies or areas entering and exiting it. Default value: [code]true[/code].
set_monitoring ::
                 (Area2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_monitoring cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_monitoring (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_is_monitoring #-}

-- | If [code]true[/code], the area detects bodies or areas entering and exiting it. Default value: [code]true[/code].
bindArea2D_is_monitoring :: MethodBind
bindArea2D_is_monitoring
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "is_monitoring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the area detects bodies or areas entering and exiting it. Default value: [code]true[/code].
is_monitoring :: (Area2D :< cls, Object :< cls) => cls -> IO Bool
is_monitoring cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_is_monitoring (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_monitorable #-}

-- | If [code]true[/code], other monitoring areas can detect this area. Default value: [code]true[/code].
bindArea2D_set_monitorable :: MethodBind
bindArea2D_set_monitorable
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_monitorable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], other monitoring areas can detect this area. Default value: [code]true[/code].
set_monitorable ::
                  (Area2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_monitorable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_monitorable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_is_monitorable #-}

-- | If [code]true[/code], other monitoring areas can detect this area. Default value: [code]true[/code].
bindArea2D_is_monitorable :: MethodBind
bindArea2D_is_monitorable
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "is_monitorable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], other monitoring areas can detect this area. Default value: [code]true[/code].
is_monitorable :: (Area2D :< cls, Object :< cls) => cls -> IO Bool
is_monitorable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_is_monitorable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_overlapping_bodies #-}

-- | Returns a list of intersecting [PhysicsBody2D]s. For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
bindArea2D_get_overlapping_bodies :: MethodBind
bindArea2D_get_overlapping_bodies
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_overlapping_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of intersecting [PhysicsBody2D]s. For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
get_overlapping_bodies ::
                         (Area2D :< cls, Object :< cls) => cls -> IO Array
get_overlapping_bodies cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_overlapping_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_overlapping_areas #-}

-- | Returns a list of intersecting [code]Area2D[/code]s. For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
bindArea2D_get_overlapping_areas :: MethodBind
bindArea2D_get_overlapping_areas
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_overlapping_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of intersecting [code]Area2D[/code]s. For performance reasons (collisions are all processed at the same time) this list is modified once during the physics step, not immediately after objects are moved. Consider using signals instead.
get_overlapping_areas ::
                        (Area2D :< cls, Object :< cls) => cls -> IO Array
get_overlapping_areas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_overlapping_areas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_overlaps_body #-}

-- | If [code]true[/code], the given body overlaps the Area2D. Note that the result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
bindArea2D_overlaps_body :: MethodBind
bindArea2D_overlaps_body
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "overlaps_body" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the given body overlaps the Area2D. Note that the result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
overlaps_body ::
                (Area2D :< cls, Object :< cls) => cls -> Node -> IO Bool
overlaps_body cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_overlaps_body (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_overlaps_area #-}

-- | If [code]true[/code], the given area overlaps the Area2D. Note that the result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
bindArea2D_overlaps_area :: MethodBind
bindArea2D_overlaps_area
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "overlaps_area" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the given area overlaps the Area2D. Note that the result of this test is not immediate after moving objects. For performance, list of overlaps is updated once per frame and before the physics step. Consider using signals instead.
overlaps_area ::
                (Area2D :< cls, Object :< cls) => cls -> Node -> IO Bool
overlaps_area cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_overlaps_area (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_audio_bus_name #-}

-- | The name of the area's audio bus.
bindArea2D_set_audio_bus_name :: MethodBind
bindArea2D_set_audio_bus_name
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_audio_bus_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the area's audio bus.
set_audio_bus_name ::
                     (Area2D :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_audio_bus_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_audio_bus_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_get_audio_bus_name #-}

-- | The name of the area's audio bus.
bindArea2D_get_audio_bus_name :: MethodBind
bindArea2D_get_audio_bus_name
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "get_audio_bus_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the area's audio bus.
get_audio_bus_name ::
                     (Area2D :< cls, Object :< cls) => cls -> IO GodotString
get_audio_bus_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_get_audio_bus_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_set_audio_bus_override #-}

-- | If [code]true[/code], the area's audio bus overrides the default audio bus. Default value: [code]false[/code].
bindArea2D_set_audio_bus_override :: MethodBind
bindArea2D_set_audio_bus_override
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "set_audio_bus_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the area's audio bus overrides the default audio bus. Default value: [code]false[/code].
set_audio_bus_override ::
                         (Area2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_audio_bus_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_set_audio_bus_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D_is_overriding_audio_bus #-}

-- | If [code]true[/code], the area's audio bus overrides the default audio bus. Default value: [code]false[/code].
bindArea2D_is_overriding_audio_bus :: MethodBind
bindArea2D_is_overriding_audio_bus
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "is_overriding_audio_bus" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the area's audio bus overrides the default audio bus. Default value: [code]false[/code].
is_overriding_audio_bus ::
                          (Area2D :< cls, Object :< cls) => cls -> IO Bool
is_overriding_audio_bus cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D_is_overriding_audio_bus
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D__body_inout #-}

bindArea2D__body_inout :: MethodBind
bindArea2D__body_inout
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_body_inout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_body_inout ::
              (Area2D :< cls, Object :< cls) =>
              cls -> Int -> Rid -> Int -> Int -> Int -> IO ()
_body_inout cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__body_inout (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindArea2D__area_inout #-}

bindArea2D__area_inout :: MethodBind
bindArea2D__area_inout
  = unsafePerformIO $
      withCString "Area2D" $
        \ clsNamePtr ->
          withCString "_area_inout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_area_inout ::
              (Area2D :< cls, Object :< cls) =>
              cls -> Int -> Rid -> Int -> Int -> Int -> IO ()
_area_inout cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindArea2D__area_inout (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)