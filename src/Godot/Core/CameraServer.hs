{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FEED_YCBCR_IMAGE :: Int
_FEED_YCBCR_IMAGE = 0

_FEED_Y_IMAGE :: Int
_FEED_Y_IMAGE = 0

_FEED_CBCR_IMAGE :: Int
_FEED_CBCR_IMAGE = 1

_FEED_RGBA_IMAGE :: Int
_FEED_RGBA_IMAGE = 0

sig_camera_feed_added ::
                      Godot.Internal.Dispatch.Signal CameraServer
sig_camera_feed_added
  = Godot.Internal.Dispatch.Signal "camera_feed_added"

sig_camera_feed_removed ::
                        Godot.Internal.Dispatch.Signal CameraServer
sig_camera_feed_removed
  = Godot.Internal.Dispatch.Signal "camera_feed_removed"

{-# NOINLINE bindCameraServer_add_feed #-}

bindCameraServer_add_feed :: MethodBind
bindCameraServer_add_feed
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "add_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_feed ::
           (CameraServer :< cls, Object :< cls) => cls -> CameraFeed -> IO ()
add_feed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_add_feed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraServer_feeds #-}

bindCameraServer_feeds :: MethodBind
bindCameraServer_feeds
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "feeds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

feeds :: (CameraServer :< cls, Object :< cls) => cls -> IO Array
feeds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_feeds (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraServer_get_feed #-}

bindCameraServer_get_feed :: MethodBind
bindCameraServer_get_feed
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "get_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_feed ::
           (CameraServer :< cls, Object :< cls) => cls -> Int -> IO CameraFeed
get_feed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_get_feed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraServer_get_feed_count #-}

bindCameraServer_get_feed_count :: MethodBind
bindCameraServer_get_feed_count
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "get_feed_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_feed_count ::
                 (CameraServer :< cls, Object :< cls) => cls -> IO Int
get_feed_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_get_feed_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraServer_remove_feed #-}

bindCameraServer_remove_feed :: MethodBind
bindCameraServer_remove_feed
  = unsafePerformIO $
      withCString "CameraServer" $
        \ clsNamePtr ->
          withCString "remove_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_feed ::
              (CameraServer :< cls, Object :< cls) => cls -> CameraFeed -> IO ()
remove_feed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraServer_remove_feed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)