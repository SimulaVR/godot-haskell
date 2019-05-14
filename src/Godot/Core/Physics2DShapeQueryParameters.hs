{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Physics2DShapeQueryParameters
       (Godot.Core.Physics2DShapeQueryParameters.set_shape,
        Godot.Core.Physics2DShapeQueryParameters.set_shape_rid,
        Godot.Core.Physics2DShapeQueryParameters.get_shape_rid,
        Godot.Core.Physics2DShapeQueryParameters.set_transform,
        Godot.Core.Physics2DShapeQueryParameters.get_transform,
        Godot.Core.Physics2DShapeQueryParameters.set_motion,
        Godot.Core.Physics2DShapeQueryParameters.get_motion,
        Godot.Core.Physics2DShapeQueryParameters.set_margin,
        Godot.Core.Physics2DShapeQueryParameters.get_margin,
        Godot.Core.Physics2DShapeQueryParameters.set_collision_layer,
        Godot.Core.Physics2DShapeQueryParameters.get_collision_layer,
        Godot.Core.Physics2DShapeQueryParameters.set_exclude,
        Godot.Core.Physics2DShapeQueryParameters.get_exclude,
        Godot.Core.Physics2DShapeQueryParameters.set_collide_with_bodies,
        Godot.Core.Physics2DShapeQueryParameters.is_collide_with_bodies_enabled,
        Godot.Core.Physics2DShapeQueryParameters.set_collide_with_areas,
        Godot.Core.Physics2DShapeQueryParameters.is_collide_with_areas_enabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_shape #-}

-- | Set the [Shape2D] that will be used for collision/intersection queries.
bindPhysics2DShapeQueryParameters_set_shape :: MethodBind
bindPhysics2DShapeQueryParameters_set_shape
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Set the [Shape2D] that will be used for collision/intersection queries.
set_shape ::
            (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
            cls -> Resource -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DShapeQueryParameters_set_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_shape_rid #-}

-- | The [RID] of the queried shape. See [method set_shape] also.
bindPhysics2DShapeQueryParameters_set_shape_rid :: MethodBind
bindPhysics2DShapeQueryParameters_set_shape_rid
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_shape_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [RID] of the queried shape. See [method set_shape] also.
set_shape_rid ::
                (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                cls -> Rid -> IO ()
set_shape_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_set_shape_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_shape_rid #-}

-- | The [RID] of the queried shape. See [method set_shape] also.
bindPhysics2DShapeQueryParameters_get_shape_rid :: MethodBind
bindPhysics2DShapeQueryParameters_get_shape_rid
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_shape_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [RID] of the queried shape. See [method set_shape] also.
get_shape_rid ::
                (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                cls -> IO Rid
get_shape_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_get_shape_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_transform #-}

-- | the transform matrix of the queried shape.
bindPhysics2DShapeQueryParameters_set_transform :: MethodBind
bindPhysics2DShapeQueryParameters_set_transform
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | the transform matrix of the queried shape.
set_transform ::
                (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                cls -> Transform2d -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_transform #-}

-- | the transform matrix of the queried shape.
bindPhysics2DShapeQueryParameters_get_transform :: MethodBind
bindPhysics2DShapeQueryParameters_get_transform
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | the transform matrix of the queried shape.
get_transform ::
                (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                cls -> IO Transform2d
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_motion #-}

-- | The motion of the shape being queried for.
bindPhysics2DShapeQueryParameters_set_motion :: MethodBind
bindPhysics2DShapeQueryParameters_set_motion
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The motion of the shape being queried for.
set_motion ::
             (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
             cls -> Vector2 -> IO ()
set_motion cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DShapeQueryParameters_set_motion
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_motion #-}

-- | The motion of the shape being queried for.
bindPhysics2DShapeQueryParameters_get_motion :: MethodBind
bindPhysics2DShapeQueryParameters_get_motion
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_motion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The motion of the shape being queried for.
get_motion ::
             (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
             cls -> IO Vector2
get_motion cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DShapeQueryParameters_get_motion
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_margin #-}

-- | The collision margin for the shape.
bindPhysics2DShapeQueryParameters_set_margin :: MethodBind
bindPhysics2DShapeQueryParameters_set_margin
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision margin for the shape.
set_margin ::
             (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
             cls -> Float -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DShapeQueryParameters_set_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_margin #-}

-- | The collision margin for the shape.
bindPhysics2DShapeQueryParameters_get_margin :: MethodBind
bindPhysics2DShapeQueryParameters_get_margin
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision margin for the shape.
get_margin ::
             (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
             cls -> IO Float
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DShapeQueryParameters_get_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_collision_layer
             #-}

-- | The physics layer the query should be made on.
bindPhysics2DShapeQueryParameters_set_collision_layer :: MethodBind
bindPhysics2DShapeQueryParameters_set_collision_layer
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layer the query should be made on.
set_collision_layer ::
                      (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                      cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_collision_layer
             #-}

-- | The physics layer the query should be made on.
bindPhysics2DShapeQueryParameters_get_collision_layer :: MethodBind
bindPhysics2DShapeQueryParameters_get_collision_layer
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layer the query should be made on.
get_collision_layer ::
                      (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                      cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_get_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_exclude #-}

-- | The list of objects or object [RID]s, that will be excluded from collisions.
bindPhysics2DShapeQueryParameters_set_exclude :: MethodBind
bindPhysics2DShapeQueryParameters_set_exclude
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_exclude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The list of objects or object [RID]s, that will be excluded from collisions.
set_exclude ::
              (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
              cls -> Array -> IO ()
set_exclude cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_set_exclude
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_exclude #-}

-- | The list of objects or object [RID]s, that will be excluded from collisions.
bindPhysics2DShapeQueryParameters_get_exclude :: MethodBind
bindPhysics2DShapeQueryParameters_get_exclude
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_exclude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The list of objects or object [RID]s, that will be excluded from collisions.
get_exclude ::
              (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
              cls -> IO Array
get_exclude cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_get_exclude
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_collide_with_bodies
             #-}

bindPhysics2DShapeQueryParameters_set_collide_with_bodies ::
                                                          MethodBind
bindPhysics2DShapeQueryParameters_set_collide_with_bodies
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collide_with_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collide_with_bodies ::
                          (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                          cls -> Bool -> IO ()
set_collide_with_bodies cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_set_collide_with_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_is_collide_with_bodies_enabled
             #-}

bindPhysics2DShapeQueryParameters_is_collide_with_bodies_enabled ::
                                                                 MethodBind
bindPhysics2DShapeQueryParameters_is_collide_with_bodies_enabled
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "is_collide_with_bodies_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_collide_with_bodies_enabled ::
                                 (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                                 cls -> IO Bool
is_collide_with_bodies_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_is_collide_with_bodies_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_collide_with_areas
             #-}

bindPhysics2DShapeQueryParameters_set_collide_with_areas ::
                                                         MethodBind
bindPhysics2DShapeQueryParameters_set_collide_with_areas
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collide_with_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collide_with_areas ::
                         (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                         cls -> Bool -> IO ()
set_collide_with_areas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_set_collide_with_areas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPhysics2DShapeQueryParameters_is_collide_with_areas_enabled
             #-}

bindPhysics2DShapeQueryParameters_is_collide_with_areas_enabled ::
                                                                MethodBind
bindPhysics2DShapeQueryParameters_is_collide_with_areas_enabled
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "is_collide_with_areas_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_collide_with_areas_enabled ::
                                (Physics2DShapeQueryParameters :< cls, Object :< cls) =>
                                cls -> IO Bool
is_collide_with_areas_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryParameters_is_collide_with_areas_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)