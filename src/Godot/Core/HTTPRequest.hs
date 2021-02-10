{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.HTTPRequest
       (Godot.Core.HTTPRequest._RESULT_DOWNLOAD_FILE_CANT_OPEN,
        Godot.Core.HTTPRequest._RESULT_SUCCESS,
        Godot.Core.HTTPRequest._RESULT_NO_RESPONSE,
        Godot.Core.HTTPRequest._RESULT_REQUEST_FAILED,
        Godot.Core.HTTPRequest._RESULT_CONNECTION_ERROR,
        Godot.Core.HTTPRequest._RESULT_CANT_CONNECT,
        Godot.Core.HTTPRequest._RESULT_CHUNKED_BODY_SIZE_MISMATCH,
        Godot.Core.HTTPRequest._RESULT_BODY_SIZE_LIMIT_EXCEEDED,
        Godot.Core.HTTPRequest._RESULT_REDIRECT_LIMIT_REACHED,
        Godot.Core.HTTPRequest._RESULT_SSL_HANDSHAKE_ERROR,
        Godot.Core.HTTPRequest._RESULT_CANT_RESOLVE,
        Godot.Core.HTTPRequest._RESULT_TIMEOUT,
        Godot.Core.HTTPRequest._RESULT_DOWNLOAD_FILE_WRITE_ERROR,
        Godot.Core.HTTPRequest.sig_request_completed,
        Godot.Core.HTTPRequest._redirect_request,
        Godot.Core.HTTPRequest._request_done,
        Godot.Core.HTTPRequest._timeout,
        Godot.Core.HTTPRequest.cancel_request,
        Godot.Core.HTTPRequest.get_body_size,
        Godot.Core.HTTPRequest.get_body_size_limit,
        Godot.Core.HTTPRequest.get_download_chunk_size,
        Godot.Core.HTTPRequest.get_download_file,
        Godot.Core.HTTPRequest.get_downloaded_bytes,
        Godot.Core.HTTPRequest.get_http_client_status,
        Godot.Core.HTTPRequest.get_max_redirects,
        Godot.Core.HTTPRequest.get_timeout,
        Godot.Core.HTTPRequest.is_using_threads,
        Godot.Core.HTTPRequest.request,
        Godot.Core.HTTPRequest.set_body_size_limit,
        Godot.Core.HTTPRequest.set_download_chunk_size,
        Godot.Core.HTTPRequest.set_download_file,
        Godot.Core.HTTPRequest.set_max_redirects,
        Godot.Core.HTTPRequest.set_timeout,
        Godot.Core.HTTPRequest.set_use_threads)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_RESULT_DOWNLOAD_FILE_CANT_OPEN :: Int
_RESULT_DOWNLOAD_FILE_CANT_OPEN = 9

_RESULT_SUCCESS :: Int
_RESULT_SUCCESS = 0

_RESULT_NO_RESPONSE :: Int
_RESULT_NO_RESPONSE = 6

_RESULT_REQUEST_FAILED :: Int
_RESULT_REQUEST_FAILED = 8

_RESULT_CONNECTION_ERROR :: Int
_RESULT_CONNECTION_ERROR = 4

_RESULT_CANT_CONNECT :: Int
_RESULT_CANT_CONNECT = 2

_RESULT_CHUNKED_BODY_SIZE_MISMATCH :: Int
_RESULT_CHUNKED_BODY_SIZE_MISMATCH = 1

_RESULT_BODY_SIZE_LIMIT_EXCEEDED :: Int
_RESULT_BODY_SIZE_LIMIT_EXCEEDED = 7

_RESULT_REDIRECT_LIMIT_REACHED :: Int
_RESULT_REDIRECT_LIMIT_REACHED = 11

_RESULT_SSL_HANDSHAKE_ERROR :: Int
_RESULT_SSL_HANDSHAKE_ERROR = 5

_RESULT_CANT_RESOLVE :: Int
_RESULT_CANT_RESOLVE = 3

_RESULT_TIMEOUT :: Int
_RESULT_TIMEOUT = 12

_RESULT_DOWNLOAD_FILE_WRITE_ERROR :: Int
_RESULT_DOWNLOAD_FILE_WRITE_ERROR = 10

-- | Emitted when a request is completed.
sig_request_completed :: Godot.Internal.Dispatch.Signal HTTPRequest
sig_request_completed
  = Godot.Internal.Dispatch.Signal "request_completed"

instance NodeSignal HTTPRequest "request_completed"
           '[Int, Int, PoolStringArray, PoolByteArray]

{-# NOINLINE bindHTTPRequest__redirect_request #-}

bindHTTPRequest__redirect_request :: MethodBind
bindHTTPRequest__redirect_request
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "_redirect_request" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_redirect_request ::
                    (HTTPRequest :< cls, Object :< cls) => cls -> GodotString -> IO ()
_redirect_request cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest__redirect_request
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest__request_done #-}

bindHTTPRequest__request_done :: MethodBind
bindHTTPRequest__request_done
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "_request_done" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_request_done ::
                (HTTPRequest :< cls, Object :< cls) =>
                cls -> Int -> Int -> PoolStringArray -> PoolByteArray -> IO ()
_request_done cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest__request_done (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest__timeout #-}

bindHTTPRequest__timeout :: MethodBind
bindHTTPRequest__timeout
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "_timeout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_timeout :: (HTTPRequest :< cls, Object :< cls) => cls -> IO ()
_timeout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest__timeout (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_cancel_request #-}

-- | Cancels the current request.
bindHTTPRequest_cancel_request :: MethodBind
bindHTTPRequest_cancel_request
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "cancel_request" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Cancels the current request.
cancel_request ::
                 (HTTPRequest :< cls, Object :< cls) => cls -> IO ()
cancel_request cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_cancel_request (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_get_body_size #-}

-- | Returns the response body length.
--   				[b]Note:[/b] Some Web servers may not send a body length. In this case, the value returned will be [code]-1[/code]. If using chunked transfer encoding, the body length will also be [code]-1[/code].
bindHTTPRequest_get_body_size :: MethodBind
bindHTTPRequest_get_body_size
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "get_body_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the response body length.
--   				[b]Note:[/b] Some Web servers may not send a body length. In this case, the value returned will be [code]-1[/code]. If using chunked transfer encoding, the body length will also be [code]-1[/code].
get_body_size ::
                (HTTPRequest :< cls, Object :< cls) => cls -> IO Int
get_body_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_get_body_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_get_body_size_limit #-}

-- | Maximum allowed size for response bodies.
bindHTTPRequest_get_body_size_limit :: MethodBind
bindHTTPRequest_get_body_size_limit
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "get_body_size_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum allowed size for response bodies.
get_body_size_limit ::
                      (HTTPRequest :< cls, Object :< cls) => cls -> IO Int
get_body_size_limit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_get_body_size_limit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_get_download_chunk_size #-}

-- | The size of the buffer used and maximum bytes to read per iteration. See [member HTTPClient.read_chunk_size].
--   			Set this to a higher value (e.g. 65536 for 64 KiB) when downloading large files to achieve better speeds at the cost of memory.
bindHTTPRequest_get_download_chunk_size :: MethodBind
bindHTTPRequest_get_download_chunk_size
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "get_download_chunk_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the buffer used and maximum bytes to read per iteration. See [member HTTPClient.read_chunk_size].
--   			Set this to a higher value (e.g. 65536 for 64 KiB) when downloading large files to achieve better speeds at the cost of memory.
get_download_chunk_size ::
                          (HTTPRequest :< cls, Object :< cls) => cls -> IO Int
get_download_chunk_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_get_download_chunk_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_get_download_file #-}

-- | The file to download into. Will output any received file into it.
bindHTTPRequest_get_download_file :: MethodBind
bindHTTPRequest_get_download_file
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "get_download_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The file to download into. Will output any received file into it.
get_download_file ::
                    (HTTPRequest :< cls, Object :< cls) => cls -> IO GodotString
get_download_file cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_get_download_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_get_downloaded_bytes #-}

-- | Returns the amount of bytes this HTTPRequest downloaded.
bindHTTPRequest_get_downloaded_bytes :: MethodBind
bindHTTPRequest_get_downloaded_bytes
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "get_downloaded_bytes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of bytes this HTTPRequest downloaded.
get_downloaded_bytes ::
                       (HTTPRequest :< cls, Object :< cls) => cls -> IO Int
get_downloaded_bytes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_get_downloaded_bytes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_get_http_client_status #-}

-- | Returns the current status of the underlying [HTTPClient]. See [enum HTTPClient.Status].
bindHTTPRequest_get_http_client_status :: MethodBind
bindHTTPRequest_get_http_client_status
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "get_http_client_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current status of the underlying [HTTPClient]. See [enum HTTPClient.Status].
get_http_client_status ::
                         (HTTPRequest :< cls, Object :< cls) => cls -> IO Int
get_http_client_status cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_get_http_client_status
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_get_max_redirects #-}

-- | Maximum number of allowed redirects.
bindHTTPRequest_get_max_redirects :: MethodBind
bindHTTPRequest_get_max_redirects
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "get_max_redirects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum number of allowed redirects.
get_max_redirects ::
                    (HTTPRequest :< cls, Object :< cls) => cls -> IO Int
get_max_redirects cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_get_max_redirects
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_get_timeout #-}

bindHTTPRequest_get_timeout :: MethodBind
bindHTTPRequest_get_timeout
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "get_timeout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_timeout :: (HTTPRequest :< cls, Object :< cls) => cls -> IO Int
get_timeout cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_get_timeout (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_is_using_threads #-}

-- | If [code]true[/code], multithreading is used to improve performance.
bindHTTPRequest_is_using_threads :: MethodBind
bindHTTPRequest_is_using_threads
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "is_using_threads" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], multithreading is used to improve performance.
is_using_threads ::
                   (HTTPRequest :< cls, Object :< cls) => cls -> IO Bool
is_using_threads cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_is_using_threads
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_request #-}

-- | Creates request on the underlying [HTTPClient]. If there is no configuration errors, it tries to connect using [method HTTPClient.connect_to_host] and passes parameters onto [method HTTPClient.request].
--   				Returns [constant OK] if request is successfully created. (Does not imply that the server has responded), [constant ERR_UNCONFIGURED] if not in the tree, [constant ERR_BUSY] if still processing previous request, [constant ERR_INVALID_PARAMETER] if given string is not a valid URL format, or [constant ERR_CANT_CONNECT] if not using thread and the [HTTPClient] cannot connect to host.
--   				[b]Note:[/b] The [code]request_data[/code] parameter is ignored if [code]method[/code] is [constant HTTPClient.METHOD_GET]. This is because GET methods can't contain request data. As a workaround, you can pass request data as a query string in the URL. See [method String.http_escape] for an example.
bindHTTPRequest_request :: MethodBind
bindHTTPRequest_request
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "request" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates request on the underlying [HTTPClient]. If there is no configuration errors, it tries to connect using [method HTTPClient.connect_to_host] and passes parameters onto [method HTTPClient.request].
--   				Returns [constant OK] if request is successfully created. (Does not imply that the server has responded), [constant ERR_UNCONFIGURED] if not in the tree, [constant ERR_BUSY] if still processing previous request, [constant ERR_INVALID_PARAMETER] if given string is not a valid URL format, or [constant ERR_CANT_CONNECT] if not using thread and the [HTTPClient] cannot connect to host.
--   				[b]Note:[/b] The [code]request_data[/code] parameter is ignored if [code]method[/code] is [constant HTTPClient.METHOD_GET]. This is because GET methods can't contain request data. As a workaround, you can pass request data as a query string in the URL. See [method String.http_escape] for an example.
request ::
          (HTTPRequest :< cls, Object :< cls) =>
          cls ->
            GodotString ->
              PoolStringArray -> Bool -> Int -> GodotString -> IO Int
request cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_request (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_set_body_size_limit #-}

-- | Maximum allowed size for response bodies.
bindHTTPRequest_set_body_size_limit :: MethodBind
bindHTTPRequest_set_body_size_limit
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "set_body_size_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum allowed size for response bodies.
set_body_size_limit ::
                      (HTTPRequest :< cls, Object :< cls) => cls -> Int -> IO ()
set_body_size_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_set_body_size_limit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_set_download_chunk_size #-}

-- | The size of the buffer used and maximum bytes to read per iteration. See [member HTTPClient.read_chunk_size].
--   			Set this to a higher value (e.g. 65536 for 64 KiB) when downloading large files to achieve better speeds at the cost of memory.
bindHTTPRequest_set_download_chunk_size :: MethodBind
bindHTTPRequest_set_download_chunk_size
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "set_download_chunk_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the buffer used and maximum bytes to read per iteration. See [member HTTPClient.read_chunk_size].
--   			Set this to a higher value (e.g. 65536 for 64 KiB) when downloading large files to achieve better speeds at the cost of memory.
set_download_chunk_size ::
                          (HTTPRequest :< cls, Object :< cls) => cls -> Int -> IO ()
set_download_chunk_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_set_download_chunk_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_set_download_file #-}

-- | The file to download into. Will output any received file into it.
bindHTTPRequest_set_download_file :: MethodBind
bindHTTPRequest_set_download_file
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "set_download_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The file to download into. Will output any received file into it.
set_download_file ::
                    (HTTPRequest :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_download_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_set_download_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_set_max_redirects #-}

-- | Maximum number of allowed redirects.
bindHTTPRequest_set_max_redirects :: MethodBind
bindHTTPRequest_set_max_redirects
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "set_max_redirects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum number of allowed redirects.
set_max_redirects ::
                    (HTTPRequest :< cls, Object :< cls) => cls -> Int -> IO ()
set_max_redirects cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_set_max_redirects
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_set_timeout #-}

bindHTTPRequest_set_timeout :: MethodBind
bindHTTPRequest_set_timeout
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "set_timeout" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_timeout ::
              (HTTPRequest :< cls, Object :< cls) => cls -> Int -> IO ()
set_timeout cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_set_timeout (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindHTTPRequest_set_use_threads #-}

-- | If [code]true[/code], multithreading is used to improve performance.
bindHTTPRequest_set_use_threads :: MethodBind
bindHTTPRequest_set_use_threads
  = unsafePerformIO $
      withCString "HTTPRequest" $
        \ clsNamePtr ->
          withCString "set_use_threads" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], multithreading is used to improve performance.
set_use_threads ::
                  (HTTPRequest :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_threads cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPRequest_set_use_threads (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)