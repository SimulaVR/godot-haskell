{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses, OverloadedLabels, UndecidableInstances,
  OverloadedStrings, TemplateHaskell, TypeApplications, TypeFamilies, DataKinds, TypeOperators, FlexibleInstances #-}

module Generated.Support where
import Godot
import GHC.TypeLits

class SceneNode (scene :: Symbol) (s :: Symbol) where
  type SceneNodeType scene s :: *
  type SceneNodeName scene s :: Symbol

class NodeInScheme (scene :: Symbol) (s :: Symbol) n | scene s -> n, n -> scene s
