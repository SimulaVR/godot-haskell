{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.StreamPeer
       (Godot.Core.StreamPeer.get_16, Godot.Core.StreamPeer.get_32,
        Godot.Core.StreamPeer.get_64, Godot.Core.StreamPeer.get_8,
        Godot.Core.StreamPeer.get_available_bytes,
        Godot.Core.StreamPeer.get_data, Godot.Core.StreamPeer.get_double,
        Godot.Core.StreamPeer.get_float,
        Godot.Core.StreamPeer.get_partial_data,
        Godot.Core.StreamPeer.get_string, Godot.Core.StreamPeer.get_u16,
        Godot.Core.StreamPeer.get_u32, Godot.Core.StreamPeer.get_u64,
        Godot.Core.StreamPeer.get_u8,
        Godot.Core.StreamPeer.get_utf8_string,
        Godot.Core.StreamPeer.get_var,
        Godot.Core.StreamPeer.is_big_endian_enabled,
        Godot.Core.StreamPeer.put_16, Godot.Core.StreamPeer.put_32,
        Godot.Core.StreamPeer.put_64, Godot.Core.StreamPeer.put_8,
        Godot.Core.StreamPeer.put_data, Godot.Core.StreamPeer.put_double,
        Godot.Core.StreamPeer.put_float,
        Godot.Core.StreamPeer.put_partial_data,
        Godot.Core.StreamPeer.put_string, Godot.Core.StreamPeer.put_u16,
        Godot.Core.StreamPeer.put_u32, Godot.Core.StreamPeer.put_u64,
        Godot.Core.StreamPeer.put_u8,
        Godot.Core.StreamPeer.put_utf8_string,
        Godot.Core.StreamPeer.put_var,
        Godot.Core.StreamPeer.set_big_endian)
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

instance NodeProperty StreamPeer "big_endian" Bool 'False where
        nodeProperty
          = (is_big_endian_enabled, wrapDroppingSetter set_big_endian,
             Nothing)

{-# NOINLINE bindStreamPeer_get_16 #-}

-- | Gets a signed 16-bit value from the stream.
bindStreamPeer_get_16 :: MethodBind
bindStreamPeer_get_16
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a signed 16-bit value from the stream.
get_16 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_16 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_16 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_16" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeer.get_16

{-# NOINLINE bindStreamPeer_get_32 #-}

-- | Gets a signed 32-bit value from the stream.
bindStreamPeer_get_32 :: MethodBind
bindStreamPeer_get_32
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a signed 32-bit value from the stream.
get_32 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_32 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_32 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_32" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeer.get_32

{-# NOINLINE bindStreamPeer_get_64 #-}

-- | Gets a signed 64-bit value from the stream.
bindStreamPeer_get_64 :: MethodBind
bindStreamPeer_get_64
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a signed 64-bit value from the stream.
get_64 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_64 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_64 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_64" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeer.get_64

{-# NOINLINE bindStreamPeer_get_8 #-}

-- | Gets a signed byte from the stream.
bindStreamPeer_get_8 :: MethodBind
bindStreamPeer_get_8
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a signed byte from the stream.
get_8 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_8 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_8 (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_8" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeer.get_8

{-# NOINLINE bindStreamPeer_get_available_bytes #-}

-- | Returns the amount of bytes this @StreamPeer@ has available.
bindStreamPeer_get_available_bytes :: MethodBind
bindStreamPeer_get_available_bytes
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_available_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of bytes this @StreamPeer@ has available.
get_available_bytes ::
                      (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_available_bytes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_available_bytes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_available_bytes" '[] (IO Int)
         where
        nodeMethod = Godot.Core.StreamPeer.get_available_bytes

{-# NOINLINE bindStreamPeer_get_data #-}

-- | Returns a chunk data with the received bytes. The amount of bytes to be received can be requested in the @bytes@ argument. If not enough bytes are available, the function will block until the desired amount is received. This function returns two values, an @enum @GlobalScope.Error@ code and a data array.
bindStreamPeer_get_data :: MethodBind
bindStreamPeer_get_data
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a chunk data with the received bytes. The amount of bytes to be received can be requested in the @bytes@ argument. If not enough bytes are available, the function will block until the desired amount is received. This function returns two values, an @enum @GlobalScope.Error@ code and a data array.
get_data ::
           (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO Array
get_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_data" '[Int] (IO Array) where
        nodeMethod = Godot.Core.StreamPeer.get_data

{-# NOINLINE bindStreamPeer_get_double #-}

-- | Gets a double-precision float from the stream.
bindStreamPeer_get_double :: MethodBind
bindStreamPeer_get_double
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_double" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a double-precision float from the stream.
get_double :: (StreamPeer :< cls, Object :< cls) => cls -> IO Float
get_double cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_double (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_double" '[] (IO Float) where
        nodeMethod = Godot.Core.StreamPeer.get_double

{-# NOINLINE bindStreamPeer_get_float #-}

-- | Gets a single-precision float from the stream.
bindStreamPeer_get_float :: MethodBind
bindStreamPeer_get_float
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_float" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a single-precision float from the stream.
get_float :: (StreamPeer :< cls, Object :< cls) => cls -> IO Float
get_float cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_float (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_float" '[] (IO Float) where
        nodeMethod = Godot.Core.StreamPeer.get_float

{-# NOINLINE bindStreamPeer_get_partial_data #-}

-- | Returns a chunk data with the received bytes. The amount of bytes to be received can be requested in the "bytes" argument. If not enough bytes are available, the function will return how many were actually received. This function returns two values, an @enum @GlobalScope.Error@ code, and a data array.
bindStreamPeer_get_partial_data :: MethodBind
bindStreamPeer_get_partial_data
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_partial_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a chunk data with the received bytes. The amount of bytes to be received can be requested in the "bytes" argument. If not enough bytes are available, the function will return how many were actually received. This function returns two values, an @enum @GlobalScope.Error@ code, and a data array.
get_partial_data ::
                   (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO Array
get_partial_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_partial_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_partial_data" '[Int] (IO Array)
         where
        nodeMethod = Godot.Core.StreamPeer.get_partial_data

{-# NOINLINE bindStreamPeer_get_string #-}

-- | Gets a string with byte-length @bytes@ from the stream. If @bytes@ is negative (default) the length will be read from the stream using the reverse process of @method put_string@.
bindStreamPeer_get_string :: MethodBind
bindStreamPeer_get_string
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a string with byte-length @bytes@ from the stream. If @bytes@ is negative (default) the length will be read from the stream using the reverse process of @method put_string@.
get_string ::
             (StreamPeer :< cls, Object :< cls) =>
             cls -> Maybe Int -> IO GodotString
get_string cls arg1
  = withVariantArray [maybe (VariantInt (-1)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_string" '[Maybe Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.StreamPeer.get_string

{-# NOINLINE bindStreamPeer_get_u16 #-}

-- | Gets an unsigned 16-bit value from the stream.
bindStreamPeer_get_u16 :: MethodBind
bindStreamPeer_get_u16
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_u16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an unsigned 16-bit value from the stream.
get_u16 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_u16 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_u16 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_u16" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeer.get_u16

{-# NOINLINE bindStreamPeer_get_u32 #-}

-- | Gets an unsigned 32-bit value from the stream.
bindStreamPeer_get_u32 :: MethodBind
bindStreamPeer_get_u32
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_u32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an unsigned 32-bit value from the stream.
get_u32 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_u32 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_u32 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_u32" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeer.get_u32

{-# NOINLINE bindStreamPeer_get_u64 #-}

-- | Gets an unsigned 64-bit value from the stream.
bindStreamPeer_get_u64 :: MethodBind
bindStreamPeer_get_u64
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_u64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an unsigned 64-bit value from the stream.
get_u64 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_u64 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_u64 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_u64" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeer.get_u64

{-# NOINLINE bindStreamPeer_get_u8 #-}

-- | Gets an unsigned byte from the stream.
bindStreamPeer_get_u8 :: MethodBind
bindStreamPeer_get_u8
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_u8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an unsigned byte from the stream.
get_u8 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_u8 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_u8 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_u8" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeer.get_u8

{-# NOINLINE bindStreamPeer_get_utf8_string #-}

-- | Gets an UTF-8 string with byte-length @bytes@ from the stream (this decodes the string sent as UTF-8). If @bytes@ is negative (default) the length will be read from the stream using the reverse process of @method put_utf8_string@.
bindStreamPeer_get_utf8_string :: MethodBind
bindStreamPeer_get_utf8_string
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_utf8_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an UTF-8 string with byte-length @bytes@ from the stream (this decodes the string sent as UTF-8). If @bytes@ is negative (default) the length will be read from the stream using the reverse process of @method put_utf8_string@.
get_utf8_string ::
                  (StreamPeer :< cls, Object :< cls) =>
                  cls -> Maybe Int -> IO GodotString
get_utf8_string cls arg1
  = withVariantArray [maybe (VariantInt (-1)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_utf8_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_utf8_string" '[Maybe Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.StreamPeer.get_utf8_string

{-# NOINLINE bindStreamPeer_get_var #-}

-- | Gets a Variant from the stream. If @allow_objects@ is @true@, decoding objects is allowed.
--   				__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
bindStreamPeer_get_var :: MethodBind
bindStreamPeer_get_var
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a Variant from the stream. If @allow_objects@ is @true@, decoding objects is allowed.
--   				__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
get_var ::
          (StreamPeer :< cls, Object :< cls) =>
          cls -> Maybe Bool -> IO GodotVariant
get_var cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_var (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "get_var" '[Maybe Bool]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.StreamPeer.get_var

{-# NOINLINE bindStreamPeer_is_big_endian_enabled #-}

-- | If @true@, this @StreamPeer@ will using big-endian format for encoding and decoding.
bindStreamPeer_is_big_endian_enabled :: MethodBind
bindStreamPeer_is_big_endian_enabled
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "is_big_endian_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this @StreamPeer@ will using big-endian format for encoding and decoding.
is_big_endian_enabled ::
                        (StreamPeer :< cls, Object :< cls) => cls -> IO Bool
is_big_endian_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_is_big_endian_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "is_big_endian_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.StreamPeer.is_big_endian_enabled

{-# NOINLINE bindStreamPeer_put_16 #-}

-- | Puts a signed 16-bit value into the stream.
bindStreamPeer_put_16 :: MethodBind
bindStreamPeer_put_16
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a signed 16-bit value into the stream.
put_16 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_16 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_16 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_16" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_16

{-# NOINLINE bindStreamPeer_put_32 #-}

-- | Puts a signed 32-bit value into the stream.
bindStreamPeer_put_32 :: MethodBind
bindStreamPeer_put_32
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a signed 32-bit value into the stream.
put_32 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_32 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_32 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_32" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_32

{-# NOINLINE bindStreamPeer_put_64 #-}

-- | Puts a signed 64-bit value into the stream.
bindStreamPeer_put_64 :: MethodBind
bindStreamPeer_put_64
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a signed 64-bit value into the stream.
put_64 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_64 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_64 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_64" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_64

{-# NOINLINE bindStreamPeer_put_8 #-}

-- | Puts a signed byte into the stream.
bindStreamPeer_put_8 :: MethodBind
bindStreamPeer_put_8
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a signed byte into the stream.
put_8 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_8 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_8 (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_8" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_8

{-# NOINLINE bindStreamPeer_put_data #-}

-- | Sends a chunk of data through the connection, blocking if necessary until the data is done sending. This function returns an @enum @GlobalScope.Error@ code.
bindStreamPeer_put_data :: MethodBind
bindStreamPeer_put_data
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a chunk of data through the connection, blocking if necessary until the data is done sending. This function returns an @enum @GlobalScope.Error@ code.
put_data ::
           (StreamPeer :< cls, Object :< cls) =>
           cls -> PoolByteArray -> IO Int
put_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_data" '[PoolByteArray] (IO Int)
         where
        nodeMethod = Godot.Core.StreamPeer.put_data

{-# NOINLINE bindStreamPeer_put_double #-}

-- | Puts a double-precision float into the stream.
bindStreamPeer_put_double :: MethodBind
bindStreamPeer_put_double
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_double" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a double-precision float into the stream.
put_double ::
             (StreamPeer :< cls, Object :< cls) => cls -> Float -> IO ()
put_double cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_double (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_double" '[Float] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_double

{-# NOINLINE bindStreamPeer_put_float #-}

-- | Puts a single-precision float into the stream.
bindStreamPeer_put_float :: MethodBind
bindStreamPeer_put_float
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_float" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a single-precision float into the stream.
put_float ::
            (StreamPeer :< cls, Object :< cls) => cls -> Float -> IO ()
put_float cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_float (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_float" '[Float] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_float

{-# NOINLINE bindStreamPeer_put_partial_data #-}

-- | Sends a chunk of data through the connection. If all the data could not be sent at once, only part of it will. This function returns two values, an @enum @GlobalScope.Error@ code and an integer, describing how much data was actually sent.
bindStreamPeer_put_partial_data :: MethodBind
bindStreamPeer_put_partial_data
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_partial_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a chunk of data through the connection. If all the data could not be sent at once, only part of it will. This function returns two values, an @enum @GlobalScope.Error@ code and an integer, describing how much data was actually sent.
put_partial_data ::
                   (StreamPeer :< cls, Object :< cls) =>
                   cls -> PoolByteArray -> IO Array
put_partial_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_partial_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_partial_data" '[PoolByteArray]
           (IO Array)
         where
        nodeMethod = Godot.Core.StreamPeer.put_partial_data

{-# NOINLINE bindStreamPeer_put_string #-}

-- | Puts a zero-terminated ASCII string into the stream prepended by a 32-bit unsigned integer representing its size.
--   				Note: To put an ASCII string without prepending its size, you can use @method put_data@:
--   				
--   @
--   
--   				put_data("Hello world".to_ascii())
--   				
--   @
bindStreamPeer_put_string :: MethodBind
bindStreamPeer_put_string
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a zero-terminated ASCII string into the stream prepended by a 32-bit unsigned integer representing its size.
--   				Note: To put an ASCII string without prepending its size, you can use @method put_data@:
--   				
--   @
--   
--   				put_data("Hello world".to_ascii())
--   				
--   @
put_string ::
             (StreamPeer :< cls, Object :< cls) => cls -> GodotString -> IO ()
put_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_string" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.StreamPeer.put_string

{-# NOINLINE bindStreamPeer_put_u16 #-}

-- | Puts an unsigned 16-bit value into the stream.
bindStreamPeer_put_u16 :: MethodBind
bindStreamPeer_put_u16
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_u16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts an unsigned 16-bit value into the stream.
put_u16 ::
          (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_u16 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_u16 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_u16" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_u16

{-# NOINLINE bindStreamPeer_put_u32 #-}

-- | Puts an unsigned 32-bit value into the stream.
bindStreamPeer_put_u32 :: MethodBind
bindStreamPeer_put_u32
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_u32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts an unsigned 32-bit value into the stream.
put_u32 ::
          (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_u32 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_u32 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_u32" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_u32

{-# NOINLINE bindStreamPeer_put_u64 #-}

-- | Puts an unsigned 64-bit value into the stream.
bindStreamPeer_put_u64 :: MethodBind
bindStreamPeer_put_u64
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_u64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts an unsigned 64-bit value into the stream.
put_u64 ::
          (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_u64 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_u64 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_u64" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_u64

{-# NOINLINE bindStreamPeer_put_u8 #-}

-- | Puts an unsigned byte into the stream.
bindStreamPeer_put_u8 :: MethodBind
bindStreamPeer_put_u8
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_u8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts an unsigned byte into the stream.
put_u8 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_u8 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_u8 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_u8" '[Int] (IO ()) where
        nodeMethod = Godot.Core.StreamPeer.put_u8

{-# NOINLINE bindStreamPeer_put_utf8_string #-}

-- | Puts a zero-terminated UTF-8 string into the stream prepended by a 32 bits unsigned integer representing its size.
--   				Note: To put an UTF-8 string without prepending its size, you can use @method put_data@:
--   				
--   @
--   
--   				put_data("Hello world".to_utf8())
--   				
--   @
bindStreamPeer_put_utf8_string :: MethodBind
bindStreamPeer_put_utf8_string
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_utf8_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a zero-terminated UTF-8 string into the stream prepended by a 32 bits unsigned integer representing its size.
--   				Note: To put an UTF-8 string without prepending its size, you can use @method put_data@:
--   				
--   @
--   
--   				put_data("Hello world".to_utf8())
--   				
--   @
put_utf8_string ::
                  (StreamPeer :< cls, Object :< cls) => cls -> GodotString -> IO ()
put_utf8_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_utf8_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_utf8_string" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.StreamPeer.put_utf8_string

{-# NOINLINE bindStreamPeer_put_var #-}

-- | Puts a Variant into the stream. If @full_objects@ is @true@ encoding objects is allowed (and can potentially include code).
bindStreamPeer_put_var :: MethodBind
bindStreamPeer_put_var
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Puts a Variant into the stream. If @full_objects@ is @true@ encoding objects is allowed (and can potentially include code).
put_var ::
          (StreamPeer :< cls, Object :< cls) =>
          cls -> GodotVariant -> Maybe Bool -> IO ()
put_var cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_var (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "put_var"
           '[GodotVariant, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.StreamPeer.put_var

{-# NOINLINE bindStreamPeer_set_big_endian #-}

-- | If @true@, this @StreamPeer@ will using big-endian format for encoding and decoding.
bindStreamPeer_set_big_endian :: MethodBind
bindStreamPeer_set_big_endian
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "set_big_endian" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this @StreamPeer@ will using big-endian format for encoding and decoding.
set_big_endian ::
                 (StreamPeer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_big_endian cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_set_big_endian (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeer "set_big_endian" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.StreamPeer.set_big_endian