{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NavigationPolygon
       (Godot.Core.NavigationPolygon._get_outlines,
        Godot.Core.NavigationPolygon._get_polygons,
        Godot.Core.NavigationPolygon._set_outlines,
        Godot.Core.NavigationPolygon._set_polygons,
        Godot.Core.NavigationPolygon.add_outline,
        Godot.Core.NavigationPolygon.add_outline_at_index,
        Godot.Core.NavigationPolygon.add_polygon,
        Godot.Core.NavigationPolygon.clear_outlines,
        Godot.Core.NavigationPolygon.clear_polygons,
        Godot.Core.NavigationPolygon.get_outline,
        Godot.Core.NavigationPolygon.get_outline_count,
        Godot.Core.NavigationPolygon.get_polygon,
        Godot.Core.NavigationPolygon.get_polygon_count,
        Godot.Core.NavigationPolygon.get_vertices,
        Godot.Core.NavigationPolygon.make_polygons_from_outlines,
        Godot.Core.NavigationPolygon.remove_outline,
        Godot.Core.NavigationPolygon.set_outline,
        Godot.Core.NavigationPolygon.set_vertices)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindNavigationPolygon__get_outlines #-}

bindNavigationPolygon__get_outlines :: MethodBind
bindNavigationPolygon__get_outlines
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "_get_outlines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_outlines ::
                (NavigationPolygon :< cls, Object :< cls) => cls -> IO Array
_get_outlines cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon__get_outlines
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon__get_polygons #-}

bindNavigationPolygon__get_polygons :: MethodBind
bindNavigationPolygon__get_polygons
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "_get_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_polygons ::
                (NavigationPolygon :< cls, Object :< cls) => cls -> IO Array
_get_polygons cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon__get_polygons
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon__set_outlines #-}

bindNavigationPolygon__set_outlines :: MethodBind
bindNavigationPolygon__set_outlines
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "_set_outlines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_outlines ::
                (NavigationPolygon :< cls, Object :< cls) => cls -> Array -> IO ()
_set_outlines cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon__set_outlines
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon__set_polygons #-}

bindNavigationPolygon__set_polygons :: MethodBind
bindNavigationPolygon__set_polygons
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "_set_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_polygons ::
                (NavigationPolygon :< cls, Object :< cls) => cls -> Array -> IO ()
_set_polygons cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon__set_polygons
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_add_outline #-}

-- | Appends a [PoolVector2Array] that contains the vertices of an outline to the internal array that contains all the outlines. You have to call [method make_polygons_from_outlines] in order for this array to be converted to polygons that the engine will use.
bindNavigationPolygon_add_outline :: MethodBind
bindNavigationPolygon_add_outline
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "add_outline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Appends a [PoolVector2Array] that contains the vertices of an outline to the internal array that contains all the outlines. You have to call [method make_polygons_from_outlines] in order for this array to be converted to polygons that the engine will use.
add_outline ::
              (NavigationPolygon :< cls, Object :< cls) =>
              cls -> PoolVector2Array -> IO ()
add_outline cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_add_outline
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_add_outline_at_index #-}

-- | Adds a [PoolVector2Array] that contains the vertices of an outline to the internal array that contains all the outlines at a fixed position. You have to call [method make_polygons_from_outlines] in order for this array to be converted to polygons that the engine will use.
bindNavigationPolygon_add_outline_at_index :: MethodBind
bindNavigationPolygon_add_outline_at_index
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "add_outline_at_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [PoolVector2Array] that contains the vertices of an outline to the internal array that contains all the outlines at a fixed position. You have to call [method make_polygons_from_outlines] in order for this array to be converted to polygons that the engine will use.
add_outline_at_index ::
                       (NavigationPolygon :< cls, Object :< cls) =>
                       cls -> PoolVector2Array -> Int -> IO ()
add_outline_at_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_add_outline_at_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_add_polygon #-}

-- | Adds a polygon using the indices of the vertices you get when calling [method get_vertices].
bindNavigationPolygon_add_polygon :: MethodBind
bindNavigationPolygon_add_polygon
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "add_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a polygon using the indices of the vertices you get when calling [method get_vertices].
add_polygon ::
              (NavigationPolygon :< cls, Object :< cls) =>
              cls -> PoolIntArray -> IO ()
add_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_add_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_clear_outlines #-}

-- | Clears the array of the outlines, but it doesn't clear the vertices and the polygons that were created by them.
bindNavigationPolygon_clear_outlines :: MethodBind
bindNavigationPolygon_clear_outlines
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "clear_outlines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the array of the outlines, but it doesn't clear the vertices and the polygons that were created by them.
clear_outlines ::
                 (NavigationPolygon :< cls, Object :< cls) => cls -> IO ()
clear_outlines cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_clear_outlines
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_clear_polygons #-}

-- | Clears the array of polygons, but it doesn't clear the array of outlines and vertices.
bindNavigationPolygon_clear_polygons :: MethodBind
bindNavigationPolygon_clear_polygons
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "clear_polygons" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the array of polygons, but it doesn't clear the array of outlines and vertices.
clear_polygons ::
                 (NavigationPolygon :< cls, Object :< cls) => cls -> IO ()
clear_polygons cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_clear_polygons
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_get_outline #-}

-- | Returns a [PoolVector2Array] containing the vertices of an outline that was created in the editor or by script.
bindNavigationPolygon_get_outline :: MethodBind
bindNavigationPolygon_get_outline
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "get_outline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [PoolVector2Array] containing the vertices of an outline that was created in the editor or by script.
get_outline ::
              (NavigationPolygon :< cls, Object :< cls) =>
              cls -> Int -> IO PoolVector2Array
get_outline cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_get_outline
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_get_outline_count #-}

-- | Returns the number of outlines that were created in the editor or by script.
bindNavigationPolygon_get_outline_count :: MethodBind
bindNavigationPolygon_get_outline_count
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "get_outline_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of outlines that were created in the editor or by script.
get_outline_count ::
                    (NavigationPolygon :< cls, Object :< cls) => cls -> IO Int
get_outline_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_get_outline_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_get_polygon #-}

-- | Returns a [PoolIntArray] containing the indices of the vertices of a created polygon.
bindNavigationPolygon_get_polygon :: MethodBind
bindNavigationPolygon_get_polygon
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "get_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [PoolIntArray] containing the indices of the vertices of a created polygon.
get_polygon ::
              (NavigationPolygon :< cls, Object :< cls) =>
              cls -> Int -> IO PoolIntArray
get_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_get_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_get_polygon_count #-}

-- | Returns the count of all polygons.
bindNavigationPolygon_get_polygon_count :: MethodBind
bindNavigationPolygon_get_polygon_count
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "get_polygon_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the count of all polygons.
get_polygon_count ::
                    (NavigationPolygon :< cls, Object :< cls) => cls -> IO Int
get_polygon_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_get_polygon_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_get_vertices #-}

-- | Returns a [PoolVector2Array] containing all the vertices being used to create the polygons.
bindNavigationPolygon_get_vertices :: MethodBind
bindNavigationPolygon_get_vertices
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "get_vertices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [PoolVector2Array] containing all the vertices being used to create the polygons.
get_vertices ::
               (NavigationPolygon :< cls, Object :< cls) =>
               cls -> IO PoolVector2Array
get_vertices cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_get_vertices
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_make_polygons_from_outlines #-}

-- | Creates polygons from the outlines added in the editor or by script.
bindNavigationPolygon_make_polygons_from_outlines :: MethodBind
bindNavigationPolygon_make_polygons_from_outlines
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "make_polygons_from_outlines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates polygons from the outlines added in the editor or by script.
make_polygons_from_outlines ::
                              (NavigationPolygon :< cls, Object :< cls) => cls -> IO ()
make_polygons_from_outlines cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNavigationPolygon_make_polygons_from_outlines
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_remove_outline #-}

-- | Removes an outline created in the editor or by script. You have to call [method make_polygons_from_outlines] for the polygons to update.
bindNavigationPolygon_remove_outline :: MethodBind
bindNavigationPolygon_remove_outline
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "remove_outline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes an outline created in the editor or by script. You have to call [method make_polygons_from_outlines] for the polygons to update.
remove_outline ::
                 (NavigationPolygon :< cls, Object :< cls) => cls -> Int -> IO ()
remove_outline cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_remove_outline
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_set_outline #-}

-- | Changes an outline created in the editor or by script. You have to call [method make_polygons_from_outlines] for the polygons to update.
bindNavigationPolygon_set_outline :: MethodBind
bindNavigationPolygon_set_outline
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "set_outline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes an outline created in the editor or by script. You have to call [method make_polygons_from_outlines] for the polygons to update.
set_outline ::
              (NavigationPolygon :< cls, Object :< cls) =>
              cls -> Int -> PoolVector2Array -> IO ()
set_outline cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_set_outline
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNavigationPolygon_set_vertices #-}

-- | Sets the vertices that can be then indexed to create polygons with the [method add_polygon] method.
bindNavigationPolygon_set_vertices :: MethodBind
bindNavigationPolygon_set_vertices
  = unsafePerformIO $
      withCString "NavigationPolygon" $
        \ clsNamePtr ->
          withCString "set_vertices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the vertices that can be then indexed to create polygons with the [method add_polygon] method.
set_vertices ::
               (NavigationPolygon :< cls, Object :< cls) =>
               cls -> PoolVector2Array -> IO ()
set_vertices cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNavigationPolygon_set_vertices
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)