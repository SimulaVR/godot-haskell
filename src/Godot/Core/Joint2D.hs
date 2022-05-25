{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Joint2D
       (Godot.Core.Joint2D.get_bias,
        Godot.Core.Joint2D.get_exclude_nodes_from_collision,
        Godot.Core.Joint2D.get_node_a, Godot.Core.Joint2D.get_node_b,
        Godot.Core.Joint2D.set_bias,
        Godot.Core.Joint2D.set_exclude_nodes_from_collision,
        Godot.Core.Joint2D.set_node_a, Godot.Core.Joint2D.set_node_b)
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

instance NodeProperty Joint2D "bias" Float 'False where
        nodeProperty = (get_bias, wrapDroppingSetter set_bias, Nothing)

instance NodeProperty Joint2D "disable_collision" Bool 'False where
        nodeProperty
          = (get_exclude_nodes_from_collision,
             wrapDroppingSetter set_exclude_nodes_from_collision, Nothing)

instance NodeProperty Joint2D "node_a" NodePath 'False where
        nodeProperty = (get_node_a, wrapDroppingSetter set_node_a, Nothing)

instance NodeProperty Joint2D "node_b" NodePath 'False where
        nodeProperty = (get_node_b, wrapDroppingSetter set_node_b, Nothing)

{-# NOINLINE bindJoint2D_get_bias #-}

-- | When @node_a@ and @node_b@ move in different directions the @bias@ controls how fast the joint pulls them back to their original position. The lower the @bias@ the more the two bodies can pull on the joint.
bindJoint2D_get_bias :: MethodBind
bindJoint2D_get_bias
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "get_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When @node_a@ and @node_b@ move in different directions the @bias@ controls how fast the joint pulls them back to their original position. The lower the @bias@ the more the two bodies can pull on the joint.
get_bias :: (Joint2D :< cls, Object :< cls) => cls -> IO Float
get_bias cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_get_bias (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Joint2D "get_bias" '[] (IO Float) where
        nodeMethod = Godot.Core.Joint2D.get_bias

{-# NOINLINE bindJoint2D_get_exclude_nodes_from_collision #-}

-- | If @true@, @node_a@ and @node_b@ can collide.
bindJoint2D_get_exclude_nodes_from_collision :: MethodBind
bindJoint2D_get_exclude_nodes_from_collision
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "get_exclude_nodes_from_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @node_a@ and @node_b@ can collide.
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

instance NodeMethod Joint2D "get_exclude_nodes_from_collision" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Joint2D.get_exclude_nodes_from_collision

{-# NOINLINE bindJoint2D_get_node_a #-}

-- | The first body attached to the joint. Must derive from @PhysicsBody2D@.
bindJoint2D_get_node_a :: MethodBind
bindJoint2D_get_node_a
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "get_node_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The first body attached to the joint. Must derive from @PhysicsBody2D@.
get_node_a :: (Joint2D :< cls, Object :< cls) => cls -> IO NodePath
get_node_a cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_get_node_a (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Joint2D "get_node_a" '[] (IO NodePath) where
        nodeMethod = Godot.Core.Joint2D.get_node_a

{-# NOINLINE bindJoint2D_get_node_b #-}

-- | The second body attached to the joint. Must derive from @PhysicsBody2D@.
bindJoint2D_get_node_b :: MethodBind
bindJoint2D_get_node_b
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "get_node_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The second body attached to the joint. Must derive from @PhysicsBody2D@.
get_node_b :: (Joint2D :< cls, Object :< cls) => cls -> IO NodePath
get_node_b cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_get_node_b (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Joint2D "get_node_b" '[] (IO NodePath) where
        nodeMethod = Godot.Core.Joint2D.get_node_b

{-# NOINLINE bindJoint2D_set_bias #-}

-- | When @node_a@ and @node_b@ move in different directions the @bias@ controls how fast the joint pulls them back to their original position. The lower the @bias@ the more the two bodies can pull on the joint.
bindJoint2D_set_bias :: MethodBind
bindJoint2D_set_bias
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "set_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When @node_a@ and @node_b@ move in different directions the @bias@ controls how fast the joint pulls them back to their original position. The lower the @bias@ the more the two bodies can pull on the joint.
set_bias ::
           (Joint2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_set_bias (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Joint2D "set_bias" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Joint2D.set_bias

{-# NOINLINE bindJoint2D_set_exclude_nodes_from_collision #-}

-- | If @true@, @node_a@ and @node_b@ can collide.
bindJoint2D_set_exclude_nodes_from_collision :: MethodBind
bindJoint2D_set_exclude_nodes_from_collision
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "set_exclude_nodes_from_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @node_a@ and @node_b@ can collide.
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

instance NodeMethod Joint2D "set_exclude_nodes_from_collision"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Joint2D.set_exclude_nodes_from_collision

{-# NOINLINE bindJoint2D_set_node_a #-}

-- | The first body attached to the joint. Must derive from @PhysicsBody2D@.
bindJoint2D_set_node_a :: MethodBind
bindJoint2D_set_node_a
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "set_node_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The first body attached to the joint. Must derive from @PhysicsBody2D@.
set_node_a ::
             (Joint2D :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_node_a cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_set_node_a (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Joint2D "set_node_a" '[NodePath] (IO ()) where
        nodeMethod = Godot.Core.Joint2D.set_node_a

{-# NOINLINE bindJoint2D_set_node_b #-}

-- | The second body attached to the joint. Must derive from @PhysicsBody2D@.
bindJoint2D_set_node_b :: MethodBind
bindJoint2D_set_node_b
  = unsafePerformIO $
      withCString "Joint2D" $
        \ clsNamePtr ->
          withCString "set_node_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The second body attached to the joint. Must derive from @PhysicsBody2D@.
set_node_b ::
             (Joint2D :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_node_b cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJoint2D_set_node_b (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Joint2D "set_node_b" '[NodePath] (IO ()) where
        nodeMethod = Godot.Core.Joint2D.set_node_b