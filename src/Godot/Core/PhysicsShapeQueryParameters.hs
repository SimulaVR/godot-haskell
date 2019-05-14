{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PhysicsShapeQueryParameters
       (Godot.Core.PhysicsShapeQueryParameters.set_shape,
        Godot.Core.PhysicsShapeQueryParameters.set_shape_rid,
        Godot.Core.PhysicsShapeQueryParameters.get_shape_rid,
        Godot.Core.PhysicsShapeQueryParameters.set_transform,
        Godot.Core.PhysicsShapeQueryParameters.get_transform,
        Godot.Core.PhysicsShapeQueryParameters.set_margin,
        Godot.Core.PhysicsShapeQueryParameters.get_margin,
        Godot.Core.PhysicsShapeQueryParameters.set_collision_mask,
        Godot.Core.PhysicsShapeQueryParameters.get_collision_mask,
        Godot.Core.PhysicsShapeQueryParameters.set_exclude,
        Godot.Core.PhysicsShapeQueryParameters.get_exclude,
        Godot.Core.PhysicsShapeQueryParameters.set_collide_with_bodies,
        Godot.Core.PhysicsShapeQueryParameters.is_collide_with_bodies_enabled,
        Godot.Core.PhysicsShapeQueryParameters.set_collide_with_areas,
        Godot.Core.PhysicsShapeQueryParameters.is_collide_with_areas_enabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPhysicsShapeQueryParameters_set_shape #-}

bindPhysicsShapeQueryParameters_set_shape :: MethodBind
bindPhysicsShapeQueryParameters_set_shape
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_set_shape_rid #-}

bindPhysicsShapeQueryParameters_set_shape_rid :: MethodBind
bindPhysicsShapeQueryParameters_set_shape_rid
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_shape_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_get_shape_rid #-}

bindPhysicsShapeQueryParameters_get_shape_rid :: MethodBind
bindPhysicsShapeQueryParameters_get_shape_rid
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_shape_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_set_transform #-}

bindPhysicsShapeQueryParameters_set_transform :: MethodBind
bindPhysicsShapeQueryParameters_set_transform
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_get_transform #-}

bindPhysicsShapeQueryParameters_get_transform :: MethodBind
bindPhysicsShapeQueryParameters_get_transform
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_set_margin #-}

bindPhysicsShapeQueryParameters_set_margin :: MethodBind
bindPhysicsShapeQueryParameters_set_margin
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_get_margin #-}

bindPhysicsShapeQueryParameters_get_margin :: MethodBind
bindPhysicsShapeQueryParameters_get_margin
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_set_collision_mask #-}

bindPhysicsShapeQueryParameters_set_collision_mask :: MethodBind
bindPhysicsShapeQueryParameters_set_collision_mask
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_get_collision_mask #-}

bindPhysicsShapeQueryParameters_get_collision_mask :: MethodBind
bindPhysicsShapeQueryParameters_get_collision_mask
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_set_exclude #-}

bindPhysicsShapeQueryParameters_set_exclude :: MethodBind
bindPhysicsShapeQueryParameters_set_exclude
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_exclude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_get_exclude #-}

bindPhysicsShapeQueryParameters_get_exclude :: MethodBind
bindPhysicsShapeQueryParameters_get_exclude
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "get_exclude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_set_collide_with_bodies
             #-}

bindPhysicsShapeQueryParameters_set_collide_with_bodies ::
                                                        MethodBind
bindPhysicsShapeQueryParameters_set_collide_with_bodies
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collide_with_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_is_collide_with_bodies_enabled
             #-}

bindPhysicsShapeQueryParameters_is_collide_with_bodies_enabled ::
                                                               MethodBind
bindPhysicsShapeQueryParameters_is_collide_with_bodies_enabled
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "is_collide_with_bodies_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_set_collide_with_areas
             #-}

bindPhysicsShapeQueryParameters_set_collide_with_areas ::
                                                       MethodBind
bindPhysicsShapeQueryParameters_set_collide_with_areas
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "set_collide_with_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindPhysicsShapeQueryParameters_is_collide_with_areas_enabled
             #-}

bindPhysicsShapeQueryParameters_is_collide_with_areas_enabled ::
                                                              MethodBind
bindPhysicsShapeQueryParameters_is_collide_with_areas_enabled
  = unsafePerformIO $
      withCString "PhysicsShapeQueryParameters" $
        \ clsNamePtr ->
          withCString "is_collide_with_areas_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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