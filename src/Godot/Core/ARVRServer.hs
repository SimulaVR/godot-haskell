{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ARVRServer
       (Godot.Core.ARVRServer._RESET_BUT_KEEP_TILT,
        Godot.Core.ARVRServer._RESET_FULL_ROTATION,
        Godot.Core.ARVRServer._TRACKER_CONTROLLER,
        Godot.Core.ARVRServer._TRACKER_UNKNOWN,
        Godot.Core.ARVRServer._TRACKER_ANY_KNOWN,
        Godot.Core.ARVRServer._DONT_RESET_ROTATION,
        Godot.Core.ARVRServer._TRACKER_BASESTATION,
        Godot.Core.ARVRServer._TRACKER_ANCHOR,
        Godot.Core.ARVRServer._TRACKER_ANY,
        Godot.Core.ARVRServer.sig_interface_added,
        Godot.Core.ARVRServer.sig_interface_removed,
        Godot.Core.ARVRServer.sig_tracker_added,
        Godot.Core.ARVRServer.sig_tracker_removed,
        Godot.Core.ARVRServer.center_on_hmd,
        Godot.Core.ARVRServer.find_interface,
        Godot.Core.ARVRServer.get_hmd_transform,
        Godot.Core.ARVRServer.get_interface,
        Godot.Core.ARVRServer.get_interface_count,
        Godot.Core.ARVRServer.get_interfaces,
        Godot.Core.ARVRServer.get_last_commit_usec,
        Godot.Core.ARVRServer.get_last_frame_usec,
        Godot.Core.ARVRServer.get_last_process_usec,
        Godot.Core.ARVRServer.get_primary_interface,
        Godot.Core.ARVRServer.get_reference_frame,
        Godot.Core.ARVRServer.get_tracker,
        Godot.Core.ARVRServer.get_tracker_count,
        Godot.Core.ARVRServer.get_world_scale,
        Godot.Core.ARVRServer.set_primary_interface,
        Godot.Core.ARVRServer.set_world_scale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_RESET_BUT_KEEP_TILT :: Int
_RESET_BUT_KEEP_TILT = 1

_RESET_FULL_ROTATION :: Int
_RESET_FULL_ROTATION = 0

_TRACKER_CONTROLLER :: Int
_TRACKER_CONTROLLER = 1

_TRACKER_UNKNOWN :: Int
_TRACKER_UNKNOWN = 128

_TRACKER_ANY_KNOWN :: Int
_TRACKER_ANY_KNOWN = 127

_DONT_RESET_ROTATION :: Int
_DONT_RESET_ROTATION = 2

_TRACKER_BASESTATION :: Int
_TRACKER_BASESTATION = 2

_TRACKER_ANCHOR :: Int
_TRACKER_ANCHOR = 4

_TRACKER_ANY :: Int
_TRACKER_ANY = 255

-- | Signal send when a new interface has been added.
sig_interface_added :: Godot.Internal.Dispatch.Signal ARVRServer
sig_interface_added
  = Godot.Internal.Dispatch.Signal "interface_added"

-- | Signal send when an interface is removed.
sig_interface_removed :: Godot.Internal.Dispatch.Signal ARVRServer
sig_interface_removed
  = Godot.Internal.Dispatch.Signal "interface_removed"

-- | Signal send when a new tracker has been added. If you don't use a fixed number of controllers or if you're using ARVRAnchors for an AR solution it is important to react to this signal and add the appropriate ARVRController or ARVRAnchor node related to this new tracker.
sig_tracker_added :: Godot.Internal.Dispatch.Signal ARVRServer
sig_tracker_added = Godot.Internal.Dispatch.Signal "tracker_added"

-- | Signal send when a tracker is removed, you should remove any ARVRController or ARVRAnchor points if applicable. This is not mandatory, the nodes simply become inactive and will be made active again when a new tracker becomes available (i.e. a new controller is switched on that takes the place of the previous one).
sig_tracker_removed :: Godot.Internal.Dispatch.Signal ARVRServer
sig_tracker_removed
  = Godot.Internal.Dispatch.Signal "tracker_removed"

{-# NOINLINE bindARVRServer_center_on_hmd #-}

-- | This is a really important function to understand correctly. AR and VR platforms all handle positioning slightly differently.
--   				For platforms that do not offer spatial tracking our origin point (0,0,0) is the location of our HMD but you have little control over the direction the player is facing in the real world.
--   				For platforms that do offer spatial tracking our origin point depends very much on the system. For OpenVR our origin point is usually the center of the tracking space, on the ground. For other platforms its often the location of the tracking camera.
--   				This method allows you to center our tracker on the location of the HMD, it will take the current location of the HMD and use that to adjust all our tracking data in essence realigning the real world to your players current position in your game world.
--   				For this method to produce usable results tracking information should be available and this often takes a few frames after starting your game.
--   				You should call this method after a few seconds have passed, when the user requests a realignment of the display holding a designated button on a controller for a short period of time, and when implementing a teleport mechanism.
bindARVRServer_center_on_hmd :: MethodBind
bindARVRServer_center_on_hmd
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "center_on_hmd" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This is a really important function to understand correctly. AR and VR platforms all handle positioning slightly differently.
--   				For platforms that do not offer spatial tracking our origin point (0,0,0) is the location of our HMD but you have little control over the direction the player is facing in the real world.
--   				For platforms that do offer spatial tracking our origin point depends very much on the system. For OpenVR our origin point is usually the center of the tracking space, on the ground. For other platforms its often the location of the tracking camera.
--   				This method allows you to center our tracker on the location of the HMD, it will take the current location of the HMD and use that to adjust all our tracking data in essence realigning the real world to your players current position in your game world.
--   				For this method to produce usable results tracking information should be available and this often takes a few frames after starting your game.
--   				You should call this method after a few seconds have passed, when the user requests a realignment of the display holding a designated button on a controller for a short period of time, and when implementing a teleport mechanism.
center_on_hmd ::
                (ARVRServer :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
center_on_hmd cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_center_on_hmd (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_find_interface #-}

-- | Find an interface by its name. Say that you're making a game that uses specific capabilities of an AR/VR platform you can find the interface for that platform by name and initialize it.
bindARVRServer_find_interface :: MethodBind
bindARVRServer_find_interface
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "find_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Find an interface by its name. Say that you're making a game that uses specific capabilities of an AR/VR platform you can find the interface for that platform by name and initialize it.
find_interface ::
                 (ARVRServer :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ARVRInterface
find_interface cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_find_interface (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_hmd_transform #-}

-- | Returns the primary interface's transformation.
bindARVRServer_get_hmd_transform :: MethodBind
bindARVRServer_get_hmd_transform
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_hmd_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the primary interface's transformation.
get_hmd_transform ::
                    (ARVRServer :< cls, Object :< cls) => cls -> IO Transform
get_hmd_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_hmd_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_interface #-}

-- | Get the interface registered at a given index in our list of interfaces.
bindARVRServer_get_interface :: MethodBind
bindARVRServer_get_interface
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the interface registered at a given index in our list of interfaces.
get_interface ::
                (ARVRServer :< cls, Object :< cls) =>
                cls -> Int -> IO ARVRInterface
get_interface cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_interface (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_interface_count #-}

-- | Get the number of interfaces currently registered with the AR/VR server. If your game supports multiple AR/VR platforms, you can look through the available interface, and either present the user with a selection or simply try an initialize each interface and use the first one that returns [code]true[/code].
bindARVRServer_get_interface_count :: MethodBind
bindARVRServer_get_interface_count
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_interface_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the number of interfaces currently registered with the AR/VR server. If your game supports multiple AR/VR platforms, you can look through the available interface, and either present the user with a selection or simply try an initialize each interface and use the first one that returns [code]true[/code].
get_interface_count ::
                      (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_interface_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_interface_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_interfaces #-}

-- | Returns a list of available interfaces with both id and name of the interface.
bindARVRServer_get_interfaces :: MethodBind
bindARVRServer_get_interfaces
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_interfaces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of available interfaces with both id and name of the interface.
get_interfaces ::
                 (ARVRServer :< cls, Object :< cls) => cls -> IO Array
get_interfaces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_interfaces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_last_commit_usec #-}

bindARVRServer_get_last_commit_usec :: MethodBind
bindARVRServer_get_last_commit_usec
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_last_commit_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_last_commit_usec ::
                       (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_last_commit_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_last_commit_usec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_last_frame_usec #-}

bindARVRServer_get_last_frame_usec :: MethodBind
bindARVRServer_get_last_frame_usec
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_last_frame_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_last_frame_usec ::
                      (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_last_frame_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_last_frame_usec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_last_process_usec #-}

bindARVRServer_get_last_process_usec :: MethodBind
bindARVRServer_get_last_process_usec
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_last_process_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_last_process_usec ::
                        (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_last_process_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_last_process_usec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_primary_interface #-}

bindARVRServer_get_primary_interface :: MethodBind
bindARVRServer_get_primary_interface
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_primary_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_primary_interface ::
                        (ARVRServer :< cls, Object :< cls) => cls -> IO ARVRInterface
get_primary_interface cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_primary_interface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_reference_frame #-}

-- | Gets our reference frame transform, mostly used internally and exposed for GDNative build interfaces.
bindARVRServer_get_reference_frame :: MethodBind
bindARVRServer_get_reference_frame
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_reference_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets our reference frame transform, mostly used internally and exposed for GDNative build interfaces.
get_reference_frame ::
                      (ARVRServer :< cls, Object :< cls) => cls -> IO Transform
get_reference_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_reference_frame
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_tracker #-}

-- | Get the positional tracker at the given ID.
bindARVRServer_get_tracker :: MethodBind
bindARVRServer_get_tracker
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_tracker" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the positional tracker at the given ID.
get_tracker ::
              (ARVRServer :< cls, Object :< cls) =>
              cls -> Int -> IO ARVRPositionalTracker
get_tracker cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_tracker (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_tracker_count #-}

-- | Get the number of trackers currently registered.
bindARVRServer_get_tracker_count :: MethodBind
bindARVRServer_get_tracker_count
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_tracker_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the number of trackers currently registered.
get_tracker_count ::
                    (ARVRServer :< cls, Object :< cls) => cls -> IO Int
get_tracker_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_tracker_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_get_world_scale #-}

-- | Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 meter in the real world.
bindARVRServer_get_world_scale :: MethodBind
bindARVRServer_get_world_scale
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "get_world_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 meter in the real world.
get_world_scale ::
                  (ARVRServer :< cls, Object :< cls) => cls -> IO Float
get_world_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_get_world_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_set_primary_interface #-}

bindARVRServer_set_primary_interface :: MethodBind
bindARVRServer_set_primary_interface
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "set_primary_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_primary_interface ::
                        (ARVRServer :< cls, Object :< cls) => cls -> ARVRInterface -> IO ()
set_primary_interface cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_set_primary_interface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRServer_set_world_scale #-}

-- | Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 meter in the real world.
bindARVRServer_set_world_scale :: MethodBind
bindARVRServer_set_world_scale
  = unsafePerformIO $
      withCString "ARVRServer" $
        \ clsNamePtr ->
          withCString "set_world_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 meter in the real world.
set_world_scale ::
                  (ARVRServer :< cls, Object :< cls) => cls -> Float -> IO ()
set_world_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRServer_set_world_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)