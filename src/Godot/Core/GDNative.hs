{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.GDNative
       (Godot.Core.GDNative.set_library, Godot.Core.GDNative.get_library,
        Godot.Core.GDNative.initialize, Godot.Core.GDNative.terminate,
        Godot.Core.GDNative.call_native)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindGDNative_set_library #-}

bindGDNative_set_library :: MethodBind
bindGDNative_set_library
  = unsafePerformIO $
      withCString "GDNative" $
        \ clsNamePtr ->
          withCString "set_library" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_library ::
              (GDNative :< cls, Object :< cls) => cls -> GDNativeLibrary -> IO ()
set_library cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNative_set_library (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGDNative_get_library #-}

bindGDNative_get_library :: MethodBind
bindGDNative_get_library
  = unsafePerformIO $
      withCString "GDNative" $
        \ clsNamePtr ->
          withCString "get_library" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_library ::
              (GDNative :< cls, Object :< cls) => cls -> IO GDNativeLibrary
get_library cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNative_get_library (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGDNative_initialize #-}

bindGDNative_initialize :: MethodBind
bindGDNative_initialize
  = unsafePerformIO $
      withCString "GDNative" $
        \ clsNamePtr ->
          withCString "initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

initialize :: (GDNative :< cls, Object :< cls) => cls -> IO Bool
initialize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNative_initialize (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGDNative_terminate #-}

bindGDNative_terminate :: MethodBind
bindGDNative_terminate
  = unsafePerformIO $
      withCString "GDNative" $
        \ clsNamePtr ->
          withCString "terminate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

terminate :: (GDNative :< cls, Object :< cls) => cls -> IO Bool
terminate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNative_terminate (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGDNative_call_native #-}

bindGDNative_call_native :: MethodBind
bindGDNative_call_native
  = unsafePerformIO $
      withCString "GDNative" $
        \ clsNamePtr ->
          withCString "call_native" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

call_native ::
              (GDNative :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> Array -> IO GodotVariant
call_native cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNative_call_native (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)