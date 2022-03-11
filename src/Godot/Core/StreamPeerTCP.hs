{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.StreamPeerTCP
       (Godot.Core.StreamPeerTCP._STATUS_CONNECTED,
        Godot.Core.StreamPeerTCP._STATUS_CONNECTING,
        Godot.Core.StreamPeerTCP._STATUS_ERROR,
        Godot.Core.StreamPeerTCP._STATUS_NONE,
        Godot.Core.StreamPeerTCP.connect_to_host,
        Godot.Core.StreamPeerTCP.disconnect_from_host,
        Godot.Core.StreamPeerTCP.get_connected_host,
        Godot.Core.StreamPeerTCP.get_connected_port,
        Godot.Core.StreamPeerTCP.get_status,
        Godot.Core.StreamPeerTCP.is_connected_to_host,
        Godot.Core.StreamPeerTCP.set_no_delay)
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
import Godot.Core.StreamPeer()

_STATUS_CONNECTED :: Int
_STATUS_CONNECTED = 2

_STATUS_CONNECTING :: Int
_STATUS_CONNECTING = 1

_STATUS_ERROR :: Int
_STATUS_ERROR = 3

_STATUS_NONE :: Int
_STATUS_NONE = 0

{-# NOINLINE bindStreamPeerTCP_connect_to_host #-}

-- | Connects to the specified @host:port@ pair. A hostname will be resolved if valid. Returns @OK@ on success or @FAILED@ on failure.
bindStreamPeerTCP_connect_to_host :: MethodBind
bindStreamPeerTCP_connect_to_host
  = unsafePerformIO $
      withCString "StreamPeerTCP" $
        \ clsNamePtr ->
          withCString "connect_to_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects to the specified @host:port@ pair. A hostname will be resolved if valid. Returns @OK@ on success or @FAILED@ on failure.
connect_to_host ::
                  (StreamPeerTCP :< cls, Object :< cls) =>
                  cls -> GodotString -> Int -> IO Int
connect_to_host cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerTCP_connect_to_host
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeerTCP "connect_to_host"
           '[GodotString, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.StreamPeerTCP.connect_to_host

{-# NOINLINE bindStreamPeerTCP_disconnect_from_host #-}

-- | Disconnects from host.
bindStreamPeerTCP_disconnect_from_host :: MethodBind
bindStreamPeerTCP_disconnect_from_host
  = unsafePerformIO $
      withCString "StreamPeerTCP" $
        \ clsNamePtr ->
          withCString "disconnect_from_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disconnects from host.
disconnect_from_host ::
                       (StreamPeerTCP :< cls, Object :< cls) => cls -> IO ()
disconnect_from_host cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerTCP_disconnect_from_host
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeerTCP "disconnect_from_host" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.StreamPeerTCP.disconnect_from_host

{-# NOINLINE bindStreamPeerTCP_get_connected_host #-}

-- | Returns the IP of this peer.
bindStreamPeerTCP_get_connected_host :: MethodBind
bindStreamPeerTCP_get_connected_host
  = unsafePerformIO $
      withCString "StreamPeerTCP" $
        \ clsNamePtr ->
          withCString "get_connected_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the IP of this peer.
get_connected_host ::
                     (StreamPeerTCP :< cls, Object :< cls) => cls -> IO GodotString
get_connected_host cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerTCP_get_connected_host
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeerTCP "get_connected_host" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.StreamPeerTCP.get_connected_host

{-# NOINLINE bindStreamPeerTCP_get_connected_port #-}

-- | Returns the port of this peer.
bindStreamPeerTCP_get_connected_port :: MethodBind
bindStreamPeerTCP_get_connected_port
  = unsafePerformIO $
      withCString "StreamPeerTCP" $
        \ clsNamePtr ->
          withCString "get_connected_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the port of this peer.
get_connected_port ::
                     (StreamPeerTCP :< cls, Object :< cls) => cls -> IO Int
get_connected_port cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerTCP_get_connected_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeerTCP "get_connected_port" '[] (IO Int)
         where
        nodeMethod = Godot.Core.StreamPeerTCP.get_connected_port

{-# NOINLINE bindStreamPeerTCP_get_status #-}

-- | Returns the status of the connection, see @enum Status@.
bindStreamPeerTCP_get_status :: MethodBind
bindStreamPeerTCP_get_status
  = unsafePerformIO $
      withCString "StreamPeerTCP" $
        \ clsNamePtr ->
          withCString "get_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the status of the connection, see @enum Status@.
get_status ::
             (StreamPeerTCP :< cls, Object :< cls) => cls -> IO Int
get_status cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerTCP_get_status (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeerTCP "get_status" '[] (IO Int) where
        nodeMethod = Godot.Core.StreamPeerTCP.get_status

{-# NOINLINE bindStreamPeerTCP_is_connected_to_host #-}

-- | Returns @true@ if this peer is currently connected or is connecting to a host, @false@ otherwise.
bindStreamPeerTCP_is_connected_to_host :: MethodBind
bindStreamPeerTCP_is_connected_to_host
  = unsafePerformIO $
      withCString "StreamPeerTCP" $
        \ clsNamePtr ->
          withCString "is_connected_to_host" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this peer is currently connected or is connecting to a host, @false@ otherwise.
is_connected_to_host ::
                       (StreamPeerTCP :< cls, Object :< cls) => cls -> IO Bool
is_connected_to_host cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerTCP_is_connected_to_host
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeerTCP "is_connected_to_host" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.StreamPeerTCP.is_connected_to_host

{-# NOINLINE bindStreamPeerTCP_set_no_delay #-}

-- | If @enabled@ is @true@, packets will be sent immediately. If @enabled@ is @false@ (the default), packet transfers will be delayed and combined using @url=https://en.wikipedia.org/wiki/Nagle%27s_algorithm@Nagle's algorithm@/url@.
--   				__Note:__ It's recommended to leave this disabled for applications that send large packets or need to transfer a lot of data, as enabling this can decrease the total available bandwidth.
bindStreamPeerTCP_set_no_delay :: MethodBind
bindStreamPeerTCP_set_no_delay
  = unsafePerformIO $
      withCString "StreamPeerTCP" $
        \ clsNamePtr ->
          withCString "set_no_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @enabled@ is @true@, packets will be sent immediately. If @enabled@ is @false@ (the default), packet transfers will be delayed and combined using @url=https://en.wikipedia.org/wiki/Nagle%27s_algorithm@Nagle's algorithm@/url@.
--   				__Note:__ It's recommended to leave this disabled for applications that send large packets or need to transfer a lot of data, as enabling this can decrease the total available bandwidth.
set_no_delay ::
               (StreamPeerTCP :< cls, Object :< cls) => cls -> Bool -> IO ()
set_no_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamPeerTCP_set_no_delay (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamPeerTCP "set_no_delay" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.StreamPeerTCP.set_no_delay