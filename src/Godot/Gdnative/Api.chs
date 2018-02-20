module Godot.Gdnative.Api where

import Data.Coerce
import Foreign
import Foreign.C

{#import Godot.Gdnative.Gdnative#}

#include "gdnative_api_struct.gen.h"

{#fun godot_gdnative_core_api_struct->godot_color_new_rgb
  { coerce `GodotGdnativeCoreApiStruct'
  , allocaOpaque- `GodotColor'
  , `Float'
  , `Float'
  , `Float' } -> `()' #}
