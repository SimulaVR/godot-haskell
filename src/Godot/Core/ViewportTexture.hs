{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ViewportTexture
       (Godot.Core.ViewportTexture.get_viewport_path_in_scene,
        Godot.Core.ViewportTexture.set_viewport_path_in_scene)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindViewportTexture_get_viewport_path_in_scene #-}

-- | The path to the [Viewport] node to display. This is relative to the scene root, not to the node which uses the texture.
bindViewportTexture_get_viewport_path_in_scene :: MethodBind
bindViewportTexture_get_viewport_path_in_scene
  = unsafePerformIO $
      withCString "ViewportTexture" $
        \ clsNamePtr ->
          withCString "get_viewport_path_in_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the [Viewport] node to display. This is relative to the scene root, not to the node which uses the texture.
get_viewport_path_in_scene ::
                             (ViewportTexture :< cls, Object :< cls) => cls -> IO NodePath
get_viewport_path_in_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindViewportTexture_get_viewport_path_in_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewportTexture_set_viewport_path_in_scene #-}

-- | The path to the [Viewport] node to display. This is relative to the scene root, not to the node which uses the texture.
bindViewportTexture_set_viewport_path_in_scene :: MethodBind
bindViewportTexture_set_viewport_path_in_scene
  = unsafePerformIO $
      withCString "ViewportTexture" $
        \ clsNamePtr ->
          withCString "set_viewport_path_in_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the [Viewport] node to display. This is relative to the scene root, not to the node which uses the texture.
set_viewport_path_in_scene ::
                             (ViewportTexture :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_viewport_path_in_scene cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindViewportTexture_set_viewport_path_in_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)