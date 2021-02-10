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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindVisualShaderNodeCubeMap_get_cube_map #-}

-- | The [CubeMap] texture to sample when using [constant SOURCE_TEXTURE] as [member source].
bindVisualShaderNodeCubeMap_get_cube_map :: MethodBind
bindVisualShaderNodeCubeMap_get_cube_map
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "get_cube_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [CubeMap] texture to sample when using [constant SOURCE_TEXTURE] as [member source].
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

{-# NOINLINE bindVisualShaderNodeCubeMap_get_source #-}

-- | Defines which source should be used for the sampling. See [enum Source] for options.
bindVisualShaderNodeCubeMap_get_source :: MethodBind
bindVisualShaderNodeCubeMap_get_source
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "get_source" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines which source should be used for the sampling. See [enum Source] for options.
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

{-# NOINLINE bindVisualShaderNodeCubeMap_get_texture_type #-}

-- | Defines the type of data provided by the source texture. See [enum TextureType] for options.
bindVisualShaderNodeCubeMap_get_texture_type :: MethodBind
bindVisualShaderNodeCubeMap_get_texture_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "get_texture_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the type of data provided by the source texture. See [enum TextureType] for options.
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

{-# NOINLINE bindVisualShaderNodeCubeMap_set_cube_map #-}

-- | The [CubeMap] texture to sample when using [constant SOURCE_TEXTURE] as [member source].
bindVisualShaderNodeCubeMap_set_cube_map :: MethodBind
bindVisualShaderNodeCubeMap_set_cube_map
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "set_cube_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [CubeMap] texture to sample when using [constant SOURCE_TEXTURE] as [member source].
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

{-# NOINLINE bindVisualShaderNodeCubeMap_set_source #-}

-- | Defines which source should be used for the sampling. See [enum Source] for options.
bindVisualShaderNodeCubeMap_set_source :: MethodBind
bindVisualShaderNodeCubeMap_set_source
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "set_source" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines which source should be used for the sampling. See [enum Source] for options.
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

{-# NOINLINE bindVisualShaderNodeCubeMap_set_texture_type #-}

-- | Defines the type of data provided by the source texture. See [enum TextureType] for options.
bindVisualShaderNodeCubeMap_set_texture_type :: MethodBind
bindVisualShaderNodeCubeMap_set_texture_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCubeMap" $
        \ clsNamePtr ->
          withCString "set_texture_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines the type of data provided by the source texture. See [enum TextureType] for options.
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