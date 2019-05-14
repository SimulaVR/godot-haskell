{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualShaderNodeTextureUniform
       (Godot.Core.VisualShaderNodeTextureUniform._TYPE_DATA,
        Godot.Core.VisualShaderNodeTextureUniform._TYPE_ANISO,
        Godot.Core.VisualShaderNodeTextureUniform._COLOR_DEFAULT_WHITE,
        Godot.Core.VisualShaderNodeTextureUniform._TYPE_COLOR,
        Godot.Core.VisualShaderNodeTextureUniform._TYPE_NORMALMAP,
        Godot.Core.VisualShaderNodeTextureUniform._COLOR_DEFAULT_BLACK,
        Godot.Core.VisualShaderNodeTextureUniform.set_texture_type,
        Godot.Core.VisualShaderNodeTextureUniform.get_texture_type,
        Godot.Core.VisualShaderNodeTextureUniform.set_color_default,
        Godot.Core.VisualShaderNodeTextureUniform.get_color_default)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_TYPE_DATA :: Int
_TYPE_DATA = 0

_TYPE_ANISO :: Int
_TYPE_ANISO = 3

_COLOR_DEFAULT_WHITE :: Int
_COLOR_DEFAULT_WHITE = 0

_TYPE_COLOR :: Int
_TYPE_COLOR = 1

_TYPE_NORMALMAP :: Int
_TYPE_NORMALMAP = 2

_COLOR_DEFAULT_BLACK :: Int
_COLOR_DEFAULT_BLACK = 1

{-# NOINLINE bindVisualShaderNodeTextureUniform_set_texture_type
             #-}

bindVisualShaderNodeTextureUniform_set_texture_type :: MethodBind
bindVisualShaderNodeTextureUniform_set_texture_type
  = unsafePerformIO $
      withCString "VisualShaderNodeTextureUniform" $
        \ clsNamePtr ->
          withCString "set_texture_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_texture_type ::
                   (VisualShaderNodeTextureUniform :< cls, Object :< cls) =>
                   cls -> Int -> IO ()
set_texture_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTextureUniform_set_texture_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTextureUniform_get_texture_type
             #-}

bindVisualShaderNodeTextureUniform_get_texture_type :: MethodBind
bindVisualShaderNodeTextureUniform_get_texture_type
  = unsafePerformIO $
      withCString "VisualShaderNodeTextureUniform" $
        \ clsNamePtr ->
          withCString "get_texture_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_texture_type ::
                   (VisualShaderNodeTextureUniform :< cls, Object :< cls) =>
                   cls -> IO Int
get_texture_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTextureUniform_get_texture_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTextureUniform_set_color_default
             #-}

bindVisualShaderNodeTextureUniform_set_color_default :: MethodBind
bindVisualShaderNodeTextureUniform_set_color_default
  = unsafePerformIO $
      withCString "VisualShaderNodeTextureUniform" $
        \ clsNamePtr ->
          withCString "set_color_default" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_color_default ::
                    (VisualShaderNodeTextureUniform :< cls, Object :< cls) =>
                    cls -> Int -> IO ()
set_color_default cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTextureUniform_set_color_default
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualShaderNodeTextureUniform_get_color_default
             #-}

bindVisualShaderNodeTextureUniform_get_color_default :: MethodBind
bindVisualShaderNodeTextureUniform_get_color_default
  = unsafePerformIO $
      withCString "VisualShaderNodeTextureUniform" $
        \ clsNamePtr ->
          withCString "get_color_default" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_color_default ::
                    (VisualShaderNodeTextureUniform :< cls, Object :< cls) =>
                    cls -> IO Int
get_color_default cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeTextureUniform_get_color_default
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)