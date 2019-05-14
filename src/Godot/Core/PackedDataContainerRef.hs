{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PackedDataContainerRef
       (Godot.Core.PackedDataContainerRef.size,
        Godot.Core.PackedDataContainerRef._iter_init,
        Godot.Core.PackedDataContainerRef._iter_get,
        Godot.Core.PackedDataContainerRef._iter_next,
        Godot.Core.PackedDataContainerRef._is_dictionary)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPackedDataContainerRef_size #-}

bindPackedDataContainerRef_size :: MethodBind
bindPackedDataContainerRef_size
  = unsafePerformIO $
      withCString "PackedDataContainerRef" $
        \ clsNamePtr ->
          withCString "size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

size ::
       (PackedDataContainerRef :< cls, Object :< cls) => cls -> IO Int
size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainerRef_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainerRef__iter_init #-}

bindPackedDataContainerRef__iter_init :: MethodBind
bindPackedDataContainerRef__iter_init
  = unsafePerformIO $
      withCString "PackedDataContainerRef" $
        \ clsNamePtr ->
          withCString "_iter_init" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_iter_init ::
             (PackedDataContainerRef :< cls, Object :< cls) =>
             cls -> Array -> IO GodotVariant
_iter_init cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainerRef__iter_init
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainerRef__iter_get #-}

bindPackedDataContainerRef__iter_get :: MethodBind
bindPackedDataContainerRef__iter_get
  = unsafePerformIO $
      withCString "PackedDataContainerRef" $
        \ clsNamePtr ->
          withCString "_iter_get" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_iter_get ::
            (PackedDataContainerRef :< cls, Object :< cls) =>
            cls -> GodotVariant -> IO GodotVariant
_iter_get cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainerRef__iter_get
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainerRef__iter_next #-}

bindPackedDataContainerRef__iter_next :: MethodBind
bindPackedDataContainerRef__iter_next
  = unsafePerformIO $
      withCString "PackedDataContainerRef" $
        \ clsNamePtr ->
          withCString "_iter_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_iter_next ::
             (PackedDataContainerRef :< cls, Object :< cls) =>
             cls -> Array -> IO GodotVariant
_iter_next cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainerRef__iter_next
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainerRef__is_dictionary #-}

bindPackedDataContainerRef__is_dictionary :: MethodBind
bindPackedDataContainerRef__is_dictionary
  = unsafePerformIO $
      withCString "PackedDataContainerRef" $
        \ clsNamePtr ->
          withCString "_is_dictionary" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_is_dictionary ::
                 (PackedDataContainerRef :< cls, Object :< cls) => cls -> IO Bool
_is_dictionary cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainerRef__is_dictionary
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)