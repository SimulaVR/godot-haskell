module Godot.Core.GodotVisualShaderNodeCompare where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern FUNC_LESS_THAN_EQUAL :: Int

pattern FUNC_LESS_THAN_EQUAL = 5

pattern FUNC_GREATER_THAN :: Int

pattern FUNC_GREATER_THAN = 2

pattern CTYPE_BOOLEAN :: Int

pattern CTYPE_BOOLEAN = 2

pattern CTYPE_VECTOR :: Int

pattern CTYPE_VECTOR = 1

pattern FUNC_NOT_EQUAL :: Int

pattern FUNC_NOT_EQUAL = 1

pattern FUNC_GREATER_THAN_EQUAL :: Int

pattern FUNC_GREATER_THAN_EQUAL = 3

pattern FUNC_LESS_THAN :: Int

pattern FUNC_LESS_THAN = 4

pattern COND_ALL :: Int

pattern COND_ALL = 0

pattern CTYPE_TRANSFORM :: Int

pattern CTYPE_TRANSFORM = 3

pattern CTYPE_SCALAR :: Int

pattern CTYPE_SCALAR = 0

pattern COND_ANY :: Int

pattern COND_ANY = 1

pattern FUNC_EQUAL :: Int

pattern FUNC_EQUAL = 0