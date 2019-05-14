{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeBlendSpace1D
       (Godot.Core.AnimationNodeBlendSpace1D.add_blend_point,
        Godot.Core.AnimationNodeBlendSpace1D.set_blend_point_position,
        Godot.Core.AnimationNodeBlendSpace1D.get_blend_point_position,
        Godot.Core.AnimationNodeBlendSpace1D.set_blend_point_node,
        Godot.Core.AnimationNodeBlendSpace1D.get_blend_point_node,
        Godot.Core.AnimationNodeBlendSpace1D.remove_blend_point,
        Godot.Core.AnimationNodeBlendSpace1D.get_blend_point_count,
        Godot.Core.AnimationNodeBlendSpace1D.set_min_space,
        Godot.Core.AnimationNodeBlendSpace1D.get_min_space,
        Godot.Core.AnimationNodeBlendSpace1D.set_max_space,
        Godot.Core.AnimationNodeBlendSpace1D.get_max_space,
        Godot.Core.AnimationNodeBlendSpace1D.set_snap,
        Godot.Core.AnimationNodeBlendSpace1D.get_snap,
        Godot.Core.AnimationNodeBlendSpace1D.set_value_label,
        Godot.Core.AnimationNodeBlendSpace1D.get_value_label,
        Godot.Core.AnimationNodeBlendSpace1D._add_blend_point,
        Godot.Core.AnimationNodeBlendSpace1D._tree_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAnimationNodeBlendSpace1D_add_blend_point #-}

bindAnimationNodeBlendSpace1D_add_blend_point :: MethodBind
bindAnimationNodeBlendSpace1D_add_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "add_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_blend_point ::
                  (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                  cls -> AnimationRootNode -> Float -> Int -> IO ()
add_blend_point cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_add_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_set_blend_point_position
             #-}

bindAnimationNodeBlendSpace1D_set_blend_point_position ::
                                                       MethodBind
bindAnimationNodeBlendSpace1D_set_blend_point_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "set_blend_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_blend_point_position ::
                           (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                           cls -> Int -> Float -> IO ()
set_blend_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_set_blend_point_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_get_blend_point_position
             #-}

bindAnimationNodeBlendSpace1D_get_blend_point_position ::
                                                       MethodBind
bindAnimationNodeBlendSpace1D_get_blend_point_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "get_blend_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_point_position ::
                           (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                           cls -> Int -> IO Float
get_blend_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_get_blend_point_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_set_blend_point_node #-}

bindAnimationNodeBlendSpace1D_set_blend_point_node :: MethodBind
bindAnimationNodeBlendSpace1D_set_blend_point_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "set_blend_point_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_blend_point_node ::
                       (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                       cls -> Int -> AnimationRootNode -> IO ()
set_blend_point_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_set_blend_point_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_get_blend_point_node #-}

bindAnimationNodeBlendSpace1D_get_blend_point_node :: MethodBind
bindAnimationNodeBlendSpace1D_get_blend_point_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "get_blend_point_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_point_node ::
                       (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                       cls -> Int -> IO AnimationRootNode
get_blend_point_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_get_blend_point_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_remove_blend_point #-}

bindAnimationNodeBlendSpace1D_remove_blend_point :: MethodBind
bindAnimationNodeBlendSpace1D_remove_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "remove_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_blend_point ::
                     (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                     cls -> Int -> IO ()
remove_blend_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_remove_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_get_blend_point_count
             #-}

bindAnimationNodeBlendSpace1D_get_blend_point_count :: MethodBind
bindAnimationNodeBlendSpace1D_get_blend_point_count
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "get_blend_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_blend_point_count ::
                        (AnimationNodeBlendSpace1D :< cls, Object :< cls) => cls -> IO Int
get_blend_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_get_blend_point_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_set_min_space #-}

bindAnimationNodeBlendSpace1D_set_min_space :: MethodBind
bindAnimationNodeBlendSpace1D_set_min_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "set_min_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_min_space ::
                (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                cls -> Float -> IO ()
set_min_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace1D_set_min_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_get_min_space #-}

bindAnimationNodeBlendSpace1D_get_min_space :: MethodBind
bindAnimationNodeBlendSpace1D_get_min_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "get_min_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_min_space ::
                (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                cls -> IO Float
get_min_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace1D_get_min_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_set_max_space #-}

bindAnimationNodeBlendSpace1D_set_max_space :: MethodBind
bindAnimationNodeBlendSpace1D_set_max_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "set_max_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_max_space ::
                (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                cls -> Float -> IO ()
set_max_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace1D_set_max_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_get_max_space #-}

bindAnimationNodeBlendSpace1D_get_max_space :: MethodBind
bindAnimationNodeBlendSpace1D_get_max_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "get_max_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max_space ::
                (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                cls -> IO Float
get_max_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace1D_get_max_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_set_snap #-}

bindAnimationNodeBlendSpace1D_set_snap :: MethodBind
bindAnimationNodeBlendSpace1D_set_snap
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "set_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_snap ::
           (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
           cls -> Float -> IO ()
set_snap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace1D_set_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_get_snap #-}

bindAnimationNodeBlendSpace1D_get_snap :: MethodBind
bindAnimationNodeBlendSpace1D_get_snap
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "get_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_snap ::
           (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
           cls -> IO Float
get_snap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace1D_get_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_set_value_label #-}

bindAnimationNodeBlendSpace1D_set_value_label :: MethodBind
bindAnimationNodeBlendSpace1D_set_value_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "set_value_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_value_label ::
                  (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
set_value_label cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_set_value_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D_get_value_label #-}

bindAnimationNodeBlendSpace1D_get_value_label :: MethodBind
bindAnimationNodeBlendSpace1D_get_value_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "get_value_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_value_label ::
                  (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                  cls -> IO GodotString
get_value_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D_get_value_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D__add_blend_point #-}

bindAnimationNodeBlendSpace1D__add_blend_point :: MethodBind
bindAnimationNodeBlendSpace1D__add_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "_add_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_add_blend_point ::
                   (AnimationNodeBlendSpace1D :< cls, Object :< cls) =>
                   cls -> Int -> AnimationRootNode -> IO ()
_add_blend_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace1D__add_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeBlendSpace1D__tree_changed #-}

bindAnimationNodeBlendSpace1D__tree_changed :: MethodBind
bindAnimationNodeBlendSpace1D__tree_changed
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace1D" $
        \ clsNamePtr ->
          withCString "_tree_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_changed ::
                (AnimationNodeBlendSpace1D :< cls, Object :< cls) => cls -> IO ()
_tree_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace1D__tree_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)