{-# LANGUAGE
  FlexibleContexts,
  MultiParamTypeClasses,
  OverloadedStrings,
  TemplateHaskell,
  TypeApplications,
  TypeFamilies #-}
module Lib
  ( exports
  )
where

import           Control.Lens
import           Control.Arrow --((>>>))
import           Control.Monad
import           Control.Monad.Extra (whenJust, whenJustM)
import           Data.Coerce
import qualified Data.Map.Strict as M
import qualified Data.Text as T
import           Data.Typeable
import           Foreign.C.Types
import           Godot
import           Godot.Core.AnimatedSprite as AnimatedSprite
import           Godot.Core.Area2D as Area2D
import           Godot.Core.CanvasItem as CanvasItem
import           Godot.Core.CollisionShape2D as CollisionShape2D
import           Godot.Core.Input as Input
import           Godot.Core.Label as Label
import           Godot.Core.Node as Node
import           Godot.Core.Node2D as Node2D
import           Godot.Core.Object as Object
import           Godot.Core.PackedScene as PackedScene
import           Godot.Core.PathFollow2D as PathFollow2D
import           Godot.Core.Reference as Reference
import           Godot.Core.RigidBody2D as RigidBody2D
import           Godot.Core.Timer as Timer
import           Godot.Gdnative
import           Linear.Metric (normalize)
import           Linear.V2
import           Linear.Vector
import           System.Random

exports :: GdnativeHandle -> IO ()
exports desc = do
  registerClass $ RegClass desc $ classInit @Main
  registerClass $ RegClass desc $ classInit @Player
  registerClass $ RegClass desc $ classInit @Mob
  registerClass $ RegClass desc $ classInit @HUD


--- Main


data Main = Main
  { _mainBase :: Node
  , _mainScore :: MVar Int
  , _mainMobScene :: MVar PackedScene
  }

instance HasBaseClass Main where
  type BaseClass Main = Node
  super = _mainBase
instance NativeScript Main where
  classInit base = Main base <$> newMVar 0 <*> newEmptyMVar
  classMethods =
    [ method0 "_on_MobTimer_timeout" on_MobTimer_timeout
    , method0 "_on_StartTimer_timeout" on_StartTimer_timeout
    , method0 "_on_ScoreTimer_timeout" on_ScoreTimer_timeout
    , method0 "game_over" game_over
    , method0 "new_game" new_game
    ]
  classProperties =
    [ createMVarProperty "PackedScene" _mainMobScene (Left VariantTypeObject)
    ]

game_over :: Main -> IO ()
game_over self = do
  getNode @Timer           self "ScoreTimer" >>= Timer.stop
  getNode @Timer           self "MobTimer" >>= Timer.stop
  getNodeNativeScript @HUD self "HUD" >>= show_game_over & void

new_game :: Main -> IO ()
new_game self = do
  _        <- swapMVar (_mainScore self) 0
  position <- getNode @Position2D self "StartPosition" >>= get_position
  call
    <$> getNodeNativeScript @Player self "Player"
    <*> toLowLevel "start"
    <*> pure [toVariant position]
    &   join
  getNode @Timer self "StartTimer" >>= start `flip` (-1)
  hud <- getNodeNativeScript @HUD self "HUD"
  update_score hud 0
  show_message hud =<< toLowLevel "Get Ready!"

on_StartTimer_timeout :: Main -> IO ()
on_StartTimer_timeout self = do
  getNode @Timer self "MobTimer" >>= start `flip` (-1)
  getNode @Timer self "ScoreTimer" >>= start `flip` (-1)

on_ScoreTimer_timeout :: Main -> IO ()
on_ScoreTimer_timeout self = do
  modifyMVar_ (_mainScore self) (pure . (+) 1)
  update_score
    <$> getNodeNativeScript @HUD self "HUD"
    <*> readMVar (_mainScore self)
    &   join

on_MobTimer_timeout :: Main -> IO ()
on_MobTimer_timeout self@(Main _ _ mobScene) = do
  -- Choose a random location on Path2D.
  mobSpawnLoc <- getNode @PathFollow2D self "MobPath/MobSpawnLocation"
  PathFollow2D.set_offset mobSpawnLoc =<< fromInteger <$> randomIO
  -- Create a Mob instance and add it to the scene.
  mob <-
    readMVar mobScene
    >>= (PackedScene.instance' `flip` 0)
    >>= (asNativeScript . upcast)
    >>= maybe (error "Couldn't cast mob to NativeScript") pure
  add_child self (upcast mob) False
  -- Set the mob's direction perpendicular to the path direction.
  direction <- get_rotation mobSpawnLoc <&> (+ pi / 2)
  -- Set the mob's position to a random location.
  Node2D.set_position (upcast @Node2D mob) =<< get_position mobSpawnLoc
  -- Add some randomness to the direction.
  direction' <- (direction +) <$> randomRIO ((-pi) / 4, pi / 4)
  set_rotation mob direction'
  -- Set the velocity' (speed & direction).
  liftM2 (,) (readMVar $ _mMinSpeed mob) (readMVar $ _mMaxSpeed mob)
    >>= randomRIO
    >>= (\x -> toLowLevel (V2 x 0))
    >>= (godot_vector2_rotated `flip` (CFloat direction'))
    >>= set_linear_velocity mob


--- Player


data Player = Player
  { _pBase :: Area2D
  , _pSpeed :: MVar Float
  , _pScreenSize :: MVar (V2 Float)
  }
instance HasBaseClass Player where
  type BaseClass Player = Area2D
  super = _pBase
instance NativeScript Player where
  classInit base = Player base <$> newMVar 400 <*> newMVar zero
  classMethods =
    [ method0 "_ready" player_ready
    , method1 "_process" player_process
    , method1 "_on_Player_body_entered" on_Player_body_entered
    , method1 "start" player_start
    ]
  classProperties = [createMVarProperty "speed" _pSpeed (Right 400)]
  classSignals = [signal "hit" []]

player_ready :: Player -> IO ()
player_ready self = do
  screenRect <- get_viewport_rect self >>= fromLowLevel
  void $ swapMVar (_pScreenSize self) (screenRect ^. _y)
  hide self

player_start :: Player -> Vector2 -> IO ()
player_start self pos = do
  set_position self pos
  CanvasItem.show self
  getNode @CollisionShape2D self "CollisionShape2D" >>= (`set_disabled` False)

player_process :: Player -> Float -> IO ()
player_process self delta = do
  animSprite              <- getNode @AnimatedSprite self "AnimatedSprite"
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
      play animSprite =<< toLowLevel ""

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

on_Player_body_entered :: Player -> PhysicsBody2D -> IO GodotVariant
on_Player_body_entered self _body = do
  hide self -- Player disappears after being hit.
  void $ emit_signal self `flip` [] =<< toLowLevel "hit"
  getNode @CollisionShape2D self "CollisionShape2D" >>= \cSh -> do
    disable <- toLowLevel "set_disabled"
    call_deferred cSh disable [VariantBool True]


--- Mob


data Mob = Mob
  { _mBase :: RigidBody2D
  , _mMinSpeed :: MVar Float
  , _mMaxSpeed :: MVar Float
  , _mMobTypes :: MVar [Text]
  }
instance HasBaseClass Mob where
  type BaseClass Mob = RigidBody2D
  super = _mBase
instance NativeScript Mob where
  classInit base = Mob base
    <$> newMVar 150
    <*> newMVar 250
    <*> newMVar ["walk", "swim", "fly"]
  classMethods =
    [ method0 "_ready" $ \self -> do
        let randElem xs = (xs !!) <$> randomRIO (0, length xs - 1)
        randAnim <- readMVar (_mMobTypes self) >>= randElem >>= toLowLevel
        getNode @AnimatedSprite self "AnimatedSprite" >>= (`set_animation` randAnim)
    , method0 "_on_VisibilityNotifier2D_screen_exited" $ \self -> do
        queue_free self
    ]


--- HUD


data HUD = HUD { _hBase :: CanvasLayer }
instance HasBaseClass HUD where
  type BaseClass HUD = CanvasLayer
  super = _hBase
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
  messageLabel <- getNode @Label self "MessageLabel"
  set_text messageLabel text
  CanvasItem.show messageLabel
  getNode @Timer self "MessageTimer" >>= (`Timer.start` (-1))

show_game_over :: HUD -> IO Int
show_game_over self = do
  show_message self =<< toLowLevel "Game Over"
  timer <- getNode @Timer self "MessageTimer"
  await self timer "timeout" $ \self -> do
    messageLabel <- getNode @Label self "MessageLabel"
    set_text messageLabel =<< toLowLevel "Dodge the\nCreeps!"
    CanvasItem.show messageLabel
    getNode @Button self "StartButton" >>= CanvasItem.show

update_score :: HUD -> Int -> IO ()
update_score self score = do
  set_text
    <$> getNode @Label self "ScoreLabel"
    <*> toLowLevel (T.pack $ Prelude.show score)
    &   join

_on_StartButton_pressed :: HUD -> IO GodotVariant
_on_StartButton_pressed self = do
  getNode @Button self "StartButton" >>= CanvasItem.hide
  emit_signal self `flip` [] =<< toLowLevel "start_game"

_on_MessageTimer_timeout :: HUD -> IO ()
_on_MessageTimer_timeout self = do
  getNode @Label self "MessageLabel" >>= CanvasItem.hide

deriveBase ''Main
deriveBase ''Player
deriveBase ''Mob
deriveBase ''HUD
