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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

{-# NOINLINE bindPCKPacker_add_file #-}

-- | Adds the @source_path@ file to the current PCK package at the @pck_path@ internal path (should start with @res://@).
bindPCKPacker_add_file :: MethodBind
bindPCKPacker_add_file
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "add_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the @source_path@ file to the current PCK package at the @pck_path@ internal path (should start with @res://@).
add_file ::
           (PCKPacker :< cls, Object :< cls) =>
           cls -> GodotString -> GodotString -> IO Int
add_file cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPCKPacker_add_file (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PCKPacker "add_file"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.PCKPacker.add_file

{-# NOINLINE bindPCKPacker_flush #-}

-- | Writes the files specified using all @method add_file@ calls since the last flush. If @verbose@ is @true@, a list of files added will be printed to the console for easier debugging.
bindPCKPacker_flush :: MethodBind
bindPCKPacker_flush
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "flush" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Writes the files specified using all @method add_file@ calls since the last flush. If @verbose@ is @true@, a list of files added will be printed to the console for easier debugging.
flush ::
        (PCKPacker :< cls, Object :< cls) => cls -> Maybe Bool -> IO Int
flush cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPCKPacker_flush (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PCKPacker "flush" '[Maybe Bool] (IO Int) where
        nodeMethod = Godot.Core.PCKPacker.flush

{-# NOINLINE bindPCKPacker_pck_start #-}

-- | Creates a new PCK file with the name @pck_name@. The @.pck@ file extension isn't added automatically, so it should be part of @pck_name@ (even though it's not required).
bindPCKPacker_pck_start :: MethodBind
bindPCKPacker_pck_start
  = unsafePerformIO $
      withCString "PCKPacker" $
        \ clsNamePtr ->
          withCString "pck_start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new PCK file with the name @pck_name@. The @.pck@ file extension isn't added automatically, so it should be part of @pck_name@ (even though it's not required).
pck_start ::
            (PCKPacker :< cls, Object :< cls) =>
            cls -> GodotString -> Maybe Int -> IO Int
pck_start cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPCKPacker_pck_start (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PCKPacker "pck_start" '[GodotString, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.PCKPacker.pck_start