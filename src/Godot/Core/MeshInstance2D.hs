{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MeshInstance2D
       (Godot.Core.MeshInstance2D.sig_texture_changed,
        Godot.Core.MeshInstance2D.get_mesh,
        Godot.Core.MeshInstance2D.get_normal_map,
        Godot.Core.MeshInstance2D.get_texture,
        Godot.Core.MeshInstance2D.set_mesh,
        Godot.Core.MeshInstance2D.set_normal_map,
        Godot.Core.MeshInstance2D.set_texture)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when the [member texture] is changed.
sig_texture_changed ::
                    Godot.Internal.Dispatch.Signal MeshInstance2D
sig_texture_changed
  = Godot.Internal.Dispatch.Signal "texture_changed"

instance NodeSignal MeshInstance2D "texture_changed" '[]

{-# NOINLINE bindMeshInstance2D_get_mesh #-}

-- | The [Mesh] that will be drawn by the [MeshInstance2D].
bindMeshInstance2D_get_mesh :: MethodBind
bindMeshInstance2D_get_mesh
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Mesh] that will be drawn by the [MeshInstance2D].
get_mesh ::
           (MeshInstance2D :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_get_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_get_normal_map #-}

-- | The normal map that will be used if using the default [CanvasItemMaterial].
--   			[b]Note:[/b] Godot expects the normal map to use X+, Y-, and Z+ coordinates. See [url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates]this page[/url] for a comparison of normal map coordinates expected by popular engines.
bindMeshInstance2D_get_normal_map :: MethodBind
bindMeshInstance2D_get_normal_map
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map that will be used if using the default [CanvasItemMaterial].
--   			[b]Note:[/b] Godot expects the normal map to use X+, Y-, and Z+ coordinates. See [url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates]this page[/url] for a comparison of normal map coordinates expected by popular engines.
get_normal_map ::
                 (MeshInstance2D :< cls, Object :< cls) => cls -> IO Texture
get_normal_map cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_get_normal_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_get_texture #-}

-- | The [Texture] that will be used if using the default [CanvasItemMaterial]. Can be accessed as [code]TEXTURE[/code] in CanvasItem shader.
bindMeshInstance2D_get_texture :: MethodBind
bindMeshInstance2D_get_texture
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Texture] that will be used if using the default [CanvasItemMaterial]. Can be accessed as [code]TEXTURE[/code] in CanvasItem shader.
get_texture ::
              (MeshInstance2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_set_mesh #-}

-- | The [Mesh] that will be drawn by the [MeshInstance2D].
bindMeshInstance2D_set_mesh :: MethodBind
bindMeshInstance2D_set_mesh
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Mesh] that will be drawn by the [MeshInstance2D].
set_mesh ::
           (MeshInstance2D :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_set_mesh (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_set_normal_map #-}

-- | The normal map that will be used if using the default [CanvasItemMaterial].
--   			[b]Note:[/b] Godot expects the normal map to use X+, Y-, and Z+ coordinates. See [url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates]this page[/url] for a comparison of normal map coordinates expected by popular engines.
bindMeshInstance2D_set_normal_map :: MethodBind
bindMeshInstance2D_set_normal_map
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map that will be used if using the default [CanvasItemMaterial].
--   			[b]Note:[/b] Godot expects the normal map to use X+, Y-, and Z+ coordinates. See [url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates]this page[/url] for a comparison of normal map coordinates expected by popular engines.
set_normal_map ::
                 (MeshInstance2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_normal_map cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_set_normal_map
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMeshInstance2D_set_texture #-}

-- | The [Texture] that will be used if using the default [CanvasItemMaterial]. Can be accessed as [code]TEXTURE[/code] in CanvasItem shader.
bindMeshInstance2D_set_texture :: MethodBind
bindMeshInstance2D_set_texture
  = unsafePerformIO $
      withCString "MeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Texture] that will be used if using the default [CanvasItemMaterial]. Can be accessed as [code]TEXTURE[/code] in CanvasItem shader.
set_texture ::
              (MeshInstance2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMeshInstance2D_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)