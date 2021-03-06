{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptGlobalConstant
       (Godot.Core.VisualScriptGlobalConstant.get_global_constant,
        Godot.Core.VisualScriptGlobalConstant.set_global_constant)
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
import Godot.Core.VisualScriptNode()

instance NodeProperty VisualScriptGlobalConstant "constant" Int
           'False
         where
        nodeProperty
          = (get_global_constant, wrapDroppingSetter set_global_constant,
             Nothing)

{-# NOINLINE bindVisualScriptGlobalConstant_get_global_constant #-}

bindVisualScriptGlobalConstant_get_global_constant :: MethodBind
bindVisualScriptGlobalConstant_get_global_constant
  = unsafePerformIO $
      withCString "VisualScriptGlobalConstant" $
        \ clsNamePtr ->
          withCString "get_global_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_global_constant ::
                      (VisualScriptGlobalConstant :< cls, Object :< cls) => cls -> IO Int
get_global_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptGlobalConstant_get_global_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptGlobalConstant
           "get_global_constant"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualScriptGlobalConstant.get_global_constant

{-# NOINLINE bindVisualScriptGlobalConstant_set_global_constant #-}

bindVisualScriptGlobalConstant_set_global_constant :: MethodBind
bindVisualScriptGlobalConstant_set_global_constant
  = unsafePerformIO $
      withCString "VisualScriptGlobalConstant" $
        \ clsNamePtr ->
          withCString "set_global_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_global_constant ::
                      (VisualScriptGlobalConstant :< cls, Object :< cls) =>
                      cls -> Int -> IO ()
set_global_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptGlobalConstant_set_global_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptGlobalConstant
           "set_global_constant"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualScriptGlobalConstant.set_global_constant