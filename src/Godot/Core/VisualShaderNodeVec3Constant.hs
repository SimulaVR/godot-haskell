{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeVec3Constant
       (Godot.Core.VisualShaderNodeVec3Constant.get_constant,
        Godot.Core.VisualShaderNodeVec3Constant.set_constant)
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

instance NodeProperty VisualShaderNodeVec3Constant "constant"
           Vector3
           'False
         where
        nodeProperty
          = (get_constant, wrapDroppingSetter set_constant, Nothing)

{-# NOINLINE bindVisualShaderNodeVec3Constant_get_constant #-}

bindVisualShaderNodeVec3Constant_get_constant :: MethodBind
bindVisualShaderNodeVec3Constant_get_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeVec3Constant" $
        \ clsNamePtr ->
          withCString "get_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant ::
               (VisualShaderNodeVec3Constant :< cls, Object :< cls) =>
               cls -> IO Vector3
get_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVec3Constant_get_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeVec3Constant "get_constant" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.VisualShaderNodeVec3Constant.get_constant

{-# NOINLINE bindVisualShaderNodeVec3Constant_set_constant #-}

bindVisualShaderNodeVec3Constant_set_constant :: MethodBind
bindVisualShaderNodeVec3Constant_set_constant
  = unsafePerformIO $
      withCString "VisualShaderNodeVec3Constant" $
        \ clsNamePtr ->
          withCString "set_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constant ::
               (VisualShaderNodeVec3Constant :< cls, Object :< cls) =>
               cls -> Vector3 -> IO ()
set_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeVec3Constant_set_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeVec3Constant "set_constant"
           '[Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeVec3Constant.set_constant