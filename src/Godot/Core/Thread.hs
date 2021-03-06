{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Thread
       (Godot.Core.Thread._PRIORITY_NORMAL,
        Godot.Core.Thread._PRIORITY_LOW, Godot.Core.Thread._PRIORITY_HIGH,
        Godot.Core.Thread.get_id, Godot.Core.Thread.is_active,
        Godot.Core.Thread.start, Godot.Core.Thread.wait_to_finish)
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

_PRIORITY_NORMAL :: Int
_PRIORITY_NORMAL = 1

_PRIORITY_LOW :: Int
_PRIORITY_LOW = 0

_PRIORITY_HIGH :: Int
_PRIORITY_HIGH = 2

{-# NOINLINE bindThread_get_id #-}

-- | Returns the current @Thread@'s ID, uniquely identifying it among all threads. If the @Thread@ is not running this returns an empty string.
bindThread_get_id :: MethodBind
bindThread_get_id
  = unsafePerformIO $
      withCString "_Thread" $
        \ clsNamePtr ->
          withCString "get_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current @Thread@'s ID, uniquely identifying it among all threads. If the @Thread@ is not running this returns an empty string.
get_id :: (Thread :< cls, Object :< cls) => cls -> IO GodotString
get_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindThread_get_id (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Thread "get_id" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Thread.get_id

{-# NOINLINE bindThread_is_active #-}

-- | Returns @true@ if this @Thread@ is currently active. An active @Thread@ cannot start work on a new method but can be joined with @method wait_to_finish@.
bindThread_is_active :: MethodBind
bindThread_is_active
  = unsafePerformIO $
      withCString "_Thread" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if this @Thread@ is currently active. An active @Thread@ cannot start work on a new method but can be joined with @method wait_to_finish@.
is_active :: (Thread :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindThread_is_active (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Thread "is_active" '[] (IO Bool) where
        nodeMethod = Godot.Core.Thread.is_active

{-# NOINLINE bindThread_start #-}

-- | Starts a new @Thread@ that runs @method@ on object @instance@ with @userdata@ passed as an argument. Even if no userdata is passed, @method@ must accept one argument and it will be null. The @priority@ of the @Thread@ can be changed by passing a value from the @enum Priority@ enum.
--   				Returns @OK@ on success, or @ERR_CANT_CREATE@ on failure.
bindThread_start :: MethodBind
bindThread_start
  = unsafePerformIO $
      withCString "_Thread" $
        \ clsNamePtr ->
          withCString "start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts a new @Thread@ that runs @method@ on object @instance@ with @userdata@ passed as an argument. Even if no userdata is passed, @method@ must accept one argument and it will be null. The @priority@ of the @Thread@ can be changed by passing a value from the @enum Priority@ enum.
--   				Returns @OK@ on success, or @ERR_CANT_CREATE@ on failure.
start ::
        (Thread :< cls, Object :< cls) =>
        cls ->
          Object -> GodotString -> Maybe GodotVariant -> Maybe Int -> IO Int
start cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3,
       maybe (VariantInt (1)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindThread_start (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Thread "start"
           '[Object, GodotString, Maybe GodotVariant, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.Thread.start

{-# NOINLINE bindThread_wait_to_finish #-}

-- | Joins the @Thread@ and waits for it to finish. Returns what the method called returned.
bindThread_wait_to_finish :: MethodBind
bindThread_wait_to_finish
  = unsafePerformIO $
      withCString "_Thread" $
        \ clsNamePtr ->
          withCString "wait_to_finish" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Joins the @Thread@ and waits for it to finish. Returns what the method called returned.
wait_to_finish ::
                 (Thread :< cls, Object :< cls) => cls -> IO GodotVariant
wait_to_finish cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindThread_wait_to_finish (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Thread "wait_to_finish" '[] (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Thread.wait_to_finish