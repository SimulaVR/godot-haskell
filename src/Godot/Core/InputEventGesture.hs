{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventGesture
       (Godot.Core.InputEventGesture.get_position,
        Godot.Core.InputEventGesture.set_position)
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
import Godot.Core.InputEventWithModifiers()

instance NodeProperty InputEventGesture "position" Vector2 'False
         where
        nodeProperty
          = (get_position, wrapDroppingSetter set_position, Nothing)

{-# NOINLINE bindInputEventGesture_get_position #-}

bindInputEventGesture_get_position :: MethodBind
bindInputEventGesture_get_position
  = unsafePerformIO $
      withCString "InputEventGesture" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_position ::
               (InputEventGesture :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventGesture_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventGesture "get_position" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventGesture.get_position

{-# NOINLINE bindInputEventGesture_set_position #-}

bindInputEventGesture_set_position :: MethodBind
bindInputEventGesture_set_position
  = unsafePerformIO $
      withCString "InputEventGesture" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_position ::
               (InputEventGesture :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventGesture_set_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventGesture "set_position" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventGesture.set_position