{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ARVRController
       (Godot.Core.ARVRController.sig_button_pressed,
        Godot.Core.ARVRController.sig_button_release,
        Godot.Core.ARVRController.sig_mesh_updated,
        Godot.Core.ARVRController.get_controller_id,
        Godot.Core.ARVRController.get_controller_name,
        Godot.Core.ARVRController.get_hand,
        Godot.Core.ARVRController.get_is_active,
        Godot.Core.ARVRController.get_joystick_axis,
        Godot.Core.ARVRController.get_joystick_id,
        Godot.Core.ARVRController.get_mesh,
        Godot.Core.ARVRController.get_rumble,
        Godot.Core.ARVRController.is_button_pressed,
        Godot.Core.ARVRController.set_controller_id,
        Godot.Core.ARVRController.set_rumble)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when a button on this controller is pressed.
sig_button_pressed :: Godot.Internal.Dispatch.Signal ARVRController
sig_button_pressed
  = Godot.Internal.Dispatch.Signal "button_pressed"

-- | Emitted when a button on this controller is released.
sig_button_release :: Godot.Internal.Dispatch.Signal ARVRController
sig_button_release
  = Godot.Internal.Dispatch.Signal "button_release"

sig_mesh_updated :: Godot.Internal.Dispatch.Signal ARVRController
sig_mesh_updated = Godot.Internal.Dispatch.Signal "mesh_updated"

{-# NOINLINE bindARVRController_get_controller_id #-}

-- | The controller's id.
--   			A controller id of 0 is unbound and will always result in an inactive node. Controller id 1 is reserved for the first controller that identifies itself as the left hand controller and id 2 is reserved for the first controller that identifies itself as the right hand controller.
--   			For any other controller that the [ARVRServer] detects, we continue with controller id 3.
--   			When a controller is turned off, its slot is freed. This ensures controllers will keep the same id even when controllers with lower ids are turned off.
bindARVRController_get_controller_id :: MethodBind
bindARVRController_get_controller_id
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_controller_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The controller's id.
--   			A controller id of 0 is unbound and will always result in an inactive node. Controller id 1 is reserved for the first controller that identifies itself as the left hand controller and id 2 is reserved for the first controller that identifies itself as the right hand controller.
--   			For any other controller that the [ARVRServer] detects, we continue with controller id 3.
--   			When a controller is turned off, its slot is freed. This ensures controllers will keep the same id even when controllers with lower ids are turned off.
get_controller_id ::
                    (ARVRController :< cls, Object :< cls) => cls -> IO Int
get_controller_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_controller_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_get_controller_name #-}

-- | If active, returns the name of the associated controller if provided by the AR/VR SDK used.
bindARVRController_get_controller_name :: MethodBind
bindARVRController_get_controller_name
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_controller_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If active, returns the name of the associated controller if provided by the AR/VR SDK used.
get_controller_name ::
                      (ARVRController :< cls, Object :< cls) => cls -> IO GodotString
get_controller_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_controller_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_get_hand #-}

-- | Returns the hand holding this controller, if known. See TRACKER_* constants in [ARVRPositionalTracker].
bindARVRController_get_hand :: MethodBind
bindARVRController_get_hand
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_hand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the hand holding this controller, if known. See TRACKER_* constants in [ARVRPositionalTracker].
get_hand :: (ARVRController :< cls, Object :< cls) => cls -> IO Int
get_hand cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_hand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_get_is_active #-}

-- | Returns [code]true[/code] if the bound controller is active. ARVR systems attempt to track active controllers.
bindARVRController_get_is_active :: MethodBind
bindARVRController_get_is_active
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the bound controller is active. ARVR systems attempt to track active controllers.
get_is_active ::
                (ARVRController :< cls, Object :< cls) => cls -> IO Bool
get_is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_get_joystick_axis #-}

-- | Returns the value of the given axis for things like triggers, touchpads, etc. that are embedded into the controller.
bindARVRController_get_joystick_axis :: MethodBind
bindARVRController_get_joystick_axis
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_joystick_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the given axis for things like triggers, touchpads, etc. that are embedded into the controller.
get_joystick_axis ::
                    (ARVRController :< cls, Object :< cls) => cls -> Int -> IO Float
get_joystick_axis cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_joystick_axis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_get_joystick_id #-}

-- | Returns the ID of the joystick object bound to this. Every controller tracked by the ARVR Server that has buttons and axis will also be registered as a joystick within Godot. This means that all the normal joystick tracking and input mapping will work for buttons and axis found on the AR/VR controllers. This ID is purely offered as information so you can link up the controller with its joystick entry.
bindARVRController_get_joystick_id :: MethodBind
bindARVRController_get_joystick_id
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_joystick_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the ID of the joystick object bound to this. Every controller tracked by the ARVR Server that has buttons and axis will also be registered as a joystick within Godot. This means that all the normal joystick tracking and input mapping will work for buttons and axis found on the AR/VR controllers. This ID is purely offered as information so you can link up the controller with its joystick entry.
get_joystick_id ::
                  (ARVRController :< cls, Object :< cls) => cls -> IO Int
get_joystick_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_joystick_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_get_mesh #-}

bindARVRController_get_mesh :: MethodBind
bindARVRController_get_mesh
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh ::
           (ARVRController :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_get_rumble #-}

-- | The degree to which the tracker rumbles. Ranges from [code]0.0[/code] to [code]1.0[/code] with precision [code].01[/code]. If changed, updates [member ARVRPositionalTracker.rumble] accordingly.
bindARVRController_get_rumble :: MethodBind
bindARVRController_get_rumble
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "get_rumble" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which the tracker rumbles. Ranges from [code]0.0[/code] to [code]1.0[/code] with precision [code].01[/code]. If changed, updates [member ARVRPositionalTracker.rumble] accordingly.
get_rumble ::
             (ARVRController :< cls, Object :< cls) => cls -> IO Float
get_rumble cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_get_rumble (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_is_button_pressed #-}

-- | Returns [code]true[/code] if the button at index [code]button[/code] is pressed.
bindARVRController_is_button_pressed :: MethodBind
bindARVRController_is_button_pressed
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "is_button_pressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the button at index [code]button[/code] is pressed.
is_button_pressed ::
                    (ARVRController :< cls, Object :< cls) => cls -> Int -> IO Int
is_button_pressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_is_button_pressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_set_controller_id #-}

-- | The controller's id.
--   			A controller id of 0 is unbound and will always result in an inactive node. Controller id 1 is reserved for the first controller that identifies itself as the left hand controller and id 2 is reserved for the first controller that identifies itself as the right hand controller.
--   			For any other controller that the [ARVRServer] detects, we continue with controller id 3.
--   			When a controller is turned off, its slot is freed. This ensures controllers will keep the same id even when controllers with lower ids are turned off.
bindARVRController_set_controller_id :: MethodBind
bindARVRController_set_controller_id
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "set_controller_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The controller's id.
--   			A controller id of 0 is unbound and will always result in an inactive node. Controller id 1 is reserved for the first controller that identifies itself as the left hand controller and id 2 is reserved for the first controller that identifies itself as the right hand controller.
--   			For any other controller that the [ARVRServer] detects, we continue with controller id 3.
--   			When a controller is turned off, its slot is freed. This ensures controllers will keep the same id even when controllers with lower ids are turned off.
set_controller_id ::
                    (ARVRController :< cls, Object :< cls) => cls -> Int -> IO ()
set_controller_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_set_controller_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVRController_set_rumble #-}

-- | The degree to which the tracker rumbles. Ranges from [code]0.0[/code] to [code]1.0[/code] with precision [code].01[/code]. If changed, updates [member ARVRPositionalTracker.rumble] accordingly.
bindARVRController_set_rumble :: MethodBind
bindARVRController_set_rumble
  = unsafePerformIO $
      withCString "ARVRController" $
        \ clsNamePtr ->
          withCString "set_rumble" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The degree to which the tracker rumbles. Ranges from [code]0.0[/code] to [code]1.0[/code] with precision [code].01[/code]. If changed, updates [member ARVRPositionalTracker.rumble] accordingly.
set_rumble ::
             (ARVRController :< cls, Object :< cls) => cls -> Float -> IO ()
set_rumble cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVRController_set_rumble (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)