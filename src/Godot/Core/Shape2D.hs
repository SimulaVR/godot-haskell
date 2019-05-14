{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Shape2D
       (Godot.Core.Shape2D.set_custom_solver_bias,
        Godot.Core.Shape2D.get_custom_solver_bias,
        Godot.Core.Shape2D.collide, Godot.Core.Shape2D.collide_with_motion,
        Godot.Core.Shape2D.collide_and_get_contacts,
        Godot.Core.Shape2D.collide_with_motion_and_get_contacts)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindShape2D_set_custom_solver_bias #-}

bindShape2D_set_custom_solver_bias :: MethodBind
bindShape2D_set_custom_solver_bias
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "set_custom_solver_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_custom_solver_bias ::
                         (Shape2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_custom_solver_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape2D_set_custom_solver_bias
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShape2D_get_custom_solver_bias #-}

bindShape2D_get_custom_solver_bias :: MethodBind
bindShape2D_get_custom_solver_bias
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "get_custom_solver_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_custom_solver_bias ::
                         (Shape2D :< cls, Object :< cls) => cls -> IO Float
get_custom_solver_bias cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape2D_get_custom_solver_bias
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShape2D_collide #-}

-- | Returns [code]true[/code] if this shape is colliding with another.
--   				This method needs the transformation matrix for this shape ([code]local_xform[/code]), the shape to check collisions with ([code]with_shape[/code]), and the transformation matrix of that shape ([code]shape_xform[/code]).
bindShape2D_collide :: MethodBind
bindShape2D_collide
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "collide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if this shape is colliding with another.
--   				This method needs the transformation matrix for this shape ([code]local_xform[/code]), the shape to check collisions with ([code]with_shape[/code]), and the transformation matrix of that shape ([code]shape_xform[/code]).
collide ::
          (Shape2D :< cls, Object :< cls) =>
          cls -> Transform2d -> Shape2D -> Transform2d -> IO Bool
collide cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape2D_collide (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShape2D_collide_with_motion #-}

-- | Return whether this shape would collide with another, if a given movement was applied.
--   				This method needs the transformation matrix for this shape ([code]local_xform[/code]), the movement to test on this shape ([code]local_motion[/code]), the shape to check collisions with ([code]with_shape[/code]), the transformation matrix of that shape ([code]shape_xform[/code]), and the movement to test onto the other object ([code]shape_motion[/code]).
bindShape2D_collide_with_motion :: MethodBind
bindShape2D_collide_with_motion
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "collide_with_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return whether this shape would collide with another, if a given movement was applied.
--   				This method needs the transformation matrix for this shape ([code]local_xform[/code]), the movement to test on this shape ([code]local_motion[/code]), the shape to check collisions with ([code]with_shape[/code]), the transformation matrix of that shape ([code]shape_xform[/code]), and the movement to test onto the other object ([code]shape_motion[/code]).
collide_with_motion ::
                      (Shape2D :< cls, Object :< cls) =>
                      cls ->
                        Transform2d ->
                          Vector2 -> Shape2D -> Transform2d -> Vector2 -> IO Bool
collide_with_motion cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape2D_collide_with_motion (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShape2D_collide_and_get_contacts #-}

-- | Returns a list of the points where this shape touches another. If there are no collisions the list is empty.
--   				This method needs the transformation matrix for this shape ([code]local_xform[/code]), the shape to check collisions with ([code]with_shape[/code]), and the transformation matrix of that shape ([code]shape_xform[/code]).
bindShape2D_collide_and_get_contacts :: MethodBind
bindShape2D_collide_and_get_contacts
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "collide_and_get_contacts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the points where this shape touches another. If there are no collisions the list is empty.
--   				This method needs the transformation matrix for this shape ([code]local_xform[/code]), the shape to check collisions with ([code]with_shape[/code]), and the transformation matrix of that shape ([code]shape_xform[/code]).
collide_and_get_contacts ::
                           (Shape2D :< cls, Object :< cls) =>
                           cls -> Transform2d -> Shape2D -> Transform2d -> IO Array
collide_and_get_contacts cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape2D_collide_and_get_contacts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindShape2D_collide_with_motion_and_get_contacts #-}

-- | Returns a list of the points where this shape would touch another, if a given movement was applied. If there are no collisions the list is empty.
--   				This method needs the transformation matrix for this shape ([code]local_xform[/code]), the movement to test on this shape ([code]local_motion[/code]), the shape to check collisions with ([code]with_shape[/code]), the transformation matrix of that shape ([code]shape_xform[/code]), and the movement to test onto the other object ([code]shape_motion[/code]).
bindShape2D_collide_with_motion_and_get_contacts :: MethodBind
bindShape2D_collide_with_motion_and_get_contacts
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "collide_with_motion_and_get_contacts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the points where this shape would touch another, if a given movement was applied. If there are no collisions the list is empty.
--   				This method needs the transformation matrix for this shape ([code]local_xform[/code]), the movement to test on this shape ([code]local_motion[/code]), the shape to check collisions with ([code]with_shape[/code]), the transformation matrix of that shape ([code]shape_xform[/code]), and the movement to test onto the other object ([code]shape_motion[/code]).
collide_with_motion_and_get_contacts ::
                                       (Shape2D :< cls, Object :< cls) =>
                                       cls ->
                                         Transform2d ->
                                           Vector2 -> Shape2D -> Transform2d -> Vector2 -> IO Array
collide_with_motion_and_get_contacts cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindShape2D_collide_with_motion_and_get_contacts
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)