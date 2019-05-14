{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorResourcePreview
       (Godot.Tools.EditorResourcePreview.sig_preview_invalidated,
        Godot.Tools.EditorResourcePreview._preview_ready,
        Godot.Tools.EditorResourcePreview.queue_resource_preview,
        Godot.Tools.EditorResourcePreview.queue_edited_resource_preview,
        Godot.Tools.EditorResourcePreview.add_preview_generator,
        Godot.Tools.EditorResourcePreview.remove_preview_generator,
        Godot.Tools.EditorResourcePreview.check_for_invalidation)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | If a preview was invalidated (changed) this signal will emit (using the path of the preview)
sig_preview_invalidated ::
                        Godot.Internal.Dispatch.Signal EditorResourcePreview
sig_preview_invalidated
  = Godot.Internal.Dispatch.Signal "preview_invalidated"

{-# NOINLINE bindEditorResourcePreview__preview_ready #-}

bindEditorResourcePreview__preview_ready :: MethodBind
bindEditorResourcePreview__preview_ready
  = unsafePerformIO $
      withCString "EditorResourcePreview" $
        \ clsNamePtr ->
          withCString "_preview_ready" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_preview_ready ::
                 (EditorResourcePreview :< cls, Object :< cls) =>
                 cls ->
                   GodotString ->
                     Texture -> Texture -> Int -> GodotString -> GodotVariant -> IO ()
_preview_ready cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePreview__preview_ready
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorResourcePreview_queue_resource_preview #-}

-- | Queue a resource file for preview (using a path). Once the preview is ready, your receiver.receiver_func will be called either containing the preview texture or an empty texture (if no preview was possible). Callback must have the format: (path,texture,userdata). Userdata can be anything.
bindEditorResourcePreview_queue_resource_preview :: MethodBind
bindEditorResourcePreview_queue_resource_preview
  = unsafePerformIO $
      withCString "EditorResourcePreview" $
        \ clsNamePtr ->
          withCString "queue_resource_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queue a resource file for preview (using a path). Once the preview is ready, your receiver.receiver_func will be called either containing the preview texture or an empty texture (if no preview was possible). Callback must have the format: (path,texture,userdata). Userdata can be anything.
queue_resource_preview ::
                         (EditorResourcePreview :< cls, Object :< cls) =>
                         cls ->
                           GodotString -> Object -> GodotString -> GodotVariant -> IO ()
queue_resource_preview cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePreview_queue_resource_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorResourcePreview_queue_edited_resource_preview
             #-}

-- | Queue a resource being edited for preview (using an instance). Once the preview is ready, your receiver.receiver_func will be called either containing the preview texture or an empty texture (if no preview was possible). Callback must have the format: (path,texture,userdata). Userdata can be anything.
bindEditorResourcePreview_queue_edited_resource_preview ::
                                                        MethodBind
bindEditorResourcePreview_queue_edited_resource_preview
  = unsafePerformIO $
      withCString "EditorResourcePreview" $
        \ clsNamePtr ->
          withCString "queue_edited_resource_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queue a resource being edited for preview (using an instance). Once the preview is ready, your receiver.receiver_func will be called either containing the preview texture or an empty texture (if no preview was possible). Callback must have the format: (path,texture,userdata). Userdata can be anything.
queue_edited_resource_preview ::
                                (EditorResourcePreview :< cls, Object :< cls) =>
                                cls -> Resource -> Object -> GodotString -> GodotVariant -> IO ()
queue_edited_resource_preview cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePreview_queue_edited_resource_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorResourcePreview_add_preview_generator #-}

-- | Create an own, custom preview generator.
bindEditorResourcePreview_add_preview_generator :: MethodBind
bindEditorResourcePreview_add_preview_generator
  = unsafePerformIO $
      withCString "EditorResourcePreview" $
        \ clsNamePtr ->
          withCString "add_preview_generator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Create an own, custom preview generator.
add_preview_generator ::
                        (EditorResourcePreview :< cls, Object :< cls) =>
                        cls -> EditorResourcePreviewGenerator -> IO ()
add_preview_generator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePreview_add_preview_generator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorResourcePreview_remove_preview_generator #-}

-- | Remove a custom preview generator.
bindEditorResourcePreview_remove_preview_generator :: MethodBind
bindEditorResourcePreview_remove_preview_generator
  = unsafePerformIO $
      withCString "EditorResourcePreview" $
        \ clsNamePtr ->
          withCString "remove_preview_generator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Remove a custom preview generator.
remove_preview_generator ::
                           (EditorResourcePreview :< cls, Object :< cls) =>
                           cls -> EditorResourcePreviewGenerator -> IO ()
remove_preview_generator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePreview_remove_preview_generator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorResourcePreview_check_for_invalidation #-}

-- | Check if the resource changed, if so it will be invalidated and the corresponding signal emitted.
bindEditorResourcePreview_check_for_invalidation :: MethodBind
bindEditorResourcePreview_check_for_invalidation
  = unsafePerformIO $
      withCString "EditorResourcePreview" $
        \ clsNamePtr ->
          withCString "check_for_invalidation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Check if the resource changed, if so it will be invalidated and the corresponding signal emitted.
check_for_invalidation ::
                         (EditorResourcePreview :< cls, Object :< cls) =>
                         cls -> GodotString -> IO ()
check_for_invalidation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePreview_check_for_invalidation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)