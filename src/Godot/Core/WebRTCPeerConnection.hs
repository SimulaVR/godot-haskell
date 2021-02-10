{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.WebRTCPeerConnection
       (Godot.Core.WebRTCPeerConnection._STATE_CONNECTED,
        Godot.Core.WebRTCPeerConnection._STATE_CLOSED,
        Godot.Core.WebRTCPeerConnection._STATE_CONNECTING,
        Godot.Core.WebRTCPeerConnection._STATE_DISCONNECTED,
        Godot.Core.WebRTCPeerConnection._STATE_NEW,
        Godot.Core.WebRTCPeerConnection._STATE_FAILED,
        Godot.Core.WebRTCPeerConnection.sig_data_channel_received,
        Godot.Core.WebRTCPeerConnection.sig_ice_candidate_created,
        Godot.Core.WebRTCPeerConnection.sig_session_description_created,
        Godot.Core.WebRTCPeerConnection.add_ice_candidate,
        Godot.Core.WebRTCPeerConnection.close,
        Godot.Core.WebRTCPeerConnection.create_data_channel,
        Godot.Core.WebRTCPeerConnection.create_offer,
        Godot.Core.WebRTCPeerConnection.get_connection_state,
        Godot.Core.WebRTCPeerConnection.initialize,
        Godot.Core.WebRTCPeerConnection.poll,
        Godot.Core.WebRTCPeerConnection.set_local_description,
        Godot.Core.WebRTCPeerConnection.set_remote_description)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_STATE_CONNECTED :: Int
_STATE_CONNECTED = 2

_STATE_CLOSED :: Int
_STATE_CLOSED = 5

_STATE_CONNECTING :: Int
_STATE_CONNECTING = 1

_STATE_DISCONNECTED :: Int
_STATE_DISCONNECTED = 3

_STATE_NEW :: Int
_STATE_NEW = 0

_STATE_FAILED :: Int
_STATE_FAILED = 4

sig_data_channel_received ::
                          Godot.Internal.Dispatch.Signal WebRTCPeerConnection
sig_data_channel_received
  = Godot.Internal.Dispatch.Signal "data_channel_received"

instance NodeSignal WebRTCPeerConnection "data_channel_received"
           '[Object]

sig_ice_candidate_created ::
                          Godot.Internal.Dispatch.Signal WebRTCPeerConnection
sig_ice_candidate_created
  = Godot.Internal.Dispatch.Signal "ice_candidate_created"

instance NodeSignal WebRTCPeerConnection "ice_candidate_created"
           '[GodotString, Int, GodotString]

sig_session_description_created ::
                                Godot.Internal.Dispatch.Signal WebRTCPeerConnection
sig_session_description_created
  = Godot.Internal.Dispatch.Signal "session_description_created"

instance NodeSignal WebRTCPeerConnection
           "session_description_created"
           '[GodotString, GodotString]

{-# NOINLINE bindWebRTCPeerConnection_add_ice_candidate #-}

bindWebRTCPeerConnection_add_ice_candidate :: MethodBind
bindWebRTCPeerConnection_add_ice_candidate
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "add_ice_candidate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_ice_candidate ::
                    (WebRTCPeerConnection :< cls, Object :< cls) =>
                    cls -> GodotString -> Int -> GodotString -> IO Int
add_ice_candidate cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCPeerConnection_add_ice_candidate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCPeerConnection_close #-}

bindWebRTCPeerConnection_close :: MethodBind
bindWebRTCPeerConnection_close
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

close ::
        (WebRTCPeerConnection :< cls, Object :< cls) => cls -> IO ()
close cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCPeerConnection_close (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCPeerConnection_create_data_channel #-}

bindWebRTCPeerConnection_create_data_channel :: MethodBind
bindWebRTCPeerConnection_create_data_channel
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "create_data_channel" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create_data_channel ::
                      (WebRTCPeerConnection :< cls, Object :< cls) =>
                      cls -> GodotString -> Dictionary -> IO WebRTCDataChannel
create_data_channel cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCPeerConnection_create_data_channel
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCPeerConnection_create_offer #-}

bindWebRTCPeerConnection_create_offer :: MethodBind
bindWebRTCPeerConnection_create_offer
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "create_offer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

create_offer ::
               (WebRTCPeerConnection :< cls, Object :< cls) => cls -> IO Int
create_offer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCPeerConnection_create_offer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCPeerConnection_get_connection_state #-}

bindWebRTCPeerConnection_get_connection_state :: MethodBind
bindWebRTCPeerConnection_get_connection_state
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "get_connection_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_connection_state ::
                       (WebRTCPeerConnection :< cls, Object :< cls) => cls -> IO Int
get_connection_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindWebRTCPeerConnection_get_connection_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCPeerConnection_initialize #-}

bindWebRTCPeerConnection_initialize :: MethodBind
bindWebRTCPeerConnection_initialize
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

initialize ::
             (WebRTCPeerConnection :< cls, Object :< cls) =>
             cls -> Dictionary -> IO Int
initialize cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCPeerConnection_initialize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCPeerConnection_poll #-}

bindWebRTCPeerConnection_poll :: MethodBind
bindWebRTCPeerConnection_poll
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

poll ::
       (WebRTCPeerConnection :< cls, Object :< cls) => cls -> IO Int
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCPeerConnection_poll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCPeerConnection_set_local_description #-}

bindWebRTCPeerConnection_set_local_description :: MethodBind
bindWebRTCPeerConnection_set_local_description
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "set_local_description" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_local_description ::
                        (WebRTCPeerConnection :< cls, Object :< cls) =>
                        cls -> GodotString -> GodotString -> IO Int
set_local_description cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindWebRTCPeerConnection_set_local_description
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCPeerConnection_set_remote_description #-}

bindWebRTCPeerConnection_set_remote_description :: MethodBind
bindWebRTCPeerConnection_set_remote_description
  = unsafePerformIO $
      withCString "WebRTCPeerConnection" $
        \ clsNamePtr ->
          withCString "set_remote_description" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_remote_description ::
                         (WebRTCPeerConnection :< cls, Object :< cls) =>
                         cls -> GodotString -> GodotString -> IO Int
set_remote_description cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindWebRTCPeerConnection_set_remote_description
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)