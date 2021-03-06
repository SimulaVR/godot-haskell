{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Performance
       (Godot.Core.Performance._PHYSICS_2D_ISLAND_COUNT,
        Godot.Core.Performance._OBJECT_RESOURCE_COUNT,
        Godot.Core.Performance._RENDER_VERTEX_MEM_USED,
        Godot.Core.Performance._PHYSICS_3D_ISLAND_COUNT,
        Godot.Core.Performance._PHYSICS_2D_COLLISION_PAIRS,
        Godot.Core.Performance._MEMORY_STATIC_MAX,
        Godot.Core.Performance._TIME_PHYSICS_PROCESS,
        Godot.Core.Performance._RENDER_TEXTURE_MEM_USED,
        Godot.Core.Performance._MEMORY_DYNAMIC_MAX,
        Godot.Core.Performance._OBJECT_ORPHAN_NODE_COUNT,
        Godot.Core.Performance._MEMORY_DYNAMIC,
        Godot.Core.Performance._RENDER_MATERIAL_CHANGES_IN_FRAME,
        Godot.Core.Performance._OBJECT_NODE_COUNT,
        Godot.Core.Performance._AUDIO_OUTPUT_LATENCY,
        Godot.Core.Performance._RENDER_OBJECTS_IN_FRAME,
        Godot.Core.Performance._RENDER_DRAW_CALLS_IN_FRAME,
        Godot.Core.Performance._TIME_PROCESS,
        Godot.Core.Performance._MEMORY_MESSAGE_BUFFER_MAX,
        Godot.Core.Performance._PHYSICS_3D_COLLISION_PAIRS,
        Godot.Core.Performance._RENDER_SHADER_CHANGES_IN_FRAME,
        Godot.Core.Performance._MONITOR_MAX,
        Godot.Core.Performance._TIME_FPS,
        Godot.Core.Performance._PHYSICS_2D_ACTIVE_OBJECTS,
        Godot.Core.Performance._RENDER_SURFACE_CHANGES_IN_FRAME,
        Godot.Core.Performance._RENDER_VIDEO_MEM_USED,
        Godot.Core.Performance._MEMORY_STATIC,
        Godot.Core.Performance._RENDER_VERTICES_IN_FRAME,
        Godot.Core.Performance._OBJECT_COUNT,
        Godot.Core.Performance._PHYSICS_3D_ACTIVE_OBJECTS,
        Godot.Core.Performance._RENDER_USAGE_VIDEO_MEM_TOTAL,
        Godot.Core.Performance.get_monitor)
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
import Godot.Core.Object()

_PHYSICS_2D_ISLAND_COUNT :: Int
_PHYSICS_2D_ISLAND_COUNT = 24

_OBJECT_RESOURCE_COUNT :: Int
_OBJECT_RESOURCE_COUNT = 9

_RENDER_VERTEX_MEM_USED :: Int
_RENDER_VERTEX_MEM_USED = 20

_PHYSICS_3D_ISLAND_COUNT :: Int
_PHYSICS_3D_ISLAND_COUNT = 27

_PHYSICS_2D_COLLISION_PAIRS :: Int
_PHYSICS_2D_COLLISION_PAIRS = 23

_MEMORY_STATIC_MAX :: Int
_MEMORY_STATIC_MAX = 5

_TIME_PHYSICS_PROCESS :: Int
_TIME_PHYSICS_PROCESS = 2

_RENDER_TEXTURE_MEM_USED :: Int
_RENDER_TEXTURE_MEM_USED = 19

_MEMORY_DYNAMIC_MAX :: Int
_MEMORY_DYNAMIC_MAX = 6

_OBJECT_ORPHAN_NODE_COUNT :: Int
_OBJECT_ORPHAN_NODE_COUNT = 11

_MEMORY_DYNAMIC :: Int
_MEMORY_DYNAMIC = 4

_RENDER_MATERIAL_CHANGES_IN_FRAME :: Int
_RENDER_MATERIAL_CHANGES_IN_FRAME = 14

_OBJECT_NODE_COUNT :: Int
_OBJECT_NODE_COUNT = 10

_AUDIO_OUTPUT_LATENCY :: Int
_AUDIO_OUTPUT_LATENCY = 28

_RENDER_OBJECTS_IN_FRAME :: Int
_RENDER_OBJECTS_IN_FRAME = 12

_RENDER_DRAW_CALLS_IN_FRAME :: Int
_RENDER_DRAW_CALLS_IN_FRAME = 17

_TIME_PROCESS :: Int
_TIME_PROCESS = 1

_MEMORY_MESSAGE_BUFFER_MAX :: Int
_MEMORY_MESSAGE_BUFFER_MAX = 7

_PHYSICS_3D_COLLISION_PAIRS :: Int
_PHYSICS_3D_COLLISION_PAIRS = 26

_RENDER_SHADER_CHANGES_IN_FRAME :: Int
_RENDER_SHADER_CHANGES_IN_FRAME = 15

_MONITOR_MAX :: Int
_MONITOR_MAX = 29

_TIME_FPS :: Int
_TIME_FPS = 0

_PHYSICS_2D_ACTIVE_OBJECTS :: Int
_PHYSICS_2D_ACTIVE_OBJECTS = 22

_RENDER_SURFACE_CHANGES_IN_FRAME :: Int
_RENDER_SURFACE_CHANGES_IN_FRAME = 16

_RENDER_VIDEO_MEM_USED :: Int
_RENDER_VIDEO_MEM_USED = 18

_MEMORY_STATIC :: Int
_MEMORY_STATIC = 3

_RENDER_VERTICES_IN_FRAME :: Int
_RENDER_VERTICES_IN_FRAME = 13

_OBJECT_COUNT :: Int
_OBJECT_COUNT = 8

_PHYSICS_3D_ACTIVE_OBJECTS :: Int
_PHYSICS_3D_ACTIVE_OBJECTS = 25

_RENDER_USAGE_VIDEO_MEM_TOTAL :: Int
_RENDER_USAGE_VIDEO_MEM_TOTAL = 21

{-# NOINLINE bindPerformance_get_monitor #-}

-- | Returns the value of one of the available monitors. You should provide one of the @enum Monitor@ constants as the argument, like this:
--   				
--   @
--   
--   				print(Performance.get_monitor(Performance.TIME_FPS)) # Prints the FPS to the console
--   				
--   @
bindPerformance_get_monitor :: MethodBind
bindPerformance_get_monitor
  = unsafePerformIO $
      withCString "Performance" $
        \ clsNamePtr ->
          withCString "get_monitor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of one of the available monitors. You should provide one of the @enum Monitor@ constants as the argument, like this:
--   				
--   @
--   
--   				print(Performance.get_monitor(Performance.TIME_FPS)) # Prints the FPS to the console
--   				
--   @
get_monitor ::
              (Performance :< cls, Object :< cls) => cls -> Int -> IO Float
get_monitor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPerformance_get_monitor (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Performance "get_monitor" '[Int] (IO Float)
         where
        nodeMethod = Godot.Core.Performance.get_monitor