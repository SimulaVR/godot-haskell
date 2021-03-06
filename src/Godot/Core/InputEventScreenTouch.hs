{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventScreenTouch
       (Godot.Core.InputEventScreenTouch.is_pressed,
        Godot.Core.InputEventScreenTouch.get_index,
        Godot.Core.InputEventScreenTouch.get_position,
        Godot.Core.InputEventScreenTouch.set_index,
        Godot.Core.InputEventScreenTouch.set_position,
        Godot.Core.InputEventScreenTouch.set_pressed)
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
import Godot.Core.InputEvent()

instance NodeProperty InputEventScreenTouch "index" Int 'False
         where
        nodeProperty = (get_index, wrapDroppingSetter set_index, Nothing)

instance NodeProperty InputEventScreenTouch "position" Vector2
           'False
         where
        nodeProperty
          = (get_position, wrapDroppingSetter set_position, Nothing)

{-# NOINLINE bindInputEventScreenTouch_is_pressed #-}

-- | If @true@, the touch's state is pressed. If @false@, the touch's state is released.
bindInputEventScreenTouch_is_pressed :: MethodBind
bindInputEventScreenTouch_is_pressed
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "is_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the touch's state is pressed. If @false@, the touch's state is released.
is_pressed ::
             (InputEventScreenTouch :< cls, Object :< cls) => cls -> IO Bool
is_pressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_is_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenTouch "is_pressed" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.InputEventScreenTouch.is_pressed

instance NodeProperty InputEventScreenTouch "pressed" Bool 'False
         where
        nodeProperty
          = (is_pressed, wrapDroppingSetter set_pressed, Nothing)

{-# NOINLINE bindInputEventScreenTouch_get_index #-}

-- | The touch index in the case of a multi-touch event. One index = one finger.
bindInputEventScreenTouch_get_index :: MethodBind
bindInputEventScreenTouch_get_index
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "get_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The touch index in the case of a multi-touch event. One index = one finger.
get_index ::
            (InputEventScreenTouch :< cls, Object :< cls) => cls -> IO Int
get_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_get_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenTouch "get_index" '[] (IO Int)
         where
        nodeMethod = Godot.Core.InputEventScreenTouch.get_index

{-# NOINLINE bindInputEventScreenTouch_get_position #-}

-- | The touch position.
bindInputEventScreenTouch_get_position :: MethodBind
bindInputEventScreenTouch_get_position
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The touch position.
get_position ::
               (InputEventScreenTouch :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenTouch "get_position" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventScreenTouch.get_position

{-# NOINLINE bindInputEventScreenTouch_set_index #-}

-- | The touch index in the case of a multi-touch event. One index = one finger.
bindInputEventScreenTouch_set_index :: MethodBind
bindInputEventScreenTouch_set_index
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "set_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The touch index in the case of a multi-touch event. One index = one finger.
set_index ::
            (InputEventScreenTouch :< cls, Object :< cls) =>
            cls -> Int -> IO ()
set_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_set_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenTouch "set_index" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventScreenTouch.set_index

{-# NOINLINE bindInputEventScreenTouch_set_position #-}

-- | The touch position.
bindInputEventScreenTouch_set_position :: MethodBind
bindInputEventScreenTouch_set_position
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The touch position.
set_position ::
               (InputEventScreenTouch :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_set_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenTouch "set_position" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventScreenTouch.set_position

{-# NOINLINE bindInputEventScreenTouch_set_pressed #-}

-- | If @true@, the touch's state is pressed. If @false@, the touch's state is released.
bindInputEventScreenTouch_set_pressed :: MethodBind
bindInputEventScreenTouch_set_pressed
  = unsafePerformIO $
      withCString "InputEventScreenTouch" $
        \ clsNamePtr ->
          withCString "set_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the touch's state is pressed. If @false@, the touch's state is released.
set_pressed ::
              (InputEventScreenTouch :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenTouch_set_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenTouch "set_pressed" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventScreenTouch.set_pressed