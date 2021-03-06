{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptVariableSet
       (Godot.Core.VisualScriptVariableSet.get_variable,
        Godot.Core.VisualScriptVariableSet.set_variable)
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

instance NodeProperty VisualScriptVariableSet "var_name"
           GodotString
           'False
         where
        nodeProperty
          = (get_variable, wrapDroppingSetter set_variable, Nothing)

{-# NOINLINE bindVisualScriptVariableSet_get_variable #-}

bindVisualScriptVariableSet_get_variable :: MethodBind
bindVisualScriptVariableSet_get_variable
  = unsafePerformIO $
      withCString "VisualScriptVariableSet" $
        \ clsNamePtr ->
          withCString "get_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_variable ::
               (VisualScriptVariableSet :< cls, Object :< cls) =>
               cls -> IO GodotString
get_variable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptVariableSet_get_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptVariableSet "get_variable" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptVariableSet.get_variable

{-# NOINLINE bindVisualScriptVariableSet_set_variable #-}

bindVisualScriptVariableSet_set_variable :: MethodBind
bindVisualScriptVariableSet_set_variable
  = unsafePerformIO $
      withCString "VisualScriptVariableSet" $
        \ clsNamePtr ->
          withCString "set_variable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_variable ::
               (VisualScriptVariableSet :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_variable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptVariableSet_set_variable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptVariableSet "set_variable"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptVariableSet.set_variable