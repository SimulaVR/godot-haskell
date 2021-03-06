{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.KinematicCollision
       (Godot.Core.KinematicCollision.get_collider,
        Godot.Core.KinematicCollision.get_collider_id,
        Godot.Core.KinematicCollision.get_collider_metadata,
        Godot.Core.KinematicCollision.get_collider_shape,
        Godot.Core.KinematicCollision.get_collider_shape_index,
        Godot.Core.KinematicCollision.get_collider_velocity,
        Godot.Core.KinematicCollision.get_local_shape,
        Godot.Core.KinematicCollision.get_normal,
        Godot.Core.KinematicCollision.get_position,
        Godot.Core.KinematicCollision.get_remainder,
        Godot.Core.KinematicCollision.get_travel)
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
import Godot.Core.Reference()

instance NodeProperty KinematicCollision "collider" Object 'True
         where
        nodeProperty = (get_collider, (), Nothing)

instance NodeProperty KinematicCollision "collider_id" Int 'True
         where
        nodeProperty = (get_collider_id, (), Nothing)

instance NodeProperty KinematicCollision "collider_metadata"
           GodotVariant
           'True
         where
        nodeProperty = (get_collider_metadata, (), Nothing)

instance NodeProperty KinematicCollision "collider_shape" Object
           'True
         where
        nodeProperty = (get_collider_shape, (), Nothing)

instance NodeProperty KinematicCollision "collider_shape_index" Int
           'True
         where
        nodeProperty = (get_collider_shape_index, (), Nothing)

instance NodeProperty KinematicCollision "collider_velocity"
           Vector3
           'True
         where
        nodeProperty = (get_collider_velocity, (), Nothing)

instance NodeProperty KinematicCollision "local_shape" Object 'True
         where
        nodeProperty = (get_local_shape, (), Nothing)

instance NodeProperty KinematicCollision "normal" Vector3 'True
         where
        nodeProperty = (get_normal, (), Nothing)

instance NodeProperty KinematicCollision "position" Vector3 'True
         where
        nodeProperty = (get_position, (), Nothing)

instance NodeProperty KinematicCollision "remainder" Vector3 'True
         where
        nodeProperty = (get_remainder, (), Nothing)

instance NodeProperty KinematicCollision "travel" Vector3 'True
         where
        nodeProperty = (get_travel, (), Nothing)

{-# NOINLINE bindKinematicCollision_get_collider #-}

-- | The colliding body.
bindKinematicCollision_get_collider :: MethodBind
bindKinematicCollision_get_collider
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body.
get_collider ::
               (KinematicCollision :< cls, Object :< cls) => cls -> IO Object
get_collider cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_collider
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_collider" '[]
           (IO Object)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_collider

{-# NOINLINE bindKinematicCollision_get_collider_id #-}

-- | The colliding body's unique instance ID. See @method Object.get_instance_id@.
bindKinematicCollision_get_collider_id :: MethodBind
bindKinematicCollision_get_collider_id
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_collider_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body's unique instance ID. See @method Object.get_instance_id@.
get_collider_id ::
                  (KinematicCollision :< cls, Object :< cls) => cls -> IO Int
get_collider_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_collider_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_collider_id" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_collider_id

{-# NOINLINE bindKinematicCollision_get_collider_metadata #-}

-- | The colliding body's metadata. See @Object@.
bindKinematicCollision_get_collider_metadata :: MethodBind
bindKinematicCollision_get_collider_metadata
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_collider_metadata" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body's metadata. See @Object@.
get_collider_metadata ::
                        (KinematicCollision :< cls, Object :< cls) =>
                        cls -> IO GodotVariant
get_collider_metadata cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_collider_metadata
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_collider_metadata" '[]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_collider_metadata

{-# NOINLINE bindKinematicCollision_get_collider_shape #-}

-- | The colliding body's shape.
bindKinematicCollision_get_collider_shape :: MethodBind
bindKinematicCollision_get_collider_shape
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body's shape.
get_collider_shape ::
                     (KinematicCollision :< cls, Object :< cls) => cls -> IO Object
get_collider_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_collider_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_collider_shape" '[]
           (IO Object)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_collider_shape

{-# NOINLINE bindKinematicCollision_get_collider_shape_index #-}

-- | The colliding shape's index. See @CollisionObject@.
bindKinematicCollision_get_collider_shape_index :: MethodBind
bindKinematicCollision_get_collider_shape_index
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_collider_shape_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding shape's index. See @CollisionObject@.
get_collider_shape_index ::
                           (KinematicCollision :< cls, Object :< cls) => cls -> IO Int
get_collider_shape_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindKinematicCollision_get_collider_shape_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_collider_shape_index"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_collider_shape_index

{-# NOINLINE bindKinematicCollision_get_collider_velocity #-}

-- | The colliding object's velocity.
bindKinematicCollision_get_collider_velocity :: MethodBind
bindKinematicCollision_get_collider_velocity
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_collider_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding object's velocity.
get_collider_velocity ::
                        (KinematicCollision :< cls, Object :< cls) => cls -> IO Vector3
get_collider_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_collider_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_collider_velocity" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_collider_velocity

{-# NOINLINE bindKinematicCollision_get_local_shape #-}

-- | The moving object's colliding shape.
bindKinematicCollision_get_local_shape :: MethodBind
bindKinematicCollision_get_local_shape
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_local_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The moving object's colliding shape.
get_local_shape ::
                  (KinematicCollision :< cls, Object :< cls) => cls -> IO Object
get_local_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_local_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_local_shape" '[]
           (IO Object)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_local_shape

{-# NOINLINE bindKinematicCollision_get_normal #-}

-- | The colliding body's shape's normal at the point of collision.
bindKinematicCollision_get_normal :: MethodBind
bindKinematicCollision_get_normal
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The colliding body's shape's normal at the point of collision.
get_normal ::
             (KinematicCollision :< cls, Object :< cls) => cls -> IO Vector3
get_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_normal" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_normal

{-# NOINLINE bindKinematicCollision_get_position #-}

-- | The point of collision, in global coordinates.
bindKinematicCollision_get_position :: MethodBind
bindKinematicCollision_get_position
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The point of collision, in global coordinates.
get_position ::
               (KinematicCollision :< cls, Object :< cls) => cls -> IO Vector3
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_position" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_position

{-# NOINLINE bindKinematicCollision_get_remainder #-}

-- | The moving object's remaining movement vector.
bindKinematicCollision_get_remainder :: MethodBind
bindKinematicCollision_get_remainder
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_remainder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The moving object's remaining movement vector.
get_remainder ::
                (KinematicCollision :< cls, Object :< cls) => cls -> IO Vector3
get_remainder cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_remainder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_remainder" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_remainder

{-# NOINLINE bindKinematicCollision_get_travel #-}

-- | The distance the moving object traveled before collision.
bindKinematicCollision_get_travel :: MethodBind
bindKinematicCollision_get_travel
  = unsafePerformIO $
      withCString "KinematicCollision" $
        \ clsNamePtr ->
          withCString "get_travel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance the moving object traveled before collision.
get_travel ::
             (KinematicCollision :< cls, Object :< cls) => cls -> IO Vector3
get_travel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindKinematicCollision_get_travel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod KinematicCollision "get_travel" '[]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.KinematicCollision.get_travel