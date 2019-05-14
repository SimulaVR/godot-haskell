{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Navigation2D
       (Godot.Core.Navigation2D.navpoly_add,
        Godot.Core.Navigation2D.navpoly_set_transform,
        Godot.Core.Navigation2D.navpoly_remove,
        Godot.Core.Navigation2D.get_simple_path,
        Godot.Core.Navigation2D.get_closest_point,
        Godot.Core.Navigation2D.get_closest_point_owner)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindNavigation2D_navpoly_add #-}

-- | Adds a [NavigationPolygon]. Returns an ID for use with [method navpoly_remove] or [method navpoly_set_transform]. If given, a [Transform2D] is applied to the polygon. The optional [code]owner[/code] is used as return value for [method get_closest_point_owner].
bindNavigation2D_navpoly_add :: MethodBind
bindNavigation2D_navpoly_add
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "navpoly_add" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [NavigationPolygon]. Returns an ID for use with [method navpoly_remove] or [method navpoly_set_transform]. If given, a [Transform2D] is applied to the polygon. The optional [code]owner[/code] is used as return value for [method get_closest_point_owner].
navpoly_add ::
              (Navigation2D :< cls, Object :< cls) =>
              cls -> NavigationPolygon -> Transform2d -> Object -> IO Int
navpoly_add cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_navpoly_add (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigation2D_navpoly_set_transform #-}

-- | Sets the transform applied to the [NavigationPolygon] with the given ID.
bindNavigation2D_navpoly_set_transform :: MethodBind
bindNavigation2D_navpoly_set_transform
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "navpoly_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transform applied to the [NavigationPolygon] with the given ID.
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

{-# NOINLINE bindNavigation2D_navpoly_remove #-}

-- | Removes the [NavigationPolygon] with the given ID.
bindNavigation2D_navpoly_remove :: MethodBind
bindNavigation2D_navpoly_remove
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "navpoly_remove" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the [NavigationPolygon] with the given ID.
navpoly_remove ::
                 (Navigation2D :< cls, Object :< cls) => cls -> Int -> IO ()
navpoly_remove cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_navpoly_remove (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigation2D_get_simple_path #-}

-- | Returns the path between two given points. Points are in local coordinate space. If [code]optimize[/code] is [code]true[/code] (the default), the path is smoothed by merging path segments where possible.
bindNavigation2D_get_simple_path :: MethodBind
bindNavigation2D_get_simple_path
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_simple_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path between two given points. Points are in local coordinate space. If [code]optimize[/code] is [code]true[/code] (the default), the path is smoothed by merging path segments where possible.
get_simple_path ::
                  (Navigation2D :< cls, Object :< cls) =>
                  cls -> Vector2 -> Vector2 -> Bool -> IO PoolVector2Array
get_simple_path cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigation2D_get_simple_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindNavigation2D_get_closest_point_owner #-}

-- | Returns the owner of the [NavigationPolygon] which contains the navigation point closest to the point given. This is usually a [NavigationPolygonInstance]. For polygons added via [method navpoly_add], returns the owner that was given (or [code]null[/code] if the [code]owner[/code] parameter was omitted).
bindNavigation2D_get_closest_point_owner :: MethodBind
bindNavigation2D_get_closest_point_owner
  = unsafePerformIO $
      withCString "Navigation2D" $
        \ clsNamePtr ->
          withCString "get_closest_point_owner" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the owner of the [NavigationPolygon] which contains the navigation point closest to the point given. This is usually a [NavigationPolygonInstance]. For polygons added via [method navpoly_add], returns the owner that was given (or [code]null[/code] if the [code]owner[/code] parameter was omitted).
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