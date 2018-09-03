module Godot.Core.GodotUPNPDevice where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern IGD_STATUS_INVALID_CONTROL :: Int

pattern IGD_STATUS_INVALID_CONTROL = 7

pattern IGD_STATUS_DISCONNECTED :: Int

pattern IGD_STATUS_DISCONNECTED = 5

pattern IGD_STATUS_OK :: Int

pattern IGD_STATUS_OK = 0

pattern IGD_STATUS_NO_URLS :: Int

pattern IGD_STATUS_NO_URLS = 3

pattern IGD_STATUS_MALLOC_ERROR :: Int

pattern IGD_STATUS_MALLOC_ERROR = 8

pattern IGD_STATUS_UNKNOWN_ERROR :: Int

pattern IGD_STATUS_UNKNOWN_ERROR = 9

pattern IGD_STATUS_HTTP_EMPTY :: Int

pattern IGD_STATUS_HTTP_EMPTY = 2

pattern IGD_STATUS_NO_IGD :: Int

pattern IGD_STATUS_NO_IGD = 4

pattern IGD_STATUS_UNKNOWN_DEVICE :: Int

pattern IGD_STATUS_UNKNOWN_DEVICE = 6

pattern IGD_STATUS_HTTP_ERROR :: Int

pattern IGD_STATUS_HTTP_ERROR = 1