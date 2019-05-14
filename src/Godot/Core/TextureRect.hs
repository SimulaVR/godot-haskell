{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TextureRect
       (Godot.Core.TextureRect._STRETCH_TILE,
        Godot.Core.TextureRect._STRETCH_KEEP_ASPECT_COVERED,
        Godot.Core.TextureRect._STRETCH_KEEP_ASPECT,
        Godot.Core.TextureRect._STRETCH_SCALE_ON_EXPAND,
        Godot.Core.TextureRect._STRETCH_SCALE,
        Godot.Core.TextureRect._STRETCH_KEEP,
        Godot.Core.TextureRect._STRETCH_KEEP_CENTERED,
        Godot.Core.TextureRect._STRETCH_KEEP_ASPECT_CENTERED,
        Godot.Core.TextureRect.set_texture,
        Godot.Core.TextureRect.get_texture,
        Godot.Core.TextureRect.set_expand,
        Godot.Core.TextureRect.has_expand,
        Godot.Core.TextureRect.set_stretch_mode,
        Godot.Core.TextureRect.get_stretch_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindTextureRect_set_texture #-}

-- | The node's [Texture] resource.
bindTextureRect_set_texture :: MethodBind
bindTextureRect_set_texture
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's [Texture] resource.
set_texture ::
              (TextureRect :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureRect_get_texture #-}

-- | The node's [Texture] resource.
bindTextureRect_get_texture :: MethodBind
bindTextureRect_get_texture
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's [Texture] resource.
get_texture ::
              (TextureRect :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureRect_set_expand #-}

-- | If [code]true[/code], the texture scales to fit its bounding rectangle. Default value: [code]false[/code].
bindTextureRect_set_expand :: MethodBind
bindTextureRect_set_expand
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "set_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the texture scales to fit its bounding rectangle. Default value: [code]false[/code].
set_expand ::
             (TextureRect :< cls, Object :< cls) => cls -> Bool -> IO ()
set_expand cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_set_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureRect_has_expand #-}

-- | If [code]true[/code], the texture scales to fit its bounding rectangle. Default value: [code]false[/code].
bindTextureRect_has_expand :: MethodBind
bindTextureRect_has_expand
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "has_expand" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the texture scales to fit its bounding rectangle. Default value: [code]false[/code].
has_expand :: (TextureRect :< cls, Object :< cls) => cls -> IO Bool
has_expand cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureRect_has_expand (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureRect_set_stretch_mode #-}

-- | Controls the texture's behavior when resizing the node's bounding rectangle. See [enum StretchMode].
bindTextureRect_set_stretch_mode :: MethodBind
bindTextureRect_set_stretch_mode
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "set_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the texture's behavior when resizing the node's bounding rectangle. See [enum StretchMode].
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

{-# NOINLINE bindTextureRect_get_stretch_mode #-}

-- | Controls the texture's behavior when resizing the node's bounding rectangle. See [enum StretchMode].
bindTextureRect_get_stretch_mode :: MethodBind
bindTextureRect_get_stretch_mode
  = unsafePerformIO $
      withCString "TextureRect" $
        \ clsNamePtr ->
          withCString "get_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the texture's behavior when resizing the node's bounding rectangle. See [enum StretchMode].
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