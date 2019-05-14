{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VideoStreamWebm
       (Godot.Core.VideoStreamWebm.set_file,
        Godot.Core.VideoStreamWebm.get_file)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVideoStreamWebm_set_file #-}

bindVideoStreamWebm_set_file :: MethodBind
bindVideoStreamWebm_set_file
  = unsafePerformIO $
      withCString "VideoStreamWebm" $
        \ clsNamePtr ->
          withCString "set_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_file ::
           (VideoStreamWebm :< cls, Object :< cls) =>
           cls -> GodotString -> IO ()
set_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoStreamWebm_set_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVideoStreamWebm_get_file #-}

bindVideoStreamWebm_get_file :: MethodBind
bindVideoStreamWebm_get_file
  = unsafePerformIO $
      withCString "VideoStreamWebm" $
        \ clsNamePtr ->
          withCString "get_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_file ::
           (VideoStreamWebm :< cls, Object :< cls) => cls -> IO GodotString
get_file cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVideoStreamWebm_get_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)