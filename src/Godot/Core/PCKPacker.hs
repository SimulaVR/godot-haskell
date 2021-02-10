{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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

-- | Adds the [code]source_path[/code] file to the current PCK package at the [code]pck_path[/code] internal path (should start with [code]res://[/code]).
bindPCKPacker_add_file :: MethodBind
bindPCKPacker_add_file
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "add_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the [code]source_path[/code] file to the current PCK package at the [code]pck_path[/code] internal path (should start with [code]res://[/code]).
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

-- | Writes the files specified using all [method add_file] calls since the last flush. If [code]verbose[/code] is [code]true[/code], a list of files added will be printed to the console for easier debugging.
bindPCKPacker_flush :: MethodBind
bindPCKPacker_flush
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "flush" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Writes the files specified using all [method add_file] calls since the last flush. If [code]verbose[/code] is [code]true[/code], a list of files added will be printed to the console for easier debugging.
flush :: (PCKPacker :< cls, Object :< cls) => cls -> Bool -> IO Int
flush cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPCKPacker_flush (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPCKPacker_pck_start #-}

-- | Creates a new PCK file with the name [code]pck_name[/code]. The [code].pck[/code] file extension isn't added automatically, so it should be part of [code]pck_name[/code] (even though it's not required).
bindPCKPacker_pck_start :: MethodBind
bindPCKPacker_pck_start
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "pck_start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new PCK file with the name [code]pck_name[/code]. The [code].pck[/code] file extension isn't added automatically, so it should be part of [code]pck_name[/code] (even though it's not required).
pck_start ::
            (PCKPacker :< cls, Object :< cls) =>
            cls -> GodotString -> Int -> IO Int
pck_start cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPCKPacker_pck_start (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)