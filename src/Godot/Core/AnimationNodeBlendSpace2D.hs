{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeBlendSpace2D
       (Godot.Core.AnimationNodeBlendSpace2D._BLEND_MODE_DISCRETE_CARRY,
        Godot.Core.AnimationNodeBlendSpace2D._BLEND_MODE_DISCRETE,
        Godot.Core.AnimationNodeBlendSpace2D._BLEND_MODE_INTERPOLATED,
        Godot.Core.AnimationNodeBlendSpace2D.sig_triangles_updated,
        Godot.Core.AnimationNodeBlendSpace2D.add_blend_point,
        Godot.Core.AnimationNodeBlendSpace2D.set_blend_point_position,
        Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_position,
        Godot.Core.AnimationNodeBlendSpace2D.set_blend_point_node,
        Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_node,
        Godot.Core.AnimationNodeBlendSpace2D.remove_blend_point,
        Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_count,
        Godot.Core.AnimationNodeBlendSpace2D.add_triangle,
        Godot.Core.AnimationNodeBlendSpace2D.get_triangle_point,
        Godot.Core.AnimationNodeBlendSpace2D.remove_triangle,
        Godot.Core.AnimationNodeBlendSpace2D.get_triangle_count,
        Godot.Core.AnimationNodeBlendSpace2D.set_min_space,
        Godot.Core.AnimationNodeBlendSpace2D.get_min_space,
        Godot.Core.AnimationNodeBlendSpace2D.set_max_space,
        Godot.Core.AnimationNodeBlendSpace2D.get_max_space,
        Godot.Core.AnimationNodeBlendSpace2D.set_snap,
        Godot.Core.AnimationNodeBlendSpace2D.get_snap,
        Godot.Core.AnimationNodeBlendSpace2D.set_x_label,
        Godot.Core.AnimationNodeBlendSpace2D.get_x_label,
        Godot.Core.AnimationNodeBlendSpace2D.set_y_label,
        Godot.Core.AnimationNodeBlendSpace2D.get_y_label,
        Godot.Core.AnimationNodeBlendSpace2D._add_blend_point,
        Godot.Core.AnimationNodeBlendSpace2D._set_triangles,
        Godot.Core.AnimationNodeBlendSpace2D._get_triangles,
        Godot.Core.AnimationNodeBlendSpace2D.set_auto_triangles,
        Godot.Core.AnimationNodeBlendSpace2D.get_auto_triangles,
        Godot.Core.AnimationNodeBlendSpace2D.set_blend_mode,
        Godot.Core.AnimationNodeBlendSpace2D.get_blend_mode,
        Godot.Core.AnimationNodeBlendSpace2D._tree_changed,
        Godot.Core.AnimationNodeBlendSpace2D._update_triangles)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_BLEND_MODE_DISCRETE_CARRY :: Int
_BLEND_MODE_DISCRETE_CARRY = 2

_BLEND_MODE_DISCRETE :: Int
_BLEND_MODE_DISCRETE = 1

_BLEND_MODE_INTERPOLATED :: Int
_BLEND_MODE_INTERPOLATED = 0

sig_triangles_updated ::
                      Godot.Internal.Dispatch.Signal AnimationNodeBlendSpace2D
sig_triangles_updated
  = Godot.Internal.Dispatch.Signal "triangles_updated"

{-# NOINLINE bindAnimationNodeBlendSpace2D_add_blend_point #-}

bindAnimationNodeBlendSpace2D_add_blend_point :: MethodBind
bindAnimationNodeBlendSpace2D_add_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "add_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_blend_point ::
                  (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                  cls -> AnimationRootNode -> Vector2 -> Int -> IO ()
add_blend_point cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_add_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_blend_point_position
             #-}

bindAnimationNodeBlendSpace2D_set_blend_point_position ::
                                                       MethodBind
bindAnimationNodeBlendSpace2D_set_blend_point_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_blend_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_blend_point_position ::
                           (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                           cls -> Int -> Vector2 -> IO ()
set_blend_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_set_blend_point_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_blend_point_position
             #-}

bindAnimationNodeBlendSpace2D_get_blend_point_position ::
                                                       MethodBind
bindAnimationNodeBlendSpace2D_get_blend_point_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_blend_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_point_position ::
                           (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                           cls -> Int -> IO Vector2
get_blend_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_blend_point_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_blend_point_node #-}

bindAnimationNodeBlendSpace2D_set_blend_point_node :: MethodBind
bindAnimationNodeBlendSpace2D_set_blend_point_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_blend_point_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_blend_point_node ::
                       (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                       cls -> Int -> AnimationRootNode -> IO ()
set_blend_point_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_set_blend_point_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_blend_point_node #-}

bindAnimationNodeBlendSpace2D_get_blend_point_node :: MethodBind
bindAnimationNodeBlendSpace2D_get_blend_point_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_blend_point_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_point_node ::
                       (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                       cls -> Int -> IO AnimationRootNode
get_blend_point_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_blend_point_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_remove_blend_point #-}

bindAnimationNodeBlendSpace2D_remove_blend_point :: MethodBind
bindAnimationNodeBlendSpace2D_remove_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "remove_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_blend_point ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                     cls -> Int -> IO ()
remove_blend_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_remove_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_blend_point_count
             #-}

bindAnimationNodeBlendSpace2D_get_blend_point_count :: MethodBind
bindAnimationNodeBlendSpace2D_get_blend_point_count
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_blend_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_point_count ::
                        (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO Int
get_blend_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_blend_point_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_add_triangle #-}

bindAnimationNodeBlendSpace2D_add_triangle :: MethodBind
bindAnimationNodeBlendSpace2D_add_triangle
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "add_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_triangle ::
               (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
               cls -> Int -> Int -> Int -> Int -> IO ()
add_triangle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_add_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_triangle_point #-}

bindAnimationNodeBlendSpace2D_get_triangle_point :: MethodBind
bindAnimationNodeBlendSpace2D_get_triangle_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_triangle_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_triangle_point ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                     cls -> Int -> Int -> IO Int
get_triangle_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_triangle_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_remove_triangle #-}

bindAnimationNodeBlendSpace2D_remove_triangle :: MethodBind
bindAnimationNodeBlendSpace2D_remove_triangle
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "remove_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_triangle ::
                  (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                  cls -> Int -> IO ()
remove_triangle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_remove_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_triangle_count #-}

bindAnimationNodeBlendSpace2D_get_triangle_count :: MethodBind
bindAnimationNodeBlendSpace2D_get_triangle_count
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_triangle_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_triangle_count ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO Int
get_triangle_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_triangle_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_min_space #-}

bindAnimationNodeBlendSpace2D_set_min_space :: MethodBind
bindAnimationNodeBlendSpace2D_set_min_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_min_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_min_space ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                cls -> Vector2 -> IO ()
set_min_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_min_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_min_space #-}

bindAnimationNodeBlendSpace2D_get_min_space :: MethodBind
bindAnimationNodeBlendSpace2D_get_min_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_min_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_min_space ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                cls -> IO Vector2
get_min_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_min_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_max_space #-}

bindAnimationNodeBlendSpace2D_set_max_space :: MethodBind
bindAnimationNodeBlendSpace2D_set_max_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_max_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_max_space ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                cls -> Vector2 -> IO ()
set_max_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_max_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_max_space #-}

bindAnimationNodeBlendSpace2D_get_max_space :: MethodBind
bindAnimationNodeBlendSpace2D_get_max_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_max_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max_space ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                cls -> IO Vector2
get_max_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_max_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_snap #-}

bindAnimationNodeBlendSpace2D_set_snap :: MethodBind
bindAnimationNodeBlendSpace2D_set_snap
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_snap ::
           (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
           cls -> Vector2 -> IO ()
set_snap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_snap #-}

bindAnimationNodeBlendSpace2D_get_snap :: MethodBind
bindAnimationNodeBlendSpace2D_get_snap
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_snap ::
           (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
           cls -> IO Vector2
get_snap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_x_label #-}

bindAnimationNodeBlendSpace2D_set_x_label :: MethodBind
bindAnimationNodeBlendSpace2D_set_x_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_x_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_x_label ::
              (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
set_x_label cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_x_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_x_label #-}

bindAnimationNodeBlendSpace2D_get_x_label :: MethodBind
bindAnimationNodeBlendSpace2D_get_x_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_x_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_x_label ::
              (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
              cls -> IO GodotString
get_x_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_x_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_y_label #-}

bindAnimationNodeBlendSpace2D_set_y_label :: MethodBind
bindAnimationNodeBlendSpace2D_set_y_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_y_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_y_label ::
              (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
set_y_label cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_y_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_y_label #-}

bindAnimationNodeBlendSpace2D_get_y_label :: MethodBind
bindAnimationNodeBlendSpace2D_get_y_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_y_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_y_label ::
              (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
              cls -> IO GodotString
get_y_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_y_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D__add_blend_point #-}

bindAnimationNodeBlendSpace2D__add_blend_point :: MethodBind
bindAnimationNodeBlendSpace2D__add_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_add_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_add_blend_point ::
                   (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                   cls -> Int -> AnimationRootNode -> IO ()
_add_blend_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D__add_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D__set_triangles #-}

bindAnimationNodeBlendSpace2D__set_triangles :: MethodBind
bindAnimationNodeBlendSpace2D__set_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_set_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_triangles ::
                 (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                 cls -> PoolIntArray -> IO ()
_set_triangles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D__set_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D__get_triangles #-}

bindAnimationNodeBlendSpace2D__get_triangles :: MethodBind
bindAnimationNodeBlendSpace2D__get_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_get_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_triangles ::
                 (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                 cls -> IO PoolIntArray
_get_triangles cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D__get_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_auto_triangles #-}

bindAnimationNodeBlendSpace2D_set_auto_triangles :: MethodBind
bindAnimationNodeBlendSpace2D_set_auto_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_auto_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_auto_triangles ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                     cls -> Bool -> IO ()
set_auto_triangles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_set_auto_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_auto_triangles #-}

bindAnimationNodeBlendSpace2D_get_auto_triangles :: MethodBind
bindAnimationNodeBlendSpace2D_get_auto_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_auto_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_auto_triangles ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO Bool
get_auto_triangles cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_auto_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_blend_mode #-}

bindAnimationNodeBlendSpace2D_set_blend_mode :: MethodBind
bindAnimationNodeBlendSpace2D_set_blend_mode
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_blend_mode ::
                 (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                 cls -> Int -> IO ()
set_blend_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_blend_mode #-}

bindAnimationNodeBlendSpace2D_get_blend_mode :: MethodBind
bindAnimationNodeBlendSpace2D_get_blend_mode
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_mode ::
                 (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO Int
get_blend_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D__tree_changed #-}

bindAnimationNodeBlendSpace2D__tree_changed :: MethodBind
bindAnimationNodeBlendSpace2D__tree_changed
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_tree_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_changed ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO ()
_tree_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D__tree_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace2D__update_triangles #-}

bindAnimationNodeBlendSpace2D__update_triangles :: MethodBind
bindAnimationNodeBlendSpace2D__update_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_update_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_triangles ::
                    (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO ()
_update_triangles cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D__update_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)