{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeCubeMap
       (Godot.Core.VisualShaderNodeCubeMap._TYPE_DATA,
        Godot.Core.VisualShaderNodeCubeMap._SOURCE_PORT,
        Godot.Core.VisualShaderNodeCubeMap._TYPE_COLOR,
        Godot.Core.VisualShaderNodeCubeMap._SOURCE_TEXTURE,
        Godot.Core.VisualShaderNodeCubeMap._TYPE_NORMALMAP,
        Godot.Core.VisualShaderNodeCubeMap.get_cube_map,
        Godot.Core.VisualShaderNodeCubeMap.get_source,
        Godot.Core.VisualShaderNodeCubeMap.get_texture_type,
        Godot.Core.VisualShaderNodeCubeMap.set_cube_map,
        Godot.Core.VisualShaderNodeCubeMap.set_source,
        Godot.Core.VisualShaderNodeCubeMap.set_texture_type)
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
import Godot.Core.VisualShaderNode()

_TYPE_DATA :: Int
_TYPE_DATA = 0

_SOURCE_PORT :: Int
_SOURCE_PORT = 1

_TYPE_COLOR :: Int
_TYPE_COLOR = 1

_SOURCE_TEXTURE :: Int
_SOURCE_TEXTURE = 0

_TYPE_NORMALMAP :: Int
_TYPE_NORMALMAP = 2

instance NodeProperty VisualShaderNodeCubeMap "cube_map" CubeMap
           'False
         where
        nodeProperty
          = (get_cube_map, wrapDroppingSetter set_cube_map, Nothing)

instance NodeProperty VisualShaderNodeCubeMap "source" Int 'False
         where
        nodeProperty = (get_source, wrapDroppingSetter set_source, Nothing)

instance NodeProperty VisualShaderNodeCubeMap "texture_type" Int
           'False
         where
        nodeProperty
          = (get_texture_type, wrapDroppingSetter set_texture_type, Nothing)

{-# NOINLINE bindVisualShaderNodeCubeMap_get_cube_map #-}

-- | The @CubeMap@ texture to sample when using @SOURCE_TEXTURE@ as @source@.
bindVisualShaderNodeCubeMap_get_cube_map :: MethodBind
bindVisualShaderNodeCubeMap_get_cube_map
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "get_cube_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @CubeMap@ texture to sample when using @SOURCE_TEXTURE@ as @source@.
get_cube_map ::
               (VisualShaderNodeCubeMap :< cls, Object :< cls) =>
               cls -> IO CubeMap
get_cube_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCubeMap_get_cube_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCubeMap "get_cube_map" '[]
           (IO CubeMap)
         where
        nodeMethod = Godot.Core.VisualShaderNodeCubeMap.get_cube_map

{-# NOINLINE bindVisualShaderNodeCubeMap_get_source #-}

-- | Defines which source should be used for the sampling. See @enum Source@ for options.
bindVisualShaderNodeCubeMap_get_source :: MethodBind
bindVisualShaderNodeCubeMap_get_source
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "get_source" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines which source should be used for the sampling. See @enum Source@ for options.
get_source ::
             (VisualShaderNodeCubeMap :< cls, Object :< cls) => cls -> IO Int
get_source cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCubeMap_get_source
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCubeMap "get_source" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeCubeMap.get_source

{-# NOINLINE bindVisualShaderNodeCubeMap_get_texture_type #-}

-- | Defines the type of data provided by the source texture. See @enum TextureType@ for options.
bindVisualShaderNodeCubeMap_get_texture_type :: MethodBind
bindVisualShaderNodeCubeMap_get_texture_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "get_texture_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the type of data provided by the source texture. See @enum TextureType@ for options.
get_texture_type ::
                   (VisualShaderNodeCubeMap :< cls, Object :< cls) => cls -> IO Int
get_texture_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCubeMap_get_texture_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCubeMap "get_texture_type" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeCubeMap.get_texture_type

{-# NOINLINE bindVisualShaderNodeCubeMap_set_cube_map #-}

-- | The @CubeMap@ texture to sample when using @SOURCE_TEXTURE@ as @source@.
bindVisualShaderNodeCubeMap_set_cube_map :: MethodBind
bindVisualShaderNodeCubeMap_set_cube_map
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "set_cube_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @CubeMap@ texture to sample when using @SOURCE_TEXTURE@ as @source@.
set_cube_map ::
               (VisualShaderNodeCubeMap :< cls, Object :< cls) =>
               cls -> CubeMap -> IO ()
set_cube_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCubeMap_set_cube_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCubeMap "set_cube_map"
           '[CubeMap]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeCubeMap.set_cube_map

{-# NOINLINE bindVisualShaderNodeCubeMap_set_source #-}

-- | Defines which source should be used for the sampling. See @enum Source@ for options.
bindVisualShaderNodeCubeMap_set_source :: MethodBind
bindVisualShaderNodeCubeMap_set_source
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "set_source" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines which source should be used for the sampling. See @enum Source@ for options.
set_source ::
             (VisualShaderNodeCubeMap :< cls, Object :< cls) =>
             cls -> Int -> IO ()
set_source cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCubeMap_set_source
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCubeMap "set_source" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeCubeMap.set_source

{-# NOINLINE bindVisualShaderNodeCubeMap_set_texture_type #-}

-- | Defines the type of data provided by the source texture. See @enum TextureType@ for options.
bindVisualShaderNodeCubeMap_set_texture_type :: MethodBind
bindVisualShaderNodeCubeMap_set_texture_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "set_texture_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the type of data provided by the source texture. See @enum TextureType@ for options.
set_texture_type ::
                   (VisualShaderNodeCubeMap :< cls, Object :< cls) =>
                   cls -> Int -> IO ()
set_texture_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCubeMap_set_texture_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCubeMap "set_texture_type"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeCubeMap.set_texture_type