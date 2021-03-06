{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.WebRTCMultiplayer
       (Godot.Core.WebRTCMultiplayer.add_peer,
        Godot.Core.WebRTCMultiplayer.close,
        Godot.Core.WebRTCMultiplayer.get_peer,
        Godot.Core.WebRTCMultiplayer.get_peers,
        Godot.Core.WebRTCMultiplayer.has_peer,
        Godot.Core.WebRTCMultiplayer.initialize,
        Godot.Core.WebRTCMultiplayer.remove_peer)
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
import Godot.Core.NetworkedMultiplayerPeer()

{-# NOINLINE bindWebRTCMultiplayer_add_peer #-}

bindWebRTCMultiplayer_add_peer :: MethodBind
bindWebRTCMultiplayer_add_peer
  = unsafePerformIO $
      withCString "WebRTCMultiplayer" $
        \ clsNamePtr ->
          withCString "add_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_peer ::
           (WebRTCMultiplayer :< cls, Object :< cls) =>
           cls -> WebRTCPeerConnection -> Int -> Maybe Int -> IO Int
add_peer cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (1)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCMultiplayer_add_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebRTCMultiplayer "add_peer"
           '[WebRTCPeerConnection, Int, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.WebRTCMultiplayer.add_peer

{-# NOINLINE bindWebRTCMultiplayer_close #-}

bindWebRTCMultiplayer_close :: MethodBind
bindWebRTCMultiplayer_close
  = unsafePerformIO $
      withCString "WebRTCMultiplayer" $
        \ clsNamePtr ->
          withCString "close" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

close :: (WebRTCMultiplayer :< cls, Object :< cls) => cls -> IO ()
close cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCMultiplayer_close (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebRTCMultiplayer "close" '[] (IO ()) where
        nodeMethod = Godot.Core.WebRTCMultiplayer.close

{-# NOINLINE bindWebRTCMultiplayer_get_peer #-}

bindWebRTCMultiplayer_get_peer :: MethodBind
bindWebRTCMultiplayer_get_peer
  = unsafePerformIO $
      withCString "WebRTCMultiplayer" $
        \ clsNamePtr ->
          withCString "get_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peer ::
           (WebRTCMultiplayer :< cls, Object :< cls) =>
           cls -> Int -> IO Dictionary
get_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCMultiplayer_get_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebRTCMultiplayer "get_peer" '[Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.WebRTCMultiplayer.get_peer

{-# NOINLINE bindWebRTCMultiplayer_get_peers #-}

bindWebRTCMultiplayer_get_peers :: MethodBind
bindWebRTCMultiplayer_get_peers
  = unsafePerformIO $
      withCString "WebRTCMultiplayer" $
        \ clsNamePtr ->
          withCString "get_peers" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_peers ::
            (WebRTCMultiplayer :< cls, Object :< cls) => cls -> IO Dictionary
get_peers cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCMultiplayer_get_peers (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebRTCMultiplayer "get_peers" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.WebRTCMultiplayer.get_peers

{-# NOINLINE bindWebRTCMultiplayer_has_peer #-}

bindWebRTCMultiplayer_has_peer :: MethodBind
bindWebRTCMultiplayer_has_peer
  = unsafePerformIO $
      withCString "WebRTCMultiplayer" $
        \ clsNamePtr ->
          withCString "has_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_peer ::
           (WebRTCMultiplayer :< cls, Object :< cls) => cls -> Int -> IO Bool
has_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCMultiplayer_has_peer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebRTCMultiplayer "has_peer" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.WebRTCMultiplayer.has_peer

{-# NOINLINE bindWebRTCMultiplayer_initialize #-}

bindWebRTCMultiplayer_initialize :: MethodBind
bindWebRTCMultiplayer_initialize
  = unsafePerformIO $
      withCString "WebRTCMultiplayer" $
        \ clsNamePtr ->
          withCString "initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

initialize ::
             (WebRTCMultiplayer :< cls, Object :< cls) =>
             cls -> Int -> Maybe Bool -> IO Int
initialize cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCMultiplayer_initialize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebRTCMultiplayer "initialize"
           '[Int, Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.WebRTCMultiplayer.initialize

{-# NOINLINE bindWebRTCMultiplayer_remove_peer #-}

bindWebRTCMultiplayer_remove_peer :: MethodBind
bindWebRTCMultiplayer_remove_peer
  = unsafePerformIO $
      withCString "WebRTCMultiplayer" $
        \ clsNamePtr ->
          withCString "remove_peer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_peer ::
              (WebRTCMultiplayer :< cls, Object :< cls) => cls -> Int -> IO ()
remove_peer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWebRTCMultiplayer_remove_peer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod WebRTCMultiplayer "remove_peer" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.WebRTCMultiplayer.remove_peer