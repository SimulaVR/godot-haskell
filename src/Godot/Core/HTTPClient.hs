{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.HTTPClient
       (Godot.Core.HTTPClient._RESPONSE_CONFLICT,
        Godot.Core.HTTPClient._RESPONSE_UPGRADE_REQUIRED,
        Godot.Core.HTTPClient._METHOD_TRACE,
        Godot.Core.HTTPClient._RESPONSE_PROCESSING,
        Godot.Core.HTTPClient._METHOD_OPTIONS,
        Godot.Core.HTTPClient._RESPONSE_MOVED_PERMANENTLY,
        Godot.Core.HTTPClient._RESPONSE_TOO_MANY_REQUESTS,
        Godot.Core.HTTPClient._RESPONSE_TEMPORARY_REDIRECT,
        Godot.Core.HTTPClient._METHOD_PUT,
        Godot.Core.HTTPClient._RESPONSE_LOCKED,
        Godot.Core.HTTPClient._RESPONSE_UNAUTHORIZED,
        Godot.Core.HTTPClient._RESPONSE_HTTP_VERSION_NOT_SUPPORTED,
        Godot.Core.HTTPClient._RESPONSE_MULTIPLE_CHOICES,
        Godot.Core.HTTPClient._METHOD_GET,
        Godot.Core.HTTPClient._RESPONSE_INSUFFICIENT_STORAGE,
        Godot.Core.HTTPClient._RESPONSE_GONE,
        Godot.Core.HTTPClient._RESPONSE_REQUEST_TIMEOUT,
        Godot.Core.HTTPClient._RESPONSE_RESET_CONTENT,
        Godot.Core.HTTPClient._RESPONSE_OK,
        Godot.Core.HTTPClient._RESPONSE_PERMANENT_REDIRECT,
        Godot.Core.HTTPClient._METHOD_DELETE,
        Godot.Core.HTTPClient._STATUS_CONNECTING,
        Godot.Core.HTTPClient._RESPONSE_NOT_FOUND,
        Godot.Core.HTTPClient._METHOD_PATCH,
        Godot.Core.HTTPClient._RESPONSE_LOOP_DETECTED,
        Godot.Core.HTTPClient._RESPONSE_UNAVAILABLE_FOR_LEGAL_REASONS,
        Godot.Core.HTTPClient._RESPONSE_BAD_GATEWAY,
        Godot.Core.HTTPClient._RESPONSE_MULTI_STATUS,
        Godot.Core.HTTPClient._RESPONSE_ALREADY_REPORTED,
        Godot.Core.HTTPClient._RESPONSE_SEE_OTHER,
        Godot.Core.HTTPClient._RESPONSE_LENGTH_REQUIRED,
        Godot.Core.HTTPClient._RESPONSE_NOT_MODIFIED,
        Godot.Core.HTTPClient._RESPONSE_BAD_REQUEST,
        Godot.Core.HTTPClient._STATUS_SSL_HANDSHAKE_ERROR,
        Godot.Core.HTTPClient._STATUS_BODY,
        Godot.Core.HTTPClient._RESPONSE_ACCEPTED,
        Godot.Core.HTTPClient._RESPONSE_NOT_EXTENDED,
        Godot.Core.HTTPClient._RESPONSE_CONTINUE,
        Godot.Core.HTTPClient._RESPONSE_PAYMENT_REQUIRED,
        Godot.Core.HTTPClient._RESPONSE_VARIANT_ALSO_NEGOTIATES,
        Godot.Core.HTTPClient._RESPONSE_REQUEST_ENTITY_TOO_LARGE,
        Godot.Core.HTTPClient._RESPONSE_INTERNAL_SERVER_ERROR,
        Godot.Core.HTTPClient._RESPONSE_SERVICE_UNAVAILABLE,
        Godot.Core.HTTPClient._RESPONSE_GATEWAY_TIMEOUT,
        Godot.Core.HTTPClient._RESPONSE_FAILED_DEPENDENCY,
        Godot.Core.HTTPClient._RESPONSE_NETWORK_AUTH_REQUIRED,
        Godot.Core.HTTPClient._RESPONSE_MISDIRECTED_REQUEST,
        Godot.Core.HTTPClient._RESPONSE_IM_A_TEAPOT,
        Godot.Core.HTTPClient._STATUS_DISCONNECTED,
        Godot.Core.HTTPClient._RESPONSE_REQUEST_URI_TOO_LONG,
        Godot.Core.HTTPClient._RESPONSE_NOT_ACCEPTABLE,
        Godot.Core.HTTPClient._STATUS_CONNECTION_ERROR,
        Godot.Core.HTTPClient._RESPONSE_UNSUPPORTED_MEDIA_TYPE,
        Godot.Core.HTTPClient._RESPONSE_NOT_IMPLEMENTED,
        Godot.Core.HTTPClient._METHOD_CONNECT,
        Godot.Core.HTTPClient._RESPONSE_PRECONDITION_FAILED,
        Godot.Core.HTTPClient._RESPONSE_SWITCHING_PROTOCOLS,
        Godot.Core.HTTPClient._RESPONSE_IM_USED,
        Godot.Core.HTTPClient._RESPONSE_FORBIDDEN,
        Godot.Core.HTTPClient._STATUS_REQUESTING,
        Godot.Core.HTTPClient._RESPONSE_NON_AUTHORITATIVE_INFORMATION,
        Godot.Core.HTTPClient._RESPONSE_SWITCH_PROXY,
        Godot.Core.HTTPClient._RESPONSE_USE_PROXY,
        Godot.Core.HTTPClient._METHOD_MAX,
        Godot.Core.HTTPClient._RESPONSE_EXPECTATION_FAILED,
        Godot.Core.HTTPClient._STATUS_CANT_CONNECT,
        Godot.Core.HTTPClient._STATUS_CONNECTED,
        Godot.Core.HTTPClient._RESPONSE_FOUND,
        Godot.Core.HTTPClient._RESPONSE_CREATED,
        Godot.Core.HTTPClient._STATUS_CANT_RESOLVE,
        Godot.Core.HTTPClient._RESPONSE_UNPROCESSABLE_ENTITY,
        Godot.Core.HTTPClient._METHOD_HEAD,
        Godot.Core.HTTPClient._METHOD_POST,
        Godot.Core.HTTPClient._RESPONSE_PARTIAL_CONTENT,
        Godot.Core.HTTPClient._STATUS_RESOLVING,
        Godot.Core.HTTPClient._RESPONSE_NO_CONTENT,
        Godot.Core.HTTPClient._RESPONSE_REQUEST_HEADER_FIELDS_TOO_LARGE,
        Godot.Core.HTTPClient._RESPONSE_METHOD_NOT_ALLOWED,
        Godot.Core.HTTPClient._RESPONSE_PROXY_AUTHENTICATION_REQUIRED,
        Godot.Core.HTTPClient._RESPONSE_REQUESTED_RANGE_NOT_SATISFIABLE,
        Godot.Core.HTTPClient._RESPONSE_PRECONDITION_REQUIRED,
        Godot.Core.HTTPClient.close, Godot.Core.HTTPClient.connect_to_host,
        Godot.Core.HTTPClient.get_connection,
        Godot.Core.HTTPClient.get_read_chunk_size,
        Godot.Core.HTTPClient.get_response_body_length,
        Godot.Core.HTTPClient.get_response_code,
        Godot.Core.HTTPClient.get_response_headers,
        Godot.Core.HTTPClient.get_response_headers_as_dictionary,
        Godot.Core.HTTPClient.get_status,
        Godot.Core.HTTPClient.has_response,
        Godot.Core.HTTPClient.is_blocking_mode_enabled,
        Godot.Core.HTTPClient.is_response_chunked,
        Godot.Core.HTTPClient.poll,
        Godot.Core.HTTPClient.query_string_from_dict,
        Godot.Core.HTTPClient.read_response_body_chunk,
        Godot.Core.HTTPClient.request, Godot.Core.HTTPClient.request_raw,
        Godot.Core.HTTPClient.set_blocking_mode,
        Godot.Core.HTTPClient.set_connection,
        Godot.Core.HTTPClient.set_read_chunk_size)
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

_RESPONSE_CONFLICT :: Int
_RESPONSE_CONFLICT = 409

_RESPONSE_UPGRADE_REQUIRED :: Int
_RESPONSE_UPGRADE_REQUIRED = 426

_METHOD_TRACE :: Int
_METHOD_TRACE = 6

_RESPONSE_PROCESSING :: Int
_RESPONSE_PROCESSING = 102

_METHOD_OPTIONS :: Int
_METHOD_OPTIONS = 5

_RESPONSE_MOVED_PERMANENTLY :: Int
_RESPONSE_MOVED_PERMANENTLY = 301

_RESPONSE_TOO_MANY_REQUESTS :: Int
_RESPONSE_TOO_MANY_REQUESTS = 429

_RESPONSE_TEMPORARY_REDIRECT :: Int
_RESPONSE_TEMPORARY_REDIRECT = 307

_METHOD_PUT :: Int
_METHOD_PUT = 3

_RESPONSE_LOCKED :: Int
_RESPONSE_LOCKED = 423

_RESPONSE_UNAUTHORIZED :: Int
_RESPONSE_UNAUTHORIZED = 401

_RESPONSE_HTTP_VERSION_NOT_SUPPORTED :: Int
_RESPONSE_HTTP_VERSION_NOT_SUPPORTED = 505

_RESPONSE_MULTIPLE_CHOICES :: Int
_RESPONSE_MULTIPLE_CHOICES = 300

_METHOD_GET :: Int
_METHOD_GET = 0

_RESPONSE_INSUFFICIENT_STORAGE :: Int
_RESPONSE_INSUFFICIENT_STORAGE = 507

_RESPONSE_GONE :: Int
_RESPONSE_GONE = 410

_RESPONSE_REQUEST_TIMEOUT :: Int
_RESPONSE_REQUEST_TIMEOUT = 408

_RESPONSE_RESET_CONTENT :: Int
_RESPONSE_RESET_CONTENT = 205

_RESPONSE_OK :: Int
_RESPONSE_OK = 200

_RESPONSE_PERMANENT_REDIRECT :: Int
_RESPONSE_PERMANENT_REDIRECT = 308

_METHOD_DELETE :: Int
_METHOD_DELETE = 4

_STATUS_CONNECTING :: Int
_STATUS_CONNECTING = 3

_RESPONSE_NOT_FOUND :: Int
_RESPONSE_NOT_FOUND = 404

_METHOD_PATCH :: Int
_METHOD_PATCH = 8

_RESPONSE_LOOP_DETECTED :: Int
_RESPONSE_LOOP_DETECTED = 508

_RESPONSE_UNAVAILABLE_FOR_LEGAL_REASONS :: Int
_RESPONSE_UNAVAILABLE_FOR_LEGAL_REASONS = 451

_RESPONSE_BAD_GATEWAY :: Int
_RESPONSE_BAD_GATEWAY = 502

_RESPONSE_MULTI_STATUS :: Int
_RESPONSE_MULTI_STATUS = 207

_RESPONSE_ALREADY_REPORTED :: Int
_RESPONSE_ALREADY_REPORTED = 208

_RESPONSE_SEE_OTHER :: Int
_RESPONSE_SEE_OTHER = 303

_RESPONSE_LENGTH_REQUIRED :: Int
_RESPONSE_LENGTH_REQUIRED = 411

_RESPONSE_NOT_MODIFIED :: Int
_RESPONSE_NOT_MODIFIED = 304

_RESPONSE_BAD_REQUEST :: Int
_RESPONSE_BAD_REQUEST = 400

_STATUS_SSL_HANDSHAKE_ERROR :: Int
_STATUS_SSL_HANDSHAKE_ERROR = 9

_STATUS_BODY :: Int
_STATUS_BODY = 7

_RESPONSE_ACCEPTED :: Int
_RESPONSE_ACCEPTED = 202

_RESPONSE_NOT_EXTENDED :: Int
_RESPONSE_NOT_EXTENDED = 510

_RESPONSE_CONTINUE :: Int
_RESPONSE_CONTINUE = 100

_RESPONSE_PAYMENT_REQUIRED :: Int
_RESPONSE_PAYMENT_REQUIRED = 402

_RESPONSE_VARIANT_ALSO_NEGOTIATES :: Int
_RESPONSE_VARIANT_ALSO_NEGOTIATES = 506

_RESPONSE_REQUEST_ENTITY_TOO_LARGE :: Int
_RESPONSE_REQUEST_ENTITY_TOO_LARGE = 413

_RESPONSE_INTERNAL_SERVER_ERROR :: Int
_RESPONSE_INTERNAL_SERVER_ERROR = 500

_RESPONSE_SERVICE_UNAVAILABLE :: Int
_RESPONSE_SERVICE_UNAVAILABLE = 503

_RESPONSE_GATEWAY_TIMEOUT :: Int
_RESPONSE_GATEWAY_TIMEOUT = 504

_RESPONSE_FAILED_DEPENDENCY :: Int
_RESPONSE_FAILED_DEPENDENCY = 424

_RESPONSE_NETWORK_AUTH_REQUIRED :: Int
_RESPONSE_NETWORK_AUTH_REQUIRED = 511

_RESPONSE_MISDIRECTED_REQUEST :: Int
_RESPONSE_MISDIRECTED_REQUEST = 421

_RESPONSE_IM_A_TEAPOT :: Int
_RESPONSE_IM_A_TEAPOT = 418

_STATUS_DISCONNECTED :: Int
_STATUS_DISCONNECTED = 0

_RESPONSE_REQUEST_URI_TOO_LONG :: Int
_RESPONSE_REQUEST_URI_TOO_LONG = 414

_RESPONSE_NOT_ACCEPTABLE :: Int
_RESPONSE_NOT_ACCEPTABLE = 406

_STATUS_CONNECTION_ERROR :: Int
_STATUS_CONNECTION_ERROR = 8

_RESPONSE_UNSUPPORTED_MEDIA_TYPE :: Int
_RESPONSE_UNSUPPORTED_MEDIA_TYPE = 415

_RESPONSE_NOT_IMPLEMENTED :: Int
_RESPONSE_NOT_IMPLEMENTED = 501

_METHOD_CONNECT :: Int
_METHOD_CONNECT = 7

_RESPONSE_PRECONDITION_FAILED :: Int
_RESPONSE_PRECONDITION_FAILED = 412

_RESPONSE_SWITCHING_PROTOCOLS :: Int
_RESPONSE_SWITCHING_PROTOCOLS = 101

_RESPONSE_IM_USED :: Int
_RESPONSE_IM_USED = 226

_RESPONSE_FORBIDDEN :: Int
_RESPONSE_FORBIDDEN = 403

_STATUS_REQUESTING :: Int
_STATUS_REQUESTING = 6

_RESPONSE_NON_AUTHORITATIVE_INFORMATION :: Int
_RESPONSE_NON_AUTHORITATIVE_INFORMATION = 203

_RESPONSE_SWITCH_PROXY :: Int
_RESPONSE_SWITCH_PROXY = 306

_RESPONSE_USE_PROXY :: Int
_RESPONSE_USE_PROXY = 305

_METHOD_MAX :: Int
_METHOD_MAX = 9

_RESPONSE_EXPECTATION_FAILED :: Int
_RESPONSE_EXPECTATION_FAILED = 417

_STATUS_CANT_CONNECT :: Int
_STATUS_CANT_CONNECT = 4

_STATUS_CONNECTED :: Int
_STATUS_CONNECTED = 5

_RESPONSE_FOUND :: Int
_RESPONSE_FOUND = 302

_RESPONSE_CREATED :: Int
_RESPONSE_CREATED = 201

_STATUS_CANT_RESOLVE :: Int
_STATUS_CANT_RESOLVE = 2

_RESPONSE_UNPROCESSABLE_ENTITY :: Int
_RESPONSE_UNPROCESSABLE_ENTITY = 422

_METHOD_HEAD :: Int
_METHOD_HEAD = 1

_METHOD_POST :: Int
_METHOD_POST = 2

_RESPONSE_PARTIAL_CONTENT :: Int
_RESPONSE_PARTIAL_CONTENT = 206

_STATUS_RESOLVING :: Int
_STATUS_RESOLVING = 1

_RESPONSE_NO_CONTENT :: Int
_RESPONSE_NO_CONTENT = 204

_RESPONSE_REQUEST_HEADER_FIELDS_TOO_LARGE :: Int
_RESPONSE_REQUEST_HEADER_FIELDS_TOO_LARGE = 431

_RESPONSE_METHOD_NOT_ALLOWED :: Int
_RESPONSE_METHOD_NOT_ALLOWED = 405

_RESPONSE_PROXY_AUTHENTICATION_REQUIRED :: Int
_RESPONSE_PROXY_AUTHENTICATION_REQUIRED = 407

_RESPONSE_REQUESTED_RANGE_NOT_SATISFIABLE :: Int
_RESPONSE_REQUESTED_RANGE_NOT_SATISFIABLE = 416

_RESPONSE_PRECONDITION_REQUIRED :: Int
_RESPONSE_PRECONDITION_REQUIRED = 428

instance NodeProperty HTTPClient "blocking_mode_enabled" Bool
           'False
         where
        nodeProperty
          = (is_blocking_mode_enabled, wrapDroppingSetter set_blocking_mode,
             Nothing)

instance NodeProperty HTTPClient "connection" StreamPeer 'False
         where
        nodeProperty
          = (get_connection, wrapDroppingSetter set_connection, Nothing)

instance NodeProperty HTTPClient "read_chunk_size" Int 'False where
        nodeProperty
          = (get_read_chunk_size, wrapDroppingSetter set_read_chunk_size,
             Nothing)

{-# NOINLINE bindHTTPClient_close #-}

-- | Closes the current connection, allowing reuse of this @HTTPClient@.
bindHTTPClient_close :: MethodBind
bindHTTPClient_close
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Closes the current connection, allowing reuse of this @HTTPClient@.
close :: (HTTPClient :< cls, Object :< cls) => cls -> IO ()
close cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_close (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "close" '[] (IO ()) where
        nodeMethod = Godot.Core.HTTPClient.close

{-# NOINLINE bindHTTPClient_connect_to_host #-}

-- | Connects to a host. This needs to be done before any requests are sent.
--   				The host should not have http:// prepended but will strip the protocol identifier if provided.
--   				If no @port@ is specified (or @-1@ is used), it is automatically set to 80 for HTTP and 443 for HTTPS (if @use_ssl@ is enabled).
--   				@verify_host@ will check the SSL identity of the host if set to @true@.
bindHTTPClient_connect_to_host :: MethodBind
bindHTTPClient_connect_to_host
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "connect_to_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects to a host. This needs to be done before any requests are sent.
--   				The host should not have http:// prepended but will strip the protocol identifier if provided.
--   				If no @port@ is specified (or @-1@ is used), it is automatically set to 80 for HTTP and 443 for HTTPS (if @use_ssl@ is enabled).
--   				@verify_host@ will check the SSL identity of the host if set to @true@.
connect_to_host ::
                  (HTTPClient :< cls, Object :< cls) =>
                  cls ->
                    GodotString -> Maybe Int -> Maybe Bool -> Maybe Bool -> IO Int
connect_to_host cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (-1)) toVariant arg2,
       maybe (VariantBool False) toVariant arg3,
       maybe (VariantBool True) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_connect_to_host (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "connect_to_host"
           '[GodotString, Maybe Int, Maybe Bool, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.HTTPClient.connect_to_host

{-# NOINLINE bindHTTPClient_get_connection #-}

-- | The connection to use for this client.
bindHTTPClient_get_connection :: MethodBind
bindHTTPClient_get_connection
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "get_connection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The connection to use for this client.
get_connection ::
                 (HTTPClient :< cls, Object :< cls) => cls -> IO StreamPeer
get_connection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_get_connection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "get_connection" '[] (IO StreamPeer)
         where
        nodeMethod = Godot.Core.HTTPClient.get_connection

{-# NOINLINE bindHTTPClient_get_read_chunk_size #-}

-- | The size of the buffer used and maximum bytes to read per iteration. See @method read_response_body_chunk@.
bindHTTPClient_get_read_chunk_size :: MethodBind
bindHTTPClient_get_read_chunk_size
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "get_read_chunk_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the buffer used and maximum bytes to read per iteration. See @method read_response_body_chunk@.
get_read_chunk_size ::
                      (HTTPClient :< cls, Object :< cls) => cls -> IO Int
get_read_chunk_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_get_read_chunk_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "get_read_chunk_size" '[] (IO Int)
         where
        nodeMethod = Godot.Core.HTTPClient.get_read_chunk_size

{-# NOINLINE bindHTTPClient_get_response_body_length #-}

-- | Returns the response's body length.
--   				__Note:__ Some Web servers may not send a body length. In this case, the value returned will be @-1@. If using chunked transfer encoding, the body length will also be @-1@.
bindHTTPClient_get_response_body_length :: MethodBind
bindHTTPClient_get_response_body_length
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "get_response_body_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the response's body length.
--   				__Note:__ Some Web servers may not send a body length. In this case, the value returned will be @-1@. If using chunked transfer encoding, the body length will also be @-1@.
get_response_body_length ::
                           (HTTPClient :< cls, Object :< cls) => cls -> IO Int
get_response_body_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_get_response_body_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "get_response_body_length" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.HTTPClient.get_response_body_length

{-# NOINLINE bindHTTPClient_get_response_code #-}

-- | Returns the response's HTTP status code.
bindHTTPClient_get_response_code :: MethodBind
bindHTTPClient_get_response_code
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "get_response_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the response's HTTP status code.
get_response_code ::
                    (HTTPClient :< cls, Object :< cls) => cls -> IO Int
get_response_code cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_get_response_code
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "get_response_code" '[] (IO Int)
         where
        nodeMethod = Godot.Core.HTTPClient.get_response_code

{-# NOINLINE bindHTTPClient_get_response_headers #-}

-- | Returns the response headers.
bindHTTPClient_get_response_headers :: MethodBind
bindHTTPClient_get_response_headers
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "get_response_headers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the response headers.
get_response_headers ::
                       (HTTPClient :< cls, Object :< cls) => cls -> IO PoolStringArray
get_response_headers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_get_response_headers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "get_response_headers" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.HTTPClient.get_response_headers

{-# NOINLINE bindHTTPClient_get_response_headers_as_dictionary #-}

-- | Returns all response headers as a Dictionary of structure @{ "key": "value1; value2" }@ where the case-sensitivity of the keys and values is kept like the server delivers it. A value is a simple String, this string can have more than one value where "; " is used as separator.
--   				__Example:__
--   				
--   @
--   
--   				{
--   				    "content-length": 12,
--   				    "Content-Type": "application/json; charset=UTF-8",
--   				}
--   				
--   @
bindHTTPClient_get_response_headers_as_dictionary :: MethodBind
bindHTTPClient_get_response_headers_as_dictionary
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "get_response_headers_as_dictionary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all response headers as a Dictionary of structure @{ "key": "value1; value2" }@ where the case-sensitivity of the keys and values is kept like the server delivers it. A value is a simple String, this string can have more than one value where "; " is used as separator.
--   				__Example:__
--   				
--   @
--   
--   				{
--   				    "content-length": 12,
--   				    "Content-Type": "application/json; charset=UTF-8",
--   				}
--   				
--   @
get_response_headers_as_dictionary ::
                                     (HTTPClient :< cls, Object :< cls) => cls -> IO Dictionary
get_response_headers_as_dictionary cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindHTTPClient_get_response_headers_as_dictionary
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "get_response_headers_as_dictionary"
           '[]
           (IO Dictionary)
         where
        nodeMethod
          = Godot.Core.HTTPClient.get_response_headers_as_dictionary

{-# NOINLINE bindHTTPClient_get_status #-}

-- | Returns a @enum Status@ constant. Need to call @method poll@ in order to get status updates.
bindHTTPClient_get_status :: MethodBind
bindHTTPClient_get_status
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "get_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @enum Status@ constant. Need to call @method poll@ in order to get status updates.
get_status :: (HTTPClient :< cls, Object :< cls) => cls -> IO Int
get_status cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_get_status (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "get_status" '[] (IO Int) where
        nodeMethod = Godot.Core.HTTPClient.get_status

{-# NOINLINE bindHTTPClient_has_response #-}

-- | If @true@, this @HTTPClient@ has a response available.
bindHTTPClient_has_response :: MethodBind
bindHTTPClient_has_response
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "has_response" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this @HTTPClient@ has a response available.
has_response ::
               (HTTPClient :< cls, Object :< cls) => cls -> IO Bool
has_response cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_has_response (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "has_response" '[] (IO Bool) where
        nodeMethod = Godot.Core.HTTPClient.has_response

{-# NOINLINE bindHTTPClient_is_blocking_mode_enabled #-}

-- | If @true@, execution will block until all data is read from the response.
bindHTTPClient_is_blocking_mode_enabled :: MethodBind
bindHTTPClient_is_blocking_mode_enabled
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "is_blocking_mode_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, execution will block until all data is read from the response.
is_blocking_mode_enabled ::
                           (HTTPClient :< cls, Object :< cls) => cls -> IO Bool
is_blocking_mode_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_is_blocking_mode_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "is_blocking_mode_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.HTTPClient.is_blocking_mode_enabled

{-# NOINLINE bindHTTPClient_is_response_chunked #-}

-- | If @true@, this @HTTPClient@ has a response that is chunked.
bindHTTPClient_is_response_chunked :: MethodBind
bindHTTPClient_is_response_chunked
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "is_response_chunked" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this @HTTPClient@ has a response that is chunked.
is_response_chunked ::
                      (HTTPClient :< cls, Object :< cls) => cls -> IO Bool
is_response_chunked cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_is_response_chunked
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "is_response_chunked" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.HTTPClient.is_response_chunked

{-# NOINLINE bindHTTPClient_poll #-}

-- | This needs to be called in order to have any request processed. Check results with @method get_status@.
bindHTTPClient_poll :: MethodBind
bindHTTPClient_poll
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This needs to be called in order to have any request processed. Check results with @method get_status@.
poll :: (HTTPClient :< cls, Object :< cls) => cls -> IO Int
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_poll (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "poll" '[] (IO Int) where
        nodeMethod = Godot.Core.HTTPClient.poll

{-# NOINLINE bindHTTPClient_query_string_from_dict #-}

-- | Generates a GET/POST application/x-www-form-urlencoded style query string from a provided dictionary, e.g.:
--   				
--   @
--   
--   				var fields = {"username": "user", "password": "pass"}
--   				var query_string = http_client.query_string_from_dict(fields)
--   				# Returns "username=user&password=pass"
--   				
--   @
--   
--   				Furthermore, if a key has a @null@ value, only the key itself is added, without equal sign and value. If the value is an array, for each value in it a pair with the same key is added.
--   				
--   @
--   
--   				var fields = {"single": 123, "not_valued": null, "multiple": @22, 33, 44@}
--   				var query_string = http_client.query_string_from_dict(fields)
--   				# Returns "single=123&not_valued&multiple=22&multiple=33&multiple=44"
--   				
--   @
bindHTTPClient_query_string_from_dict :: MethodBind
bindHTTPClient_query_string_from_dict
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "query_string_from_dict" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a GET/POST application/x-www-form-urlencoded style query string from a provided dictionary, e.g.:
--   				
--   @
--   
--   				var fields = {"username": "user", "password": "pass"}
--   				var query_string = http_client.query_string_from_dict(fields)
--   				# Returns "username=user&password=pass"
--   				
--   @
--   
--   				Furthermore, if a key has a @null@ value, only the key itself is added, without equal sign and value. If the value is an array, for each value in it a pair with the same key is added.
--   				
--   @
--   
--   				var fields = {"single": 123, "not_valued": null, "multiple": @22, 33, 44@}
--   				var query_string = http_client.query_string_from_dict(fields)
--   				# Returns "single=123&not_valued&multiple=22&multiple=33&multiple=44"
--   				
--   @
query_string_from_dict ::
                         (HTTPClient :< cls, Object :< cls) =>
                         cls -> Dictionary -> IO GodotString
query_string_from_dict cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_query_string_from_dict
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "query_string_from_dict"
           '[Dictionary]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.HTTPClient.query_string_from_dict

{-# NOINLINE bindHTTPClient_read_response_body_chunk #-}

-- | Reads one chunk from the response.
bindHTTPClient_read_response_body_chunk :: MethodBind
bindHTTPClient_read_response_body_chunk
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "read_response_body_chunk" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reads one chunk from the response.
read_response_body_chunk ::
                           (HTTPClient :< cls, Object :< cls) => cls -> IO PoolByteArray
read_response_body_chunk cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_read_response_body_chunk
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "read_response_body_chunk" '[]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.HTTPClient.read_response_body_chunk

{-# NOINLINE bindHTTPClient_request #-}

-- | Sends a request to the connected host. The URL parameter is just the part after the host, so for @http://somehost.com/index.php@, it is @index.php@.
--   				Headers are HTTP request headers. For available HTTP methods, see @enum Method@.
--   				To create a POST request with query strings to push to the server, do:
--   				
--   @
--   
--   				var fields = {"username" : "user", "password" : "pass"}
--   				var query_string = http_client.query_string_from_dict(fields)
--   				var headers = @"Content-Type: application/x-www-form-urlencoded", "Content-Length: " + str(query_string.length())@
--   				var result = http_client.request(http_client.METHOD_POST, "index.php", headers, query_string)
--   				
--   @
bindHTTPClient_request :: MethodBind
bindHTTPClient_request
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "request" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a request to the connected host. The URL parameter is just the part after the host, so for @http://somehost.com/index.php@, it is @index.php@.
--   				Headers are HTTP request headers. For available HTTP methods, see @enum Method@.
--   				To create a POST request with query strings to push to the server, do:
--   				
--   @
--   
--   				var fields = {"username" : "user", "password" : "pass"}
--   				var query_string = http_client.query_string_from_dict(fields)
--   				var headers = @"Content-Type: application/x-www-form-urlencoded", "Content-Length: " + str(query_string.length())@
--   				var result = http_client.request(http_client.METHOD_POST, "index.php", headers, query_string)
--   				
--   @
request ::
          (HTTPClient :< cls, Object :< cls) =>
          cls ->
            Int ->
              GodotString -> PoolStringArray -> Maybe GodotString -> IO Int
request cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       defaultedVariant VariantString "" arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_request (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "request"
           '[Int, GodotString, PoolStringArray, Maybe GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.HTTPClient.request

{-# NOINLINE bindHTTPClient_request_raw #-}

-- | Sends a raw request to the connected host. The URL parameter is just the part after the host, so for @http://somehost.com/index.php@, it is @index.php@.
--   				Headers are HTTP request headers. For available HTTP methods, see @enum Method@.
--   				Sends the body data raw, as a byte array and does not encode it in any way.
bindHTTPClient_request_raw :: MethodBind
bindHTTPClient_request_raw
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "request_raw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a raw request to the connected host. The URL parameter is just the part after the host, so for @http://somehost.com/index.php@, it is @index.php@.
--   				Headers are HTTP request headers. For available HTTP methods, see @enum Method@.
--   				Sends the body data raw, as a byte array and does not encode it in any way.
request_raw ::
              (HTTPClient :< cls, Object :< cls) =>
              cls ->
                Int -> GodotString -> PoolStringArray -> PoolByteArray -> IO Int
request_raw cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_request_raw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "request_raw"
           '[Int, GodotString, PoolStringArray, PoolByteArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.HTTPClient.request_raw

{-# NOINLINE bindHTTPClient_set_blocking_mode #-}

-- | If @true@, execution will block until all data is read from the response.
bindHTTPClient_set_blocking_mode :: MethodBind
bindHTTPClient_set_blocking_mode
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "set_blocking_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, execution will block until all data is read from the response.
set_blocking_mode ::
                    (HTTPClient :< cls, Object :< cls) => cls -> Bool -> IO ()
set_blocking_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_set_blocking_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "set_blocking_mode" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.HTTPClient.set_blocking_mode

{-# NOINLINE bindHTTPClient_set_connection #-}

-- | The connection to use for this client.
bindHTTPClient_set_connection :: MethodBind
bindHTTPClient_set_connection
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "set_connection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The connection to use for this client.
set_connection ::
                 (HTTPClient :< cls, Object :< cls) => cls -> StreamPeer -> IO ()
set_connection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_set_connection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "set_connection" '[StreamPeer]
           (IO ())
         where
        nodeMethod = Godot.Core.HTTPClient.set_connection

{-# NOINLINE bindHTTPClient_set_read_chunk_size #-}

-- | The size of the buffer used and maximum bytes to read per iteration. See @method read_response_body_chunk@.
bindHTTPClient_set_read_chunk_size :: MethodBind
bindHTTPClient_set_read_chunk_size
  = unsafePerformIO $
      withCString "HTTPClient" $
        \ clsNamePtr ->
          withCString "set_read_chunk_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the buffer used and maximum bytes to read per iteration. See @method read_response_body_chunk@.
set_read_chunk_size ::
                      (HTTPClient :< cls, Object :< cls) => cls -> Int -> IO ()
set_read_chunk_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHTTPClient_set_read_chunk_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HTTPClient "set_read_chunk_size" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.HTTPClient.set_read_chunk_size