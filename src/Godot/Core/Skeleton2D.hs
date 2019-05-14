{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Skeleton2D
       (Godot.Core.Skeleton2D.sig_bone_setup_changed,
        Godot.Core.Skeleton2D._update_bone_setup,
        Godot.Core.Skeleton2D._update_transform,
        Godot.Core.Skeleton2D.get_bone_count,
        Godot.Core.Skeleton2D.get_bone, Godot.Core.Skeleton2D.get_skeleton)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_bone_setup_changed :: Godot.Internal.Dispatch.Signal Skeleton2D
sig_bone_setup_changed
  = Godot.Internal.Dispatch.Signal "bone_setup_changed"

{-# NOINLINE bindSkeleton2D__update_bone_setup #-}

bindSkeleton2D__update_bone_setup :: MethodBind
bindSkeleton2D__update_bone_setup
  = unsafePerformIO $
      withCString "Skeleton2D" $
        \ clsNamePtr ->
          withCString "_update_bone_setup" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_bone_setup ::
                     (Skeleton2D :< cls, Object :< cls) => cls -> IO ()
_update_bone_setup cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton2D__update_bone_setup
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton2D__update_transform #-}

bindSkeleton2D__update_transform :: MethodBind
bindSkeleton2D__update_transform
  = unsafePerformIO $
      withCString "Skeleton2D" $
        \ clsNamePtr ->
          withCString "_update_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_transform ::
                    (Skeleton2D :< cls, Object :< cls) => cls -> IO ()
_update_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton2D__update_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton2D_get_bone_count #-}

bindSkeleton2D_get_bone_count :: MethodBind
bindSkeleton2D_get_bone_count
  = unsafePerformIO $
      withCString "Skeleton2D" $
        \ clsNamePtr ->
          withCString "get_bone_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bone_count ::
                 (Skeleton2D :< cls, Object :< cls) => cls -> IO Int
get_bone_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton2D_get_bone_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton2D_get_bone #-}

bindSkeleton2D_get_bone :: MethodBind
bindSkeleton2D_get_bone
  = unsafePerformIO $
      withCString "Skeleton2D" $
        \ clsNamePtr ->
          withCString "get_bone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bone ::
           (Skeleton2D :< cls, Object :< cls) => cls -> Int -> IO Bone2D
get_bone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton2D_get_bone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkeleton2D_get_skeleton #-}

bindSkeleton2D_get_skeleton :: MethodBind
bindSkeleton2D_get_skeleton
  = unsafePerformIO $
      withCString "Skeleton2D" $
        \ clsNamePtr ->
          withCString "get_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skeleton :: (Skeleton2D :< cls, Object :< cls) => cls -> IO Rid
get_skeleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkeleton2D_get_skeleton (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)