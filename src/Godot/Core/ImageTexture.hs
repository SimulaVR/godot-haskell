{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ImageTexture
       (Godot.Core.ImageTexture._STORAGE_RAW,
        Godot.Core.ImageTexture._STORAGE_COMPRESS_LOSSLESS,
        Godot.Core.ImageTexture._STORAGE_COMPRESS_LOSSY,
        Godot.Core.ImageTexture.create,
        Godot.Core.ImageTexture.create_from_image,
        Godot.Core.ImageTexture.get_format, Godot.Core.ImageTexture.load,
        Godot.Core.ImageTexture.set_data,
        Godot.Core.ImageTexture.set_storage,
        Godot.Core.ImageTexture.get_storage,
        Godot.Core.ImageTexture.set_lossy_storage_quality,
        Godot.Core.ImageTexture.get_lossy_storage_quality,
        Godot.Core.ImageTexture.set_size_override,
        Godot.Core.ImageTexture._reload_hook)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_STORAGE_RAW :: Int
_STORAGE_RAW = 0

_STORAGE_COMPRESS_LOSSLESS :: Int
_STORAGE_COMPRESS_LOSSLESS = 2

_STORAGE_COMPRESS_LOSSY :: Int
_STORAGE_COMPRESS_LOSSY = 1

{-# NOINLINE bindImageTexture_create #-}

-- | Create a new [code]ImageTexture[/code] with [code]width[/code] and [code]height[/code].
--   				[code]format[/code] is a value from [enum Image.Format], [code]flags[/code] is any combination of [enum Texture.Flags].
bindImageTexture_create :: MethodBind
bindImageTexture_create
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a new [code]ImageTexture[/code] with [code]width[/code] and [code]height[/code].
--   				[code]format[/code] is a value from [enum Image.Format], [code]flags[/code] is any combination of [enum Texture.Flags].
create ::
         (ImageTexture :< cls, Object :< cls) =>
         cls -> Int -> Int -> Int -> Int -> IO ()
create cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_create (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImageTexture_create_from_image #-}

-- | Create a new [code]ImageTexture[/code] from an [Image] with [code]flags[/code] from [enum Texture.Flags]. An sRGB to linear color space conversion can take place, according to [enum Image.Format].
bindImageTexture_create_from_image :: MethodBind
bindImageTexture_create_from_image
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "create_from_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a new [code]ImageTexture[/code] from an [Image] with [code]flags[/code] from [enum Texture.Flags]. An sRGB to linear color space conversion can take place, according to [enum Image.Format].
create_from_image ::
                    (ImageTexture :< cls, Object :< cls) =>
                    cls -> Image -> Int -> IO ()
create_from_image cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_create_from_image
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImageTexture_get_format #-}

-- | Return the format of the [code]ImageTexture[/code], one of [enum Image.Format].
bindImageTexture_get_format :: MethodBind
bindImageTexture_get_format
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the format of the [code]ImageTexture[/code], one of [enum Image.Format].
get_format :: (ImageTexture :< cls, Object :< cls) => cls -> IO Int
get_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_get_format (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImageTexture_load #-}

-- | Load an [code]ImageTexture[/code] from a file path.
bindImageTexture_load :: MethodBind
bindImageTexture_load
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Load an [code]ImageTexture[/code] from a file path.
load ::
       (ImageTexture :< cls, Object :< cls) =>
       cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_load (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImageTexture_set_data #-}

-- | Set the [Image] of this [code]ImageTexture[/code].
bindImageTexture_set_data :: MethodBind
bindImageTexture_set_data
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the [Image] of this [code]ImageTexture[/code].
set_data ::
           (ImageTexture :< cls, Object :< cls) => cls -> Image -> IO ()
set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImageTexture_set_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindImageTexture_set_lossy_storage_quality #-}

-- | The storage quality for [code]STORAGE_COMPRESS_LOSSY[/code].
bindImageTexture_set_lossy_storage_quality :: MethodBind
bindImageTexture_set_lossy_storage_quality
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "set_lossy_storage_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The storage quality for [code]STORAGE_COMPRESS_LOSSY[/code].
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

{-# NOINLINE bindImageTexture_get_lossy_storage_quality #-}

-- | The storage quality for [code]STORAGE_COMPRESS_LOSSY[/code].
bindImageTexture_get_lossy_storage_quality :: MethodBind
bindImageTexture_get_lossy_storage_quality
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "get_lossy_storage_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The storage quality for [code]STORAGE_COMPRESS_LOSSY[/code].
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

{-# NOINLINE bindImageTexture_set_size_override #-}

-- | Resizes the [code]ImageTexture[/code] to the specified dimensions.
bindImageTexture_set_size_override :: MethodBind
bindImageTexture_set_size_override
  = unsafePerformIO $
      withCString "ImageTexture" $
        \ clsNamePtr ->
          withCString "set_size_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resizes the [code]ImageTexture[/code] to the specified dimensions.
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