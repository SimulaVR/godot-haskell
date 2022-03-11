{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CameraServer
       (Godot.Core.CameraServer._FEED_YCBCR_IMAGE,
        Godot.Core.CameraServer._FEED_Y_IMAGE,
        Godot.Core.CameraServer._FEED_CBCR_IMAGE,
        Godot.Core.CameraServer._FEED_RGBA_IMAGE,
        Godot.Core.CameraServer.sig_camera_feed_added,
        Godot.Core.CameraServer.sig_camera_feed_removed,
        Godot.Core.CameraServer.add_feed, Godot.Core.CameraServer.feeds,
        Godot.Core.CameraServer.get_feed,
        Godot.Core.CameraServer.get_feed_count,
        Godot.Core.CameraServer.remove_feed)
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

_FEED_YCBCR_IMAGE :: Int
_FEED_YCBCR_IMAGE = 0

_FEED_Y_IMAGE :: Int
_FEED_Y_IMAGE = 0

_FEED_CBCR_IMAGE :: Int
_FEED_CBCR_IMAGE = 1

_FEED_RGBA_IMAGE :: Int
_FEED_RGBA_IMAGE = 0

-- | Emitted when a @CameraFeed@ is added (e.g. a webcam is plugged in).
sig_camera_feed_added ::
                      Godot.Internal.Dispatch.Signal CameraServer
sig_camera_feed_added
  = Godot.Internal.Dispatch.Signal "camera_feed_added"

instance NodeSignal CameraServer "camera_feed_added" '[Int]

-- | Emitted when a @CameraFeed@ is removed (e.g. a webcam is unplugged).
sig_camera_feed_removed ::
                        Godot.Internal.Dispatch.Signal CameraServer
sig_camera_feed_removed
  = Godot.Internal.Dispatch.Signal "camera_feed_removed"

instance NodeSignal CameraServer "camera_feed_removed" '[Int]

{-# NOINLINE bindCameraServer_add_feed #-}

-- | Adds the camera @feed@ to the camera server.
bindCameraServer_add_feed :: MethodBind
bindCameraServer_add_feed
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "add_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the camera @feed@ to the camera server.
add_feed ::
           (CameraServer :< cls, Object :< cls) => cls -> CameraFeed -> IO ()
add_feed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_add_feed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraServer "add_feed" '[CameraFeed] (IO ())
         where
        nodeMethod = Godot.Core.CameraServer.add_feed

{-# NOINLINE bindCameraServer_feeds #-}

-- | Returns an array of @CameraFeed@s.
bindCameraServer_feeds :: MethodBind
bindCameraServer_feeds
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "feeds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of @CameraFeed@s.
feeds :: (CameraServer :< cls, Object :< cls) => cls -> IO Array
feeds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_feeds (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraServer "feeds" '[] (IO Array) where
        nodeMethod = Godot.Core.CameraServer.feeds

{-# NOINLINE bindCameraServer_get_feed #-}

-- | Returns the @CameraFeed@ corresponding to the camera with the given @index@.
bindCameraServer_get_feed :: MethodBind
bindCameraServer_get_feed
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "get_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @CameraFeed@ corresponding to the camera with the given @index@.
get_feed ::
           (CameraServer :< cls, Object :< cls) => cls -> Int -> IO CameraFeed
get_feed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_get_feed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraServer "get_feed" '[Int] (IO CameraFeed)
         where
        nodeMethod = Godot.Core.CameraServer.get_feed

{-# NOINLINE bindCameraServer_get_feed_count #-}

-- | Returns the number of @CameraFeed@s registered.
bindCameraServer_get_feed_count :: MethodBind
bindCameraServer_get_feed_count
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "get_feed_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of @CameraFeed@s registered.
get_feed_count ::
                 (CameraServer :< cls, Object :< cls) => cls -> IO Int
get_feed_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_get_feed_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraServer "get_feed_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CameraServer.get_feed_count

{-# NOINLINE bindCameraServer_remove_feed #-}

-- | Removes the specified camera @feed@.
bindCameraServer_remove_feed :: MethodBind
bindCameraServer_remove_feed
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "remove_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the specified camera @feed@.
remove_feed ::
              (CameraServer :< cls, Object :< cls) => cls -> CameraFeed -> IO ()
remove_feed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_remove_feed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraServer "remove_feed" '[CameraFeed]
           (IO ())
         where
        nodeMethod = Godot.Core.CameraServer.remove_feed