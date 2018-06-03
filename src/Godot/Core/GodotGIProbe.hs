module Godot.Core.GodotGIProbe where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern SUBDIV_64 :: Int

pattern SUBDIV_64 = 0

pattern SUBDIV_256 :: Int

pattern SUBDIV_256 = 2

pattern SUBDIV_MAX :: Int

pattern SUBDIV_MAX = 4

pattern SUBDIV_128 :: Int

pattern SUBDIV_128 = 1

pattern SUBDIV_512 :: Int

pattern SUBDIV_512 = 3