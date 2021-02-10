{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.UPNP
       (Godot.Core.UPNP._UPNP_RESULT_NO_SUCH_ENTRY_IN_ARRAY,
        Godot.Core.UPNP._UPNP_RESULT_NO_DEVICES,
        Godot.Core.UPNP._UPNP_RESULT_EXT_PORT_WILDCARD_NOT_PERMITTED,
        Godot.Core.UPNP._UPNP_RESULT_SAME_PORT_VALUES_REQUIRED,
        Godot.Core.UPNP._UPNP_RESULT_MEM_ALLOC_ERROR,
        Godot.Core.UPNP._UPNP_RESULT_INVALID_PROTOCOL,
        Godot.Core.UPNP._UPNP_RESULT_HTTP_ERROR,
        Godot.Core.UPNP._UPNP_RESULT_INT_PORT_WILDCARD_NOT_PERMITTED,
        Godot.Core.UPNP._UPNP_RESULT_INVALID_PORT,
        Godot.Core.UPNP._UPNP_RESULT_ACTION_FAILED,
        Godot.Core.UPNP._UPNP_RESULT_PORT_MAPPING_NOT_FOUND,
        Godot.Core.UPNP._UPNP_RESULT_INVALID_PARAM,
        Godot.Core.UPNP._UPNP_RESULT_REMOTE_HOST_MUST_BE_WILDCARD,
        Godot.Core.UPNP._UPNP_RESULT_SRC_IP_WILDCARD_NOT_PERMITTED,
        Godot.Core.UPNP._UPNP_RESULT_NO_GATEWAY,
        Godot.Core.UPNP._UPNP_RESULT_INVALID_GATEWAY,
        Godot.Core.UPNP._UPNP_RESULT_NOT_AUTHORIZED,
        Godot.Core.UPNP._UPNP_RESULT_INVALID_RESPONSE,
        Godot.Core.UPNP._UPNP_RESULT_INVALID_DURATION,
        Godot.Core.UPNP._UPNP_RESULT_UNKNOWN_ERROR,
        Godot.Core.UPNP._UPNP_RESULT_INCONSISTENT_PARAMETERS,
        Godot.Core.UPNP._UPNP_RESULT_EXT_PORT_MUST_BE_WILDCARD,
        Godot.Core.UPNP._UPNP_RESULT_SOCKET_ERROR,
        Godot.Core.UPNP._UPNP_RESULT_NO_PORT_MAPS_AVAILABLE,
        Godot.Core.UPNP._UPNP_RESULT_ONLY_PERMANENT_LEASE_SUPPORTED,
        Godot.Core.UPNP._UPNP_RESULT_INVALID_ARGS,
        Godot.Core.UPNP._UPNP_RESULT_CONFLICT_WITH_OTHER_MECHANISM,
        Godot.Core.UPNP._UPNP_RESULT_SUCCESS,
        Godot.Core.UPNP._UPNP_RESULT_CONFLICT_WITH_OTHER_MAPPING,
        Godot.Core.UPNP.add_device, Godot.Core.UPNP.add_port_mapping,
        Godot.Core.UPNP.clear_devices, Godot.Core.UPNP.delete_port_mapping,
        Godot.Core.UPNP.discover, Godot.Core.UPNP.get_device,
        Godot.Core.UPNP.get_device_count,
        Godot.Core.UPNP.get_discover_local_port,
        Godot.Core.UPNP.get_discover_multicast_if,
        Godot.Core.UPNP.get_gateway, Godot.Core.UPNP.is_discover_ipv6,
        Godot.Core.UPNP.query_external_address,
        Godot.Core.UPNP.remove_device, Godot.Core.UPNP.set_device,
        Godot.Core.UPNP.set_discover_ipv6,
        Godot.Core.UPNP.set_discover_local_port,
        Godot.Core.UPNP.set_discover_multicast_if)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_UPNP_RESULT_NO_SUCH_ENTRY_IN_ARRAY :: Int
_UPNP_RESULT_NO_SUCH_ENTRY_IN_ARRAY = 4

_UPNP_RESULT_NO_DEVICES :: Int
_UPNP_RESULT_NO_DEVICES = 27

_UPNP_RESULT_EXT_PORT_WILDCARD_NOT_PERMITTED :: Int
_UPNP_RESULT_EXT_PORT_WILDCARD_NOT_PERMITTED = 7

_UPNP_RESULT_SAME_PORT_VALUES_REQUIRED :: Int
_UPNP_RESULT_SAME_PORT_VALUES_REQUIRED = 14

_UPNP_RESULT_MEM_ALLOC_ERROR :: Int
_UPNP_RESULT_MEM_ALLOC_ERROR = 25

_UPNP_RESULT_INVALID_PROTOCOL :: Int
_UPNP_RESULT_INVALID_PROTOCOL = 18

_UPNP_RESULT_HTTP_ERROR :: Int
_UPNP_RESULT_HTTP_ERROR = 23

_UPNP_RESULT_INT_PORT_WILDCARD_NOT_PERMITTED :: Int
_UPNP_RESULT_INT_PORT_WILDCARD_NOT_PERMITTED = 8

_UPNP_RESULT_INVALID_PORT :: Int
_UPNP_RESULT_INVALID_PORT = 17

_UPNP_RESULT_ACTION_FAILED :: Int
_UPNP_RESULT_ACTION_FAILED = 5

_UPNP_RESULT_PORT_MAPPING_NOT_FOUND :: Int
_UPNP_RESULT_PORT_MAPPING_NOT_FOUND = 2

_UPNP_RESULT_INVALID_PARAM :: Int
_UPNP_RESULT_INVALID_PARAM = 22

_UPNP_RESULT_REMOTE_HOST_MUST_BE_WILDCARD :: Int
_UPNP_RESULT_REMOTE_HOST_MUST_BE_WILDCARD = 9

_UPNP_RESULT_SRC_IP_WILDCARD_NOT_PERMITTED :: Int
_UPNP_RESULT_SRC_IP_WILDCARD_NOT_PERMITTED = 6

_UPNP_RESULT_NO_GATEWAY :: Int
_UPNP_RESULT_NO_GATEWAY = 26

_UPNP_RESULT_INVALID_GATEWAY :: Int
_UPNP_RESULT_INVALID_GATEWAY = 16

_UPNP_RESULT_NOT_AUTHORIZED :: Int
_UPNP_RESULT_NOT_AUTHORIZED = 1

_UPNP_RESULT_INVALID_RESPONSE :: Int
_UPNP_RESULT_INVALID_RESPONSE = 21

_UPNP_RESULT_INVALID_DURATION :: Int
_UPNP_RESULT_INVALID_DURATION = 19

_UPNP_RESULT_UNKNOWN_ERROR :: Int
_UPNP_RESULT_UNKNOWN_ERROR = 28

_UPNP_RESULT_INCONSISTENT_PARAMETERS :: Int
_UPNP_RESULT_INCONSISTENT_PARAMETERS = 3

_UPNP_RESULT_EXT_PORT_MUST_BE_WILDCARD :: Int
_UPNP_RESULT_EXT_PORT_MUST_BE_WILDCARD = 10

_UPNP_RESULT_SOCKET_ERROR :: Int
_UPNP_RESULT_SOCKET_ERROR = 24

_UPNP_RESULT_NO_PORT_MAPS_AVAILABLE :: Int
_UPNP_RESULT_NO_PORT_MAPS_AVAILABLE = 11

_UPNP_RESULT_ONLY_PERMANENT_LEASE_SUPPORTED :: Int
_UPNP_RESULT_ONLY_PERMANENT_LEASE_SUPPORTED = 15

_UPNP_RESULT_INVALID_ARGS :: Int
_UPNP_RESULT_INVALID_ARGS = 20

_UPNP_RESULT_CONFLICT_WITH_OTHER_MECHANISM :: Int
_UPNP_RESULT_CONFLICT_WITH_OTHER_MECHANISM = 12

_UPNP_RESULT_SUCCESS :: Int
_UPNP_RESULT_SUCCESS = 0

_UPNP_RESULT_CONFLICT_WITH_OTHER_MAPPING :: Int
_UPNP_RESULT_CONFLICT_WITH_OTHER_MAPPING = 13

{-# NOINLINE bindUPNP_add_device #-}

bindUPNP_add_device :: MethodBind
bindUPNP_add_device
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "add_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_device ::
             (UPNP :< cls, Object :< cls) => cls -> UPNPDevice -> IO ()
add_device cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_add_device (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_add_port_mapping #-}

bindUPNP_add_port_mapping :: MethodBind
bindUPNP_add_port_mapping
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "add_port_mapping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_port_mapping ::
                   (UPNP :< cls, Object :< cls) =>
                   cls -> Int -> Int -> GodotString -> GodotString -> Int -> IO Int
add_port_mapping cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_add_port_mapping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_clear_devices #-}

bindUPNP_clear_devices :: MethodBind
bindUPNP_clear_devices
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "clear_devices" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_devices :: (UPNP :< cls, Object :< cls) => cls -> IO ()
clear_devices cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_clear_devices (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_delete_port_mapping #-}

bindUPNP_delete_port_mapping :: MethodBind
bindUPNP_delete_port_mapping
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "delete_port_mapping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

delete_port_mapping ::
                      (UPNP :< cls, Object :< cls) => cls -> Int -> GodotString -> IO Int
delete_port_mapping cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_delete_port_mapping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_discover #-}

bindUPNP_discover :: MethodBind
bindUPNP_discover
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "discover" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

discover ::
           (UPNP :< cls, Object :< cls) =>
           cls -> Int -> Int -> GodotString -> IO Int
discover cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_discover (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_get_device #-}

bindUPNP_get_device :: MethodBind
bindUPNP_get_device
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "get_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_device ::
             (UPNP :< cls, Object :< cls) => cls -> Int -> IO UPNPDevice
get_device cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_get_device (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_get_device_count #-}

bindUPNP_get_device_count :: MethodBind
bindUPNP_get_device_count
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "get_device_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_device_count :: (UPNP :< cls, Object :< cls) => cls -> IO Int
get_device_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_get_device_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_get_discover_local_port #-}

bindUPNP_get_discover_local_port :: MethodBind
bindUPNP_get_discover_local_port
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "get_discover_local_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_discover_local_port ::
                          (UPNP :< cls, Object :< cls) => cls -> IO Int
get_discover_local_port cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_get_discover_local_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_get_discover_multicast_if #-}

bindUPNP_get_discover_multicast_if :: MethodBind
bindUPNP_get_discover_multicast_if
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "get_discover_multicast_if" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_discover_multicast_if ::
                            (UPNP :< cls, Object :< cls) => cls -> IO GodotString
get_discover_multicast_if cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_get_discover_multicast_if
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_get_gateway #-}

bindUPNP_get_gateway :: MethodBind
bindUPNP_get_gateway
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "get_gateway" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_gateway :: (UPNP :< cls, Object :< cls) => cls -> IO UPNPDevice
get_gateway cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_get_gateway (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_is_discover_ipv6 #-}

bindUPNP_is_discover_ipv6 :: MethodBind
bindUPNP_is_discover_ipv6
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "is_discover_ipv6" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_discover_ipv6 :: (UPNP :< cls, Object :< cls) => cls -> IO Bool
is_discover_ipv6 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_is_discover_ipv6 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_query_external_address #-}

bindUPNP_query_external_address :: MethodBind
bindUPNP_query_external_address
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "query_external_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

query_external_address ::
                         (UPNP :< cls, Object :< cls) => cls -> IO GodotString
query_external_address cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_query_external_address (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_remove_device #-}

bindUPNP_remove_device :: MethodBind
bindUPNP_remove_device
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "remove_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_device ::
                (UPNP :< cls, Object :< cls) => cls -> Int -> IO ()
remove_device cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_remove_device (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_set_device #-}

bindUPNP_set_device :: MethodBind
bindUPNP_set_device
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "set_device" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_device ::
             (UPNP :< cls, Object :< cls) => cls -> Int -> UPNPDevice -> IO ()
set_device cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_set_device (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_set_discover_ipv6 #-}

bindUPNP_set_discover_ipv6 :: MethodBind
bindUPNP_set_discover_ipv6
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "set_discover_ipv6" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_discover_ipv6 ::
                    (UPNP :< cls, Object :< cls) => cls -> Bool -> IO ()
set_discover_ipv6 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_set_discover_ipv6 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_set_discover_local_port #-}

bindUPNP_set_discover_local_port :: MethodBind
bindUPNP_set_discover_local_port
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "set_discover_local_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_discover_local_port ::
                          (UPNP :< cls, Object :< cls) => cls -> Int -> IO ()
set_discover_local_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_set_discover_local_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNP_set_discover_multicast_if #-}

bindUPNP_set_discover_multicast_if :: MethodBind
bindUPNP_set_discover_multicast_if
  = unsafePerformIO $
      withCString "UPNP" $
        \ clsNamePtr ->
          withCString "set_discover_multicast_if" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_discover_multicast_if ::
                            (UPNP :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_discover_multicast_if cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNP_set_discover_multicast_if
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)