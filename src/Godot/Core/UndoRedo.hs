{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.UndoRedo
       (Godot.Core.UndoRedo._MERGE_DISABLE,
        Godot.Core.UndoRedo._MERGE_ALL, Godot.Core.UndoRedo._MERGE_ENDS,
        Godot.Core.UndoRedo.create_action,
        Godot.Core.UndoRedo.commit_action,
        Godot.Core.UndoRedo.is_commiting_action,
        Godot.Core.UndoRedo.add_do_method,
        Godot.Core.UndoRedo.add_undo_method,
        Godot.Core.UndoRedo.add_do_property,
        Godot.Core.UndoRedo.add_undo_property,
        Godot.Core.UndoRedo.add_do_reference,
        Godot.Core.UndoRedo.add_undo_reference,
        Godot.Core.UndoRedo.clear_history,
        Godot.Core.UndoRedo.get_current_action_name,
        Godot.Core.UndoRedo.get_version, Godot.Core.UndoRedo.redo,
        Godot.Core.UndoRedo.undo)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_MERGE_DISABLE :: Int
_MERGE_DISABLE = 0

_MERGE_ALL :: Int
_MERGE_ALL = 2

_MERGE_ENDS :: Int
_MERGE_ENDS = 1

{-# NOINLINE bindUndoRedo_create_action #-}

-- | Create a new action. After this is called, do all your calls to [method add_do_method], [method add_undo_method], [method add_do_property], and [method add_undo_property], then commit the action with [method commit_action].
--   				The way actions are merged is dictated by the [code]merge_mode[/code] argument. See [enum MergeMode] for details.
bindUndoRedo_create_action :: MethodBind
bindUndoRedo_create_action
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "create_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a new action. After this is called, do all your calls to [method add_do_method], [method add_undo_method], [method add_do_property], and [method add_undo_property], then commit the action with [method commit_action].
--   				The way actions are merged is dictated by the [code]merge_mode[/code] argument. See [enum MergeMode] for details.
create_action ::
                (UndoRedo :< cls, Object :< cls) =>
                cls -> GodotString -> Int -> IO ()
create_action cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_create_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_commit_action #-}

-- | Commit the action. All 'do' methods/properties are called/set when this function is called.
bindUndoRedo_commit_action :: MethodBind
bindUndoRedo_commit_action
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "commit_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Commit the action. All 'do' methods/properties are called/set when this function is called.
commit_action :: (UndoRedo :< cls, Object :< cls) => cls -> IO ()
commit_action cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_commit_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_is_commiting_action #-}

bindUndoRedo_is_commiting_action :: MethodBind
bindUndoRedo_is_commiting_action
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "is_commiting_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_commiting_action ::
                      (UndoRedo :< cls, Object :< cls) => cls -> IO Bool
is_commiting_action cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_is_commiting_action
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_add_do_method #-}

-- | Register a method that will be called when the action is committed.
bindUndoRedo_add_do_method :: MethodBind
bindUndoRedo_add_do_method
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_do_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a method that will be called when the action is committed.
add_do_method ::
                (UndoRedo :< cls, Object :< cls) =>
                cls ->
                  Object -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
add_do_method cls arg1 arg2 varargs
  = withVariantArray ([toVariant arg1, toVariant arg2] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_do_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_add_undo_method #-}

-- | Register a method that will be called when the action is undone.
bindUndoRedo_add_undo_method :: MethodBind
bindUndoRedo_add_undo_method
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_undo_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a method that will be called when the action is undone.
add_undo_method ::
                  (UndoRedo :< cls, Object :< cls) =>
                  cls ->
                    Object -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
add_undo_method cls arg1 arg2 varargs
  = withVariantArray ([toVariant arg1, toVariant arg2] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_undo_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_add_do_property #-}

-- | Register a property value change for 'do'.
bindUndoRedo_add_do_property :: MethodBind
bindUndoRedo_add_do_property
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_do_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a property value change for 'do'.
add_do_property ::
                  (UndoRedo :< cls, Object :< cls) =>
                  cls -> Object -> GodotString -> GodotVariant -> IO ()
add_do_property cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_do_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_add_undo_property #-}

-- | Register a property value change for 'undo'.
bindUndoRedo_add_undo_property :: MethodBind
bindUndoRedo_add_undo_property
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_undo_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a property value change for 'undo'.
add_undo_property ::
                    (UndoRedo :< cls, Object :< cls) =>
                    cls -> Object -> GodotString -> GodotVariant -> IO ()
add_undo_property cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_undo_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_add_do_reference #-}

-- | Register a reference for 'do' that will be erased if the 'do' history is lost. This is useful mostly for new nodes created for the 'do' call. Do not use for resources.
bindUndoRedo_add_do_reference :: MethodBind
bindUndoRedo_add_do_reference
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_do_reference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a reference for 'do' that will be erased if the 'do' history is lost. This is useful mostly for new nodes created for the 'do' call. Do not use for resources.
add_do_reference ::
                   (UndoRedo :< cls, Object :< cls) => cls -> Object -> IO ()
add_do_reference cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_do_reference (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_add_undo_reference #-}

-- | Register a reference for 'undo' that will be erased if the 'undo' history is lost. This is useful mostly for nodes removed with the 'do' call (not the 'undo' call!).
bindUndoRedo_add_undo_reference :: MethodBind
bindUndoRedo_add_undo_reference
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_undo_reference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a reference for 'undo' that will be erased if the 'undo' history is lost. This is useful mostly for nodes removed with the 'do' call (not the 'undo' call!).
add_undo_reference ::
                     (UndoRedo :< cls, Object :< cls) => cls -> Object -> IO ()
add_undo_reference cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_undo_reference (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_clear_history #-}

-- | Clear the undo/redo history and associated references.
--   				Passing [code]false[/code] to [code]increase_version[/code] will prevent the version number to be increased from this.
bindUndoRedo_clear_history :: MethodBind
bindUndoRedo_clear_history
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "clear_history" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear the undo/redo history and associated references.
--   				Passing [code]false[/code] to [code]increase_version[/code] will prevent the version number to be increased from this.
clear_history ::
                (UndoRedo :< cls, Object :< cls) => cls -> Bool -> IO ()
clear_history cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_clear_history (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_get_current_action_name #-}

-- | Get the name of the current action.
bindUndoRedo_get_current_action_name :: MethodBind
bindUndoRedo_get_current_action_name
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "get_current_action_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the name of the current action.
get_current_action_name ::
                          (UndoRedo :< cls, Object :< cls) => cls -> IO GodotString
get_current_action_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_get_current_action_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_get_version #-}

-- | Get the version, each time a new action is committed, the version number of the UndoRedo is increased automatically.
--   				This is useful mostly to check if something changed from a saved version.
bindUndoRedo_get_version :: MethodBind
bindUndoRedo_get_version
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "get_version" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the version, each time a new action is committed, the version number of the UndoRedo is increased automatically.
--   				This is useful mostly to check if something changed from a saved version.
get_version :: (UndoRedo :< cls, Object :< cls) => cls -> IO Int
get_version cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_get_version (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_redo #-}

-- | Redo last action.
bindUndoRedo_redo :: MethodBind
bindUndoRedo_redo
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "redo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Redo last action.
redo :: (UndoRedo :< cls, Object :< cls) => cls -> IO Bool
redo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_redo (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUndoRedo_undo #-}

-- | Undo last action.
bindUndoRedo_undo :: MethodBind
bindUndoRedo_undo
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "undo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Undo last action.
undo :: (UndoRedo :< cls, Object :< cls) => cls -> IO Bool
undo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_undo (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)