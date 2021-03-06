-- | This file is AUTOGENERATED by godot-haskell-project-generator. DO NOT EDIT

{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables, DerivingStrategies,
  GeneralizedNewtypeDeriving, LambdaCase #-}

module Project.Scenes.Rss_reader where
import Project.Support
import Godot
import GHC.TypeLits

import Godot.Core.Button()
import Godot.Core.TextEdit()
import Godot.Core.HTTPRequest()
import Godot.Core.ItemList()
import Godot.Core.Label()
import Godot.Core.LinkButton()
import Godot.Core.Control()
import Godot.Core.LineEdit()
import Godot.Core.WindowDialog()

instance SceneResourcePath "Rss_reader" where
  sceneResourcePath = "res://Rss_reader.tscn"


instance SceneRoot "Rss_reader" where
  type SceneRootNode "Rss_reader" = "RSSReader"


instance SceneNode        "Rss_reader" "SettingsDialog/Button" where
  type SceneNodeType      "Rss_reader" "SettingsDialog/Button" = Button
  type SceneNodeName      "Rss_reader" "SettingsDialog/Button" = "Button"
  type SceneNodeIsHaskell "Rss_reader" "SettingsDialog/Button" = 'Nothing


instance SceneNode        "Rss_reader" "DescriptionField" where
  type SceneNodeType      "Rss_reader" "DescriptionField" = TextEdit
  type SceneNodeName      "Rss_reader" "DescriptionField" = "DescriptionField"
  type SceneNodeIsHaskell "Rss_reader" "DescriptionField" = 'Nothing


instance SceneNode        "Rss_reader" "HTTPRequest" where
  type SceneNodeType      "Rss_reader" "HTTPRequest" = HTTPRequest
  type SceneNodeName      "Rss_reader" "HTTPRequest" = "HTTPRequest"
  type SceneNodeIsHaskell "Rss_reader" "HTTPRequest" = 'Nothing


instance SceneNode        "Rss_reader" "ItemList" where
  type SceneNodeType      "Rss_reader" "ItemList" = ItemList
  type SceneNodeName      "Rss_reader" "ItemList" = "ItemList"
  type SceneNodeIsHaskell "Rss_reader" "ItemList" = 'Nothing


instance SceneNode        "Rss_reader" "SettingsDialog/Label" where
  type SceneNodeType      "Rss_reader" "SettingsDialog/Label" = Label
  type SceneNodeName      "Rss_reader" "SettingsDialog/Label" = "Label"
  type SceneNodeIsHaskell "Rss_reader" "SettingsDialog/Label" = 'Nothing


instance SceneNode        "Rss_reader" "LinkButton" where
  type SceneNodeType      "Rss_reader" "LinkButton" = LinkButton
  type SceneNodeName      "Rss_reader" "LinkButton" = "LinkButton"
  type SceneNodeIsHaskell "Rss_reader" "LinkButton" = 'Nothing


instance SceneNode        "Rss_reader" "OpenButton" where
  type SceneNodeType      "Rss_reader" "OpenButton" = Button
  type SceneNodeName      "Rss_reader" "OpenButton" = "OpenButton"
  type SceneNodeIsHaskell "Rss_reader" "OpenButton" = 'Nothing


instance SceneNode        "Rss_reader" "RSSReader" where
  type SceneNodeType      "Rss_reader" "RSSReader" = Control
  type SceneNodeName      "Rss_reader" "RSSReader" = "RSSReader"
  type SceneNodeIsHaskell "Rss_reader" "RSSReader" = 'Just '("Rss_reader", "RSSReader")


instance SceneNode        "Rss_reader" "SettingsDialog/RSSURLText" where
  type SceneNodeType      "Rss_reader" "SettingsDialog/RSSURLText" = LineEdit
  type SceneNodeName      "Rss_reader" "SettingsDialog/RSSURLText" = "RSSURLText"
  type SceneNodeIsHaskell "Rss_reader" "SettingsDialog/RSSURLText" = 'Nothing


instance SceneNode        "Rss_reader" "SettingsDialog/SaveButton" where
  type SceneNodeType      "Rss_reader" "SettingsDialog/SaveButton" = Button
  type SceneNodeName      "Rss_reader" "SettingsDialog/SaveButton" = "SaveButton"
  type SceneNodeIsHaskell "Rss_reader" "SettingsDialog/SaveButton" = 'Nothing


instance SceneNode        "Rss_reader" "SettingsButton" where
  type SceneNodeType      "Rss_reader" "SettingsButton" = Button
  type SceneNodeName      "Rss_reader" "SettingsButton" = "SettingsButton"
  type SceneNodeIsHaskell "Rss_reader" "SettingsButton" = 'Nothing


instance SceneNode        "Rss_reader" "SettingsDialog" where
  type SceneNodeType      "Rss_reader" "SettingsDialog" = WindowDialog
  type SceneNodeName      "Rss_reader" "SettingsDialog" = "SettingsDialog"
  type SceneNodeIsHaskell "Rss_reader" "SettingsDialog" = 'Nothing


instance SceneNode        "Rss_reader" "TextEdit" where
  type SceneNodeType      "Rss_reader" "TextEdit" = TextEdit
  type SceneNodeName      "Rss_reader" "TextEdit" = "TextEdit"
  type SceneNodeIsHaskell "Rss_reader" "TextEdit" = 'Nothing


instance SceneConnection "Rss_reader" "SettingsDialog/SaveButton" "pressed" "RSSReader" "_on_SaveButton_pressed"


instance SceneConnection "Rss_reader" "SettingsDialog/Button" "pressed" "RSSReader" "_on_Settings_Clear_Button_pressed"


instance SceneConnection "Rss_reader" "SettingsButton" "pressed" "RSSReader" "_on_SettingsButton_pressed"


instance SceneConnection "Rss_reader" "LinkButton" "pressed" "RSSReader" "_on_LinkButton_pressed"


instance SceneConnection "Rss_reader" "ItemList" "item_selected" "RSSReader" "_on_ItemList_item_selected"


instance SceneConnection "Rss_reader" "HTTPRequest" "request_completed" "RSSReader" "_on_HTTPRequest_request_completed"


instance SceneConnection "Rss_reader" "OpenButton" "pressed" "RSSReader" "_on_OpenButton_pressed"


instance SceneConnection "Rss_reader" "RSSReader" "ready" "RSSReader" "_on_RSSReader_ready"

