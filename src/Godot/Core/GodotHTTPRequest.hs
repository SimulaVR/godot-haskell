module Godot.Core.GodotHTTPRequest where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern RESULT_CANT_RESOLVE :: Int

pattern RESULT_CANT_RESOLVE = 3

pattern RESULT_CONNECTION_ERROR :: Int

pattern RESULT_CONNECTION_ERROR = 4

pattern RESULT_REDIRECT_LIMIT_REACHED :: Int

pattern RESULT_REDIRECT_LIMIT_REACHED = 11

pattern RESULT_DOWNLOAD_FILE_WRITE_ERROR :: Int

pattern RESULT_DOWNLOAD_FILE_WRITE_ERROR = 10

pattern RESULT_TIMEOUT :: Int

pattern RESULT_TIMEOUT = 12

pattern RESULT_NO_RESPONSE :: Int

pattern RESULT_NO_RESPONSE = 6

pattern RESULT_REQUEST_FAILED :: Int

pattern RESULT_REQUEST_FAILED = 8

pattern RESULT_CANT_CONNECT :: Int

pattern RESULT_CANT_CONNECT = 2

pattern RESULT_SUCCESS :: Int

pattern RESULT_SUCCESS = 0

pattern RESULT_DOWNLOAD_FILE_CANT_OPEN :: Int

pattern RESULT_DOWNLOAD_FILE_CANT_OPEN = 9

pattern RESULT_BODY_SIZE_LIMIT_EXCEEDED :: Int

pattern RESULT_BODY_SIZE_LIMIT_EXCEEDED = 7

pattern RESULT_SSL_HANDSHAKE_ERROR :: Int

pattern RESULT_SSL_HANDSHAKE_ERROR = 5

pattern RESULT_CHUNKED_BODY_SIZE_MISMATCH :: Int

pattern RESULT_CHUNKED_BODY_SIZE_MISMATCH = 1

request_completed :: Signal GodotHTTPRequest
request_completed = Signal "request_completed"