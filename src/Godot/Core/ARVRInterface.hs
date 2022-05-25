{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ARVRInterface
       (Godot.Core.ARVRInterface._EYE_LEFT,
        Godot.Core.ARVRInterface._EYE_MONO,
        Godot.Core.ARVRInterface._ARVR_NONE,
        Godot.Core.ARVRInterface._ARVR_AR,
        Godot.Core.ARVRInterface._ARVR_UNKNOWN_TRACKING,
        Godot.Core.ARVRInterface._ARVR_MONO,
        Godot.Core.ARVRInterface._EYE_RIGHT,
        Godot.Core.ARVRInterface._ARVR_NOT_TRACKING,
        Godot.Core.ARVRInterface._ARVR_NORMAL_TRACKING,
        Godot.Core.ARVRInterface._ARVR_EXTERNAL,
        Godot.Core.ARVRInterface._ARVR_EXCESSIVE_MOTION,
        Godot.Core.ARVRInterface._ARVR_INSUFFICIENT_FEATURES,
        Godot.Core.ARVRInterface._ARVR_STEREO,
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

_EYE_LEFT :: Int
_EYE_LEFT = 1

_EYE_MONO :: Int
_EYE_MONO = 0

_ARVR_NONE :: Int
_ARVR_NONE = 0

_ARVR_AR :: Int
_ARVR_AR = 4

_ARVR_UNKNOWN_TRACKING :: Int
_ARVR_UNKNOWN_TRACKING = 3

_ARVR_MONO :: Int
_ARVR_MONO = 1

_EYE_RIGHT :: Int
_EYE_RIGHT = 2

_ARVR_NOT_TRACKING :: Int
_ARVR_NOT_TRACKING = 4

_ARVR_NORMAL_TRACKING :: Int
_ARVR_NORMAL_TRACKING = 0

_ARVR_EXTERNAL :: Int
_ARVR_EXTERNAL = 8

_ARVR_EXCESSIVE_MOTION :: Int
_ARVR_EXCESSIVE_MOTION = 1

_ARVR_INSUFFICIENT_FEATURES :: Int
_ARVR_INSUFFICIENT_FEATURES = 2

_ARVR_STEREO :: Int
_ARVR_STEREO = 2

instance NodeProperty ARVRInterface
           "ar_is_anchor_detection_enabled"
           Bool
           'False
         where
        nodeProperty
          = (get_anchor_detection_is_enabled,
             wrapDroppingSetter set_anchor_detection_is_enabled, Nothing)

instance NodeProperty ARVRInterface "interface_is_initialized" Bool
           'False
         where
        nodeProperty
          = (is_initialized, wrapDroppingSetter set_is_initialized, Nothing)

instance NodeProperty ARVRInterface "interface_is_primary" Bool
           'False
         where
        nodeProperty
          = (is_primary, wrapDroppingSetter set_is_primary, Nothing)

{-# NOINLINE bindARVRInterface_get_anchor_detection_is_enabled #-}

-- | On an AR interface, @true@ if anchor detection is enabled.
bindARVRInterface_get_anchor_detection_is_enabled :: MethodBind
bindARVRInterface_get_anchor_detection_is_enabled
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_anchor_detection_is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On an AR interface, @true@ if anchor detection is enabled.
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

instance NodeMethod ARVRInterface "get_anchor_detection_is_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.ARVRInterface.get_anchor_detection_is_enabled

{-# NOINLINE bindARVRInterface_get_camera_feed_id #-}

-- | If this is an AR interface that requires displaying a camera feed as the background, this method returns the feed ID in the @CameraServer@ for this interface.
bindARVRInterface_get_camera_feed_id :: MethodBind
bindARVRInterface_get_camera_feed_id
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_camera_feed_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this is an AR interface that requires displaying a camera feed as the background, this method returns the feed ID in the @CameraServer@ for this interface.
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

instance NodeMethod ARVRInterface "get_camera_feed_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRInterface.get_camera_feed_id

{-# NOINLINE bindARVRInterface_get_capabilities #-}

-- | Returns a combination of @enum Capabilities@ flags providing information about the capabilities of this interface.
bindARVRInterface_get_capabilities :: MethodBind
bindARVRInterface_get_capabilities
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "get_capabilities" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a combination of @enum Capabilities@ flags providing information about the capabilities of this interface.
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

instance NodeMethod ARVRInterface "get_capabilities" '[] (IO Int)
         where
        nodeMethod = Godot.Core.ARVRInterface.get_capabilities

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

instance NodeMethod ARVRInterface "get_name" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.ARVRInterface.get_name

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

instance NodeMethod ARVRInterface "get_render_targetsize" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ARVRInterface.get_render_targetsize

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

instance NodeMethod ARVRInterface "get_tracking_status" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.ARVRInterface.get_tracking_status

{-# NOINLINE bindARVRInterface_initialize #-}

-- | Call this to initialize this interface. The first interface that is initialized is identified as the primary interface and it will be used for rendering output.
--   				After initializing the interface you want to use you then need to enable the AR/VR mode of a viewport and rendering should commence.
--   				__Note:__ You must enable the AR/VR mode on the main viewport for any device that uses the main output of Godot, such as for mobile VR.
--   				If you do this for a platform that handles its own output (such as OpenVR) Godot will show just one eye without distortion on screen. Alternatively, you can add a separate viewport node to your scene and enable AR/VR on that viewport. It will be used to output to the HMD, leaving you free to do anything you like in the main window, such as using a separate camera as a spectator camera or rendering something completely different.
--   				While currently not used, you can activate additional interfaces. You may wish to do this if you want to track controllers from other platforms. However, at this point in time only one interface can render to an HMD.
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
--   				__Note:__ You must enable the AR/VR mode on the main viewport for any device that uses the main output of Godot, such as for mobile VR.
--   				If you do this for a platform that handles its own output (such as OpenVR) Godot will show just one eye without distortion on screen. Alternatively, you can add a separate viewport node to your scene and enable AR/VR on that viewport. It will be used to output to the HMD, leaving you free to do anything you like in the main window, such as using a separate camera as a spectator camera or rendering something completely different.
--   				While currently not used, you can activate additional interfaces. You may wish to do this if you want to track controllers from other platforms. However, at this point in time only one interface can render to an HMD.
initialize ::
             (ARVRInterface :< cls, Object :< cls) => cls -> IO Bool
initialize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_initialize (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRInterface "initialize" '[] (IO Bool) where
        nodeMethod = Godot.Core.ARVRInterface.initialize

{-# NOINLINE bindARVRInterface_is_initialized #-}

-- | @true@ if this interface been initialized.
bindARVRInterface_is_initialized :: MethodBind
bindARVRInterface_is_initialized
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "is_initialized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @true@ if this interface been initialized.
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

instance NodeMethod ARVRInterface "is_initialized" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.ARVRInterface.is_initialized

{-# NOINLINE bindARVRInterface_is_primary #-}

-- | @true@ if this is the primary interface.
bindARVRInterface_is_primary :: MethodBind
bindARVRInterface_is_primary
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "is_primary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @true@ if this is the primary interface.
is_primary ::
             (ARVRInterface :< cls, Object :< cls) => cls -> IO Bool
is_primary cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_is_primary (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRInterface "is_primary" '[] (IO Bool) where
        nodeMethod = Godot.Core.ARVRInterface.is_primary

{-# NOINLINE bindARVRInterface_is_stereo #-}

-- | Returns @true@ if the current output of this interface is in stereo.
bindARVRInterface_is_stereo :: MethodBind
bindARVRInterface_is_stereo
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "is_stereo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the current output of this interface is in stereo.
is_stereo ::
            (ARVRInterface :< cls, Object :< cls) => cls -> IO Bool
is_stereo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRInterface_is_stereo (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ARVRInterface "is_stereo" '[] (IO Bool) where
        nodeMethod = Godot.Core.ARVRInterface.is_stereo

{-# NOINLINE bindARVRInterface_set_anchor_detection_is_enabled #-}

-- | On an AR interface, @true@ if anchor detection is enabled.
bindARVRInterface_set_anchor_detection_is_enabled :: MethodBind
bindARVRInterface_set_anchor_detection_is_enabled
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "set_anchor_detection_is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | On an AR interface, @true@ if anchor detection is enabled.
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

instance NodeMethod ARVRInterface "set_anchor_detection_is_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.ARVRInterface.set_anchor_detection_is_enabled

{-# NOINLINE bindARVRInterface_set_is_initialized #-}

-- | @true@ if this interface been initialized.
bindARVRInterface_set_is_initialized :: MethodBind
bindARVRInterface_set_is_initialized
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "set_is_initialized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @true@ if this interface been initialized.
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

instance NodeMethod ARVRInterface "set_is_initialized" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.ARVRInterface.set_is_initialized

{-# NOINLINE bindARVRInterface_set_is_primary #-}

-- | @true@ if this is the primary interface.
bindARVRInterface_set_is_primary :: MethodBind
bindARVRInterface_set_is_primary
  = unsafePerformIO $
      withCString "ARVRInterface" $
        \ clsNamePtr ->
          withCString "set_is_primary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @true@ if this is the primary interface.
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

instance NodeMethod ARVRInterface "set_is_primary" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.ARVRInterface.set_is_primary

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

instance NodeMethod ARVRInterface "uninitialize" '[] (IO ()) where
        nodeMethod = Godot.Core.ARVRInterface.uninitialize