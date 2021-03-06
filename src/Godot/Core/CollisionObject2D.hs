{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CollisionObject2D
       (Godot.Core.CollisionObject2D.sig_input_event,
        Godot.Core.CollisionObject2D.sig_mouse_entered,
        Godot.Core.CollisionObject2D.sig_mouse_exited,
        Godot.Core.CollisionObject2D._input_event,
        Godot.Core.CollisionObject2D.create_shape_owner,
        Godot.Core.CollisionObject2D.get_rid,
        Godot.Core.CollisionObject2D.get_shape_owner_one_way_collision_margin,
        Godot.Core.CollisionObject2D.get_shape_owners,
        Godot.Core.CollisionObject2D.is_pickable,
        Godot.Core.CollisionObject2D.is_shape_owner_disabled,
        Godot.Core.CollisionObject2D.is_shape_owner_one_way_collision_enabled,
        Godot.Core.CollisionObject2D.remove_shape_owner,
        Godot.Core.CollisionObject2D.set_pickable,
        Godot.Core.CollisionObject2D.shape_find_owner,
        Godot.Core.CollisionObject2D.shape_owner_add_shape,
        Godot.Core.CollisionObject2D.shape_owner_clear_shapes,
        Godot.Core.CollisionObject2D.shape_owner_get_owner,
        Godot.Core.CollisionObject2D.shape_owner_get_shape,
        Godot.Core.CollisionObject2D.shape_owner_get_shape_count,
        Godot.Core.CollisionObject2D.shape_owner_get_shape_index,
        Godot.Core.CollisionObject2D.shape_owner_get_transform,
        Godot.Core.CollisionObject2D.shape_owner_remove_shape,
        Godot.Core.CollisionObject2D.shape_owner_set_disabled,
        Godot.Core.CollisionObject2D.shape_owner_set_one_way_collision,
        Godot.Core.CollisionObject2D.shape_owner_set_one_way_collision_margin,
        Godot.Core.CollisionObject2D.shape_owner_set_transform)
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
import Godot.Core.Node2D()

-- | Emitted when an input event occurs. Requires @input_pickable@ to be @true@ and at least one @collision_layer@ bit to be set. See @method _input_event@ for details.
sig_input_event :: Godot.Internal.Dispatch.Signal CollisionObject2D
sig_input_event = Godot.Internal.Dispatch.Signal "input_event"

instance NodeSignal CollisionObject2D "input_event"
           '[Node, InputEvent, Int]

-- | Emitted when the mouse pointer enters any of this object's shapes. Requires @input_pickable@ to be @true@ and at least one @collision_layer@ bit to be set.
sig_mouse_entered ::
                  Godot.Internal.Dispatch.Signal CollisionObject2D
sig_mouse_entered = Godot.Internal.Dispatch.Signal "mouse_entered"

instance NodeSignal CollisionObject2D "mouse_entered" '[]

-- | Emitted when the mouse pointer exits all this object's shapes. Requires @input_pickable@ to be @true@ and at least one @collision_layer@ bit to be set.
sig_mouse_exited ::
                 Godot.Internal.Dispatch.Signal CollisionObject2D
sig_mouse_exited = Godot.Internal.Dispatch.Signal "mouse_exited"

instance NodeSignal CollisionObject2D "mouse_exited" '[]

instance NodeProperty CollisionObject2D "input_pickable" Bool
           'False
         where
        nodeProperty
          = (is_pickable, wrapDroppingSetter set_pickable, Nothing)

{-# NOINLINE bindCollisionObject2D__input_event #-}

-- | Accepts unhandled @InputEvent@s. Requires @input_pickable@ to be @true@. @shape_idx@ is the child index of the clicked @Shape2D@. Connect to the @input_event@ signal to easily pick up these events.
bindCollisionObject2D__input_event :: MethodBind
bindCollisionObject2D__input_event
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "_input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Accepts unhandled @InputEvent@s. Requires @input_pickable@ to be @true@. @shape_idx@ is the child index of the clicked @Shape2D@. Connect to the @input_event@ signal to easily pick up these events.
_input_event ::
               (CollisionObject2D :< cls, Object :< cls) =>
               cls -> Object -> InputEvent -> Int -> IO ()
_input_event cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D__input_event
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "_input_event"
           '[Object, InputEvent, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject2D._input_event

{-# NOINLINE bindCollisionObject2D_create_shape_owner #-}

-- | Creates a new shape owner for the given object. Returns @owner_id@ of the new owner for future reference.
bindCollisionObject2D_create_shape_owner :: MethodBind
bindCollisionObject2D_create_shape_owner
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "create_shape_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new shape owner for the given object. Returns @owner_id@ of the new owner for future reference.
create_shape_owner ::
                     (CollisionObject2D :< cls, Object :< cls) =>
                     cls -> Object -> IO Int
create_shape_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_create_shape_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "create_shape_owner"
           '[Object]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject2D.create_shape_owner

{-# NOINLINE bindCollisionObject2D_get_rid #-}

-- | Returns the object's @RID@.
bindCollisionObject2D_get_rid :: MethodBind
bindCollisionObject2D_get_rid
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "get_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's @RID@.
get_rid ::
          (CollisionObject2D :< cls, Object :< cls) => cls -> IO Rid
get_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_get_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "get_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.CollisionObject2D.get_rid

{-# NOINLINE bindCollisionObject2D_get_shape_owner_one_way_collision_margin
             #-}

-- | Returns the @one_way_collision_margin@ of the shape owner identified by given @owner_id@.
bindCollisionObject2D_get_shape_owner_one_way_collision_margin ::
                                                               MethodBind
bindCollisionObject2D_get_shape_owner_one_way_collision_margin
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "get_shape_owner_one_way_collision_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @one_way_collision_margin@ of the shape owner identified by given @owner_id@.
get_shape_owner_one_way_collision_margin ::
                                           (CollisionObject2D :< cls, Object :< cls) =>
                                           cls -> Int -> IO Float
get_shape_owner_one_way_collision_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_get_shape_owner_one_way_collision_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D
           "get_shape_owner_one_way_collision_margin"
           '[Int]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.CollisionObject2D.get_shape_owner_one_way_collision_margin

{-# NOINLINE bindCollisionObject2D_get_shape_owners #-}

-- | Returns an @Array@ of @owner_id@ identifiers. You can use these ids in other methods that take @owner_id@ as an argument.
bindCollisionObject2D_get_shape_owners :: MethodBind
bindCollisionObject2D_get_shape_owners
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "get_shape_owners" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of @owner_id@ identifiers. You can use these ids in other methods that take @owner_id@ as an argument.
get_shape_owners ::
                   (CollisionObject2D :< cls, Object :< cls) => cls -> IO Array
get_shape_owners cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_get_shape_owners
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "get_shape_owners" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.CollisionObject2D.get_shape_owners

{-# NOINLINE bindCollisionObject2D_is_pickable #-}

-- | If @true@, this object is pickable. A pickable object can detect the mouse pointer entering/leaving, and if the mouse is inside it, report input events. Requires at least one @collision_layer@ bit to be set.
bindCollisionObject2D_is_pickable :: MethodBind
bindCollisionObject2D_is_pickable
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "is_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this object is pickable. A pickable object can detect the mouse pointer entering/leaving, and if the mouse is inside it, report input events. Requires at least one @collision_layer@ bit to be set.
is_pickable ::
              (CollisionObject2D :< cls, Object :< cls) => cls -> IO Bool
is_pickable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_is_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "is_pickable" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject2D.is_pickable

{-# NOINLINE bindCollisionObject2D_is_shape_owner_disabled #-}

-- | If @true@, the shape owner and its shapes are disabled.
bindCollisionObject2D_is_shape_owner_disabled :: MethodBind
bindCollisionObject2D_is_shape_owner_disabled
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "is_shape_owner_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the shape owner and its shapes are disabled.
is_shape_owner_disabled ::
                          (CollisionObject2D :< cls, Object :< cls) => cls -> Int -> IO Bool
is_shape_owner_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_is_shape_owner_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "is_shape_owner_disabled"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionObject2D.is_shape_owner_disabled

{-# NOINLINE bindCollisionObject2D_is_shape_owner_one_way_collision_enabled
             #-}

-- | Returns @true@ if collisions for the shape owner originating from this @CollisionObject2D@ will not be reported to collided with @CollisionObject2D@s.
bindCollisionObject2D_is_shape_owner_one_way_collision_enabled ::
                                                               MethodBind
bindCollisionObject2D_is_shape_owner_one_way_collision_enabled
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "is_shape_owner_one_way_collision_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if collisions for the shape owner originating from this @CollisionObject2D@ will not be reported to collided with @CollisionObject2D@s.
is_shape_owner_one_way_collision_enabled ::
                                           (CollisionObject2D :< cls, Object :< cls) =>
                                           cls -> Int -> IO Bool
is_shape_owner_one_way_collision_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_is_shape_owner_one_way_collision_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D
           "is_shape_owner_one_way_collision_enabled"
           '[Int]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.CollisionObject2D.is_shape_owner_one_way_collision_enabled

{-# NOINLINE bindCollisionObject2D_remove_shape_owner #-}

-- | Removes the given shape owner.
bindCollisionObject2D_remove_shape_owner :: MethodBind
bindCollisionObject2D_remove_shape_owner
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "remove_shape_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given shape owner.
remove_shape_owner ::
                     (CollisionObject2D :< cls, Object :< cls) => cls -> Int -> IO ()
remove_shape_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_remove_shape_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "remove_shape_owner" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject2D.remove_shape_owner

{-# NOINLINE bindCollisionObject2D_set_pickable #-}

-- | If @true@, this object is pickable. A pickable object can detect the mouse pointer entering/leaving, and if the mouse is inside it, report input events. Requires at least one @collision_layer@ bit to be set.
bindCollisionObject2D_set_pickable :: MethodBind
bindCollisionObject2D_set_pickable
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "set_pickable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this object is pickable. A pickable object can detect the mouse pointer entering/leaving, and if the mouse is inside it, report input events. Requires at least one @collision_layer@ bit to be set.
set_pickable ::
               (CollisionObject2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_pickable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_set_pickable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "set_pickable" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject2D.set_pickable

{-# NOINLINE bindCollisionObject2D_shape_find_owner #-}

-- | Returns the @owner_id@ of the given shape.
bindCollisionObject2D_shape_find_owner :: MethodBind
bindCollisionObject2D_shape_find_owner
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_find_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @owner_id@ of the given shape.
shape_find_owner ::
                   (CollisionObject2D :< cls, Object :< cls) => cls -> Int -> IO Int
shape_find_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_shape_find_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_find_owner" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_find_owner

{-# NOINLINE bindCollisionObject2D_shape_owner_add_shape #-}

-- | Adds a @Shape2D@ to the shape owner.
bindCollisionObject2D_shape_owner_add_shape :: MethodBind
bindCollisionObject2D_shape_owner_add_shape
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_add_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @Shape2D@ to the shape owner.
shape_owner_add_shape ::
                        (CollisionObject2D :< cls, Object :< cls) =>
                        cls -> Int -> Shape2D -> IO ()
shape_owner_add_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_shape_owner_add_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_add_shape"
           '[Int, Shape2D]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_owner_add_shape

{-# NOINLINE bindCollisionObject2D_shape_owner_clear_shapes #-}

-- | Removes all shapes from the shape owner.
bindCollisionObject2D_shape_owner_clear_shapes :: MethodBind
bindCollisionObject2D_shape_owner_clear_shapes
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_clear_shapes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all shapes from the shape owner.
shape_owner_clear_shapes ::
                           (CollisionObject2D :< cls, Object :< cls) => cls -> Int -> IO ()
shape_owner_clear_shapes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_clear_shapes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_clear_shapes"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_owner_clear_shapes

{-# NOINLINE bindCollisionObject2D_shape_owner_get_owner #-}

-- | Returns the parent object of the given shape owner.
bindCollisionObject2D_shape_owner_get_owner :: MethodBind
bindCollisionObject2D_shape_owner_get_owner
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_get_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent object of the given shape owner.
shape_owner_get_owner ::
                        (CollisionObject2D :< cls, Object :< cls) =>
                        cls -> Int -> IO Object
shape_owner_get_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_shape_owner_get_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_get_owner"
           '[Int]
           (IO Object)
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_owner_get_owner

{-# NOINLINE bindCollisionObject2D_shape_owner_get_shape #-}

-- | Returns the @Shape2D@ with the given id from the given shape owner.
bindCollisionObject2D_shape_owner_get_shape :: MethodBind
bindCollisionObject2D_shape_owner_get_shape
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Shape2D@ with the given id from the given shape owner.
shape_owner_get_shape ::
                        (CollisionObject2D :< cls, Object :< cls) =>
                        cls -> Int -> Int -> IO Shape2D
shape_owner_get_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionObject2D_shape_owner_get_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_get_shape"
           '[Int, Int]
           (IO Shape2D)
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_owner_get_shape

{-# NOINLINE bindCollisionObject2D_shape_owner_get_shape_count #-}

-- | Returns the number of shapes the given shape owner contains.
bindCollisionObject2D_shape_owner_get_shape_count :: MethodBind
bindCollisionObject2D_shape_owner_get_shape_count
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of shapes the given shape owner contains.
shape_owner_get_shape_count ::
                              (CollisionObject2D :< cls, Object :< cls) => cls -> Int -> IO Int
shape_owner_get_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_get_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_get_shape_count"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.CollisionObject2D.shape_owner_get_shape_count

{-# NOINLINE bindCollisionObject2D_shape_owner_get_shape_index #-}

-- | Returns the child index of the @Shape2D@ with the given id from the given shape owner.
bindCollisionObject2D_shape_owner_get_shape_index :: MethodBind
bindCollisionObject2D_shape_owner_get_shape_index
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_get_shape_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the child index of the @Shape2D@ with the given id from the given shape owner.
shape_owner_get_shape_index ::
                              (CollisionObject2D :< cls, Object :< cls) =>
                              cls -> Int -> Int -> IO Int
shape_owner_get_shape_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_get_shape_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_get_shape_index"
           '[Int, Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.CollisionObject2D.shape_owner_get_shape_index

{-# NOINLINE bindCollisionObject2D_shape_owner_get_transform #-}

-- | Returns the shape owner's @Transform2D@.
bindCollisionObject2D_shape_owner_get_transform :: MethodBind
bindCollisionObject2D_shape_owner_get_transform
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shape owner's @Transform2D@.
shape_owner_get_transform ::
                            (CollisionObject2D :< cls, Object :< cls) =>
                            cls -> Int -> IO Transform2d
shape_owner_get_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_get_transform"
           '[Int]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_owner_get_transform

{-# NOINLINE bindCollisionObject2D_shape_owner_remove_shape #-}

-- | Removes a shape from the given shape owner.
bindCollisionObject2D_shape_owner_remove_shape :: MethodBind
bindCollisionObject2D_shape_owner_remove_shape
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_remove_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a shape from the given shape owner.
shape_owner_remove_shape ::
                           (CollisionObject2D :< cls, Object :< cls) =>
                           cls -> Int -> Int -> IO ()
shape_owner_remove_shape cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_remove_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_remove_shape"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_owner_remove_shape

{-# NOINLINE bindCollisionObject2D_shape_owner_set_disabled #-}

-- | If @true@, disables the given shape owner.
bindCollisionObject2D_shape_owner_set_disabled :: MethodBind
bindCollisionObject2D_shape_owner_set_disabled
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, disables the given shape owner.
shape_owner_set_disabled ::
                           (CollisionObject2D :< cls, Object :< cls) =>
                           cls -> Int -> Bool -> IO ()
shape_owner_set_disabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_set_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_set_disabled"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_owner_set_disabled

{-# NOINLINE bindCollisionObject2D_shape_owner_set_one_way_collision
             #-}

-- | If @enable@ is @true@, collisions for the shape owner originating from this @CollisionObject2D@ will not be reported to collided with @CollisionObject2D@s.
bindCollisionObject2D_shape_owner_set_one_way_collision ::
                                                        MethodBind
bindCollisionObject2D_shape_owner_set_one_way_collision
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_set_one_way_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @enable@ is @true@, collisions for the shape owner originating from this @CollisionObject2D@ will not be reported to collided with @CollisionObject2D@s.
shape_owner_set_one_way_collision ::
                                    (CollisionObject2D :< cls, Object :< cls) =>
                                    cls -> Int -> Bool -> IO ()
shape_owner_set_one_way_collision cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_set_one_way_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D
           "shape_owner_set_one_way_collision"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.CollisionObject2D.shape_owner_set_one_way_collision

{-# NOINLINE bindCollisionObject2D_shape_owner_set_one_way_collision_margin
             #-}

-- | Sets the @one_way_collision_margin@ of the shape owner identified by given @owner_id@ to @margin@ pixels.
bindCollisionObject2D_shape_owner_set_one_way_collision_margin ::
                                                               MethodBind
bindCollisionObject2D_shape_owner_set_one_way_collision_margin
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_set_one_way_collision_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @one_way_collision_margin@ of the shape owner identified by given @owner_id@ to @margin@ pixels.
shape_owner_set_one_way_collision_margin ::
                                           (CollisionObject2D :< cls, Object :< cls) =>
                                           cls -> Int -> Float -> IO ()
shape_owner_set_one_way_collision_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_set_one_way_collision_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D
           "shape_owner_set_one_way_collision_margin"
           '[Int, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.CollisionObject2D.shape_owner_set_one_way_collision_margin

{-# NOINLINE bindCollisionObject2D_shape_owner_set_transform #-}

-- | Sets the @Transform2D@ of the given shape owner.
bindCollisionObject2D_shape_owner_set_transform :: MethodBind
bindCollisionObject2D_shape_owner_set_transform
  = unsafePerformIO $
      withCString "CollisionObject2D" $
        \ clsNamePtr ->
          withCString "shape_owner_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform2D@ of the given shape owner.
shape_owner_set_transform ::
                            (CollisionObject2D :< cls, Object :< cls) =>
                            cls -> Int -> Transform2d -> IO ()
shape_owner_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCollisionObject2D_shape_owner_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionObject2D "shape_owner_set_transform"
           '[Int, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionObject2D.shape_owner_set_transform