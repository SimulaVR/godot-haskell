-- | This file is AUTOGENERATED by godot-haskell-project-generator. DO NOT EDIT

{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables, DerivingStrategies,
  GeneralizedNewtypeDeriving, LambdaCase #-}

module Project.Scenes.Enemy where
import Project.Support
import Godot
import GHC.TypeLits

import Godot.Core.Area2D()
import Godot.Core.CollisionShape2D()
import Godot.Core.KinematicBody2D()
import Godot.Core.Sprite()

instance SceneResourcePath "Enemy" where
  sceneResourcePath = "res://Enemy.tscn"


instance SceneRoot "Enemy" where
  type SceneRootNode "Enemy" = "Enemy"


instance SceneNode        "Enemy" "Area2D" where
  type SceneNodeType      "Enemy" "Area2D" = Area2D
  type SceneNodeName      "Enemy" "Area2D" = "Area2D"
  type SceneNodeIsHaskell "Enemy" "Area2D" = 'Nothing


instance SceneNode        "Enemy" "Area2D/CollisionShape2D" where
  type SceneNodeType      "Enemy" "Area2D/CollisionShape2D" = CollisionShape2D
  type SceneNodeName      "Enemy" "Area2D/CollisionShape2D" = "CollisionShape2D"
  type SceneNodeIsHaskell "Enemy" "Area2D/CollisionShape2D" = 'Nothing


instance SceneNode        "Enemy" "Enemy" where
  type SceneNodeType      "Enemy" "Enemy" = KinematicBody2D
  type SceneNodeName      "Enemy" "Enemy" = "Enemy"
  type SceneNodeIsHaskell "Enemy" "Enemy" = 'Just '("Enemy", "Enemy")


instance SceneNode        "Enemy" "Sprite" where
  type SceneNodeType      "Enemy" "Sprite" = Sprite
  type SceneNodeName      "Enemy" "Sprite" = "Sprite"
  type SceneNodeIsHaskell "Enemy" "Sprite" = 'Nothing


instance SceneConnection "Enemy" "Area2D" "body_entered" "Enemy" "_on_Area2D_body_entered"
