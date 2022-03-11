{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Sprite3D
       (Godot.Core.Sprite3D.sig_frame_changed,
        Godot.Core.Sprite3D.get_frame,
        Godot.Core.Sprite3D.get_frame_coords,
        Godot.Core.Sprite3D.get_hframes,
        Godot.Core.Sprite3D.get_region_rect,
        Godot.Core.Sprite3D.get_texture, Godot.Core.Sprite3D.get_vframes,
        Godot.Core.Sprite3D.is_region, Godot.Core.Sprite3D.set_frame,
        Godot.Core.Sprite3D.set_frame_coords,
        Godot.Core.Sprite3D.set_hframes, Godot.Core.Sprite3D.set_region,
        Godot.Core.Sprite3D.set_region_rect,
        Godot.Core.Sprite3D.set_texture, Godot.Core.Sprite3D.set_vframes)
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
import Godot.Core.SpriteBase3D()

-- | Emitted when the @frame@ changes.
sig_frame_changed :: Godot.Internal.Dispatch.Signal Sprite3D
sig_frame_changed = Godot.Internal.Dispatch.Signal "frame_changed"

instance NodeSignal Sprite3D "frame_changed" '[]

instance NodeProperty Sprite3D "frame" Int 'False where
        nodeProperty = (get_frame, wrapDroppingSetter set_frame, Nothing)

instance NodeProperty Sprite3D "frame_coords" Vector2 'False where
        nodeProperty
          = (get_frame_coords, wrapDroppingSetter set_frame_coords, Nothing)

instance NodeProperty Sprite3D "hframes" Int 'False where
        nodeProperty
          = (get_hframes, wrapDroppingSetter set_hframes, Nothing)

instance NodeProperty Sprite3D "region_enabled" Bool 'False where
        nodeProperty = (is_region, wrapDroppingSetter set_region, Nothing)

instance NodeProperty Sprite3D "region_rect" Rect2 'False where
        nodeProperty
          = (get_region_rect, wrapDroppingSetter set_region_rect, Nothing)

instance NodeProperty Sprite3D "texture" Texture 'False where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

instance NodeProperty Sprite3D "vframes" Int 'False where
        nodeProperty
          = (get_vframes, wrapDroppingSetter set_vframes, Nothing)

{-# NOINLINE bindSprite3D_get_frame #-}

-- | Current frame to display from sprite sheet. @hframes@ or @vframes@ must be greater than 1.
bindSprite3D_get_frame :: MethodBind
bindSprite3D_get_frame
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current frame to display from sprite sheet. @hframes@ or @vframes@ must be greater than 1.
get_frame :: (Sprite3D :< cls, Object :< cls) => cls -> IO Int
get_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_frame (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "get_frame" '[] (IO Int) where
        nodeMethod = Godot.Core.Sprite3D.get_frame

{-# NOINLINE bindSprite3D_get_frame_coords #-}

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the @frame@ property. @hframes@ or @vframes@ must be greater than 1.
bindSprite3D_get_frame_coords :: MethodBind
bindSprite3D_get_frame_coords
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_frame_coords" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the @frame@ property. @hframes@ or @vframes@ must be greater than 1.
get_frame_coords ::
                   (Sprite3D :< cls, Object :< cls) => cls -> IO Vector2
get_frame_coords cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_frame_coords (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "get_frame_coords" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Sprite3D.get_frame_coords

{-# NOINLINE bindSprite3D_get_hframes #-}

-- | The number of columns in the sprite sheet.
bindSprite3D_get_hframes :: MethodBind
bindSprite3D_get_hframes
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_hframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the sprite sheet.
get_hframes :: (Sprite3D :< cls, Object :< cls) => cls -> IO Int
get_hframes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_hframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "get_hframes" '[] (IO Int) where
        nodeMethod = Godot.Core.Sprite3D.get_hframes

{-# NOINLINE bindSprite3D_get_region_rect #-}

-- | The region of the atlas texture to display. @region_enabled@ must be @true@.
bindSprite3D_get_region_rect :: MethodBind
bindSprite3D_get_region_rect
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The region of the atlas texture to display. @region_enabled@ must be @true@.
get_region_rect ::
                  (Sprite3D :< cls, Object :< cls) => cls -> IO Rect2
get_region_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_region_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "get_region_rect" '[] (IO Rect2) where
        nodeMethod = Godot.Core.Sprite3D.get_region_rect

{-# NOINLINE bindSprite3D_get_texture #-}

-- | @Texture@ object to draw. If @GeometryInstance.material_override@ is used, this will be overridden.
bindSprite3D_get_texture :: MethodBind
bindSprite3D_get_texture
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ object to draw. If @GeometryInstance.material_override@ is used, this will be overridden.
get_texture ::
              (Sprite3D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "get_texture" '[] (IO Texture) where
        nodeMethod = Godot.Core.Sprite3D.get_texture

{-# NOINLINE bindSprite3D_get_vframes #-}

-- | The number of rows in the sprite sheet.
bindSprite3D_get_vframes :: MethodBind
bindSprite3D_get_vframes
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "get_vframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of rows in the sprite sheet.
get_vframes :: (Sprite3D :< cls, Object :< cls) => cls -> IO Int
get_vframes cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_get_vframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "get_vframes" '[] (IO Int) where
        nodeMethod = Godot.Core.Sprite3D.get_vframes

{-# NOINLINE bindSprite3D_is_region #-}

-- | If @true@, texture will be cut from a larger atlas texture. See @region_rect@.
bindSprite3D_is_region :: MethodBind
bindSprite3D_is_region
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "is_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture will be cut from a larger atlas texture. See @region_rect@.
is_region :: (Sprite3D :< cls, Object :< cls) => cls -> IO Bool
is_region cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_is_region (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "is_region" '[] (IO Bool) where
        nodeMethod = Godot.Core.Sprite3D.is_region

{-# NOINLINE bindSprite3D_set_frame #-}

-- | Current frame to display from sprite sheet. @hframes@ or @vframes@ must be greater than 1.
bindSprite3D_set_frame :: MethodBind
bindSprite3D_set_frame
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Current frame to display from sprite sheet. @hframes@ or @vframes@ must be greater than 1.
set_frame ::
            (Sprite3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_frame cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_frame (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "set_frame" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Sprite3D.set_frame

{-# NOINLINE bindSprite3D_set_frame_coords #-}

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the @frame@ property. @hframes@ or @vframes@ must be greater than 1.
bindSprite3D_set_frame_coords :: MethodBind
bindSprite3D_set_frame_coords
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_frame_coords" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Coordinates of the frame to display from sprite sheet. This is as an alias for the @frame@ property. @hframes@ or @vframes@ must be greater than 1.
set_frame_coords ::
                   (Sprite3D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_frame_coords cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_frame_coords (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "set_frame_coords" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Sprite3D.set_frame_coords

{-# NOINLINE bindSprite3D_set_hframes #-}

-- | The number of columns in the sprite sheet.
bindSprite3D_set_hframes :: MethodBind
bindSprite3D_set_hframes
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_hframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of columns in the sprite sheet.
set_hframes ::
              (Sprite3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_hframes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_hframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "set_hframes" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Sprite3D.set_hframes

{-# NOINLINE bindSprite3D_set_region #-}

-- | If @true@, texture will be cut from a larger atlas texture. See @region_rect@.
bindSprite3D_set_region :: MethodBind
bindSprite3D_set_region
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture will be cut from a larger atlas texture. See @region_rect@.
set_region ::
             (Sprite3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_region cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_region (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "set_region" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Sprite3D.set_region

{-# NOINLINE bindSprite3D_set_region_rect #-}

-- | The region of the atlas texture to display. @region_enabled@ must be @true@.
bindSprite3D_set_region_rect :: MethodBind
bindSprite3D_set_region_rect
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The region of the atlas texture to display. @region_enabled@ must be @true@.
set_region_rect ::
                  (Sprite3D :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_region_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_region_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "set_region_rect" '[Rect2] (IO ())
         where
        nodeMethod = Godot.Core.Sprite3D.set_region_rect

{-# NOINLINE bindSprite3D_set_texture #-}

-- | @Texture@ object to draw. If @GeometryInstance.material_override@ is used, this will be overridden.
bindSprite3D_set_texture :: MethodBind
bindSprite3D_set_texture
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ object to draw. If @GeometryInstance.material_override@ is used, this will be overridden.
set_texture ::
              (Sprite3D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "set_texture" '[Texture] (IO ()) where
        nodeMethod = Godot.Core.Sprite3D.set_texture

{-# NOINLINE bindSprite3D_set_vframes #-}

-- | The number of rows in the sprite sheet.
bindSprite3D_set_vframes :: MethodBind
bindSprite3D_set_vframes
  = unsafePerformIO $
      withCString "Sprite3D" $
        \ clsNamePtr ->
          withCString "set_vframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of rows in the sprite sheet.
set_vframes ::
              (Sprite3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_vframes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSprite3D_set_vframes (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Sprite3D "set_vframes" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Sprite3D.set_vframes