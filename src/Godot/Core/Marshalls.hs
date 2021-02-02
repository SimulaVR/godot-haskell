{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMarshalls_base64_to_raw #-}

-- | Returns [PoolByteArray] of a given base64 encoded String.
bindMarshalls_base64_to_raw :: MethodBind
bindMarshalls_base64_to_raw
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "base64_to_raw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [PoolByteArray] of a given base64 encoded String.
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

{-# NOINLINE bindMarshalls_base64_to_utf8 #-}

-- | Returns utf8 String of a given base64 encoded String.
bindMarshalls_base64_to_utf8 :: MethodBind
bindMarshalls_base64_to_utf8
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "base64_to_utf8" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns utf8 String of a given base64 encoded String.
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

{-# NOINLINE bindMarshalls_base64_to_variant #-}

-- | Returns [Variant] of a given base64 encoded String. When [code]allow_objects[/code] is [code]true[/code] decoding objects is allowed.
--   				[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
bindMarshalls_base64_to_variant :: MethodBind
bindMarshalls_base64_to_variant
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "base64_to_variant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [Variant] of a given base64 encoded String. When [code]allow_objects[/code] is [code]true[/code] decoding objects is allowed.
--   				[b]WARNING:[/b] Deserialized object can contain code which gets executed. Do not use this option if the serialized object comes from untrusted sources to avoid potential security threats (remote code execution).
base64_to_variant ::
                    (Marshalls :< cls, Object :< cls) =>
                    cls -> GodotString -> Bool -> IO GodotVariant
base64_to_variant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMarshalls_base64_to_variant (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMarshalls_raw_to_base64 #-}

-- | Returns base64 encoded String of a given [PoolByteArray].
bindMarshalls_raw_to_base64 :: MethodBind
bindMarshalls_raw_to_base64
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "raw_to_base64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns base64 encoded String of a given [PoolByteArray].
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

{-# NOINLINE bindMarshalls_utf8_to_base64 #-}

-- | Returns base64 encoded String of a given utf8 String.
bindMarshalls_utf8_to_base64 :: MethodBind
bindMarshalls_utf8_to_base64
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "utf8_to_base64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns base64 encoded String of a given utf8 String.
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

{-# NOINLINE bindMarshalls_variant_to_base64 #-}

-- | Returns base64 encoded String of a given [Variant]. When [code]full_objects[/code] is [code]true[/code] encoding objects is allowed (and can potentially include code).
bindMarshalls_variant_to_base64 :: MethodBind
bindMarshalls_variant_to_base64
  = unsafePerformIO $
      withCString "_Marshalls" $
        \ clsNamePtr ->
          withCString "variant_to_base64" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns base64 encoded String of a given [Variant]. When [code]full_objects[/code] is [code]true[/code] encoding objects is allowed (and can potentially include code).
variant_to_base64 ::
                    (Marshalls :< cls, Object :< cls) =>
                    cls -> GodotVariant -> Bool -> IO GodotString
variant_to_base64 cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMarshalls_variant_to_base64 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)