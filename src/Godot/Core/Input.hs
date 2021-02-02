{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Input
       (Godot.Core.Input._CURSOR_MOVE, Godot.Core.Input._CURSOR_ARROW,
        Godot.Core.Input._CURSOR_IBEAM, Godot.Core.Input._CURSOR_HSPLIT,
        Godot.Core.Input._CURSOR_DRAG, Godot.Core.Input._CURSOR_BUSY,
        Godot.Core.Input._MOUSE_MODE_CONFINED,
        Godot.Core.Input._CURSOR_CROSS, Godot.Core.Input._CURSOR_WAIT,
        Godot.Core.Input._CURSOR_BDIAGSIZE, Godot.Core.Input._CURSOR_HELP,
        Godot.Core.Input._MOUSE_MODE_VISIBLE,
        Godot.Core.Input._CURSOR_CAN_DROP,
        Godot.Core.Input._MOUSE_MODE_CAPTURED,
        Godot.Core.Input._CURSOR_POINTING_HAND,
        Godot.Core.Input._CURSOR_FDIAGSIZE, Godot.Core.Input._CURSOR_HSIZE,
        Godot.Core.Input._MOUSE_MODE_HIDDEN,
        Godot.Core.Input._CURSOR_FORBIDDEN, Godot.Core.Input._CURSOR_VSIZE,
        Godot.Core.Input._CURSOR_VSPLIT,
        Godot.Core.Input.sig_joy_connection_changed,
        Godot.Core.Input.action_press, Godot.Core.Input.action_release,
        Godot.Core.Input.add_joy_mapping,
        Godot.Core.Input.get_accelerometer,
        Godot.Core.Input.get_action_strength,
        Godot.Core.Input.get_connected_joypads,
        Godot.Core.Input.get_current_cursor_shape,
        Godot.Core.Input.get_gravity, Godot.Core.Input.get_gyroscope,
        Godot.Core.Input.get_joy_axis,
        Godot.Core.Input.get_joy_axis_index_from_string,
        Godot.Core.Input.get_joy_axis_string,
        Godot.Core.Input.get_joy_button_index_from_string,
        Godot.Core.Input.get_joy_button_string,
        Godot.Core.Input.get_joy_guid, Godot.Core.Input.get_joy_name,
        Godot.Core.Input.get_joy_vibration_duration,
        Godot.Core.Input.get_joy_vibration_strength,
        Godot.Core.Input.get_last_mouse_speed,
        Godot.Core.Input.get_magnetometer,
        Godot.Core.Input.get_mouse_button_mask,
        Godot.Core.Input.get_mouse_mode,
        Godot.Core.Input.is_action_just_pressed,
        Godot.Core.Input.is_action_just_released,
        Godot.Core.Input.is_action_pressed,
        Godot.Core.Input.is_joy_button_pressed,
        Godot.Core.Input.is_joy_known, Godot.Core.Input.is_key_pressed,
        Godot.Core.Input.is_mouse_button_pressed,
        Godot.Core.Input.joy_connection_changed,
        Godot.Core.Input.parse_input_event,
        Godot.Core.Input.remove_joy_mapping,
        Godot.Core.Input.set_custom_mouse_cursor,
        Godot.Core.Input.set_default_cursor_shape,
        Godot.Core.Input.set_mouse_mode,
        Godot.Core.Input.set_use_accumulated_input,
        Godot.Core.Input.start_joy_vibration,
        Godot.Core.Input.stop_joy_vibration,
        Godot.Core.Input.vibrate_handheld,
        Godot.Core.Input.warp_mouse_position)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_CURSOR_MOVE :: Int
_CURSOR_MOVE = 13

_CURSOR_ARROW :: Int
_CURSOR_ARROW = 0

_CURSOR_IBEAM :: Int
_CURSOR_IBEAM = 1

_CURSOR_HSPLIT :: Int
_CURSOR_HSPLIT = 15

_CURSOR_DRAG :: Int
_CURSOR_DRAG = 6

_CURSOR_BUSY :: Int
_CURSOR_BUSY = 5

_MOUSE_MODE_CONFINED :: Int
_MOUSE_MODE_CONFINED = 3

_CURSOR_CROSS :: Int
_CURSOR_CROSS = 3

_CURSOR_WAIT :: Int
_CURSOR_WAIT = 4

_CURSOR_BDIAGSIZE :: Int
_CURSOR_BDIAGSIZE = 11

_CURSOR_HELP :: Int
_CURSOR_HELP = 16

_MOUSE_MODE_VISIBLE :: Int
_MOUSE_MODE_VISIBLE = 0

_CURSOR_CAN_DROP :: Int
_CURSOR_CAN_DROP = 7

_MOUSE_MODE_CAPTURED :: Int
_MOUSE_MODE_CAPTURED = 2

_CURSOR_POINTING_HAND :: Int
_CURSOR_POINTING_HAND = 2

_CURSOR_FDIAGSIZE :: Int
_CURSOR_FDIAGSIZE = 12

_CURSOR_HSIZE :: Int
_CURSOR_HSIZE = 10

_MOUSE_MODE_HIDDEN :: Int
_MOUSE_MODE_HIDDEN = 1

_CURSOR_FORBIDDEN :: Int
_CURSOR_FORBIDDEN = 8

_CURSOR_VSIZE :: Int
_CURSOR_VSIZE = 9

_CURSOR_VSPLIT :: Int
_CURSOR_VSPLIT = 14

-- | Emitted when a joypad device has been connected or disconnected.
sig_joy_connection_changed :: Godot.Internal.Dispatch.Signal Input
sig_joy_connection_changed
  = Godot.Internal.Dispatch.Signal "joy_connection_changed"

{-# NOINLINE bindInput_action_press #-}

-- | This will simulate pressing the specified action.
--   				The strength can be used for non-boolean actions, it's ranged between 0 and 1 representing the intensity of the given action.
--   				[b]Note:[/b] This method will not cause any [method Node._input] calls. It is intended to be used with [method is_action_pressed] and [method is_action_just_pressed]. If you want to simulate [code]_input[/code], use [method parse_input_event] instead.
bindInput_action_press :: MethodBind
bindInput_action_press
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "action_press" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This will simulate pressing the specified action.
--   				The strength can be used for non-boolean actions, it's ranged between 0 and 1 representing the intensity of the given action.
--   				[b]Note:[/b] This method will not cause any [method Node._input] calls. It is intended to be used with [method is_action_pressed] and [method is_action_just_pressed]. If you want to simulate [code]_input[/code], use [method parse_input_event] instead.
action_press ::
               (Input :< cls, Object :< cls) =>
               cls -> GodotString -> Float -> IO ()
action_press cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_action_press (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_action_release #-}

-- | If the specified action is already pressed, this will release it.
bindInput_action_release :: MethodBind
bindInput_action_release
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "action_release" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the specified action is already pressed, this will release it.
action_release ::
                 (Input :< cls, Object :< cls) => cls -> GodotString -> IO ()
action_release cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_action_release (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_add_joy_mapping #-}

-- | Add a new mapping entry (in SDL2 format) to the mapping database. Optionally update already connected devices.
bindInput_add_joy_mapping :: MethodBind
bindInput_add_joy_mapping
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "add_joy_mapping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a new mapping entry (in SDL2 format) to the mapping database. Optionally update already connected devices.
add_joy_mapping ::
                  (Input :< cls, Object :< cls) =>
                  cls -> GodotString -> Bool -> IO ()
add_joy_mapping cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_add_joy_mapping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_accelerometer #-}

-- | If the device has an accelerometer, this will return the acceleration. Otherwise, it returns an empty [Vector3].
--   				Note this method returns an empty [Vector3] when running from the editor even when your device has an accelerometer. You must export your project to a supported device to read values from the accelerometer.
bindInput_get_accelerometer :: MethodBind
bindInput_get_accelerometer
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_accelerometer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the device has an accelerometer, this will return the acceleration. Otherwise, it returns an empty [Vector3].
--   				Note this method returns an empty [Vector3] when running from the editor even when your device has an accelerometer. You must export your project to a supported device to read values from the accelerometer.
get_accelerometer ::
                    (Input :< cls, Object :< cls) => cls -> IO Vector3
get_accelerometer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_accelerometer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_action_strength #-}

-- | Returns a value between 0 and 1 representing the intensity of the given action. In a joypad, for example, the further away the axis (analog sticks or L2, R2 triggers) is from the dead zone, the closer the value will be to 1. If the action is mapped to a control that has no axis as the keyboard, the value returned will be 0 or 1.
bindInput_get_action_strength :: MethodBind
bindInput_get_action_strength
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_action_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a value between 0 and 1 representing the intensity of the given action. In a joypad, for example, the further away the axis (analog sticks or L2, R2 triggers) is from the dead zone, the closer the value will be to 1. If the action is mapped to a control that has no axis as the keyboard, the value returned will be 0 or 1.
get_action_strength ::
                      (Input :< cls, Object :< cls) => cls -> GodotString -> IO Float
get_action_strength cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_action_strength (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_connected_joypads #-}

-- | Returns an [Array] containing the device IDs of all currently connected joypads.
bindInput_get_connected_joypads :: MethodBind
bindInput_get_connected_joypads
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_connected_joypads" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an [Array] containing the device IDs of all currently connected joypads.
get_connected_joypads ::
                        (Input :< cls, Object :< cls) => cls -> IO Array
get_connected_joypads cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_connected_joypads (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_current_cursor_shape #-}

bindInput_get_current_cursor_shape :: MethodBind
bindInput_get_current_cursor_shape
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_current_cursor_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_current_cursor_shape ::
                           (Input :< cls, Object :< cls) => cls -> IO Int
get_current_cursor_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_current_cursor_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_gravity #-}

-- | If the device has an accelerometer, this will return the gravity. Otherwise, it returns an empty [Vector3].
bindInput_get_gravity :: MethodBind
bindInput_get_gravity
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_gravity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the device has an accelerometer, this will return the gravity. Otherwise, it returns an empty [Vector3].
get_gravity :: (Input :< cls, Object :< cls) => cls -> IO Vector3
get_gravity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_gravity (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_gyroscope #-}

-- | If the device has a gyroscope, this will return the rate of rotation in rad/s around a device's x, y, and z axis. Otherwise, it returns an empty [Vector3].
bindInput_get_gyroscope :: MethodBind
bindInput_get_gyroscope
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_gyroscope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the device has a gyroscope, this will return the rate of rotation in rad/s around a device's x, y, and z axis. Otherwise, it returns an empty [Vector3].
get_gyroscope :: (Input :< cls, Object :< cls) => cls -> IO Vector3
get_gyroscope cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_gyroscope (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_axis #-}

-- | Returns the current value of the joypad axis at given index (see [code]JOY_*[/code] constants in [@GlobalScope])
bindInput_get_joy_axis :: MethodBind
bindInput_get_joy_axis
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current value of the joypad axis at given index (see [code]JOY_*[/code] constants in [@GlobalScope])
get_joy_axis ::
               (Input :< cls, Object :< cls) => cls -> Int -> Int -> IO Float
get_joy_axis cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_axis (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_axis_index_from_string #-}

-- | Returns the index of the provided axis name.
bindInput_get_joy_axis_index_from_string :: MethodBind
bindInput_get_joy_axis_index_from_string
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_axis_index_from_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the provided axis name.
get_joy_axis_index_from_string ::
                                 (Input :< cls, Object :< cls) => cls -> GodotString -> IO Int
get_joy_axis_index_from_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_axis_index_from_string
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_axis_string #-}

-- | Receives a [code]JOY_AXIS_*[/code] Enum and returns its equivalent name as a string.
bindInput_get_joy_axis_string :: MethodBind
bindInput_get_joy_axis_string
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_axis_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Receives a [code]JOY_AXIS_*[/code] Enum and returns its equivalent name as a string.
get_joy_axis_string ::
                      (Input :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_joy_axis_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_axis_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_button_index_from_string #-}

-- | Returns the index of the provided button name.
bindInput_get_joy_button_index_from_string :: MethodBind
bindInput_get_joy_button_index_from_string
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_button_index_from_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the provided button name.
get_joy_button_index_from_string ::
                                   (Input :< cls, Object :< cls) => cls -> GodotString -> IO Int
get_joy_button_index_from_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_button_index_from_string
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_button_string #-}

-- | Receives a [code]JOY_BUTTON_*[/code] Enum and returns its equivalent name as a string.
bindInput_get_joy_button_string :: MethodBind
bindInput_get_joy_button_string
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_button_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Receives a [code]JOY_BUTTON_*[/code] Enum and returns its equivalent name as a string.
get_joy_button_string ::
                        (Input :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_joy_button_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_button_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_guid #-}

-- | Returns a SDL2 compatible device guid on platforms that use gamepad remapping. Returns "Default Gamepad" otherwise.
bindInput_get_joy_guid :: MethodBind
bindInput_get_joy_guid
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_guid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a SDL2 compatible device guid on platforms that use gamepad remapping. Returns "Default Gamepad" otherwise.
get_joy_guid ::
               (Input :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_joy_guid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_guid (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_name #-}

-- | Returns the name of the joypad at the specified device index
bindInput_get_joy_name :: MethodBind
bindInput_get_joy_name
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the joypad at the specified device index
get_joy_name ::
               (Input :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_joy_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_name (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_vibration_duration #-}

-- | Returns the duration of the current vibration effect in seconds.
bindInput_get_joy_vibration_duration :: MethodBind
bindInput_get_joy_vibration_duration
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_vibration_duration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the duration of the current vibration effect in seconds.
get_joy_vibration_duration ::
                             (Input :< cls, Object :< cls) => cls -> Int -> IO Float
get_joy_vibration_duration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_vibration_duration
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_joy_vibration_strength #-}

-- | Returns the strength of the joypad vibration: x is the strength of the weak motor, and y is the strength of the strong motor.
bindInput_get_joy_vibration_strength :: MethodBind
bindInput_get_joy_vibration_strength
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_joy_vibration_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the strength of the joypad vibration: x is the strength of the weak motor, and y is the strength of the strong motor.
get_joy_vibration_strength ::
                             (Input :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_joy_vibration_strength cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_joy_vibration_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_last_mouse_speed #-}

-- | Returns the mouse speed for the last time the cursor was moved, and this until the next frame where the mouse moves. This means that even if the mouse is not moving, this function will still return the value of the last motion.
bindInput_get_last_mouse_speed :: MethodBind
bindInput_get_last_mouse_speed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_last_mouse_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the mouse speed for the last time the cursor was moved, and this until the next frame where the mouse moves. This means that even if the mouse is not moving, this function will still return the value of the last motion.
get_last_mouse_speed ::
                       (Input :< cls, Object :< cls) => cls -> IO Vector2
get_last_mouse_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_last_mouse_speed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_magnetometer #-}

-- | If the device has a magnetometer, this will return the magnetic field strength in micro-Tesla for all axes.
bindInput_get_magnetometer :: MethodBind
bindInput_get_magnetometer
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_magnetometer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If the device has a magnetometer, this will return the magnetic field strength in micro-Tesla for all axes.
get_magnetometer ::
                   (Input :< cls, Object :< cls) => cls -> IO Vector3
get_magnetometer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_magnetometer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_mouse_button_mask #-}

-- | Returns mouse buttons as a bitmask. If multiple mouse buttons are pressed at the same time the bits are added together.
bindInput_get_mouse_button_mask :: MethodBind
bindInput_get_mouse_button_mask
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_mouse_button_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns mouse buttons as a bitmask. If multiple mouse buttons are pressed at the same time the bits are added together.
get_mouse_button_mask ::
                        (Input :< cls, Object :< cls) => cls -> IO Int
get_mouse_button_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_mouse_button_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_get_mouse_mode #-}

-- | Returns the mouse mode. See the constants for more information.
bindInput_get_mouse_mode :: MethodBind
bindInput_get_mouse_mode
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "get_mouse_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the mouse mode. See the constants for more information.
get_mouse_mode :: (Input :< cls, Object :< cls) => cls -> IO Int
get_mouse_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_get_mouse_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_is_action_just_pressed #-}

-- | Returns [code]true[/code] when the user starts pressing the action event, meaning it's [code]true[/code] only on the frame that the user pressed down the button.
--   				This is useful for code that needs to run only once when an action is pressed, instead of every frame while it's pressed.
bindInput_is_action_just_pressed :: MethodBind
bindInput_is_action_just_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_action_just_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] when the user starts pressing the action event, meaning it's [code]true[/code] only on the frame that the user pressed down the button.
--   				This is useful for code that needs to run only once when an action is pressed, instead of every frame while it's pressed.
is_action_just_pressed ::
                         (Input :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_action_just_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_action_just_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_is_action_just_released #-}

-- | Returns [code]true[/code] when the user stops pressing the action event, meaning it's [code]true[/code] only on the frame that the user released the button.
bindInput_is_action_just_released :: MethodBind
bindInput_is_action_just_released
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_action_just_released" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] when the user stops pressing the action event, meaning it's [code]true[/code] only on the frame that the user released the button.
is_action_just_released ::
                          (Input :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_action_just_released cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_action_just_released
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_is_action_pressed #-}

-- | Returns [code]true[/code] if you are pressing the action event. Note that if an action has multiple buttons asigned and more than one of them is pressed, releasing one button will release the action, even if some other button assigned to this action is still pressed.
bindInput_is_action_pressed :: MethodBind
bindInput_is_action_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_action_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if you are pressing the action event. Note that if an action has multiple buttons asigned and more than one of them is pressed, releasing one button will release the action, even if some other button assigned to this action is still pressed.
is_action_pressed ::
                    (Input :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_action_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_action_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_is_joy_button_pressed #-}

-- | Returns [code]true[/code] if you are pressing the joypad button. (see [code]JOY_*[/code] constants in [@GlobalScope])
bindInput_is_joy_button_pressed :: MethodBind
bindInput_is_joy_button_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_joy_button_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if you are pressing the joypad button. (see [code]JOY_*[/code] constants in [@GlobalScope])
is_joy_button_pressed ::
                        (Input :< cls, Object :< cls) => cls -> Int -> Int -> IO Bool
is_joy_button_pressed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_joy_button_pressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_is_joy_known #-}

-- | Returns [code]true[/code] if the system knows the specified device. This means that it sets all button and axis indices exactly as defined in the [code]JOY_*[/code] constants (see [@GlobalScope]). Unknown joypads are not expected to match these constants, but you can still retrieve events from them.
bindInput_is_joy_known :: MethodBind
bindInput_is_joy_known
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_joy_known" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the system knows the specified device. This means that it sets all button and axis indices exactly as defined in the [code]JOY_*[/code] constants (see [@GlobalScope]). Unknown joypads are not expected to match these constants, but you can still retrieve events from them.
is_joy_known ::
               (Input :< cls, Object :< cls) => cls -> Int -> IO Bool
is_joy_known cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_joy_known (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_is_key_pressed #-}

-- | Returns [code]true[/code] if you are pressing the key. You can pass [code]KEY_*[/code], which are pre-defined constants listed in [@GlobalScope].
bindInput_is_key_pressed :: MethodBind
bindInput_is_key_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_key_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if you are pressing the key. You can pass [code]KEY_*[/code], which are pre-defined constants listed in [@GlobalScope].
is_key_pressed ::
                 (Input :< cls, Object :< cls) => cls -> Int -> IO Bool
is_key_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_key_pressed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_is_mouse_button_pressed #-}

-- | Returns [code]true[/code] if you are pressing the mouse button. You can pass [code]BUTTON_*[/code], which are pre-defined constants listed in [@GlobalScope].
bindInput_is_mouse_button_pressed :: MethodBind
bindInput_is_mouse_button_pressed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "is_mouse_button_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if you are pressing the mouse button. You can pass [code]BUTTON_*[/code], which are pre-defined constants listed in [@GlobalScope].
is_mouse_button_pressed ::
                          (Input :< cls, Object :< cls) => cls -> Int -> IO Bool
is_mouse_button_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_is_mouse_button_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_joy_connection_changed #-}

bindInput_joy_connection_changed :: MethodBind
bindInput_joy_connection_changed
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "joy_connection_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

joy_connection_changed ::
                         (Input :< cls, Object :< cls) =>
                         cls -> Int -> Bool -> GodotString -> GodotString -> IO ()
joy_connection_changed cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_joy_connection_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_parse_input_event #-}

-- | Feeds an [InputEvent] to the game. Can be used to artificially trigger input events from code. Also generates [method Node._input] calls.
--   				Example:
--   				[codeblock]
--   				var a = InputEventAction.new()
--   				a.action = "ui_cancel"
--   				a.pressed = true
--   				Input.parse_input_event(a)
--   				[/codeblock]
bindInput_parse_input_event :: MethodBind
bindInput_parse_input_event
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "parse_input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Feeds an [InputEvent] to the game. Can be used to artificially trigger input events from code. Also generates [method Node._input] calls.
--   				Example:
--   				[codeblock]
--   				var a = InputEventAction.new()
--   				a.action = "ui_cancel"
--   				a.pressed = true
--   				Input.parse_input_event(a)
--   				[/codeblock]
parse_input_event ::
                    (Input :< cls, Object :< cls) => cls -> InputEvent -> IO ()
parse_input_event cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_parse_input_event (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_remove_joy_mapping #-}

-- | Removes all mappings from the internal db that match the given uid.
bindInput_remove_joy_mapping :: MethodBind
bindInput_remove_joy_mapping
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "remove_joy_mapping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all mappings from the internal db that match the given uid.
remove_joy_mapping ::
                     (Input :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_joy_mapping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_remove_joy_mapping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_set_custom_mouse_cursor #-}

-- | Sets a custom mouse cursor image, which is only visible inside the game window. The hotspot can also be specified. Passing [code]null[/code] to the image parameter resets to the system cursor. See enum [code]CURSOR_*[/code] for the list of shapes.
--   				[code]image[/code]'s size must be lower than 256x256.
--   				[code]hotspot[/code] must be within [code]image[/code]'s size.
bindInput_set_custom_mouse_cursor :: MethodBind
bindInput_set_custom_mouse_cursor
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_custom_mouse_cursor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom mouse cursor image, which is only visible inside the game window. The hotspot can also be specified. Passing [code]null[/code] to the image parameter resets to the system cursor. See enum [code]CURSOR_*[/code] for the list of shapes.
--   				[code]image[/code]'s size must be lower than 256x256.
--   				[code]hotspot[/code] must be within [code]image[/code]'s size.
set_custom_mouse_cursor ::
                          (Input :< cls, Object :< cls) =>
                          cls -> Resource -> Int -> Vector2 -> IO ()
set_custom_mouse_cursor cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_custom_mouse_cursor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_set_default_cursor_shape #-}

-- | Sets the default cursor shape to be used in the viewport instead of [constant CURSOR_ARROW].
--   				[b]Note:[/b] If you want to change the default cursor shape for [Control]'s nodes, use [member Control.mouse_default_cursor_shape] instead.
--   				[b]Note:[/b] This method generates an [InputEventMouseMotion] to update cursor immediately.
bindInput_set_default_cursor_shape :: MethodBind
bindInput_set_default_cursor_shape
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_default_cursor_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default cursor shape to be used in the viewport instead of [constant CURSOR_ARROW].
--   				[b]Note:[/b] If you want to change the default cursor shape for [Control]'s nodes, use [member Control.mouse_default_cursor_shape] instead.
--   				[b]Note:[/b] This method generates an [InputEventMouseMotion] to update cursor immediately.
set_default_cursor_shape ::
                           (Input :< cls, Object :< cls) => cls -> Int -> IO ()
set_default_cursor_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_default_cursor_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_set_mouse_mode #-}

-- | Set the mouse mode. See the constants for more information.
bindInput_set_mouse_mode :: MethodBind
bindInput_set_mouse_mode
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_mouse_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the mouse mode. See the constants for more information.
set_mouse_mode ::
                 (Input :< cls, Object :< cls) => cls -> Int -> IO ()
set_mouse_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_mouse_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_set_use_accumulated_input #-}

-- | Whether to accumulate similar input events sent by the operating system. Defaults to [code]true[/code].
bindInput_set_use_accumulated_input :: MethodBind
bindInput_set_use_accumulated_input
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "set_use_accumulated_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Whether to accumulate similar input events sent by the operating system. Defaults to [code]true[/code].
set_use_accumulated_input ::
                            (Input :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_accumulated_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_set_use_accumulated_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_start_joy_vibration #-}

-- | Starts to vibrate the joypad. Joypads usually come with two rumble motors, a strong and a weak one. weak_magnitude is the strength of the weak motor (between 0 and 1) and strong_magnitude is the strength of the strong motor (between 0 and 1). duration is the duration of the effect in seconds (a duration of 0 will try to play the vibration indefinitely).
--   				Note that not every hardware is compatible with long effect durations, it is recommended to restart an effect if in need to play it for more than a few seconds.
bindInput_start_joy_vibration :: MethodBind
bindInput_start_joy_vibration
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "start_joy_vibration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts to vibrate the joypad. Joypads usually come with two rumble motors, a strong and a weak one. weak_magnitude is the strength of the weak motor (between 0 and 1) and strong_magnitude is the strength of the strong motor (between 0 and 1). duration is the duration of the effect in seconds (a duration of 0 will try to play the vibration indefinitely).
--   				Note that not every hardware is compatible with long effect durations, it is recommended to restart an effect if in need to play it for more than a few seconds.
start_joy_vibration ::
                      (Input :< cls, Object :< cls) =>
                      cls -> Int -> Float -> Float -> Float -> IO ()
start_joy_vibration cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_start_joy_vibration (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_stop_joy_vibration #-}

-- | Stops the vibration of the joypad.
bindInput_stop_joy_vibration :: MethodBind
bindInput_stop_joy_vibration
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "stop_joy_vibration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the vibration of the joypad.
stop_joy_vibration ::
                     (Input :< cls, Object :< cls) => cls -> Int -> IO ()
stop_joy_vibration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_stop_joy_vibration (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_vibrate_handheld #-}

-- | Vibrate Android and iOS devices.
--   				[b]Note:[/b] It needs VIBRATE permission for Android at export settings. iOS does not support duration.
bindInput_vibrate_handheld :: MethodBind
bindInput_vibrate_handheld
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "vibrate_handheld" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Vibrate Android and iOS devices.
--   				[b]Note:[/b] It needs VIBRATE permission for Android at export settings. iOS does not support duration.
vibrate_handheld ::
                   (Input :< cls, Object :< cls) => cls -> Int -> IO ()
vibrate_handheld cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_vibrate_handheld (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindInput_warp_mouse_position #-}

-- | Sets the mouse position to the specified vector.
bindInput_warp_mouse_position :: MethodBind
bindInput_warp_mouse_position
  = unsafePerformIO $
      withCString "Input" $
        \ clsNamePtr ->
          withCString "warp_mouse_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the mouse position to the specified vector.
warp_mouse_position ::
                      (Input :< cls, Object :< cls) => cls -> Vector2 -> IO ()
warp_mouse_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInput_warp_mouse_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)