{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.StreamPeerBuffer
       (Godot.Core.StreamPeerBuffer.clear,
        Godot.Core.StreamPeerBuffer.duplicate,
        Godot.Core.StreamPeerBuffer.get_data_array,
        Godot.Core.StreamPeerBuffer.get_position,
        Godot.Core.StreamPeerBuffer.get_size,
        Godot.Core.StreamPeerBuffer.resize,
        Godot.Core.StreamPeerBuffer.seek,
        Godot.Core.StreamPeerBuffer.set_data_array)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindStreamPeerBuffer_clear #-}

bindStreamPeerBuffer_clear :: MethodBind
bindStreamPeerBuffer_clear
  = unsafePerformIO $
      withCString "StreamPeerBuffer" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (StreamPeerBuffer :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerBuffer_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerBuffer_duplicate #-}

bindStreamPeerBuffer_duplicate :: MethodBind
bindStreamPeerBuffer_duplicate
  = unsafePerformIO $
      withCString "StreamPeerBuffer" $
        \ clsNamePtr ->
          withCString "duplicate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

duplicate ::
            (StreamPeerBuffer :< cls, Object :< cls) =>
            cls -> IO StreamPeerBuffer
duplicate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerBuffer_duplicate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerBuffer_get_data_array #-}

bindStreamPeerBuffer_get_data_array :: MethodBind
bindStreamPeerBuffer_get_data_array
  = unsafePerformIO $
      withCString "StreamPeerBuffer" $
        \ clsNamePtr ->
          withCString "get_data_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_data_array ::
                 (StreamPeerBuffer :< cls, Object :< cls) => cls -> IO PoolByteArray
get_data_array cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerBuffer_get_data_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerBuffer_get_position #-}

bindStreamPeerBuffer_get_position :: MethodBind
bindStreamPeerBuffer_get_position
  = unsafePerformIO $
      withCString "StreamPeerBuffer" $
        \ clsNamePtr ->
          withCString "get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_position ::
               (StreamPeerBuffer :< cls, Object :< cls) => cls -> IO Int
get_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerBuffer_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerBuffer_get_size #-}

bindStreamPeerBuffer_get_size :: MethodBind
bindStreamPeerBuffer_get_size
  = unsafePerformIO $
      withCString "StreamPeerBuffer" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_size ::
           (StreamPeerBuffer :< cls, Object :< cls) => cls -> IO Int
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerBuffer_get_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerBuffer_resize #-}

bindStreamPeerBuffer_resize :: MethodBind
bindStreamPeerBuffer_resize
  = unsafePerformIO $
      withCString "StreamPeerBuffer" $
        \ clsNamePtr ->
          withCString "resize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

resize ::
         (StreamPeerBuffer :< cls, Object :< cls) => cls -> Int -> IO ()
resize cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerBuffer_resize (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerBuffer_seek #-}

bindStreamPeerBuffer_seek :: MethodBind
bindStreamPeerBuffer_seek
  = unsafePerformIO $
      withCString "StreamPeerBuffer" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

seek ::
       (StreamPeerBuffer :< cls, Object :< cls) => cls -> Int -> IO ()
seek cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerBuffer_seek (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerBuffer_set_data_array #-}

bindStreamPeerBuffer_set_data_array :: MethodBind
bindStreamPeerBuffer_set_data_array
  = unsafePerformIO $
      withCString "StreamPeerBuffer" $
        \ clsNamePtr ->
          withCString "set_data_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_data_array ::
                 (StreamPeerBuffer :< cls, Object :< cls) =>
                 cls -> PoolByteArray -> IO ()
set_data_array cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerBuffer_set_data_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)