module Lib (exports) where
import Godot
import Project.Support
import Project.Requirements
import Game.RSSReader

exports :: GdnativeHandle -> IO ()
exports = registerAll' @Nodes @'[RSSReader]
