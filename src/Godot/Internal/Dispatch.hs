{-# LANGUAGE UndecidableInstances, AllowAmbiguousTypes #-}
module Godot.Internal.Dispatch where
import Data.Kind
import Data.Proxy
import Data.Text (Text)
import GHC.TypeLits

class HasBaseClass child where
  type BaseClass child
  super :: child -> BaseClass child

class parent :< child where
  safeCast :: child -> parent

instance {-# OVERLAPPING #-} refl :< refl where
  safeCast = id

instance {-# OVERLAPPABLE #-} (HasBaseClass c, pp :< BaseClass c) => pp :< c where
  safeCast = safeCast .  super

-- |A class method 'name', overriden in 'cls', with signature 'sig'
-- |Attempts to emulate C++/Godot's "virtual" single dispatch
class Method (name :: Symbol) cls sig | cls name -> sig where
  runMethod :: cls -> sig

instance {-# OVERLAPPABLE #-} (Method name (BaseClass child) sig, HasBaseClass child) 
    => Method name child sig where
  runMethod = runMethod @name . super

{-
type family RemArgs sig where
  RemArgs (x -> res) = x : RemArgs res
  RemArgs a = '[]

-- |A small utility typeclass to determine whether 
-- | * a method signature is compatible with the signal arguments
-- | * ensuring that all other arguments are passed, too,
-- |   by calculating the remaining args
type family SignalCompatibleSig (varargs :: Bool) (args :: [Type]) sig :: [Type] where
  SignalCompatibleSig [] sig = RemArgs sig
  SignalCompatibleSig (x:xs) (x -> sig) = SignalCompatibleSig xs sig

class AsVariant x where
  toVariant :: x -> Variant 'GodotTy
  fromVariant :: Variant 'GodotTy -> Maybe x

data VariantList (xs :: '[Type]) where
  VNil :: VariantList '[]
  VCons :: AsVariant x => x -> VariantList xs -> VariantList (x:xs)

-- |A signal. You can connect a signal iff the class has a compatible method.
class Signal (name :: Symbol) source (args :: '[Type]) | source name -> args where
  connectSignal :: (Method mtdName cls sig, (SignalCompatibleSig args sig) ~ remArgs) => 
-}

newtype Signal a = Signal Text
  deriving (Show, Eq)