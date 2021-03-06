{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PacketPeer
       (Godot.Core.PacketPeer.get_available_packet_count,
        Godot.Core.PacketPeer.get_encode_buffer_max_size,
        Godot.Core.PacketPeer.get_packet,
        Godot.Core.PacketPeer.get_packet_error,
        Godot.Core.PacketPeer.get_var,
        Godot.Core.PacketPeer.is_object_decoding_allowed,
        Godot.Core.PacketPeer.put_packet, Godot.Core.PacketPeer.put_var,
        Godot.Core.PacketPeer.set_allow_object_decoding,
        Godot.Core.PacketPeer.set_encode_buffer_max_size)
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
import Godot.Core.Reference()

instance NodeProperty PacketPeer "allow_object_decoding" Bool
           'False
         where
        nodeProperty
          = (is_object_decoding_allowed,
             wrapDroppingSetter set_allow_object_decoding, Nothing)

instance NodeProperty PacketPeer "encode_buffer_max_size" Int
           'False
         where
        nodeProperty
          = (get_encode_buffer_max_size,
             wrapDroppingSetter set_encode_buffer_max_size, Nothing)

{-# NOINLINE bindPacketPeer_get_available_packet_count #-}

-- | Returns the number of packets currently available in the ring-buffer.
bindPacketPeer_get_available_packet_count :: MethodBind
bindPacketPeer_get_available_packet_count
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_available_packet_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of packets currently available in the ring-buffer.
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

instance NodeMethod PacketPeer "get_available_packet_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeer.get_available_packet_count

{-# NOINLINE bindPacketPeer_get_encode_buffer_max_size #-}

-- | Maximum buffer size allowed when encoding @Variant@s. Raise this value to support heavier memory allocations.
--   			The @method put_var@ method allocates memory on the stack, and the buffer used will grow automatically to the closest power of two to match the size of the @Variant@. If the @Variant@ is bigger than @encode_buffer_max_size@, the method will error out with @ERR_OUT_OF_MEMORY@.
bindPacketPeer_get_encode_buffer_max_size :: MethodBind
bindPacketPeer_get_encode_buffer_max_size
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_encode_buffer_max_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum buffer size allowed when encoding @Variant@s. Raise this value to support heavier memory allocations.
--   			The @method put_var@ method allocates memory on the stack, and the buffer used will grow automatically to the closest power of two to match the size of the @Variant@. If the @Variant@ is bigger than @encode_buffer_max_size@, the method will error out with @ERR_OUT_OF_MEMORY@.
get_encode_buffer_max_size ::
                             (PacketPeer :< cls, Object :< cls) => cls -> IO Int
get_encode_buffer_max_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_get_encode_buffer_max_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeer "get_encode_buffer_max_size" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeer.get_encode_buffer_max_size

{-# NOINLINE bindPacketPeer_get_packet #-}

-- | Gets a raw packet.
bindPacketPeer_get_packet :: MethodBind
bindPacketPeer_get_packet
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_packet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a raw packet.
get_packet ::
             (PacketPeer :< cls, Object :< cls) => cls -> IO PoolByteArray
get_packet cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_get_packet (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeer "get_packet" '[] (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.PacketPeer.get_packet

{-# NOINLINE bindPacketPeer_get_packet_error #-}

-- | Returns the error state of the last packet received (via @method get_packet@ and @method get_var@).
bindPacketPeer_get_packet_error :: MethodBind
bindPacketPeer_get_packet_error
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_packet_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the error state of the last packet received (via @method get_packet@ and @method get_var@).
get_packet_error ::
                   (PacketPeer :< cls, Object :< cls) => cls -> IO Int
get_packet_error cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_get_packet_error (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeer "get_packet_error" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeer.get_packet_error

{-# NOINLINE bindPacketPeer_get_var #-}

-- | Gets a Variant. If @allow_objects@ (or @allow_object_decoding@) is @true@, decoding objects is allowed.
--   				__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
bindPacketPeer_get_var :: MethodBind
bindPacketPeer_get_var
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "get_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a Variant. If @allow_objects@ (or @allow_object_decoding@) is @true@, decoding objects is allowed.
--   				__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
get_var ::
          (PacketPeer :< cls, Object :< cls) =>
          cls -> Maybe Bool -> IO GodotVariant
get_var cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_get_var (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeer "get_var" '[Maybe Bool]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.PacketPeer.get_var

{-# NOINLINE bindPacketPeer_is_object_decoding_allowed #-}

-- | @i@Deprecated.@/i@ Use @get_var@ and @put_var@ parameters instead.
--   			If @true@, the PacketPeer will allow encoding and decoding of object via @method get_var@ and @method put_var@.
--   			__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
bindPacketPeer_is_object_decoding_allowed :: MethodBind
bindPacketPeer_is_object_decoding_allowed
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "is_object_decoding_allowed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @i@Deprecated.@/i@ Use @get_var@ and @put_var@ parameters instead.
--   			If @true@, the PacketPeer will allow encoding and decoding of object via @method get_var@ and @method put_var@.
--   			__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
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

instance NodeMethod PacketPeer "is_object_decoding_allowed" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.PacketPeer.is_object_decoding_allowed

{-# NOINLINE bindPacketPeer_put_packet #-}

-- | Sends a raw packet.
bindPacketPeer_put_packet :: MethodBind
bindPacketPeer_put_packet
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "put_packet" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a raw packet.
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

instance NodeMethod PacketPeer "put_packet" '[PoolByteArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeer.put_packet

{-# NOINLINE bindPacketPeer_put_var #-}

-- | Sends a @Variant@ as a packet. If @full_objects@ (or @allow_object_decoding@) is @true@, encoding objects is allowed (and can potentially include code).
bindPacketPeer_put_var :: MethodBind
bindPacketPeer_put_var
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "put_var" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sends a @Variant@ as a packet. If @full_objects@ (or @allow_object_decoding@) is @true@, encoding objects is allowed (and can potentially include code).
put_var ::
          (PacketPeer :< cls, Object :< cls) =>
          cls -> GodotVariant -> Maybe Bool -> IO Int
put_var cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_put_var (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeer "put_var"
           '[GodotVariant, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.PacketPeer.put_var

{-# NOINLINE bindPacketPeer_set_allow_object_decoding #-}

-- | @i@Deprecated.@/i@ Use @get_var@ and @put_var@ parameters instead.
--   			If @true@, the PacketPeer will allow encoding and decoding of object via @method get_var@ and @method put_var@.
--   			__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
bindPacketPeer_set_allow_object_decoding :: MethodBind
bindPacketPeer_set_allow_object_decoding
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "set_allow_object_decoding" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @i@Deprecated.@/i@ Use @get_var@ and @put_var@ parameters instead.
--   			If @true@, the PacketPeer will allow encoding and decoding of object via @method get_var@ and @method put_var@.
--   			__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
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

instance NodeMethod PacketPeer "set_allow_object_decoding" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.PacketPeer.set_allow_object_decoding

{-# NOINLINE bindPacketPeer_set_encode_buffer_max_size #-}

-- | Maximum buffer size allowed when encoding @Variant@s. Raise this value to support heavier memory allocations.
--   			The @method put_var@ method allocates memory on the stack, and the buffer used will grow automatically to the closest power of two to match the size of the @Variant@. If the @Variant@ is bigger than @encode_buffer_max_size@, the method will error out with @ERR_OUT_OF_MEMORY@.
bindPacketPeer_set_encode_buffer_max_size :: MethodBind
bindPacketPeer_set_encode_buffer_max_size
  = unsafePerformIO $
      withCString "PacketPeer" $
        \ clsNamePtr ->
          withCString "set_encode_buffer_max_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum buffer size allowed when encoding @Variant@s. Raise this value to support heavier memory allocations.
--   			The @method put_var@ method allocates memory on the stack, and the buffer used will grow automatically to the closest power of two to match the size of the @Variant@. If the @Variant@ is bigger than @encode_buffer_max_size@, the method will error out with @ERR_OUT_OF_MEMORY@.
set_encode_buffer_max_size ::
                             (PacketPeer :< cls, Object :< cls) => cls -> Int -> IO ()
set_encode_buffer_max_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPacketPeer_set_encode_buffer_max_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PacketPeer "set_encode_buffer_max_size" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.PacketPeer.set_encode_buffer_max_size