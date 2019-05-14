{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Node2D
       (Godot.Core.Node2D.get_transform,
        Godot.Core.Node2D.get_global_transform,
        Godot.Core.Node2D.set_position, Godot.Core.Node2D.set_rotation,
        Godot.Core.Node2D.set_rotation_degrees,
        Godot.Core.Node2D.set_scale, Godot.Core.Node2D.get_position,
        Godot.Core.Node2D.get_rotation,
        Godot.Core.Node2D.get_rotation_degrees,
        Godot.Core.Node2D.get_scale, Godot.Core.Node2D.rotate,
        Godot.Core.Node2D.move_local_x, Godot.Core.Node2D.move_local_y,
        Godot.Core.Node2D.translate, Godot.Core.Node2D.global_translate,
        Godot.Core.Node2D.apply_scale,
        Godot.Core.Node2D.set_global_position,
        Godot.Core.Node2D.get_global_position,
        Godot.Core.Node2D.set_global_rotation,
        Godot.Core.Node2D.get_global_rotation,
        Godot.Core.Node2D.set_global_rotation_degrees,
        Godot.Core.Node2D.get_global_rotation_degrees,
        Godot.Core.Node2D.set_global_scale,
        Godot.Core.Node2D.get_global_scale,
        Godot.Core.Node2D.set_transform,
        Godot.Core.Node2D.set_global_transform, Godot.Core.Node2D.look_at,
        Godot.Core.Node2D.get_angle_to, Godot.Core.Node2D.to_local,
        Godot.Core.Node2D.to_global, Godot.Core.Node2D.set_z_index,
        Godot.Core.Node2D.get_z_index, Godot.Core.Node2D.set_z_as_relative,
        Godot.Core.Node2D.is_z_relative,
        Godot.Core.Node2D.get_relative_transform_to_parent)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindNode2D_get_transform #-}

-- | Local [Transform2D].
bindNode2D_get_transform :: MethodBind
bindNode2D_get_transform
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Local [Transform2D].
get_transform ::
                (Node2D :< cls, Object :< cls) => cls -> IO Transform2d
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_transform (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_global_transform #-}

-- | Global [Transform2D].
bindNode2D_get_global_transform :: MethodBind
bindNode2D_get_global_transform
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global [Transform2D].
get_global_transform ::
                       (Node2D :< cls, Object :< cls) => cls -> IO Transform2d
get_global_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_global_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_position #-}

-- | Position, relative to the node's parent.
bindNode2D_set_position :: MethodBind
bindNode2D_set_position
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Position, relative to the node's parent.
set_position ::
               (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_position (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_rotation #-}

-- | Rotation in radians, relative to the node's parent.
bindNode2D_set_rotation :: MethodBind
bindNode2D_set_rotation
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation in radians, relative to the node's parent.
set_rotation ::
               (Node2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_rotation_degrees #-}

-- | Rotation in degrees, relative to the node's parent.
bindNode2D_set_rotation_degrees :: MethodBind
bindNode2D_set_rotation_degrees
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation in degrees, relative to the node's parent.
set_rotation_degrees ::
                       (Node2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_rotation_degrees (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_scale #-}

-- | The node's scale. Unscaled value: [code](1, 1)[/code]
bindNode2D_set_scale :: MethodBind
bindNode2D_set_scale
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's scale. Unscaled value: [code](1, 1)[/code]
set_scale ::
            (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_scale (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_position #-}

-- | Position, relative to the node's parent.
bindNode2D_get_position :: MethodBind
bindNode2D_get_position
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Position, relative to the node's parent.
get_position :: (Node2D :< cls, Object :< cls) => cls -> IO Vector2
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_position (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_rotation #-}

-- | Rotation in radians, relative to the node's parent.
bindNode2D_get_rotation :: MethodBind
bindNode2D_get_rotation
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation in radians, relative to the node's parent.
get_rotation :: (Node2D :< cls, Object :< cls) => cls -> IO Float
get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_rotation (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_rotation_degrees #-}

-- | Rotation in degrees, relative to the node's parent.
bindNode2D_get_rotation_degrees :: MethodBind
bindNode2D_get_rotation_degrees
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotation in degrees, relative to the node's parent.
get_rotation_degrees ::
                       (Node2D :< cls, Object :< cls) => cls -> IO Float
get_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_rotation_degrees (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_scale #-}

-- | The node's scale. Unscaled value: [code](1, 1)[/code]
bindNode2D_get_scale :: MethodBind
bindNode2D_get_scale
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's scale. Unscaled value: [code](1, 1)[/code]
get_scale :: (Node2D :< cls, Object :< cls) => cls -> IO Vector2
get_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_scale (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_rotate #-}

-- | Applies a rotation to the node, in radians, starting from its current rotation.
bindNode2D_rotate :: MethodBind
bindNode2D_rotate
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "rotate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a rotation to the node, in radians, starting from its current rotation.
rotate :: (Node2D :< cls, Object :< cls) => cls -> Float -> IO ()
rotate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_rotate (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_move_local_x #-}

-- | Applies a local translation on the node's X axis based on the [method Node._process]'s [code]delta[/code]. If [code]scaled[/code] is false, normalizes the movement.
bindNode2D_move_local_x :: MethodBind
bindNode2D_move_local_x
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "move_local_x" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a local translation on the node's X axis based on the [method Node._process]'s [code]delta[/code]. If [code]scaled[/code] is false, normalizes the movement.
move_local_x ::
               (Node2D :< cls, Object :< cls) => cls -> Float -> Bool -> IO ()
move_local_x cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_move_local_x (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_move_local_y #-}

-- | Applies a local translation on the node's Y axis based on the [method Node._process]'s [code]delta[/code]. If [code]scaled[/code] is false, normalizes the movement.
bindNode2D_move_local_y :: MethodBind
bindNode2D_move_local_y
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "move_local_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Applies a local translation on the node's Y axis based on the [method Node._process]'s [code]delta[/code]. If [code]scaled[/code] is false, normalizes the movement.
move_local_y ::
               (Node2D :< cls, Object :< cls) => cls -> Float -> Bool -> IO ()
move_local_y cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_move_local_y (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_translate #-}

-- | Translates the node by the given [code]offset[/code] in local coordinates.
bindNode2D_translate :: MethodBind
bindNode2D_translate
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Translates the node by the given [code]offset[/code] in local coordinates.
translate ::
            (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_translate (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_global_translate #-}

-- | Adds the 'offset' vector to the node's global position.
bindNode2D_global_translate :: MethodBind
bindNode2D_global_translate
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "global_translate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the 'offset' vector to the node's global position.
global_translate ::
                   (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
global_translate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_global_translate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_apply_scale #-}

-- | Multiplies the current scale by the 'ratio' vector.
bindNode2D_apply_scale :: MethodBind
bindNode2D_apply_scale
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "apply_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the current scale by the 'ratio' vector.
apply_scale ::
              (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
apply_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_apply_scale (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_global_position #-}

-- | Global position.
bindNode2D_set_global_position :: MethodBind
bindNode2D_set_global_position
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global position.
set_global_position ::
                      (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_global_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_global_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_global_position #-}

-- | Global position.
bindNode2D_get_global_position :: MethodBind
bindNode2D_get_global_position
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_global_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global position.
get_global_position ::
                      (Node2D :< cls, Object :< cls) => cls -> IO Vector2
get_global_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_global_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_global_rotation #-}

-- | Global rotation in radians.
bindNode2D_set_global_rotation :: MethodBind
bindNode2D_set_global_rotation
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_global_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global rotation in radians.
set_global_rotation ::
                      (Node2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_global_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_global_rotation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_global_rotation #-}

-- | Global rotation in radians.
bindNode2D_get_global_rotation :: MethodBind
bindNode2D_get_global_rotation
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_global_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global rotation in radians.
get_global_rotation ::
                      (Node2D :< cls, Object :< cls) => cls -> IO Float
get_global_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_global_rotation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_global_rotation_degrees #-}

-- | Global rotation in degrees.
bindNode2D_set_global_rotation_degrees :: MethodBind
bindNode2D_set_global_rotation_degrees
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_global_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global rotation in degrees.
set_global_rotation_degrees ::
                              (Node2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_global_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_global_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_global_rotation_degrees #-}

-- | Global rotation in degrees.
bindNode2D_get_global_rotation_degrees :: MethodBind
bindNode2D_get_global_rotation_degrees
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_global_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global rotation in degrees.
get_global_rotation_degrees ::
                              (Node2D :< cls, Object :< cls) => cls -> IO Float
get_global_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_global_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_global_scale #-}

-- | Global scale.
bindNode2D_set_global_scale :: MethodBind
bindNode2D_set_global_scale
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_global_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global scale.
set_global_scale ::
                   (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_global_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_global_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_global_scale #-}

-- | Global scale.
bindNode2D_get_global_scale :: MethodBind
bindNode2D_get_global_scale
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_global_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global scale.
get_global_scale ::
                   (Node2D :< cls, Object :< cls) => cls -> IO Vector2
get_global_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_global_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_transform #-}

-- | Local [Transform2D].
bindNode2D_set_transform :: MethodBind
bindNode2D_set_transform
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Local [Transform2D].
set_transform ::
                (Node2D :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_transform (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_global_transform #-}

-- | Global [Transform2D].
bindNode2D_set_global_transform :: MethodBind
bindNode2D_set_global_transform
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_global_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Global [Transform2D].
set_global_transform ::
                       (Node2D :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_global_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_global_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_look_at #-}

-- | Rotates the node so it points towards the 'point'.
bindNode2D_look_at :: MethodBind
bindNode2D_look_at
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "look_at" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rotates the node so it points towards the 'point'.
look_at ::
          (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
look_at cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_look_at (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_angle_to #-}

-- | Returns the angle between the node and the 'point' in radians.
bindNode2D_get_angle_to :: MethodBind
bindNode2D_get_angle_to
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_angle_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the angle between the node and the 'point' in radians.
get_angle_to ::
               (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO Float
get_angle_to cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_angle_to (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_to_local #-}

-- | Converts a global point's coordinates to local coordinates.
bindNode2D_to_local :: MethodBind
bindNode2D_to_local
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "to_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts a global point's coordinates to local coordinates.
to_local ::
           (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO Vector2
to_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_to_local (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_to_global #-}

-- | Converts a local point's coordinates to global coordinates.
bindNode2D_to_global :: MethodBind
bindNode2D_to_global
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "to_global" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts a local point's coordinates to global coordinates.
to_global ::
            (Node2D :< cls, Object :< cls) => cls -> Vector2 -> IO Vector2
to_global cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_to_global (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_z_index #-}

-- | Z-index. Controls the order in which the nodes render. A node with a higher Z-index will display in front of others.
bindNode2D_set_z_index :: MethodBind
bindNode2D_set_z_index
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Z-index. Controls the order in which the nodes render. A node with a higher Z-index will display in front of others.
set_z_index ::
              (Node2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_z_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_z_index (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_z_index #-}

-- | Z-index. Controls the order in which the nodes render. A node with a higher Z-index will display in front of others.
bindNode2D_get_z_index :: MethodBind
bindNode2D_get_z_index
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Z-index. Controls the order in which the nodes render. A node with a higher Z-index will display in front of others.
get_z_index :: (Node2D :< cls, Object :< cls) => cls -> IO Int
get_z_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_z_index (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_set_z_as_relative #-}

-- | If [code]true[/code], the node's Z-index is relative to its parent's Z-index. If this node's Z-index is 2 and its parent's effective Z-index is 3, then this node's effective Z-index will be 2 + 3 = 5.
bindNode2D_set_z_as_relative :: MethodBind
bindNode2D_set_z_as_relative
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "set_z_as_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the node's Z-index is relative to its parent's Z-index. If this node's Z-index is 2 and its parent's effective Z-index is 3, then this node's effective Z-index will be 2 + 3 = 5.
set_z_as_relative ::
                    (Node2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_z_as_relative cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_set_z_as_relative (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_is_z_relative #-}

-- | If [code]true[/code], the node's Z-index is relative to its parent's Z-index. If this node's Z-index is 2 and its parent's effective Z-index is 3, then this node's effective Z-index will be 2 + 3 = 5.
bindNode2D_is_z_relative :: MethodBind
bindNode2D_is_z_relative
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "is_z_relative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the node's Z-index is relative to its parent's Z-index. If this node's Z-index is 2 and its parent's effective Z-index is 3, then this node's effective Z-index will be 2 + 3 = 5.
is_z_relative :: (Node2D :< cls, Object :< cls) => cls -> IO Bool
is_z_relative cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_is_z_relative (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNode2D_get_relative_transform_to_parent #-}

-- | Returns the [Transform2D] relative to this node's parent.
bindNode2D_get_relative_transform_to_parent :: MethodBind
bindNode2D_get_relative_transform_to_parent
  = unsafePerformIO $
      withCString "Node2D" $
        \ clsNamePtr ->
          withCString "get_relative_transform_to_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Transform2D] relative to this node's parent.
get_relative_transform_to_parent ::
                                   (Node2D :< cls, Object :< cls) => cls -> Node -> IO Transform2d
get_relative_transform_to_parent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNode2D_get_relative_transform_to_parent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)