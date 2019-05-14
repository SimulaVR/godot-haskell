{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.StreamPeer
       (Godot.Core.StreamPeer.put_data,
        Godot.Core.StreamPeer.put_partial_data,
        Godot.Core.StreamPeer.get_data,
        Godot.Core.StreamPeer.get_partial_data,
        Godot.Core.StreamPeer.get_available_bytes,
        Godot.Core.StreamPeer.set_big_endian,
        Godot.Core.StreamPeer.is_big_endian_enabled,
        Godot.Core.StreamPeer.put_8, Godot.Core.StreamPeer.put_u8,
        Godot.Core.StreamPeer.put_16, Godot.Core.StreamPeer.put_u16,
        Godot.Core.StreamPeer.put_32, Godot.Core.StreamPeer.put_u32,
        Godot.Core.StreamPeer.put_64, Godot.Core.StreamPeer.put_u64,
        Godot.Core.StreamPeer.put_float, Godot.Core.StreamPeer.put_double,
        Godot.Core.StreamPeer.put_string,
        Godot.Core.StreamPeer.put_utf8_string,
        Godot.Core.StreamPeer.put_var, Godot.Core.StreamPeer.get_8,
        Godot.Core.StreamPeer.get_u8, Godot.Core.StreamPeer.get_16,
        Godot.Core.StreamPeer.get_u16, Godot.Core.StreamPeer.get_32,
        Godot.Core.StreamPeer.get_u32, Godot.Core.StreamPeer.get_64,
        Godot.Core.StreamPeer.get_u64, Godot.Core.StreamPeer.get_float,
        Godot.Core.StreamPeer.get_double, Godot.Core.StreamPeer.get_string,
        Godot.Core.StreamPeer.get_utf8_string,
        Godot.Core.StreamPeer.get_var)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindStreamPeer_put_data #-}

-- | Send a chunk of data through the connection, blocking if necessary until the data is done sending. This function returns an Error code.
bindStreamPeer_put_data :: MethodBind
bindStreamPeer_put_data
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Send a chunk of data through the connection, blocking if necessary until the data is done sending. This function returns an Error code.
put_data ::
           (StreamPeer :< cls, Object :< cls) =>
           cls -> PoolByteArray -> IO Int
put_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_partial_data #-}

-- | Send a chunk of data through the connection, if all the data could not be sent at once, only part of it will. This function returns two values, an Error code and an integer, describing how much data was actually sent.
bindStreamPeer_put_partial_data :: MethodBind
bindStreamPeer_put_partial_data
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_partial_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Send a chunk of data through the connection, if all the data could not be sent at once, only part of it will. This function returns two values, an Error code and an integer, describing how much data was actually sent.
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

{-# NOINLINE bindStreamPeer_get_data #-}

-- | Return a chunk data with the received bytes. The amount of bytes to be received can be requested in the "bytes" argument. If not enough bytes are available, the function will block until the desired amount is received. This function returns two values, an Error code and a data array.
bindStreamPeer_get_data :: MethodBind
bindStreamPeer_get_data
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return a chunk data with the received bytes. The amount of bytes to be received can be requested in the "bytes" argument. If not enough bytes are available, the function will block until the desired amount is received. This function returns two values, an Error code and a data array.
get_data ::
           (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO Array
get_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_data (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_partial_data #-}

-- | Return a chunk data with the received bytes. The amount of bytes to be received can be requested in the "bytes" argument. If not enough bytes are available, the function will return how many were actually received. This function returns two values, an Error code, and a data array.
bindStreamPeer_get_partial_data :: MethodBind
bindStreamPeer_get_partial_data
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_partial_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return a chunk data with the received bytes. The amount of bytes to be received can be requested in the "bytes" argument. If not enough bytes are available, the function will return how many were actually received. This function returns two values, an Error code, and a data array.
get_partial_data ::
                   (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO Array
get_partial_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_partial_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_available_bytes #-}

-- | Return the amount of bytes this [code]StreamPeer[/code] has available.
bindStreamPeer_get_available_bytes :: MethodBind
bindStreamPeer_get_available_bytes
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_available_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the amount of bytes this [code]StreamPeer[/code] has available.
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

{-# NOINLINE bindStreamPeer_set_big_endian #-}

-- | If [code]true[/code], this [code]StreamPeer[/code] will using big-endian format for encoding and decoding.
bindStreamPeer_set_big_endian :: MethodBind
bindStreamPeer_set_big_endian
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "set_big_endian" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this [code]StreamPeer[/code] will using big-endian format for encoding and decoding.
set_big_endian ::
                 (StreamPeer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_big_endian cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_set_big_endian (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_is_big_endian_enabled #-}

-- | If [code]true[/code], this [code]StreamPeer[/code] will using big-endian format for encoding and decoding.
bindStreamPeer_is_big_endian_enabled :: MethodBind
bindStreamPeer_is_big_endian_enabled
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "is_big_endian_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this [code]StreamPeer[/code] will using big-endian format for encoding and decoding.
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

{-# NOINLINE bindStreamPeer_put_8 #-}

-- | Put a signed byte into the stream.
bindStreamPeer_put_8 :: MethodBind
bindStreamPeer_put_8
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a signed byte into the stream.
put_8 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_8 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_8 (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_u8 #-}

-- | Put an unsigned byte into the stream.
bindStreamPeer_put_u8 :: MethodBind
bindStreamPeer_put_u8
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_u8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put an unsigned byte into the stream.
put_u8 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_u8 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_u8 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_16 #-}

-- | Put a signed 16 bit value into the stream.
bindStreamPeer_put_16 :: MethodBind
bindStreamPeer_put_16
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a signed 16 bit value into the stream.
put_16 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_16 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_16 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_u16 #-}

-- | Put an unsigned 16 bit value into the stream.
bindStreamPeer_put_u16 :: MethodBind
bindStreamPeer_put_u16
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_u16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put an unsigned 16 bit value into the stream.
put_u16 ::
          (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_u16 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_u16 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_32 #-}

-- | Put a signed 32 bit value into the stream.
bindStreamPeer_put_32 :: MethodBind
bindStreamPeer_put_32
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a signed 32 bit value into the stream.
put_32 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_32 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_32 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_u32 #-}

-- | Put an unsigned 32 bit value into the stream.
bindStreamPeer_put_u32 :: MethodBind
bindStreamPeer_put_u32
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_u32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put an unsigned 32 bit value into the stream.
put_u32 ::
          (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_u32 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_u32 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_64 #-}

-- | Put a signed 64 bit value into the stream.
bindStreamPeer_put_64 :: MethodBind
bindStreamPeer_put_64
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a signed 64 bit value into the stream.
put_64 :: (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_64 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_64 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_u64 #-}

-- | Put an unsigned 64 bit value into the stream.
bindStreamPeer_put_u64 :: MethodBind
bindStreamPeer_put_u64
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_u64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put an unsigned 64 bit value into the stream.
put_u64 ::
          (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO ()
put_u64 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_u64 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_float #-}

-- | Put a single-precision float into the stream.
bindStreamPeer_put_float :: MethodBind
bindStreamPeer_put_float
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_float" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a single-precision float into the stream.
put_float ::
            (StreamPeer :< cls, Object :< cls) => cls -> Float -> IO ()
put_float cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_float (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_double #-}

-- | Put a double-precision float into the stream.
bindStreamPeer_put_double :: MethodBind
bindStreamPeer_put_double
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_double" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a double-precision float into the stream.
put_double ::
             (StreamPeer :< cls, Object :< cls) => cls -> Float -> IO ()
put_double cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_double (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_string #-}

-- | Put a zero-terminated ascii string into the stream prepended by a 32 bits unsigned integer representing its size.
bindStreamPeer_put_string :: MethodBind
bindStreamPeer_put_string
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a zero-terminated ascii string into the stream prepended by a 32 bits unsigned integer representing its size.
put_string ::
             (StreamPeer :< cls, Object :< cls) => cls -> GodotString -> IO ()
put_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_utf8_string #-}

-- | Put a zero-terminated utf8 string into the stream prepended by a 32 bits unsigned integer representing its size.
bindStreamPeer_put_utf8_string :: MethodBind
bindStreamPeer_put_utf8_string
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_utf8_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a zero-terminated utf8 string into the stream prepended by a 32 bits unsigned integer representing its size.
put_utf8_string ::
                  (StreamPeer :< cls, Object :< cls) => cls -> GodotString -> IO ()
put_utf8_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_utf8_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_put_var #-}

-- | Put a Variant into the stream. When [code]full_objects[/code] is [code]true[/code] encoding objects is allowed (and can potentially include code).
bindStreamPeer_put_var :: MethodBind
bindStreamPeer_put_var
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "put_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Put a Variant into the stream. When [code]full_objects[/code] is [code]true[/code] encoding objects is allowed (and can potentially include code).
put_var ::
          (StreamPeer :< cls, Object :< cls) => cls -> GodotVariant -> IO ()
put_var cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_put_var (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_8 #-}

-- | Get a signed byte from the stream.
bindStreamPeer_get_8 :: MethodBind
bindStreamPeer_get_8
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a signed byte from the stream.
get_8 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_8 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_8 (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_u8 #-}

-- | Get an unsigned byte from the stream.
bindStreamPeer_get_u8 :: MethodBind
bindStreamPeer_get_u8
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_u8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get an unsigned byte from the stream.
get_u8 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_u8 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_u8 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_16 #-}

-- | Get a signed 16 bit value from the stream.
bindStreamPeer_get_16 :: MethodBind
bindStreamPeer_get_16
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a signed 16 bit value from the stream.
get_16 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_16 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_16 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_u16 #-}

-- | Get an unsigned 16 bit value from the stream.
bindStreamPeer_get_u16 :: MethodBind
bindStreamPeer_get_u16
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_u16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get an unsigned 16 bit value from the stream.
get_u16 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_u16 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_u16 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_32 #-}

-- | Get a signed 32 bit value from the stream.
bindStreamPeer_get_32 :: MethodBind
bindStreamPeer_get_32
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a signed 32 bit value from the stream.
get_32 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_32 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_32 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_u32 #-}

-- | Get an unsigned 32 bit value from the stream.
bindStreamPeer_get_u32 :: MethodBind
bindStreamPeer_get_u32
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_u32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get an unsigned 32 bit value from the stream.
get_u32 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_u32 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_u32 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_64 #-}

-- | Get a signed 64 bit value from the stream.
bindStreamPeer_get_64 :: MethodBind
bindStreamPeer_get_64
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a signed 64 bit value from the stream.
get_64 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_64 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_64 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_u64 #-}

-- | Get an unsigned 64 bit value from the stream.
bindStreamPeer_get_u64 :: MethodBind
bindStreamPeer_get_u64
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_u64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get an unsigned 64 bit value from the stream.
get_u64 :: (StreamPeer :< cls, Object :< cls) => cls -> IO Int
get_u64 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_u64 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_float #-}

-- | Get a single-precision float from the stream.
bindStreamPeer_get_float :: MethodBind
bindStreamPeer_get_float
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_float" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a single-precision float from the stream.
get_float :: (StreamPeer :< cls, Object :< cls) => cls -> IO Float
get_float cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_float (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_double #-}

-- | Get a double-precision float from the stream.
bindStreamPeer_get_double :: MethodBind
bindStreamPeer_get_double
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_double" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a double-precision float from the stream.
get_double :: (StreamPeer :< cls, Object :< cls) => cls -> IO Float
get_double cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_double (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_string #-}

-- | Get a string with byte-length [code]bytes[/code] from the stream. If [code]bytes[/code] is negative (default) the length will be read from the stream using the reverse process of [method put_string].
bindStreamPeer_get_string :: MethodBind
bindStreamPeer_get_string
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a string with byte-length [code]bytes[/code] from the stream. If [code]bytes[/code] is negative (default) the length will be read from the stream using the reverse process of [method put_string].
get_string ::
             (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_utf8_string #-}

-- | Get a utf8 string with byte-length [code]bytes[/code] from the stream (this decodes the string sent as utf8). If [code]bytes[/code] is negative (default) the length will be read from the stream using the reverse process of [method put_utf8_string].
bindStreamPeer_get_utf8_string :: MethodBind
bindStreamPeer_get_utf8_string
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_utf8_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a utf8 string with byte-length [code]bytes[/code] from the stream (this decodes the string sent as utf8). If [code]bytes[/code] is negative (default) the length will be read from the stream using the reverse process of [method put_utf8_string].
get_utf8_string ::
                  (StreamPeer :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_utf8_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_utf8_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeer_get_var #-}

-- | Get a Variant from the stream. When [code]allow_objects[/code] is [code]true[/code] decoding objects is allowed.
--   				[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
bindStreamPeer_get_var :: MethodBind
bindStreamPeer_get_var
  = unsafePerformIO $
      withCString "StreamPeer" $
        \ clsNamePtr ->
          withCString "get_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a Variant from the stream. When [code]allow_objects[/code] is [code]true[/code] decoding objects is allowed.
--   				[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
get_var ::
          (StreamPeer :< cls, Object :< cls) => cls -> IO GodotVariant
get_var cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeer_get_var (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)