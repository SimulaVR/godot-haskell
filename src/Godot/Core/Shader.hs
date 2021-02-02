{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Shader
       (Godot.Core.Shader._MODE_CANVAS_ITEM,
        Godot.Core.Shader._MODE_PARTICLES, Godot.Core.Shader._MODE_SPATIAL,
        Godot.Core.Shader.get_code,
        Godot.Core.Shader.get_default_texture_param,
        Godot.Core.Shader.get_mode, Godot.Core.Shader.has_param,
        Godot.Core.Shader.set_code,
        Godot.Core.Shader.set_default_texture_param)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MODE_CANVAS_ITEM :: Int
_MODE_CANVAS_ITEM = 1

_MODE_PARTICLES :: Int
_MODE_PARTICLES = 2

_MODE_SPATIAL :: Int
_MODE_SPATIAL = 0

{-# NOINLINE bindShader_get_code #-}

bindShader_get_code :: MethodBind
bindShader_get_code
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "get_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_code :: (Shader :< cls, Object :< cls) => cls -> IO GodotString
get_code cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_get_code (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_get_default_texture_param #-}

bindShader_get_default_texture_param :: MethodBind
bindShader_get_default_texture_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "get_default_texture_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_default_texture_param ::
                            (Shader :< cls, Object :< cls) => cls -> GodotString -> IO Texture
get_default_texture_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_get_default_texture_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_get_mode #-}

-- | Returns the shader mode for the shader, either [constant MODE_CANVAS_ITEM], [constant MODE_SPATIAL] or [constant MODE_PARTICLES]
bindShader_get_mode :: MethodBind
bindShader_get_mode
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shader mode for the shader, either [constant MODE_CANVAS_ITEM], [constant MODE_SPATIAL] or [constant MODE_PARTICLES]
get_mode :: (Shader :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_get_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_has_param #-}

bindShader_has_param :: MethodBind
bindShader_has_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "has_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_param ::
            (Shader :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_has_param (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_set_code #-}

bindShader_set_code :: MethodBind
bindShader_set_code
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "set_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_code ::
           (Shader :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_code cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_set_code (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_set_default_texture_param #-}

bindShader_set_default_texture_param :: MethodBind
bindShader_set_default_texture_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "set_default_texture_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_default_texture_param ::
                            (Shader :< cls, Object :< cls) =>
                            cls -> GodotString -> Texture -> IO ()
set_default_texture_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_set_default_texture_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)