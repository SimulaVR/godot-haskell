{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Texture()

instance NodeProperty CameraTexture "camera_feed_id" Int 'False
         where
        nodeProperty
          = (get_camera_feed_id, wrapDroppingSetter set_camera_feed_id,
             Nothing)

instance NodeProperty CameraTexture "camera_is_active" Bool 'False
         where
        nodeProperty
          = (get_camera_active, wrapDroppingSetter set_camera_active,
             Nothing)

instance NodeProperty CameraTexture "which_feed" Int 'False where
        nodeProperty
          = (get_which_feed, wrapDroppingSetter set_which_feed, Nothing)

{-# NOINLINE bindCameraTexture_get_camera_active #-}

-- | Convenience property that gives access to the active property of the @CameraFeed@.
bindCameraTexture_get_camera_active :: MethodBind
bindCameraTexture_get_camera_active
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "get_camera_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Convenience property that gives access to the active property of the @CameraFeed@.
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

instance NodeMethod CameraTexture "get_camera_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CameraTexture.get_camera_active

{-# NOINLINE bindCameraTexture_get_camera_feed_id #-}

-- | The ID of the @CameraFeed@ for which we want to display the image.
bindCameraTexture_get_camera_feed_id :: MethodBind
bindCameraTexture_get_camera_feed_id
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "get_camera_feed_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ID of the @CameraFeed@ for which we want to display the image.
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

instance NodeMethod CameraTexture "get_camera_feed_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CameraTexture.get_camera_feed_id

{-# NOINLINE bindCameraTexture_get_which_feed #-}

-- | Which image within the @CameraFeed@ we want access to, important if the camera image is split in a Y and CbCr component.
bindCameraTexture_get_which_feed :: MethodBind
bindCameraTexture_get_which_feed
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "get_which_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Which image within the @CameraFeed@ we want access to, important if the camera image is split in a Y and CbCr component.
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

instance NodeMethod CameraTexture "get_which_feed" '[] (IO Int)
         where
        nodeMethod = Godot.Core.CameraTexture.get_which_feed

{-# NOINLINE bindCameraTexture_set_camera_active #-}

-- | Convenience property that gives access to the active property of the @CameraFeed@.
bindCameraTexture_set_camera_active :: MethodBind
bindCameraTexture_set_camera_active
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "set_camera_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Convenience property that gives access to the active property of the @CameraFeed@.
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

instance NodeMethod CameraTexture "set_camera_active" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CameraTexture.set_camera_active

{-# NOINLINE bindCameraTexture_set_camera_feed_id #-}

-- | The ID of the @CameraFeed@ for which we want to display the image.
bindCameraTexture_set_camera_feed_id :: MethodBind
bindCameraTexture_set_camera_feed_id
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "set_camera_feed_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ID of the @CameraFeed@ for which we want to display the image.
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

instance NodeMethod CameraTexture "set_camera_feed_id" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CameraTexture.set_camera_feed_id

{-# NOINLINE bindCameraTexture_set_which_feed #-}

-- | Which image within the @CameraFeed@ we want access to, important if the camera image is split in a Y and CbCr component.
bindCameraTexture_set_which_feed :: MethodBind
bindCameraTexture_set_which_feed
  = unsafePerformIO $
      withCString "CameraTexture" $
        \ clsNamePtr ->
          withCString "set_which_feed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Which image within the @CameraFeed@ we want access to, important if the camera image is split in a Y and CbCr component.
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

instance NodeMethod CameraTexture "set_which_feed" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.CameraTexture.set_which_feed