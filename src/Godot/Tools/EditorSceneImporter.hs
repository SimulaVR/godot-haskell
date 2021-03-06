{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorSceneImporter
       (Godot.Tools.EditorSceneImporter._IMPORT_MATERIALS_IN_INSTANCES,
        Godot.Tools.EditorSceneImporter._IMPORT_ANIMATION_FORCE_ALL_TRACKS_IN_ALL_CLIPS,
        Godot.Tools.EditorSceneImporter._IMPORT_USE_COMPRESSION,
        Godot.Tools.EditorSceneImporter._IMPORT_FAIL_ON_MISSING_DEPENDENCIES,
        Godot.Tools.EditorSceneImporter._IMPORT_ANIMATION,
        Godot.Tools.EditorSceneImporter._IMPORT_SCENE,
        Godot.Tools.EditorSceneImporter._IMPORT_ANIMATION_KEEP_VALUE_TRACKS,
        Godot.Tools.EditorSceneImporter._IMPORT_ANIMATION_DETECT_LOOP,
        Godot.Tools.EditorSceneImporter._IMPORT_ANIMATION_OPTIMIZE,
        Godot.Tools.EditorSceneImporter._IMPORT_GENERATE_TANGENT_ARRAYS,
        Godot.Tools.EditorSceneImporter._get_extensions,
        Godot.Tools.EditorSceneImporter._get_import_flags,
        Godot.Tools.EditorSceneImporter._import_animation,
        Godot.Tools.EditorSceneImporter._import_scene,
        Godot.Tools.EditorSceneImporter.import_animation_from_other_importer,
        Godot.Tools.EditorSceneImporter.import_scene_from_other_importer)
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
import Godot.Core.Reference()

_IMPORT_MATERIALS_IN_INSTANCES :: Int
_IMPORT_MATERIALS_IN_INSTANCES = 1024

_IMPORT_ANIMATION_FORCE_ALL_TRACKS_IN_ALL_CLIPS :: Int
_IMPORT_ANIMATION_FORCE_ALL_TRACKS_IN_ALL_CLIPS = 16

_IMPORT_USE_COMPRESSION :: Int
_IMPORT_USE_COMPRESSION = 2048

_IMPORT_FAIL_ON_MISSING_DEPENDENCIES :: Int
_IMPORT_FAIL_ON_MISSING_DEPENDENCIES = 512

_IMPORT_ANIMATION :: Int
_IMPORT_ANIMATION = 2

_IMPORT_SCENE :: Int
_IMPORT_SCENE = 1

_IMPORT_ANIMATION_KEEP_VALUE_TRACKS :: Int
_IMPORT_ANIMATION_KEEP_VALUE_TRACKS = 32

_IMPORT_ANIMATION_DETECT_LOOP :: Int
_IMPORT_ANIMATION_DETECT_LOOP = 4

_IMPORT_ANIMATION_OPTIMIZE :: Int
_IMPORT_ANIMATION_OPTIMIZE = 8

_IMPORT_GENERATE_TANGENT_ARRAYS :: Int
_IMPORT_GENERATE_TANGENT_ARRAYS = 256

{-# NOINLINE bindEditorSceneImporter__get_extensions #-}

bindEditorSceneImporter__get_extensions :: MethodBind
bindEditorSceneImporter__get_extensions
  = unsafePerformIO $
      withCString "EditorSceneImporter" $
        \ clsNamePtr ->
          withCString "_get_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_extensions ::
                  (EditorSceneImporter :< cls, Object :< cls) => cls -> IO Array
_get_extensions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSceneImporter__get_extensions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSceneImporter "_get_extensions" '[]
           (IO Array)
         where
        nodeMethod = Godot.Tools.EditorSceneImporter._get_extensions

{-# NOINLINE bindEditorSceneImporter__get_import_flags #-}

bindEditorSceneImporter__get_import_flags :: MethodBind
bindEditorSceneImporter__get_import_flags
  = unsafePerformIO $
      withCString "EditorSceneImporter" $
        \ clsNamePtr ->
          withCString "_get_import_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_import_flags ::
                    (EditorSceneImporter :< cls, Object :< cls) => cls -> IO Int
_get_import_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSceneImporter__get_import_flags
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSceneImporter "_get_import_flags" '[]
           (IO Int)
         where
        nodeMethod = Godot.Tools.EditorSceneImporter._get_import_flags

{-# NOINLINE bindEditorSceneImporter__import_animation #-}

bindEditorSceneImporter__import_animation :: MethodBind
bindEditorSceneImporter__import_animation
  = unsafePerformIO $
      withCString "EditorSceneImporter" $
        \ clsNamePtr ->
          withCString "_import_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_import_animation ::
                    (EditorSceneImporter :< cls, Object :< cls) =>
                    cls -> GodotString -> Int -> Int -> IO Animation
_import_animation cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSceneImporter__import_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSceneImporter "_import_animation"
           '[GodotString, Int, Int]
           (IO Animation)
         where
        nodeMethod = Godot.Tools.EditorSceneImporter._import_animation

{-# NOINLINE bindEditorSceneImporter__import_scene #-}

bindEditorSceneImporter__import_scene :: MethodBind
bindEditorSceneImporter__import_scene
  = unsafePerformIO $
      withCString "EditorSceneImporter" $
        \ clsNamePtr ->
          withCString "_import_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_import_scene ::
                (EditorSceneImporter :< cls, Object :< cls) =>
                cls -> GodotString -> Int -> Int -> IO Node
_import_scene cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorSceneImporter__import_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSceneImporter "_import_scene"
           '[GodotString, Int, Int]
           (IO Node)
         where
        nodeMethod = Godot.Tools.EditorSceneImporter._import_scene

{-# NOINLINE bindEditorSceneImporter_import_animation_from_other_importer
             #-}

bindEditorSceneImporter_import_animation_from_other_importer ::
                                                             MethodBind
bindEditorSceneImporter_import_animation_from_other_importer
  = unsafePerformIO $
      withCString "EditorSceneImporter" $
        \ clsNamePtr ->
          withCString "import_animation_from_other_importer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

import_animation_from_other_importer ::
                                       (EditorSceneImporter :< cls, Object :< cls) =>
                                       cls -> GodotString -> Int -> Int -> IO Animation
import_animation_from_other_importer cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSceneImporter_import_animation_from_other_importer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSceneImporter
           "import_animation_from_other_importer"
           '[GodotString, Int, Int]
           (IO Animation)
         where
        nodeMethod
          = Godot.Tools.EditorSceneImporter.import_animation_from_other_importer

{-# NOINLINE bindEditorSceneImporter_import_scene_from_other_importer
             #-}

bindEditorSceneImporter_import_scene_from_other_importer ::
                                                         MethodBind
bindEditorSceneImporter_import_scene_from_other_importer
  = unsafePerformIO $
      withCString "EditorSceneImporter" $
        \ clsNamePtr ->
          withCString "import_scene_from_other_importer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

import_scene_from_other_importer ::
                                   (EditorSceneImporter :< cls, Object :< cls) =>
                                   cls -> GodotString -> Int -> Int -> IO Node
import_scene_from_other_importer cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorSceneImporter_import_scene_from_other_importer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorSceneImporter
           "import_scene_from_other_importer"
           '[GodotString, Int, Int]
           (IO Node)
         where
        nodeMethod
          = Godot.Tools.EditorSceneImporter.import_scene_from_other_importer