{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.TextureLayered
       (Godot.Core.TextureLayered._FLAGS_DEFAULT,
        Godot.Core.TextureLayered._FLAG_REPEAT,
        Godot.Core.TextureLayered._FLAG_MIPMAPS,
        Godot.Core.TextureLayered._FLAG_FILTER,
        Godot.Core.TextureLayered._get_data,
        Godot.Core.TextureLayered._set_data,
        Godot.Core.TextureLayered.create,
        Godot.Core.TextureLayered.get_depth,
        Godot.Core.TextureLayered.get_flags,
        Godot.Core.TextureLayered.get_format,
        Godot.Core.TextureLayered.get_height,
        Godot.Core.TextureLayered.get_layer_data,
        Godot.Core.TextureLayered.get_width,
        Godot.Core.TextureLayered.set_data_partial,
        Godot.Core.TextureLayered.set_flags,
        Godot.Core.TextureLayered.set_layer_data)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_FLAGS_DEFAULT :: Int
_FLAGS_DEFAULT = 4

_FLAG_REPEAT :: Int
_FLAG_REPEAT = 2

_FLAG_MIPMAPS :: Int
_FLAG_MIPMAPS = 1

_FLAG_FILTER :: Int
_FLAG_FILTER = 4

{-# NOINLINE bindTextureLayered__get_data #-}

bindTextureLayered__get_data :: MethodBind
bindTextureLayered__get_data
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data ::
            (TextureLayered :< cls, Object :< cls) => cls -> IO Dictionary
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered__get_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered__set_data #-}

bindTextureLayered__set_data :: MethodBind
bindTextureLayered__set_data
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data ::
            (TextureLayered :< cls, Object :< cls) =>
            cls -> Dictionary -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered__set_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_create #-}

bindTextureLayered_create :: MethodBind
bindTextureLayered_create
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create ::
         (TextureLayered :< cls, Object :< cls) =>
         cls -> Int -> Int -> Int -> Int -> Int -> IO ()
create cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_get_depth #-}

bindTextureLayered_get_depth :: MethodBind
bindTextureLayered_get_depth
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_depth ::
            (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_depth (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_get_flags #-}

bindTextureLayered_get_flags :: MethodBind
bindTextureLayered_get_flags
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_flags ::
            (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_get_format #-}

bindTextureLayered_get_format :: MethodBind
bindTextureLayered_get_format
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_format ::
             (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_format (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_get_height #-}

bindTextureLayered_get_height :: MethodBind
bindTextureLayered_get_height
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_height ::
             (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_get_layer_data #-}

bindTextureLayered_get_layer_data :: MethodBind
bindTextureLayered_get_layer_data
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_layer_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_layer_data ::
                 (TextureLayered :< cls, Object :< cls) => cls -> Int -> IO Image
get_layer_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_layer_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_get_width #-}

bindTextureLayered_get_width :: MethodBind
bindTextureLayered_get_width
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_width ::
            (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_set_data_partial #-}

bindTextureLayered_set_data_partial :: MethodBind
bindTextureLayered_set_data_partial
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "set_data_partial" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_data_partial ::
                   (TextureLayered :< cls, Object :< cls) =>
                   cls -> Image -> Int -> Int -> Int -> Int -> IO ()
set_data_partial cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_set_data_partial
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_set_flags #-}

bindTextureLayered_set_flags :: MethodBind
bindTextureLayered_set_flags
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "set_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_flags ::
            (TextureLayered :< cls, Object :< cls) => cls -> Int -> IO ()
set_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_set_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindTextureLayered_set_layer_data #-}

bindTextureLayered_set_layer_data :: MethodBind
bindTextureLayered_set_layer_data
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "set_layer_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_layer_data ::
                 (TextureLayered :< cls, Object :< cls) =>
                 cls -> Image -> Int -> IO ()
set_layer_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_set_layer_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)