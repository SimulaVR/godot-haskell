{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables #-}

module Project.Scenes.Mob where
import Project.Support
import Godot
import GHC.TypeLits


instance SceneNode        "Mob" "AnimatedSprite" where
  type SceneNodeType      "Mob" "AnimatedSprite" = AnimatedSprite
  type SceneNodeName      "Mob" "AnimatedSprite" = "AnimatedSprite"
  type SceneNodeIsHaskell "Mob" "AnimatedSprite" = 'Nothing


instance SceneNode        "Mob" "CollisionShape2D" where
  type SceneNodeType      "Mob" "CollisionShape2D" = CollisionShape2D
  type SceneNodeName      "Mob" "CollisionShape2D" = "CollisionShape2D"
  type SceneNodeIsHaskell "Mob" "CollisionShape2D" = 'Nothing


instance SceneNode        "Mob" "Mob" where
  type SceneNodeType      "Mob" "Mob" = RigidBody2D
  type SceneNodeName      "Mob" "Mob" = "Mob"
  type SceneNodeIsHaskell "Mob" "Mob" = 'Just '("Mob", "Mob")


instance SceneNode        "Mob" "VisibilityNotifier2D" where
  type SceneNodeType      "Mob" "VisibilityNotifier2D" = VisibilityNotifier2D
  type SceneNodeName      "Mob" "VisibilityNotifier2D" = "VisibilityNotifier2D"
  type SceneNodeIsHaskell "Mob" "VisibilityNotifier2D" = 'Nothing

