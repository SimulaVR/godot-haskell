{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptVariableGet
       (Godot.Core.VisualScriptVariableGet.get_variable,
        Godot.Core.VisualScriptVariableGet.set_variable)
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

instance NodeProperty VisualScriptVariableGet "var_name"
           GodotString
           'False
         where
        nodeProperty
          = (get_variable, wrapDroppingSetter set_variable, Nothing)

{-# NOINLINE bindVisualScriptVariableGet_get_variable #-}

bindVisualScriptVariableGet_get_variable :: MethodBind
bindVisualScriptVariableGet_get_variable
  = unsafePerformIO $
      withCString "VisualScriptVariableGet" $
        \ clsNamePtr ->
          withCString "get_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_variable ::
               (VisualScriptVariableGet :< cls, Object :< cls) =>
               cls -> IO GodotString
get_variable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptVariableGet_get_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptVariableGet "get_variable" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptVariableGet.get_variable

{-# NOINLINE bindVisualScriptVariableGet_set_variable #-}

bindVisualScriptVariableGet_set_variable :: MethodBind
bindVisualScriptVariableGet_set_variable
  = unsafePerformIO $
      withCString "VisualScriptVariableGet" $
        \ clsNamePtr ->
          withCString "set_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_variable ::
               (VisualScriptVariableGet :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_variable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptVariableGet_set_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptVariableGet "set_variable"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptVariableGet.set_variable