{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.WebRTCDataChannel
       (Godot.Core.WebRTCDataChannel._STATE_CLOSED,
        Godot.Core.WebRTCDataChannel._WRITE_MODE_TEXT,
        Godot.Core.WebRTCDataChannel._STATE_CLOSING,
        Godot.Core.WebRTCDataChannel._STATE_CONNECTING,
        Godot.Core.WebRTCDataChannel._STATE_OPEN,
        Godot.Core.WebRTCDataChannel._WRITE_MODE_BINARY,
        Godot.Core.WebRTCDataChannel.close,
        Godot.Core.WebRTCDataChannel.get_id,
        Godot.Core.WebRTCDataChannel.get_label,
        Godot.Core.WebRTCDataChannel.get_max_packet_life_time,
        Godot.Core.WebRTCDataChannel.get_max_retransmits,
        Godot.Core.WebRTCDataChannel.get_protocol,
        Godot.Core.WebRTCDataChannel.get_ready_state,
        Godot.Core.WebRTCDataChannel.get_write_mode,
        Godot.Core.WebRTCDataChannel.is_negotiated,
        Godot.Core.WebRTCDataChannel.is_ordered,
        Godot.Core.WebRTCDataChannel.poll,
        Godot.Core.WebRTCDataChannel.set_write_mode,
        Godot.Core.WebRTCDataChannel.was_string_packet)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_STATE_CLOSED :: Int
_STATE_CLOSED = 3

_WRITE_MODE_TEXT :: Int
_WRITE_MODE_TEXT = 0

_STATE_CLOSING :: Int
_STATE_CLOSING = 2

_STATE_CONNECTING :: Int
_STATE_CONNECTING = 0

_STATE_OPEN :: Int
_STATE_OPEN = 1

_WRITE_MODE_BINARY :: Int
_WRITE_MODE_BINARY = 1

{-# NOINLINE bindWebRTCDataChannel_close #-}

bindWebRTCDataChannel_close :: MethodBind
bindWebRTCDataChannel_close
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

close :: (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO ()
close cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_close (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_get_id #-}

bindWebRTCDataChannel_get_id :: MethodBind
bindWebRTCDataChannel_get_id
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "get_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_id ::
         (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Int
get_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_get_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_get_label #-}

bindWebRTCDataChannel_get_label :: MethodBind
bindWebRTCDataChannel_get_label
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "get_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_label ::
            (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO GodotString
get_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_get_label (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_get_max_packet_life_time #-}

bindWebRTCDataChannel_get_max_packet_life_time :: MethodBind
bindWebRTCDataChannel_get_max_packet_life_time
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "get_max_packet_life_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max_packet_life_time ::
                           (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Int
get_max_packet_life_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindWebRTCDataChannel_get_max_packet_life_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_get_max_retransmits #-}

bindWebRTCDataChannel_get_max_retransmits :: MethodBind
bindWebRTCDataChannel_get_max_retransmits
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "get_max_retransmits" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_max_retransmits ::
                      (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Int
get_max_retransmits cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_get_max_retransmits
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_get_protocol #-}

bindWebRTCDataChannel_get_protocol :: MethodBind
bindWebRTCDataChannel_get_protocol
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "get_protocol" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_protocol ::
               (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO GodotString
get_protocol cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_get_protocol
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_get_ready_state #-}

bindWebRTCDataChannel_get_ready_state :: MethodBind
bindWebRTCDataChannel_get_ready_state
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "get_ready_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_ready_state ::
                  (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Int
get_ready_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_get_ready_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_get_write_mode #-}

bindWebRTCDataChannel_get_write_mode :: MethodBind
bindWebRTCDataChannel_get_write_mode
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "get_write_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_write_mode ::
                 (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Int
get_write_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_get_write_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_is_negotiated #-}

bindWebRTCDataChannel_is_negotiated :: MethodBind
bindWebRTCDataChannel_is_negotiated
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "is_negotiated" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_negotiated ::
                (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Bool
is_negotiated cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_is_negotiated
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_is_ordered #-}

bindWebRTCDataChannel_is_ordered :: MethodBind
bindWebRTCDataChannel_is_ordered
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "is_ordered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_ordered ::
             (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Bool
is_ordered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_is_ordered
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_poll #-}

bindWebRTCDataChannel_poll :: MethodBind
bindWebRTCDataChannel_poll
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

poll :: (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Int
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_poll (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_set_write_mode #-}

bindWebRTCDataChannel_set_write_mode :: MethodBind
bindWebRTCDataChannel_set_write_mode
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "set_write_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_write_mode ::
                 (WebRTCDataChannel :< cls, Object :< cls) => cls -> Int -> IO ()
set_write_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_set_write_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWebRTCDataChannel_was_string_packet #-}

bindWebRTCDataChannel_was_string_packet :: MethodBind
bindWebRTCDataChannel_was_string_packet
  = unsafePerformIO $
      withCString "WebRTCDataChannel" $
        \ clsNamePtr ->
          withCString "was_string_packet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

was_string_packet ::
                    (WebRTCDataChannel :< cls, Object :< cls) => cls -> IO Bool
was_string_packet cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCDataChannel_was_string_packet
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)