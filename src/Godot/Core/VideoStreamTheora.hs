{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VideoStreamTheora
       (Godot.Core.VideoStreamTheora.get_file,
        Godot.Core.VideoStreamTheora.set_file)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVideoStreamTheora_get_file #-}

bindVideoStreamTheora_get_file :: MethodBind
bindVideoStreamTheora_get_file
  = unsafePerformIO $
      withCString "VideoStreamTheora" $
        \ clsNamePtr ->
          withCString "get_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_file ::
           (VideoStreamTheora :< cls, Object :< cls) => cls -> IO GodotString
get_file cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoStreamTheora_get_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoStreamTheora_set_file #-}

bindVideoStreamTheora_set_file :: MethodBind
bindVideoStreamTheora_set_file
  = unsafePerformIO $
      withCString "VideoStreamTheora" $
        \ clsNamePtr ->
          withCString "set_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_file ::
           (VideoStreamTheora :< cls, Object :< cls) =>
           cls -> GodotString -> IO ()
set_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoStreamTheora_set_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)