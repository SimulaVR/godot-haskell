{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PacketPeer
       (Godot.Core.PacketPeer.get_var, Godot.Core.PacketPeer.put_var,
        Godot.Core.PacketPeer.get_packet, Godot.Core.PacketPeer.put_packet,
        Godot.Core.PacketPeer.get_packet_error,
        Godot.Core.PacketPeer.get_available_packet_count,
        Godot.Core.PacketPeer.set_allow_object_decoding,
        Godot.Core.PacketPeer.is_object_decoding_allowed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPacketPeer_get_var #-}

-- | Get a Variant. When [code]allow_objects[/code] (or [member allow_object_decoding]) is [code]true[/code] decoding objects is allowed.
--   				[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
bindPacketPeer_get_var :: MethodBind
bindPacketPeer_get_var
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a Variant. When [code]allow_objects[/code] (or [member allow_object_decoding]) is [code]true[/code] decoding objects is allowed.
--   				[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
get_var ::
          (PacketPeer :< cls, Object :< cls) => cls -> IO GodotVariant
get_var cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_get_var (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeer_put_var #-}

-- | Send a Variant as a packet. When [code]full_objects[/code] (or [member allow_object_decoding]) is [code]true[/code] encoding objects is allowed (and can potentially include code).
bindPacketPeer_put_var :: MethodBind
bindPacketPeer_put_var
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "put_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Send a Variant as a packet. When [code]full_objects[/code] (or [member allow_object_decoding]) is [code]true[/code] encoding objects is allowed (and can potentially include code).
put_var ::
          (PacketPeer :< cls, Object :< cls) => cls -> GodotVariant -> IO Int
put_var cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_put_var (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeer_get_packet #-}

-- | Get a raw packet.
bindPacketPeer_get_packet :: MethodBind
bindPacketPeer_get_packet
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_packet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a raw packet.
get_packet ::
             (PacketPeer :< cls, Object :< cls) => cls -> IO PoolByteArray
get_packet cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_get_packet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeer_put_packet #-}

-- | Send a raw packet.
bindPacketPeer_put_packet :: MethodBind
bindPacketPeer_put_packet
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "put_packet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Send a raw packet.
put_packet ::
             (PacketPeer :< cls, Object :< cls) =>
             cls -> PoolByteArray -> IO Int
put_packet cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_put_packet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeer_get_packet_error #-}

-- | Return the error state of the last packet received (via [method get_packet] and [method get_var]).
bindPacketPeer_get_packet_error :: MethodBind
bindPacketPeer_get_packet_error
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_packet_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the error state of the last packet received (via [method get_packet] and [method get_var]).
get_packet_error ::
                   (PacketPeer :< cls, Object :< cls) => cls -> IO Int
get_packet_error cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_get_packet_error (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeer_get_available_packet_count #-}

-- | Return the number of packets currently available in the ring-buffer.
bindPacketPeer_get_available_packet_count :: MethodBind
bindPacketPeer_get_available_packet_count
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_available_packet_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the number of packets currently available in the ring-buffer.
get_available_packet_count ::
                             (PacketPeer :< cls, Object :< cls) => cls -> IO Int
get_available_packet_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_get_available_packet_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeer_set_allow_object_decoding #-}

-- | Deprecated. Use [code]get_var[/code] and [code]put_var[/code] parameters instead.
--   			If [code]true[/code] the PacketPeer will allow encoding and decoding of object via [method get_var] and [method put_var].
--   			[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
bindPacketPeer_set_allow_object_decoding :: MethodBind
bindPacketPeer_set_allow_object_decoding
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "set_allow_object_decoding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deprecated. Use [code]get_var[/code] and [code]put_var[/code] parameters instead.
--   			If [code]true[/code] the PacketPeer will allow encoding and decoding of object via [method get_var] and [method put_var].
--   			[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
set_allow_object_decoding ::
                            (PacketPeer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_object_decoding cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_set_allow_object_decoding
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPacketPeer_is_object_decoding_allowed #-}

-- | Deprecated. Use [code]get_var[/code] and [code]put_var[/code] parameters instead.
--   			If [code]true[/code] the PacketPeer will allow encoding and decoding of object via [method get_var] and [method put_var].
--   			[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
bindPacketPeer_is_object_decoding_allowed :: MethodBind
bindPacketPeer_is_object_decoding_allowed
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "is_object_decoding_allowed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deprecated. Use [code]get_var[/code] and [code]put_var[/code] parameters instead.
--   			If [code]true[/code] the PacketPeer will allow encoding and decoding of object via [method get_var] and [method put_var].
--   			[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
is_object_decoding_allowed ::
                             (PacketPeer :< cls, Object :< cls) => cls -> IO Bool
is_object_decoding_allowed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_is_object_decoding_allowed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)