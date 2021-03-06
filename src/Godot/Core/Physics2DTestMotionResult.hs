{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Physics2DTestMotionResult
       (Godot.Core.Physics2DTestMotionResult.get_collider,
        Godot.Core.Physics2DTestMotionResult.get_collider_id,
        Godot.Core.Physics2DTestMotionResult.get_collider_rid,
        Godot.Core.Physics2DTestMotionResult.get_collider_shape,
        Godot.Core.Physics2DTestMotionResult.get_collider_velocity,
        Godot.Core.Physics2DTestMotionResult.get_collision_normal,
        Godot.Core.Physics2DTestMotionResult.get_collision_point,
        Godot.Core.Physics2DTestMotionResult.get_motion,
        Godot.Core.Physics2DTestMotionResult.get_motion_remainder)
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

instance NodeProperty Physics2DTestMotionResult "collider" Object
           'True
         where
        nodeProperty = (get_collider, (), Nothing)

instance NodeProperty Physics2DTestMotionResult "collider_id" Int
           'True
         where
        nodeProperty = (get_collider_id, (), Nothing)

instance NodeProperty Physics2DTestMotionResult "collider_rid" Rid
           'True
         where
        nodeProperty = (get_collider_rid, (), Nothing)

instance NodeProperty Physics2DTestMotionResult "collider_shape"
           Int
           'True
         where
        nodeProperty = (get_collider_shape, (), Nothing)

instance NodeProperty Physics2DTestMotionResult "collider_velocity"
           Vector2
           'True
         where
        nodeProperty = (get_collider_velocity, (), Nothing)

instance NodeProperty Physics2DTestMotionResult "collision_normal"
           Vector2
           'True
         where
        nodeProperty = (get_collision_normal, (), Nothing)

instance NodeProperty Physics2DTestMotionResult "collision_point"
           Vector2
           'True
         where
        nodeProperty = (get_collision_point, (), Nothing)

instance NodeProperty Physics2DTestMotionResult "motion" Vector2
           'True
         where
        nodeProperty = (get_motion, (), Nothing)

instance NodeProperty Physics2DTestMotionResult "motion_remainder"
           Vector2
           'True
         where
        nodeProperty = (get_motion_remainder, (), Nothing)

{-# NOINLINE bindPhysics2DTestMotionResult_get_collider #-}

bindPhysics2DTestMotionResult_get_collider :: MethodBind
bindPhysics2DTestMotionResult_get_collider
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider ::
               (Physics2DTestMotionResult :< cls, Object :< cls) =>
               cls -> IO Object
get_collider cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DTestMotionResult_get_collider
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult "get_collider" '[]
           (IO Object)
         where
        nodeMethod = Godot.Core.Physics2DTestMotionResult.get_collider

{-# NOINLINE bindPhysics2DTestMotionResult_get_collider_id #-}

bindPhysics2DTestMotionResult_get_collider_id :: MethodBind
bindPhysics2DTestMotionResult_get_collider_id
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider_id ::
                  (Physics2DTestMotionResult :< cls, Object :< cls) => cls -> IO Int
get_collider_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DTestMotionResult_get_collider_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult "get_collider_id" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DTestMotionResult.get_collider_id

{-# NOINLINE bindPhysics2DTestMotionResult_get_collider_rid #-}

bindPhysics2DTestMotionResult_get_collider_rid :: MethodBind
bindPhysics2DTestMotionResult_get_collider_rid
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider_rid ::
                   (Physics2DTestMotionResult :< cls, Object :< cls) => cls -> IO Rid
get_collider_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DTestMotionResult_get_collider_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult "get_collider_rid"
           '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DTestMotionResult.get_collider_rid

{-# NOINLINE bindPhysics2DTestMotionResult_get_collider_shape #-}

bindPhysics2DTestMotionResult_get_collider_shape :: MethodBind
bindPhysics2DTestMotionResult_get_collider_shape
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider_shape ::
                     (Physics2DTestMotionResult :< cls, Object :< cls) => cls -> IO Int
get_collider_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DTestMotionResult_get_collider_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult "get_collider_shape"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DTestMotionResult.get_collider_shape

{-# NOINLINE bindPhysics2DTestMotionResult_get_collider_velocity
             #-}

bindPhysics2DTestMotionResult_get_collider_velocity :: MethodBind
bindPhysics2DTestMotionResult_get_collider_velocity
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collider_velocity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collider_velocity ::
                        (Physics2DTestMotionResult :< cls, Object :< cls) =>
                        cls -> IO Vector2
get_collider_velocity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DTestMotionResult_get_collider_velocity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult
           "get_collider_velocity"
           '[]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DTestMotionResult.get_collider_velocity

{-# NOINLINE bindPhysics2DTestMotionResult_get_collision_normal #-}

bindPhysics2DTestMotionResult_get_collision_normal :: MethodBind
bindPhysics2DTestMotionResult_get_collision_normal
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collision_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_normal ::
                       (Physics2DTestMotionResult :< cls, Object :< cls) =>
                       cls -> IO Vector2
get_collision_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DTestMotionResult_get_collision_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult
           "get_collision_normal"
           '[]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DTestMotionResult.get_collision_normal

{-# NOINLINE bindPhysics2DTestMotionResult_get_collision_point #-}

bindPhysics2DTestMotionResult_get_collision_point :: MethodBind
bindPhysics2DTestMotionResult_get_collision_point
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_collision_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_point ::
                      (Physics2DTestMotionResult :< cls, Object :< cls) =>
                      cls -> IO Vector2
get_collision_point cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DTestMotionResult_get_collision_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult "get_collision_point"
           '[]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DTestMotionResult.get_collision_point

{-# NOINLINE bindPhysics2DTestMotionResult_get_motion #-}

bindPhysics2DTestMotionResult_get_motion :: MethodBind
bindPhysics2DTestMotionResult_get_motion
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_motion ::
             (Physics2DTestMotionResult :< cls, Object :< cls) =>
             cls -> IO Vector2
get_motion cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DTestMotionResult_get_motion
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult "get_motion" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Physics2DTestMotionResult.get_motion

{-# NOINLINE bindPhysics2DTestMotionResult_get_motion_remainder #-}

bindPhysics2DTestMotionResult_get_motion_remainder :: MethodBind
bindPhysics2DTestMotionResult_get_motion_remainder
  = unsafePerformIO $
      withCString "Physics2DTestMotionResult" $
        \ clsNamePtr ->
          withCString "get_motion_remainder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_motion_remainder ::
                       (Physics2DTestMotionResult :< cls, Object :< cls) =>
                       cls -> IO Vector2
get_motion_remainder cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DTestMotionResult_get_motion_remainder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DTestMotionResult
           "get_motion_remainder"
           '[]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.Physics2DTestMotionResult.get_motion_remainder