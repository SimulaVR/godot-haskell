{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptEmitSignal
       (Godot.Core.VisualScriptEmitSignal.get_signal,
        Godot.Core.VisualScriptEmitSignal.set_signal)
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

instance NodeProperty VisualScriptEmitSignal "signal" GodotString
           'False
         where
        nodeProperty = (get_signal, wrapDroppingSetter set_signal, Nothing)

{-# NOINLINE bindVisualScriptEmitSignal_get_signal #-}

bindVisualScriptEmitSignal_get_signal :: MethodBind
bindVisualScriptEmitSignal_get_signal
  = unsafePerformIO $
      withCString "VisualScriptEmitSignal" $
        \ clsNamePtr ->
          withCString "get_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_signal ::
             (VisualScriptEmitSignal :< cls, Object :< cls) =>
             cls -> IO GodotString
get_signal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptEmitSignal_get_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptEmitSignal "get_signal" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptEmitSignal.get_signal

{-# NOINLINE bindVisualScriptEmitSignal_set_signal #-}

bindVisualScriptEmitSignal_set_signal :: MethodBind
bindVisualScriptEmitSignal_set_signal
  = unsafePerformIO $
      withCString "VisualScriptEmitSignal" $
        \ clsNamePtr ->
          withCString "set_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_signal ::
             (VisualScriptEmitSignal :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptEmitSignal_set_signal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptEmitSignal "set_signal"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptEmitSignal.set_signal