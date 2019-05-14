{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PacketPeerStream
       (Godot.Core.PacketPeerStream.set_stream_peer,
        Godot.Core.PacketPeerStream.get_stream_peer,
        Godot.Core.PacketPeerStream.set_input_buffer_max_size,
        Godot.Core.PacketPeerStream.set_output_buffer_max_size,
        Godot.Core.PacketPeerStream.get_input_buffer_max_size,
        Godot.Core.PacketPeerStream.get_output_buffer_max_size)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPacketPeerStream_set_stream_peer #-}

-- | The wrapped [StreamPeer] object.
bindPacketPeerStream_set_stream_peer :: MethodBind
bindPacketPeerStream_set_stream_peer
  = unsafePerformIO $
      withCString "PacketPeerStream" $
        \ clsNamePtr ->
          withCString "set_stream_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The wrapped [StreamPeer] object.
set_stream_peer ::
                  (PacketPeerStream :< cls, Object :< cls) =>
                  cls -> StreamPeer -> IO ()
set_stream_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerStream_set_stream_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerStream_get_stream_peer #-}

-- | The wrapped [StreamPeer] object.
bindPacketPeerStream_get_stream_peer :: MethodBind
bindPacketPeerStream_get_stream_peer
  = unsafePerformIO $
      withCString "PacketPeerStream" $
        \ clsNamePtr ->
          withCString "get_stream_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The wrapped [StreamPeer] object.
get_stream_peer ::
                  (PacketPeerStream :< cls, Object :< cls) => cls -> IO StreamPeer
get_stream_peer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeerStream_get_stream_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerStream_set_input_buffer_max_size #-}

bindPacketPeerStream_set_input_buffer_max_size :: MethodBind
bindPacketPeerStream_set_input_buffer_max_size
  = unsafePerformIO $
      withCString "PacketPeerStream" $
        \ clsNamePtr ->
          withCString "set_input_buffer_max_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_buffer_max_size ::
                            (PacketPeerStream :< cls, Object :< cls) => cls -> Int -> IO ()
set_input_buffer_max_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPacketPeerStream_set_input_buffer_max_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerStream_set_output_buffer_max_size #-}

bindPacketPeerStream_set_output_buffer_max_size :: MethodBind
bindPacketPeerStream_set_output_buffer_max_size
  = unsafePerformIO $
      withCString "PacketPeerStream" $
        \ clsNamePtr ->
          withCString "set_output_buffer_max_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_output_buffer_max_size ::
                             (PacketPeerStream :< cls, Object :< cls) => cls -> Int -> IO ()
set_output_buffer_max_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPacketPeerStream_set_output_buffer_max_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerStream_get_input_buffer_max_size #-}

bindPacketPeerStream_get_input_buffer_max_size :: MethodBind
bindPacketPeerStream_get_input_buffer_max_size
  = unsafePerformIO $
      withCString "PacketPeerStream" $
        \ clsNamePtr ->
          withCString "get_input_buffer_max_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_input_buffer_max_size ::
                            (PacketPeerStream :< cls, Object :< cls) => cls -> IO Int
get_input_buffer_max_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPacketPeerStream_get_input_buffer_max_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeerStream_get_output_buffer_max_size #-}

bindPacketPeerStream_get_output_buffer_max_size :: MethodBind
bindPacketPeerStream_get_output_buffer_max_size
  = unsafePerformIO $
      withCString "PacketPeerStream" $
        \ clsNamePtr ->
          withCString "get_output_buffer_max_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_output_buffer_max_size ::
                             (PacketPeerStream :< cls, Object :< cls) => cls -> IO Int
get_output_buffer_max_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPacketPeerStream_get_output_buffer_max_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)