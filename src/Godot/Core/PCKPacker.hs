{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PCKPacker
       (Godot.Core.PCKPacker.add_file, Godot.Core.PCKPacker.flush,
        Godot.Core.PCKPacker.pck_start)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPCKPacker_add_file #-}

bindPCKPacker_add_file :: MethodBind
bindPCKPacker_add_file
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "add_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_file ::
           (PCKPacker :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Int
add_file cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPCKPacker_add_file (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPCKPacker_flush #-}

bindPCKPacker_flush :: MethodBind
bindPCKPacker_flush
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "flush" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

flush :: (PCKPacker :< cls, Object :< cls) => cls -> Bool -> IO Int
flush cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPCKPacker_flush (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPCKPacker_pck_start #-}

bindPCKPacker_pck_start :: MethodBind
bindPCKPacker_pck_start
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "pck_start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

pck_start ::
            (PCKPacker :< cls, Object :< cls) =>
            cls -> GodotString -> Int -> IO Int
pck_start cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPCKPacker_pck_start (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)