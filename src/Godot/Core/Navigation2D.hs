{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Navigation2D
       (Godot.Core.Navigation2D.get_closest_point,
        Godot.Core.Navigation2D.get_closest_point_owner,
        Godot.Core.Navigation2D.get_simple_path,
        Godot.Core.Navigation2D.navpoly_add,
        Godot.Core.Navigation2D.navpoly_remove,
        Godot.Core.Navigation2D.navpoly_set_transform)
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

{-# NOINLINE bindNavigation2D_get_closest_point #-}

-- | Returns the navigation point closest to the point given. Points are in local coordinate space.
bindNavigation2D_get_closest_point :: MethodBind
bindNavigation2D_get_closest_point
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_closest_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the navigation point closest to the point given. Points are in local coordinate space.
get_closest_point ::
                    (Navigation2D :< cls, Object :< cls) =>
                    cls -> Vector2 -> IO Vector2
get_closest_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_closest_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation2D "get_closest_point" '[Vector2]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Navigation2D.get_closest_point

{-# NOINLINE bindNavigation2D_get_closest_point_owner #-}

-- | Returns the owner of the @NavigationPolygon@ which contains the navigation point closest to the point given. This is usually a @NavigationPolygonInstance@. For polygons added via @method navpoly_add@, returns the owner that was given (or @null@ if the @owner@ parameter was omitted).
bindNavigation2D_get_closest_point_owner :: MethodBind
bindNavigation2D_get_closest_point_owner
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_closest_point_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the owner of the @NavigationPolygon@ which contains the navigation point closest to the point given. This is usually a @NavigationPolygonInstance@. For polygons added via @method navpoly_add@, returns the owner that was given (or @null@ if the @owner@ parameter was omitted).
get_closest_point_owner ::
                          (Navigation2D :< cls, Object :< cls) => cls -> Vector2 -> IO Object
get_closest_point_owner cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_closest_point_owner
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation2D "get_closest_point_owner"
           '[Vector2]
           (IO Object)
         where
        nodeMethod = Godot.Core.Navigation2D.get_closest_point_owner

{-# NOINLINE bindNavigation2D_get_simple_path #-}

-- | Returns the path between two given points. Points are in local coordinate space. If @optimize@ is @true@ (the default), the path is smoothed by merging path segments where possible.
--   				__Note:__ This method has known issues and will often return non-optimal paths. These issues will be fixed in Godot 4.0.
bindNavigation2D_get_simple_path :: MethodBind
bindNavigation2D_get_simple_path
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_simple_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path between two given points. Points are in local coordinate space. If @optimize@ is @true@ (the default), the path is smoothed by merging path segments where possible.
--   				__Note:__ This method has known issues and will often return non-optimal paths. These issues will be fixed in Godot 4.0.
get_simple_path ::
                  (Navigation2D :< cls, Object :< cls) =>
                  cls -> Vector2 -> Vector2 -> Maybe Bool -> IO PoolVector2Array
get_simple_path cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_simple_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation2D "get_simple_path"
           '[Vector2, Vector2, Maybe Bool]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.Navigation2D.get_simple_path

{-# NOINLINE bindNavigation2D_navpoly_add #-}

-- | Adds a @NavigationPolygon@. Returns an ID for use with @method navpoly_remove@ or @method navpoly_set_transform@. If given, a @Transform2D@ is applied to the polygon. The optional @owner@ is used as return value for @method get_closest_point_owner@.
bindNavigation2D_navpoly_add :: MethodBind
bindNavigation2D_navpoly_add
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "navpoly_add" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @NavigationPolygon@. Returns an ID for use with @method navpoly_remove@ or @method navpoly_set_transform@. If given, a @Transform2D@ is applied to the polygon. The optional @owner@ is used as return value for @method get_closest_point_owner@.
navpoly_add ::
              (Navigation2D :< cls, Object :< cls) =>
              cls -> NavigationPolygon -> Transform2d -> Maybe Object -> IO Int
navpoly_add cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_navpoly_add (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation2D "navpoly_add"
           '[NavigationPolygon, Transform2d, Maybe Object]
           (IO Int)
         where
        nodeMethod = Godot.Core.Navigation2D.navpoly_add

{-# NOINLINE bindNavigation2D_navpoly_remove #-}

-- | Removes the @NavigationPolygon@ with the given ID.
bindNavigation2D_navpoly_remove :: MethodBind
bindNavigation2D_navpoly_remove
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "navpoly_remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the @NavigationPolygon@ with the given ID.
navpoly_remove ::
                 (Navigation2D :< cls, Object :< cls) => cls -> Int -> IO ()
navpoly_remove cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_navpoly_remove (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation2D "navpoly_remove" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Navigation2D.navpoly_remove

{-# NOINLINE bindNavigation2D_navpoly_set_transform #-}

-- | Sets the transform applied to the @NavigationPolygon@ with the given ID.
bindNavigation2D_navpoly_set_transform :: MethodBind
bindNavigation2D_navpoly_set_transform
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "navpoly_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform applied to the @NavigationPolygon@ with the given ID.
navpoly_set_transform ::
                        (Navigation2D :< cls, Object :< cls) =>
                        cls -> Int -> Transform2d -> IO ()
navpoly_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_navpoly_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Navigation2D "navpoly_set_transform"
           '[Int, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.Navigation2D.navpoly_set_transform