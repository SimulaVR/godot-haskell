{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.UndoRedo
       (Godot.Core.UndoRedo._MERGE_DISABLE,
        Godot.Core.UndoRedo._MERGE_ALL, Godot.Core.UndoRedo._MERGE_ENDS,
        Godot.Core.UndoRedo.sig_version_changed,
        Godot.Core.UndoRedo.add_do_method,
        Godot.Core.UndoRedo.add_do_property,
        Godot.Core.UndoRedo.add_do_reference,
        Godot.Core.UndoRedo.add_undo_method,
        Godot.Core.UndoRedo.add_undo_property,
        Godot.Core.UndoRedo.add_undo_reference,
        Godot.Core.UndoRedo.clear_history,
        Godot.Core.UndoRedo.commit_action,
        Godot.Core.UndoRedo.create_action,
        Godot.Core.UndoRedo.get_current_action_name,
        Godot.Core.UndoRedo.get_version, Godot.Core.UndoRedo.has_redo,
        Godot.Core.UndoRedo.has_undo,
        Godot.Core.UndoRedo.is_commiting_action, Godot.Core.UndoRedo.redo,
        Godot.Core.UndoRedo.undo)
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

_MERGE_DISABLE :: Int
_MERGE_DISABLE = 0

_MERGE_ALL :: Int
_MERGE_ALL = 2

_MERGE_ENDS :: Int
_MERGE_ENDS = 1

-- | Called when @method undo@ or @method redo@ was called.
sig_version_changed :: Godot.Internal.Dispatch.Signal UndoRedo
sig_version_changed
  = Godot.Internal.Dispatch.Signal "version_changed"

instance NodeSignal UndoRedo "version_changed" '[]

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
                cls -> Object -> GodotString -> [Variant 'GodotTy] -> IO ()
add_do_method cls arg1 arg2 varargs
  = withVariantArray ([toVariant arg1, toVariant arg2] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_do_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "add_do_method"
           '[Object, GodotString, [Variant 'GodotTy]]
           (IO ())
         where
        nodeMethod = Godot.Core.UndoRedo.add_do_method

{-# NOINLINE bindUndoRedo_add_do_property #-}

-- | Register a property value change for "do".
bindUndoRedo_add_do_property :: MethodBind
bindUndoRedo_add_do_property
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_do_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a property value change for "do".
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

instance NodeMethod UndoRedo "add_do_property"
           '[Object, GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.UndoRedo.add_do_property

{-# NOINLINE bindUndoRedo_add_do_reference #-}

-- | Register a reference for "do" that will be erased if the "do" history is lost. This is useful mostly for new nodes created for the "do" call. Do not use for resources.
bindUndoRedo_add_do_reference :: MethodBind
bindUndoRedo_add_do_reference
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_do_reference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a reference for "do" that will be erased if the "do" history is lost. This is useful mostly for new nodes created for the "do" call. Do not use for resources.
add_do_reference ::
                   (UndoRedo :< cls, Object :< cls) => cls -> Object -> IO ()
add_do_reference cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_do_reference (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "add_do_reference" '[Object] (IO ())
         where
        nodeMethod = Godot.Core.UndoRedo.add_do_reference

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
                  cls -> Object -> GodotString -> [Variant 'GodotTy] -> IO ()
add_undo_method cls arg1 arg2 varargs
  = withVariantArray ([toVariant arg1, toVariant arg2] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_undo_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "add_undo_method"
           '[Object, GodotString, [Variant 'GodotTy]]
           (IO ())
         where
        nodeMethod = Godot.Core.UndoRedo.add_undo_method

{-# NOINLINE bindUndoRedo_add_undo_property #-}

-- | Register a property value change for "undo".
bindUndoRedo_add_undo_property :: MethodBind
bindUndoRedo_add_undo_property
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_undo_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a property value change for "undo".
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

instance NodeMethod UndoRedo "add_undo_property"
           '[Object, GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.UndoRedo.add_undo_property

{-# NOINLINE bindUndoRedo_add_undo_reference #-}

-- | Register a reference for "undo" that will be erased if the "undo" history is lost. This is useful mostly for nodes removed with the "do" call (not the "undo" call!).
bindUndoRedo_add_undo_reference :: MethodBind
bindUndoRedo_add_undo_reference
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "add_undo_reference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Register a reference for "undo" that will be erased if the "undo" history is lost. This is useful mostly for nodes removed with the "do" call (not the "undo" call!).
add_undo_reference ::
                     (UndoRedo :< cls, Object :< cls) => cls -> Object -> IO ()
add_undo_reference cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_add_undo_reference (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "add_undo_reference" '[Object] (IO ())
         where
        nodeMethod = Godot.Core.UndoRedo.add_undo_reference

{-# NOINLINE bindUndoRedo_clear_history #-}

-- | Clear the undo/redo history and associated references.
--   				Passing @false@ to @increase_version@ will prevent the version number to be increased from this.
bindUndoRedo_clear_history :: MethodBind
bindUndoRedo_clear_history
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "clear_history" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear the undo/redo history and associated references.
--   				Passing @false@ to @increase_version@ will prevent the version number to be increased from this.
clear_history ::
                (UndoRedo :< cls, Object :< cls) => cls -> Maybe Bool -> IO ()
clear_history cls arg1
  = withVariantArray [maybe (VariantBool True) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_clear_history (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "clear_history" '[Maybe Bool] (IO ())
         where
        nodeMethod = Godot.Core.UndoRedo.clear_history

{-# NOINLINE bindUndoRedo_commit_action #-}

-- | Commit the action. All "do" methods/properties are called/set when this function is called.
bindUndoRedo_commit_action :: MethodBind
bindUndoRedo_commit_action
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "commit_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Commit the action. All "do" methods/properties are called/set when this function is called.
commit_action :: (UndoRedo :< cls, Object :< cls) => cls -> IO ()
commit_action cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_commit_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "commit_action" '[] (IO ()) where
        nodeMethod = Godot.Core.UndoRedo.commit_action

{-# NOINLINE bindUndoRedo_create_action #-}

-- | Create a new action. After this is called, do all your calls to @method add_do_method@, @method add_undo_method@, @method add_do_property@, and @method add_undo_property@, then commit the action with @method commit_action@.
--   				The way actions are merged is dictated by the @merge_mode@ argument. See @enum MergeMode@ for details.
bindUndoRedo_create_action :: MethodBind
bindUndoRedo_create_action
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "create_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create a new action. After this is called, do all your calls to @method add_do_method@, @method add_undo_method@, @method add_do_property@, and @method add_undo_property@, then commit the action with @method commit_action@.
--   				The way actions are merged is dictated by the @merge_mode@ argument. See @enum MergeMode@ for details.
create_action ::
                (UndoRedo :< cls, Object :< cls) =>
                cls -> GodotString -> Maybe Int -> IO ()
create_action cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_create_action (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "create_action"
           '[GodotString, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.UndoRedo.create_action

{-# NOINLINE bindUndoRedo_get_current_action_name #-}

-- | Gets the name of the current action.
bindUndoRedo_get_current_action_name :: MethodBind
bindUndoRedo_get_current_action_name
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "get_current_action_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the name of the current action.
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

instance NodeMethod UndoRedo "get_current_action_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.UndoRedo.get_current_action_name

{-# NOINLINE bindUndoRedo_get_version #-}

-- | Gets the version. Every time a new action is committed, the @UndoRedo@'s version number is increased automatically.
--   				This is useful mostly to check if something changed from a saved version.
bindUndoRedo_get_version :: MethodBind
bindUndoRedo_get_version
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "get_version" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the version. Every time a new action is committed, the @UndoRedo@'s version number is increased automatically.
--   				This is useful mostly to check if something changed from a saved version.
get_version :: (UndoRedo :< cls, Object :< cls) => cls -> IO Int
get_version cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_get_version (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "get_version" '[] (IO Int) where
        nodeMethod = Godot.Core.UndoRedo.get_version

{-# NOINLINE bindUndoRedo_has_redo #-}

-- | Returns @true@ if a "redo" action is available.
bindUndoRedo_has_redo :: MethodBind
bindUndoRedo_has_redo
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "has_redo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a "redo" action is available.
has_redo :: (UndoRedo :< cls, Object :< cls) => cls -> IO Bool
has_redo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_has_redo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "has_redo" '[] (IO Bool) where
        nodeMethod = Godot.Core.UndoRedo.has_redo

{-# NOINLINE bindUndoRedo_has_undo #-}

-- | Returns @true@ if an "undo" action is available.
bindUndoRedo_has_undo :: MethodBind
bindUndoRedo_has_undo
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "has_undo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if an "undo" action is available.
has_undo :: (UndoRedo :< cls, Object :< cls) => cls -> IO Bool
has_undo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_has_undo (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "has_undo" '[] (IO Bool) where
        nodeMethod = Godot.Core.UndoRedo.has_undo

{-# NOINLINE bindUndoRedo_is_commiting_action #-}

-- | Returns @true@ if the @UndoRedo@ is currently committing the action, i.e. running its "do" method or property change (see @method commit_action@).
bindUndoRedo_is_commiting_action :: MethodBind
bindUndoRedo_is_commiting_action
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "is_commiting_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the @UndoRedo@ is currently committing the action, i.e. running its "do" method or property change (see @method commit_action@).
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

instance NodeMethod UndoRedo "is_commiting_action" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.UndoRedo.is_commiting_action

{-# NOINLINE bindUndoRedo_redo #-}

-- | Redo the last action.
bindUndoRedo_redo :: MethodBind
bindUndoRedo_redo
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "redo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Redo the last action.
redo :: (UndoRedo :< cls, Object :< cls) => cls -> IO Bool
redo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_redo (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "redo" '[] (IO Bool) where
        nodeMethod = Godot.Core.UndoRedo.redo

{-# NOINLINE bindUndoRedo_undo #-}

-- | Undo the last action.
bindUndoRedo_undo :: MethodBind
bindUndoRedo_undo
  = unsafePerformIO $
      withCString "UndoRedo" $
        \ clsNamePtr ->
          withCString "undo" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Undo the last action.
undo :: (UndoRedo :< cls, Object :< cls) => cls -> IO Bool
undo cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUndoRedo_undo (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UndoRedo "undo" '[] (IO Bool) where
        nodeMethod = Godot.Core.UndoRedo.undo