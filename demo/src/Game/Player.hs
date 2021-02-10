module Game.Player where
import           Control.Lens
import           Control.Monad
import           Godot
import           Godot.Core.AnimatedSprite as AnimatedSprite
import           Godot.Core.CanvasItem as CanvasItem
import           Godot.Core.CollisionShape2D as CollisionShape2D
import           Godot.Core.Input as Input
import           Godot.Core.Node2D as Node2D
import           Godot.Core.Object as Object
import           Godot.Gdnative
import           Linear.Metric (normalize)
import           Linear.V2
import           Linear.Vector
import Project.Support
import Project.Scenes.Player()
import Godot.Internal.Dispatch(NodeSignal)

data Player = Player
  { _pBase :: Area2D
  , _pSpeed :: MVar Float
  , _pScreenSize :: MVar (V2 Float)
  }

instance HasBaseClass Player where
  type BaseClass Player = Area2D
  super = _pBase
instance NodeInScene "Player" "Player" Player
instance NodeSignal Player "hit" '[]
instance NativeScript Player where
  classInit base = Player base <$> newMVar 400 <*> newMVar zero
  classMethods =
    [ method0 "_ready" player_ready
    , method1 "_process" player_process
    , method1 "_on_Player_body_entered" on_Player_body_entered
    , method1 "start" player_start
    ]
  classProperties = [createMVarProperty "speed" _pSpeed (Right 400)]
  classSignals = [signal' @Player @"hit"]

player_ready :: Player -> IO ()
player_ready self = do
  screenRect <- get_viewport_rect self >>= fromLowLevel
  void $ swapMVar (_pScreenSize self) (screenRect ^. _y)
  hide self

player_start :: Player -> Vector2 -> IO ()
player_start self pos = do
  set_position self pos
  CanvasItem.show self
  getNode' @"CollisionShape2D" self >>= (`set_disabled` False)

player_process :: Player -> Float -> IO ()
player_process self delta = do
  animSprite              <- getNode' @"AnimatedSprite" self 
  screenSize              <- get_viewport_rect self >>= fromLowLevel <&> (^. _y)
  [left, right, up, down] <- do
    Just inp <- getSingleton @Input
    let isActionPressed = is_action_pressed inp <=< toLowLevel
    mapM isActionPressed ["ui_left", "ui_right", "ui_up", "ui_down"]
  let velocity =
        let bVal b v = if b then v else 0
        in  V2 (bVal left (-1) + bVal right 1) (bVal up (-1) + bVal down 1)
  if velocity /= zero
    then do
      speed <- readMVar (_pSpeed self)
      pos   <- get_position self >>= fromLowLevel
      let velocity' = normalize velocity ^* speed
          pos'      = pos + velocity' ^* delta
          clamp v a b = max a (min b v)
          newPos =
            let posX = clamp (pos' ^. _x) 0 (screenSize ^. _x)
                posY = clamp (pos' ^. _y) 0 (screenSize ^. _y)
            in  V2 posX posY
      set_position self =<< toLowLevel newPos
      animationName <- toLowLevel ""
      play animSprite animationName False
      if velocity' ^. _x /= 0
        then do
          set_animation animSprite =<< toLowLevel "right"
          -- official demo sets flip_v to false but this is better
          set_flip_v animSprite (velocity' ^. _y > 0)
          set_flip_h animSprite (velocity' ^. _x < 0)
        else when (velocity' ^. _y /= 0) $ do
          set_animation animSprite =<< toLowLevel "up"
          set_flip_v animSprite (velocity' ^. _y > 0)
    else AnimatedSprite.stop animSprite

on_Player_body_entered :: Player -> PhysicsBody2D -> IO ()
on_Player_body_entered self _body = do
  hide self -- Player disappears after being hit.
  void $ emit_signal self `flip` [] =<< toLowLevel "hit"
  getNode' @"CollisionShape2D" self  >>= \cSh -> do
    disable <- toLowLevel "set_disabled"
    call_deferred cSh disable [VariantBool True]

deriveBase ''Player
