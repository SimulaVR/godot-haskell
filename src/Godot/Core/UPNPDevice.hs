{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
        Godot.Core.UPNPDevice.add_port_mapping,
        Godot.Core.UPNPDevice.delete_port_mapping,
        Godot.Core.UPNPDevice.get_description_url,
        Godot.Core.UPNPDevice.get_igd_control_url,
        Godot.Core.UPNPDevice.get_igd_our_addr,
        Godot.Core.UPNPDevice.get_igd_service_type,
        Godot.Core.UPNPDevice.get_igd_status,
        Godot.Core.UPNPDevice.get_service_type,
        Godot.Core.UPNPDevice.is_valid_gateway,
        Godot.Core.UPNPDevice.query_external_address,
        Godot.Core.UPNPDevice.set_description_url,
        Godot.Core.UPNPDevice.set_igd_control_url,
        Godot.Core.UPNPDevice.set_igd_our_addr,
        Godot.Core.UPNPDevice.set_igd_service_type,
        Godot.Core.UPNPDevice.set_igd_status,
        Godot.Core.UPNPDevice.set_service_type)
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

instance NodeProperty UPNPDevice "description_url" GodotString
           'False
         where
        nodeProperty
          = (get_description_url, wrapDroppingSetter set_description_url,
             Nothing)

instance NodeProperty UPNPDevice "igd_control_url" GodotString
           'False
         where
        nodeProperty
          = (get_igd_control_url, wrapDroppingSetter set_igd_control_url,
             Nothing)

instance NodeProperty UPNPDevice "igd_our_addr" GodotString 'False
         where
        nodeProperty
          = (get_igd_our_addr, wrapDroppingSetter set_igd_our_addr, Nothing)

instance NodeProperty UPNPDevice "igd_service_type" GodotString
           'False
         where
        nodeProperty
          = (get_igd_service_type, wrapDroppingSetter set_igd_service_type,
             Nothing)

instance NodeProperty UPNPDevice "igd_status" Int 'False where
        nodeProperty
          = (get_igd_status, wrapDroppingSetter set_igd_status, Nothing)

instance NodeProperty UPNPDevice "service_type" GodotString 'False
         where
        nodeProperty
          = (get_service_type, wrapDroppingSetter set_service_type, Nothing)

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
                   cls ->
                     Int ->
                       Maybe Int ->
                         Maybe GodotString -> Maybe GodotString -> Maybe Int -> IO Int
add_port_mapping cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2,
       defaultedVariant VariantString "" arg3,
       defaultedVariant VariantString "UDP" arg4,
       maybe (VariantInt (0)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_add_port_mapping (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UPNPDevice "add_port_mapping"
           '[Int, Maybe Int, Maybe GodotString, Maybe GodotString, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.UPNPDevice.add_port_mapping

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
                      cls -> Int -> Maybe GodotString -> IO Int
delete_port_mapping cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "UDP" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindUPNPDevice_delete_port_mapping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod UPNPDevice "delete_port_mapping"
           '[Int, Maybe GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.UPNPDevice.delete_port_mapping

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

instance NodeMethod UPNPDevice "get_description_url" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.UPNPDevice.get_description_url

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

instance NodeMethod UPNPDevice "get_igd_control_url" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.UPNPDevice.get_igd_control_url

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

instance NodeMethod UPNPDevice "get_igd_our_addr" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.UPNPDevice.get_igd_our_addr

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

instance NodeMethod UPNPDevice "get_igd_service_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.UPNPDevice.get_igd_service_type

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

instance NodeMethod UPNPDevice "get_igd_status" '[] (IO Int) where
        nodeMethod = Godot.Core.UPNPDevice.get_igd_status

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

instance NodeMethod UPNPDevice "get_service_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.UPNPDevice.get_service_type

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

instance NodeMethod UPNPDevice "is_valid_gateway" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.UPNPDevice.is_valid_gateway

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

instance NodeMethod UPNPDevice "query_external_address" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.UPNPDevice.query_external_address

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

instance NodeMethod UPNPDevice "set_description_url" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.UPNPDevice.set_description_url

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

instance NodeMethod UPNPDevice "set_igd_control_url" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.UPNPDevice.set_igd_control_url

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

instance NodeMethod UPNPDevice "set_igd_our_addr" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.UPNPDevice.set_igd_our_addr

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

instance NodeMethod UPNPDevice "set_igd_service_type"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.UPNPDevice.set_igd_service_type

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

instance NodeMethod UPNPDevice "set_igd_status" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.UPNPDevice.set_igd_status

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

instance NodeMethod UPNPDevice "set_service_type" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.UPNPDevice.set_service_type