{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.UPNPDevice
       (Godot.Core.UPNPDevice._IGD_STATUS_INVALID_CONTROL,
        Godot.Core.UPNPDevice._IGD_STATUS_DISCONNECTED,
        Godot.Core.UPNPDevice._IGD_STATUS_OK,
        Godot.Core.UPNPDevice._IGD_STATUS_NO_URLS,
        Godot.Core.UPNPDevice._IGD_STATUS_MALLOC_ERROR,
        Godot.Core.UPNPDevice._IGD_STATUS_UNKNOWN_ERROR,
        Godot.Core.UPNPDevice._IGD_STATUS_HTTP_EMPTY,
        Godot.Core.UPNPDevice._IGD_STATUS_NO_IGD,
        Godot.Core.UPNPDevice._IGD_STATUS_UNKNOWN_DEVICE,
        Godot.Core.UPNPDevice._IGD_STATUS_HTTP_ERROR,
        Godot.Core.UPNPDevice.is_valid_gateway,
        Godot.Core.UPNPDevice.query_external_address,
        Godot.Core.UPNPDevice.add_port_mapping,
        Godot.Core.UPNPDevice.delete_port_mapping,
        Godot.Core.UPNPDevice.set_description_url,
        Godot.Core.UPNPDevice.get_description_url,
        Godot.Core.UPNPDevice.set_service_type,
        Godot.Core.UPNPDevice.get_service_type,
        Godot.Core.UPNPDevice.set_igd_control_url,
        Godot.Core.UPNPDevice.get_igd_control_url,
        Godot.Core.UPNPDevice.set_igd_service_type,
        Godot.Core.UPNPDevice.get_igd_service_type,
        Godot.Core.UPNPDevice.set_igd_our_addr,
        Godot.Core.UPNPDevice.get_igd_our_addr,
        Godot.Core.UPNPDevice.set_igd_status,
        Godot.Core.UPNPDevice.get_igd_status)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_IGD_STATUS_INVALID_CONTROL :: Int
_IGD_STATUS_INVALID_CONTROL = 7

_IGD_STATUS_DISCONNECTED :: Int
_IGD_STATUS_DISCONNECTED = 5

_IGD_STATUS_OK :: Int
_IGD_STATUS_OK = 0

_IGD_STATUS_NO_URLS :: Int
_IGD_STATUS_NO_URLS = 3

_IGD_STATUS_MALLOC_ERROR :: Int
_IGD_STATUS_MALLOC_ERROR = 8

_IGD_STATUS_UNKNOWN_ERROR :: Int
_IGD_STATUS_UNKNOWN_ERROR = 9

_IGD_STATUS_HTTP_EMPTY :: Int
_IGD_STATUS_HTTP_EMPTY = 2

_IGD_STATUS_NO_IGD :: Int
_IGD_STATUS_NO_IGD = 4

_IGD_STATUS_UNKNOWN_DEVICE :: Int
_IGD_STATUS_UNKNOWN_DEVICE = 6

_IGD_STATUS_HTTP_ERROR :: Int
_IGD_STATUS_HTTP_ERROR = 1

{-# NOINLINE bindUPNPDevice_is_valid_gateway #-}

bindUPNPDevice_is_valid_gateway :: MethodBind
bindUPNPDevice_is_valid_gateway
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "is_valid_gateway" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_valid_gateway ::
                   (UPNPDevice :< cls, Object :< cls) => cls -> IO Bool
is_valid_gateway cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_is_valid_gateway (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_query_external_address #-}

bindUPNPDevice_query_external_address :: MethodBind
bindUPNPDevice_query_external_address
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "query_external_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

query_external_address ::
                         (UPNPDevice :< cls, Object :< cls) => cls -> IO GodotString
query_external_address cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_query_external_address
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_add_port_mapping #-}

bindUPNPDevice_add_port_mapping :: MethodBind
bindUPNPDevice_add_port_mapping
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "add_port_mapping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_port_mapping ::
                   (UPNPDevice :< cls, Object :< cls) =>
                   cls -> Int -> Int -> GodotString -> GodotString -> Int -> IO Int
add_port_mapping cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_add_port_mapping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_delete_port_mapping #-}

bindUPNPDevice_delete_port_mapping :: MethodBind
bindUPNPDevice_delete_port_mapping
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "delete_port_mapping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

delete_port_mapping ::
                      (UPNPDevice :< cls, Object :< cls) =>
                      cls -> Int -> GodotString -> IO Int
delete_port_mapping cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_delete_port_mapping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_set_description_url #-}

bindUPNPDevice_set_description_url :: MethodBind
bindUPNPDevice_set_description_url
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "set_description_url" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_description_url ::
                      (UPNPDevice :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_description_url cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_set_description_url
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_get_description_url #-}

bindUPNPDevice_get_description_url :: MethodBind
bindUPNPDevice_get_description_url
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "get_description_url" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_description_url ::
                      (UPNPDevice :< cls, Object :< cls) => cls -> IO GodotString
get_description_url cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_get_description_url
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_set_service_type #-}

bindUPNPDevice_set_service_type :: MethodBind
bindUPNPDevice_set_service_type
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "set_service_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_service_type ::
                   (UPNPDevice :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_service_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_set_service_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_get_service_type #-}

bindUPNPDevice_get_service_type :: MethodBind
bindUPNPDevice_get_service_type
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "get_service_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_service_type ::
                   (UPNPDevice :< cls, Object :< cls) => cls -> IO GodotString
get_service_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_get_service_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_set_igd_control_url #-}

bindUPNPDevice_set_igd_control_url :: MethodBind
bindUPNPDevice_set_igd_control_url
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "set_igd_control_url" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_igd_control_url ::
                      (UPNPDevice :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_igd_control_url cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_set_igd_control_url
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_get_igd_control_url #-}

bindUPNPDevice_get_igd_control_url :: MethodBind
bindUPNPDevice_get_igd_control_url
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "get_igd_control_url" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_igd_control_url ::
                      (UPNPDevice :< cls, Object :< cls) => cls -> IO GodotString
get_igd_control_url cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_get_igd_control_url
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_set_igd_service_type #-}

bindUPNPDevice_set_igd_service_type :: MethodBind
bindUPNPDevice_set_igd_service_type
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "set_igd_service_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_igd_service_type ::
                       (UPNPDevice :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_igd_service_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_set_igd_service_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_get_igd_service_type #-}

bindUPNPDevice_get_igd_service_type :: MethodBind
bindUPNPDevice_get_igd_service_type
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "get_igd_service_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_igd_service_type ::
                       (UPNPDevice :< cls, Object :< cls) => cls -> IO GodotString
get_igd_service_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_get_igd_service_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_set_igd_our_addr #-}

bindUPNPDevice_set_igd_our_addr :: MethodBind
bindUPNPDevice_set_igd_our_addr
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "set_igd_our_addr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_igd_our_addr ::
                   (UPNPDevice :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_igd_our_addr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_set_igd_our_addr (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_get_igd_our_addr #-}

bindUPNPDevice_get_igd_our_addr :: MethodBind
bindUPNPDevice_get_igd_our_addr
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "get_igd_our_addr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_igd_our_addr ::
                   (UPNPDevice :< cls, Object :< cls) => cls -> IO GodotString
get_igd_our_addr cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_get_igd_our_addr (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_set_igd_status #-}

bindUPNPDevice_set_igd_status :: MethodBind
bindUPNPDevice_set_igd_status
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "set_igd_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_igd_status ::
                 (UPNPDevice :< cls, Object :< cls) => cls -> Int -> IO ()
set_igd_status cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_set_igd_status (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindUPNPDevice_get_igd_status #-}

bindUPNPDevice_get_igd_status :: MethodBind
bindUPNPDevice_get_igd_status
  = unsafePerformIO $
      withCString "UPNPDevice" $
        \ clsNamePtr ->
          withCString "get_igd_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_igd_status ::
                 (UPNPDevice :< cls, Object :< cls) => cls -> IO Int
get_igd_status cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_get_igd_status (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)