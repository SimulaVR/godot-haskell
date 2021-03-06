{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorNavigationMeshGenerator
       (Godot.Tools.EditorNavigationMeshGenerator.bake,
        Godot.Tools.EditorNavigationMeshGenerator.clear)
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
import Godot.Core.Object()

{-# NOINLINE bindEditorNavigationMeshGenerator_bake #-}

bindEditorNavigationMeshGenerator_bake :: MethodBind
bindEditorNavigationMeshGenerator_bake
  = unsafePerformIO $
      withCString "EditorNavigationMeshGenerator" $
        \ clsNamePtr ->
          withCString "bake" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

bake ::
       (EditorNavigationMeshGenerator :< cls, Object :< cls) =>
       cls -> NavigationMesh -> Node -> IO ()
bake cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorNavigationMeshGenerator_bake
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorNavigationMeshGenerator "bake"
           '[NavigationMesh, Node]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorNavigationMeshGenerator.bake

{-# NOINLINE bindEditorNavigationMeshGenerator_clear #-}

bindEditorNavigationMeshGenerator_clear :: MethodBind
bindEditorNavigationMeshGenerator_clear
  = unsafePerformIO $
      withCString "EditorNavigationMeshGenerator" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear ::
        (EditorNavigationMeshGenerator :< cls, Object :< cls) =>
        cls -> NavigationMesh -> IO ()
clear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorNavigationMeshGenerator_clear
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorNavigationMeshGenerator "clear"
           '[NavigationMesh]
           (IO ())
         where
        nodeMethod = Godot.Tools.EditorNavigationMeshGenerator.clear