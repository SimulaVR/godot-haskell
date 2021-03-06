{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeColorConstant
       (Godot.Core.VisualShaderNodeColorConstant.get_constant,
        Godot.Core.VisualShaderNodeColorConstant.set_constant)
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

instance NodeProperty VisualShaderNodeColorConstant "constant"
           Color
           'False
         where
        nodeProperty
          = (get_constant, wrapDroppingSetter set_constant, Nothing)

{-# NOINLINE bindVisualShaderNodeColorConstant_get_constant #-}

-- | A @Color@ constant which represents a state of this node.
bindVisualShaderNodeColorConstant_get_constant :: MethodBind
bindVisualShaderNodeColorConstant_get_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeColorConstant" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A @Color@ constant which represents a state of this node.
get_constant ::
               (VisualShaderNodeColorConstant :< cls, Object :< cls) =>
               cls -> IO Color
get_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeColorConstant_get_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeColorConstant "get_constant"
           '[]
           (IO Color)
         where
        nodeMethod = Godot.Core.VisualShaderNodeColorConstant.get_constant

{-# NOINLINE bindVisualShaderNodeColorConstant_set_constant #-}

-- | A @Color@ constant which represents a state of this node.
bindVisualShaderNodeColorConstant_set_constant :: MethodBind
bindVisualShaderNodeColorConstant_set_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeColorConstant" $
        \ clsNamePtr ->
          withCString "set_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A @Color@ constant which represents a state of this node.
set_constant ::
               (VisualShaderNodeColorConstant :< cls, Object :< cls) =>
               cls -> Color -> IO ()
set_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeColorConstant_set_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeColorConstant "set_constant"
           '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeColorConstant.set_constant