{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CSGShape
       (Godot.Core.CSGShape._OPERATION_SUBTRACTION,
        Godot.Core.CSGShape._OPERATION_UNION,
        Godot.Core.CSGShape._OPERATION_INTERSECTION,
        Godot.Core.CSGShape._update_shape,
        Godot.Core.CSGShape.get_collision_layer,
        Godot.Core.CSGShape.get_collision_layer_bit,
        Godot.Core.CSGShape.get_collision_mask,
        Godot.Core.CSGShape.get_collision_mask_bit,
        Godot.Core.CSGShape.get_meshes, Godot.Core.CSGShape.get_operation,
        Godot.Core.CSGShape.get_snap,
        Godot.Core.CSGShape.is_calculating_tangents,
        Godot.Core.CSGShape.is_root_shape,
        Godot.Core.CSGShape.is_using_collision,
        Godot.Core.CSGShape.set_calculate_tangents,
        Godot.Core.CSGShape.set_collision_layer,
        Godot.Core.CSGShape.set_collision_layer_bit,
        Godot.Core.CSGShape.set_collision_mask,
        Godot.Core.CSGShape.set_collision_mask_bit,
        Godot.Core.CSGShape.set_operation, Godot.Core.CSGShape.set_snap,
        Godot.Core.CSGShape.set_use_collision)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_OPERATION_SUBTRACTION :: Int
_OPERATION_SUBTRACTION = 2

_OPERATION_UNION :: Int
_OPERATION_UNION = 0

_OPERATION_INTERSECTION :: Int
_OPERATION_INTERSECTION = 1

{-# NOINLINE bindCSGShape__update_shape #-}

bindCSGShape__update_shape :: MethodBind
bindCSGShape__update_shape
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "_update_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_shape :: (CSGShape :< cls, Object :< cls) => cls -> IO ()
_update_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape__update_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_get_collision_layer #-}

bindCSGShape_get_collision_layer :: MethodBind
bindCSGShape_get_collision_layer
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "get_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_layer ::
                      (CSGShape :< cls, Object :< cls) => cls -> IO Int
get_collision_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_get_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_get_collision_layer_bit #-}

bindCSGShape_get_collision_layer_bit :: MethodBind
bindCSGShape_get_collision_layer_bit
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "get_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_layer_bit ::
                          (CSGShape :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_layer_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_get_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_get_collision_mask #-}

bindCSGShape_get_collision_mask :: MethodBind
bindCSGShape_get_collision_mask
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask ::
                     (CSGShape :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_get_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_get_collision_mask_bit #-}

bindCSGShape_get_collision_mask_bit :: MethodBind
bindCSGShape_get_collision_mask_bit
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask_bit ::
                         (CSGShape :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_get_meshes #-}

bindCSGShape_get_meshes :: MethodBind
bindCSGShape_get_meshes
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "get_meshes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_meshes :: (CSGShape :< cls, Object :< cls) => cls -> IO Array
get_meshes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_get_meshes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_get_operation #-}

bindCSGShape_get_operation :: MethodBind
bindCSGShape_get_operation
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "get_operation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_operation :: (CSGShape :< cls, Object :< cls) => cls -> IO Int
get_operation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_get_operation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_get_snap #-}

bindCSGShape_get_snap :: MethodBind
bindCSGShape_get_snap
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "get_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_snap :: (CSGShape :< cls, Object :< cls) => cls -> IO Float
get_snap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_get_snap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_is_calculating_tangents #-}

bindCSGShape_is_calculating_tangents :: MethodBind
bindCSGShape_is_calculating_tangents
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "is_calculating_tangents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_calculating_tangents ::
                          (CSGShape :< cls, Object :< cls) => cls -> IO Bool
is_calculating_tangents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_is_calculating_tangents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_is_root_shape #-}

bindCSGShape_is_root_shape :: MethodBind
bindCSGShape_is_root_shape
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "is_root_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_root_shape :: (CSGShape :< cls, Object :< cls) => cls -> IO Bool
is_root_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_is_root_shape (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_is_using_collision #-}

bindCSGShape_is_using_collision :: MethodBind
bindCSGShape_is_using_collision
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "is_using_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_using_collision ::
                     (CSGShape :< cls, Object :< cls) => cls -> IO Bool
is_using_collision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_is_using_collision (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_set_calculate_tangents #-}

bindCSGShape_set_calculate_tangents :: MethodBind
bindCSGShape_set_calculate_tangents
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "set_calculate_tangents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_calculate_tangents ::
                         (CSGShape :< cls, Object :< cls) => cls -> Bool -> IO ()
set_calculate_tangents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_set_calculate_tangents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_set_collision_layer #-}

bindCSGShape_set_collision_layer :: MethodBind
bindCSGShape_set_collision_layer
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "set_collision_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_layer ::
                      (CSGShape :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_set_collision_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_set_collision_layer_bit #-}

bindCSGShape_set_collision_layer_bit :: MethodBind
bindCSGShape_set_collision_layer_bit
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "set_collision_layer_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_layer_bit ::
                          (CSGShape :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_layer_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_set_collision_layer_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_set_collision_mask #-}

bindCSGShape_set_collision_mask :: MethodBind
bindCSGShape_set_collision_mask
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask ::
                     (CSGShape :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_set_collision_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_set_collision_mask_bit #-}

bindCSGShape_set_collision_mask_bit :: MethodBind
bindCSGShape_set_collision_mask_bit
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask_bit ::
                         (CSGShape :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_set_operation #-}

bindCSGShape_set_operation :: MethodBind
bindCSGShape_set_operation
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "set_operation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_operation ::
                (CSGShape :< cls, Object :< cls) => cls -> Int -> IO ()
set_operation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_set_operation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_set_snap #-}

bindCSGShape_set_snap :: MethodBind
bindCSGShape_set_snap
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "set_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_snap ::
           (CSGShape :< cls, Object :< cls) => cls -> Float -> IO ()
set_snap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_set_snap (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGShape_set_use_collision #-}

bindCSGShape_set_use_collision :: MethodBind
bindCSGShape_set_use_collision
  = unsafePerformIO $
      withCString "CSGShape" $
        \ clsNamePtr ->
          withCString "set_use_collision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_use_collision ::
                    (CSGShape :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_collision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGShape_set_use_collision (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)