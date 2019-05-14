{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Texture
       (Godot.Core.Texture._FLAG_VIDEO_SURFACE,
        Godot.Core.Texture._FLAGS_DEFAULT, Godot.Core.Texture._FLAG_REPEAT,
        Godot.Core.Texture._FLAG_CONVERT_TO_LINEAR,
        Godot.Core.Texture._FLAG_ANISOTROPIC_FILTER,
        Godot.Core.Texture._FLAG_MIPMAPS, Godot.Core.Texture._FLAG_FILTER,
        Godot.Core.Texture._FLAG_MIRRORED_REPEAT,
        Godot.Core.Texture.get_width, Godot.Core.Texture.get_height,
        Godot.Core.Texture.get_size, Godot.Core.Texture.has_alpha,
        Godot.Core.Texture.set_flags, Godot.Core.Texture.get_flags,
        Godot.Core.Texture.draw, Godot.Core.Texture.draw_rect,
        Godot.Core.Texture.draw_rect_region, Godot.Core.Texture.get_data)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FLAG_VIDEO_SURFACE :: Int
_FLAG_VIDEO_SURFACE = 2048

_FLAGS_DEFAULT :: Int
_FLAGS_DEFAULT = 7

_FLAG_REPEAT :: Int
_FLAG_REPEAT = 2

_FLAG_CONVERT_TO_LINEAR :: Int
_FLAG_CONVERT_TO_LINEAR = 16

_FLAG_ANISOTROPIC_FILTER :: Int
_FLAG_ANISOTROPIC_FILTER = 8

_FLAG_MIPMAPS :: Int
_FLAG_MIPMAPS = 1

_FLAG_FILTER :: Int
_FLAG_FILTER = 4

_FLAG_MIRRORED_REPEAT :: Int
_FLAG_MIRRORED_REPEAT = 32

{-# NOINLINE bindTexture_get_width #-}

-- | Return the texture width.
bindTexture_get_width :: MethodBind
bindTexture_get_width
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the texture width.
get_width :: (Texture :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_get_width (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_get_height #-}

-- | Return the texture height.
bindTexture_get_height :: MethodBind
bindTexture_get_height
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the texture height.
get_height :: (Texture :< cls, Object :< cls) => cls -> IO Int
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_get_height (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_get_size #-}

-- | Return the texture size.
bindTexture_get_size :: MethodBind
bindTexture_get_size
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the texture size.
get_size :: (Texture :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_get_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_has_alpha #-}

bindTexture_has_alpha :: MethodBind
bindTexture_has_alpha
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "has_alpha" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_alpha :: (Texture :< cls, Object :< cls) => cls -> IO Bool
has_alpha cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_has_alpha (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_set_flags #-}

-- | The texture's flags.
bindTexture_set_flags :: MethodBind
bindTexture_set_flags
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "set_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's flags.
set_flags :: (Texture :< cls, Object :< cls) => cls -> Int -> IO ()
set_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_set_flags (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_get_flags #-}

-- | The texture's flags.
bindTexture_get_flags :: MethodBind
bindTexture_get_flags
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "get_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's flags.
get_flags :: (Texture :< cls, Object :< cls) => cls -> IO Int
get_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_get_flags (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_draw #-}

bindTexture_draw :: MethodBind
bindTexture_draw
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

draw ::
       (Texture :< cls, Object :< cls) =>
       cls -> Rid -> Vector2 -> Color -> Bool -> Texture -> IO ()
draw cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_draw (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_draw_rect #-}

bindTexture_draw_rect :: MethodBind
bindTexture_draw_rect
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "draw_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

draw_rect ::
            (Texture :< cls, Object :< cls) =>
            cls -> Rid -> Rect2 -> Bool -> Color -> Bool -> Texture -> IO ()
draw_rect cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_draw_rect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_draw_rect_region #-}

bindTexture_draw_rect_region :: MethodBind
bindTexture_draw_rect_region
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "draw_rect_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

draw_rect_region ::
                   (Texture :< cls, Object :< cls) =>
                   cls ->
                     Rid -> Rect2 -> Rect2 -> Color -> Bool -> Texture -> Bool -> IO ()
draw_rect_region cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_draw_rect_region (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTexture_get_data #-}

bindTexture_get_data :: MethodBind
bindTexture_get_data
  = unsafePerformIO $
      withCString "Texture" $
        \ clsNamePtr ->
          withCString "get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_data :: (Texture :< cls, Object :< cls) => cls -> IO Image
get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTexture_get_data (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)