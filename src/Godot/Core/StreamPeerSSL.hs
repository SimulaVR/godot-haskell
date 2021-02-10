{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.StreamPeerSSL
       (Godot.Core.StreamPeerSSL._STATUS_CONNECTED,
        Godot.Core.StreamPeerSSL._STATUS_ERROR,
        Godot.Core.StreamPeerSSL._STATUS_DISCONNECTED,
        Godot.Core.StreamPeerSSL._STATUS_ERROR_HOSTNAME_MISMATCH,
        Godot.Core.StreamPeerSSL._STATUS_HANDSHAKING,
        Godot.Core.StreamPeerSSL.accept_stream,
        Godot.Core.StreamPeerSSL.connect_to_stream,
        Godot.Core.StreamPeerSSL.disconnect_from_stream,
        Godot.Core.StreamPeerSSL.get_status,
        Godot.Core.StreamPeerSSL.is_blocking_handshake_enabled,
        Godot.Core.StreamPeerSSL.poll,
        Godot.Core.StreamPeerSSL.set_blocking_handshake_enabled)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_STATUS_CONNECTED :: Int
_STATUS_CONNECTED = 2

_STATUS_ERROR :: Int
_STATUS_ERROR = 3

_STATUS_DISCONNECTED :: Int
_STATUS_DISCONNECTED = 0

_STATUS_ERROR_HOSTNAME_MISMATCH :: Int
_STATUS_ERROR_HOSTNAME_MISMATCH = 4

_STATUS_HANDSHAKING :: Int
_STATUS_HANDSHAKING = 1

{-# NOINLINE bindStreamPeerSSL_accept_stream #-}

-- | Accepts a peer connection as a server using the given [code]private_key[/code] and providing the given [code]certificate[/code] to the client. You can pass the optional [code]chain[/code] parameter to provide additional CA chain information along with the certificate.
bindStreamPeerSSL_accept_stream :: MethodBind
bindStreamPeerSSL_accept_stream
  = unsafePerformIO $
      withCString "StreamPeerSSL" $
        \ clsNamePtr ->
          withCString "accept_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Accepts a peer connection as a server using the given [code]private_key[/code] and providing the given [code]certificate[/code] to the client. You can pass the optional [code]chain[/code] parameter to provide additional CA chain information along with the certificate.
accept_stream ::
                (StreamPeerSSL :< cls, Object :< cls) =>
                cls ->
                  StreamPeer ->
                    CryptoKey -> X509Certificate -> X509Certificate -> IO Int
accept_stream cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerSSL_accept_stream (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerSSL_connect_to_stream #-}

-- | Connects to a peer using an underlying [StreamPeer] [code]stream[/code]. If [code]validate_certs[/code] is [code]true[/code], [StreamPeerSSL] will validate that the certificate presented by the peer matches the [code]for_hostname[/code].
--   				[b]Note:[/b] Specifying a custom [code]valid_certificate[/code] is not supported in HTML5 exports due to browsers restrictions.
bindStreamPeerSSL_connect_to_stream :: MethodBind
bindStreamPeerSSL_connect_to_stream
  = unsafePerformIO $
      withCString "StreamPeerSSL" $
        \ clsNamePtr ->
          withCString "connect_to_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects to a peer using an underlying [StreamPeer] [code]stream[/code]. If [code]validate_certs[/code] is [code]true[/code], [StreamPeerSSL] will validate that the certificate presented by the peer matches the [code]for_hostname[/code].
--   				[b]Note:[/b] Specifying a custom [code]valid_certificate[/code] is not supported in HTML5 exports due to browsers restrictions.
connect_to_stream ::
                    (StreamPeerSSL :< cls, Object :< cls) =>
                    cls ->
                      StreamPeer -> Bool -> GodotString -> X509Certificate -> IO Int
connect_to_stream cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerSSL_connect_to_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerSSL_disconnect_from_stream #-}

-- | Disconnects from host.
bindStreamPeerSSL_disconnect_from_stream :: MethodBind
bindStreamPeerSSL_disconnect_from_stream
  = unsafePerformIO $
      withCString "StreamPeerSSL" $
        \ clsNamePtr ->
          withCString "disconnect_from_stream" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disconnects from host.
disconnect_from_stream ::
                         (StreamPeerSSL :< cls, Object :< cls) => cls -> IO ()
disconnect_from_stream cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerSSL_disconnect_from_stream
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerSSL_get_status #-}

-- | Returns the status of the connection. See [enum Status] for values.
bindStreamPeerSSL_get_status :: MethodBind
bindStreamPeerSSL_get_status
  = unsafePerformIO $
      withCString "StreamPeerSSL" $
        \ clsNamePtr ->
          withCString "get_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the status of the connection. See [enum Status] for values.
get_status ::
             (StreamPeerSSL :< cls, Object :< cls) => cls -> IO Int
get_status cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerSSL_get_status (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerSSL_is_blocking_handshake_enabled #-}

bindStreamPeerSSL_is_blocking_handshake_enabled :: MethodBind
bindStreamPeerSSL_is_blocking_handshake_enabled
  = unsafePerformIO $
      withCString "StreamPeerSSL" $
        \ clsNamePtr ->
          withCString "is_blocking_handshake_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_blocking_handshake_enabled ::
                                (StreamPeerSSL :< cls, Object :< cls) => cls -> IO Bool
is_blocking_handshake_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStreamPeerSSL_is_blocking_handshake_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerSSL_poll #-}

-- | Poll the connection to check for incoming bytes. Call this right before [method StreamPeer.get_available_bytes] for it to work properly.
bindStreamPeerSSL_poll :: MethodBind
bindStreamPeerSSL_poll
  = unsafePerformIO $
      withCString "StreamPeerSSL" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Poll the connection to check for incoming bytes. Call this right before [method StreamPeer.get_available_bytes] for it to work properly.
poll :: (StreamPeerSSL :< cls, Object :< cls) => cls -> IO ()
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerSSL_poll (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamPeerSSL_set_blocking_handshake_enabled #-}

bindStreamPeerSSL_set_blocking_handshake_enabled :: MethodBind
bindStreamPeerSSL_set_blocking_handshake_enabled
  = unsafePerformIO $
      withCString "StreamPeerSSL" $
        \ clsNamePtr ->
          withCString "set_blocking_handshake_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_blocking_handshake_enabled ::
                                 (StreamPeerSSL :< cls, Object :< cls) => cls -> Bool -> IO ()
set_blocking_handshake_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindStreamPeerSSL_set_blocking_handshake_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)