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
import Godot.Internal.Dispatch(NodeSignal)

data HUD = HUD { _hBase :: CanvasLayer }

instance HasBaseClass HUD where
  type BaseClass HUD = CanvasLayer
  super = _hBase
instance NodeInScene "HUD" "HUD" HUD
instance NodeSignal HUD "start_game" '[]
instance NativeScript HUD where
  classInit base = pure $ HUD base
  classMethods =
    [ method1 "show_message" show_message
    , method0 "show_game_over" show_game_over
    , method1 "update_score" update_score
    , method0 "_on_StartButton_pressed" _on_StartButton_pressed
    , method0 "_on_MessageTimer_timeout" _on_MessageTimer_timeout
    ]
  classSignals = [signal "start_game" []]

show_message :: HUD -> GodotString -> IO ()
show_message self text = do
  messageLabel <- getNode' @"MessageLabel" self 
  set_text messageLabel text
  CanvasItem.show messageLabel
  getNode' @"MessageTimer" self >>= (`Timer.start` (-1))

show_game_over :: HUD -> IO Int
show_game_over self = do
  show_message self =<< toLowLevel "Game Over"
  timer <- getNode' @"MessageTimer" self 
  await self timer "timeout" $ \self' -> do
    messageLabel <- getNode' @"MessageLabel" self'
    set_text messageLabel =<< toLowLevel "Dodge the\nCreeps!"
    CanvasItem.show messageLabel
    getNode' @"StartButton" self' >>= CanvasItem.show

update_score :: HUD -> Int -> IO ()
update_score self score = do
  set_text
    <$> getNode' @"ScoreLabel" self 
    <*> toLowLevel (T.pack $ Prelude.show score)
    &   join

_on_StartButton_pressed :: HUD -> IO ()
_on_StartButton_pressed self = do
  getNode' @"StartButton" self >>= CanvasItem.hide
  emit_signal' @"start_game" self []

_on_MessageTimer_timeout :: HUD -> IO ()
_on_MessageTimer_timeout self = do
  getNode' @"MessageLabel" self  >>= CanvasItem.hide

deriveBase ''HUD
