{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.MultiMeshInstance2D
       (Godot.Core.MultiMeshInstance2D.sig_texture_changed,
        Godot.Core.MultiMeshInstance2D.get_multimesh,
        Godot.Core.MultiMeshInstance2D.get_normal_map,
        Godot.Core.MultiMeshInstance2D.get_texture,
        Godot.Core.MultiMeshInstance2D.set_multimesh,
        Godot.Core.MultiMeshInstance2D.set_normal_map,
        Godot.Core.MultiMeshInstance2D.set_texture)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_texture_changed ::
                    Godot.Internal.Dispatch.Signal MultiMeshInstance2D
sig_texture_changed
  = Godot.Internal.Dispatch.Signal "texture_changed"

{-# NOINLINE bindMultiMeshInstance2D_get_multimesh #-}

bindMultiMeshInstance2D_get_multimesh :: MethodBind
bindMultiMeshInstance2D_get_multimesh
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_multimesh ::
                (MultiMeshInstance2D :< cls, Object :< cls) => cls -> IO MultiMesh
get_multimesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMeshInstance2D_get_multimesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiMeshInstance2D_get_normal_map #-}

bindMultiMeshInstance2D_get_normal_map :: MethodBind
bindMultiMeshInstance2D_get_normal_map
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_normal_map ::
                 (MultiMeshInstance2D :< cls, Object :< cls) => cls -> IO Texture
get_normal_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMeshInstance2D_get_normal_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiMeshInstance2D_get_texture #-}

bindMultiMeshInstance2D_get_texture :: MethodBind
bindMultiMeshInstance2D_get_texture
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_texture ::
              (MultiMeshInstance2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMeshInstance2D_get_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiMeshInstance2D_set_multimesh #-}

bindMultiMeshInstance2D_set_multimesh :: MethodBind
bindMultiMeshInstance2D_set_multimesh
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_multimesh ::
                (MultiMeshInstance2D :< cls, Object :< cls) =>
                cls -> MultiMesh -> IO ()
set_multimesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMeshInstance2D_set_multimesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiMeshInstance2D_set_normal_map #-}

bindMultiMeshInstance2D_set_normal_map :: MethodBind
bindMultiMeshInstance2D_set_normal_map
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_normal_map ::
                 (MultiMeshInstance2D :< cls, Object :< cls) =>
                 cls -> Texture -> IO ()
set_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMeshInstance2D_set_normal_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMultiMeshInstance2D_set_texture #-}

bindMultiMeshInstance2D_set_texture :: MethodBind
bindMultiMeshInstance2D_set_texture
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_texture ::
              (MultiMeshInstance2D :< cls, Object :< cls) =>
              cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMeshInstance2D_set_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)