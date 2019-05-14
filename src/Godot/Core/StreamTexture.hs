{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.StreamTexture
       (Godot.Core.StreamTexture.load,
        Godot.Core.StreamTexture.get_load_path)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindStreamTexture_load #-}

-- | The StreamTexture's filepath to a .stex file.
bindStreamTexture_load :: MethodBind
bindStreamTexture_load
  = unsafePerformIO $
      withCString "StreamTexture" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The StreamTexture's filepath to a .stex file.
load ::
       (StreamTexture :< cls, Object :< cls) =>
       cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamTexture_load (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStreamTexture_get_load_path #-}

-- | The StreamTexture's filepath to a .stex file.
bindStreamTexture_get_load_path :: MethodBind
bindStreamTexture_get_load_path
  = unsafePerformIO $
      withCString "StreamTexture" $
        \ clsNamePtr ->
          withCString "get_load_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The StreamTexture's filepath to a .stex file.
get_load_path ::
                (StreamTexture :< cls, Object :< cls) => cls -> IO GodotString
get_load_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamTexture_get_load_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)