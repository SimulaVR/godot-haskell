{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VideoStreamGDNative
       (Godot.Core.VideoStreamGDNative.set_file,
        Godot.Core.VideoStreamGDNative.get_file)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVideoStreamGDNative_set_file #-}

bindVideoStreamGDNative_set_file :: MethodBind
bindVideoStreamGDNative_set_file
  = unsafePerformIO $
      withCString "VideoStreamGDNative" $
        \ clsNamePtr ->
          withCString "set_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_file ::
           (VideoStreamGDNative :< cls, Object :< cls) =>
           cls -> GodotString -> IO ()
set_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoStreamGDNative_set_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoStreamGDNative_get_file #-}

bindVideoStreamGDNative_get_file :: MethodBind
bindVideoStreamGDNative_get_file
  = unsafePerformIO $
      withCString "VideoStreamGDNative" $
        \ clsNamePtr ->
          withCString "get_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_file ::
           (VideoStreamGDNative :< cls, Object :< cls) =>
           cls -> IO GodotString
get_file cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoStreamGDNative_get_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)