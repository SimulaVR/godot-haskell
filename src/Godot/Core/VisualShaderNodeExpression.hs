{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeExpression
       (Godot.Core.VisualShaderNodeExpression.get_expression,
        Godot.Core.VisualShaderNodeExpression.set_expression)
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
import Godot.Core.VisualShaderNodeGroupBase()

instance NodeProperty VisualShaderNodeExpression "expression"
           GodotString
           'False
         where
        nodeProperty
          = (get_expression, wrapDroppingSetter set_expression, Nothing)

{-# NOINLINE bindVisualShaderNodeExpression_get_expression #-}

-- | An expression in Godot Shading Language, which will be injected at the start of the graph's matching shader function (@vertex@, @fragment@, or @light@), and thus cannot be used to declare functions, varyings, uniforms, or global constants.
bindVisualShaderNodeExpression_get_expression :: MethodBind
bindVisualShaderNodeExpression_get_expression
  = unsafePerformIO $
      withCString "VisualShaderNodeExpression" $
        \ clsNamePtr ->
          withCString "get_expression" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | An expression in Godot Shading Language, which will be injected at the start of the graph's matching shader function (@vertex@, @fragment@, or @light@), and thus cannot be used to declare functions, varyings, uniforms, or global constants.
get_expression ::
                 (VisualShaderNodeExpression :< cls, Object :< cls) =>
                 cls -> IO GodotString
get_expression cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeExpression_get_expression
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeExpression "get_expression" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualShaderNodeExpression.get_expression

{-# NOINLINE bindVisualShaderNodeExpression_set_expression #-}

-- | An expression in Godot Shading Language, which will be injected at the start of the graph's matching shader function (@vertex@, @fragment@, or @light@), and thus cannot be used to declare functions, varyings, uniforms, or global constants.
bindVisualShaderNodeExpression_set_expression :: MethodBind
bindVisualShaderNodeExpression_set_expression
  = unsafePerformIO $
      withCString "VisualShaderNodeExpression" $
        \ clsNamePtr ->
          withCString "set_expression" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | An expression in Godot Shading Language, which will be injected at the start of the graph's matching shader function (@vertex@, @fragment@, or @light@), and thus cannot be used to declare functions, varyings, uniforms, or global constants.
set_expression ::
                 (VisualShaderNodeExpression :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
set_expression cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeExpression_set_expression
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeExpression "set_expression"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeExpression.set_expression