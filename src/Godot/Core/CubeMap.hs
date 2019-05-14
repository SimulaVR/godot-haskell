{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CubeMap
       (Godot.Core.CubeMap._SIDE_RIGHT, Godot.Core.CubeMap._SIDE_TOP,
        Godot.Core.CubeMap._SIDE_BACK, Godot.Core.CubeMap._STORAGE_RAW,
        Godot.Core.CubeMap._STORAGE_COMPRESS_LOSSLESS,
        Godot.Core.CubeMap._FLAGS_DEFAULT, Godot.Core.CubeMap._FLAG_REPEAT,
        Godot.Core.CubeMap._SIDE_LEFT, Godot.Core.CubeMap._SIDE_FRONT,
        Godot.Core.CubeMap._STORAGE_COMPRESS_LOSSY,
        Godot.Core.CubeMap._FLAG_MIPMAPS, Godot.Core.CubeMap._SIDE_BOTTOM,
        Godot.Core.CubeMap._FLAG_FILTER, Godot.Core.CubeMap.get_width,
        Godot.Core.CubeMap.get_height, Godot.Core.CubeMap.set_flags,
        Godot.Core.CubeMap.get_flags, Godot.Core.CubeMap.set_side,
        Godot.Core.CubeMap.get_side, Godot.Core.CubeMap.set_storage,
        Godot.Core.CubeMap.get_storage,
        Godot.Core.CubeMap.set_lossy_storage_quality,
        Godot.Core.CubeMap.get_lossy_storage_quality)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_SIDE_RIGHT :: Int
_SIDE_RIGHT = 1

_SIDE_TOP :: Int
_SIDE_TOP = 3

_SIDE_BACK :: Int
_SIDE_BACK = 5

_STORAGE_RAW :: Int
_STORAGE_RAW = 0

_STORAGE_COMPRESS_LOSSLESS :: Int
_STORAGE_COMPRESS_LOSSLESS = 2

_FLAGS_DEFAULT :: Int
_FLAGS_DEFAULT = 7

_FLAG_REPEAT :: Int
_FLAG_REPEAT = 2

_SIDE_LEFT :: Int
_SIDE_LEFT = 0

_SIDE_FRONT :: Int
_SIDE_FRONT = 4

_STORAGE_COMPRESS_LOSSY :: Int
_STORAGE_COMPRESS_LOSSY = 1

_FLAG_MIPMAPS :: Int
_FLAG_MIPMAPS = 1

_SIDE_BOTTOM :: Int
_SIDE_BOTTOM = 2

_FLAG_FILTER :: Int
_FLAG_FILTER = 4

{-# NOINLINE bindCubeMap_get_width #-}

-- | Returns the [code]CubeMap[/code]'s width.
bindCubeMap_get_width :: MethodBind
bindCubeMap_get_width
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [code]CubeMap[/code]'s width.
get_width :: (CubeMap :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_width (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_get_height #-}

-- | Returns the [code]CubeMap[/code]'s height.
bindCubeMap_get_height :: MethodBind
bindCubeMap_get_height
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [code]CubeMap[/code]'s height.
get_height :: (CubeMap :< cls, Object :< cls) => cls -> IO Int
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_height (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_set_flags #-}

-- | The render flags for the [code]CubeMap[/code]. See the [code]FLAG_*[/code] constants for details.
bindCubeMap_set_flags :: MethodBind
bindCubeMap_set_flags
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "set_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The render flags for the [code]CubeMap[/code]. See the [code]FLAG_*[/code] constants for details.
set_flags :: (CubeMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_set_flags (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_get_flags #-}

-- | The render flags for the [code]CubeMap[/code]. See the [code]FLAG_*[/code] constants for details.
bindCubeMap_get_flags :: MethodBind
bindCubeMap_get_flags
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The render flags for the [code]CubeMap[/code]. See the [code]FLAG_*[/code] constants for details.
get_flags :: (CubeMap :< cls, Object :< cls) => cls -> IO Int
get_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_flags (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_set_side #-}

-- | Sets an [Image] for a side of the [code]CubeMap[/code] using one of the [code]SIDE_*[/code] constants or an integer 0-5.
bindCubeMap_set_side :: MethodBind
bindCubeMap_set_side
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "set_side" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an [Image] for a side of the [code]CubeMap[/code] using one of the [code]SIDE_*[/code] constants or an integer 0-5.
set_side ::
           (CubeMap :< cls, Object :< cls) => cls -> Int -> Image -> IO ()
set_side cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_set_side (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_get_side #-}

-- | Returns an [Image] for a side of the [code]CubeMap[/code] using one of the [code]SIDE_*[/code] constants or an integer 0-5.
bindCubeMap_get_side :: MethodBind
bindCubeMap_get_side
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_side" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an [Image] for a side of the [code]CubeMap[/code] using one of the [code]SIDE_*[/code] constants or an integer 0-5.
get_side ::
           (CubeMap :< cls, Object :< cls) => cls -> Int -> IO Image
get_side cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_side (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_set_storage #-}

-- | The [code]CubeMap[/code]'s storage mode. See [code]STORAGE_*[/code] constants.
bindCubeMap_set_storage :: MethodBind
bindCubeMap_set_storage
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "set_storage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [code]CubeMap[/code]'s storage mode. See [code]STORAGE_*[/code] constants.
set_storage ::
              (CubeMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_storage cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_set_storage (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_get_storage #-}

-- | The [code]CubeMap[/code]'s storage mode. See [code]STORAGE_*[/code] constants.
bindCubeMap_get_storage :: MethodBind
bindCubeMap_get_storage
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_storage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [code]CubeMap[/code]'s storage mode. See [code]STORAGE_*[/code] constants.
get_storage :: (CubeMap :< cls, Object :< cls) => cls -> IO Int
get_storage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_storage (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_set_lossy_storage_quality #-}

-- | The lossy storage quality of the [code]CubeMap[/code] if the storage mode is set to STORAGE_COMPRESS_LOSSY.
bindCubeMap_set_lossy_storage_quality :: MethodBind
bindCubeMap_set_lossy_storage_quality
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "set_lossy_storage_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The lossy storage quality of the [code]CubeMap[/code] if the storage mode is set to STORAGE_COMPRESS_LOSSY.
set_lossy_storage_quality ::
                            (CubeMap :< cls, Object :< cls) => cls -> Float -> IO ()
set_lossy_storage_quality cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_set_lossy_storage_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCubeMap_get_lossy_storage_quality #-}

-- | The lossy storage quality of the [code]CubeMap[/code] if the storage mode is set to STORAGE_COMPRESS_LOSSY.
bindCubeMap_get_lossy_storage_quality :: MethodBind
bindCubeMap_get_lossy_storage_quality
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_lossy_storage_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The lossy storage quality of the [code]CubeMap[/code] if the storage mode is set to STORAGE_COMPRESS_LOSSY.
get_lossy_storage_quality ::
                            (CubeMap :< cls, Object :< cls) => cls -> IO Float
get_lossy_storage_quality cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_lossy_storage_quality
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)