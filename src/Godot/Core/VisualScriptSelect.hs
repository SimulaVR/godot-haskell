{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptSelect
       (Godot.Core.VisualScriptSelect.get_typed,
        Godot.Core.VisualScriptSelect.set_typed)
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

instance NodeProperty VisualScriptSelect "type" Int 'False where
        nodeProperty = (get_typed, wrapDroppingSetter set_typed, Nothing)

{-# NOINLINE bindVisualScriptSelect_get_typed #-}

bindVisualScriptSelect_get_typed :: MethodBind
bindVisualScriptSelect_get_typed
  = unsafePerformIO $
      withCString "VisualScriptSelect" $
        \ clsNamePtr ->
          withCString "get_typed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_typed ::
            (VisualScriptSelect :< cls, Object :< cls) => cls -> IO Int
get_typed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSelect_get_typed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptSelect "get_typed" '[] (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptSelect.get_typed

{-# NOINLINE bindVisualScriptSelect_set_typed #-}

bindVisualScriptSelect_set_typed :: MethodBind
bindVisualScriptSelect_set_typed
  = unsafePerformIO $
      withCString "VisualScriptSelect" $
        \ clsNamePtr ->
          withCString "set_typed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_typed ::
            (VisualScriptSelect :< cls, Object :< cls) => cls -> Int -> IO ()
set_typed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSelect_set_typed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptSelect "set_typed" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptSelect.set_typed