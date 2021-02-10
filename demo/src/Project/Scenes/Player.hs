{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables #-}

module Project.Scenes.Player where
import Project.Support
import Godot
import GHC.TypeLits


instance SceneNode        "Player" "AnimatedSprite" where
  type SceneNodeType      "Player" "AnimatedSprite" = AnimatedSprite
  type SceneNodeName      "Player" "AnimatedSprite" = "AnimatedSprite"
  type SceneNodeIsHaskell "Player" "AnimatedSprite" = 'Nothing


instance SceneNode        "Player" "CollisionShape2D" where
  type SceneNodeType      "Player" "CollisionShape2D" = CollisionShape2D
  type SceneNodeName      "Player" "CollisionShape2D" = "CollisionShape2D"
  type SceneNodeIsHaskell "Player" "CollisionShape2D" = 'Nothing


instance SceneNode        "Player" "Player" where
  type SceneNodeType      "Player" "Player" = Area2D
  type SceneNodeName      "Player" "Player" = "Player"
  type SceneNodeIsHaskell "Player" "Player" = 'Just '("Player", "Player")

