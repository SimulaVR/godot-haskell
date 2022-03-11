{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.IP
       (Godot.Core.IP._RESOLVER_INVALID_ID, Godot.Core.IP._TYPE_NONE,
        Godot.Core.IP._RESOLVER_STATUS_WAITING, Godot.Core.IP._TYPE_IPV4,
        Godot.Core.IP._RESOLVER_STATUS_ERROR,
        Godot.Core.IP._RESOLVER_STATUS_DONE,
        Godot.Core.IP._RESOLVER_STATUS_NONE, Godot.Core.IP._TYPE_IPV6,
        Godot.Core.IP._RESOLVER_MAX_QUERIES, Godot.Core.IP._TYPE_ANY,
        Godot.Core.IP.clear_cache, Godot.Core.IP.erase_resolve_item,
        Godot.Core.IP.get_local_addresses,
        Godot.Core.IP.get_local_interfaces,
        Godot.Core.IP.get_resolve_item_address,
        Godot.Core.IP.get_resolve_item_status,
        Godot.Core.IP.resolve_hostname,
        Godot.Core.IP.resolve_hostname_queue_item)
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
import Godot.Core.Object()

_RESOLVER_INVALID_ID :: Int
_RESOLVER_INVALID_ID = -1

_TYPE_NONE :: Int
_TYPE_NONE = 0

_RESOLVER_STATUS_WAITING :: Int
_RESOLVER_STATUS_WAITING = 1

_TYPE_IPV4 :: Int
_TYPE_IPV4 = 1

_RESOLVER_STATUS_ERROR :: Int
_RESOLVER_STATUS_ERROR = 3

_RESOLVER_STATUS_DONE :: Int
_RESOLVER_STATUS_DONE = 2

_RESOLVER_STATUS_NONE :: Int
_RESOLVER_STATUS_NONE = 0

_TYPE_IPV6 :: Int
_TYPE_IPV6 = 2

_RESOLVER_MAX_QUERIES :: Int
_RESOLVER_MAX_QUERIES = 32

_TYPE_ANY :: Int
_TYPE_ANY = 3

{-# NOINLINE bindIP_clear_cache #-}

-- | Removes all of a @hostname@'s cached references. If no @hostname@ is given, all cached IP addresses are removed.
bindIP_clear_cache :: MethodBind
bindIP_clear_cache
  = unsafePerformIO $
      withCString "IP" $
        \ clsNamePtr ->
          withCString "clear_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all of a @hostname@'s cached references. If no @hostname@ is given, all cached IP addresses are removed.
clear_cache ::
              (IP :< cls, Object :< cls) => cls -> Maybe GodotString -> IO ()
clear_cache cls arg1
  = withVariantArray [defaultedVariant VariantString "" arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindIP_clear_cache (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod IP "clear_cache" '[Maybe GodotString] (IO ())
         where
        nodeMethod = Godot.Core.IP.clear_cache

{-# NOINLINE bindIP_erase_resolve_item #-}

-- | Removes a given item @id@ from the queue. This should be used to free a queue after it has completed to enable more queries to happen.
bindIP_erase_resolve_item :: MethodBind
bindIP_erase_resolve_item
  = unsafePerformIO $
      withCString "IP" $
        \ clsNamePtr ->
          withCString "erase_resolve_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a given item @id@ from the queue. This should be used to free a queue after it has completed to enable more queries to happen.
erase_resolve_item ::
                     (IP :< cls, Object :< cls) => cls -> Int -> IO ()
erase_resolve_item cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindIP_erase_resolve_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod IP "erase_resolve_item" '[Int] (IO ()) where
        nodeMethod = Godot.Core.IP.erase_resolve_item

{-# NOINLINE bindIP_get_local_addresses #-}

-- | Returns all the user's current IPv4 and IPv6 addresses as an array.
bindIP_get_local_addresses :: MethodBind
bindIP_get_local_addresses
  = unsafePerformIO $
      withCString "IP" $
        \ clsNamePtr ->
          withCString "get_local_addresses" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all the user's current IPv4 and IPv6 addresses as an array.
get_local_addresses ::
                      (IP :< cls, Object :< cls) => cls -> IO Array
get_local_addresses cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindIP_get_local_addresses (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod IP "get_local_addresses" '[] (IO Array) where
        nodeMethod = Godot.Core.IP.get_local_addresses

{-# NOINLINE bindIP_get_local_interfaces #-}

-- | Returns all network adapters as an array.
--   				Each adapter is a dictionary of the form:
--   				
--   @
--   
--   				{
--   				    "index": "1", # Interface index.
--   				    "name": "eth0", # Interface name.
--   				    "friendly": "Ethernet One", # A friendly name (might be empty).
--   				    "addresses": @"192.168.1.101"@, # An array of IP addresses associated to this interface.
--   				}
--   				
--   @
bindIP_get_local_interfaces :: MethodBind
bindIP_get_local_interfaces
  = unsafePerformIO $
      withCString "IP" $
        \ clsNamePtr ->
          withCString "get_local_interfaces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns all network adapters as an array.
--   				Each adapter is a dictionary of the form:
--   				
--   @
--   
--   				{
--   				    "index": "1", # Interface index.
--   				    "name": "eth0", # Interface name.
--   				    "friendly": "Ethernet One", # A friendly name (might be empty).
--   				    "addresses": @"192.168.1.101"@, # An array of IP addresses associated to this interface.
--   				}
--   				
--   @
get_local_interfaces ::
                       (IP :< cls, Object :< cls) => cls -> IO Array
get_local_interfaces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindIP_get_local_interfaces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod IP "get_local_interfaces" '[] (IO Array) where
        nodeMethod = Godot.Core.IP.get_local_interfaces

{-# NOINLINE bindIP_get_resolve_item_address #-}

-- | Returns a queued hostname's IP address, given its queue @id@. Returns an empty string on error or if resolution hasn't happened yet (see @method get_resolve_item_status@).
bindIP_get_resolve_item_address :: MethodBind
bindIP_get_resolve_item_address
  = unsafePerformIO $
      withCString "IP" $
        \ clsNamePtr ->
          withCString "get_resolve_item_address" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a queued hostname's IP address, given its queue @id@. Returns an empty string on error or if resolution hasn't happened yet (see @method get_resolve_item_status@).
get_resolve_item_address ::
                           (IP :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_resolve_item_address cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindIP_get_resolve_item_address (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod IP "get_resolve_item_address" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.IP.get_resolve_item_address

{-# NOINLINE bindIP_get_resolve_item_status #-}

-- | Returns a queued hostname's status as a @enum ResolverStatus@ constant, given its queue @id@.
bindIP_get_resolve_item_status :: MethodBind
bindIP_get_resolve_item_status
  = unsafePerformIO $
      withCString "IP" $
        \ clsNamePtr ->
          withCString "get_resolve_item_status" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a queued hostname's status as a @enum ResolverStatus@ constant, given its queue @id@.
get_resolve_item_status ::
                          (IP :< cls, Object :< cls) => cls -> Int -> IO Int
get_resolve_item_status cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindIP_get_resolve_item_status (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod IP "get_resolve_item_status" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.IP.get_resolve_item_status

{-# NOINLINE bindIP_resolve_hostname #-}

-- | Returns a given hostname's IPv4 or IPv6 address when resolved (blocking-type method). The address type returned depends on the @enum Type@ constant given as @ip_type@.
bindIP_resolve_hostname :: MethodBind
bindIP_resolve_hostname
  = unsafePerformIO $
      withCString "IP" $
        \ clsNamePtr ->
          withCString "resolve_hostname" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a given hostname's IPv4 or IPv6 address when resolved (blocking-type method). The address type returned depends on the @enum Type@ constant given as @ip_type@.
resolve_hostname ::
                   (IP :< cls, Object :< cls) =>
                   cls -> GodotString -> Maybe Int -> IO GodotString
resolve_hostname cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (3)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindIP_resolve_hostname (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod IP "resolve_hostname" '[GodotString, Maybe Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.IP.resolve_hostname

{-# NOINLINE bindIP_resolve_hostname_queue_item #-}

-- | Creates a queue item to resolve a hostname to an IPv4 or IPv6 address depending on the @enum Type@ constant given as @ip_type@. Returns the queue ID if successful, or @RESOLVER_INVALID_ID@ on error.
bindIP_resolve_hostname_queue_item :: MethodBind
bindIP_resolve_hostname_queue_item
  = unsafePerformIO $
      withCString "IP" $
        \ clsNamePtr ->
          withCString "resolve_hostname_queue_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a queue item to resolve a hostname to an IPv4 or IPv6 address depending on the @enum Type@ constant given as @ip_type@. Returns the queue ID if successful, or @RESOLVER_INVALID_ID@ on error.
resolve_hostname_queue_item ::
                              (IP :< cls, Object :< cls) =>
                              cls -> GodotString -> Maybe Int -> IO Int
resolve_hostname_queue_item cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (3)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindIP_resolve_hostname_queue_item
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod IP "resolve_hostname_queue_item"
           '[GodotString, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.IP.resolve_hostname_queue_item