{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CollisionObject
       (Godot.Core.CollisionObject.sig_input_event,
        Godot.Core.CollisionObject.sig_mouse_entered,
        Godot.Core.CollisionObject.sig_mouse_exited,
        Godot.Core.CollisionObject._input_event,
        Godot.Core.CollisionObject.create_shape_owner,
        Godot.Core.CollisionObject.get_capture_input_on_drag,
        Godot.Core.CollisionObject.get_rid,
        Godot.Core.CollisionObject.get_shape_owners,
        Godot.Core.CollisionObject.is_ray_pickable,
        Godot.Core.CollisionObject.is_shape_owner_disabled,
        Godot.Core.CollisionObject.remove_shape_owner,
        Godot.Core.CollisionObject.set_capture_input_on_drag,
        Godot.Core.CollisionObject.set_ray_pickable,
        Godot.Core.CollisionObject.shape_find_owner,
        Godot.Core.CollisionObject.shape_owner_add_shape,
        Godot.Core.CollisionObject.shape_owner_clear_shapes,
        Godot.Core.CollisionObject.shape_owner_get_owner,
        Godot.Core.CollisionObject.shape_owner_get_shape,
        Godot.Core.CollisionObject.shape_owner_get_shape_count,
        Godot.Core.CollisionObject.shape_owner_get_shape_index,
        Godot.Core.CollisionObject.shape_owner_get_transform,
        Godot.Core.CollisionObject.shape_owner_remove_shape,
        Godot.Core.CollisionObject.shape_owner_set_disabled,
        Godot.Core.CollisionObject.shape_owner_set_transform)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when [method _input_event] receives an event. See its description for details.
sig_input_event :: Godot.Internal.Dispatch.Signal CollisionObject
sig_input_event = Godot.Internal.Dispatch.Signal "input_event"

instance NodeSignal CollisionObject "input_event"
           '[Node, InputEvent, Vector3, Vector3, Int]

-- | Emitted when the mouse pointer enters any of this object's shapes.
sig_mouse_entered :: Godot.Internal.Dispatch.Signal CollisionObject
sig_mouse_entered = Godot.Internal.Dispatch.Signal "mouse_entered"

instance NodeSignal CollisionObject "mouse_entered" '[]

-- | Emitted when the mouse pointer exits all this object's shapes.
sig_mouse_exited :: Godot.Internal.Dispatch.Signal CollisionObject
sig_mouse_exited = Godot.Internal.Dispatch.Signal "mouse_exited"

instance NodeSignal CollisionObject "mouse_exited" '[]

{-# NOINLINE bindCollisionObject__input_event #-}

-- | Accepts unhandled [InputEvent]s. [code]click_position[/code] is the clicked location in world space and [code]click_normal[/code] is the normal vector extending from the clicked surface of the [Shape] at [code]shape_idx[/code]. Connect to the [code]input_event[/code] signal to easily pick up these events.
bindCollisionObject__input_event :: MethodBind
bindCollisionObject__input_event
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "_input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Accepts unhandled [InputEvent]s. [code]click_position[/code] is the clicked location in world space and [code]click_normal[/code] is the normal vector extending from the clicked surface of the [Shape] at [code]shape_idx[/code]. Connect to the [code]input_event[/code] signal to easily pick up these events.
_input_event ::
               (CollisionObject :< cls, Object :< cls) =>
               cls -> Object -> InputEvent -> Vector3 -> Vector3 -> Int -> IO ()
_input_event cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject__input_event
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_create_shape_owner #-}

-- | Creates a new shape owner for the given object. Returns [code]owner_id[/code] of the new owner for future reference.
bindCollisionObject_create_shape_owner :: MethodBind
bindCollisionObject_create_shape_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "create_shape_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new shape owner for the given object. Returns [code]owner_id[/code] of the new owner for future reference.
create_shape_owner ::
                     (CollisionObject :< cls, Object :< cls) => cls -> Object -> IO Int
create_shape_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_create_shape_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_get_capture_input_on_drag #-}

-- | If [code]true[/code], the [CollisionObject] will continue to receive input events as the mouse is dragged across its shapes.
bindCollisionObject_get_capture_input_on_drag :: MethodBind
bindCollisionObject_get_capture_input_on_drag
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_capture_input_on_drag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [CollisionObject] will continue to receive input events as the mouse is dragged across its shapes.
get_capture_input_on_drag ::
                            (CollisionObject :< cls, Object :< cls) => cls -> IO Bool
get_capture_input_on_drag cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_get_capture_input_on_drag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_get_rid #-}

-- | Returns the object's [RID].
bindCollisionObject_get_rid :: MethodBind
bindCollisionObject_get_rid
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's [RID].
get_rid :: (CollisionObject :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_get_shape_owners #-}

-- | Returns an [Array] of [code]owner_id[/code] identifiers. You can use these ids in other methods that take [code]owner_id[/code] as an argument.
bindCollisionObject_get_shape_owners :: MethodBind
bindCollisionObject_get_shape_owners
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "get_shape_owners" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an [Array] of [code]owner_id[/code] identifiers. You can use these ids in other methods that take [code]owner_id[/code] as an argument.
get_shape_owners ::
                   (CollisionObject :< cls, Object :< cls) => cls -> IO Array
get_shape_owners cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_get_shape_owners
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_is_ray_pickable #-}

-- | If [code]true[/code], the [CollisionObject]'s shapes will respond to [RayCast]s.
bindCollisionObject_is_ray_pickable :: MethodBind
bindCollisionObject_is_ray_pickable
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "is_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [CollisionObject]'s shapes will respond to [RayCast]s.
is_ray_pickable ::
                  (CollisionObject :< cls, Object :< cls) => cls -> IO Bool
is_ray_pickable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_is_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_is_shape_owner_disabled #-}

-- | If [code]true[/code], the shape owner and its shapes are disabled.
bindCollisionObject_is_shape_owner_disabled :: MethodBind
bindCollisionObject_is_shape_owner_disabled
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "is_shape_owner_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the shape owner and its shapes are disabled.
is_shape_owner_disabled ::
                          (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Bool
is_shape_owner_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_is_shape_owner_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_remove_shape_owner #-}

-- | Removes the given shape owner.
bindCollisionObject_remove_shape_owner :: MethodBind
bindCollisionObject_remove_shape_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "remove_shape_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given shape owner.
remove_shape_owner ::
                     (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO ()
remove_shape_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_remove_shape_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_set_capture_input_on_drag #-}

-- | If [code]true[/code], the [CollisionObject] will continue to receive input events as the mouse is dragged across its shapes.
bindCollisionObject_set_capture_input_on_drag :: MethodBind
bindCollisionObject_set_capture_input_on_drag
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_capture_input_on_drag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [CollisionObject] will continue to receive input events as the mouse is dragged across its shapes.
set_capture_input_on_drag ::
                            (CollisionObject :< cls, Object :< cls) => cls -> Bool -> IO ()
set_capture_input_on_drag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_set_capture_input_on_drag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_set_ray_pickable #-}

-- | If [code]true[/code], the [CollisionObject]'s shapes will respond to [RayCast]s.
bindCollisionObject_set_ray_pickable :: MethodBind
bindCollisionObject_set_ray_pickable
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "set_ray_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [CollisionObject]'s shapes will respond to [RayCast]s.
set_ray_pickable ::
                   (CollisionObject :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ray_pickable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_set_ray_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_find_owner #-}

-- | Returns the [code]owner_id[/code] of the given shape.
bindCollisionObject_shape_find_owner :: MethodBind
bindCollisionObject_shape_find_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_find_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [code]owner_id[/code] of the given shape.
shape_find_owner ::
                   (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Int
shape_find_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_find_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_add_shape #-}

-- | Adds a [Shape] to the shape owner.
bindCollisionObject_shape_owner_add_shape :: MethodBind
bindCollisionObject_shape_owner_add_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [Shape] to the shape owner.
shape_owner_add_shape ::
                        (CollisionObject :< cls, Object :< cls) =>
                        cls -> Int -> Shape -> IO ()
shape_owner_add_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_add_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_clear_shapes #-}

-- | Removes all shapes from the shape owner.
bindCollisionObject_shape_owner_clear_shapes :: MethodBind
bindCollisionObject_shape_owner_clear_shapes
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_clear_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all shapes from the shape owner.
shape_owner_clear_shapes ::
                           (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO ()
shape_owner_clear_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_clear_shapes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_get_owner #-}

-- | Returns the parent object of the given shape owner.
bindCollisionObject_shape_owner_get_owner :: MethodBind
bindCollisionObject_shape_owner_get_owner
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent object of the given shape owner.
shape_owner_get_owner ::
                        (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Object
shape_owner_get_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_get_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_get_shape #-}

-- | Returns the [Shape] with the given id from the given shape owner.
bindCollisionObject_shape_owner_get_shape :: MethodBind
bindCollisionObject_shape_owner_get_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Shape] with the given id from the given shape owner.
shape_owner_get_shape ::
                        (CollisionObject :< cls, Object :< cls) =>
                        cls -> Int -> Int -> IO Shape
shape_owner_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_get_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_get_shape_count #-}

-- | Returns the number of shapes the given shape owner contains.
bindCollisionObject_shape_owner_get_shape_count :: MethodBind
bindCollisionObject_shape_owner_get_shape_count
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of shapes the given shape owner contains.
shape_owner_get_shape_count ::
                              (CollisionObject :< cls, Object :< cls) => cls -> Int -> IO Int
shape_owner_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_get_shape_index #-}

-- | Returns the child index of the [Shape] with the given id from the given shape owner.
bindCollisionObject_shape_owner_get_shape_index :: MethodBind
bindCollisionObject_shape_owner_get_shape_index
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the child index of the [Shape] with the given id from the given shape owner.
shape_owner_get_shape_index ::
                              (CollisionObject :< cls, Object :< cls) =>
                              cls -> Int -> Int -> IO Int
shape_owner_get_shape_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_shape_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_get_transform #-}

-- | Returns the shape owner's [Transform].
bindCollisionObject_shape_owner_get_transform :: MethodBind
bindCollisionObject_shape_owner_get_transform
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shape owner's [Transform].
shape_owner_get_transform ::
                            (CollisionObject :< cls, Object :< cls) =>
                            cls -> Int -> IO Transform
shape_owner_get_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_remove_shape #-}

-- | Removes a shape from the given shape owner.
bindCollisionObject_shape_owner_remove_shape :: MethodBind
bindCollisionObject_shape_owner_remove_shape
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_remove_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a shape from the given shape owner.
shape_owner_remove_shape ::
                           (CollisionObject :< cls, Object :< cls) =>
                           cls -> Int -> Int -> IO ()
shape_owner_remove_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_remove_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_set_disabled #-}

-- | If [code]true[/code], disables the given shape owner.
bindCollisionObject_shape_owner_set_disabled :: MethodBind
bindCollisionObject_shape_owner_set_disabled
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], disables the given shape owner.
shape_owner_set_disabled ::
                           (CollisionObject :< cls, Object :< cls) =>
                           cls -> Int -> Bool -> IO ()
shape_owner_set_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject_shape_owner_set_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCollisionObject_shape_owner_set_transform #-}

-- | Sets the [Transform] of the given shape owner.
bindCollisionObject_shape_owner_set_transform :: MethodBind
bindCollisionObject_shape_owner_set_transform
  = unsafePerformIO $
      withCString "CollisionObject" $
        \ clsNamePtr ->
          withCString "shape_owner_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [Transform] of the given shape owner.
shape_owner_set_transform ::
                            (CollisionObject :< cls, Object :< cls) =>
                            cls -> Int -> Transform -> IO ()
shape_owner_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject_shape_owner_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)