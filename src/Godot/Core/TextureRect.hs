{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TextureRect
       (Godot.Core.TextureRect._STRETCH_TILE,
        Godot.Core.TextureRect._STRETCH_KEEP_ASPECT_COVERED,
        Godot.Core.TextureRect._STRETCH_KEEP_ASPECT,
        Godot.Core.TextureRect._STRETCH_SCALE_ON_EXPAND,
        Godot.Core.TextureRect._STRETCH_SCALE,
        Godot.Core.TextureRect._STRETCH_KEEP,
        Godot.Core.TextureRect._STRETCH_KEEP_CENTERED,
        Godot.Core.TextureRect._STRETCH_KEEP_ASPECT_CENTERED,
        Godot.Core.TextureRect._texture_changed,
        Godot.Core.TextureRect.get_stretch_mode,
        Godot.Core.TextureRect.get_texture,
        Godot.Core.TextureRect.has_expand,
        Godot.Core.TextureRect.is_flipped_h,
        Godot.Core.TextureRect.is_flipped_v,
        Godot.Core.TextureRect.set_expand,
        Godot.Core.TextureRect.set_flip_h,
        Godot.Core.TextureRect.set_flip_v,
        Godot.Core.TextureRect.set_stretch_mode,
        Godot.Core.TextureRect.set_texture)
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
import Godot.Core.Control()

_STRETCH_TILE :: Int
_STRETCH_TILE = 2

_STRETCH_KEEP_ASPECT_COVERED :: Int
_STRETCH_KEEP_ASPECT_COVERED = 7

_STRETCH_KEEP_ASPECT :: Int
_STRETCH_KEEP_ASPECT = 5

_STRETCH_SCALE_ON_EXPAND :: Int
_STRETCH_SCALE_ON_EXPAND = 0

_STRETCH_SCALE :: Int
_STRETCH_SCALE = 1

_STRETCH_KEEP :: Int
_STRETCH_KEEP = 3

_STRETCH_KEEP_CENTERED :: Int
_STRETCH_KEEP_CENTERED = 4

_STRETCH_KEEP_ASPECT_CENTERED :: Int
_STRETCH_KEEP_ASPECT_CENTERED = 6

instance NodeProperty TextureRect "expand" Bool 'False where
        nodeProperty = (has_expand, wrapDroppingSetter set_expand, Nothing)

instance NodeProperty TextureRect "flip_h" Bool 'False where
        nodeProperty
          = (is_flipped_h, wrapDroppingSetter set_flip_h, Nothing)

instance NodeProperty TextureRect "flip_v" Bool 'False where
        nodeProperty
          = (is_flipped_v, wrapDroppingSetter set_flip_v, Nothing)

instance NodeProperty TextureRect "stretch_mode" Int 'False where
        nodeProperty
          = (get_stretch_mode, wrapDroppingSetter set_stretch_mode, Nothing)

instance NodeProperty TextureRect "texture" Texture 'False where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

{-# NOINLINE bindTextureRect__texture_changed #-}

bindTextureRect__texture_changed :: MethodBind
bindTextureRect__texture_changed
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "_texture_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_texture_changed ::
                   (TextureRect :< cls, Object :< cls) => cls -> IO ()
_texture_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect__texture_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "_texture_changed" '[] (IO ())
         where
        nodeMethod = Godot.Core.TextureRect._texture_changed

{-# NOINLINE bindTextureRect_get_stretch_mode #-}

-- | Controls the texture's behavior when resizing the node's bounding rectangle. See @enum StretchMode@.
bindTextureRect_get_stretch_mode :: MethodBind
bindTextureRect_get_stretch_mode
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "get_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the texture's behavior when resizing the node's bounding rectangle. See @enum StretchMode@.
get_stretch_mode ::
                   (TextureRect :< cls, Object :< cls) => cls -> IO Int
get_stretch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_get_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "get_stretch_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TextureRect.get_stretch_mode

{-# NOINLINE bindTextureRect_get_texture #-}

-- | The node's @Texture@ resource.
bindTextureRect_get_texture :: MethodBind
bindTextureRect_get_texture
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's @Texture@ resource.
get_texture ::
              (TextureRect :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "get_texture" '[] (IO Texture)
         where
        nodeMethod = Godot.Core.TextureRect.get_texture

{-# NOINLINE bindTextureRect_has_expand #-}

-- | If @true@, the texture scales to fit its bounding rectangle.
bindTextureRect_has_expand :: MethodBind
bindTextureRect_has_expand
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "has_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the texture scales to fit its bounding rectangle.
has_expand :: (TextureRect :< cls, Object :< cls) => cls -> IO Bool
has_expand cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_has_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "has_expand" '[] (IO Bool) where
        nodeMethod = Godot.Core.TextureRect.has_expand

{-# NOINLINE bindTextureRect_is_flipped_h #-}

-- | If @true@, texture is flipped horizontally.
bindTextureRect_is_flipped_h :: MethodBind
bindTextureRect_is_flipped_h
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "is_flipped_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped horizontally.
is_flipped_h ::
               (TextureRect :< cls, Object :< cls) => cls -> IO Bool
is_flipped_h cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_is_flipped_h (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "is_flipped_h" '[] (IO Bool) where
        nodeMethod = Godot.Core.TextureRect.is_flipped_h

{-# NOINLINE bindTextureRect_is_flipped_v #-}

-- | If @true@, texture is flipped vertically.
bindTextureRect_is_flipped_v :: MethodBind
bindTextureRect_is_flipped_v
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "is_flipped_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped vertically.
is_flipped_v ::
               (TextureRect :< cls, Object :< cls) => cls -> IO Bool
is_flipped_v cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_is_flipped_v (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "is_flipped_v" '[] (IO Bool) where
        nodeMethod = Godot.Core.TextureRect.is_flipped_v

{-# NOINLINE bindTextureRect_set_expand #-}

-- | If @true@, the texture scales to fit its bounding rectangle.
bindTextureRect_set_expand :: MethodBind
bindTextureRect_set_expand
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "set_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the texture scales to fit its bounding rectangle.
set_expand ::
             (TextureRect :< cls, Object :< cls) => cls -> Bool -> IO ()
set_expand cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_set_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "set_expand" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.TextureRect.set_expand

{-# NOINLINE bindTextureRect_set_flip_h #-}

-- | If @true@, texture is flipped horizontally.
bindTextureRect_set_flip_h :: MethodBind
bindTextureRect_set_flip_h
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "set_flip_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped horizontally.
set_flip_h ::
             (TextureRect :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_h cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_set_flip_h (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "set_flip_h" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.TextureRect.set_flip_h

{-# NOINLINE bindTextureRect_set_flip_v #-}

-- | If @true@, texture is flipped vertically.
bindTextureRect_set_flip_v :: MethodBind
bindTextureRect_set_flip_v
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "set_flip_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped vertically.
set_flip_v ::
             (TextureRect :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_v cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_set_flip_v (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "set_flip_v" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.TextureRect.set_flip_v

{-# NOINLINE bindTextureRect_set_stretch_mode #-}

-- | Controls the texture's behavior when resizing the node's bounding rectangle. See @enum StretchMode@.
bindTextureRect_set_stretch_mode :: MethodBind
bindTextureRect_set_stretch_mode
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "set_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the texture's behavior when resizing the node's bounding rectangle. See @enum StretchMode@.
set_stretch_mode ::
                   (TextureRect :< cls, Object :< cls) => cls -> Int -> IO ()
set_stretch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_set_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "set_stretch_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TextureRect.set_stretch_mode

{-# NOINLINE bindTextureRect_set_texture #-}

-- | The node's @Texture@ resource.
bindTextureRect_set_texture :: MethodBind
bindTextureRect_set_texture
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's @Texture@ resource.
set_texture ::
              (TextureRect :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureRect "set_texture" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.TextureRect.set_texture