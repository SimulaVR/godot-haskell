{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Shape2D
       (Godot.Core.Shape2D.collide,
        Godot.Core.Shape2D.collide_and_get_contacts,
        Godot.Core.Shape2D.collide_with_motion,
        Godot.Core.Shape2D.collide_with_motion_and_get_contacts,
        Godot.Core.Shape2D.get_custom_solver_bias,
        Godot.Core.Shape2D.set_custom_solver_bias)
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
import Godot.Core.Resource()

instance NodeProperty Shape2D "custom_solver_bias" Float 'False
         where
        nodeProperty
          = (get_custom_solver_bias,
             wrapDroppingSetter set_custom_solver_bias, Nothing)

{-# NOINLINE bindShape2D_collide #-}

-- | Returns @true@ if this shape is colliding with another.
--   				This method needs the transformation matrix for this shape (@local_xform@), the shape to check collisions with (@with_shape@), and the transformation matrix of that shape (@shape_xform@).
bindShape2D_collide :: MethodBind
bindShape2D_collide
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "collide" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this shape is colliding with another.
--   				This method needs the transformation matrix for this shape (@local_xform@), the shape to check collisions with (@with_shape@), and the transformation matrix of that shape (@shape_xform@).
collide ::
          (Shape2D :< cls, Object :< cls) =>
          cls -> Transform2d -> Shape2D -> Transform2d -> IO Bool
collide cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape2D_collide (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Shape2D "collide"
           '[Transform2d, Shape2D, Transform2d]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Shape2D.collide

{-# NOINLINE bindShape2D_collide_and_get_contacts #-}

-- | Returns a list of the points where this shape touches another. If there are no collisions the list is empty.
--   				This method needs the transformation matrix for this shape (@local_xform@), the shape to check collisions with (@with_shape@), and the transformation matrix of that shape (@shape_xform@).
bindShape2D_collide_and_get_contacts :: MethodBind
bindShape2D_collide_and_get_contacts
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "collide_and_get_contacts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the points where this shape touches another. If there are no collisions the list is empty.
--   				This method needs the transformation matrix for this shape (@local_xform@), the shape to check collisions with (@with_shape@), and the transformation matrix of that shape (@shape_xform@).
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

instance NodeMethod Shape2D "collide_and_get_contacts"
           '[Transform2d, Shape2D, Transform2d]
           (IO Array)
         where
        nodeMethod = Godot.Core.Shape2D.collide_and_get_contacts

{-# NOINLINE bindShape2D_collide_with_motion #-}

-- | Returns whether this shape would collide with another, if a given movement was applied.
--   				This method needs the transformation matrix for this shape (@local_xform@), the movement to test on this shape (@local_motion@), the shape to check collisions with (@with_shape@), the transformation matrix of that shape (@shape_xform@), and the movement to test onto the other object (@shape_motion@).
bindShape2D_collide_with_motion :: MethodBind
bindShape2D_collide_with_motion
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "collide_with_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether this shape would collide with another, if a given movement was applied.
--   				This method needs the transformation matrix for this shape (@local_xform@), the movement to test on this shape (@local_motion@), the shape to check collisions with (@with_shape@), the transformation matrix of that shape (@shape_xform@), and the movement to test onto the other object (@shape_motion@).
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

instance NodeMethod Shape2D "collide_with_motion"
           '[Transform2d, Vector2, Shape2D, Transform2d, Vector2]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Shape2D.collide_with_motion

{-# NOINLINE bindShape2D_collide_with_motion_and_get_contacts #-}

-- | Returns a list of the points where this shape would touch another, if a given movement was applied. If there are no collisions the list is empty.
--   				This method needs the transformation matrix for this shape (@local_xform@), the movement to test on this shape (@local_motion@), the shape to check collisions with (@with_shape@), the transformation matrix of that shape (@shape_xform@), and the movement to test onto the other object (@shape_motion@).
bindShape2D_collide_with_motion_and_get_contacts :: MethodBind
bindShape2D_collide_with_motion_and_get_contacts
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "collide_with_motion_and_get_contacts" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of the points where this shape would touch another, if a given movement was applied. If there are no collisions the list is empty.
--   				This method needs the transformation matrix for this shape (@local_xform@), the movement to test on this shape (@local_motion@), the shape to check collisions with (@with_shape@), the transformation matrix of that shape (@shape_xform@), and the movement to test onto the other object (@shape_motion@).
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

instance NodeMethod Shape2D "collide_with_motion_and_get_contacts"
           '[Transform2d, Vector2, Shape2D, Transform2d, Vector2]
           (IO Array)
         where
        nodeMethod
          = Godot.Core.Shape2D.collide_with_motion_and_get_contacts

{-# NOINLINE bindShape2D_get_custom_solver_bias #-}

-- | The shape's custom solver bias.
bindShape2D_get_custom_solver_bias :: MethodBind
bindShape2D_get_custom_solver_bias
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "get_custom_solver_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shape's custom solver bias.
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

instance NodeMethod Shape2D "get_custom_solver_bias" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Shape2D.get_custom_solver_bias

{-# NOINLINE bindShape2D_set_custom_solver_bias #-}

-- | The shape's custom solver bias.
bindShape2D_set_custom_solver_bias :: MethodBind
bindShape2D_set_custom_solver_bias
  = unsafePerformIO $
      withCString "Shape2D" $
        \ clsNamePtr ->
          withCString "set_custom_solver_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shape's custom solver bias.
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

instance NodeMethod Shape2D "set_custom_solver_bias" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Shape2D.set_custom_solver_bias