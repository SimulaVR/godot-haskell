{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AtlasTexture
       (Godot.Core.AtlasTexture.get_atlas,
        Godot.Core.AtlasTexture.get_margin,
        Godot.Core.AtlasTexture.get_region,
        Godot.Core.AtlasTexture.has_filter_clip,
        Godot.Core.AtlasTexture.set_atlas,
        Godot.Core.AtlasTexture.set_filter_clip,
        Godot.Core.AtlasTexture.set_margin,
        Godot.Core.AtlasTexture.set_region)
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
import Godot.Core.Texture()

instance NodeProperty AtlasTexture "atlas" Texture 'False where
        nodeProperty = (get_atlas, wrapDroppingSetter set_atlas, Nothing)

instance NodeProperty AtlasTexture "filter_clip" Bool 'False where
        nodeProperty
          = (has_filter_clip, wrapDroppingSetter set_filter_clip, Nothing)

instance NodeProperty AtlasTexture "margin" Rect2 'False where
        nodeProperty = (get_margin, wrapDroppingSetter set_margin, Nothing)

instance NodeProperty AtlasTexture "region" Rect2 'False where
        nodeProperty = (get_region, wrapDroppingSetter set_region, Nothing)

{-# NOINLINE bindAtlasTexture_get_atlas #-}

-- | The texture that contains the atlas. Can be any @Texture@ subtype.
bindAtlasTexture_get_atlas :: MethodBind
bindAtlasTexture_get_atlas
  = unsafePerformIO $
      withCString "AtlasTexture" $
        \ clsNamePtr ->
          withCString "get_atlas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture that contains the atlas. Can be any @Texture@ subtype.
get_atlas ::
            (AtlasTexture :< cls, Object :< cls) => cls -> IO Texture
get_atlas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAtlasTexture_get_atlas (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AtlasTexture "get_atlas" '[] (IO Texture) where
        nodeMethod = Godot.Core.AtlasTexture.get_atlas

{-# NOINLINE bindAtlasTexture_get_margin #-}

-- | The margin around the region. The @Rect2@'s @Rect2.size@ parameter ("w" and "h" in the editor) resizes the texture so it fits within the margin.
bindAtlasTexture_get_margin :: MethodBind
bindAtlasTexture_get_margin
  = unsafePerformIO $
      withCString "AtlasTexture" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The margin around the region. The @Rect2@'s @Rect2.size@ parameter ("w" and "h" in the editor) resizes the texture so it fits within the margin.
get_margin ::
             (AtlasTexture :< cls, Object :< cls) => cls -> IO Rect2
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAtlasTexture_get_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AtlasTexture "get_margin" '[] (IO Rect2) where
        nodeMethod = Godot.Core.AtlasTexture.get_margin

{-# NOINLINE bindAtlasTexture_get_region #-}

-- | The AtlasTexture's used region.
bindAtlasTexture_get_region :: MethodBind
bindAtlasTexture_get_region
  = unsafePerformIO $
      withCString "AtlasTexture" $
        \ clsNamePtr ->
          withCString "get_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The AtlasTexture's used region.
get_region ::
             (AtlasTexture :< cls, Object :< cls) => cls -> IO Rect2
get_region cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAtlasTexture_get_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AtlasTexture "get_region" '[] (IO Rect2) where
        nodeMethod = Godot.Core.AtlasTexture.get_region

{-# NOINLINE bindAtlasTexture_has_filter_clip #-}

-- | If @true@, clips the area outside of the region to avoid bleeding of the surrounding texture pixels.
bindAtlasTexture_has_filter_clip :: MethodBind
bindAtlasTexture_has_filter_clip
  = unsafePerformIO $
      withCString "AtlasTexture" $
        \ clsNamePtr ->
          withCString "has_filter_clip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, clips the area outside of the region to avoid bleeding of the surrounding texture pixels.
has_filter_clip ::
                  (AtlasTexture :< cls, Object :< cls) => cls -> IO Bool
has_filter_clip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAtlasTexture_has_filter_clip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AtlasTexture "has_filter_clip" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AtlasTexture.has_filter_clip

{-# NOINLINE bindAtlasTexture_set_atlas #-}

-- | The texture that contains the atlas. Can be any @Texture@ subtype.
bindAtlasTexture_set_atlas :: MethodBind
bindAtlasTexture_set_atlas
  = unsafePerformIO $
      withCString "AtlasTexture" $
        \ clsNamePtr ->
          withCString "set_atlas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture that contains the atlas. Can be any @Texture@ subtype.
set_atlas ::
            (AtlasTexture :< cls, Object :< cls) => cls -> Texture -> IO ()
set_atlas cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAtlasTexture_set_atlas (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AtlasTexture "set_atlas" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.AtlasTexture.set_atlas

{-# NOINLINE bindAtlasTexture_set_filter_clip #-}

-- | If @true@, clips the area outside of the region to avoid bleeding of the surrounding texture pixels.
bindAtlasTexture_set_filter_clip :: MethodBind
bindAtlasTexture_set_filter_clip
  = unsafePerformIO $
      withCString "AtlasTexture" $
        \ clsNamePtr ->
          withCString "set_filter_clip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, clips the area outside of the region to avoid bleeding of the surrounding texture pixels.
set_filter_clip ::
                  (AtlasTexture :< cls, Object :< cls) => cls -> Bool -> IO ()
set_filter_clip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAtlasTexture_set_filter_clip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AtlasTexture "set_filter_clip" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AtlasTexture.set_filter_clip

{-# NOINLINE bindAtlasTexture_set_margin #-}

-- | The margin around the region. The @Rect2@'s @Rect2.size@ parameter ("w" and "h" in the editor) resizes the texture so it fits within the margin.
bindAtlasTexture_set_margin :: MethodBind
bindAtlasTexture_set_margin
  = unsafePerformIO $
      withCString "AtlasTexture" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The margin around the region. The @Rect2@'s @Rect2.size@ parameter ("w" and "h" in the editor) resizes the texture so it fits within the margin.
set_margin ::
             (AtlasTexture :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAtlasTexture_set_margin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AtlasTexture "set_margin" '[Rect2] (IO ())
         where
        nodeMethod = Godot.Core.AtlasTexture.set_margin

{-# NOINLINE bindAtlasTexture_set_region #-}

-- | The AtlasTexture's used region.
bindAtlasTexture_set_region :: MethodBind
bindAtlasTexture_set_region
  = unsafePerformIO $
      withCString "AtlasTexture" $
        \ clsNamePtr ->
          withCString "set_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The AtlasTexture's used region.
set_region ::
             (AtlasTexture :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAtlasTexture_set_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AtlasTexture "set_region" '[Rect2] (IO ())
         where
        nodeMethod = Godot.Core.AtlasTexture.set_region