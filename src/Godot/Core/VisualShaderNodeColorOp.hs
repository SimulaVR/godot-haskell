{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeColorOp
       (Godot.Core.VisualShaderNodeColorOp._OP_SCREEN,
        Godot.Core.VisualShaderNodeColorOp._OP_SOFT_LIGHT,
        Godot.Core.VisualShaderNodeColorOp._OP_DODGE,
        Godot.Core.VisualShaderNodeColorOp._OP_BURN,
        Godot.Core.VisualShaderNodeColorOp._OP_HARD_LIGHT,
        Godot.Core.VisualShaderNodeColorOp._OP_DARKEN,
        Godot.Core.VisualShaderNodeColorOp._OP_DIFFERENCE,
        Godot.Core.VisualShaderNodeColorOp._OP_OVERLAY,
        Godot.Core.VisualShaderNodeColorOp._OP_LIGHTEN,
        Godot.Core.VisualShaderNodeColorOp.get_operator,
        Godot.Core.VisualShaderNodeColorOp.set_operator)
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

_OP_SCREEN :: Int
_OP_SCREEN = 0

_OP_SOFT_LIGHT :: Int
_OP_SOFT_LIGHT = 7

_OP_DODGE :: Int
_OP_DODGE = 5

_OP_BURN :: Int
_OP_BURN = 6

_OP_HARD_LIGHT :: Int
_OP_HARD_LIGHT = 8

_OP_DARKEN :: Int
_OP_DARKEN = 2

_OP_DIFFERENCE :: Int
_OP_DIFFERENCE = 1

_OP_OVERLAY :: Int
_OP_OVERLAY = 4

_OP_LIGHTEN :: Int
_OP_LIGHTEN = 3

instance NodeProperty VisualShaderNodeColorOp "operator" Int 'False
         where
        nodeProperty
          = (get_operator, wrapDroppingSetter set_operator, Nothing)

{-# NOINLINE bindVisualShaderNodeColorOp_get_operator #-}

-- | An operator to be applied to the inputs. See @enum Operator@ for options.
bindVisualShaderNodeColorOp_get_operator :: MethodBind
bindVisualShaderNodeColorOp_get_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeColorOp" $
        \ clsNamePtr ->
          withCString "get_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | An operator to be applied to the inputs. See @enum Operator@ for options.
get_operator ::
               (VisualShaderNodeColorOp :< cls, Object :< cls) => cls -> IO Int
get_operator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeColorOp_get_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeColorOp "get_operator" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeColorOp.get_operator

{-# NOINLINE bindVisualShaderNodeColorOp_set_operator #-}

-- | An operator to be applied to the inputs. See @enum Operator@ for options.
bindVisualShaderNodeColorOp_set_operator :: MethodBind
bindVisualShaderNodeColorOp_set_operator
  = unsafePerformIO $
      withCString "VisualShaderNodeColorOp" $
        \ clsNamePtr ->
          withCString "set_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | An operator to be applied to the inputs. See @enum Operator@ for options.
set_operator ::
               (VisualShaderNodeColorOp :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_operator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeColorOp_set_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeColorOp "set_operator" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeColorOp.set_operator