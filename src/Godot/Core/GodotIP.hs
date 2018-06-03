module Godot.Core.GodotIP where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern RESOLVER_INVALID_ID :: Int

pattern RESOLVER_INVALID_ID = -1

pattern TYPE_NONE :: Int

pattern TYPE_NONE = 0

pattern RESOLVER_STATUS_WAITING :: Int

pattern RESOLVER_STATUS_WAITING = 1

pattern TYPE_IPV4 :: Int

pattern TYPE_IPV4 = 1

pattern RESOLVER_STATUS_ERROR :: Int

pattern RESOLVER_STATUS_ERROR = 3

pattern RESOLVER_STATUS_DONE :: Int

pattern RESOLVER_STATUS_DONE = 2

pattern RESOLVER_STATUS_NONE :: Int

pattern RESOLVER_STATUS_NONE = 0

pattern TYPE_IPV6 :: Int

pattern TYPE_IPV6 = 2

pattern RESOLVER_MAX_QUERIES :: Int

pattern RESOLVER_MAX_QUERIES = 32

pattern TYPE_ANY :: Int

pattern TYPE_ANY = 3