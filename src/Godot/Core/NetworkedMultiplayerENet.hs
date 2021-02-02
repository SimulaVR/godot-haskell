{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.NetworkedMultiplayerENet
       (Godot.Core.NetworkedMultiplayerENet._COMPRESS_NONE,
        Godot.Core.NetworkedMultiplayerENet._COMPRESS_RANGE_CODER,
        Godot.Core.NetworkedMultiplayerENet._COMPRESS_ZLIB,
        Godot.Core.NetworkedMultiplayerENet._COMPRESS_FASTLZ,
        Godot.Core.NetworkedMultiplayerENet._COMPRESS_ZSTD,
        Godot.Core.NetworkedMultiplayerENet.close_connection,
        Godot.Core.NetworkedMultiplayerENet.create_client,
        Godot.Core.NetworkedMultiplayerENet.create_server,
        Godot.Core.NetworkedMultiplayerENet.disconnect_peer,
        Godot.Core.NetworkedMultiplayerENet.get_channel_count,
        Godot.Core.NetworkedMultiplayerENet.get_compression_mode,
        Godot.Core.NetworkedMultiplayerENet.get_last_packet_channel,
        Godot.Core.NetworkedMultiplayerENet.get_packet_channel,
        Godot.Core.NetworkedMultiplayerENet.get_peer_address,
        Godot.Core.NetworkedMultiplayerENet.get_peer_port,
        Godot.Core.NetworkedMultiplayerENet.get_transfer_channel,
        Godot.Core.NetworkedMultiplayerENet.is_always_ordered,
        Godot.Core.NetworkedMultiplayerENet.is_server_relay_enabled,
        Godot.Core.NetworkedMultiplayerENet.set_always_ordered,
        Godot.Core.NetworkedMultiplayerENet.set_bind_ip,
        Godot.Core.NetworkedMultiplayerENet.set_channel_count,
        Godot.Core.NetworkedMultiplayerENet.set_compression_mode,
        Godot.Core.NetworkedMultiplayerENet.set_server_relay_enabled,
        Godot.Core.NetworkedMultiplayerENet.set_transfer_channel)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_COMPRESS_NONE :: Int
_COMPRESS_NONE = 0

_COMPRESS_RANGE_CODER :: Int
_COMPRESS_RANGE_CODER = 1

_COMPRESS_ZLIB :: Int
_COMPRESS_ZLIB = 3

_COMPRESS_FASTLZ :: Int
_COMPRESS_FASTLZ = 2

_COMPRESS_ZSTD :: Int
_COMPRESS_ZSTD = 4

{-# NOINLINE bindNetworkedMultiplayerENet_close_connection #-}

bindNetworkedMultiplayerENet_close_connection :: MethodBind
bindNetworkedMultiplayerENet_close_connection
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "close_connection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

close_connection ::
                   (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                   cls -> Int -> IO ()
close_connection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_close_connection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_create_client #-}

bindNetworkedMultiplayerENet_create_client :: MethodBind
bindNetworkedMultiplayerENet_create_client
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "create_client" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create_client ::
                (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                cls -> GodotString -> Int -> Int -> Int -> Int -> IO Int
create_client cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerENet_create_client
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_create_server #-}

bindNetworkedMultiplayerENet_create_server :: MethodBind
bindNetworkedMultiplayerENet_create_server
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "create_server" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create_server ::
                (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                cls -> Int -> Int -> Int -> Int -> IO Int
create_server cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerENet_create_server
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_disconnect_peer #-}

bindNetworkedMultiplayerENet_disconnect_peer :: MethodBind
bindNetworkedMultiplayerENet_disconnect_peer
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "disconnect_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

disconnect_peer ::
                  (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                  cls -> Int -> Bool -> IO ()
disconnect_peer cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerENet_disconnect_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_get_channel_count #-}

bindNetworkedMultiplayerENet_get_channel_count :: MethodBind
bindNetworkedMultiplayerENet_get_channel_count
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "get_channel_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_channel_count ::
                    (NetworkedMultiplayerENet :< cls, Object :< cls) => cls -> IO Int
get_channel_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_get_channel_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_get_compression_mode #-}

bindNetworkedMultiplayerENet_get_compression_mode :: MethodBind
bindNetworkedMultiplayerENet_get_compression_mode
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "get_compression_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_compression_mode ::
                       (NetworkedMultiplayerENet :< cls, Object :< cls) => cls -> IO Int
get_compression_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_get_compression_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_get_last_packet_channel
             #-}

bindNetworkedMultiplayerENet_get_last_packet_channel :: MethodBind
bindNetworkedMultiplayerENet_get_last_packet_channel
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "get_last_packet_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_last_packet_channel ::
                          (NetworkedMultiplayerENet :< cls, Object :< cls) => cls -> IO Int
get_last_packet_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_get_last_packet_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_get_packet_channel #-}

bindNetworkedMultiplayerENet_get_packet_channel :: MethodBind
bindNetworkedMultiplayerENet_get_packet_channel
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "get_packet_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_packet_channel ::
                     (NetworkedMultiplayerENet :< cls, Object :< cls) => cls -> IO Int
get_packet_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_get_packet_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_get_peer_address #-}

bindNetworkedMultiplayerENet_get_peer_address :: MethodBind
bindNetworkedMultiplayerENet_get_peer_address
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "get_peer_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peer_address ::
                   (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                   cls -> Int -> IO GodotString
get_peer_address cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_get_peer_address
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_get_peer_port #-}

bindNetworkedMultiplayerENet_get_peer_port :: MethodBind
bindNetworkedMultiplayerENet_get_peer_port
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "get_peer_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peer_port ::
                (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                cls -> Int -> IO Int
get_peer_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerENet_get_peer_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_get_transfer_channel #-}

bindNetworkedMultiplayerENet_get_transfer_channel :: MethodBind
bindNetworkedMultiplayerENet_get_transfer_channel
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "get_transfer_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_transfer_channel ::
                       (NetworkedMultiplayerENet :< cls, Object :< cls) => cls -> IO Int
get_transfer_channel cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_get_transfer_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_is_always_ordered #-}

bindNetworkedMultiplayerENet_is_always_ordered :: MethodBind
bindNetworkedMultiplayerENet_is_always_ordered
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "is_always_ordered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_always_ordered ::
                    (NetworkedMultiplayerENet :< cls, Object :< cls) => cls -> IO Bool
is_always_ordered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_is_always_ordered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_is_server_relay_enabled
             #-}

bindNetworkedMultiplayerENet_is_server_relay_enabled :: MethodBind
bindNetworkedMultiplayerENet_is_server_relay_enabled
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "is_server_relay_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_server_relay_enabled ::
                          (NetworkedMultiplayerENet :< cls, Object :< cls) => cls -> IO Bool
is_server_relay_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_is_server_relay_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_set_always_ordered #-}

bindNetworkedMultiplayerENet_set_always_ordered :: MethodBind
bindNetworkedMultiplayerENet_set_always_ordered
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "set_always_ordered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_always_ordered ::
                     (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                     cls -> Bool -> IO ()
set_always_ordered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_set_always_ordered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_set_bind_ip #-}

bindNetworkedMultiplayerENet_set_bind_ip :: MethodBind
bindNetworkedMultiplayerENet_set_bind_ip
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "set_bind_ip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bind_ip ::
              (NetworkedMultiplayerENet :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
set_bind_ip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNetworkedMultiplayerENet_set_bind_ip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_set_channel_count #-}

bindNetworkedMultiplayerENet_set_channel_count :: MethodBind
bindNetworkedMultiplayerENet_set_channel_count
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "set_channel_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_channel_count ::
                    (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                    cls -> Int -> IO ()
set_channel_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_set_channel_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_set_compression_mode #-}

bindNetworkedMultiplayerENet_set_compression_mode :: MethodBind
bindNetworkedMultiplayerENet_set_compression_mode
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "set_compression_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_compression_mode ::
                       (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                       cls -> Int -> IO ()
set_compression_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_set_compression_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_set_server_relay_enabled
             #-}

bindNetworkedMultiplayerENet_set_server_relay_enabled :: MethodBind
bindNetworkedMultiplayerENet_set_server_relay_enabled
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "set_server_relay_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_server_relay_enabled ::
                           (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                           cls -> Bool -> IO ()
set_server_relay_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_set_server_relay_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNetworkedMultiplayerENet_set_transfer_channel #-}

bindNetworkedMultiplayerENet_set_transfer_channel :: MethodBind
bindNetworkedMultiplayerENet_set_transfer_channel
  = unsafePerformIO $
      withCString "NetworkedMultiplayerENet" $
        \ clsNamePtr ->
          withCString "set_transfer_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_transfer_channel ::
                       (NetworkedMultiplayerENet :< cls, Object :< cls) =>
                       cls -> Int -> IO ()
set_transfer_channel cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindNetworkedMultiplayerENet_set_transfer_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)