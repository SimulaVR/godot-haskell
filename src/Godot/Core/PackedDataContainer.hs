{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.PackedDataContainer
       (Godot.Core.PackedDataContainer._get_data,
        Godot.Core.PackedDataContainer._iter_get,
        Godot.Core.PackedDataContainer._iter_init,
        Godot.Core.PackedDataContainer._iter_next,
        Godot.Core.PackedDataContainer._set_data,
        Godot.Core.PackedDataContainer.pack,
        Godot.Core.PackedDataContainer.size)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPackedDataContainer__get_data #-}

bindPackedDataContainer__get_data :: MethodBind
bindPackedDataContainer__get_data
  = unsafePerformIO $
      withCString "PackedDataContainer" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_data ::
            (PackedDataContainer :< cls, Object :< cls) =>
            cls -> IO PoolByteArray
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainer__get_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainer__iter_get #-}

bindPackedDataContainer__iter_get :: MethodBind
bindPackedDataContainer__iter_get
  = unsafePerformIO $
      withCString "PackedDataContainer" $
        \ clsNamePtr ->
          withCString "_iter_get" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_iter_get ::
            (PackedDataContainer :< cls, Object :< cls) =>
            cls -> GodotVariant -> IO GodotVariant
_iter_get cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainer__iter_get
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainer__iter_init #-}

bindPackedDataContainer__iter_init :: MethodBind
bindPackedDataContainer__iter_init
  = unsafePerformIO $
      withCString "PackedDataContainer" $
        \ clsNamePtr ->
          withCString "_iter_init" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_iter_init ::
             (PackedDataContainer :< cls, Object :< cls) =>
             cls -> Array -> IO GodotVariant
_iter_init cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainer__iter_init
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainer__iter_next #-}

bindPackedDataContainer__iter_next :: MethodBind
bindPackedDataContainer__iter_next
  = unsafePerformIO $
      withCString "PackedDataContainer" $
        \ clsNamePtr ->
          withCString "_iter_next" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_iter_next ::
             (PackedDataContainer :< cls, Object :< cls) =>
             cls -> Array -> IO GodotVariant
_iter_next cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainer__iter_next
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainer__set_data #-}

bindPackedDataContainer__set_data :: MethodBind
bindPackedDataContainer__set_data
  = unsafePerformIO $
      withCString "PackedDataContainer" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_data ::
            (PackedDataContainer :< cls, Object :< cls) =>
            cls -> PoolByteArray -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainer__set_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainer_pack #-}

bindPackedDataContainer_pack :: MethodBind
bindPackedDataContainer_pack
  = unsafePerformIO $
      withCString "PackedDataContainer" $
        \ clsNamePtr ->
          withCString "pack" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

pack ::
       (PackedDataContainer :< cls, Object :< cls) =>
       cls -> GodotVariant -> IO Int
pack cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainer_pack (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPackedDataContainer_size #-}

bindPackedDataContainer_size :: MethodBind
bindPackedDataContainer_size
  = unsafePerformIO $
      withCString "PackedDataContainer" $
        \ clsNamePtr ->
          withCString "size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

size ::
       (PackedDataContainer :< cls, Object :< cls) => cls -> IO Int
size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedDataContainer_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)