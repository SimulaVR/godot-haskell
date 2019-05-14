{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.WebSocketMultiplayerPeer
       (Godot.Core.WebSocketMultiplayerPeer.sig_peer_packet,
        Godot.Core.WebSocketMultiplayerPeer.get_peer)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

sig_peer_packet ::
                Godot.Internal.Dispatch.Signal WebSocketMultiplayerPeer
sig_peer_packet = Godot.Internal.Dispatch.Signal "peer_packet"

{-# NOINLINE bindWebSocketMultiplayerPeer_get_peer #-}

bindWebSocketMultiplayerPeer_get_peer :: MethodBind
bindWebSocketMultiplayerPeer_get_peer
  = unsafePerformIO $
      withCString "WebSocketMultiplayerPeer" $
        \ clsNamePtr ->
          withCString "get_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peer ::
           (WebSocketMultiplayerPeer :< cls, Object :< cls) =>
           cls -> Int -> IO WebSocketPeer
get_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebSocketMultiplayerPeer_get_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)