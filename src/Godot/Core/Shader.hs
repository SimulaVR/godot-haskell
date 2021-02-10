{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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

-- | Returns the shader's code as the user has written it, not the full generated code used internally.
bindShader_get_code :: MethodBind
bindShader_get_code
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "get_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shader's code as the user has written it, not the full generated code used internally.
get_code :: (Shader :< cls, Object :< cls) => cls -> IO GodotString
get_code cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_get_code (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_get_default_texture_param #-}

-- | Returns the texture that is set as default for the specified parameter.
--   				[b]Note:[/b] [code]param[/code] must match the name of the uniform in the code exactly.
bindShader_get_default_texture_param :: MethodBind
bindShader_get_default_texture_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "get_default_texture_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the texture that is set as default for the specified parameter.
--   				[b]Note:[/b] [code]param[/code] must match the name of the uniform in the code exactly.
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

-- | Returns the shader mode for the shader, either [constant MODE_CANVAS_ITEM], [constant MODE_SPATIAL] or [constant MODE_PARTICLES].
bindShader_get_mode :: MethodBind
bindShader_get_mode
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shader mode for the shader, either [constant MODE_CANVAS_ITEM], [constant MODE_SPATIAL] or [constant MODE_PARTICLES].
get_mode :: (Shader :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_get_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_has_param #-}

-- | Returns [code]true[/code] if the shader has this param defined as a uniform in its code.
--   				[b]Note:[/b] [code]param[/code] must match the name of the uniform in the code exactly.
bindShader_has_param :: MethodBind
bindShader_has_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "has_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the shader has this param defined as a uniform in its code.
--   				[b]Note:[/b] [code]param[/code] must match the name of the uniform in the code exactly.
has_param ::
            (Shader :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_has_param (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_set_code #-}

-- | Returns the shader's code as the user has written it, not the full generated code used internally.
bindShader_set_code :: MethodBind
bindShader_set_code
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "set_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shader's code as the user has written it, not the full generated code used internally.
set_code ::
           (Shader :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_code cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_set_code (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShader_set_default_texture_param #-}

-- | Sets the default texture to be used with a texture uniform. The default is used if a texture is not set in the [ShaderMaterial].
--   				[b]Note:[/b] [code]param[/code] must match the name of the uniform in the code exactly.
bindShader_set_default_texture_param :: MethodBind
bindShader_set_default_texture_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "set_default_texture_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default texture to be used with a texture uniform. The default is used if a texture is not set in the [ShaderMaterial].
--   				[b]Note:[/b] [code]param[/code] must match the name of the uniform in the code exactly.
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