{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.GIProbeData
       (Godot.Core.GIProbeData.set_bounds,
        Godot.Core.GIProbeData.get_bounds,
        Godot.Core.GIProbeData.set_cell_size,
        Godot.Core.GIProbeData.get_cell_size,
        Godot.Core.GIProbeData.set_to_cell_xform,
        Godot.Core.GIProbeData.get_to_cell_xform,
        Godot.Core.GIProbeData.set_dynamic_data,
        Godot.Core.GIProbeData.get_dynamic_data,
        Godot.Core.GIProbeData.set_dynamic_range,
        Godot.Core.GIProbeData.get_dynamic_range,
        Godot.Core.GIProbeData.set_energy,
        Godot.Core.GIProbeData.get_energy, Godot.Core.GIProbeData.set_bias,
        Godot.Core.GIProbeData.get_bias,
        Godot.Core.GIProbeData.set_normal_bias,
        Godot.Core.GIProbeData.get_normal_bias,
        Godot.Core.GIProbeData.set_propagation,
        Godot.Core.GIProbeData.get_propagation,
        Godot.Core.GIProbeData.set_interior,
        Godot.Core.GIProbeData.is_interior,
        Godot.Core.GIProbeData.set_compress,
        Godot.Core.GIProbeData.is_compressed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindGIProbeData_set_bounds #-}

bindGIProbeData_set_bounds :: MethodBind
bindGIProbeData_set_bounds
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bounds ::
             (GIProbeData :< cls, Object :< cls) => cls -> Aabb -> IO ()
set_bounds cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_bounds (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_bounds #-}

bindGIProbeData_get_bounds :: MethodBind
bindGIProbeData_get_bounds
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bounds :: (GIProbeData :< cls, Object :< cls) => cls -> IO Aabb
get_bounds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_bounds (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_cell_size #-}

bindGIProbeData_set_cell_size :: MethodBind
bindGIProbeData_set_cell_size
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cell_size ::
                (GIProbeData :< cls, Object :< cls) => cls -> Float -> IO ()
set_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_cell_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_cell_size #-}

bindGIProbeData_get_cell_size :: MethodBind
bindGIProbeData_get_cell_size
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_size ::
                (GIProbeData :< cls, Object :< cls) => cls -> IO Float
get_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_cell_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_to_cell_xform #-}

bindGIProbeData_set_to_cell_xform :: MethodBind
bindGIProbeData_set_to_cell_xform
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_to_cell_xform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_to_cell_xform ::
                    (GIProbeData :< cls, Object :< cls) => cls -> Transform -> IO ()
set_to_cell_xform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_to_cell_xform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_to_cell_xform #-}

bindGIProbeData_get_to_cell_xform :: MethodBind
bindGIProbeData_get_to_cell_xform
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_to_cell_xform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_to_cell_xform ::
                    (GIProbeData :< cls, Object :< cls) => cls -> IO Transform
get_to_cell_xform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_to_cell_xform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_dynamic_data #-}

bindGIProbeData_set_dynamic_data :: MethodBind
bindGIProbeData_set_dynamic_data
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_dynamic_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_dynamic_data ::
                   (GIProbeData :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
set_dynamic_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_dynamic_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_dynamic_data #-}

bindGIProbeData_get_dynamic_data :: MethodBind
bindGIProbeData_get_dynamic_data
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_dynamic_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_dynamic_data ::
                   (GIProbeData :< cls, Object :< cls) => cls -> IO PoolIntArray
get_dynamic_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_dynamic_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_dynamic_range #-}

bindGIProbeData_set_dynamic_range :: MethodBind
bindGIProbeData_set_dynamic_range
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_dynamic_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_dynamic_range ::
                    (GIProbeData :< cls, Object :< cls) => cls -> Int -> IO ()
set_dynamic_range cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_dynamic_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_dynamic_range #-}

bindGIProbeData_get_dynamic_range :: MethodBind
bindGIProbeData_get_dynamic_range
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_dynamic_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_dynamic_range ::
                    (GIProbeData :< cls, Object :< cls) => cls -> IO Int
get_dynamic_range cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_dynamic_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_energy #-}

bindGIProbeData_set_energy :: MethodBind
bindGIProbeData_set_energy
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_energy ::
             (GIProbeData :< cls, Object :< cls) => cls -> Float -> IO ()
set_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_energy (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_energy #-}

bindGIProbeData_get_energy :: MethodBind
bindGIProbeData_get_energy
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_energy ::
             (GIProbeData :< cls, Object :< cls) => cls -> IO Float
get_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_energy (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_bias #-}

bindGIProbeData_set_bias :: MethodBind
bindGIProbeData_set_bias
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bias ::
           (GIProbeData :< cls, Object :< cls) => cls -> Float -> IO ()
set_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_bias (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_bias #-}

bindGIProbeData_get_bias :: MethodBind
bindGIProbeData_get_bias
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bias :: (GIProbeData :< cls, Object :< cls) => cls -> IO Float
get_bias cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_bias (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_normal_bias #-}

bindGIProbeData_set_normal_bias :: MethodBind
bindGIProbeData_set_normal_bias
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_normal_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_normal_bias ::
                  (GIProbeData :< cls, Object :< cls) => cls -> Float -> IO ()
set_normal_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_normal_bias (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_normal_bias #-}

bindGIProbeData_get_normal_bias :: MethodBind
bindGIProbeData_get_normal_bias
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_normal_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_normal_bias ::
                  (GIProbeData :< cls, Object :< cls) => cls -> IO Float
get_normal_bias cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_normal_bias (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_propagation #-}

bindGIProbeData_set_propagation :: MethodBind
bindGIProbeData_set_propagation
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_propagation ::
                  (GIProbeData :< cls, Object :< cls) => cls -> Float -> IO ()
set_propagation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_propagation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_get_propagation #-}

bindGIProbeData_get_propagation :: MethodBind
bindGIProbeData_get_propagation
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "get_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_propagation ::
                  (GIProbeData :< cls, Object :< cls) => cls -> IO Float
get_propagation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_get_propagation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_interior #-}

bindGIProbeData_set_interior :: MethodBind
bindGIProbeData_set_interior
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_interior ::
               (GIProbeData :< cls, Object :< cls) => cls -> Bool -> IO ()
set_interior cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_interior (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_is_interior #-}

bindGIProbeData_is_interior :: MethodBind
bindGIProbeData_is_interior
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "is_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_interior ::
              (GIProbeData :< cls, Object :< cls) => cls -> IO Bool
is_interior cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_is_interior (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_set_compress #-}

bindGIProbeData_set_compress :: MethodBind
bindGIProbeData_set_compress
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "set_compress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_compress ::
               (GIProbeData :< cls, Object :< cls) => cls -> Bool -> IO ()
set_compress cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_set_compress (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGIProbeData_is_compressed #-}

bindGIProbeData_is_compressed :: MethodBind
bindGIProbeData_is_compressed
  = unsafePerformIO $
      withCString "GIProbeData" $
        \ clsNamePtr ->
          withCString "is_compressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_compressed ::
                (GIProbeData :< cls, Object :< cls) => cls -> IO Bool
is_compressed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGIProbeData_is_compressed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)