{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CubeMap
       (Godot.Core.CubeMap._SIDE_RIGHT, Godot.Core.CubeMap._SIDE_TOP,
        Godot.Core.CubeMap._SIDE_BACK, Godot.Core.CubeMap._STORAGE_RAW,
        Godot.Core.CubeMap._STORAGE_COMPRESS_LOSSLESS,
        Godot.Core.CubeMap._FLAGS_DEFAULT, Godot.Core.CubeMap._FLAG_REPEAT,
        Godot.Core.CubeMap._SIDE_LEFT, Godot.Core.CubeMap._SIDE_FRONT,
        Godot.Core.CubeMap._STORAGE_COMPRESS_LOSSY,
        Godot.Core.CubeMap._FLAG_MIPMAPS, Godot.Core.CubeMap._SIDE_BOTTOM,
        Godot.Core.CubeMap._FLAG_FILTER, Godot.Core.CubeMap.get_flags,
        Godot.Core.CubeMap.get_height,
        Godot.Core.CubeMap.get_lossy_storage_quality,
        Godot.Core.CubeMap.get_side, Godot.Core.CubeMap.get_storage,
        Godot.Core.CubeMap.get_width, Godot.Core.CubeMap.set_flags,
        Godot.Core.CubeMap.set_lossy_storage_quality,
        Godot.Core.CubeMap.set_side, Godot.Core.CubeMap.set_storage)
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
import Godot.Core.Resource()

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

instance NodeProperty CubeMap "flags" Int 'False where
        nodeProperty = (get_flags, wrapDroppingSetter set_flags, Nothing)

instance NodeProperty CubeMap "lossy_storage_quality" Float 'False
         where
        nodeProperty
          = (get_lossy_storage_quality,
             wrapDroppingSetter set_lossy_storage_quality, Nothing)

instance NodeProperty CubeMap "storage_mode" Int 'False where
        nodeProperty
          = (get_storage, wrapDroppingSetter set_storage, Nothing)

{-# NOINLINE bindCubeMap_get_flags #-}

-- | The render flags for the @CubeMap@. See the @enum Flags@ constants for details.
bindCubeMap_get_flags :: MethodBind
bindCubeMap_get_flags
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The render flags for the @CubeMap@. See the @enum Flags@ constants for details.
get_flags :: (CubeMap :< cls, Object :< cls) => cls -> IO Int
get_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_flags (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMap "get_flags" '[] (IO Int) where
        nodeMethod = Godot.Core.CubeMap.get_flags

{-# NOINLINE bindCubeMap_get_height #-}

-- | Returns the @CubeMap@'s height.
bindCubeMap_get_height :: MethodBind
bindCubeMap_get_height
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @CubeMap@'s height.
get_height :: (CubeMap :< cls, Object :< cls) => cls -> IO Int
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_height (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMap "get_height" '[] (IO Int) where
        nodeMethod = Godot.Core.CubeMap.get_height

{-# NOINLINE bindCubeMap_get_lossy_storage_quality #-}

-- | The lossy storage quality of the @CubeMap@ if the storage mode is set to @STORAGE_COMPRESS_LOSSY@.
bindCubeMap_get_lossy_storage_quality :: MethodBind
bindCubeMap_get_lossy_storage_quality
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_lossy_storage_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The lossy storage quality of the @CubeMap@ if the storage mode is set to @STORAGE_COMPRESS_LOSSY@.
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

instance NodeMethod CubeMap "get_lossy_storage_quality" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.CubeMap.get_lossy_storage_quality

{-# NOINLINE bindCubeMap_get_side #-}

-- | Returns an @Image@ for a side of the @CubeMap@ using one of the @enum Side@ constants.
bindCubeMap_get_side :: MethodBind
bindCubeMap_get_side
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_side" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Image@ for a side of the @CubeMap@ using one of the @enum Side@ constants.
get_side ::
           (CubeMap :< cls, Object :< cls) => cls -> Int -> IO Image
get_side cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_side (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMap "get_side" '[Int] (IO Image) where
        nodeMethod = Godot.Core.CubeMap.get_side

{-# NOINLINE bindCubeMap_get_storage #-}

-- | The @CubeMap@'s storage mode. See @enum Storage@ constants.
bindCubeMap_get_storage :: MethodBind
bindCubeMap_get_storage
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_storage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @CubeMap@'s storage mode. See @enum Storage@ constants.
get_storage :: (CubeMap :< cls, Object :< cls) => cls -> IO Int
get_storage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_storage (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMap "get_storage" '[] (IO Int) where
        nodeMethod = Godot.Core.CubeMap.get_storage

{-# NOINLINE bindCubeMap_get_width #-}

-- | Returns the @CubeMap@'s width.
bindCubeMap_get_width :: MethodBind
bindCubeMap_get_width
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @CubeMap@'s width.
get_width :: (CubeMap :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_get_width (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMap "get_width" '[] (IO Int) where
        nodeMethod = Godot.Core.CubeMap.get_width

{-# NOINLINE bindCubeMap_set_flags #-}

-- | The render flags for the @CubeMap@. See the @enum Flags@ constants for details.
bindCubeMap_set_flags :: MethodBind
bindCubeMap_set_flags
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "set_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The render flags for the @CubeMap@. See the @enum Flags@ constants for details.
set_flags :: (CubeMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_set_flags (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMap "set_flags" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CubeMap.set_flags

{-# NOINLINE bindCubeMap_set_lossy_storage_quality #-}

-- | The lossy storage quality of the @CubeMap@ if the storage mode is set to @STORAGE_COMPRESS_LOSSY@.
bindCubeMap_set_lossy_storage_quality :: MethodBind
bindCubeMap_set_lossy_storage_quality
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "set_lossy_storage_quality" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The lossy storage quality of the @CubeMap@ if the storage mode is set to @STORAGE_COMPRESS_LOSSY@.
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

instance NodeMethod CubeMap "set_lossy_storage_quality" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.CubeMap.set_lossy_storage_quality

{-# NOINLINE bindCubeMap_set_side #-}

-- | Sets an @Image@ for a side of the @CubeMap@ using one of the @enum Side@ constants.
bindCubeMap_set_side :: MethodBind
bindCubeMap_set_side
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "set_side" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an @Image@ for a side of the @CubeMap@ using one of the @enum Side@ constants.
set_side ::
           (CubeMap :< cls, Object :< cls) => cls -> Int -> Image -> IO ()
set_side cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_set_side (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMap "set_side" '[Int, Image] (IO ()) where
        nodeMethod = Godot.Core.CubeMap.set_side

{-# NOINLINE bindCubeMap_set_storage #-}

-- | The @CubeMap@'s storage mode. See @enum Storage@ constants.
bindCubeMap_set_storage :: MethodBind
bindCubeMap_set_storage
  = unsafePerformIO $
      withCString "CubeMap" $
        \ clsNamePtr ->
          withCString "set_storage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @CubeMap@'s storage mode. See @enum Storage@ constants.
set_storage ::
              (CubeMap :< cls, Object :< cls) => cls -> Int -> IO ()
set_storage cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCubeMap_set_storage (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CubeMap "set_storage" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CubeMap.set_storage