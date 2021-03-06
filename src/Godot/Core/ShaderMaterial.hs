{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ShaderMaterial
       (Godot.Core.ShaderMaterial._shader_changed,
        Godot.Core.ShaderMaterial.get_shader,
        Godot.Core.ShaderMaterial.get_shader_param,
        Godot.Core.ShaderMaterial.property_can_revert,
        Godot.Core.ShaderMaterial.property_get_revert,
        Godot.Core.ShaderMaterial.set_shader,
        Godot.Core.ShaderMaterial.set_shader_param)
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
import Godot.Core.Material()

instance NodeProperty ShaderMaterial "shader" Shader 'False where
        nodeProperty = (get_shader, wrapDroppingSetter set_shader, Nothing)

{-# NOINLINE bindShaderMaterial__shader_changed #-}

bindShaderMaterial__shader_changed :: MethodBind
bindShaderMaterial__shader_changed
  = unsafePerformIO $
      withCString "ShaderMaterial" $
        \ clsNamePtr ->
          withCString "_shader_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_shader_changed ::
                  (ShaderMaterial :< cls, Object :< cls) => cls -> IO ()
_shader_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShaderMaterial__shader_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ShaderMaterial "_shader_changed" '[] (IO ())
         where
        nodeMethod = Godot.Core.ShaderMaterial._shader_changed

{-# NOINLINE bindShaderMaterial_get_shader #-}

-- | The @Shader@ program used to render this material.
bindShaderMaterial_get_shader :: MethodBind
bindShaderMaterial_get_shader
  = unsafePerformIO $
      withCString "ShaderMaterial" $
        \ clsNamePtr ->
          withCString "get_shader" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Shader@ program used to render this material.
get_shader ::
             (ShaderMaterial :< cls, Object :< cls) => cls -> IO Shader
get_shader cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShaderMaterial_get_shader (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ShaderMaterial "get_shader" '[] (IO Shader)
         where
        nodeMethod = Godot.Core.ShaderMaterial.get_shader

{-# NOINLINE bindShaderMaterial_get_shader_param #-}

-- | Returns the current value set for this material of a uniform in the shader.
bindShaderMaterial_get_shader_param :: MethodBind
bindShaderMaterial_get_shader_param
  = unsafePerformIO $
      withCString "ShaderMaterial" $
        \ clsNamePtr ->
          withCString "get_shader_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current value set for this material of a uniform in the shader.
get_shader_param ::
                   (ShaderMaterial :< cls, Object :< cls) =>
                   cls -> GodotString -> IO GodotVariant
get_shader_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShaderMaterial_get_shader_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ShaderMaterial "get_shader_param"
           '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.ShaderMaterial.get_shader_param

{-# NOINLINE bindShaderMaterial_property_can_revert #-}

-- | Returns @true@ if the property identified by @name@ can be reverted to a default value.
bindShaderMaterial_property_can_revert :: MethodBind
bindShaderMaterial_property_can_revert
  = unsafePerformIO $
      withCString "ShaderMaterial" $
        \ clsNamePtr ->
          withCString "property_can_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the property identified by @name@ can be reverted to a default value.
property_can_revert ::
                      (ShaderMaterial :< cls, Object :< cls) =>
                      cls -> GodotString -> IO Bool
property_can_revert cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShaderMaterial_property_can_revert
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ShaderMaterial "property_can_revert"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ShaderMaterial.property_can_revert

{-# NOINLINE bindShaderMaterial_property_get_revert #-}

-- | Returns the default value of the material property with given @name@.
bindShaderMaterial_property_get_revert :: MethodBind
bindShaderMaterial_property_get_revert
  = unsafePerformIO $
      withCString "ShaderMaterial" $
        \ clsNamePtr ->
          withCString "property_get_revert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the default value of the material property with given @name@.
property_get_revert ::
                      (ShaderMaterial :< cls, Object :< cls) =>
                      cls -> GodotString -> IO GodotVariant
property_get_revert cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShaderMaterial_property_get_revert
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ShaderMaterial "property_get_revert"
           '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.ShaderMaterial.property_get_revert

{-# NOINLINE bindShaderMaterial_set_shader #-}

-- | The @Shader@ program used to render this material.
bindShaderMaterial_set_shader :: MethodBind
bindShaderMaterial_set_shader
  = unsafePerformIO $
      withCString "ShaderMaterial" $
        \ clsNamePtr ->
          withCString "set_shader" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Shader@ program used to render this material.
set_shader ::
             (ShaderMaterial :< cls, Object :< cls) => cls -> Shader -> IO ()
set_shader cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShaderMaterial_set_shader (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ShaderMaterial "set_shader" '[Shader] (IO ())
         where
        nodeMethod = Godot.Core.ShaderMaterial.set_shader

{-# NOINLINE bindShaderMaterial_set_shader_param #-}

-- | Changes the value set for this material of a uniform in the shader. __Note:__ @param@ must match the name of the uniform in the code exactly.
bindShaderMaterial_set_shader_param :: MethodBind
bindShaderMaterial_set_shader_param
  = unsafePerformIO $
      withCString "ShaderMaterial" $
        \ clsNamePtr ->
          withCString "set_shader_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the value set for this material of a uniform in the shader. __Note:__ @param@ must match the name of the uniform in the code exactly.
set_shader_param ::
                   (ShaderMaterial :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotVariant -> IO ()
set_shader_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShaderMaterial_set_shader_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ShaderMaterial "set_shader_param"
           '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.ShaderMaterial.set_shader_param