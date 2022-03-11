{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventScreenDrag
       (Godot.Core.InputEventScreenDrag.get_index,
        Godot.Core.InputEventScreenDrag.get_position,
        Godot.Core.InputEventScreenDrag.get_relative,
        Godot.Core.InputEventScreenDrag.get_speed,
        Godot.Core.InputEventScreenDrag.set_index,
        Godot.Core.InputEventScreenDrag.set_position,
        Godot.Core.InputEventScreenDrag.set_relative,
        Godot.Core.InputEventScreenDrag.set_speed)
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

instance NodeProperty InputEventScreenDrag "index" Int 'False where
        nodeProperty = (get_index, wrapDroppingSetter set_index, Nothing)

instance NodeProperty InputEventScreenDrag "position" Vector2
           'False
         where
        nodeProperty
          = (get_position, wrapDroppingSetter set_position, Nothing)

instance NodeProperty InputEventScreenDrag "relative" Vector2
           'False
         where
        nodeProperty
          = (get_relative, wrapDroppingSetter set_relative, Nothing)

instance NodeProperty InputEventScreenDrag "speed" Vector2 'False
         where
        nodeProperty = (get_speed, wrapDroppingSetter set_speed, Nothing)

{-# NOINLINE bindInputEventScreenDrag_get_index #-}

-- | The drag event index in the case of a multi-drag event.
bindInputEventScreenDrag_get_index :: MethodBind
bindInputEventScreenDrag_get_index
  = unsafePerformIO $
      withCString "InputEventScreenDrag" $
        \ clsNamePtr ->
          withCString "get_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drag event index in the case of a multi-drag event.
get_index ::
            (InputEventScreenDrag :< cls, Object :< cls) => cls -> IO Int
get_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenDrag_get_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenDrag "get_index" '[] (IO Int)
         where
        nodeMethod = Godot.Core.InputEventScreenDrag.get_index

{-# NOINLINE bindInputEventScreenDrag_get_position #-}

-- | The drag position.
bindInputEventScreenDrag_get_position :: MethodBind
bindInputEventScreenDrag_get_position
  = unsafePerformIO $
      withCString "InputEventScreenDrag" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drag position.
get_position ::
               (InputEventScreenDrag :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenDrag_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenDrag "get_position" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventScreenDrag.get_position

{-# NOINLINE bindInputEventScreenDrag_get_relative #-}

-- | The drag position relative to the previous position (position at the last frame).
bindInputEventScreenDrag_get_relative :: MethodBind
bindInputEventScreenDrag_get_relative
  = unsafePerformIO $
      withCString "InputEventScreenDrag" $
        \ clsNamePtr ->
          withCString "get_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drag position relative to the previous position (position at the last frame).
get_relative ::
               (InputEventScreenDrag :< cls, Object :< cls) => cls -> IO Vector2
get_relative cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenDrag_get_relative
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenDrag "get_relative" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventScreenDrag.get_relative

{-# NOINLINE bindInputEventScreenDrag_get_speed #-}

-- | The drag speed.
bindInputEventScreenDrag_get_speed :: MethodBind
bindInputEventScreenDrag_get_speed
  = unsafePerformIO $
      withCString "InputEventScreenDrag" $
        \ clsNamePtr ->
          withCString "get_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drag speed.
get_speed ::
            (InputEventScreenDrag :< cls, Object :< cls) => cls -> IO Vector2
get_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenDrag_get_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenDrag "get_speed" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventScreenDrag.get_speed

{-# NOINLINE bindInputEventScreenDrag_set_index #-}

-- | The drag event index in the case of a multi-drag event.
bindInputEventScreenDrag_set_index :: MethodBind
bindInputEventScreenDrag_set_index
  = unsafePerformIO $
      withCString "InputEventScreenDrag" $
        \ clsNamePtr ->
          withCString "set_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drag event index in the case of a multi-drag event.
set_index ::
            (InputEventScreenDrag :< cls, Object :< cls) => cls -> Int -> IO ()
set_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenDrag_set_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenDrag "set_index" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.InputEventScreenDrag.set_index

{-# NOINLINE bindInputEventScreenDrag_set_position #-}

-- | The drag position.
bindInputEventScreenDrag_set_position :: MethodBind
bindInputEventScreenDrag_set_position
  = unsafePerformIO $
      withCString "InputEventScreenDrag" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drag position.
set_position ::
               (InputEventScreenDrag :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenDrag_set_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenDrag "set_position" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventScreenDrag.set_position

{-# NOINLINE bindInputEventScreenDrag_set_relative #-}

-- | The drag position relative to the previous position (position at the last frame).
bindInputEventScreenDrag_set_relative :: MethodBind
bindInputEventScreenDrag_set_relative
  = unsafePerformIO $
      withCString "InputEventScreenDrag" $
        \ clsNamePtr ->
          withCString "set_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drag position relative to the previous position (position at the last frame).
set_relative ::
               (InputEventScreenDrag :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_relative cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenDrag_set_relative
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenDrag "set_relative" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventScreenDrag.set_relative

{-# NOINLINE bindInputEventScreenDrag_set_speed #-}

-- | The drag speed.
bindInputEventScreenDrag_set_speed :: MethodBind
bindInputEventScreenDrag_set_speed
  = unsafePerformIO $
      withCString "InputEventScreenDrag" $
        \ clsNamePtr ->
          withCString "set_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The drag speed.
set_speed ::
            (InputEventScreenDrag :< cls, Object :< cls) =>
            cls -> Vector2 -> IO ()
set_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventScreenDrag_set_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventScreenDrag "set_speed" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventScreenDrag.set_speed