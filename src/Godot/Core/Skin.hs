{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Skin
       (Godot.Core.Skin.add_bind, Godot.Core.Skin.clear_binds,
        Godot.Core.Skin.get_bind_bone, Godot.Core.Skin.get_bind_count,
        Godot.Core.Skin.get_bind_pose, Godot.Core.Skin.set_bind_bone,
        Godot.Core.Skin.set_bind_count, Godot.Core.Skin.set_bind_pose)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSkin_add_bind #-}

bindSkin_add_bind :: MethodBind
bindSkin_add_bind
  = unsafePerformIO $
      withCString "Skin" $
        \ clsNamePtr ->
          withCString "add_bind" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_bind ::
           (Skin :< cls, Object :< cls) => cls -> Int -> Transform -> IO ()
add_bind cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkin_add_bind (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkin_clear_binds #-}

bindSkin_clear_binds :: MethodBind
bindSkin_clear_binds
  = unsafePerformIO $
      withCString "Skin" $
        \ clsNamePtr ->
          withCString "clear_binds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_binds :: (Skin :< cls, Object :< cls) => cls -> IO ()
clear_binds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkin_clear_binds (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkin_get_bind_bone #-}

bindSkin_get_bind_bone :: MethodBind
bindSkin_get_bind_bone
  = unsafePerformIO $
      withCString "Skin" $
        \ clsNamePtr ->
          withCString "get_bind_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bind_bone ::
                (Skin :< cls, Object :< cls) => cls -> Int -> IO Int
get_bind_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkin_get_bind_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkin_get_bind_count #-}

bindSkin_get_bind_count :: MethodBind
bindSkin_get_bind_count
  = unsafePerformIO $
      withCString "Skin" $
        \ clsNamePtr ->
          withCString "get_bind_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bind_count :: (Skin :< cls, Object :< cls) => cls -> IO Int
get_bind_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkin_get_bind_count (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkin_get_bind_pose #-}

bindSkin_get_bind_pose :: MethodBind
bindSkin_get_bind_pose
  = unsafePerformIO $
      withCString "Skin" $
        \ clsNamePtr ->
          withCString "get_bind_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bind_pose ::
                (Skin :< cls, Object :< cls) => cls -> Int -> IO Transform
get_bind_pose cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkin_get_bind_pose (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkin_set_bind_bone #-}

bindSkin_set_bind_bone :: MethodBind
bindSkin_set_bind_bone
  = unsafePerformIO $
      withCString "Skin" $
        \ clsNamePtr ->
          withCString "set_bind_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bind_bone ::
                (Skin :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_bind_bone cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkin_set_bind_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkin_set_bind_count #-}

bindSkin_set_bind_count :: MethodBind
bindSkin_set_bind_count
  = unsafePerformIO $
      withCString "Skin" $
        \ clsNamePtr ->
          withCString "set_bind_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bind_count ::
                 (Skin :< cls, Object :< cls) => cls -> Int -> IO ()
set_bind_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkin_set_bind_count (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkin_set_bind_pose #-}

bindSkin_set_bind_pose :: MethodBind
bindSkin_set_bind_pose
  = unsafePerformIO $
      withCString "Skin" $
        \ clsNamePtr ->
          withCString "set_bind_pose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bind_pose ::
                (Skin :< cls, Object :< cls) => cls -> Int -> Transform -> IO ()
set_bind_pose cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkin_set_bind_pose (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)