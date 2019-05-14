{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeTexture
       (Godot.Core.VisualShaderNodeTexture._TYPE_DATA,
        Godot.Core.VisualShaderNodeTexture._SOURCE_2D_NORMAL,
        Godot.Core.VisualShaderNodeTexture._SOURCE_SCREEN,
        Godot.Core.VisualShaderNodeTexture._SOURCE_2D_TEXTURE,
        Godot.Core.VisualShaderNodeTexture._TYPE_COLOR,
        Godot.Core.VisualShaderNodeTexture._SOURCE_TEXTURE,
        Godot.Core.VisualShaderNodeTexture._TYPE_NORMALMAP,
        Godot.Core.VisualShaderNodeTexture.set_source,
        Godot.Core.VisualShaderNodeTexture.get_source,
        Godot.Core.VisualShaderNodeTexture.set_texture,
        Godot.Core.VisualShaderNodeTexture.get_texture,
        Godot.Core.VisualShaderNodeTexture.set_texture_type,
        Godot.Core.VisualShaderNodeTexture.get_texture_type)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_TYPE_DATA :: Int
_TYPE_DATA = 0

_SOURCE_2D_NORMAL :: Int
_SOURCE_2D_NORMAL = 3

_SOURCE_SCREEN :: Int
_SOURCE_SCREEN = 1

_SOURCE_2D_TEXTURE :: Int
_SOURCE_2D_TEXTURE = 2

_TYPE_COLOR :: Int
_TYPE_COLOR = 1

_SOURCE_TEXTURE :: Int
_SOURCE_TEXTURE = 0

_TYPE_NORMALMAP :: Int
_TYPE_NORMALMAP = 2

{-# NOINLINE bindVisualShaderNodeTexture_set_source #-}

bindVisualShaderNodeTexture_set_source :: MethodBind
bindVisualShaderNodeTexture_set_source
  = unsafePerformIO $
      withCString "VisualShaderNodeTexture" $
        \ clsNamePtr ->
          withCString "set_source" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_source ::
             (VisualShaderNodeTexture :< cls, Object :< cls) =>
             cls -> Int -> IO ()
set_source cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeTexture_set_source
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTexture_get_source #-}

bindVisualShaderNodeTexture_get_source :: MethodBind
bindVisualShaderNodeTexture_get_source
  = unsafePerformIO $
      withCString "VisualShaderNodeTexture" $
        \ clsNamePtr ->
          withCString "get_source" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_source ::
             (VisualShaderNodeTexture :< cls, Object :< cls) => cls -> IO Int
get_source cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeTexture_get_source
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTexture_set_texture #-}

bindVisualShaderNodeTexture_set_texture :: MethodBind
bindVisualShaderNodeTexture_set_texture
  = unsafePerformIO $
      withCString "VisualShaderNodeTexture" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_texture ::
              (VisualShaderNodeTexture :< cls, Object :< cls) =>
              cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeTexture_set_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTexture_get_texture #-}

bindVisualShaderNodeTexture_get_texture :: MethodBind
bindVisualShaderNodeTexture_get_texture
  = unsafePerformIO $
      withCString "VisualShaderNodeTexture" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_texture ::
              (VisualShaderNodeTexture :< cls, Object :< cls) =>
              cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeTexture_get_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTexture_set_texture_type #-}

bindVisualShaderNodeTexture_set_texture_type :: MethodBind
bindVisualShaderNodeTexture_set_texture_type
  = unsafePerformIO $
      withCString "VisualShaderNodeTexture" $
        \ clsNamePtr ->
          withCString "set_texture_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_texture_type ::
                   (VisualShaderNodeTexture :< cls, Object :< cls) =>
                   cls -> Int -> IO ()
set_texture_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeTexture_set_texture_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTexture_get_texture_type #-}

bindVisualShaderNodeTexture_get_texture_type :: MethodBind
bindVisualShaderNodeTexture_get_texture_type
  = unsafePerformIO $
      withCString "VisualShaderNodeTexture" $
        \ clsNamePtr ->
          withCString "get_texture_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_texture_type ::
                   (VisualShaderNodeTexture :< cls, Object :< cls) => cls -> IO Int
get_texture_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeTexture_get_texture_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)