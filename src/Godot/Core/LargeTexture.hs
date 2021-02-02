{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.LargeTexture
       (Godot.Core.LargeTexture._get_data,
        Godot.Core.LargeTexture._set_data,
        Godot.Core.LargeTexture.add_piece, Godot.Core.LargeTexture.clear,
        Godot.Core.LargeTexture.get_piece_count,
        Godot.Core.LargeTexture.get_piece_offset,
        Godot.Core.LargeTexture.get_piece_texture,
        Godot.Core.LargeTexture.set_piece_offset,
        Godot.Core.LargeTexture.set_piece_texture,
        Godot.Core.LargeTexture.set_size)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindLargeTexture__get_data #-}

bindLargeTexture__get_data :: MethodBind
bindLargeTexture__get_data
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data ::
            (LargeTexture :< cls, Object :< cls) => cls -> IO Array
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture__get_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture__set_data #-}

bindLargeTexture__set_data :: MethodBind
bindLargeTexture__set_data
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data ::
            (LargeTexture :< cls, Object :< cls) => cls -> Array -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture__set_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture_add_piece #-}

-- | Add another [Texture] to this [code]LargeTexture[/code], starting on offset "ofs".
bindLargeTexture_add_piece :: MethodBind
bindLargeTexture_add_piece
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "add_piece" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add another [Texture] to this [code]LargeTexture[/code], starting on offset "ofs".
add_piece ::
            (LargeTexture :< cls, Object :< cls) =>
            cls -> Vector2 -> Texture -> IO Int
add_piece cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture_add_piece (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture_clear #-}

-- | Clears the [code]LargeTexture[/code].
bindLargeTexture_clear :: MethodBind
bindLargeTexture_clear
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the [code]LargeTexture[/code].
clear :: (LargeTexture :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture_get_piece_count #-}

-- | Returns the number of pieces currently in this [code]LargeTexture[/code].
bindLargeTexture_get_piece_count :: MethodBind
bindLargeTexture_get_piece_count
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "get_piece_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of pieces currently in this [code]LargeTexture[/code].
get_piece_count ::
                  (LargeTexture :< cls, Object :< cls) => cls -> IO Int
get_piece_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture_get_piece_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture_get_piece_offset #-}

-- | Returns the offset of the piece with index "idx".
bindLargeTexture_get_piece_offset :: MethodBind
bindLargeTexture_get_piece_offset
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "get_piece_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the offset of the piece with index "idx".
get_piece_offset ::
                   (LargeTexture :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_piece_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture_get_piece_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture_get_piece_texture #-}

-- | Returns the [Texture] of the piece with index "idx".
bindLargeTexture_get_piece_texture :: MethodBind
bindLargeTexture_get_piece_texture
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "get_piece_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Texture] of the piece with index "idx".
get_piece_texture ::
                    (LargeTexture :< cls, Object :< cls) => cls -> Int -> IO Texture
get_piece_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture_get_piece_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture_set_piece_offset #-}

-- | Sets the offset of the piece with index "idx" to "ofs".
bindLargeTexture_set_piece_offset :: MethodBind
bindLargeTexture_set_piece_offset
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "set_piece_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the offset of the piece with index "idx" to "ofs".
set_piece_offset ::
                   (LargeTexture :< cls, Object :< cls) =>
                   cls -> Int -> Vector2 -> IO ()
set_piece_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture_set_piece_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture_set_piece_texture #-}

-- | Sets the [Texture] of the piece with index "idx" to "texture".
bindLargeTexture_set_piece_texture :: MethodBind
bindLargeTexture_set_piece_texture
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "set_piece_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [Texture] of the piece with index "idx" to "texture".
set_piece_texture ::
                    (LargeTexture :< cls, Object :< cls) =>
                    cls -> Int -> Texture -> IO ()
set_piece_texture cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture_set_piece_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLargeTexture_set_size #-}

-- | Sets the size of this [code]LargeTexture[/code].
bindLargeTexture_set_size :: MethodBind
bindLargeTexture_set_size
  = unsafePerformIO $
      withCString "LargeTexture" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of this [code]LargeTexture[/code].
set_size ::
           (LargeTexture :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLargeTexture_set_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)