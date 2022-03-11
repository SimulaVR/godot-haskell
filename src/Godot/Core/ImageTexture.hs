{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ImageTexture
       (Godot.Core.ImageTexture._STORAGE_RAW,
        Godot.Core.ImageTexture._STORAGE_COMPRESS_LOSSLESS,
        Godot.Core.ImageTexture._STORAGE_COMPRESS_LOSSY,
        Godot.Core.ImageTexture._reload_hook,
        Godot.Core.ImageTexture.create,
        Godot.Core.ImageTexture.create_from_image,
        Godot.Core.ImageTexture.get_format,
        Godot.Core.ImageTexture.get_lossy_storage_quality,
        Godot.Core.ImageTexture.get_storage, Godot.Core.ImageTexture.load,
        Godot.Core.ImageTexture.set_data,
        Godot.Core.ImageTexture.set_lossy_storage_quality,
        Godot.Core.ImageTexture.set_size_override,
        Godot.Core.ImageTexture.set_storage)
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

_STORAGE_RAW :: Int
_STORAGE_RAW = 0

_STORAGE_COMPRESS_LOSSLESS :: Int
_STORAGE_COMPRESS_LOSSLESS = 2

_STORAGE_COMPRESS_LOSSY :: Int
_STORAGE_COMPRESS_LOSSY = 1

instance NodeProperty ImageTexture "lossy_quality" Float 'False
         where
        nodeProperty
          = (get_lossy_storage_quality,
             wrapDroppingSetter set_lossy_storage_quality, Nothing)

instance NodeProperty ImageTexture "storage" Int 'False where
        nodeProperty
          = (get_storage, wrapDroppingSetter set_storage, Nothing)

{-# NOINLINE bindImageTexture__reload_hook #-}

bindImageTexture__reload_hook :: MethodBind
bindImageTexture__reload_hook
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "_reload_hook" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_reload_hook ::
               (ImageTexture :< cls, Object :< cls) => cls -> Rid -> IO ()
_reload_hook cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture__reload_hook (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "_reload_hook" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.ImageTexture._reload_hook

{-# NOINLINE bindImageTexture_create #-}

-- | Create a new @ImageTexture@ with @width@ and @height@.
--   				@format@ is a value from @enum Image.Format@, @flags@ is any combination of @enum Texture.Flags@.
bindImageTexture_create :: MethodBind
bindImageTexture_create
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a new @ImageTexture@ with @width@ and @height@.
--   				@format@ is a value from @enum Image.Format@, @flags@ is any combination of @enum Texture.Flags@.
create ::
         (ImageTexture :< cls, Object :< cls) =>
         cls -> Int -> Int -> Int -> Maybe Int -> IO ()
create cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantInt (7)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_create (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "create"
           '[Int, Int, Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ImageTexture.create

{-# NOINLINE bindImageTexture_create_from_image #-}

-- | Initializes the texture by allocating and setting the data from an @Image@ with @flags@ from @enum Texture.Flags@. An sRGB to linear color space conversion can take place, according to @enum Image.Format@.
bindImageTexture_create_from_image :: MethodBind
bindImageTexture_create_from_image
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "create_from_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the texture by allocating and setting the data from an @Image@ with @flags@ from @enum Texture.Flags@. An sRGB to linear color space conversion can take place, according to @enum Image.Format@.
create_from_image ::
                    (ImageTexture :< cls, Object :< cls) =>
                    cls -> Image -> Maybe Int -> IO ()
create_from_image cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (7)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_create_from_image
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "create_from_image"
           '[Image, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.ImageTexture.create_from_image

{-# NOINLINE bindImageTexture_get_format #-}

-- | Returns the format of the texture, one of @enum Image.Format@.
bindImageTexture_get_format :: MethodBind
bindImageTexture_get_format
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the format of the texture, one of @enum Image.Format@.
get_format :: (ImageTexture :< cls, Object :< cls) => cls -> IO Int
get_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_get_format (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "get_format" '[] (IO Int) where
        nodeMethod = Godot.Core.ImageTexture.get_format

{-# NOINLINE bindImageTexture_get_lossy_storage_quality #-}

-- | The storage quality for @STORAGE_COMPRESS_LOSSY@.
bindImageTexture_get_lossy_storage_quality :: MethodBind
bindImageTexture_get_lossy_storage_quality
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "get_lossy_storage_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The storage quality for @STORAGE_COMPRESS_LOSSY@.
get_lossy_storage_quality ::
                            (ImageTexture :< cls, Object :< cls) => cls -> IO Float
get_lossy_storage_quality cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_get_lossy_storage_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "get_lossy_storage_quality" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.ImageTexture.get_lossy_storage_quality

{-# NOINLINE bindImageTexture_get_storage #-}

-- | The storage type (raw, lossy, or compressed).
bindImageTexture_get_storage :: MethodBind
bindImageTexture_get_storage
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "get_storage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The storage type (raw, lossy, or compressed).
get_storage ::
              (ImageTexture :< cls, Object :< cls) => cls -> IO Int
get_storage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_get_storage (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "get_storage" '[] (IO Int) where
        nodeMethod = Godot.Core.ImageTexture.get_storage

{-# NOINLINE bindImageTexture_load #-}

-- | Loads an image from a file path and creates a texture from it.
--   				__Note:__ This method is deprecated and will be removed in Godot 4.0, use @method Image.load@ and @method create_from_image@ instead.
bindImageTexture_load :: MethodBind
bindImageTexture_load
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads an image from a file path and creates a texture from it.
--   				__Note:__ This method is deprecated and will be removed in Godot 4.0, use @method Image.load@ and @method create_from_image@ instead.
load ::
       (ImageTexture :< cls, Object :< cls) =>
       cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_load (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "load" '[GodotString] (IO Int)
         where
        nodeMethod = Godot.Core.ImageTexture.load

{-# NOINLINE bindImageTexture_set_data #-}

-- | Replaces the texture's data with a new @Image@.
--   				__Note:__ The texture has to be initialized first with the @method create_from_image@ method before it can be updated. The new image dimensions, format, and mipmaps configuration should match the existing texture's image configuration, otherwise it has to be re-created with the @method create_from_image@ method.
--   				Use this method over @method create_from_image@ if you need to update the texture frequently, which is faster than allocating additional memory for a new texture each time.
bindImageTexture_set_data :: MethodBind
bindImageTexture_set_data
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Replaces the texture's data with a new @Image@.
--   				__Note:__ The texture has to be initialized first with the @method create_from_image@ method before it can be updated. The new image dimensions, format, and mipmaps configuration should match the existing texture's image configuration, otherwise it has to be re-created with the @method create_from_image@ method.
--   				Use this method over @method create_from_image@ if you need to update the texture frequently, which is faster than allocating additional memory for a new texture each time.
set_data ::
           (ImageTexture :< cls, Object :< cls) => cls -> Image -> IO ()
set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_set_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "set_data" '[Image] (IO ()) where
        nodeMethod = Godot.Core.ImageTexture.set_data

{-# NOINLINE bindImageTexture_set_lossy_storage_quality #-}

-- | The storage quality for @STORAGE_COMPRESS_LOSSY@.
bindImageTexture_set_lossy_storage_quality :: MethodBind
bindImageTexture_set_lossy_storage_quality
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "set_lossy_storage_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The storage quality for @STORAGE_COMPRESS_LOSSY@.
set_lossy_storage_quality ::
                            (ImageTexture :< cls, Object :< cls) => cls -> Float -> IO ()
set_lossy_storage_quality cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_set_lossy_storage_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "set_lossy_storage_quality"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.ImageTexture.set_lossy_storage_quality

{-# NOINLINE bindImageTexture_set_size_override #-}

-- | Resizes the texture to the specified dimensions.
bindImageTexture_set_size_override :: MethodBind
bindImageTexture_set_size_override
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "set_size_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resizes the texture to the specified dimensions.
set_size_override ::
                    (ImageTexture :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_size_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_set_size_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "set_size_override" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ImageTexture.set_size_override

{-# NOINLINE bindImageTexture_set_storage #-}

-- | The storage type (raw, lossy, or compressed).
bindImageTexture_set_storage :: MethodBind
bindImageTexture_set_storage
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "set_storage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The storage type (raw, lossy, or compressed).
set_storage ::
              (ImageTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_storage cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_set_storage (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ImageTexture "set_storage" '[Int] (IO ()) where
        nodeMethod = Godot.Core.ImageTexture.set_storage