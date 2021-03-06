{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CSGMesh
       (Godot.Core.CSGMesh._mesh_changed, Godot.Core.CSGMesh.get_material,
        Godot.Core.CSGMesh.get_mesh, Godot.Core.CSGMesh.set_material,
        Godot.Core.CSGMesh.set_mesh)
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
import Godot.Core.CSGPrimitive()

instance NodeProperty CSGMesh "material" Material 'False where
        nodeProperty
          = (get_material, wrapDroppingSetter set_material, Nothing)

instance NodeProperty CSGMesh "mesh" Mesh 'False where
        nodeProperty = (get_mesh, wrapDroppingSetter set_mesh, Nothing)

{-# NOINLINE bindCSGMesh__mesh_changed #-}

bindCSGMesh__mesh_changed :: MethodBind
bindCSGMesh__mesh_changed
  = unsafePerformIO $
      withCString "CSGMesh" $
        \ clsNamePtr ->
          withCString "_mesh_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_mesh_changed :: (CSGMesh :< cls, Object :< cls) => cls -> IO ()
_mesh_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGMesh__mesh_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGMesh "_mesh_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.CSGMesh._mesh_changed

{-# NOINLINE bindCSGMesh_get_material #-}

bindCSGMesh_get_material :: MethodBind
bindCSGMesh_get_material
  = unsafePerformIO $
      withCString "CSGMesh" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_material ::
               (CSGMesh :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGMesh_get_material (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGMesh "get_material" '[] (IO Material) where
        nodeMethod = Godot.Core.CSGMesh.get_material

{-# NOINLINE bindCSGMesh_get_mesh #-}

bindCSGMesh_get_mesh :: MethodBind
bindCSGMesh_get_mesh
  = unsafePerformIO $
      withCString "CSGMesh" $
        \ clsNamePtr ->
          withCString "get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_mesh :: (CSGMesh :< cls, Object :< cls) => cls -> IO Mesh
get_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGMesh_get_mesh (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGMesh "get_mesh" '[] (IO Mesh) where
        nodeMethod = Godot.Core.CSGMesh.get_mesh

{-# NOINLINE bindCSGMesh_set_material #-}

bindCSGMesh_set_material :: MethodBind
bindCSGMesh_set_material
  = unsafePerformIO $
      withCString "CSGMesh" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_material ::
               (CSGMesh :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGMesh_set_material (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGMesh "set_material" '[Material] (IO ())
         where
        nodeMethod = Godot.Core.CSGMesh.set_material

{-# NOINLINE bindCSGMesh_set_mesh #-}

bindCSGMesh_set_mesh :: MethodBind
bindCSGMesh_set_mesh
  = unsafePerformIO $
      withCString "CSGMesh" $
        \ clsNamePtr ->
          withCString "set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_mesh :: (CSGMesh :< cls, Object :< cls) => cls -> Mesh -> IO ()
set_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGMesh_set_mesh (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGMesh "set_mesh" '[Mesh] (IO ()) where
        nodeMethod = Godot.Core.CSGMesh.set_mesh