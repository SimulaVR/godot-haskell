{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ARVRPositionalTracker
       (Godot.Core.ARVRPositionalTracker._TRACKER_LEFT_HAND,
        Godot.Core.ARVRPositionalTracker._TRACKER_RIGHT_HAND,
        Godot.Core.ARVRPositionalTracker._TRACKER_HAND_UNKNOWN,
        Godot.Core.ARVRPositionalTracker.get_type,
        Godot.Core.ARVRPositionalTracker.get_name,
        Godot.Core.ARVRPositionalTracker.get_joy_id,
        Godot.Core.ARVRPositionalTracker.get_tracks_orientation,
        Godot.Core.ARVRPositionalTracker.get_orientation,
        Godot.Core.ARVRPositionalTracker.get_tracks_position,
        Godot.Core.ARVRPositionalTracker.get_position,
        Godot.Core.ARVRPositionalTracker.get_hand,
        Godot.Core.ARVRPositionalTracker.get_transform,
        Godot.Core.ARVRPositionalTracker._set_type,
        Godot.Core.ARVRPositionalTracker._set_name,
        Godot.Core.ARVRPositionalTracker._set_joy_id,
        Godot.Core.ARVRPositionalTracker._set_orientation,
        Godot.Core.ARVRPositionalTracker._set_rw_position,
        Godot.Core.ARVRPositionalTracker.get_rumble,
        Godot.Core.ARVRPositionalTracker.set_rumble)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_TRACKER_LEFT_HAND :: Int
_TRACKER_LEFT_HAND = 1

_TRACKER_RIGHT_HAND :: Int
_TRACKER_RIGHT_HAND = 2

_TRACKER_HAND_UNKNOWN :: Int
_TRACKER_HAND_UNKNOWN = 0

{-# NOINLINE bindARVRPositionalTracker_get_type #-}

-- | Returns the tracker's type.
bindARVRPositionalTracker_get_type :: MethodBind
bindARVRPositionalTracker_get_type
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the tracker's type.
get_type ::
           (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Int
get_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_name #-}

-- | Returns the controller or anchor point's name if available.
bindARVRPositionalTracker_get_name :: MethodBind
bindARVRPositionalTracker_get_name
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the controller or anchor point's name if available.
get_name ::
           (ARVRPositionalTracker :< cls, Object :< cls) =>
           cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_joy_id #-}

-- | If this is a controller that is being tracked the controller will also be represented by a joystick entry with this id.
bindARVRPositionalTracker_get_joy_id :: MethodBind
bindARVRPositionalTracker_get_joy_id
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_joy_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this is a controller that is being tracked the controller will also be represented by a joystick entry with this id.
get_joy_id ::
             (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Int
get_joy_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_joy_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_tracks_orientation #-}

-- | Returns [code]true[/code] if this device tracks orientation.
bindARVRPositionalTracker_get_tracks_orientation :: MethodBind
bindARVRPositionalTracker_get_tracks_orientation
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_tracks_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this device tracks orientation.
get_tracks_orientation ::
                         (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Bool
get_tracks_orientation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindARVRPositionalTracker_get_tracks_orientation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_orientation #-}

-- | Returns the controller's orientation matrix.
bindARVRPositionalTracker_get_orientation :: MethodBind
bindARVRPositionalTracker_get_orientation
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the controller's orientation matrix.
get_orientation ::
                  (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Basis
get_orientation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_orientation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_tracks_position #-}

-- | Returns [code]true[/code] if this device tracks position.
bindARVRPositionalTracker_get_tracks_position :: MethodBind
bindARVRPositionalTracker_get_tracks_position
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_tracks_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this device tracks position.
get_tracks_position ::
                      (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Bool
get_tracks_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindARVRPositionalTracker_get_tracks_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_position #-}

-- | Returns the world-space controller position.
bindARVRPositionalTracker_get_position :: MethodBind
bindARVRPositionalTracker_get_position
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the world-space controller position.
get_position ::
               (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Vector3
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_hand #-}

-- | Returns the hand holding this tracker, if known. See TRACKER_* constants.
bindARVRPositionalTracker_get_hand :: MethodBind
bindARVRPositionalTracker_get_hand
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_hand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the hand holding this tracker, if known. See TRACKER_* constants.
get_hand ::
           (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Int
get_hand cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_hand
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_transform #-}

-- | Returns the transform combining this device's orientation and position.
bindARVRPositionalTracker_get_transform :: MethodBind
bindARVRPositionalTracker_get_transform
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transform combining this device's orientation and position.
get_transform ::
                (ARVRPositionalTracker :< cls, Object :< cls) =>
                cls -> Bool -> IO Transform
get_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker__set_type #-}

bindARVRPositionalTracker__set_type :: MethodBind
bindARVRPositionalTracker__set_type
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "_set_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_type ::
            (ARVRPositionalTracker :< cls, Object :< cls) =>
            cls -> Int -> IO ()
_set_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker__set_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker__set_name #-}

bindARVRPositionalTracker__set_name :: MethodBind
bindARVRPositionalTracker__set_name
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "_set_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_name ::
            (ARVRPositionalTracker :< cls, Object :< cls) =>
            cls -> GodotString -> IO ()
_set_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker__set_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker__set_joy_id #-}

bindARVRPositionalTracker__set_joy_id :: MethodBind
bindARVRPositionalTracker__set_joy_id
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "_set_joy_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_joy_id ::
              (ARVRPositionalTracker :< cls, Object :< cls) =>
              cls -> Int -> IO ()
_set_joy_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker__set_joy_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker__set_orientation #-}

bindARVRPositionalTracker__set_orientation :: MethodBind
bindARVRPositionalTracker__set_orientation
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "_set_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_orientation ::
                   (ARVRPositionalTracker :< cls, Object :< cls) =>
                   cls -> Basis -> IO ()
_set_orientation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker__set_orientation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker__set_rw_position #-}

bindARVRPositionalTracker__set_rw_position :: MethodBind
bindARVRPositionalTracker__set_rw_position
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "_set_rw_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_rw_position ::
                   (ARVRPositionalTracker :< cls, Object :< cls) =>
                   cls -> Vector3 -> IO ()
_set_rw_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker__set_rw_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_get_rumble #-}

-- | The degree to which the tracker rumbles. Ranges from [code]0.0[/code] to [code]1.0[/code] with precision [code].01[/code].
bindARVRPositionalTracker_get_rumble :: MethodBind
bindARVRPositionalTracker_get_rumble
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_rumble" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which the tracker rumbles. Ranges from [code]0.0[/code] to [code]1.0[/code] with precision [code].01[/code].
get_rumble ::
             (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Float
get_rumble cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_rumble
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRPositionalTracker_set_rumble #-}

-- | The degree to which the tracker rumbles. Ranges from [code]0.0[/code] to [code]1.0[/code] with precision [code].01[/code].
bindARVRPositionalTracker_set_rumble :: MethodBind
bindARVRPositionalTracker_set_rumble
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "set_rumble" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which the tracker rumbles. Ranges from [code]0.0[/code] to [code]1.0[/code] with precision [code].01[/code].
set_rumble ::
             (ARVRPositionalTracker :< cls, Object :< cls) =>
             cls -> Float -> IO ()
set_rumble cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_set_rumble
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)