{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorResourcePreviewGenerator
       (Godot.Tools.EditorResourcePreviewGenerator.handles,
        Godot.Tools.EditorResourcePreviewGenerator.generate,
        Godot.Tools.EditorResourcePreviewGenerator.generate_from_path)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEditorResourcePreviewGenerator_handles #-}

-- | Return if your generator supports this resource type.
bindEditorResourcePreviewGenerator_handles :: MethodBind
bindEditorResourcePreviewGenerator_handles
  = unsafePerformIO $
      withCString "EditorResourcePreviewGenerator" $
        \ clsNamePtr ->
          withCString "handles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return if your generator supports this resource type.
handles ::
          (EditorResourcePreviewGenerator :< cls, Object :< cls) =>
          cls -> GodotString -> IO Bool
handles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePreviewGenerator_handles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorResourcePreviewGenerator_generate #-}

-- | Generate a preview from a given resource with the specified size. This must always be implemented.
--   				Returning an empty texture is an OK way to fail and let another generator take care.
--   				Care must be taken because this function is always called from a thread (not the main thread).
bindEditorResourcePreviewGenerator_generate :: MethodBind
bindEditorResourcePreviewGenerator_generate
  = unsafePerformIO $
      withCString "EditorResourcePreviewGenerator" $
        \ clsNamePtr ->
          withCString "generate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generate a preview from a given resource with the specified size. This must always be implemented.
--   				Returning an empty texture is an OK way to fail and let another generator take care.
--   				Care must be taken because this function is always called from a thread (not the main thread).
generate ::
           (EditorResourcePreviewGenerator :< cls, Object :< cls) =>
           cls -> Resource -> Vector2 -> IO Texture
generate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourcePreviewGenerator_generate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorResourcePreviewGenerator_generate_from_path
             #-}

-- | Generate a preview directly from a path with the specified size. Implementing this is optional, as default code will load and call [method generate].
--   				Returning an empty texture is an OK way to fail and let another generator take care.
--   				Care must be taken because this function is always called from a thread (not the main thread).
bindEditorResourcePreviewGenerator_generate_from_path :: MethodBind
bindEditorResourcePreviewGenerator_generate_from_path
  = unsafePerformIO $
      withCString "EditorResourcePreviewGenerator" $
        \ clsNamePtr ->
          withCString "generate_from_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generate a preview directly from a path with the specified size. Implementing this is optional, as default code will load and call [method generate].
--   				Returning an empty texture is an OK way to fail and let another generator take care.
--   				Care must be taken because this function is always called from a thread (not the main thread).
generate_from_path ::
                     (EditorResourcePreviewGenerator :< cls, Object :< cls) =>
                     cls -> GodotString -> Vector2 -> IO Texture
generate_from_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePreviewGenerator_generate_from_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)