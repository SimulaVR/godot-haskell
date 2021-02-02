{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Material
       (Godot.Core.Material._RENDER_PRIORITY_MAX,
        Godot.Core.Material._RENDER_PRIORITY_MIN,
        Godot.Core.Material.get_next_pass,
        Godot.Core.Material.get_render_priority,
        Godot.Core.Material.set_next_pass,
        Godot.Core.Material.set_render_priority)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_RENDER_PRIORITY_MAX :: Int
_RENDER_PRIORITY_MAX = 127

_RENDER_PRIORITY_MIN :: Int
_RENDER_PRIORITY_MIN = -128

{-# NOINLINE bindMaterial_get_next_pass #-}

bindMaterial_get_next_pass :: MethodBind
bindMaterial_get_next_pass
  = unsafePerformIO $
      withCString "Material" $
        \ clsNamePtr ->
          withCString "get_next_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_next_pass ::
                (Material :< cls, Object :< cls) => cls -> IO Material
get_next_pass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMaterial_get_next_pass (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMaterial_get_render_priority #-}

bindMaterial_get_render_priority :: MethodBind
bindMaterial_get_render_priority
  = unsafePerformIO $
      withCString "Material" $
        \ clsNamePtr ->
          withCString "get_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_render_priority ::
                      (Material :< cls, Object :< cls) => cls -> IO Int
get_render_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMaterial_get_render_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMaterial_set_next_pass #-}

bindMaterial_set_next_pass :: MethodBind
bindMaterial_set_next_pass
  = unsafePerformIO $
      withCString "Material" $
        \ clsNamePtr ->
          withCString "set_next_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_next_pass ::
                (Material :< cls, Object :< cls) => cls -> Material -> IO ()
set_next_pass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMaterial_set_next_pass (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMaterial_set_render_priority #-}

bindMaterial_set_render_priority :: MethodBind
bindMaterial_set_render_priority
  = unsafePerformIO $
      withCString "Material" $
        \ clsNamePtr ->
          withCString "set_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_render_priority ::
                      (Material :< cls, Object :< cls) => cls -> Int -> IO ()
set_render_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMaterial_set_render_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)