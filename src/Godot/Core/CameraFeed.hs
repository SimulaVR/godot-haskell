{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CameraFeed
       (Godot.Core.CameraFeed._FEED_YCBCR,
        Godot.Core.CameraFeed._FEED_BACK, Godot.Core.CameraFeed._FEED_RGB,
        Godot.Core.CameraFeed._FEED_FRONT,
        Godot.Core.CameraFeed._FEED_YCBCR_SEP,
        Godot.Core.CameraFeed._FEED_UNSPECIFIED,
        Godot.Core.CameraFeed._FEED_NOIMAGE,
        Godot.Core.CameraFeed._allocate_texture,
        Godot.Core.CameraFeed._set_RGB_img,
        Godot.Core.CameraFeed._set_YCbCr_img,
        Godot.Core.CameraFeed._set_YCbCr_imgs,
        Godot.Core.CameraFeed._set_name,
        Godot.Core.CameraFeed._set_position, Godot.Core.CameraFeed.get_id,
        Godot.Core.CameraFeed.get_name, Godot.Core.CameraFeed.get_position,
        Godot.Core.CameraFeed.get_transform,
        Godot.Core.CameraFeed.is_active, Godot.Core.CameraFeed.set_active,
        Godot.Core.CameraFeed.set_transform)
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

_FEED_YCBCR :: Int
_FEED_YCBCR = 2

_FEED_BACK :: Int
_FEED_BACK = 2

_FEED_RGB :: Int
_FEED_RGB = 1

_FEED_FRONT :: Int
_FEED_FRONT = 1

_FEED_YCBCR_SEP :: Int
_FEED_YCBCR_SEP = 3

_FEED_UNSPECIFIED :: Int
_FEED_UNSPECIFIED = 0

_FEED_NOIMAGE :: Int
_FEED_NOIMAGE = 0

instance NodeProperty CameraFeed "feed_is_active" Bool 'False where
        nodeProperty = (is_active, wrapDroppingSetter set_active, Nothing)

instance NodeProperty CameraFeed "feed_transform" Transform2d
           'False
         where
        nodeProperty
          = (get_transform, wrapDroppingSetter set_transform, Nothing)

{-# NOINLINE bindCameraFeed__allocate_texture #-}

bindCameraFeed__allocate_texture :: MethodBind
bindCameraFeed__allocate_texture
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "_allocate_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_allocate_texture ::
                    (CameraFeed :< cls, Object :< cls) =>
                    cls -> Int -> Int -> Int -> Int -> Int -> IO ()
_allocate_texture cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed__allocate_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "_allocate_texture"
           '[Int, Int, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CameraFeed._allocate_texture

{-# NOINLINE bindCameraFeed__set_RGB_img #-}

bindCameraFeed__set_RGB_img :: MethodBind
bindCameraFeed__set_RGB_img
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "_set_RGB_img" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_RGB_img ::
               (CameraFeed :< cls, Object :< cls) => cls -> Image -> IO ()
_set_RGB_img cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed__set_RGB_img (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "_set_RGB_img" '[Image] (IO ())
         where
        nodeMethod = Godot.Core.CameraFeed._set_RGB_img

{-# NOINLINE bindCameraFeed__set_YCbCr_img #-}

bindCameraFeed__set_YCbCr_img :: MethodBind
bindCameraFeed__set_YCbCr_img
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "_set_YCbCr_img" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_YCbCr_img ::
                 (CameraFeed :< cls, Object :< cls) => cls -> Image -> IO ()
_set_YCbCr_img cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed__set_YCbCr_img (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "_set_YCbCr_img" '[Image] (IO ())
         where
        nodeMethod = Godot.Core.CameraFeed._set_YCbCr_img

{-# NOINLINE bindCameraFeed__set_YCbCr_imgs #-}

bindCameraFeed__set_YCbCr_imgs :: MethodBind
bindCameraFeed__set_YCbCr_imgs
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "_set_YCbCr_imgs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_YCbCr_imgs ::
                  (CameraFeed :< cls, Object :< cls) =>
                  cls -> Image -> Image -> IO ()
_set_YCbCr_imgs cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed__set_YCbCr_imgs (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "_set_YCbCr_imgs" '[Image, Image]
           (IO ())
         where
        nodeMethod = Godot.Core.CameraFeed._set_YCbCr_imgs

{-# NOINLINE bindCameraFeed__set_name #-}

bindCameraFeed__set_name :: MethodBind
bindCameraFeed__set_name
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "_set_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_name ::
            (CameraFeed :< cls, Object :< cls) => cls -> GodotString -> IO ()
_set_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed__set_name (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "_set_name" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.CameraFeed._set_name

{-# NOINLINE bindCameraFeed__set_position #-}

bindCameraFeed__set_position :: MethodBind
bindCameraFeed__set_position
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "_set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_position ::
                (CameraFeed :< cls, Object :< cls) => cls -> Int -> IO ()
_set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed__set_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "_set_position" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CameraFeed._set_position

{-# NOINLINE bindCameraFeed_get_id #-}

-- | Returns the unique ID for this feed.
bindCameraFeed_get_id :: MethodBind
bindCameraFeed_get_id
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "get_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the unique ID for this feed.
get_id :: (CameraFeed :< cls, Object :< cls) => cls -> IO Int
get_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed_get_id (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "get_id" '[] (IO Int) where
        nodeMethod = Godot.Core.CameraFeed.get_id

{-# NOINLINE bindCameraFeed_get_name #-}

-- | Returns the camera's name.
bindCameraFeed_get_name :: MethodBind
bindCameraFeed_get_name
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the camera's name.
get_name ::
           (CameraFeed :< cls, Object :< cls) => cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed_get_name (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "get_name" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.CameraFeed.get_name

{-# NOINLINE bindCameraFeed_get_position #-}

-- | Returns the position of camera on the device.
bindCameraFeed_get_position :: MethodBind
bindCameraFeed_get_position
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of camera on the device.
get_position :: (CameraFeed :< cls, Object :< cls) => cls -> IO Int
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed_get_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "get_position" '[] (IO Int) where
        nodeMethod = Godot.Core.CameraFeed.get_position

{-# NOINLINE bindCameraFeed_get_transform #-}

-- | The transform applied to the camera's image.
bindCameraFeed_get_transform :: MethodBind
bindCameraFeed_get_transform
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transform applied to the camera's image.
get_transform ::
                (CameraFeed :< cls, Object :< cls) => cls -> IO Transform2d
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed_get_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "get_transform" '[] (IO Transform2d)
         where
        nodeMethod = Godot.Core.CameraFeed.get_transform

{-# NOINLINE bindCameraFeed_is_active #-}

-- | If @true@, the feed is active.
bindCameraFeed_is_active :: MethodBind
bindCameraFeed_is_active
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the feed is active.
is_active :: (CameraFeed :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed_is_active (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "is_active" '[] (IO Bool) where
        nodeMethod = Godot.Core.CameraFeed.is_active

{-# NOINLINE bindCameraFeed_set_active #-}

-- | If @true@, the feed is active.
bindCameraFeed_set_active :: MethodBind
bindCameraFeed_set_active
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the feed is active.
set_active ::
             (CameraFeed :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed_set_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "set_active" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.CameraFeed.set_active

{-# NOINLINE bindCameraFeed_set_transform #-}

-- | The transform applied to the camera's image.
bindCameraFeed_set_transform :: MethodBind
bindCameraFeed_set_transform
  = unsafePerformIO $
      withCString "CameraFeed" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transform applied to the camera's image.
set_transform ::
                (CameraFeed :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCameraFeed_set_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CameraFeed "set_transform" '[Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.CameraFeed.set_transform