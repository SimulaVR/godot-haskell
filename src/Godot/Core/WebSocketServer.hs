{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.WebSocketServer
       (Godot.Core.WebSocketServer.sig_client_close_request,
        Godot.Core.WebSocketServer.sig_client_connected,
        Godot.Core.WebSocketServer.sig_client_disconnected,
        Godot.Core.WebSocketServer.sig_data_received,
        Godot.Core.WebSocketServer.disconnect_peer,
        Godot.Core.WebSocketServer.get_bind_ip,
        Godot.Core.WebSocketServer.get_ca_chain,
        Godot.Core.WebSocketServer.get_peer_address,
        Godot.Core.WebSocketServer.get_peer_port,
        Godot.Core.WebSocketServer.get_private_key,
        Godot.Core.WebSocketServer.get_ssl_certificate,
        Godot.Core.WebSocketServer.has_peer,
        Godot.Core.WebSocketServer.is_listening,
        Godot.Core.WebSocketServer.listen,
        Godot.Core.WebSocketServer.set_bind_ip,
        Godot.Core.WebSocketServer.set_ca_chain,
        Godot.Core.WebSocketServer.set_private_key,
        Godot.Core.WebSocketServer.set_ssl_certificate,
        Godot.Core.WebSocketServer.stop)
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
import Godot.Core.WebSocketMultiplayerPeer()

sig_client_close_request ::
                         Godot.Internal.Dispatch.Signal WebSocketServer
sig_client_close_request
  = Godot.Internal.Dispatch.Signal "client_close_request"

instance NodeSignal WebSocketServer "client_close_request"
           '[Int, Int, GodotString]

sig_client_connected ::
                     Godot.Internal.Dispatch.Signal WebSocketServer
sig_client_connected
  = Godot.Internal.Dispatch.Signal "client_connected"

instance NodeSignal WebSocketServer "client_connected"
           '[Int, GodotString]

sig_client_disconnected ::
                        Godot.Internal.Dispatch.Signal WebSocketServer
sig_client_disconnected
  = Godot.Internal.Dispatch.Signal "client_disconnected"

instance NodeSignal WebSocketServer "client_disconnected"
           '[Int, Bool]

sig_data_received :: Godot.Internal.Dispatch.Signal WebSocketServer
sig_data_received = Godot.Internal.Dispatch.Signal "data_received"

instance NodeSignal WebSocketServer "data_received" '[Int]

instance NodeProperty WebSocketServer "bind_ip" GodotString 'False
         where
        nodeProperty
          = (get_bind_ip, wrapDroppingSetter set_bind_ip, Nothing)

instance NodeProperty WebSocketServer "ca_chain" X509Certificate
           'False
         where
        nodeProperty
          = (get_ca_chain, wrapDroppingSetter set_ca_chain, Nothing)

instance NodeProperty WebSocketServer "private_key" CryptoKey
           'False
         where
        nodeProperty
          = (get_private_key, wrapDroppingSetter set_private_key, Nothing)

instance NodeProperty WebSocketServer "ssl_certificate"
           X509Certificate
           'False
         where
        nodeProperty
          = (get_ssl_certificate, wrapDroppingSetter set_ssl_certificate,
             Nothing)

{-# NOINLINE bindWebSocketServer_disconnect_peer #-}

bindWebSocketServer_disconnect_peer :: MethodBind
bindWebSocketServer_disconnect_peer
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "disconnect_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

disconnect_peer ::
                  (WebSocketServer :< cls, Object :< cls) =>
                  cls -> Int -> Maybe Int -> Maybe GodotString -> IO ()
disconnect_peer cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (1000)) toVariant arg2,
       defaultedVariant VariantString "" arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_disconnect_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "disconnect_peer"
           '[Int, Maybe Int, Maybe GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.WebSocketServer.disconnect_peer

{-# NOINLINE bindWebSocketServer_get_bind_ip #-}

bindWebSocketServer_get_bind_ip :: MethodBind
bindWebSocketServer_get_bind_ip
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "get_bind_ip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bind_ip ::
              (WebSocketServer :< cls, Object :< cls) => cls -> IO GodotString
get_bind_ip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_get_bind_ip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "get_bind_ip" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.WebSocketServer.get_bind_ip

{-# NOINLINE bindWebSocketServer_get_ca_chain #-}

bindWebSocketServer_get_ca_chain :: MethodBind
bindWebSocketServer_get_ca_chain
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "get_ca_chain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_ca_chain ::
               (WebSocketServer :< cls, Object :< cls) =>
               cls -> IO X509Certificate
get_ca_chain cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_get_ca_chain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "get_ca_chain" '[]
           (IO X509Certificate)
         where
        nodeMethod = Godot.Core.WebSocketServer.get_ca_chain

{-# NOINLINE bindWebSocketServer_get_peer_address #-}

bindWebSocketServer_get_peer_address :: MethodBind
bindWebSocketServer_get_peer_address
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "get_peer_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peer_address ::
                   (WebSocketServer :< cls, Object :< cls) =>
                   cls -> Int -> IO GodotString
get_peer_address cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_get_peer_address
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "get_peer_address" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.WebSocketServer.get_peer_address

{-# NOINLINE bindWebSocketServer_get_peer_port #-}

bindWebSocketServer_get_peer_port :: MethodBind
bindWebSocketServer_get_peer_port
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "get_peer_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peer_port ::
                (WebSocketServer :< cls, Object :< cls) => cls -> Int -> IO Int
get_peer_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_get_peer_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "get_peer_port" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.WebSocketServer.get_peer_port

{-# NOINLINE bindWebSocketServer_get_private_key #-}

bindWebSocketServer_get_private_key :: MethodBind
bindWebSocketServer_get_private_key
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "get_private_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_private_key ::
                  (WebSocketServer :< cls, Object :< cls) => cls -> IO CryptoKey
get_private_key cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_get_private_key
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "get_private_key" '[]
           (IO CryptoKey)
         where
        nodeMethod = Godot.Core.WebSocketServer.get_private_key

{-# NOINLINE bindWebSocketServer_get_ssl_certificate #-}

bindWebSocketServer_get_ssl_certificate :: MethodBind
bindWebSocketServer_get_ssl_certificate
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "get_ssl_certificate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_ssl_certificate ::
                      (WebSocketServer :< cls, Object :< cls) =>
                      cls -> IO X509Certificate
get_ssl_certificate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_get_ssl_certificate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "get_ssl_certificate" '[]
           (IO X509Certificate)
         where
        nodeMethod = Godot.Core.WebSocketServer.get_ssl_certificate

{-# NOINLINE bindWebSocketServer_has_peer #-}

bindWebSocketServer_has_peer :: MethodBind
bindWebSocketServer_has_peer
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "has_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_peer ::
           (WebSocketServer :< cls, Object :< cls) => cls -> Int -> IO Bool
has_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_has_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "has_peer" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.WebSocketServer.has_peer

{-# NOINLINE bindWebSocketServer_is_listening #-}

bindWebSocketServer_is_listening :: MethodBind
bindWebSocketServer_is_listening
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "is_listening" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_listening ::
               (WebSocketServer :< cls, Object :< cls) => cls -> IO Bool
is_listening cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_is_listening
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "is_listening" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.WebSocketServer.is_listening

{-# NOINLINE bindWebSocketServer_listen #-}

bindWebSocketServer_listen :: MethodBind
bindWebSocketServer_listen
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "listen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

listen ::
         (WebSocketServer :< cls, Object :< cls) =>
         cls -> Int -> Maybe PoolStringArray -> Maybe Bool -> IO Int
listen cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1,
       defaultedVariant VariantPoolStringArray V.empty arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_listen (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "listen"
           '[Int, Maybe PoolStringArray, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.WebSocketServer.listen

{-# NOINLINE bindWebSocketServer_set_bind_ip #-}

bindWebSocketServer_set_bind_ip :: MethodBind
bindWebSocketServer_set_bind_ip
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "set_bind_ip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bind_ip ::
              (WebSocketServer :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
set_bind_ip cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_set_bind_ip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "set_bind_ip" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.WebSocketServer.set_bind_ip

{-# NOINLINE bindWebSocketServer_set_ca_chain #-}

bindWebSocketServer_set_ca_chain :: MethodBind
bindWebSocketServer_set_ca_chain
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "set_ca_chain" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_ca_chain ::
               (WebSocketServer :< cls, Object :< cls) =>
               cls -> X509Certificate -> IO ()
set_ca_chain cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_set_ca_chain
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "set_ca_chain"
           '[X509Certificate]
           (IO ())
         where
        nodeMethod = Godot.Core.WebSocketServer.set_ca_chain

{-# NOINLINE bindWebSocketServer_set_private_key #-}

bindWebSocketServer_set_private_key :: MethodBind
bindWebSocketServer_set_private_key
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "set_private_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_private_key ::
                  (WebSocketServer :< cls, Object :< cls) =>
                  cls -> CryptoKey -> IO ()
set_private_key cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_set_private_key
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "set_private_key" '[CryptoKey]
           (IO ())
         where
        nodeMethod = Godot.Core.WebSocketServer.set_private_key

{-# NOINLINE bindWebSocketServer_set_ssl_certificate #-}

bindWebSocketServer_set_ssl_certificate :: MethodBind
bindWebSocketServer_set_ssl_certificate
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "set_ssl_certificate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_ssl_certificate ::
                      (WebSocketServer :< cls, Object :< cls) =>
                      cls -> X509Certificate -> IO ()
set_ssl_certificate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_set_ssl_certificate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "set_ssl_certificate"
           '[X509Certificate]
           (IO ())
         where
        nodeMethod = Godot.Core.WebSocketServer.set_ssl_certificate

{-# NOINLINE bindWebSocketServer_stop #-}

bindWebSocketServer_stop :: MethodBind
bindWebSocketServer_stop
  = unsafePerformIO $
      withCString "WebSocketServer" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

stop :: (WebSocketServer :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketServer_stop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebSocketServer "stop" '[] (IO ()) where
        nodeMethod = Godot.Core.WebSocketServer.stop