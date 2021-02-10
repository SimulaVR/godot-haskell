{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CSGPolygon
       (Godot.Core.CSGPolygon._MODE_PATH,
        Godot.Core.CSGPolygon._PATH_ROTATION_PATH,
        Godot.Core.CSGPolygon._PATH_ROTATION_PATH_FOLLOW,
        Godot.Core.CSGPolygon._PATH_ROTATION_POLYGON,
        Godot.Core.CSGPolygon._MODE_SPIN,
        Godot.Core.CSGPolygon._MODE_DEPTH,
        Godot.Core.CSGPolygon._has_editable_3d_polygon_no_depth,
        Godot.Core.CSGPolygon._is_editable_3d_polygon,
        Godot.Core.CSGPolygon._path_changed,
        Godot.Core.CSGPolygon._path_exited,
        Godot.Core.CSGPolygon.get_depth,
        Godot.Core.CSGPolygon.get_material, Godot.Core.CSGPolygon.get_mode,
        Godot.Core.CSGPolygon.get_path_interval,
        Godot.Core.CSGPolygon.get_path_node,
        Godot.Core.CSGPolygon.get_path_rotation,
        Godot.Core.CSGPolygon.get_polygon,
        Godot.Core.CSGPolygon.get_smooth_faces,
        Godot.Core.CSGPolygon.get_spin_degrees,
        Godot.Core.CSGPolygon.get_spin_sides,
        Godot.Core.CSGPolygon.is_path_continuous_u,
        Godot.Core.CSGPolygon.is_path_joined,
        Godot.Core.CSGPolygon.is_path_local,
        Godot.Core.CSGPolygon.set_depth,
        Godot.Core.CSGPolygon.set_material, Godot.Core.CSGPolygon.set_mode,
        Godot.Core.CSGPolygon.set_path_continuous_u,
        Godot.Core.CSGPolygon.set_path_interval,
        Godot.Core.CSGPolygon.set_path_joined,
        Godot.Core.CSGPolygon.set_path_local,
        Godot.Core.CSGPolygon.set_path_node,
        Godot.Core.CSGPolygon.set_path_rotation,
        Godot.Core.CSGPolygon.set_polygon,
        Godot.Core.CSGPolygon.set_smooth_faces,
        Godot.Core.CSGPolygon.set_spin_degrees,
        Godot.Core.CSGPolygon.set_spin_sides)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MODE_PATH :: Int
_MODE_PATH = 2

_PATH_ROTATION_PATH :: Int
_PATH_ROTATION_PATH = 1

_PATH_ROTATION_PATH_FOLLOW :: Int
_PATH_ROTATION_PATH_FOLLOW = 2

_PATH_ROTATION_POLYGON :: Int
_PATH_ROTATION_POLYGON = 0

_MODE_SPIN :: Int
_MODE_SPIN = 1

_MODE_DEPTH :: Int
_MODE_DEPTH = 0

{-# NOINLINE bindCSGPolygon__has_editable_3d_polygon_no_depth #-}

bindCSGPolygon__has_editable_3d_polygon_no_depth :: MethodBind
bindCSGPolygon__has_editable_3d_polygon_no_depth
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "_has_editable_3d_polygon_no_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_has_editable_3d_polygon_no_depth ::
                                    (CSGPolygon :< cls, Object :< cls) => cls -> IO Bool
_has_editable_3d_polygon_no_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindCSGPolygon__has_editable_3d_polygon_no_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon__is_editable_3d_polygon #-}

bindCSGPolygon__is_editable_3d_polygon :: MethodBind
bindCSGPolygon__is_editable_3d_polygon
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "_is_editable_3d_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_editable_3d_polygon ::
                          (CSGPolygon :< cls, Object :< cls) => cls -> IO Bool
_is_editable_3d_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon__is_editable_3d_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon__path_changed #-}

bindCSGPolygon__path_changed :: MethodBind
bindCSGPolygon__path_changed
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "_path_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_path_changed :: (CSGPolygon :< cls, Object :< cls) => cls -> IO ()
_path_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon__path_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon__path_exited #-}

bindCSGPolygon__path_exited :: MethodBind
bindCSGPolygon__path_exited
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "_path_exited" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_path_exited :: (CSGPolygon :< cls, Object :< cls) => cls -> IO ()
_path_exited cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon__path_exited (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_depth #-}

bindCSGPolygon_get_depth :: MethodBind
bindCSGPolygon_get_depth
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_depth :: (CSGPolygon :< cls, Object :< cls) => cls -> IO Float
get_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_depth (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_material #-}

bindCSGPolygon_get_material :: MethodBind
bindCSGPolygon_get_material
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_material ::
               (CSGPolygon :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_mode #-}

bindCSGPolygon_get_mode :: MethodBind
bindCSGPolygon_get_mode
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mode :: (CSGPolygon :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_path_interval #-}

bindCSGPolygon_get_path_interval :: MethodBind
bindCSGPolygon_get_path_interval
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_path_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_path_interval ::
                    (CSGPolygon :< cls, Object :< cls) => cls -> IO Float
get_path_interval cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_path_interval
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_path_node #-}

bindCSGPolygon_get_path_node :: MethodBind
bindCSGPolygon_get_path_node
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_path_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_path_node ::
                (CSGPolygon :< cls, Object :< cls) => cls -> IO NodePath
get_path_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_path_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_path_rotation #-}

bindCSGPolygon_get_path_rotation :: MethodBind
bindCSGPolygon_get_path_rotation
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_path_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_path_rotation ::
                    (CSGPolygon :< cls, Object :< cls) => cls -> IO Int
get_path_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_path_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_polygon #-}

bindCSGPolygon_get_polygon :: MethodBind
bindCSGPolygon_get_polygon
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_polygon ::
              (CSGPolygon :< cls, Object :< cls) => cls -> IO PoolVector2Array
get_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_smooth_faces #-}

bindCSGPolygon_get_smooth_faces :: MethodBind
bindCSGPolygon_get_smooth_faces
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_smooth_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_smooth_faces ::
                   (CSGPolygon :< cls, Object :< cls) => cls -> IO Bool
get_smooth_faces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_smooth_faces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_spin_degrees #-}

bindCSGPolygon_get_spin_degrees :: MethodBind
bindCSGPolygon_get_spin_degrees
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_spin_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_spin_degrees ::
                   (CSGPolygon :< cls, Object :< cls) => cls -> IO Float
get_spin_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_spin_degrees (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_get_spin_sides #-}

bindCSGPolygon_get_spin_sides :: MethodBind
bindCSGPolygon_get_spin_sides
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "get_spin_sides" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_spin_sides ::
                 (CSGPolygon :< cls, Object :< cls) => cls -> IO Int
get_spin_sides cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_get_spin_sides (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_is_path_continuous_u #-}

bindCSGPolygon_is_path_continuous_u :: MethodBind
bindCSGPolygon_is_path_continuous_u
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "is_path_continuous_u" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_path_continuous_u ::
                       (CSGPolygon :< cls, Object :< cls) => cls -> IO Bool
is_path_continuous_u cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_is_path_continuous_u
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_is_path_joined #-}

bindCSGPolygon_is_path_joined :: MethodBind
bindCSGPolygon_is_path_joined
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "is_path_joined" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_path_joined ::
                 (CSGPolygon :< cls, Object :< cls) => cls -> IO Bool
is_path_joined cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_is_path_joined (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_is_path_local #-}

bindCSGPolygon_is_path_local :: MethodBind
bindCSGPolygon_is_path_local
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "is_path_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_path_local ::
                (CSGPolygon :< cls, Object :< cls) => cls -> IO Bool
is_path_local cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_is_path_local (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_depth #-}

bindCSGPolygon_set_depth :: MethodBind
bindCSGPolygon_set_depth
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_depth ::
            (CSGPolygon :< cls, Object :< cls) => cls -> Float -> IO ()
set_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_depth (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_material #-}

bindCSGPolygon_set_material :: MethodBind
bindCSGPolygon_set_material
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_material ::
               (CSGPolygon :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_mode #-}

bindCSGPolygon_set_mode :: MethodBind
bindCSGPolygon_set_mode
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mode ::
           (CSGPolygon :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_path_continuous_u #-}

bindCSGPolygon_set_path_continuous_u :: MethodBind
bindCSGPolygon_set_path_continuous_u
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_path_continuous_u" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_path_continuous_u ::
                        (CSGPolygon :< cls, Object :< cls) => cls -> Bool -> IO ()
set_path_continuous_u cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_path_continuous_u
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_path_interval #-}

bindCSGPolygon_set_path_interval :: MethodBind
bindCSGPolygon_set_path_interval
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_path_interval" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_path_interval ::
                    (CSGPolygon :< cls, Object :< cls) => cls -> Float -> IO ()
set_path_interval cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_path_interval
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_path_joined #-}

bindCSGPolygon_set_path_joined :: MethodBind
bindCSGPolygon_set_path_joined
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_path_joined" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_path_joined ::
                  (CSGPolygon :< cls, Object :< cls) => cls -> Bool -> IO ()
set_path_joined cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_path_joined (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_path_local #-}

bindCSGPolygon_set_path_local :: MethodBind
bindCSGPolygon_set_path_local
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_path_local" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_path_local ::
                 (CSGPolygon :< cls, Object :< cls) => cls -> Bool -> IO ()
set_path_local cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_path_local (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_path_node #-}

bindCSGPolygon_set_path_node :: MethodBind
bindCSGPolygon_set_path_node
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_path_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_path_node ::
                (CSGPolygon :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_path_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_path_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_path_rotation #-}

bindCSGPolygon_set_path_rotation :: MethodBind
bindCSGPolygon_set_path_rotation
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_path_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_path_rotation ::
                    (CSGPolygon :< cls, Object :< cls) => cls -> Int -> IO ()
set_path_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_path_rotation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_polygon #-}

bindCSGPolygon_set_polygon :: MethodBind
bindCSGPolygon_set_polygon
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_polygon ::
              (CSGPolygon :< cls, Object :< cls) =>
              cls -> PoolVector2Array -> IO ()
set_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_polygon (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_smooth_faces #-}

bindCSGPolygon_set_smooth_faces :: MethodBind
bindCSGPolygon_set_smooth_faces
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_smooth_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_smooth_faces ::
                   (CSGPolygon :< cls, Object :< cls) => cls -> Bool -> IO ()
set_smooth_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_smooth_faces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_spin_degrees #-}

bindCSGPolygon_set_spin_degrees :: MethodBind
bindCSGPolygon_set_spin_degrees
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_spin_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_spin_degrees ::
                   (CSGPolygon :< cls, Object :< cls) => cls -> Float -> IO ()
set_spin_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_spin_degrees (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGPolygon_set_spin_sides #-}

bindCSGPolygon_set_spin_sides :: MethodBind
bindCSGPolygon_set_spin_sides
  = unsafePerformIO $
      withCString "CSGPolygon" $
        \ clsNamePtr ->
          withCString "set_spin_sides" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_spin_sides ::
                 (CSGPolygon :< cls, Object :< cls) => cls -> Int -> IO ()
set_spin_sides cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPolygon_set_spin_sides (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)