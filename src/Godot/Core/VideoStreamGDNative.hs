{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VideoStreamGDNative
       (Godot.Core.VideoStreamGDNative.get_file,
        Godot.Core.VideoStreamGDNative.set_file)
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
import Godot.Core.VideoStream()

instance NodeProperty VideoStreamGDNative "file" GodotString 'False
         where
        nodeProperty = (get_file, wrapDroppingSetter set_file, Nothing)

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

instance NodeMethod VideoStreamGDNative "get_file" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VideoStreamGDNative.get_file

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

instance NodeMethod VideoStreamGDNative "set_file" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VideoStreamGDNative.set_file