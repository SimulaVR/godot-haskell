{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorScenePostImport
       (Godot.Tools.EditorScenePostImport.get_source_file,
        Godot.Tools.EditorScenePostImport.get_source_folder,
        Godot.Tools.EditorScenePostImport.post_import)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEditorScenePostImport_get_source_file #-}

-- | Returns the source file path which got imported (e.g. [code]res://scene.dae[/code]).
bindEditorScenePostImport_get_source_file :: MethodBind
bindEditorScenePostImport_get_source_file
  = unsafePerformIO $
      withCString "EditorScenePostImport" $
        \ clsNamePtr ->
          withCString "get_source_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the source file path which got imported (e.g. [code]res://scene.dae[/code]).
get_source_file ::
                  (EditorScenePostImport :< cls, Object :< cls) =>
                  cls -> IO GodotString
get_source_file cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScenePostImport_get_source_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorScenePostImport_get_source_folder #-}

-- | Returns the resource folder the imported scene file is located in.
bindEditorScenePostImport_get_source_folder :: MethodBind
bindEditorScenePostImport_get_source_folder
  = unsafePerformIO $
      withCString "EditorScenePostImport" $
        \ clsNamePtr ->
          withCString "get_source_folder" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the resource folder the imported scene file is located in.
get_source_folder ::
                    (EditorScenePostImport :< cls, Object :< cls) =>
                    cls -> IO GodotString
get_source_folder cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScenePostImport_get_source_folder
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorScenePostImport_post_import #-}

-- | Gets called after the scene got imported and has to return the modified version of the scene.
bindEditorScenePostImport_post_import :: MethodBind
bindEditorScenePostImport_post_import
  = unsafePerformIO $
      withCString "EditorScenePostImport" $
        \ clsNamePtr ->
          withCString "post_import" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets called after the scene got imported and has to return the modified version of the scene.
post_import ::
              (EditorScenePostImport :< cls, Object :< cls) =>
              cls -> Object -> IO Object
post_import cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScenePostImport_post_import
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)