{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ClippedCamera
       (Godot.Core.ClippedCamera._CLIP_PROCESS_PHYSICS,
        Godot.Core.ClippedCamera._CLIP_PROCESS_IDLE,
        Godot.Core.ClippedCamera.set_margin,
        Godot.Core.ClippedCamera.get_margin,
        Godot.Core.ClippedCamera.set_process_mode,
        Godot.Core.ClippedCamera.get_process_mode,
        Godot.Core.ClippedCamera.set_collision_mask,
        Godot.Core.ClippedCamera.get_collision_mask,
        Godot.Core.ClippedCamera.set_collision_mask_bit,
        Godot.Core.ClippedCamera.get_collision_mask_bit,
        Godot.Core.ClippedCamera.add_exception_rid,
        Godot.Core.ClippedCamera.add_exception,
        Godot.Core.ClippedCamera.remove_exception_rid,
        Godot.Core.ClippedCamera.remove_exception,
        Godot.Core.ClippedCamera.set_clip_to_areas,
        Godot.Core.ClippedCamera.is_clip_to_areas_enabled,
        Godot.Core.ClippedCamera.set_clip_to_bodies,
        Godot.Core.ClippedCamera.is_clip_to_bodies_enabled,
        Godot.Core.ClippedCamera.clear_exceptions)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_CLIP_PROCESS_PHYSICS :: Int
_CLIP_PROCESS_PHYSICS = 0

_CLIP_PROCESS_IDLE :: Int
_CLIP_PROCESS_IDLE = 1

{-# NOINLINE bindClippedCamera_set_margin #-}

bindClippedCamera_set_margin :: MethodBind
bindClippedCamera_set_margin
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_margin ::
             (ClippedCamera :< cls, Object :< cls) => cls -> Float -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_set_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_get_margin #-}

bindClippedCamera_get_margin :: MethodBind
bindClippedCamera_get_margin
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_margin ::
             (ClippedCamera :< cls, Object :< cls) => cls -> IO Float
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_get_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_set_process_mode #-}

bindClippedCamera_set_process_mode :: MethodBind
bindClippedCamera_set_process_mode
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "set_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_process_mode ::
                   (ClippedCamera :< cls, Object :< cls) => cls -> Int -> IO ()
set_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_set_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_get_process_mode #-}

bindClippedCamera_get_process_mode :: MethodBind
bindClippedCamera_get_process_mode
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "get_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_process_mode ::
                   (ClippedCamera :< cls, Object :< cls) => cls -> IO Int
get_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_get_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_set_collision_mask #-}

bindClippedCamera_set_collision_mask :: MethodBind
bindClippedCamera_set_collision_mask
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "set_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask ::
                     (ClippedCamera :< cls, Object :< cls) => cls -> Int -> IO ()
set_collision_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_set_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_get_collision_mask #-}

bindClippedCamera_get_collision_mask :: MethodBind
bindClippedCamera_get_collision_mask
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "get_collision_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask ::
                     (ClippedCamera :< cls, Object :< cls) => cls -> IO Int
get_collision_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_get_collision_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_set_collision_mask_bit #-}

bindClippedCamera_set_collision_mask_bit :: MethodBind
bindClippedCamera_set_collision_mask_bit
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "set_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_collision_mask_bit ::
                         (ClippedCamera :< cls, Object :< cls) =>
                         cls -> Int -> Bool -> IO ()
set_collision_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_set_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_get_collision_mask_bit #-}

bindClippedCamera_get_collision_mask_bit :: MethodBind
bindClippedCamera_get_collision_mask_bit
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "get_collision_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_collision_mask_bit ::
                         (ClippedCamera :< cls, Object :< cls) => cls -> Int -> IO Bool
get_collision_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_get_collision_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_add_exception_rid #-}

bindClippedCamera_add_exception_rid :: MethodBind
bindClippedCamera_add_exception_rid
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "add_exception_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_exception_rid ::
                    (ClippedCamera :< cls, Object :< cls) => cls -> Rid -> IO ()
add_exception_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_add_exception_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_add_exception #-}

bindClippedCamera_add_exception :: MethodBind
bindClippedCamera_add_exception
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "add_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_exception ::
                (ClippedCamera :< cls, Object :< cls) => cls -> Object -> IO ()
add_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_add_exception (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_remove_exception_rid #-}

bindClippedCamera_remove_exception_rid :: MethodBind
bindClippedCamera_remove_exception_rid
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "remove_exception_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_exception_rid ::
                       (ClippedCamera :< cls, Object :< cls) => cls -> Rid -> IO ()
remove_exception_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_remove_exception_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_remove_exception #-}

bindClippedCamera_remove_exception :: MethodBind
bindClippedCamera_remove_exception
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "remove_exception" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_exception ::
                   (ClippedCamera :< cls, Object :< cls) => cls -> Object -> IO ()
remove_exception cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_remove_exception
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_set_clip_to_areas #-}

bindClippedCamera_set_clip_to_areas :: MethodBind
bindClippedCamera_set_clip_to_areas
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "set_clip_to_areas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_clip_to_areas ::
                    (ClippedCamera :< cls, Object :< cls) => cls -> Bool -> IO ()
set_clip_to_areas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_set_clip_to_areas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_is_clip_to_areas_enabled #-}

bindClippedCamera_is_clip_to_areas_enabled :: MethodBind
bindClippedCamera_is_clip_to_areas_enabled
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "is_clip_to_areas_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_clip_to_areas_enabled ::
                           (ClippedCamera :< cls, Object :< cls) => cls -> IO Bool
is_clip_to_areas_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_is_clip_to_areas_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_set_clip_to_bodies #-}

bindClippedCamera_set_clip_to_bodies :: MethodBind
bindClippedCamera_set_clip_to_bodies
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "set_clip_to_bodies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_clip_to_bodies ::
                     (ClippedCamera :< cls, Object :< cls) => cls -> Bool -> IO ()
set_clip_to_bodies cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_set_clip_to_bodies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_is_clip_to_bodies_enabled #-}

bindClippedCamera_is_clip_to_bodies_enabled :: MethodBind
bindClippedCamera_is_clip_to_bodies_enabled
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "is_clip_to_bodies_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_clip_to_bodies_enabled ::
                            (ClippedCamera :< cls, Object :< cls) => cls -> IO Bool
is_clip_to_bodies_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_is_clip_to_bodies_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClippedCamera_clear_exceptions #-}

bindClippedCamera_clear_exceptions :: MethodBind
bindClippedCamera_clear_exceptions
  = unsafePerformIO $
      withCString "ClippedCamera" $
        \ clsNamePtr ->
          withCString "clear_exceptions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_exceptions ::
                   (ClippedCamera :< cls, Object :< cls) => cls -> IO ()
clear_exceptions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClippedCamera_clear_exceptions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)