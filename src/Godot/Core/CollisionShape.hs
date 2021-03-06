{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CollisionShape
       (Godot.Core.CollisionShape._shape_changed,
        Godot.Core.CollisionShape._update_debug_shape,
        Godot.Core.CollisionShape.get_shape,
        Godot.Core.CollisionShape.is_disabled,
        Godot.Core.CollisionShape.make_convex_from_brothers,
        Godot.Core.CollisionShape.resource_changed,
        Godot.Core.CollisionShape.set_disabled,
        Godot.Core.CollisionShape.set_shape)
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
import Godot.Core.Spatial()

instance NodeProperty CollisionShape "disabled" Bool 'False where
        nodeProperty
          = (is_disabled, wrapDroppingSetter set_disabled, Nothing)

instance NodeProperty CollisionShape "shape" Shape 'False where
        nodeProperty = (get_shape, wrapDroppingSetter set_shape, Nothing)

{-# NOINLINE bindCollisionShape__shape_changed #-}

bindCollisionShape__shape_changed :: MethodBind
bindCollisionShape__shape_changed
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "_shape_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_shape_changed ::
                 (CollisionShape :< cls, Object :< cls) => cls -> IO ()
_shape_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape__shape_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionShape "_shape_changed" '[] (IO ())
         where
        nodeMethod = Godot.Core.CollisionShape._shape_changed

{-# NOINLINE bindCollisionShape__update_debug_shape #-}

bindCollisionShape__update_debug_shape :: MethodBind
bindCollisionShape__update_debug_shape
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "_update_debug_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_debug_shape ::
                      (CollisionShape :< cls, Object :< cls) => cls -> IO ()
_update_debug_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape__update_debug_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionShape "_update_debug_shape" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionShape._update_debug_shape

{-# NOINLINE bindCollisionShape_get_shape #-}

-- | The actual shape owned by this collision shape.
bindCollisionShape_get_shape :: MethodBind
bindCollisionShape_get_shape
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The actual shape owned by this collision shape.
get_shape ::
            (CollisionShape :< cls, Object :< cls) => cls -> IO Shape
get_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_get_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionShape "get_shape" '[] (IO Shape) where
        nodeMethod = Godot.Core.CollisionShape.get_shape

{-# NOINLINE bindCollisionShape_is_disabled #-}

-- | A disabled collision shape has no effect in the world.
bindCollisionShape_is_disabled :: MethodBind
bindCollisionShape_is_disabled
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "is_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A disabled collision shape has no effect in the world.
is_disabled ::
              (CollisionShape :< cls, Object :< cls) => cls -> IO Bool
is_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_is_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionShape "is_disabled" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CollisionShape.is_disabled

{-# NOINLINE bindCollisionShape_make_convex_from_brothers #-}

-- | Sets the collision shape's shape to the addition of all its convexed @MeshInstance@ siblings geometry.
bindCollisionShape_make_convex_from_brothers :: MethodBind
bindCollisionShape_make_convex_from_brothers
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "make_convex_from_brothers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the collision shape's shape to the addition of all its convexed @MeshInstance@ siblings geometry.
make_convex_from_brothers ::
                            (CollisionShape :< cls, Object :< cls) => cls -> IO ()
make_convex_from_brothers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_make_convex_from_brothers
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionShape "make_convex_from_brothers" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionShape.make_convex_from_brothers

{-# NOINLINE bindCollisionShape_resource_changed #-}

-- | If this method exists within a script it will be called whenever the shape resource has been modified.
bindCollisionShape_resource_changed :: MethodBind
bindCollisionShape_resource_changed
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "resource_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this method exists within a script it will be called whenever the shape resource has been modified.
resource_changed ::
                   (CollisionShape :< cls, Object :< cls) => cls -> Resource -> IO ()
resource_changed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_resource_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionShape "resource_changed" '[Resource]
           (IO ())
         where
        nodeMethod = Godot.Core.CollisionShape.resource_changed

{-# NOINLINE bindCollisionShape_set_disabled #-}

-- | A disabled collision shape has no effect in the world.
bindCollisionShape_set_disabled :: MethodBind
bindCollisionShape_set_disabled
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A disabled collision shape has no effect in the world.
set_disabled ::
               (CollisionShape :< cls, Object :< cls) => cls -> Bool -> IO ()
set_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_set_disabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionShape "set_disabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.CollisionShape.set_disabled

{-# NOINLINE bindCollisionShape_set_shape #-}

-- | The actual shape owned by this collision shape.
bindCollisionShape_set_shape :: MethodBind
bindCollisionShape_set_shape
  = unsafePerformIO $
      withCString "CollisionShape" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The actual shape owned by this collision shape.
set_shape ::
            (CollisionShape :< cls, Object :< cls) => cls -> Shape -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCollisionShape_set_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CollisionShape "set_shape" '[Shape] (IO ())
         where
        nodeMethod = Godot.Core.CollisionShape.set_shape