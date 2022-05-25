{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Shader
       (Godot.Core.Shader._MODE_CANVAS_ITEM,
        Godot.Core.Shader._MODE_SPATIAL, Godot.Core.Shader._MODE_PARTICLES,
        Godot.Core.Shader.get_code,
        Godot.Core.Shader.get_default_texture_param,
        Godot.Core.Shader.get_mode, Godot.Core.Shader.has_param,
        Godot.Core.Shader.set_code,
        Godot.Core.Shader.set_default_texture_param)
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
import Godot.Core.Resource()

_MODE_CANVAS_ITEM :: Int
_MODE_CANVAS_ITEM = 1

_MODE_SPATIAL :: Int
_MODE_SPATIAL = 0

_MODE_PARTICLES :: Int
_MODE_PARTICLES = 2

instance NodeProperty Shader "code" GodotString 'False where
        nodeProperty = (get_code, wrapDroppingSetter set_code, Nothing)

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

instance NodeMethod Shader "get_code" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Shader.get_code

{-# NOINLINE bindShader_get_default_texture_param #-}

-- | Returns the texture that is set as default for the specified parameter.
--   				__Note:__ @param@ must match the name of the uniform in the code exactly.
bindShader_get_default_texture_param :: MethodBind
bindShader_get_default_texture_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "get_default_texture_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the texture that is set as default for the specified parameter.
--   				__Note:__ @param@ must match the name of the uniform in the code exactly.
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

instance NodeMethod Shader "get_default_texture_param"
           '[GodotString]
           (IO Texture)
         where
        nodeMethod = Godot.Core.Shader.get_default_texture_param

{-# NOINLINE bindShader_get_mode #-}

-- | Returns the shader mode for the shader, either @MODE_CANVAS_ITEM@, @MODE_SPATIAL@ or @MODE_PARTICLES@.
bindShader_get_mode :: MethodBind
bindShader_get_mode
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shader mode for the shader, either @MODE_CANVAS_ITEM@, @MODE_SPATIAL@ or @MODE_PARTICLES@.
get_mode :: (Shader :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_get_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Shader "get_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Shader.get_mode

{-# NOINLINE bindShader_has_param #-}

-- | Returns @true@ if the shader has this param defined as a uniform in its code.
--   				__Note:__ @param@ must match the name of the uniform in the code exactly.
bindShader_has_param :: MethodBind
bindShader_has_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "has_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the shader has this param defined as a uniform in its code.
--   				__Note:__ @param@ must match the name of the uniform in the code exactly.
has_param ::
            (Shader :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShader_has_param (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Shader "has_param" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.Shader.has_param

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

instance NodeMethod Shader "set_code" '[GodotString] (IO ()) where
        nodeMethod = Godot.Core.Shader.set_code

{-# NOINLINE bindShader_set_default_texture_param #-}

-- | Sets the default texture to be used with a texture uniform. The default is used if a texture is not set in the @ShaderMaterial@.
--   				__Note:__ @param@ must match the name of the uniform in the code exactly.
bindShader_set_default_texture_param :: MethodBind
bindShader_set_default_texture_param
  = unsafePerformIO $
      withCString "Shader" $
        \ clsNamePtr ->
          withCString "set_default_texture_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default texture to be used with a texture uniform. The default is used if a texture is not set in the @ShaderMaterial@.
--   				__Note:__ @param@ must match the name of the uniform in the code exactly.
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

instance NodeMethod Shader "set_default_texture_param"
           '[GodotString, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.Shader.set_default_texture_param