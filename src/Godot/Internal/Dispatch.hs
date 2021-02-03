{-# LANGUAGE UndecidableInstances #-}
module Godot.Internal.Dispatch(HasBaseClass(..),(:<)(..),Signal(..)) where
import Data.Text (Text)
import GHC.TypeLits as T
import Godot.Gdnative.Internal.Gdnative hiding (Signal)
import Language.Haskell.TH
import Language.Haskell.TH.Datatype
import Control.Monad
import Data.List
import Data.Kind as K

-- | Establishes 'child` as a child of BaseClass child`
class HasBaseClass child where
  type BaseClass child
  super :: child -> BaseClass child

-- | Subclass relation.
class parent :< child where
  upcast :: child -> parent

instance {-# OVERLAPPING #-} a :< a where
  upcast = id

instance {-# OVERLAPPABLE #-} (HasBaseClass child, parent :< BaseClass child) => parent :< child where
  upcast = upcast . super

newtype Signal a = Signal Text
  deriving (Show, Eq)
