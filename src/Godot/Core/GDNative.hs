{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GDNative
       (Godot.Core.GDNative.call_native, Godot.Core.GDNative.get_library,
        Godot.Core.GDNative.initialize, Godot.Core.GDNative.set_library,
        Godot.Core.GDNative.terminate)
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

instance NodeProperty GDNative "library" GDNativeLibrary 'False
         where
        nodeProperty
          = (get_library, wrapDroppingSetter set_library, Nothing)

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

instance NodeMethod GDNative "call_native"
           '[GodotString, GodotString, Array]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.GDNative.call_native

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

instance NodeMethod GDNative "get_library" '[] (IO GDNativeLibrary)
         where
        nodeMethod = Godot.Core.GDNative.get_library

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

instance NodeMethod GDNative "initialize" '[] (IO Bool) where
        nodeMethod = Godot.Core.GDNative.initialize

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

instance NodeMethod GDNative "set_library" '[GDNativeLibrary]
           (IO ())
         where
        nodeMethod = Godot.Core.GDNative.set_library

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

instance NodeMethod GDNative "terminate" '[] (IO Bool) where
        nodeMethod = Godot.Core.GDNative.terminate