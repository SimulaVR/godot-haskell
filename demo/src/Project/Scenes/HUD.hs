{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables #-}

module Project.Scenes.HUD where
import Project.Support
import Godot
import GHC.TypeLits


instance SceneNode        "HUD" "HUD" where
  type SceneNodeType      "HUD" "HUD" = CanvasLayer
  type SceneNodeName      "HUD" "HUD" = "HUD"
  type SceneNodeIsHaskell "HUD" "HUD" = 'Just '("HUD", "HUD")


instance SceneNode        "HUD" "MessageLabel" where
  type SceneNodeType      "HUD" "MessageLabel" = Label
  type SceneNodeName      "HUD" "MessageLabel" = "MessageLabel"
  type SceneNodeIsHaskell "HUD" "MessageLabel" = 'Nothing


instance SceneNode        "HUD" "MessageTimer" where
  type SceneNodeType      "HUD" "MessageTimer" = Timer
  type SceneNodeName      "HUD" "MessageTimer" = "MessageTimer"
  type SceneNodeIsHaskell "HUD" "MessageTimer" = 'Nothing


instance SceneNode        "HUD" "ScoreLabel" where
  type SceneNodeType      "HUD" "ScoreLabel" = Label
  type SceneNodeName      "HUD" "ScoreLabel" = "ScoreLabel"
  type SceneNodeIsHaskell "HUD" "ScoreLabel" = 'Nothing


instance SceneNode        "HUD" "StartButton" where
  type SceneNodeType      "HUD" "StartButton" = Button
  type SceneNodeName      "HUD" "StartButton" = "StartButton"
  type SceneNodeIsHaskell "HUD" "StartButton" = 'Nothing

