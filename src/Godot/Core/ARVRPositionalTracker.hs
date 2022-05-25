{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ARVRPositionalTracker
       (Godot.Core.ARVRPositionalTracker._TRACKER_RIGHT_HAND,
        Godot.Core.ARVRPositionalTracker._TRACKER_HAND_UNKNOWN,
        Godot.Core.ARVRPositionalTracker._TRACKER_LEFT_HAND,
        Godot.Core.ARVRPositionalTracker._set_joy_id,
        Godot.Core.ARVRPositionalTracker._set_mesh,
        Godot.Core.ARVRPositionalTracker._set_name,
        Godot.Core.ARVRPositionalTracker._set_orientation,
        Godot.Core.ARVRPositionalTracker._set_rw_position,
        Godot.Core.ARVRPositionalTracker._set_type,
        Godot.Core.ARVRPositionalTracker.get_hand,
        Godot.Core.ARVRPositionalTracker.get_joy_id,
        Godot.Core.ARVRPositionalTracker.get_mesh,
        Godot.Core.ARVRPositionalTracker.get_name,
        Godot.Core.ARVRPositionalTracker.get_orientation,
        Godot.Core.ARVRPositionalTracker.get_position,
        Godot.Core.ARVRPositionalTracker.get_rumble,
        Godot.Core.ARVRPositionalTracker.get_tracks_orientation,
        Godot.Core.ARVRPositionalTracker.get_tracks_position,
        Godot.Core.ARVRPositionalTracker.get_transform,
        Godot.Core.ARVRPositionalTracker.get_type,
        Godot.Core.ARVRPositionalTracker.set_rumble)
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
import Godot.Core.Object()

_TRACKER_RIGHT_HAND :: Int
_TRACKER_RIGHT_HAND = 2

_TRACKER_HAND_UNKNOWN :: Int
_TRACKER_HAND_UNKNOWN = 0

_TRACKER_LEFT_HAND :: Int
_TRACKER_LEFT_HAND = 1

instance NodeProperty ARVRPositionalTracker "rumble" Float 'False
         where
        nodeProperty = (get_rumble, wrapDroppingSetter set_rumble, Nothing)

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

instance NodeMethod ARVRPositionalTracker "_set_joy_id" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker._set_joy_id

{-# NOINLINE bindARVRPositionalTracker__set_mesh #-}

bindARVRPositionalTracker__set_mesh :: MethodBind
bindARVRPositionalTracker__set_mesh
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "_set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_mesh ::
            (ARVRPositionalTracker :< cls, Object :< cls) =>
            cls -> Mesh -> IO ()
_set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker__set_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRPositionalTracker "_set_mesh" '[Mesh]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker._set_mesh

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

instance NodeMethod ARVRPositionalTracker "_set_name"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker._set_name

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

instance NodeMethod ARVRPositionalTracker "_set_orientation"
           '[Basis]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker._set_orientation

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

instance NodeMethod ARVRPositionalTracker "_set_rw_position"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker._set_rw_position

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

instance NodeMethod ARVRPositionalTracker "_set_type" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker._set_type

{-# NOINLINE bindARVRPositionalTracker_get_hand #-}

-- | Returns the hand holding this tracker, if known. See @enum TrackerHand@ constants.
bindARVRPositionalTracker_get_hand :: MethodBind
bindARVRPositionalTracker_get_hand
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_hand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the hand holding this tracker, if known. See @enum TrackerHand@ constants.
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

instance NodeMethod ARVRPositionalTracker "get_hand" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_hand

{-# NOINLINE bindARVRPositionalTracker_get_joy_id #-}

-- | If this is a controller that is being tracked, the controller will also be represented by a joystick entry with this ID.
bindARVRPositionalTracker_get_joy_id :: MethodBind
bindARVRPositionalTracker_get_joy_id
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_joy_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this is a controller that is being tracked, the controller will also be represented by a joystick entry with this ID.
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

instance NodeMethod ARVRPositionalTracker "get_joy_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_joy_id

{-# NOINLINE bindARVRPositionalTracker_get_mesh #-}

-- | Returns the mesh related to a controller or anchor point if one is available.
bindARVRPositionalTracker_get_mesh :: MethodBind
bindARVRPositionalTracker_get_mesh
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the mesh related to a controller or anchor point if one is available.
get_mesh ::
           (ARVRPositionalTracker :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRPositionalTracker_get_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRPositionalTracker "get_mesh" '[] (IO Mesh)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_mesh

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

instance NodeMethod ARVRPositionalTracker "get_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_name

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

instance NodeMethod ARVRPositionalTracker "get_orientation" '[]
           (IO Basis)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_orientation

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

instance NodeMethod ARVRPositionalTracker "get_position" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_position

{-# NOINLINE bindARVRPositionalTracker_get_rumble #-}

-- | The degree to which the tracker rumbles. Ranges from @0.0@ to @1.0@ with precision @.01@.
bindARVRPositionalTracker_get_rumble :: MethodBind
bindARVRPositionalTracker_get_rumble
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_rumble" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which the tracker rumbles. Ranges from @0.0@ to @1.0@ with precision @.01@.
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

instance NodeMethod ARVRPositionalTracker "get_rumble" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_rumble

{-# NOINLINE bindARVRPositionalTracker_get_tracks_orientation #-}

-- | Returns @true@ if this device tracks orientation.
bindARVRPositionalTracker_get_tracks_orientation :: MethodBind
bindARVRPositionalTracker_get_tracks_orientation
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_tracks_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this device tracks orientation.
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

instance NodeMethod ARVRPositionalTracker "get_tracks_orientation"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.ARVRPositionalTracker.get_tracks_orientation

{-# NOINLINE bindARVRPositionalTracker_get_tracks_position #-}

-- | Returns @true@ if this device tracks position.
bindARVRPositionalTracker_get_tracks_position :: MethodBind
bindARVRPositionalTracker_get_tracks_position
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "get_tracks_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this device tracks position.
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

instance NodeMethod ARVRPositionalTracker "get_tracks_position" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_tracks_position

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

instance NodeMethod ARVRPositionalTracker "get_transform" '[Bool]
           (IO Transform)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_transform

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

instance NodeMethod ARVRPositionalTracker "get_type" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.get_type

{-# NOINLINE bindARVRPositionalTracker_set_rumble #-}

-- | The degree to which the tracker rumbles. Ranges from @0.0@ to @1.0@ with precision @.01@.
bindARVRPositionalTracker_set_rumble :: MethodBind
bindARVRPositionalTracker_set_rumble
  = unsafePerformIO $
      withCString "ARVRPositionalTracker" $
        \ clsNamePtr ->
          withCString "set_rumble" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which the tracker rumbles. Ranges from @0.0@ to @1.0@ with precision @.01@.
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

instance NodeMethod ARVRPositionalTracker "set_rumble" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRPositionalTracker.set_rumble