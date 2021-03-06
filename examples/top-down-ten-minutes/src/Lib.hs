module Lib (exports) where
import Godot
import Project.Support
import Project.Requirements
import Game.World

exports :: GdnativeHandle -> IO ()
exports = registerAll' @Nodes @'[Bullet,Enemy,Player]
