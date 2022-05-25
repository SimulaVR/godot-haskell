{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InputEventMouseMotion
       (Godot.Core.InputEventMouseMotion.get_pressure,
        Godot.Core.InputEventMouseMotion.get_relative,
        Godot.Core.InputEventMouseMotion.get_speed,
        Godot.Core.InputEventMouseMotion.get_tilt,
        Godot.Core.InputEventMouseMotion.set_pressure,
        Godot.Core.InputEventMouseMotion.set_relative,
        Godot.Core.InputEventMouseMotion.set_speed,
        Godot.Core.InputEventMouseMotion.set_tilt)
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
import Godot.Core.InputEventMouse()

instance NodeProperty InputEventMouseMotion "pressure" Float 'False
         where
        nodeProperty
          = (get_pressure, wrapDroppingSetter set_pressure, Nothing)

instance NodeProperty InputEventMouseMotion "relative" Vector2
           'False
         where
        nodeProperty
          = (get_relative, wrapDroppingSetter set_relative, Nothing)

instance NodeProperty InputEventMouseMotion "speed" Vector2 'False
         where
        nodeProperty = (get_speed, wrapDroppingSetter set_speed, Nothing)

instance NodeProperty InputEventMouseMotion "tilt" Vector2 'False
         where
        nodeProperty = (get_tilt, wrapDroppingSetter set_tilt, Nothing)

{-# NOINLINE bindInputEventMouseMotion_get_pressure #-}

-- | Represents the pressure the user puts on the pen. Ranges from @0.0@ to @1.0@.
bindInputEventMouseMotion_get_pressure :: MethodBind
bindInputEventMouseMotion_get_pressure
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the pressure the user puts on the pen. Ranges from @0.0@ to @1.0@.
get_pressure ::
               (InputEventMouseMotion :< cls, Object :< cls) => cls -> IO Float
get_pressure cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_get_pressure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventMouseMotion "get_pressure" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.InputEventMouseMotion.get_pressure

{-# NOINLINE bindInputEventMouseMotion_get_relative #-}

-- | The mouse position relative to the previous position (position at the last frame).
bindInputEventMouseMotion_get_relative :: MethodBind
bindInputEventMouseMotion_get_relative
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse position relative to the previous position (position at the last frame).
get_relative ::
               (InputEventMouseMotion :< cls, Object :< cls) => cls -> IO Vector2
get_relative cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_get_relative
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventMouseMotion "get_relative" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventMouseMotion.get_relative

{-# NOINLINE bindInputEventMouseMotion_get_speed #-}

-- | The mouse speed in pixels per second.
bindInputEventMouseMotion_get_speed :: MethodBind
bindInputEventMouseMotion_get_speed
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse speed in pixels per second.
get_speed ::
            (InputEventMouseMotion :< cls, Object :< cls) => cls -> IO Vector2
get_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_get_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventMouseMotion "get_speed" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventMouseMotion.get_speed

{-# NOINLINE bindInputEventMouseMotion_get_tilt #-}

-- | Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from @-1.0@ to @1.0@ for both axes.
bindInputEventMouseMotion_get_tilt :: MethodBind
bindInputEventMouseMotion_get_tilt
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "get_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from @-1.0@ to @1.0@ for both axes.
get_tilt ::
           (InputEventMouseMotion :< cls, Object :< cls) => cls -> IO Vector2
get_tilt cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_get_tilt
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventMouseMotion "get_tilt" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.InputEventMouseMotion.get_tilt

{-# NOINLINE bindInputEventMouseMotion_set_pressure #-}

-- | Represents the pressure the user puts on the pen. Ranges from @0.0@ to @1.0@.
bindInputEventMouseMotion_set_pressure :: MethodBind
bindInputEventMouseMotion_set_pressure
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_pressure" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the pressure the user puts on the pen. Ranges from @0.0@ to @1.0@.
set_pressure ::
               (InputEventMouseMotion :< cls, Object :< cls) =>
               cls -> Float -> IO ()
set_pressure cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_set_pressure
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventMouseMotion "set_pressure" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMouseMotion.set_pressure

{-# NOINLINE bindInputEventMouseMotion_set_relative #-}

-- | The mouse position relative to the previous position (position at the last frame).
bindInputEventMouseMotion_set_relative :: MethodBind
bindInputEventMouseMotion_set_relative
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse position relative to the previous position (position at the last frame).
set_relative ::
               (InputEventMouseMotion :< cls, Object :< cls) =>
               cls -> Vector2 -> IO ()
set_relative cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_set_relative
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventMouseMotion "set_relative" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMouseMotion.set_relative

{-# NOINLINE bindInputEventMouseMotion_set_speed #-}

-- | The mouse speed in pixels per second.
bindInputEventMouseMotion_set_speed :: MethodBind
bindInputEventMouseMotion_set_speed
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mouse speed in pixels per second.
set_speed ::
            (InputEventMouseMotion :< cls, Object :< cls) =>
            cls -> Vector2 -> IO ()
set_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_set_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventMouseMotion "set_speed" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMouseMotion.set_speed

{-# NOINLINE bindInputEventMouseMotion_set_tilt #-}

-- | Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from @-1.0@ to @1.0@ for both axes.
bindInputEventMouseMotion_set_tilt :: MethodBind
bindInputEventMouseMotion_set_tilt
  = unsafePerformIO $
      withCString "InputEventMouseMotion" $
        \ clsNamePtr ->
          withCString "set_tilt" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from @-1.0@ to @1.0@ for both axes.
set_tilt ::
           (InputEventMouseMotion :< cls, Object :< cls) =>
           cls -> Vector2 -> IO ()
set_tilt cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInputEventMouseMotion_set_tilt
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InputEventMouseMotion "set_tilt" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.InputEventMouseMotion.set_tilt