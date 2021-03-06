{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Physics2DShapeQueryParameters
       (Godot.Core.Physics2DShapeQueryParameters.get_collision_layer,
        Godot.Core.Physics2DShapeQueryParameters.get_exclude,
        Godot.Core.Physics2DShapeQueryParameters.get_margin,
        Godot.Core.Physics2DShapeQueryParameters.get_motion,
        Godot.Core.Physics2DShapeQueryParameters.get_shape_rid,
        Godot.Core.Physics2DShapeQueryParameters.get_transform,
        Godot.Core.Physics2DShapeQueryParameters.is_collide_with_areas_enabled,
        Godot.Core.Physics2DShapeQueryParameters.is_collide_with_bodies_enabled,
        Godot.Core.Physics2DShapeQueryParameters.set_collide_with_areas,
        Godot.Core.Physics2DShapeQueryParameters.set_collide_with_bodies,
        Godot.Core.Physics2DShapeQueryParameters.set_collision_layer,
        Godot.Core.Physics2DShapeQueryParameters.set_exclude,
        Godot.Core.Physics2DShapeQueryParameters.set_margin,
        Godot.Core.Physics2DShapeQueryParameters.set_motion,
        Godot.Core.Physics2DShapeQueryParameters.set_shape,
        Godot.Core.Physics2DShapeQueryParameters.set_shape_rid,
        Godot.Core.Physics2DShapeQueryParameters.set_transform)
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

instance NodeProperty Physics2DShapeQueryParameters
           "collide_with_areas"
           Bool
           'False
         where
        nodeProperty
          = (is_collide_with_areas_enabled,
             wrapDroppingSetter set_collide_with_areas, Nothing)

instance NodeProperty Physics2DShapeQueryParameters
           "collide_with_bodies"
           Bool
           'False
         where
        nodeProperty
          = (is_collide_with_bodies_enabled,
             wrapDroppingSetter set_collide_with_bodies, Nothing)

instance NodeProperty Physics2DShapeQueryParameters
           "collision_layer"
           Int
           'False
         where
        nodeProperty
          = (get_collision_layer, wrapDroppingSetter set_collision_layer,
             Nothing)

instance NodeProperty Physics2DShapeQueryParameters "exclude" Array
           'False
         where
        nodeProperty
          = (get_exclude, wrapDroppingSetter set_exclude, Nothing)

instance NodeProperty Physics2DShapeQueryParameters "margin" Float
           'False
         where
        nodeProperty = (get_margin, wrapDroppingSetter set_margin, Nothing)

instance NodeProperty Physics2DShapeQueryParameters "motion"
           Vector2
           'False
         where
        nodeProperty = (get_motion, wrapDroppingSetter set_motion, Nothing)

instance NodeProperty Physics2DShapeQueryParameters "shape_rid" Rid
           'False
         where
        nodeProperty
          = (get_shape_rid, wrapDroppingSetter set_shape_rid, Nothing)

instance NodeProperty Physics2DShapeQueryParameters "transform"
           Transform2d
           'False
         where
        nodeProperty
          = (get_transform, wrapDroppingSetter set_transform, Nothing)

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_collision_layer
             #-}

-- | The physics layer(s) the query will take into account (as a bitmask). See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindPhysics2DShapeQueryParameters_get_collision_layer :: MethodBind
bindPhysics2DShapeQueryParameters_get_collision_layer
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layer(s) the query will take into account (as a bitmask). See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
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

instance NodeMethod Physics2DShapeQueryParameters
           "get_collision_layer"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DShapeQueryParameters.get_collision_layer

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_exclude #-}

-- | The list of objects or object @RID@s that will be excluded from collisions.
bindPhysics2DShapeQueryParameters_get_exclude :: MethodBind
bindPhysics2DShapeQueryParameters_get_exclude
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_exclude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The list of objects or object @RID@s that will be excluded from collisions.
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

instance NodeMethod Physics2DShapeQueryParameters "get_exclude" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.get_exclude

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

instance NodeMethod Physics2DShapeQueryParameters "get_margin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.get_margin

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

instance NodeMethod Physics2DShapeQueryParameters "get_motion" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.get_motion

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_shape_rid #-}

-- | The queried shape's @RID@. See also @method set_shape@.
bindPhysics2DShapeQueryParameters_get_shape_rid :: MethodBind
bindPhysics2DShapeQueryParameters_get_shape_rid
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_shape_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The queried shape's @RID@. See also @method set_shape@.
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

instance NodeMethod Physics2DShapeQueryParameters "get_shape_rid"
           '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.get_shape_rid

{-# NOINLINE bindPhysics2DShapeQueryParameters_get_transform #-}

-- | The queried shape's transform matrix.
bindPhysics2DShapeQueryParameters_get_transform :: MethodBind
bindPhysics2DShapeQueryParameters_get_transform
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The queried shape's transform matrix.
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

instance NodeMethod Physics2DShapeQueryParameters "get_transform"
           '[]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.get_transform

{-# NOINLINE bindPhysics2DShapeQueryParameters_is_collide_with_areas_enabled
             #-}

-- | If @true@, the query will take @Area2D@s into account.
bindPhysics2DShapeQueryParameters_is_collide_with_areas_enabled ::
                                                                MethodBind
bindPhysics2DShapeQueryParameters_is_collide_with_areas_enabled
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "is_collide_with_areas_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the query will take @Area2D@s into account.
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

instance NodeMethod Physics2DShapeQueryParameters
           "is_collide_with_areas_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.Physics2DShapeQueryParameters.is_collide_with_areas_enabled

{-# NOINLINE bindPhysics2DShapeQueryParameters_is_collide_with_bodies_enabled
             #-}

-- | If @true@, the query will take @PhysicsBody2D@s into account.
bindPhysics2DShapeQueryParameters_is_collide_with_bodies_enabled ::
                                                                 MethodBind
bindPhysics2DShapeQueryParameters_is_collide_with_bodies_enabled
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "is_collide_with_bodies_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the query will take @PhysicsBody2D@s into account.
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

instance NodeMethod Physics2DShapeQueryParameters
           "is_collide_with_bodies_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.Physics2DShapeQueryParameters.is_collide_with_bodies_enabled

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_collide_with_areas
             #-}

-- | If @true@, the query will take @Area2D@s into account.
bindPhysics2DShapeQueryParameters_set_collide_with_areas ::
                                                         MethodBind
bindPhysics2DShapeQueryParameters_set_collide_with_areas
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collide_with_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the query will take @Area2D@s into account.
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

instance NodeMethod Physics2DShapeQueryParameters
           "set_collide_with_areas"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DShapeQueryParameters.set_collide_with_areas

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_collide_with_bodies
             #-}

-- | If @true@, the query will take @PhysicsBody2D@s into account.
bindPhysics2DShapeQueryParameters_set_collide_with_bodies ::
                                                          MethodBind
bindPhysics2DShapeQueryParameters_set_collide_with_bodies
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collide_with_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the query will take @PhysicsBody2D@s into account.
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

instance NodeMethod Physics2DShapeQueryParameters
           "set_collide_with_bodies"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DShapeQueryParameters.set_collide_with_bodies

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_collision_layer
             #-}

-- | The physics layer(s) the query will take into account (as a bitmask). See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindPhysics2DShapeQueryParameters_set_collision_layer :: MethodBind
bindPhysics2DShapeQueryParameters_set_collision_layer
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layer(s) the query will take into account (as a bitmask). See @url=https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
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

instance NodeMethod Physics2DShapeQueryParameters
           "set_collision_layer"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.Physics2DShapeQueryParameters.set_collision_layer

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_exclude #-}

-- | The list of objects or object @RID@s that will be excluded from collisions.
bindPhysics2DShapeQueryParameters_set_exclude :: MethodBind
bindPhysics2DShapeQueryParameters_set_exclude
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_exclude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The list of objects or object @RID@s that will be excluded from collisions.
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

instance NodeMethod Physics2DShapeQueryParameters "set_exclude"
           '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.set_exclude

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

instance NodeMethod Physics2DShapeQueryParameters "set_margin"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.set_margin

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

instance NodeMethod Physics2DShapeQueryParameters "set_motion"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.set_motion

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_shape #-}

-- | Sets the @Shape2D@ that will be used for collision/intersection queries.
bindPhysics2DShapeQueryParameters_set_shape :: MethodBind
bindPhysics2DShapeQueryParameters_set_shape
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Shape2D@ that will be used for collision/intersection queries.
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

instance NodeMethod Physics2DShapeQueryParameters "set_shape"
           '[Resource]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.set_shape

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_shape_rid #-}

-- | The queried shape's @RID@. See also @method set_shape@.
bindPhysics2DShapeQueryParameters_set_shape_rid :: MethodBind
bindPhysics2DShapeQueryParameters_set_shape_rid
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_shape_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The queried shape's @RID@. See also @method set_shape@.
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

instance NodeMethod Physics2DShapeQueryParameters "set_shape_rid"
           '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.set_shape_rid

{-# NOINLINE bindPhysics2DShapeQueryParameters_set_transform #-}

-- | The queried shape's transform matrix.
bindPhysics2DShapeQueryParameters_set_transform :: MethodBind
bindPhysics2DShapeQueryParameters_set_transform
  = unsafePerformIO $
      withCString "Physics2DShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The queried shape's transform matrix.
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

instance NodeMethod Physics2DShapeQueryParameters "set_transform"
           '[Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryParameters.set_transform