{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PacketPeerStream
       (Godot.Core.PacketPeerStream.get_input_buffer_max_size,
        Godot.Core.PacketPeerStream.get_output_buffer_max_size,
        Godot.Core.PacketPeerStream.get_stream_peer,
        Godot.Core.PacketPeerStream.set_input_buffer_max_size,
        Godot.Core.PacketPeerStream.set_output_buffer_max_size,
        Godot.Core.PacketPeerStream.set_stream_peer)
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
import Godot.Core.PacketPeer()

instance NodeProperty PacketPeerStream "input_buffer_max_size" Int
           'False
         where
        nodeProperty
          = (get_input_buffer_max_size,
             wrapDroppingSetter set_input_buffer_max_size, Nothing)

instance NodeProperty PacketPeerStream "output_buffer_max_size" Int
           'False
         where
        nodeProperty
          = (get_output_buffer_max_size,
             wrapDroppingSetter set_output_buffer_max_size, Nothing)

instance NodeProperty PacketPeerStream "stream_peer" StreamPeer
           'False
         where
        nodeProperty
          = (get_stream_peer, wrapDroppingSetter set_stream_peer, Nothing)

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

instance NodeMethod PacketPeerStream "get_input_buffer_max_size"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeerStream.get_input_buffer_max_size

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

instance NodeMethod PacketPeerStream "get_output_buffer_max_size"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeerStream.get_output_buffer_max_size

{-# NOINLINE bindPacketPeerStream_get_stream_peer #-}

-- | The wrapped @StreamPeer@ object.
bindPacketPeerStream_get_stream_peer :: MethodBind
bindPacketPeerStream_get_stream_peer
  = unsafePerformIO $
      withCString "PacketPeerStream" $
        \ clsNamePtr ->
          withCString "get_stream_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The wrapped @StreamPeer@ object.
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

instance NodeMethod PacketPeerStream "get_stream_peer" '[]
           (IO StreamPeer)
         where
        nodeMethod = Godot.Core.PacketPeerStream.get_stream_peer

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

instance NodeMethod PacketPeerStream "set_input_buffer_max_size"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PacketPeerStream.set_input_buffer_max_size

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

instance NodeMethod PacketPeerStream "set_output_buffer_max_size"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PacketPeerStream.set_output_buffer_max_size

{-# NOINLINE bindPacketPeerStream_set_stream_peer #-}

-- | The wrapped @StreamPeer@ object.
bindPacketPeerStream_set_stream_peer :: MethodBind
bindPacketPeerStream_set_stream_peer
  = unsafePerformIO $
      withCString "PacketPeerStream" $
        \ clsNamePtr ->
          withCString "set_stream_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The wrapped @StreamPeer@ object.
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

instance NodeMethod PacketPeerStream "set_stream_peer"
           '[StreamPeer]
           (IO ())
         where
        nodeMethod = Godot.Core.PacketPeerStream.set_stream_peer