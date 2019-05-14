{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.File
       (Godot.Core.File._COMPRESSION_DEFLATE, Godot.Core.File._READ,
        Godot.Core.File._WRITE, Godot.Core.File._WRITE_READ,
        Godot.Core.File._READ_WRITE, Godot.Core.File._COMPRESSION_FASTLZ,
        Godot.Core.File._COMPRESSION_GZIP,
        Godot.Core.File._COMPRESSION_ZSTD, Godot.Core.File.get_endian_swap,
        Godot.Core.File.set_endian_swap, Godot.Core.File.open_encrypted,
        Godot.Core.File.open_encrypted_with_pass,
        Godot.Core.File.open_compressed, Godot.Core.File.open,
        Godot.Core.File.close, Godot.Core.File.get_path,
        Godot.Core.File.get_path_absolute, Godot.Core.File.is_open,
        Godot.Core.File.seek, Godot.Core.File.seek_end,
        Godot.Core.File.get_position, Godot.Core.File.get_len,
        Godot.Core.File.eof_reached, Godot.Core.File.get_8,
        Godot.Core.File.get_16, Godot.Core.File.get_32,
        Godot.Core.File.get_64, Godot.Core.File.get_float,
        Godot.Core.File.get_double, Godot.Core.File.get_real,
        Godot.Core.File.get_buffer, Godot.Core.File.get_line,
        Godot.Core.File.get_csv_line, Godot.Core.File.get_as_text,
        Godot.Core.File.get_md5, Godot.Core.File.get_sha256,
        Godot.Core.File.get_error, Godot.Core.File.get_var,
        Godot.Core.File.store_8, Godot.Core.File.store_16,
        Godot.Core.File.store_32, Godot.Core.File.store_64,
        Godot.Core.File.store_float, Godot.Core.File.store_double,
        Godot.Core.File.store_real, Godot.Core.File.store_buffer,
        Godot.Core.File.store_line, Godot.Core.File.store_csv_line,
        Godot.Core.File.store_string, Godot.Core.File.store_var,
        Godot.Core.File.store_pascal_string,
        Godot.Core.File.get_pascal_string, Godot.Core.File.file_exists,
        Godot.Core.File.get_modified_time)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_COMPRESSION_DEFLATE :: Int
_COMPRESSION_DEFLATE = 1

_READ :: Int
_READ = 1

_WRITE :: Int
_WRITE = 2

_WRITE_READ :: Int
_WRITE_READ = 7

_READ_WRITE :: Int
_READ_WRITE = 3

_COMPRESSION_FASTLZ :: Int
_COMPRESSION_FASTLZ = 0

_COMPRESSION_GZIP :: Int
_COMPRESSION_GZIP = 3

_COMPRESSION_ZSTD :: Int
_COMPRESSION_ZSTD = 2

{-# NOINLINE bindFile_get_endian_swap #-}

-- | If [code]true[/code], the file's endianness is swapped. Use this if you're dealing with files written in big endian machines.
--   			Note that this is about the file format, not CPU type. This is always reset to [code]false[/code] whenever you open the file.
bindFile_get_endian_swap :: MethodBind
bindFile_get_endian_swap
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_endian_swap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the file's endianness is swapped. Use this if you're dealing with files written in big endian machines.
--   			Note that this is about the file format, not CPU type. This is always reset to [code]false[/code] whenever you open the file.
get_endian_swap :: (File :< cls, Object :< cls) => cls -> IO Bool
get_endian_swap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_endian_swap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_set_endian_swap #-}

-- | If [code]true[/code], the file's endianness is swapped. Use this if you're dealing with files written in big endian machines.
--   			Note that this is about the file format, not CPU type. This is always reset to [code]false[/code] whenever you open the file.
bindFile_set_endian_swap :: MethodBind
bindFile_set_endian_swap
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "set_endian_swap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the file's endianness is swapped. Use this if you're dealing with files written in big endian machines.
--   			Note that this is about the file format, not CPU type. This is always reset to [code]false[/code] whenever you open the file.
set_endian_swap ::
                  (File :< cls, Object :< cls) => cls -> Bool -> IO ()
set_endian_swap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_set_endian_swap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_open_encrypted #-}

-- | Opens an encrypted file in write or read mode. You need to pass a binary key to encrypt/decrypt it.
bindFile_open_encrypted :: MethodBind
bindFile_open_encrypted
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "open_encrypted" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opens an encrypted file in write or read mode. You need to pass a binary key to encrypt/decrypt it.
open_encrypted ::
                 (File :< cls, Object :< cls) =>
                 cls -> GodotString -> Int -> PoolByteArray -> IO Int
open_encrypted cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_open_encrypted (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_open_encrypted_with_pass #-}

-- | Opens an encrypted file in write or read mode. You need to pass a password to encrypt/decrypt it.
bindFile_open_encrypted_with_pass :: MethodBind
bindFile_open_encrypted_with_pass
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "open_encrypted_with_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opens an encrypted file in write or read mode. You need to pass a password to encrypt/decrypt it.
open_encrypted_with_pass ::
                           (File :< cls, Object :< cls) =>
                           cls -> GodotString -> Int -> GodotString -> IO Int
open_encrypted_with_pass cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_open_encrypted_with_pass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_open_compressed #-}

-- | Opens a compressed file for reading or writing. Use COMPRESSION_* constants to set [code]compression_mode[/code].
bindFile_open_compressed :: MethodBind
bindFile_open_compressed
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "open_compressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opens a compressed file for reading or writing. Use COMPRESSION_* constants to set [code]compression_mode[/code].
open_compressed ::
                  (File :< cls, Object :< cls) =>
                  cls -> GodotString -> Int -> Int -> IO Int
open_compressed cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_open_compressed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_open #-}

-- | Opens the file for writing or reading, depending on the flags.
bindFile_open :: MethodBind
bindFile_open
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "open" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opens the file for writing or reading, depending on the flags.
open ::
       (File :< cls, Object :< cls) => cls -> GodotString -> Int -> IO Int
open cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_open (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_close #-}

-- | Closes the currently opened file.
bindFile_close :: MethodBind
bindFile_close
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Closes the currently opened file.
close :: (File :< cls, Object :< cls) => cls -> IO ()
close cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_close (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_path #-}

-- | Returns the path as a [String] for the current open file.
bindFile_get_path :: MethodBind
bindFile_get_path
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path as a [String] for the current open file.
get_path :: (File :< cls, Object :< cls) => cls -> IO GodotString
get_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_path (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_path_absolute #-}

-- | Returns the absolute path as a [String] for the current open file.
bindFile_get_path_absolute :: MethodBind
bindFile_get_path_absolute
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_path_absolute" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the absolute path as a [String] for the current open file.
get_path_absolute ::
                    (File :< cls, Object :< cls) => cls -> IO GodotString
get_path_absolute cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_path_absolute (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_is_open #-}

-- | Returns [code]true[/code] if the file is currently opened.
bindFile_is_open :: MethodBind
bindFile_is_open
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "is_open" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the file is currently opened.
is_open :: (File :< cls, Object :< cls) => cls -> IO Bool
is_open cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_is_open (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_seek #-}

-- | Change the file reading/writing cursor to the specified position (in bytes from the beginning of the file).
bindFile_seek :: MethodBind
bindFile_seek
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Change the file reading/writing cursor to the specified position (in bytes from the beginning of the file).
seek :: (File :< cls, Object :< cls) => cls -> Int -> IO ()
seek cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_seek (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_seek_end #-}

-- | Changes the file reading/writing cursor to the specified position (in bytes from the end of the file). Note that this is an offset, so you should use negative numbers or the cursor will be at the end of the file.
bindFile_seek_end :: MethodBind
bindFile_seek_end
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "seek_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the file reading/writing cursor to the specified position (in bytes from the end of the file). Note that this is an offset, so you should use negative numbers or the cursor will be at the end of the file.
seek_end :: (File :< cls, Object :< cls) => cls -> Int -> IO ()
seek_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_seek_end (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_position #-}

-- | Returns the file cursor's position.
bindFile_get_position :: MethodBind
bindFile_get_position
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the file cursor's position.
get_position :: (File :< cls, Object :< cls) => cls -> IO Int
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_position (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_len #-}

-- | Returns the size of the file in bytes.
bindFile_get_len :: MethodBind
bindFile_get_len
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_len" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size of the file in bytes.
get_len :: (File :< cls, Object :< cls) => cls -> IO Int
get_len cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_len (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_eof_reached #-}

-- | Returns [code]true[/code] if the file cursor has read past the end of the file. Note that this function will still return [code]false[/code] while at the end of the file and only activates when reading past it. This can be confusing but it conforms to how low level file access works in all operating systems. There is always [method get_len] and [method get_position] to implement a custom logic.
bindFile_eof_reached :: MethodBind
bindFile_eof_reached
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "eof_reached" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the file cursor has read past the end of the file. Note that this function will still return [code]false[/code] while at the end of the file and only activates when reading past it. This can be confusing but it conforms to how low level file access works in all operating systems. There is always [method get_len] and [method get_position] to implement a custom logic.
eof_reached :: (File :< cls, Object :< cls) => cls -> IO Bool
eof_reached cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_eof_reached (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_8 #-}

-- | Returns the next 8 bits from the file as an integer.
bindFile_get_8 :: MethodBind
bindFile_get_8
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next 8 bits from the file as an integer.
get_8 :: (File :< cls, Object :< cls) => cls -> IO Int
get_8 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_8 (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_16 #-}

-- | Returns the next 16 bits from the file as an integer.
bindFile_get_16 :: MethodBind
bindFile_get_16
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next 16 bits from the file as an integer.
get_16 :: (File :< cls, Object :< cls) => cls -> IO Int
get_16 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_16 (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_32 #-}

-- | Returns the next 32 bits from the file as an integer.
bindFile_get_32 :: MethodBind
bindFile_get_32
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next 32 bits from the file as an integer.
get_32 :: (File :< cls, Object :< cls) => cls -> IO Int
get_32 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_32 (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_64 #-}

-- | Returns the next 64 bits from the file as an integer.
bindFile_get_64 :: MethodBind
bindFile_get_64
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next 64 bits from the file as an integer.
get_64 :: (File :< cls, Object :< cls) => cls -> IO Int
get_64 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_64 (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_float #-}

-- | Returns the next 32 bits from the file as a floating point number.
bindFile_get_float :: MethodBind
bindFile_get_float
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_float" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next 32 bits from the file as a floating point number.
get_float :: (File :< cls, Object :< cls) => cls -> IO Float
get_float cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_float (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_double #-}

-- | Returns the next 64 bits from the file as a floating point number.
bindFile_get_double :: MethodBind
bindFile_get_double
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_double" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next 64 bits from the file as a floating point number.
get_double :: (File :< cls, Object :< cls) => cls -> IO Float
get_double cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_double (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_real #-}

-- | Returns the next bits from the file as a floating point number.
bindFile_get_real :: MethodBind
bindFile_get_real
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_real" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next bits from the file as a floating point number.
get_real :: (File :< cls, Object :< cls) => cls -> IO Float
get_real cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_real (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_buffer #-}

-- | Returns next [code]len[/code] bytes of the file as a [PoolByteArray].
bindFile_get_buffer :: MethodBind
bindFile_get_buffer
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns next [code]len[/code] bytes of the file as a [PoolByteArray].
get_buffer ::
             (File :< cls, Object :< cls) => cls -> Int -> IO PoolByteArray
get_buffer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_buffer (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_line #-}

-- | Returns the next line of the file as a [String].
--   				Text is interpreted as being UTF-8 encoded.
bindFile_get_line :: MethodBind
bindFile_get_line
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next line of the file as a [String].
--   				Text is interpreted as being UTF-8 encoded.
get_line :: (File :< cls, Object :< cls) => cls -> IO GodotString
get_line cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_line (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_csv_line #-}

-- | Returns the next value of the file in CSV (Comma Separated Values) format. You can pass a different delimiter to use other than the default "," (comma), it should be one character long.
--   				Text is interpreted as being UTF-8 encoded.
bindFile_get_csv_line :: MethodBind
bindFile_get_csv_line
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_csv_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next value of the file in CSV (Comma Separated Values) format. You can pass a different delimiter to use other than the default "," (comma), it should be one character long.
--   				Text is interpreted as being UTF-8 encoded.
get_csv_line ::
               (File :< cls, Object :< cls) =>
               cls -> GodotString -> IO PoolStringArray
get_csv_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_csv_line (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_as_text #-}

-- | Returns the whole file as a [String].
--   				Text is interpreted as being UTF-8 encoded.
bindFile_get_as_text :: MethodBind
bindFile_get_as_text
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_as_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the whole file as a [String].
--   				Text is interpreted as being UTF-8 encoded.
get_as_text ::
              (File :< cls, Object :< cls) => cls -> IO GodotString
get_as_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_as_text (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_md5 #-}

-- | Returns an MD5 String representing the file at the given path or an empty [String] on failure.
bindFile_get_md5 :: MethodBind
bindFile_get_md5
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_md5" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an MD5 String representing the file at the given path or an empty [String] on failure.
get_md5 ::
          (File :< cls, Object :< cls) =>
          cls -> GodotString -> IO GodotString
get_md5 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_md5 (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_sha256 #-}

-- | Returns a SHA-256 [String] representing the file at the given path or an empty [String] on failure.
bindFile_get_sha256 :: MethodBind
bindFile_get_sha256
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_sha256" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a SHA-256 [String] representing the file at the given path or an empty [String] on failure.
get_sha256 ::
             (File :< cls, Object :< cls) =>
             cls -> GodotString -> IO GodotString
get_sha256 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_sha256 (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_error #-}

-- | Returns the last error that happened when trying to perform operations. Compare with the [code]ERR_FILE_*[/code] constants from [@GlobalScope].
bindFile_get_error :: MethodBind
bindFile_get_error
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the last error that happened when trying to perform operations. Compare with the [code]ERR_FILE_*[/code] constants from [@GlobalScope].
get_error :: (File :< cls, Object :< cls) => cls -> IO Int
get_error cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_error (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_var #-}

-- | Returns the next [Variant] value from the file. When [code]allow_objects[/code] is [code]true[/code] decoding objects is allowed.
--   				[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
bindFile_get_var :: MethodBind
bindFile_get_var
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the next [Variant] value from the file. When [code]allow_objects[/code] is [code]true[/code] decoding objects is allowed.
--   				[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
get_var :: (File :< cls, Object :< cls) => cls -> IO GodotVariant
get_var cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_var (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_8 #-}

-- | Stores an integer as 8 bits in the file.
bindFile_store_8 :: MethodBind
bindFile_store_8
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores an integer as 8 bits in the file.
store_8 :: (File :< cls, Object :< cls) => cls -> Int -> IO ()
store_8 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_8 (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_16 #-}

-- | Stores an integer as 16 bits in the file.
bindFile_store_16 :: MethodBind
bindFile_store_16
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_16" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores an integer as 16 bits in the file.
store_16 :: (File :< cls, Object :< cls) => cls -> Int -> IO ()
store_16 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_16 (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_32 #-}

-- | Stores an integer as 32 bits in the file.
bindFile_store_32 :: MethodBind
bindFile_store_32
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_32" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores an integer as 32 bits in the file.
store_32 :: (File :< cls, Object :< cls) => cls -> Int -> IO ()
store_32 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_32 (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_64 #-}

-- | Stores an integer as 64 bits in the file.
bindFile_store_64 :: MethodBind
bindFile_store_64
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores an integer as 64 bits in the file.
store_64 :: (File :< cls, Object :< cls) => cls -> Int -> IO ()
store_64 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_64 (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_float #-}

-- | Stores a floating point number as 32 bits in the file.
bindFile_store_float :: MethodBind
bindFile_store_float
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_float" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores a floating point number as 32 bits in the file.
store_float ::
              (File :< cls, Object :< cls) => cls -> Float -> IO ()
store_float cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_float (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_double #-}

-- | Stores a floating point number as 64 bits in the file.
bindFile_store_double :: MethodBind
bindFile_store_double
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_double" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores a floating point number as 64 bits in the file.
store_double ::
               (File :< cls, Object :< cls) => cls -> Float -> IO ()
store_double cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_double (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_real #-}

-- | Stores a floating point number in the file.
bindFile_store_real :: MethodBind
bindFile_store_real
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_real" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores a floating point number in the file.
store_real :: (File :< cls, Object :< cls) => cls -> Float -> IO ()
store_real cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_real (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_buffer #-}

-- | Stores the given array of bytes in the file.
bindFile_store_buffer :: MethodBind
bindFile_store_buffer
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores the given array of bytes in the file.
store_buffer ::
               (File :< cls, Object :< cls) => cls -> PoolByteArray -> IO ()
store_buffer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_buffer (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_line #-}

-- | Stores the given [String] as a line in the file.
--   				Text will be encoded as UTF-8.
bindFile_store_line :: MethodBind
bindFile_store_line
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores the given [String] as a line in the file.
--   				Text will be encoded as UTF-8.
store_line ::
             (File :< cls, Object :< cls) => cls -> GodotString -> IO ()
store_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_line (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_csv_line #-}

-- | Store the given [PoolStringArray] in the file as a line formatted in the CSV (Comma Separated Values) format. You can pass a different delimiter to use other than the default "," (comma), it should be one character long.
--   				Text will be encoded as UTF-8.
bindFile_store_csv_line :: MethodBind
bindFile_store_csv_line
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_csv_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Store the given [PoolStringArray] in the file as a line formatted in the CSV (Comma Separated Values) format. You can pass a different delimiter to use other than the default "," (comma), it should be one character long.
--   				Text will be encoded as UTF-8.
store_csv_line ::
                 (File :< cls, Object :< cls) =>
                 cls -> PoolStringArray -> GodotString -> IO ()
store_csv_line cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_csv_line (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_string #-}

-- | Stores the given [String] in the file.
--   				Text will be encoded as UTF-8.
bindFile_store_string :: MethodBind
bindFile_store_string
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores the given [String] in the file.
--   				Text will be encoded as UTF-8.
store_string ::
               (File :< cls, Object :< cls) => cls -> GodotString -> IO ()
store_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_string (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_var #-}

-- | Stores any Variant value in the file. When [code]full_objects[/code] is [code]true[/code] encoding objects is allowed (and can potentially include code).
bindFile_store_var :: MethodBind
bindFile_store_var
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores any Variant value in the file. When [code]full_objects[/code] is [code]true[/code] encoding objects is allowed (and can potentially include code).
store_var ::
            (File :< cls, Object :< cls) => cls -> GodotVariant -> IO ()
store_var cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_var (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_store_pascal_string #-}

-- | Stores the given [String] as a line in the file in Pascal format (i.e. also store the length of the string).
--   				Text will be encoded as UTF-8.
bindFile_store_pascal_string :: MethodBind
bindFile_store_pascal_string
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "store_pascal_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores the given [String] as a line in the file in Pascal format (i.e. also store the length of the string).
--   				Text will be encoded as UTF-8.
store_pascal_string ::
                      (File :< cls, Object :< cls) => cls -> GodotString -> IO ()
store_pascal_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_store_pascal_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_pascal_string #-}

-- | Returns a [String] saved in Pascal format from the file.
--   				Text is interpreted as being UTF-8 encoded.
bindFile_get_pascal_string :: MethodBind
bindFile_get_pascal_string
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_pascal_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [String] saved in Pascal format from the file.
--   				Text is interpreted as being UTF-8 encoded.
get_pascal_string ::
                    (File :< cls, Object :< cls) => cls -> IO GodotString
get_pascal_string cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_pascal_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_file_exists #-}

-- | Returns [code]true[/code] if the file exists in the given path.
--   				Note that many resources types are imported (e.g. textures or sound files), and that their source asset will not be included in the exported game, as only the imported version is used (in the [code]res://.import[/code] folder). To check for the existence of such resources while taking into account the remapping to their imported location, use [method ResourceLoader.exists]. Typically, using [code]File.file_exists[/code] on an imported resource would work while you are developing in the editor (the source asset is present in [code]res://[/code], but fail when exported).
bindFile_file_exists :: MethodBind
bindFile_file_exists
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "file_exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the file exists in the given path.
--   				Note that many resources types are imported (e.g. textures or sound files), and that their source asset will not be included in the exported game, as only the imported version is used (in the [code]res://.import[/code] folder). To check for the existence of such resources while taking into account the remapping to their imported location, use [method ResourceLoader.exists]. Typically, using [code]File.file_exists[/code] on an imported resource would work while you are developing in the editor (the source asset is present in [code]res://[/code], but fail when exported).
file_exists ::
              (File :< cls, Object :< cls) => cls -> GodotString -> IO Bool
file_exists cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_file_exists (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindFile_get_modified_time #-}

-- | Returns the last time the [code]file[/code] was modified in unix timestamp format or returns a [String] "ERROR IN [code]file[/code]". This unix timestamp can be converted to datetime by using [method OS.get_datetime_from_unix_time].
bindFile_get_modified_time :: MethodBind
bindFile_get_modified_time
  = unsafePerformIO $
      withCString "_File" $
        \ clsNamePtr ->
          withCString "get_modified_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the last time the [code]file[/code] was modified in unix timestamp format or returns a [String] "ERROR IN [code]file[/code]". This unix timestamp can be converted to datetime by using [method OS.get_datetime_from_unix_time].
get_modified_time ::
                    (File :< cls, Object :< cls) => cls -> GodotString -> IO Int
get_modified_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindFile_get_modified_time (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)