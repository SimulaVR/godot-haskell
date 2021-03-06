{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AudioStreamOGGVorbis
       (Godot.Core.AudioStreamOGGVorbis.get_data,
        Godot.Core.AudioStreamOGGVorbis.get_loop_offset,
        Godot.Core.AudioStreamOGGVorbis.has_loop,
        Godot.Core.AudioStreamOGGVorbis.set_data,
        Godot.Core.AudioStreamOGGVorbis.set_loop,
        Godot.Core.AudioStreamOGGVorbis.set_loop_offset)
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
import Godot.Core.AudioStream()

instance NodeProperty AudioStreamOGGVorbis "data" PoolByteArray
           'False
         where
        nodeProperty = (get_data, wrapDroppingSetter set_data, Nothing)

instance NodeProperty AudioStreamOGGVorbis "loop" Bool 'False where
        nodeProperty = (has_loop, wrapDroppingSetter set_loop, Nothing)

instance NodeProperty AudioStreamOGGVorbis "loop_offset" Float
           'False
         where
        nodeProperty
          = (get_loop_offset, wrapDroppingSetter set_loop_offset, Nothing)

{-# NOINLINE bindAudioStreamOGGVorbis_get_data #-}

bindAudioStreamOGGVorbis_get_data :: MethodBind
bindAudioStreamOGGVorbis_get_data
  = unsafePerformIO $
      withCString "AudioStreamOGGVorbis" $
        \ clsNamePtr ->
          withCString "get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_data ::
           (AudioStreamOGGVorbis :< cls, Object :< cls) =>
           cls -> IO PoolByteArray
get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamOGGVorbis_get_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamOGGVorbis "get_data" '[]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.AudioStreamOGGVorbis.get_data

{-# NOINLINE bindAudioStreamOGGVorbis_get_loop_offset #-}

bindAudioStreamOGGVorbis_get_loop_offset :: MethodBind
bindAudioStreamOGGVorbis_get_loop_offset
  = unsafePerformIO $
      withCString "AudioStreamOGGVorbis" $
        \ clsNamePtr ->
          withCString "get_loop_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_loop_offset ::
                  (AudioStreamOGGVorbis :< cls, Object :< cls) => cls -> IO Float
get_loop_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamOGGVorbis_get_loop_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamOGGVorbis "get_loop_offset" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AudioStreamOGGVorbis.get_loop_offset

{-# NOINLINE bindAudioStreamOGGVorbis_has_loop #-}

bindAudioStreamOGGVorbis_has_loop :: MethodBind
bindAudioStreamOGGVorbis_has_loop
  = unsafePerformIO $
      withCString "AudioStreamOGGVorbis" $
        \ clsNamePtr ->
          withCString "has_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_loop ::
           (AudioStreamOGGVorbis :< cls, Object :< cls) => cls -> IO Bool
has_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamOGGVorbis_has_loop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamOGGVorbis "has_loop" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AudioStreamOGGVorbis.has_loop

{-# NOINLINE bindAudioStreamOGGVorbis_set_data #-}

bindAudioStreamOGGVorbis_set_data :: MethodBind
bindAudioStreamOGGVorbis_set_data
  = unsafePerformIO $
      withCString "AudioStreamOGGVorbis" $
        \ clsNamePtr ->
          withCString "set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_data ::
           (AudioStreamOGGVorbis :< cls, Object :< cls) =>
           cls -> PoolByteArray -> IO ()
set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamOGGVorbis_set_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamOGGVorbis "set_data"
           '[PoolByteArray]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamOGGVorbis.set_data

{-# NOINLINE bindAudioStreamOGGVorbis_set_loop #-}

bindAudioStreamOGGVorbis_set_loop :: MethodBind
bindAudioStreamOGGVorbis_set_loop
  = unsafePerformIO $
      withCString "AudioStreamOGGVorbis" $
        \ clsNamePtr ->
          withCString "set_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_loop ::
           (AudioStreamOGGVorbis :< cls, Object :< cls) =>
           cls -> Bool -> IO ()
set_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamOGGVorbis_set_loop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamOGGVorbis "set_loop" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamOGGVorbis.set_loop

{-# NOINLINE bindAudioStreamOGGVorbis_set_loop_offset #-}

bindAudioStreamOGGVorbis_set_loop_offset :: MethodBind
bindAudioStreamOGGVorbis_set_loop_offset
  = unsafePerformIO $
      withCString "AudioStreamOGGVorbis" $
        \ clsNamePtr ->
          withCString "set_loop_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_loop_offset ::
                  (AudioStreamOGGVorbis :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_loop_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAudioStreamOGGVorbis_set_loop_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AudioStreamOGGVorbis "set_loop_offset" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AudioStreamOGGVorbis.set_loop_offset