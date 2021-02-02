{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SpringArm
       (Godot.Core.SpringArm.add_excluded_object,
        Godot.Core.SpringArm.clear_excluded_objects,
        Godot.Core.SpringArm.get_collision_mask,
        Godot.Core.SpringArm.get_hit_length,
        Godot.Core.SpringArm.get_length, Godot.Core.SpringArm.get_margin,
        Godot.Core.SpringArm.get_shape,
        Godot.Core.SpringArm.remove_excluded_object,
        Godot.Core.SpringArm.set_collision_mask,
        Godot.Core.SpringArm.set_length, Godot.Core.SpringArm.set_margin,
        Godot.Core.SpringArm.set_shape)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSpringArm_add_excluded_object #-}

bindSpringArm_add_excluded_object :: MethodBind
bindSpringArm_add_excluded_object
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "add_excluded_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_excluded_object ::
                      (SpringArm :< cls, Object :< cls) => cls -> Rid -> IO ()
add_excluded_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_add_excluded_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_clear_excluded_objects #-}

bindSpringArm_clear_excluded_objects :: MethodBind
bindSpringArm_clear_excluded_objects
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "clear_excluded_objects" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_excluded_objects ::
                         (SpringArm :< cls, Object :< cls) => cls -> IO ()
clear_excluded_objects cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_clear_excluded_objects
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_get_collision_mask #-}

bindSpringArm_get_collision_mask :: MethodBind
bindSpringArm_get_collision_mask
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask ::
                     (SpringArm :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_get_hit_length #-}

bindSpringArm_get_hit_length :: MethodBind
bindSpringArm_get_hit_length
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_hit_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_hit_length ::
                 (SpringArm :< cls, Object :< cls) => cls -> IO Float
get_hit_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_hit_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_get_length #-}

bindSpringArm_get_length :: MethodBind
bindSpringArm_get_length
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_length :: (SpringArm :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_length (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_get_margin #-}

bindSpringArm_get_margin :: MethodBind
bindSpringArm_get_margin
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_margin :: (SpringArm :< cls, Object :< cls) => cls -> IO Float
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_margin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_get_shape #-}

bindSpringArm_get_shape :: MethodBind
bindSpringArm_get_shape
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "get_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_shape :: (SpringArm :< cls, Object :< cls) => cls -> IO Shape
get_shape cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_get_shape (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_remove_excluded_object #-}

bindSpringArm_remove_excluded_object :: MethodBind
bindSpringArm_remove_excluded_object
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "remove_excluded_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_excluded_object ::
                         (SpringArm :< cls, Object :< cls) => cls -> Rid -> IO Bool
remove_excluded_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_remove_excluded_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_set_collision_mask #-}

bindSpringArm_set_collision_mask :: MethodBind
bindSpringArm_set_collision_mask
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask ::
                     (SpringArm :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_set_length #-}

bindSpringArm_set_length :: MethodBind
bindSpringArm_set_length
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "set_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_length ::
             (SpringArm :< cls, Object :< cls) => cls -> Float -> IO ()
set_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_set_length (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_set_margin #-}

bindSpringArm_set_margin :: MethodBind
bindSpringArm_set_margin
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_margin ::
             (SpringArm :< cls, Object :< cls) => cls -> Float -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_set_margin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpringArm_set_shape #-}

bindSpringArm_set_shape :: MethodBind
bindSpringArm_set_shape
  = unsafePerformIO $
      withCString "SpringArm" $
        \ clsNamePtr ->
          withCString "set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_shape ::
            (SpringArm :< cls, Object :< cls) => cls -> Shape -> IO ()
set_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpringArm_set_shape (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)