{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorResourcePreviewGenerator
       (Godot.Tools.EditorResourcePreviewGenerator.can_generate_small_preview,
        Godot.Tools.EditorResourcePreviewGenerator.generate,
        Godot.Tools.EditorResourcePreviewGenerator.generate_from_path,
        Godot.Tools.EditorResourcePreviewGenerator.generate_small_preview_automatically,
        Godot.Tools.EditorResourcePreviewGenerator.handles)
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

{-# NOINLINE bindEditorResourcePreviewGenerator_can_generate_small_preview
             #-}

-- | If this function returns @true@, the generator will call @method generate@ or @method generate_from_path@ for small previews as well.
--   				By default, it returns @false@.
bindEditorResourcePreviewGenerator_can_generate_small_preview ::
                                                              MethodBind
bindEditorResourcePreviewGenerator_can_generate_small_preview
  = unsafePerformIO $
      withCString "EditorResourcePreviewGenerator" $
        \ clsNamePtr ->
          withCString "can_generate_small_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this function returns @true@, the generator will call @method generate@ or @method generate_from_path@ for small previews as well.
--   				By default, it returns @false@.
can_generate_small_preview ::
                             (EditorResourcePreviewGenerator :< cls, Object :< cls) =>
                             cls -> IO Bool
can_generate_small_preview cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePreviewGenerator_can_generate_small_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorResourcePreviewGenerator
           "can_generate_small_preview"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Tools.EditorResourcePreviewGenerator.can_generate_small_preview

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

instance NodeMethod EditorResourcePreviewGenerator "generate"
           '[Resource, Vector2]
           (IO Texture)
         where
        nodeMethod = Godot.Tools.EditorResourcePreviewGenerator.generate

{-# NOINLINE bindEditorResourcePreviewGenerator_generate_from_path
             #-}

-- | Generate a preview directly from a path with the specified size. Implementing this is optional, as default code will load and call @method generate@.
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

-- | Generate a preview directly from a path with the specified size. Implementing this is optional, as default code will load and call @method generate@.
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

instance NodeMethod EditorResourcePreviewGenerator
           "generate_from_path"
           '[GodotString, Vector2]
           (IO Texture)
         where
        nodeMethod
          = Godot.Tools.EditorResourcePreviewGenerator.generate_from_path

{-# NOINLINE bindEditorResourcePreviewGenerator_generate_small_preview_automatically
             #-}

-- | If this function returns @true@, the generator will automatically generate the small previews from the normal preview texture generated by the methods @method generate@ or @method generate_from_path@.
--   				By default, it returns @false@.
bindEditorResourcePreviewGenerator_generate_small_preview_automatically ::
                                                                        MethodBind
bindEditorResourcePreviewGenerator_generate_small_preview_automatically
  = unsafePerformIO $
      withCString "EditorResourcePreviewGenerator" $
        \ clsNamePtr ->
          withCString "generate_small_preview_automatically" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this function returns @true@, the generator will automatically generate the small previews from the normal preview texture generated by the methods @method generate@ or @method generate_from_path@.
--   				By default, it returns @false@.
generate_small_preview_automatically ::
                                       (EditorResourcePreviewGenerator :< cls, Object :< cls) =>
                                       cls -> IO Bool
generate_small_preview_automatically cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourcePreviewGenerator_generate_small_preview_automatically
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorResourcePreviewGenerator
           "generate_small_preview_automatically"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Tools.EditorResourcePreviewGenerator.generate_small_preview_automatically

{-# NOINLINE bindEditorResourcePreviewGenerator_handles #-}

-- | Returns @true@ if your generator supports the resource of type @type@.
bindEditorResourcePreviewGenerator_handles :: MethodBind
bindEditorResourcePreviewGenerator_handles
  = unsafePerformIO $
      withCString "EditorResourcePreviewGenerator" $
        \ clsNamePtr ->
          withCString "handles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if your generator supports the resource of type @type@.
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

instance NodeMethod EditorResourcePreviewGenerator "handles"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Tools.EditorResourcePreviewGenerator.handles