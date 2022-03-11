{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Navigation
       (Godot.Core.Navigation.get_closest_point,
        Godot.Core.Navigation.get_closest_point_normal,
        Godot.Core.Navigation.get_closest_point_owner,
        Godot.Core.Navigation.get_closest_point_to_segment,
        Godot.Core.Navigation.get_simple_path,
        Godot.Core.Navigation.get_up_vector,
        Godot.Core.Navigation.navmesh_add,
        Godot.Core.Navigation.navmesh_remove,
        Godot.Core.Navigation.navmesh_set_transform,
        Godot.Core.Navigation.set_up_vector)
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

instance NodeProperty Navigation "up_vector" Vector3 'False where
        nodeProperty
          = (get_up_vector, wrapDroppingSetter set_up_vector, Nothing)

{-# NOINLINE bindNavigation_get_closest_point #-}

-- | Returns the navigation point closest to the point given. Points are in local coordinate space.
bindNavigation_get_closest_point :: MethodBind
bindNavigation_get_closest_point
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation point closest to the point given. Points are in local coordinate space.
get_closest_point ::
                    (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_closest_point" '[Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point

{-# NOINLINE bindNavigation_get_closest_point_normal #-}

-- | Returns the surface normal at the navigation point closest to the point given. Useful for rotating a navigation agent according to the navigation mesh it moves on.
bindNavigation_get_closest_point_normal :: MethodBind
bindNavigation_get_closest_point_normal
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the surface normal at the navigation point closest to the point given. Useful for rotating a navigation agent according to the navigation mesh it moves on.
get_closest_point_normal ::
                           (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Vector3
get_closest_point_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_closest_point_normal"
           '[Vector3]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_normal

{-# NOINLINE bindNavigation_get_closest_point_owner #-}

-- | Returns the owner of the @NavigationMesh@ which contains the navigation point closest to the point given. This is usually a @NavigationMeshInstance@. For meshes added via @method navmesh_add@, returns the owner that was given (or @null@ if the @owner@ parameter was omitted).
bindNavigation_get_closest_point_owner :: MethodBind
bindNavigation_get_closest_point_owner
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the owner of the @NavigationMesh@ which contains the navigation point closest to the point given. This is usually a @NavigationMeshInstance@. For meshes added via @method navmesh_add@, returns the owner that was given (or @null@ if the @owner@ parameter was omitted).
get_closest_point_owner ::
                          (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO Object
get_closest_point_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_closest_point_owner" '[Vector3]
           (IO Object)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_owner

{-# NOINLINE bindNavigation_get_closest_point_to_segment #-}

-- | Returns the navigation point closest to the given line segment. When enabling @use_collision@, only considers intersection points between segment and navigation meshes. If multiple intersection points are found, the one closest to the segment start point is returned.
bindNavigation_get_closest_point_to_segment :: MethodBind
bindNavigation_get_closest_point_to_segment
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_closest_point_to_segment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation point closest to the given line segment. When enabling @use_collision@, only considers intersection points between segment and navigation meshes. If multiple intersection points are found, the one closest to the segment start point is returned.
get_closest_point_to_segment ::
                               (Navigation :< cls, Object :< cls) =>
                               cls -> Vector3 -> Vector3 -> Maybe Bool -> IO Vector3
get_closest_point_to_segment cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_closest_point_to_segment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_closest_point_to_segment"
           '[Vector3, Vector3, Maybe Bool]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_closest_point_to_segment

{-# NOINLINE bindNavigation_get_simple_path #-}

-- | Returns the path between two given points. Points are in local coordinate space. If @optimize@ is @true@ (the default), the agent properties associated with each @NavigationMesh@ (radius, height, etc.) are considered in the path calculation, otherwise they are ignored.
--   				__Note:__ This method has known issues and will often return non-optimal paths. These issues will be fixed in Godot 4.0.
bindNavigation_get_simple_path :: MethodBind
bindNavigation_get_simple_path
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_simple_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path between two given points. Points are in local coordinate space. If @optimize@ is @true@ (the default), the agent properties associated with each @NavigationMesh@ (radius, height, etc.) are considered in the path calculation, otherwise they are ignored.
--   				__Note:__ This method has known issues and will often return non-optimal paths. These issues will be fixed in Godot 4.0.
get_simple_path ::
                  (Navigation :< cls, Object :< cls) =>
                  cls -> Vector3 -> Vector3 -> Maybe Bool -> IO PoolVector3Array
get_simple_path cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_simple_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_simple_path"
           '[Vector3, Vector3, Maybe Bool]
           (IO PoolVector3Array)
         where
        nodeMethod = Godot.Core.Navigation.get_simple_path

{-# NOINLINE bindNavigation_get_up_vector #-}

-- | Defines which direction is up. By default, this is @(0, 1, 0)@, which is the world's "up" direction.
bindNavigation_get_up_vector :: MethodBind
bindNavigation_get_up_vector
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "get_up_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines which direction is up. By default, this is @(0, 1, 0)@, which is the world's "up" direction.
get_up_vector ::
                (Navigation :< cls, Object :< cls) => cls -> IO Vector3
get_up_vector cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_get_up_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "get_up_vector" '[] (IO Vector3)
         where
        nodeMethod = Godot.Core.Navigation.get_up_vector

{-# NOINLINE bindNavigation_navmesh_add #-}

-- | Adds a @NavigationMesh@. Returns an ID for use with @method navmesh_remove@ or @method navmesh_set_transform@. If given, a @Transform2D@ is applied to the polygon. The optional @owner@ is used as return value for @method get_closest_point_owner@.
bindNavigation_navmesh_add :: MethodBind
bindNavigation_navmesh_add
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "navmesh_add" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @NavigationMesh@. Returns an ID for use with @method navmesh_remove@ or @method navmesh_set_transform@. If given, a @Transform2D@ is applied to the polygon. The optional @owner@ is used as return value for @method get_closest_point_owner@.
navmesh_add ::
              (Navigation :< cls, Object :< cls) =>
              cls -> NavigationMesh -> Transform -> Maybe Object -> IO Int
navmesh_add cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_navmesh_add (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "navmesh_add"
           '[NavigationMesh, Transform, Maybe Object]
           (IO Int)
         where
        nodeMethod = Godot.Core.Navigation.navmesh_add

{-# NOINLINE bindNavigation_navmesh_remove #-}

-- | Removes the @NavigationMesh@ with the given ID.
bindNavigation_navmesh_remove :: MethodBind
bindNavigation_navmesh_remove
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "navmesh_remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the @NavigationMesh@ with the given ID.
navmesh_remove ::
                 (Navigation :< cls, Object :< cls) => cls -> Int -> IO ()
navmesh_remove cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_navmesh_remove (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "navmesh_remove" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Navigation.navmesh_remove

{-# NOINLINE bindNavigation_navmesh_set_transform #-}

-- | Sets the transform applied to the @NavigationMesh@ with the given ID.
bindNavigation_navmesh_set_transform :: MethodBind
bindNavigation_navmesh_set_transform
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "navmesh_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform applied to the @NavigationMesh@ with the given ID.
navmesh_set_transform ::
                        (Navigation :< cls, Object :< cls) =>
                        cls -> Int -> Transform -> IO ()
navmesh_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_navmesh_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "navmesh_set_transform"
           '[Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation.navmesh_set_transform

{-# NOINLINE bindNavigation_set_up_vector #-}

-- | Defines which direction is up. By default, this is @(0, 1, 0)@, which is the world's "up" direction.
bindNavigation_set_up_vector :: MethodBind
bindNavigation_set_up_vector
  = unsafePerformIO $
      withCString "Navigation" $
        \ clsNamePtr ->
          withCString "set_up_vector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines which direction is up. By default, this is @(0, 1, 0)@, which is the world's "up" direction.
set_up_vector ::
                (Navigation :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_up_vector cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation_set_up_vector (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation "set_up_vector" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.Navigation.set_up_vector