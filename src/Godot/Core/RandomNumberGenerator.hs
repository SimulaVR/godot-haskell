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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

instance NodeProperty RandomNumberGenerator "seed" Int 'False where
        nodeProperty = (get_seed, wrapDroppingSetter set_seed, Nothing)

{-# NOINLINE bindRandomNumberGenerator_get_seed #-}

-- | Initializes the random number generator state based on the given seed value. A given seed will give a reproducible sequence of pseudo-random numbers.
--   			__Note:__ The RNG does not have an avalanche effect, and can output similar random streams given similar seeds. Consider using a hash function to improve your seed quality if they're sourced externally.
--   			__Note:__ Setting this property produces a side effect of changing the internal @state@, so make sure to initialize the seed @i@before@/i@ modifying the @state@:
--   			
--   @
--   
--   			var rng = RandomNumberGenerator.new()
--   			rng.seed = hash("Godot")
--   			rng.state = 100 # Restore to some previously saved state.
--   			
--   @
--   
--   			__Warning:__ the getter of this property returns the previous @state@, and not the initial seed value, which is going to be fixed in Godot 4.0.
bindRandomNumberGenerator_get_seed :: MethodBind
bindRandomNumberGenerator_get_seed
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "get_seed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the random number generator state based on the given seed value. A given seed will give a reproducible sequence of pseudo-random numbers.
--   			__Note:__ The RNG does not have an avalanche effect, and can output similar random streams given similar seeds. Consider using a hash function to improve your seed quality if they're sourced externally.
--   			__Note:__ Setting this property produces a side effect of changing the internal @state@, so make sure to initialize the seed @i@before@/i@ modifying the @state@:
--   			
--   @
--   
--   			var rng = RandomNumberGenerator.new()
--   			rng.seed = hash("Godot")
--   			rng.state = 100 # Restore to some previously saved state.
--   			
--   @
--   
--   			__Warning:__ the getter of this property returns the previous @state@, and not the initial seed value, which is going to be fixed in Godot 4.0.
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

instance NodeMethod RandomNumberGenerator "get_seed" '[] (IO Int)
         where
        nodeMethod = Godot.Core.RandomNumberGenerator.get_seed

{-# NOINLINE bindRandomNumberGenerator_randf #-}

-- | Generates a pseudo-random float between @0.0@ and @1.0@ (inclusive).
bindRandomNumberGenerator_randf :: MethodBind
bindRandomNumberGenerator_randf
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randf" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a pseudo-random float between @0.0@ and @1.0@ (inclusive).
randf ::
        (RandomNumberGenerator :< cls, Object :< cls) => cls -> IO Float
randf cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randf (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RandomNumberGenerator "randf" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RandomNumberGenerator.randf

{-# NOINLINE bindRandomNumberGenerator_randf_range #-}

-- | Generates a pseudo-random float between @from@ and @to@ (inclusive).
bindRandomNumberGenerator_randf_range :: MethodBind
bindRandomNumberGenerator_randf_range
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randf_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a pseudo-random float between @from@ and @to@ (inclusive).
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

instance NodeMethod RandomNumberGenerator "randf_range"
           '[Float, Float]
           (IO Float)
         where
        nodeMethod = Godot.Core.RandomNumberGenerator.randf_range

{-# NOINLINE bindRandomNumberGenerator_randfn #-}

-- | Generates a @url=https://en.wikipedia.org/wiki/Normal_distribution@normally-distributed@/url@ pseudo-random number, using Box-Muller transform with the specified @mean@ and a standard @deviation@. This is also called Gaussian distribution.
bindRandomNumberGenerator_randfn :: MethodBind
bindRandomNumberGenerator_randfn
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randfn" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a @url=https://en.wikipedia.org/wiki/Normal_distribution@normally-distributed@/url@ pseudo-random number, using Box-Muller transform with the specified @mean@ and a standard @deviation@. This is also called Gaussian distribution.
randfn ::
         (RandomNumberGenerator :< cls, Object :< cls) =>
         cls -> Maybe Float -> Maybe Float -> IO Float
randfn cls arg1 arg2
  = withVariantArray
      [maybe (VariantReal (0)) toVariant arg1,
       maybe (VariantReal (1)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randfn
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RandomNumberGenerator "randfn"
           '[Maybe Float, Maybe Float]
           (IO Float)
         where
        nodeMethod = Godot.Core.RandomNumberGenerator.randfn

{-# NOINLINE bindRandomNumberGenerator_randi #-}

-- | Generates a pseudo-random 32-bit unsigned integer between @0@ and @4294967295@ (inclusive).
bindRandomNumberGenerator_randi :: MethodBind
bindRandomNumberGenerator_randi
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randi" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a pseudo-random 32-bit unsigned integer between @0@ and @4294967295@ (inclusive).
randi ::
        (RandomNumberGenerator :< cls, Object :< cls) => cls -> IO Int
randi cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRandomNumberGenerator_randi (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RandomNumberGenerator "randi" '[] (IO Int)
         where
        nodeMethod = Godot.Core.RandomNumberGenerator.randi

{-# NOINLINE bindRandomNumberGenerator_randi_range #-}

-- | Generates a pseudo-random 32-bit signed integer between @from@ and @to@ (inclusive).
bindRandomNumberGenerator_randi_range :: MethodBind
bindRandomNumberGenerator_randi_range
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "randi_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a pseudo-random 32-bit signed integer between @from@ and @to@ (inclusive).
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

instance NodeMethod RandomNumberGenerator "randi_range" '[Int, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.RandomNumberGenerator.randi_range

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

instance NodeMethod RandomNumberGenerator "randomize" '[] (IO ())
         where
        nodeMethod = Godot.Core.RandomNumberGenerator.randomize

{-# NOINLINE bindRandomNumberGenerator_set_seed #-}

-- | Initializes the random number generator state based on the given seed value. A given seed will give a reproducible sequence of pseudo-random numbers.
--   			__Note:__ The RNG does not have an avalanche effect, and can output similar random streams given similar seeds. Consider using a hash function to improve your seed quality if they're sourced externally.
--   			__Note:__ Setting this property produces a side effect of changing the internal @state@, so make sure to initialize the seed @i@before@/i@ modifying the @state@:
--   			
--   @
--   
--   			var rng = RandomNumberGenerator.new()
--   			rng.seed = hash("Godot")
--   			rng.state = 100 # Restore to some previously saved state.
--   			
--   @
--   
--   			__Warning:__ the getter of this property returns the previous @state@, and not the initial seed value, which is going to be fixed in Godot 4.0.
bindRandomNumberGenerator_set_seed :: MethodBind
bindRandomNumberGenerator_set_seed
  = unsafePerformIO $
      withCString "RandomNumberGenerator" $
        \ clsNamePtr ->
          withCString "set_seed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the random number generator state based on the given seed value. A given seed will give a reproducible sequence of pseudo-random numbers.
--   			__Note:__ The RNG does not have an avalanche effect, and can output similar random streams given similar seeds. Consider using a hash function to improve your seed quality if they're sourced externally.
--   			__Note:__ Setting this property produces a side effect of changing the internal @state@, so make sure to initialize the seed @i@before@/i@ modifying the @state@:
--   			
--   @
--   
--   			var rng = RandomNumberGenerator.new()
--   			rng.seed = hash("Godot")
--   			rng.state = 100 # Restore to some previously saved state.
--   			
--   @
--   
--   			__Warning:__ the getter of this property returns the previous @state@, and not the initial seed value, which is going to be fixed in Godot 4.0.
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

instance NodeMethod RandomNumberGenerator "set_seed" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.RandomNumberGenerator.set_seed