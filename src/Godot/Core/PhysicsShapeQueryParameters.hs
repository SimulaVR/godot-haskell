{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsShapeQueryParameters
       (Godot.Core.PhysicsShapeQueryParameters.get_collision_mask,
        Godot.Core.PhysicsShapeQueryParameters.get_exclude,
        Godot.Core.PhysicsShapeQueryParameters.get_margin,
        Godot.Core.PhysicsShapeQueryParameters.get_shape_rid,
        Godot.Core.PhysicsShapeQueryParameters.get_transform,
        Godot.Core.PhysicsShapeQueryParameters.is_collide_with_areas_enabled,
        Godot.Core.PhysicsShapeQueryParameters.is_collide_with_bodies_enabled,
        Godot.Core.PhysicsShapeQueryParameters.set_collide_with_areas,
        Godot.Core.PhysicsShapeQueryParameters.set_collide_with_bodies,
        Godot.Core.PhysicsShapeQueryParameters.set_collision_mask,
        Godot.Core.PhysicsShapeQueryParameters.set_exclude,
        Godot.Core.PhysicsShapeQueryParameters.set_margin,
        Godot.Core.PhysicsShapeQueryParameters.set_shape,
        Godot.Core.PhysicsShapeQueryParameters.set_shape_rid,
        Godot.Core.PhysicsShapeQueryParameters.set_transform)
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

instance NodeProperty PhysicsShapeQueryParameters
           "collide_with_areas"
           Bool
           'False
         where
        nodeProperty
          = (is_collide_with_areas_enabled,
             wrapDroppingSetter set_collide_with_areas, Nothing)

instance NodeProperty PhysicsShapeQueryParameters
           "collide_with_bodies"
           Bool
           'False
         where
        nodeProperty
          = (is_collide_with_bodies_enabled,
             wrapDroppingSetter set_collide_with_bodies, Nothing)

instance NodeProperty PhysicsShapeQueryParameters "collision_mask"
           Int
           'False
         where
        nodeProperty
          = (get_collision_mask, wrapDroppingSetter set_collision_mask,
             Nothing)

instance NodeProperty PhysicsShapeQueryParameters "exclude" Array
           'False
         where
        nodeProperty
          = (get_exclude, wrapDroppingSetter set_exclude, Nothing)

instance NodeProperty PhysicsShapeQueryParameters "margin" Float
           'False
         where
        nodeProperty = (get_margin, wrapDroppingSetter set_margin, Nothing)

instance NodeProperty PhysicsShapeQueryParameters "shape_rid" Rid
           'False
         where
        nodeProperty
          = (get_shape_rid, wrapDroppingSetter set_shape_rid, Nothing)

instance NodeProperty PhysicsShapeQueryParameters "transform"
           Transform
           'False
         where
        nodeProperty
          = (get_transform, wrapDroppingSetter set_transform, Nothing)

{-# NOINLINE bindPhysicsShapeQueryParameters_get_collision_mask #-}

-- | The physics layer(s) the query will take into account (as a bitmask). See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindPhysicsShapeQueryParameters_get_collision_mask :: MethodBind
bindPhysicsShapeQueryParameters_get_collision_mask
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layer(s) the query will take into account (as a bitmask). See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
get_collision_mask ::
                     (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                     cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters
           "get_collision_mask"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.PhysicsShapeQueryParameters.get_collision_mask

{-# NOINLINE bindPhysicsShapeQueryParameters_get_exclude #-}

-- | The list of objects or object @RID@s that will be excluded from collisions.
bindPhysicsShapeQueryParameters_get_exclude :: MethodBind
bindPhysicsShapeQueryParameters_get_exclude
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_exclude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The list of objects or object @RID@s that will be excluded from collisions.
get_exclude ::
              (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
              cls -> IO Array
get_exclude cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsShapeQueryParameters_get_exclude
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "get_exclude" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.get_exclude

{-# NOINLINE bindPhysicsShapeQueryParameters_get_margin #-}

-- | The collision margin for the shape.
bindPhysicsShapeQueryParameters_get_margin :: MethodBind
bindPhysicsShapeQueryParameters_get_margin
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision margin for the shape.
get_margin ::
             (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
             cls -> IO Float
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsShapeQueryParameters_get_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "get_margin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.get_margin

{-# NOINLINE bindPhysicsShapeQueryParameters_get_shape_rid #-}

-- | The queried shape's @RID@. See also @method set_shape@.
bindPhysicsShapeQueryParameters_get_shape_rid :: MethodBind
bindPhysicsShapeQueryParameters_get_shape_rid
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_shape_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The queried shape's @RID@. See also @method set_shape@.
get_shape_rid ::
                (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                cls -> IO Rid
get_shape_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_get_shape_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "get_shape_rid" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.get_shape_rid

{-# NOINLINE bindPhysicsShapeQueryParameters_get_transform #-}

-- | The queried shape's transform matrix.
bindPhysicsShapeQueryParameters_get_transform :: MethodBind
bindPhysicsShapeQueryParameters_get_transform
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The queried shape's transform matrix.
get_transform ::
                (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                cls -> IO Transform
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "get_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.get_transform

{-# NOINLINE bindPhysicsShapeQueryParameters_is_collide_with_areas_enabled
             #-}

-- | If @true@, the query will take @Area@s into account.
bindPhysicsShapeQueryParameters_is_collide_with_areas_enabled ::
                                                              MethodBind
bindPhysicsShapeQueryParameters_is_collide_with_areas_enabled
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "is_collide_with_areas_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the query will take @Area@s into account.
is_collide_with_areas_enabled ::
                                (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                                cls -> IO Bool
is_collide_with_areas_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_is_collide_with_areas_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters
           "is_collide_with_areas_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.PhysicsShapeQueryParameters.is_collide_with_areas_enabled

{-# NOINLINE bindPhysicsShapeQueryParameters_is_collide_with_bodies_enabled
             #-}

-- | If @true@, the query will take @PhysicsBody@s into account.
bindPhysicsShapeQueryParameters_is_collide_with_bodies_enabled ::
                                                               MethodBind
bindPhysicsShapeQueryParameters_is_collide_with_bodies_enabled
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "is_collide_with_bodies_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the query will take @PhysicsBody@s into account.
is_collide_with_bodies_enabled ::
                                 (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                                 cls -> IO Bool
is_collide_with_bodies_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_is_collide_with_bodies_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters
           "is_collide_with_bodies_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.PhysicsShapeQueryParameters.is_collide_with_bodies_enabled

{-# NOINLINE bindPhysicsShapeQueryParameters_set_collide_with_areas
             #-}

-- | If @true@, the query will take @Area@s into account.
bindPhysicsShapeQueryParameters_set_collide_with_areas ::
                                                       MethodBind
bindPhysicsShapeQueryParameters_set_collide_with_areas
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collide_with_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the query will take @Area@s into account.
set_collide_with_areas ::
                         (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                         cls -> Bool -> IO ()
set_collide_with_areas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_set_collide_with_areas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters
           "set_collide_with_areas"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsShapeQueryParameters.set_collide_with_areas

{-# NOINLINE bindPhysicsShapeQueryParameters_set_collide_with_bodies
             #-}

-- | If @true@, the query will take @PhysicsBody@s into account.
bindPhysicsShapeQueryParameters_set_collide_with_bodies ::
                                                        MethodBind
bindPhysicsShapeQueryParameters_set_collide_with_bodies
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collide_with_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the query will take @PhysicsBody@s into account.
set_collide_with_bodies ::
                          (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                          cls -> Bool -> IO ()
set_collide_with_bodies cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_set_collide_with_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters
           "set_collide_with_bodies"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsShapeQueryParameters.set_collide_with_bodies

{-# NOINLINE bindPhysicsShapeQueryParameters_set_collision_mask #-}

-- | The physics layer(s) the query will take into account (as a bitmask). See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
bindPhysicsShapeQueryParameters_set_collision_mask :: MethodBind
bindPhysicsShapeQueryParameters_set_collision_mask
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The physics layer(s) the query will take into account (as a bitmask). See @url=https://docs.godotengine.org/en/3.4/tutorials/physics/physics_introduction.html#collision-layers-and-masks@Collision layers and masks@/url@ in the documentation for more information.
set_collision_mask ::
                     (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                     cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters
           "set_collision_mask"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.PhysicsShapeQueryParameters.set_collision_mask

{-# NOINLINE bindPhysicsShapeQueryParameters_set_exclude #-}

-- | The list of objects or object @RID@s that will be excluded from collisions.
bindPhysicsShapeQueryParameters_set_exclude :: MethodBind
bindPhysicsShapeQueryParameters_set_exclude
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_exclude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The list of objects or object @RID@s that will be excluded from collisions.
set_exclude ::
              (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
              cls -> Array -> IO ()
set_exclude cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsShapeQueryParameters_set_exclude
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "set_exclude"
           '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.set_exclude

{-# NOINLINE bindPhysicsShapeQueryParameters_set_margin #-}

-- | The collision margin for the shape.
bindPhysicsShapeQueryParameters_set_margin :: MethodBind
bindPhysicsShapeQueryParameters_set_margin
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision margin for the shape.
set_margin ::
             (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
             cls -> Float -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsShapeQueryParameters_set_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "set_margin"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.set_margin

{-# NOINLINE bindPhysicsShapeQueryParameters_set_shape #-}

-- | Sets the @Shape@ that will be used for collision/intersection queries.
bindPhysicsShapeQueryParameters_set_shape :: MethodBind
bindPhysicsShapeQueryParameters_set_shape
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Shape@ that will be used for collision/intersection queries.
set_shape ::
            (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
            cls -> Resource -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsShapeQueryParameters_set_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "set_shape"
           '[Resource]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.set_shape

{-# NOINLINE bindPhysicsShapeQueryParameters_set_shape_rid #-}

-- | The queried shape's @RID@. See also @method set_shape@.
bindPhysicsShapeQueryParameters_set_shape_rid :: MethodBind
bindPhysicsShapeQueryParameters_set_shape_rid
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_shape_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The queried shape's @RID@. See also @method set_shape@.
set_shape_rid ::
                (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                cls -> Rid -> IO ()
set_shape_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_set_shape_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "set_shape_rid"
           '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.set_shape_rid

{-# NOINLINE bindPhysicsShapeQueryParameters_set_transform #-}

-- | The queried shape's transform matrix.
bindPhysicsShapeQueryParameters_set_transform :: MethodBind
bindPhysicsShapeQueryParameters_set_transform
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The queried shape's transform matrix.
set_transform ::
                (PhysicsShapeQueryParameters :< cls, Object :< cls) =>
                cls -> Transform -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryParameters_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryParameters "set_transform"
           '[Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryParameters.set_transform