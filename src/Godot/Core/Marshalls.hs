{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Marshalls
       (Godot.Core.Marshalls.base64_to_raw,
        Godot.Core.Marshalls.base64_to_utf8,
        Godot.Core.Marshalls.base64_to_variant,
        Godot.Core.Marshalls.raw_to_base64,
        Godot.Core.Marshalls.utf8_to_base64,
        Godot.Core.Marshalls.variant_to_base64)
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

{-# NOINLINE bindMarshalls_base64_to_raw #-}

-- | Returns a decoded @PoolByteArray@ corresponding to the Base64-encoded string @base64_str@.
bindMarshalls_base64_to_raw :: MethodBind
bindMarshalls_base64_to_raw
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "base64_to_raw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a decoded @PoolByteArray@ corresponding to the Base64-encoded string @base64_str@.
base64_to_raw ::
                (Marshalls :< cls, Object :< cls) =>
                cls -> GodotString -> IO PoolByteArray
base64_to_raw cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMarshalls_base64_to_raw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Marshalls "base64_to_raw" '[GodotString]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.Marshalls.base64_to_raw

{-# NOINLINE bindMarshalls_base64_to_utf8 #-}

-- | Returns a decoded string corresponding to the Base64-encoded string @base64_str@.
bindMarshalls_base64_to_utf8 :: MethodBind
bindMarshalls_base64_to_utf8
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "base64_to_utf8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a decoded string corresponding to the Base64-encoded string @base64_str@.
base64_to_utf8 ::
                 (Marshalls :< cls, Object :< cls) =>
                 cls -> GodotString -> IO GodotString
base64_to_utf8 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMarshalls_base64_to_utf8 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Marshalls "base64_to_utf8" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Marshalls.base64_to_utf8

{-# NOINLINE bindMarshalls_base64_to_variant #-}

-- | Returns a decoded @Variant@ corresponding to the Base64-encoded string @base64_str@. If @allow_objects@ is @true@, decoding objects is allowed.
--   				__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
bindMarshalls_base64_to_variant :: MethodBind
bindMarshalls_base64_to_variant
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "base64_to_variant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a decoded @Variant@ corresponding to the Base64-encoded string @base64_str@. If @allow_objects@ is @true@, decoding objects is allowed.
--   				__Warning:__ Deserialized objects can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats such as remote code execution.
base64_to_variant ::
                    (Marshalls :< cls, Object :< cls) =>
                    cls -> GodotString -> Maybe Bool -> IO GodotVariant
base64_to_variant cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMarshalls_base64_to_variant (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Marshalls "base64_to_variant"
           '[GodotString, Maybe Bool]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Marshalls.base64_to_variant

{-# NOINLINE bindMarshalls_raw_to_base64 #-}

-- | Returns a Base64-encoded string of a given @PoolByteArray@.
bindMarshalls_raw_to_base64 :: MethodBind
bindMarshalls_raw_to_base64
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "raw_to_base64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a Base64-encoded string of a given @PoolByteArray@.
raw_to_base64 ::
                (Marshalls :< cls, Object :< cls) =>
                cls -> PoolByteArray -> IO GodotString
raw_to_base64 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMarshalls_raw_to_base64 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Marshalls "raw_to_base64" '[PoolByteArray]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Marshalls.raw_to_base64

{-# NOINLINE bindMarshalls_utf8_to_base64 #-}

-- | Returns a Base64-encoded string of the UTF-8 string @utf8_str@.
bindMarshalls_utf8_to_base64 :: MethodBind
bindMarshalls_utf8_to_base64
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "utf8_to_base64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a Base64-encoded string of the UTF-8 string @utf8_str@.
utf8_to_base64 ::
                 (Marshalls :< cls, Object :< cls) =>
                 cls -> GodotString -> IO GodotString
utf8_to_base64 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMarshalls_utf8_to_base64 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Marshalls "utf8_to_base64" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Marshalls.utf8_to_base64

{-# NOINLINE bindMarshalls_variant_to_base64 #-}

-- | Returns a Base64-encoded string of the @Variant@ @variant@. If @full_objects@ is @true@, encoding objects is allowed (and can potentially include code).
bindMarshalls_variant_to_base64 :: MethodBind
bindMarshalls_variant_to_base64
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "variant_to_base64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a Base64-encoded string of the @Variant@ @variant@. If @full_objects@ is @true@, encoding objects is allowed (and can potentially include code).
variant_to_base64 ::
                    (Marshalls :< cls, Object :< cls) =>
                    cls -> GodotVariant -> Maybe Bool -> IO GodotString
variant_to_base64 cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMarshalls_variant_to_base64 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Marshalls "variant_to_base64"
           '[GodotVariant, Maybe Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Marshalls.variant_to_base64