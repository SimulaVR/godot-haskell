{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventPanGesture
       (Godot.Core.InputEventPanGesture.get_delta,
        Godot.Core.InputEventPanGesture.set_delta)
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
import Godot.Core.InputEventGesture()

instance NodeProperty InputEventPanGesture "delta" Vector2 'False
         where
        nodeProperty = (get_delta, wrapDroppingSetter set_delta, Nothing)

{-# NOINLINE bindInputEventPanGesture_get_delta #-}

bindInputEventPanGesture_get_delta :: MethodBind
bindInputEventPanGesture_get_delta
  = unsafePerformIO $
      withCString "InputEventPanGesture" $
        \ clsNamePtr ->
          withCString "get_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_delta ::
            (InputEventPanGesture :< cls, Object :< cls) => cls -> IO Vector2
get_delta cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventPanGesture_get_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventPanGesture "get_delta" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventPanGesture.get_delta

{-# NOINLINE bindInputEventPanGesture_set_delta #-}

bindInputEventPanGesture_set_delta :: MethodBind
bindInputEventPanGesture_set_delta
  = unsafePerformIO $
      withCString "InputEventPanGesture" $
        \ clsNamePtr ->
          withCString "set_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_delta ::
            (InputEventPanGesture :< cls, Object :< cls) =>
            cls -> Vector2 -> IO ()
set_delta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventPanGesture_set_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventPanGesture "set_delta" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventPanGesture.set_delta