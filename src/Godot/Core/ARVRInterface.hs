{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ARVRInterface
       (Godot.Core.ARVRInterface._ARVR_STEREO,
        Godot.Core.ARVRInterface._ARVR_INSUFFICIENT_FEATURES,
        Godot.Core.ARVRInterface._ARVR_NOT_TRACKING,
        Godot.Core.ARVRInterface._EYE_MONO,
        Godot.Core.ARVRInterface._EYE_LEFT,
        Godot.Core.ARVRInterface._ARVR_EXCESSIVE_MOTION,
        Godot.Core.ARVRInterface._ARVR_NORMAL_TRACKING,
        Godot.Core.ARVRInterface._EYE_RIGHT,
        Godot.Core.ARVRInterface._ARVR_NONE,
        Godot.Core.ARVRInterface._ARVR_EXTERNAL,
        Godot.Core.ARVRInterface._ARVR_UNKNOWN_TRACKING,
        Godot.Core.ARVRInterface._ARVR_AR,
        Godot.Core.ARVRInterface._ARVR_MONO,
        Godot.Core.ARVRInterface.get_anchor_detection_is_enabled,
        Godot.Core.ARVRInterface.get_camera_feed_id,
        Godot.Core.ARVRInterface.get_capabilities,
        Godot.Core.ARVRInterface.get_name,
        Godot.Core.ARVRInterface.get_render_targetsize,
        Godot.Core.ARVRInterface.get_tracking_status,
        Godot.Core.ARVRInterface.initialize,
        Godot.Core.ARVRInterface.is_initialized,
        Godot.Core.ARVRInterface.is_primary,
        Godot.Core.ARVRInterface.is_stereo,
        Godot.Core.ARVRInterface.set_anchor_detection_is_enabled,
        Godot.Core.ARVRInterface.set_is_initialized,
        Godot.Core.ARVRInterface.set_is_primary,
        Godot.Core.ARVRInterface.uninitialize)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ARVR_STEREO :: Int
_ARVR_STEREO = 2

_ARVR_INSUFFICIENT_FEATURES :: Int
_ARVR_INSUFFICIENT_FEATURES = 2

_ARVR_NOT_TRACKING :: Int
_ARVR_NOT_TRACKING = 4

_EYE_MONO :: Int
_EYE_MONO = 0

_EYE_LEFT :: Int
_EYE_LEFT = 1

_ARVR_EXCESSIVE_MOTION :: Int
_ARVR_EXCESSIVE_MOTION = 1

_ARVR_NORMAL_TRACKING :: Int
_ARVR_NORMAL_TRACKING = 0

_EYE_RIGHT :: Int
_EYE_RIGHT = 2

_ARVR_NONE :: Int
_ARVR_NONE = 0

_ARVR_EXTERNAL :: Int
_ARVR_EXTERNAL = 8

_ARVR_UNKNOWN_TRACKING :: Int
_ARVR_UNKNOWN_TRACKING = 3

_ARVR_AR :: Int
_ARVR_AR = 4

_ARVR_MONO :: Int
_ARVR_MONO = 1

{-# NOINLINE bindARVRInterface_get_anchor_detection_is_enabled #-}

-- | On an AR interface, is our anchor detection enabled?
bindARVRInterface_get_anchor_detection_is_enabled :: MethodBind
bindARVRInterface_get_anchor_detection_is_enabled
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_anchor_detection_is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On an AR interface, is our anchor detection enabled?
get_anchor_detection_is_enabled ::
                                  (ARVRInterface :< cls, Object :< cls) => cls -> IO Bool
get_anchor_detection_is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindARVRInterface_get_anchor_detection_is_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_get_camera_feed_id #-}

bindARVRInterface_get_camera_feed_id :: MethodBind
bindARVRInterface_get_camera_feed_id
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_camera_feed_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_camera_feed_id ::
                     (ARVRInterface :< cls, Object :< cls) => cls -> IO Int
get_camera_feed_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_get_camera_feed_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_get_capabilities #-}

-- | Returns a combination of flags providing information about the capabilities of this interface.
bindARVRInterface_get_capabilities :: MethodBind
bindARVRInterface_get_capabilities
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_capabilities" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a combination of flags providing information about the capabilities of this interface.
get_capabilities ::
                   (ARVRInterface :< cls, Object :< cls) => cls -> IO Int
get_capabilities cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_get_capabilities
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_get_name #-}

-- | Returns the name of this interface (OpenVR, OpenHMD, ARKit, etc).
bindARVRInterface_get_name :: MethodBind
bindARVRInterface_get_name
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of this interface (OpenVR, OpenHMD, ARKit, etc).
get_name ::
           (ARVRInterface :< cls, Object :< cls) => cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_get_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_get_render_targetsize #-}

-- | Returns the resolution at which we should render our intermediate results before things like lens distortion are applied by the VR platform.
bindARVRInterface_get_render_targetsize :: MethodBind
bindARVRInterface_get_render_targetsize
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_render_targetsize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the resolution at which we should render our intermediate results before things like lens distortion are applied by the VR platform.
get_render_targetsize ::
                        (ARVRInterface :< cls, Object :< cls) => cls -> IO Vector2
get_render_targetsize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_get_render_targetsize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_get_tracking_status #-}

-- | If supported, returns the status of our tracking. This will allow you to provide feedback to the user whether there are issues with positional tracking.
bindARVRInterface_get_tracking_status :: MethodBind
bindARVRInterface_get_tracking_status
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_tracking_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If supported, returns the status of our tracking. This will allow you to provide feedback to the user whether there are issues with positional tracking.
get_tracking_status ::
                      (ARVRInterface :< cls, Object :< cls) => cls -> IO Int
get_tracking_status cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_get_tracking_status
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_initialize #-}

-- | Call this to initialize this interface. The first interface that is initialized is identified as the primary interface and it will be used for rendering output.
--   				After initializing the interface you want to use you then need to enable the AR/VR mode of a viewport and rendering should commence.
--   				Note that you must enable the AR/VR mode on the main viewport for any device that uses the main output of Godot such as for mobile VR.
--   				If you do this for a platform that handles its own output (such as OpenVR) Godot will show just one eye without distortion on screen. Alternatively you can add a separate viewport node to your scene and enable AR/VR on that viewport and it will be used to output to the HMD leaving you free to do anything you like in the main window such as using a separate camera as a spectator camera or render out something completely different.
--   				While currently not used you can activate additional interfaces, you may wish to do this if you want to track controllers from other platforms. However at this point in time only one interface can render to an HMD.
bindARVRInterface_initialize :: MethodBind
bindARVRInterface_initialize
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Call this to initialize this interface. The first interface that is initialized is identified as the primary interface and it will be used for rendering output.
--   				After initializing the interface you want to use you then need to enable the AR/VR mode of a viewport and rendering should commence.
--   				Note that you must enable the AR/VR mode on the main viewport for any device that uses the main output of Godot such as for mobile VR.
--   				If you do this for a platform that handles its own output (such as OpenVR) Godot will show just one eye without distortion on screen. Alternatively you can add a separate viewport node to your scene and enable AR/VR on that viewport and it will be used to output to the HMD leaving you free to do anything you like in the main window such as using a separate camera as a spectator camera or render out something completely different.
--   				While currently not used you can activate additional interfaces, you may wish to do this if you want to track controllers from other platforms. However at this point in time only one interface can render to an HMD.
initialize ::
             (ARVRInterface :< cls, Object :< cls) => cls -> IO Bool
initialize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_initialize (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_is_initialized #-}

-- | Has this interface been initialized?
bindARVRInterface_is_initialized :: MethodBind
bindARVRInterface_is_initialized
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "is_initialized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Has this interface been initialized?
is_initialized ::
                 (ARVRInterface :< cls, Object :< cls) => cls -> IO Bool
is_initialized cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_is_initialized
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_is_primary #-}

-- | Is this our primary interface?
bindARVRInterface_is_primary :: MethodBind
bindARVRInterface_is_primary
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "is_primary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Is this our primary interface?
is_primary ::
             (ARVRInterface :< cls, Object :< cls) => cls -> IO Bool
is_primary cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_is_primary (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_is_stereo #-}

-- | Returns [code]true[/code] if the current output of this interface is in stereo.
bindARVRInterface_is_stereo :: MethodBind
bindARVRInterface_is_stereo
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "is_stereo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the current output of this interface is in stereo.
is_stereo ::
            (ARVRInterface :< cls, Object :< cls) => cls -> IO Bool
is_stereo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_is_stereo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_set_anchor_detection_is_enabled #-}

-- | On an AR interface, is our anchor detection enabled?
bindARVRInterface_set_anchor_detection_is_enabled :: MethodBind
bindARVRInterface_set_anchor_detection_is_enabled
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "set_anchor_detection_is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On an AR interface, is our anchor detection enabled?
set_anchor_detection_is_enabled ::
                                  (ARVRInterface :< cls, Object :< cls) => cls -> Bool -> IO ()
set_anchor_detection_is_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindARVRInterface_set_anchor_detection_is_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_set_is_initialized #-}

-- | Has this interface been initialized?
bindARVRInterface_set_is_initialized :: MethodBind
bindARVRInterface_set_is_initialized
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "set_is_initialized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Has this interface been initialized?
set_is_initialized ::
                     (ARVRInterface :< cls, Object :< cls) => cls -> Bool -> IO ()
set_is_initialized cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_set_is_initialized
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_set_is_primary #-}

-- | Is this our primary interface?
bindARVRInterface_set_is_primary :: MethodBind
bindARVRInterface_set_is_primary
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "set_is_primary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Is this our primary interface?
set_is_primary ::
                 (ARVRInterface :< cls, Object :< cls) => cls -> Bool -> IO ()
set_is_primary cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_set_is_primary
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRInterface_uninitialize #-}

-- | Turns the interface off.
bindARVRInterface_uninitialize :: MethodBind
bindARVRInterface_uninitialize
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "uninitialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turns the interface off.
uninitialize ::
               (ARVRInterface :< cls, Object :< cls) => cls -> IO ()
uninitialize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_uninitialize (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)