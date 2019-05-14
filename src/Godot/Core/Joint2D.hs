{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Joint2D
       (Godot.Core.Joint2D.set_node_a, Godot.Core.Joint2D.get_node_a,
        Godot.Core.Joint2D.set_node_b, Godot.Core.Joint2D.get_node_b,
        Godot.Core.Joint2D.set_bias, Godot.Core.Joint2D.get_bias,
        Godot.Core.Joint2D.set_exclude_nodes_from_collision,
        Godot.Core.Joint2D.get_exclude_nodes_from_collision)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindJoint2D_set_node_a #-}

-- | The first body attached to the joint. Must derive from [PhysicsBody2D].
bindJoint2D_set_node_a :: MethodBind
bindJoint2D_set_node_a
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "set_node_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The first body attached to the joint. Must derive from [PhysicsBody2D].
set_node_a ::
             (Joint2D :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_node_a cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_set_node_a (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint2D_get_node_a #-}

-- | The first body attached to the joint. Must derive from [PhysicsBody2D].
bindJoint2D_get_node_a :: MethodBind
bindJoint2D_get_node_a
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "get_node_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The first body attached to the joint. Must derive from [PhysicsBody2D].
get_node_a :: (Joint2D :< cls, Object :< cls) => cls -> IO NodePath
get_node_a cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_get_node_a (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint2D_set_node_b #-}

-- | The second body attached to the joint. Must derive from [PhysicsBody2D].
bindJoint2D_set_node_b :: MethodBind
bindJoint2D_set_node_b
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "set_node_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The second body attached to the joint. Must derive from [PhysicsBody2D].
set_node_b ::
             (Joint2D :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_node_b cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_set_node_b (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint2D_get_node_b #-}

-- | The second body attached to the joint. Must derive from [PhysicsBody2D].
bindJoint2D_get_node_b :: MethodBind
bindJoint2D_get_node_b
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "get_node_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The second body attached to the joint. Must derive from [PhysicsBody2D].
get_node_b :: (Joint2D :< cls, Object :< cls) => cls -> IO NodePath
get_node_b cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_get_node_b (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint2D_set_bias #-}

-- | When [member node_a] and [member node_b] move in different directions the [code]bias[/code] controls how fast the joint pulls them back to their original position. The lower the [code]bias[/code] the more the two bodies can pull on the joint. Default value: [code]0[/code]
bindJoint2D_set_bias :: MethodBind
bindJoint2D_set_bias
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "set_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When [member node_a] and [member node_b] move in different directions the [code]bias[/code] controls how fast the joint pulls them back to their original position. The lower the [code]bias[/code] the more the two bodies can pull on the joint. Default value: [code]0[/code]
set_bias ::
           (Joint2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_set_bias (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint2D_get_bias #-}

-- | When [member node_a] and [member node_b] move in different directions the [code]bias[/code] controls how fast the joint pulls them back to their original position. The lower the [code]bias[/code] the more the two bodies can pull on the joint. Default value: [code]0[/code]
bindJoint2D_get_bias :: MethodBind
bindJoint2D_get_bias
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "get_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When [member node_a] and [member node_b] move in different directions the [code]bias[/code] controls how fast the joint pulls them back to their original position. The lower the [code]bias[/code] the more the two bodies can pull on the joint. Default value: [code]0[/code]
get_bias :: (Joint2D :< cls, Object :< cls) => cls -> IO Float
get_bias cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_get_bias (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint2D_set_exclude_nodes_from_collision #-}

-- | If [code]true[/code], [member node_a] and [member node_b] can collide. Default value: [code]false[/code].
bindJoint2D_set_exclude_nodes_from_collision :: MethodBind
bindJoint2D_set_exclude_nodes_from_collision
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "set_exclude_nodes_from_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [member node_a] and [member node_b] can collide. Default value: [code]false[/code].
set_exclude_nodes_from_collision ::
                                   (Joint2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exclude_nodes_from_collision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_set_exclude_nodes_from_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJoint2D_get_exclude_nodes_from_collision #-}

-- | If [code]true[/code], [member node_a] and [member node_b] can collide. Default value: [code]false[/code].
bindJoint2D_get_exclude_nodes_from_collision :: MethodBind
bindJoint2D_get_exclude_nodes_from_collision
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "get_exclude_nodes_from_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [member node_a] and [member node_b] can collide. Default value: [code]false[/code].
get_exclude_nodes_from_collision ::
                                   (Joint2D :< cls, Object :< cls) => cls -> IO Bool
get_exclude_nodes_from_collision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_get_exclude_nodes_from_collision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)