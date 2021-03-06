{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptSequence
       (Godot.Core.VisualScriptSequence.get_steps,
        Godot.Core.VisualScriptSequence.set_steps)
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

instance NodeProperty VisualScriptSequence "steps" Int 'False where
        nodeProperty = (get_steps, wrapDroppingSetter set_steps, Nothing)

{-# NOINLINE bindVisualScriptSequence_get_steps #-}

bindVisualScriptSequence_get_steps :: MethodBind
bindVisualScriptSequence_get_steps
  = unsafePerformIO $
      withCString "VisualScriptSequence" $
        \ clsNamePtr ->
          withCString "get_steps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_steps ::
            (VisualScriptSequence :< cls, Object :< cls) => cls -> IO Int
get_steps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSequence_get_steps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptSequence "get_steps" '[] (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptSequence.get_steps

{-# NOINLINE bindVisualScriptSequence_set_steps #-}

bindVisualScriptSequence_set_steps :: MethodBind
bindVisualScriptSequence_set_steps
  = unsafePerformIO $
      withCString "VisualScriptSequence" $
        \ clsNamePtr ->
          withCString "set_steps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_steps ::
            (VisualScriptSequence :< cls, Object :< cls) => cls -> Int -> IO ()
set_steps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSequence_set_steps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptSequence "set_steps" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptSequence.set_steps