{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Node2D()

-- | Emitted when the @texture@ is changed.
sig_texture_changed ::
                    Godot.Internal.Dispatch.Signal MultiMeshInstance2D
sig_texture_changed
  = Godot.Internal.Dispatch.Signal "texture_changed"

instance NodeSignal MultiMeshInstance2D "texture_changed" '[]

instance NodeProperty MultiMeshInstance2D "multimesh" MultiMesh
           'False
         where
        nodeProperty
          = (get_multimesh, wrapDroppingSetter set_multimesh, Nothing)

instance NodeProperty MultiMeshInstance2D "normal_map" Texture
           'False
         where
        nodeProperty
          = (get_normal_map, wrapDroppingSetter set_normal_map, Nothing)

instance NodeProperty MultiMeshInstance2D "texture" Texture 'False
         where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

{-# NOINLINE bindMultiMeshInstance2D_get_multimesh #-}

-- | The @MultiMesh@ that will be drawn by the @MultiMeshInstance2D@.
bindMultiMeshInstance2D_get_multimesh :: MethodBind
bindMultiMeshInstance2D_get_multimesh
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @MultiMesh@ that will be drawn by the @MultiMeshInstance2D@.
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

instance NodeMethod MultiMeshInstance2D "get_multimesh" '[]
           (IO MultiMesh)
         where
        nodeMethod = Godot.Core.MultiMeshInstance2D.get_multimesh

{-# NOINLINE bindMultiMeshInstance2D_get_normal_map #-}

-- | The normal map that will be used if using the default @CanvasItemMaterial@.
--   			__Note:__ Godot expects the normal map to use X+, Y+, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
bindMultiMeshInstance2D_get_normal_map :: MethodBind
bindMultiMeshInstance2D_get_normal_map
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map that will be used if using the default @CanvasItemMaterial@.
--   			__Note:__ Godot expects the normal map to use X+, Y+, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
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

instance NodeMethod MultiMeshInstance2D "get_normal_map" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.MultiMeshInstance2D.get_normal_map

{-# NOINLINE bindMultiMeshInstance2D_get_texture #-}

-- | The @Texture@ that will be used if using the default @CanvasItemMaterial@. Can be accessed as @TEXTURE@ in CanvasItem shader.
bindMultiMeshInstance2D_get_texture :: MethodBind
bindMultiMeshInstance2D_get_texture
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Texture@ that will be used if using the default @CanvasItemMaterial@. Can be accessed as @TEXTURE@ in CanvasItem shader.
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

instance NodeMethod MultiMeshInstance2D "get_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.MultiMeshInstance2D.get_texture

{-# NOINLINE bindMultiMeshInstance2D_set_multimesh #-}

-- | The @MultiMesh@ that will be drawn by the @MultiMeshInstance2D@.
bindMultiMeshInstance2D_set_multimesh :: MethodBind
bindMultiMeshInstance2D_set_multimesh
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @MultiMesh@ that will be drawn by the @MultiMeshInstance2D@.
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

instance NodeMethod MultiMeshInstance2D "set_multimesh"
           '[MultiMesh]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMeshInstance2D.set_multimesh

{-# NOINLINE bindMultiMeshInstance2D_set_normal_map #-}

-- | The normal map that will be used if using the default @CanvasItemMaterial@.
--   			__Note:__ Godot expects the normal map to use X+, Y+, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
bindMultiMeshInstance2D_set_normal_map :: MethodBind
bindMultiMeshInstance2D_set_normal_map
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_normal_map" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The normal map that will be used if using the default @CanvasItemMaterial@.
--   			__Note:__ Godot expects the normal map to use X+, Y+, and Z+ coordinates. See @url=http://wiki.polycount.com/wiki/Normal_Map_Technical_Details#Common_Swizzle_Coordinates@this page@/url@ for a comparison of normal map coordinates expected by popular engines.
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

instance NodeMethod MultiMeshInstance2D "set_normal_map" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMeshInstance2D.set_normal_map

{-# NOINLINE bindMultiMeshInstance2D_set_texture #-}

-- | The @Texture@ that will be used if using the default @CanvasItemMaterial@. Can be accessed as @TEXTURE@ in CanvasItem shader.
bindMultiMeshInstance2D_set_texture :: MethodBind
bindMultiMeshInstance2D_set_texture
  = unsafePerformIO $
      withCString "MultiMeshInstance2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Texture@ that will be used if using the default @CanvasItemMaterial@. Can be accessed as @TEXTURE@ in CanvasItem shader.
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

instance NodeMethod MultiMeshInstance2D "set_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMeshInstance2D.set_texture