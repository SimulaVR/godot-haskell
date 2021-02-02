{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CameraTexture
       (Godot.Core.CameraTexture.get_camera_active,
        Godot.Core.CameraTexture.get_camera_feed_id,
        Godot.Core.CameraTexture.get_which_feed,
        Godot.Core.CameraTexture.set_camera_active,
        Godot.Core.CameraTexture.set_camera_feed_id,
        Godot.Core.CameraTexture.set_which_feed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCameraTexture_get_camera_active #-}

bindCameraTexture_get_camera_active :: MethodBind
bindCameraTexture_get_camera_active
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "get_camera_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_camera_active ::
                    (CameraTexture :< cls, Object :< cls) => cls -> IO Bool
get_camera_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraTexture_get_camera_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraTexture_get_camera_feed_id #-}

bindCameraTexture_get_camera_feed_id :: MethodBind
bindCameraTexture_get_camera_feed_id
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "get_camera_feed_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_camera_feed_id ::
                     (CameraTexture :< cls, Object :< cls) => cls -> IO Int
get_camera_feed_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraTexture_get_camera_feed_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraTexture_get_which_feed #-}

bindCameraTexture_get_which_feed :: MethodBind
bindCameraTexture_get_which_feed
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "get_which_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_which_feed ::
                 (CameraTexture :< cls, Object :< cls) => cls -> IO Int
get_which_feed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraTexture_get_which_feed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraTexture_set_camera_active #-}

bindCameraTexture_set_camera_active :: MethodBind
bindCameraTexture_set_camera_active
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "set_camera_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_camera_active ::
                    (CameraTexture :< cls, Object :< cls) => cls -> Bool -> IO ()
set_camera_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraTexture_set_camera_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraTexture_set_camera_feed_id #-}

bindCameraTexture_set_camera_feed_id :: MethodBind
bindCameraTexture_set_camera_feed_id
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "set_camera_feed_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_camera_feed_id ::
                     (CameraTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_camera_feed_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraTexture_set_camera_feed_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCameraTexture_set_which_feed #-}

bindCameraTexture_set_which_feed :: MethodBind
bindCameraTexture_set_which_feed
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "set_which_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_which_feed ::
                 (CameraTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_which_feed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraTexture_set_which_feed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)