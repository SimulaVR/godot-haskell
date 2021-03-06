module Game.HUD where
import Control.Lens
import Control.Monad
import qualified Data.Text as T
import Godot
import Godot.Core.CanvasItem as CanvasItem
import Godot.Core.Label as Label
import Godot.Core.Timer as Timer
import Project.Support
import Project.Scenes.HUD()

data HUD = HUD { _hBase :: CanvasLayer }

instance NodeInit HUD where
  init = pure . HUD
instance NodeMethod HUD "_on_MessageTimer_timeout" '[] (IO ()) where
  nodeMethod self = getNode' @"MessageLabel" self >>= CanvasItem.hide
instance NodeMethod HUD "_on_StartButton_pressed" '[] (IO ()) where
  nodeMethod self = do
    getNode' @"StartButton" self >>= CanvasItem.hide
    emit_signal' @"start_game" self []
instance NodeMethod HUD "show_message" '[GodotString] (IO ()) where
  nodeMethod = show_message
instance NodeMethod HUD "show_game_over" '[] (IO ()) where
  nodeMethod = show_game_over
instance NodeMethod HUD "update_score" '[Int] (IO ()) where
  nodeMethod = update_score
instance NodeSignal HUD "start_game" '[]

show_message :: HUD -> GodotString -> IO ()
show_message self text = do
  messageLabel <- getNode' @"MessageLabel" self 
  set_text messageLabel text
  CanvasItem.show messageLabel
  getNode' @"MessageTimer" self >>= (`Timer.start` Nothing)

show_game_over :: HUD -> IO ()
show_game_over self = do
  show_message self =<< toLowLevel "Game Over"
  await' @"MessageTimer" @"timeout" self $ \self' -> do
    messageLabel <- getNode' @"MessageLabel" self'
    set_text messageLabel =<< toLowLevel "Dodge the\nCreeps!"
    CanvasItem.show messageLabel
    getNode' @"StartButton" self' >>= CanvasItem.show
  pure ()

update_score :: HUD -> Int -> IO ()
update_score self score = do
  set_text
    <$> getNode' @"ScoreLabel" self 
    <*> toLowLevel (T.pack $ Prelude.show score)
    &   join

setupNode ''HUD "HUD" "HUD"
deriveBase ''HUD
