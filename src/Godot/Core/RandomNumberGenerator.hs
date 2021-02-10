{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RandomNumberGenerator
       (Godot.Core.RandomNumberGenerator.get_seed,
        Godot.Core.RandomNumberGenerator.randf,
        Godot.Core.RandomNumberGenerator.randf_range,
        Godot.Core.RandomNumberGenerator.randfn,
        Godot.Core.RandomNumberGenerator.randi,
        Godot.Core.RandomNumberGenerator.randi_range,
        Godot.Core.RandomNumberGenerator.randomize,
        Godot.Core.RandomNumberGenerator.set_seed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRandomNumberGenerator_get_seed #-}

-- | The seed used by the random number generator. A given seed will give a reproducible sequence of pseudo-random numbers.
--   			[b]Note:[/b] The RNG does not have an avalanche effect, and can output similar random streams given similar seeds. Consider using a hash function to improve your seed quality if they're sourced externally.
bindRandomNumberGenerator_get_seed :: MethodBind
bindRandomNumberGenerator_get_seed
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "get_seed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The seed used by the random number generator. A given seed will give a reproducible sequence of pseudo-random numbers.
--   			[b]Note:[/b] The RNG does not have an avalanche effect, and can output similar random streams given similar seeds. Consider using a hash function to improve your seed quality if they're sourced externally.
get_seed ::
           (RandomNumberGenerator :< cls, Object :< cls) => cls -> IO Int
get_seed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_get_seed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRandomNumberGenerator_randf #-}

-- | Generates a pseudo-random float between [code]0.0[/code] and [code]1.0[/code] (inclusive).
bindRandomNumberGenerator_randf :: MethodBind
bindRandomNumberGenerator_randf
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randf" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a pseudo-random float between [code]0.0[/code] and [code]1.0[/code] (inclusive).
randf ::
        (RandomNumberGenerator :< cls, Object :< cls) => cls -> IO Float
randf cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randf (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRandomNumberGenerator_randf_range #-}

-- | Generates a pseudo-random float between [code]from[/code] and [code]to[/code] (inclusive).
bindRandomNumberGenerator_randf_range :: MethodBind
bindRandomNumberGenerator_randf_range
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randf_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a pseudo-random float between [code]from[/code] and [code]to[/code] (inclusive).
randf_range ::
              (RandomNumberGenerator :< cls, Object :< cls) =>
              cls -> Float -> Float -> IO Float
randf_range cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randf_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRandomNumberGenerator_randfn #-}

-- | Generates a [url=https://en.wikipedia.org/wiki/Normal_distribution]normally-distributed[/url] pseudo-random number, using Box-Muller transform with the specified [code]mean[/code] and a standard [code]deviation[/code]. This is also called Gaussian distribution.
bindRandomNumberGenerator_randfn :: MethodBind
bindRandomNumberGenerator_randfn
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randfn" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a [url=https://en.wikipedia.org/wiki/Normal_distribution]normally-distributed[/url] pseudo-random number, using Box-Muller transform with the specified [code]mean[/code] and a standard [code]deviation[/code]. This is also called Gaussian distribution.
randfn ::
         (RandomNumberGenerator :< cls, Object :< cls) =>
         cls -> Float -> Float -> IO Float
randfn cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randfn
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRandomNumberGenerator_randi #-}

-- | Generates a pseudo-random 32-bit unsigned integer between [code]0[/code] and [code]4294967295[/code] (inclusive).
bindRandomNumberGenerator_randi :: MethodBind
bindRandomNumberGenerator_randi
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randi" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a pseudo-random 32-bit unsigned integer between [code]0[/code] and [code]4294967295[/code] (inclusive).
randi ::
        (RandomNumberGenerator :< cls, Object :< cls) => cls -> IO Int
randi cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randi (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRandomNumberGenerator_randi_range #-}

-- | Generates a pseudo-random 32-bit signed integer between [code]from[/code] and [code]to[/code] (inclusive).
bindRandomNumberGenerator_randi_range :: MethodBind
bindRandomNumberGenerator_randi_range
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randi_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a pseudo-random 32-bit signed integer between [code]from[/code] and [code]to[/code] (inclusive).
randi_range ::
              (RandomNumberGenerator :< cls, Object :< cls) =>
              cls -> Int -> Int -> IO Int
randi_range cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randi_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRandomNumberGenerator_randomize #-}

-- | Setups a time-based seed to generator.
bindRandomNumberGenerator_randomize :: MethodBind
bindRandomNumberGenerator_randomize
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randomize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Setups a time-based seed to generator.
randomize ::
            (RandomNumberGenerator :< cls, Object :< cls) => cls -> IO ()
randomize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randomize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRandomNumberGenerator_set_seed #-}

-- | The seed used by the random number generator. A given seed will give a reproducible sequence of pseudo-random numbers.
--   			[b]Note:[/b] The RNG does not have an avalanche effect, and can output similar random streams given similar seeds. Consider using a hash function to improve your seed quality if they're sourced externally.
bindRandomNumberGenerator_set_seed :: MethodBind
bindRandomNumberGenerator_set_seed
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "set_seed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The seed used by the random number generator. A given seed will give a reproducible sequence of pseudo-random numbers.
--   			[b]Note:[/b] The RNG does not have an avalanche effect, and can output similar random streams given similar seeds. Consider using a hash function to improve your seed quality if they're sourced externally.
set_seed ::
           (RandomNumberGenerator :< cls, Object :< cls) =>
           cls -> Int -> IO ()
set_seed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_set_seed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)