{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables #-}

module Project.Scenes.Main where
import Project.Support
import Godot
import GHC.TypeLits


instance SceneNode        "Main" "ColorRect" where
  type SceneNodeType      "Main" "ColorRect" = ColorRect
  type SceneNodeName      "Main" "ColorRect" = "ColorRect"
  type SceneNodeIsHaskell "Main" "ColorRect" = 'Nothing


instance SceneNode        "Main" "HUD" where
  type SceneNodeType      "Main" "HUD" = PackedScene
  type SceneNodeName      "Main" "HUD" = "HUD"
  type SceneNodeIsHaskell "Main" "HUD" = 'Just '("HUD", "HUD")


instance SceneNode        "Main" "Main" where
  type SceneNodeType      "Main" "Main" = Node
  type SceneNodeName      "Main" "Main" = "Main"
  type SceneNodeIsHaskell "Main" "Main" = 'Just '("Main", "Main")


instance SceneNode        "Main" "MobPath" where
  type SceneNodeType      "Main" "MobPath" = Path2D
  type SceneNodeName      "Main" "MobPath" = "MobPath"
  type SceneNodeIsHaskell "Main" "MobPath" = 'Nothing


instance SceneNode        "Main" "MobPath/MobSpawnLocation" where
  type SceneNodeType      "Main" "MobPath/MobSpawnLocation" = PathFollow2D
  type SceneNodeName      "Main" "MobPath/MobSpawnLocation" = "MobSpawnLocation"
  type SceneNodeIsHaskell "Main" "MobPath/MobSpawnLocation" = 'Nothing


instance SceneNode        "Main" "MobTimer" where
  type SceneNodeType      "Main" "MobTimer" = Timer
  type SceneNodeName      "Main" "MobTimer" = "MobTimer"
  type SceneNodeIsHaskell "Main" "MobTimer" = 'Nothing


instance SceneNode        "Main" "Player" where
  type SceneNodeType      "Main" "Player" = PackedScene
  type SceneNodeName      "Main" "Player" = "Player"
  type SceneNodeIsHaskell "Main" "Player" = 'Just '("Player", "Player")


instance SceneNode        "Main" "ScoreTimer" where
  type SceneNodeType      "Main" "ScoreTimer" = Timer
  type SceneNodeName      "Main" "ScoreTimer" = "ScoreTimer"
  type SceneNodeIsHaskell "Main" "ScoreTimer" = 'Nothing


instance SceneNode        "Main" "StartPosition" where
  type SceneNodeType      "Main" "StartPosition" = Position2D
  type SceneNodeName      "Main" "StartPosition" = "StartPosition"
  type SceneNodeIsHaskell "Main" "StartPosition" = 'Nothing


instance SceneNode        "Main" "StartTimer" where
  type SceneNodeType      "Main" "StartTimer" = Timer
  type SceneNodeName      "Main" "StartTimer" = "StartTimer"
  type SceneNodeIsHaskell "Main" "StartTimer" = 'Nothing

