{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeUniform
       (Godot.Core.VisualShaderNodeUniform.get_uniform_name,
        Godot.Core.VisualShaderNodeUniform.set_uniform_name)
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

instance NodeProperty VisualShaderNodeUniform "uniform_name"
           GodotString
           'False
         where
        nodeProperty
          = (get_uniform_name, wrapDroppingSetter set_uniform_name, Nothing)

{-# NOINLINE bindVisualShaderNodeUniform_get_uniform_name #-}

-- | Name of the uniform, by which it can be accessed through the @ShaderMaterial@ properties.
bindVisualShaderNodeUniform_get_uniform_name :: MethodBind
bindVisualShaderNodeUniform_get_uniform_name
  = unsafePerformIO $
      withCString "VisualShaderNodeUniform" $
        \ clsNamePtr ->
          withCString "get_uniform_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the uniform, by which it can be accessed through the @ShaderMaterial@ properties.
get_uniform_name ::
                   (VisualShaderNodeUniform :< cls, Object :< cls) =>
                   cls -> IO GodotString
get_uniform_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeUniform_get_uniform_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeUniform "get_uniform_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualShaderNodeUniform.get_uniform_name

{-# NOINLINE bindVisualShaderNodeUniform_set_uniform_name #-}

-- | Name of the uniform, by which it can be accessed through the @ShaderMaterial@ properties.
bindVisualShaderNodeUniform_set_uniform_name :: MethodBind
bindVisualShaderNodeUniform_set_uniform_name
  = unsafePerformIO $
      withCString "VisualShaderNodeUniform" $
        \ clsNamePtr ->
          withCString "set_uniform_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the uniform, by which it can be accessed through the @ShaderMaterial@ properties.
set_uniform_name ::
                   (VisualShaderNodeUniform :< cls, Object :< cls) =>
                   cls -> GodotString -> IO ()
set_uniform_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeUniform_set_uniform_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeUniform "set_uniform_name"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeUniform.set_uniform_name