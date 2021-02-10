{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.OpenSimplexNoise
       (Godot.Core.OpenSimplexNoise.get_image,
        Godot.Core.OpenSimplexNoise.get_lacunarity,
        Godot.Core.OpenSimplexNoise.get_noise_1d,
        Godot.Core.OpenSimplexNoise.get_noise_2d,
        Godot.Core.OpenSimplexNoise.get_noise_2dv,
        Godot.Core.OpenSimplexNoise.get_noise_3d,
        Godot.Core.OpenSimplexNoise.get_noise_3dv,
        Godot.Core.OpenSimplexNoise.get_noise_4d,
        Godot.Core.OpenSimplexNoise.get_octaves,
        Godot.Core.OpenSimplexNoise.get_period,
        Godot.Core.OpenSimplexNoise.get_persistence,
        Godot.Core.OpenSimplexNoise.get_seamless_image,
        Godot.Core.OpenSimplexNoise.get_seed,
        Godot.Core.OpenSimplexNoise.set_lacunarity,
        Godot.Core.OpenSimplexNoise.set_octaves,
        Godot.Core.OpenSimplexNoise.set_period,
        Godot.Core.OpenSimplexNoise.set_persistence,
        Godot.Core.OpenSimplexNoise.set_seed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindOpenSimplexNoise_get_image #-}

bindOpenSimplexNoise_get_image :: MethodBind
bindOpenSimplexNoise_get_image
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_image ::
            (OpenSimplexNoise :< cls, Object :< cls) =>
            cls -> Int -> Int -> IO Image
get_image cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_image (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_lacunarity #-}

bindOpenSimplexNoise_get_lacunarity :: MethodBind
bindOpenSimplexNoise_get_lacunarity
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_lacunarity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_lacunarity ::
                 (OpenSimplexNoise :< cls, Object :< cls) => cls -> IO Float
get_lacunarity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_lacunarity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_noise_1d #-}

bindOpenSimplexNoise_get_noise_1d :: MethodBind
bindOpenSimplexNoise_get_noise_1d
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_noise_1d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_noise_1d ::
               (OpenSimplexNoise :< cls, Object :< cls) =>
               cls -> Float -> IO Float
get_noise_1d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_noise_1d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_noise_2d #-}

bindOpenSimplexNoise_get_noise_2d :: MethodBind
bindOpenSimplexNoise_get_noise_2d
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_noise_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_noise_2d ::
               (OpenSimplexNoise :< cls, Object :< cls) =>
               cls -> Float -> Float -> IO Float
get_noise_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_noise_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_noise_2dv #-}

bindOpenSimplexNoise_get_noise_2dv :: MethodBind
bindOpenSimplexNoise_get_noise_2dv
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_noise_2dv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_noise_2dv ::
                (OpenSimplexNoise :< cls, Object :< cls) =>
                cls -> Vector2 -> IO Float
get_noise_2dv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_noise_2dv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_noise_3d #-}

bindOpenSimplexNoise_get_noise_3d :: MethodBind
bindOpenSimplexNoise_get_noise_3d
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_noise_3d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_noise_3d ::
               (OpenSimplexNoise :< cls, Object :< cls) =>
               cls -> Float -> Float -> Float -> IO Float
get_noise_3d cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_noise_3d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_noise_3dv #-}

bindOpenSimplexNoise_get_noise_3dv :: MethodBind
bindOpenSimplexNoise_get_noise_3dv
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_noise_3dv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_noise_3dv ::
                (OpenSimplexNoise :< cls, Object :< cls) =>
                cls -> Vector3 -> IO Float
get_noise_3dv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_noise_3dv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_noise_4d #-}

bindOpenSimplexNoise_get_noise_4d :: MethodBind
bindOpenSimplexNoise_get_noise_4d
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_noise_4d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_noise_4d ::
               (OpenSimplexNoise :< cls, Object :< cls) =>
               cls -> Float -> Float -> Float -> Float -> IO Float
get_noise_4d cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_noise_4d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_octaves #-}

bindOpenSimplexNoise_get_octaves :: MethodBind
bindOpenSimplexNoise_get_octaves
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_octaves" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_octaves ::
              (OpenSimplexNoise :< cls, Object :< cls) => cls -> IO Int
get_octaves cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_octaves
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_period #-}

bindOpenSimplexNoise_get_period :: MethodBind
bindOpenSimplexNoise_get_period
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_period" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_period ::
             (OpenSimplexNoise :< cls, Object :< cls) => cls -> IO Float
get_period cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_period (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_persistence #-}

bindOpenSimplexNoise_get_persistence :: MethodBind
bindOpenSimplexNoise_get_persistence
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_persistence" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_persistence ::
                  (OpenSimplexNoise :< cls, Object :< cls) => cls -> IO Float
get_persistence cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_persistence
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_seamless_image #-}

bindOpenSimplexNoise_get_seamless_image :: MethodBind
bindOpenSimplexNoise_get_seamless_image
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_seamless_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_seamless_image ::
                     (OpenSimplexNoise :< cls, Object :< cls) => cls -> Int -> IO Image
get_seamless_image cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_seamless_image
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_get_seed #-}

bindOpenSimplexNoise_get_seed :: MethodBind
bindOpenSimplexNoise_get_seed
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "get_seed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_seed ::
           (OpenSimplexNoise :< cls, Object :< cls) => cls -> IO Int
get_seed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_get_seed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_set_lacunarity #-}

bindOpenSimplexNoise_set_lacunarity :: MethodBind
bindOpenSimplexNoise_set_lacunarity
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "set_lacunarity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_lacunarity ::
                 (OpenSimplexNoise :< cls, Object :< cls) => cls -> Float -> IO ()
set_lacunarity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_set_lacunarity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_set_octaves #-}

bindOpenSimplexNoise_set_octaves :: MethodBind
bindOpenSimplexNoise_set_octaves
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "set_octaves" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_octaves ::
              (OpenSimplexNoise :< cls, Object :< cls) => cls -> Int -> IO ()
set_octaves cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_set_octaves
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_set_period #-}

bindOpenSimplexNoise_set_period :: MethodBind
bindOpenSimplexNoise_set_period
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "set_period" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_period ::
             (OpenSimplexNoise :< cls, Object :< cls) => cls -> Float -> IO ()
set_period cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_set_period (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_set_persistence #-}

bindOpenSimplexNoise_set_persistence :: MethodBind
bindOpenSimplexNoise_set_persistence
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "set_persistence" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_persistence ::
                  (OpenSimplexNoise :< cls, Object :< cls) => cls -> Float -> IO ()
set_persistence cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_set_persistence
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOpenSimplexNoise_set_seed #-}

bindOpenSimplexNoise_set_seed :: MethodBind
bindOpenSimplexNoise_set_seed
  = unsafePerformIO $
      withCString "OpenSimplexNoise" $
        \ clsNamePtr ->
          withCString "set_seed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_seed ::
           (OpenSimplexNoise :< cls, Object :< cls) => cls -> Int -> IO ()
set_seed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOpenSimplexNoise_set_seed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)