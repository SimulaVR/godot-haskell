module Lib (exports) where
import Godot
import Game.Mob
import Game.Main
import Game.Player
import Game.HUD
import Project.Support
import Project.Requirements

exports :: GdnativeHandle -> IO ()
exports = registerAll' @Nodes @'[HUD, Main, Mob, Player]
