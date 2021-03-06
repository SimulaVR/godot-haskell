{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationPolygonInstance
       (Godot.Core.NavigationPolygonInstance._navpoly_changed,
        Godot.Core.NavigationPolygonInstance.get_navigation_polygon,
        Godot.Core.NavigationPolygonInstance.is_enabled,
        Godot.Core.NavigationPolygonInstance.set_enabled,
        Godot.Core.NavigationPolygonInstance.set_navigation_polygon)
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

instance NodeProperty NavigationPolygonInstance "enabled" Bool
           'False
         where
        nodeProperty
          = (is_enabled, wrapDroppingSetter set_enabled, Nothing)

instance NodeProperty NavigationPolygonInstance "navpoly"
           NavigationPolygon
           'False
         where
        nodeProperty
          = (get_navigation_polygon,
             wrapDroppingSetter set_navigation_polygon, Nothing)

{-# NOINLINE bindNavigationPolygonInstance__navpoly_changed #-}

bindNavigationPolygonInstance__navpoly_changed :: MethodBind
bindNavigationPolygonInstance__navpoly_changed
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "_navpoly_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_navpoly_changed ::
                   (NavigationPolygonInstance :< cls, Object :< cls) => cls -> IO ()
_navpoly_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance__navpoly_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationPolygonInstance "_navpoly_changed"
           '[]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance._navpoly_changed

{-# NOINLINE bindNavigationPolygonInstance_get_navigation_polygon
             #-}

bindNavigationPolygonInstance_get_navigation_polygon :: MethodBind
bindNavigationPolygonInstance_get_navigation_polygon
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "get_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_navigation_polygon ::
                         (NavigationPolygonInstance :< cls, Object :< cls) =>
                         cls -> IO NavigationPolygon
get_navigation_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance_get_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationPolygonInstance
           "get_navigation_polygon"
           '[]
           (IO NavigationPolygon)
         where
        nodeMethod
          = Godot.Core.NavigationPolygonInstance.get_navigation_polygon

{-# NOINLINE bindNavigationPolygonInstance_is_enabled #-}

bindNavigationPolygonInstance_is_enabled :: MethodBind
bindNavigationPolygonInstance_is_enabled
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_enabled ::
             (NavigationPolygonInstance :< cls, Object :< cls) => cls -> IO Bool
is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygonInstance_is_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationPolygonInstance "is_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.is_enabled

{-# NOINLINE bindNavigationPolygonInstance_set_enabled #-}

bindNavigationPolygonInstance_set_enabled :: MethodBind
bindNavigationPolygonInstance_set_enabled
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_enabled ::
              (NavigationPolygonInstance :< cls, Object :< cls) =>
              cls -> Bool -> IO ()
set_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygonInstance_set_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationPolygonInstance "set_enabled" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.NavigationPolygonInstance.set_enabled

{-# NOINLINE bindNavigationPolygonInstance_set_navigation_polygon
             #-}

bindNavigationPolygonInstance_set_navigation_polygon :: MethodBind
bindNavigationPolygonInstance_set_navigation_polygon
  = unsafePerformIO $
      withCString "NavigationPolygonInstance" $
        \ clsNamePtr ->
          withCString "set_navigation_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_navigation_polygon ::
                         (NavigationPolygonInstance :< cls, Object :< cls) =>
                         cls -> NavigationPolygon -> IO ()
set_navigation_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygonInstance_set_navigation_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NavigationPolygonInstance
           "set_navigation_polygon"
           '[NavigationPolygon]
           (IO ())
         where
        nodeMethod
          = Godot.Core.NavigationPolygonInstance.set_navigation_polygon