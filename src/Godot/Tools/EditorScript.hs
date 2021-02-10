{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorScript
       (Godot.Tools.EditorScript._run,
        Godot.Tools.EditorScript.add_root_node,
        Godot.Tools.EditorScript.get_editor_interface,
        Godot.Tools.EditorScript.get_scene)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEditorScript__run #-}

-- | This method is executed by the Editor when [b]File > Run[/b] is used.
bindEditorScript__run :: MethodBind
bindEditorScript__run
  = unsafePerformIO $
      withCString "EditorScript" $
        \ clsNamePtr ->
          withCString "_run" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | This method is executed by the Editor when [b]File > Run[/b] is used.
_run :: (EditorScript :< cls, Object :< cls) => cls -> IO ()
_run cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScript__run (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorScript_add_root_node #-}

-- | Adds [code]node[/code] as a child of the root node in the editor context.
--   				[b]Warning:[/b] The implementation of this method is currently disabled.
bindEditorScript_add_root_node :: MethodBind
bindEditorScript_add_root_node
  = unsafePerformIO $
      withCString "EditorScript" $
        \ clsNamePtr ->
          withCString "add_root_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds [code]node[/code] as a child of the root node in the editor context.
--   				[b]Warning:[/b] The implementation of this method is currently disabled.
add_root_node ::
                (EditorScript :< cls, Object :< cls) => cls -> Node -> IO ()
add_root_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScript_add_root_node (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorScript_get_editor_interface #-}

-- | Returns the [EditorInterface] singleton instance.
bindEditorScript_get_editor_interface :: MethodBind
bindEditorScript_get_editor_interface
  = unsafePerformIO $
      withCString "EditorScript" $
        \ clsNamePtr ->
          withCString "get_editor_interface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [EditorInterface] singleton instance.
get_editor_interface ::
                       (EditorScript :< cls, Object :< cls) => cls -> IO EditorInterface
get_editor_interface cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScript_get_editor_interface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorScript_get_scene #-}

-- | Returns the Editor's currently active scene.
bindEditorScript_get_scene :: MethodBind
bindEditorScript_get_scene
  = unsafePerformIO $
      withCString "EditorScript" $
        \ clsNamePtr ->
          withCString "get_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the Editor's currently active scene.
get_scene :: (EditorScript :< cls, Object :< cls) => cls -> IO Node
get_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorScript_get_scene (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)