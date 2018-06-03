module Godot.Core.GodotBackBufferCopy where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api

pattern COPY_MODE_VIEWPORT :: Int

pattern COPY_MODE_VIEWPORT = 2

pattern COPY_MODE_RECT :: Int

pattern COPY_MODE_RECT = 1

pattern COPY_MODE_DISABLED :: Int

pattern COPY_MODE_DISABLED = 0