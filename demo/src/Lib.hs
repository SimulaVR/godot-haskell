{-# LANGUAGE TemplateHaskell, MultiParamTypeClasses, OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts, ScopedTypeVariables, TypeApplications, TypeFamilies #-}
module Lib
  ( exports
  )
where

import           Control.Monad
import           Godot
import           Godot.Gdnative
import           Linear.V2
import           Linear.Metric(norm,normalize)
import           Linear.Vector
import           Util
import           Control.Lens
import           System.Random
import           Foreign.C.Types
import qualified Data.Text as T
import           Godot.Core.Node as G
import           Godot.Core.Object as G
import           Godot.Core.CanvasItem as G
import           Godot.Core.Timer as GT
import           Godot.Core.Node2D as G
import           Godot.Core.AnimatedSprite as G
import           Godot.Core.Label as G
import           Godot.Core.PathFollow2D as GP
import           Godot.Core.PackedScene as GS
import           Godot.Core.RigidBody2D as G
import           Godot.Core.CollisionShape2D as G
import           Godot.Core.Input as G
import           Data.Coerce
import           Godot.Core.Reference

exports :: GdnativeHandle -> IO ()
exports desc = do
  registerClass $ RegClass desc $ classInit @Main
  registerClass $ RegClass desc $ classInit @Player
  registerClass $ RegClass desc $ classInit @Mob
  registerClass $ RegClass desc $ classInit @HUD

data Main = Main { _mainBase :: Node, _mainScore :: MVar Int, _mainMobScene :: MVar PackedScene }

instance HasBaseClass Main where
  type BaseClass Main = Node
  super = _mainBase
instance NativeScript Main where
  classInit base = Main base <$> newMVar 0 <*> newMVar (PackedScene emptyObject)
  classMethods = [method0 "game_over" game_over
                 ,method0 "new_game" new_game
                 ,method0 "_on_StartTimer_timeout" on_StartTimer_timeout
                 ,method0 "_on_ScoreTimer_timeout" on_ScoreTimer_timeout
                 ,method0 "_on_MobTimer_timeout" on_MobTimer_timeout
                 ]
  classProperties = [
    createMVarProperty "PackedScene" _mainMobScene (PackedScene emptyObject)
    ]

game_over :: Main -> IO ()
game_over self = do
  GT.stop =<< getNode @Timer self "ScoreTimer"
  GT.stop =<< getNode @Timer self "MobTimer"
  _ <- show_game_over =<< getNodeNativeScript @HUD self "HUD"
  pure ()

new_game self = do
  _ <- swapMVar (_mainScore self) 0
  position <- get_position =<< getNode @Position2D self "StartPosition"
  join $ call <$> getNodeNativeScript @Player self "Player" <*> toLowLevel "start" <*> pure [toVariant position]
  join $ start <$> getNode @Timer self "StartTimer" <*> pure (-1)
  hud <- getNodeNativeScript @HUD self "HUD"
  update_score hud 0
  show_message hud =<< toLowLevel ("Get Ready!" :: Text)
  pure ()

on_StartTimer_timeout self = do
  mt <- getNode @Timer self "MobTimer"
  start mt (-1)
  st <- getNode @Timer self "ScoreTimer"
  start st (-1)

on_ScoreTimer_timeout self = do
  modifyMVar_ (_mainScore self) (pure . (+) 1)
  join $ update_score <$> (getNodeNativeScript @HUD self "HUD") <*> readMVar (_mainScore self)

on_MobTimer_timeout self = do
  mobSpawnLocation <- getNode @PathFollow2D self "MobPath/MobSpawnLocation"
  -- Set the mob's position to a random location.
  i :: Float <- randomIO
  GP.set_v_offset mobSpawnLocation 0
  GP.set_unit_offset mobSpawnLocation i
  mob <- readMVar $ _mainMobScene self
  imob <- GS.instance' mob 0
  (Just (mobInstance :: RigidBody2D)) <- tryCast imob
  add_child self (upcast mobInstance) False
  -- Set the mob's direction perpendicular to the path direction.
  direction <- (+ (pi / 2)) <$> get_rotation mobSpawnLocation
  set_position mobInstance =<< get_position mobSpawnLocation
  direction' <- (+ direction) <$> randomRIO (- pi / 4, pi / 4)
  set_rotation mobInstance direction'
  set_linear_velocity mobInstance
    =<< (\v -> godot_vector2_rotated v (CFloat direction'))
    =<< toLowLevel
    =<< liftM2 V2 (randomRIO (150 :: Float, 250)) (pure 0)
  pure ()

data Player = Player { _pBase :: Area2D, _pSpeed :: MVar Float }
instance HasBaseClass Player where
  type BaseClass Player = Area2D
  super = _pBase
instance NativeScript Player where
  classInit base = Player base <$> newMVar 400
  classMethods = [method0 "_ready" player_ready
                 ,method1 "start" player_start
                 ,method1 "_process" player_process
                 ,method "_on_Player_body_entered" on_Player_body_entered
                 ]
  classProperties = [
    createMVarProperty "speed" _pSpeed 400
    ]
  classSignals = [
    signal "hit" []
    ]

player_ready self = hide self

player_start self pos = do
  set_position self pos
  G.show self
  n <- getNode @CollisionShape2D self "CollisionShape2D"
  set_disabled n False

player_process self deltaSeconds = do
  rect <- (\(V2 _ r) -> r) <$> (fromLowLevel =<< get_viewport_rect self)
  Just inp <- getSingleton @Input
  pr <- is_action_pressed inp =<< toLowLevel "ui_right"
  pl <- is_action_pressed inp =<< toLowLevel "ui_left"
  pd <- is_action_pressed inp =<< toLowLevel "ui_down"
  pu <- is_action_pressed inp =<< toLowLevel "ui_up"
  let velocity = V2 ((if pl then -1 else 0) + (if pr then 1 else 0))
                    ((if pu then -1 else 0) + (if pd then 1 else 0))
  if norm velocity > 0 then
    do
      speed <- readMVar (_pSpeed self)
      let v = normalize velocity ^* speed
      get_position self >>= liftLowLevel (\x -> clamp2 zero rect ((v ^* deltaSeconds) ^+^ x)) >>= set_position self
      n <- getNode @AnimatedSprite self "AnimatedSprite"
      if v^._x /= 0 then
        do
          set_animation n =<< toLowLevel "right"
          set_flip_h n (v^._x < 0)
          set_flip_v n False
        else if v^._y /= 0 then
               do
                 set_animation n =<< toLowLevel "up"
                 set_flip_v n (v^._y > 0)
             else
               pure ()
      play n =<< toLowLevel ""
    else
    do
      n <- getNode @AnimatedSprite self "AnimatedSprite"
      G.stop n

on_Player_body_entered self [body] = do
  hide self
  h <- toLowLevel "hit"
  _ <- emit_signal self h []
  n <- getNode @CollisionShape2D self "CollisionShape2D"
  s <- toLowLevel "set_disabled"
  call_deferred n s [VariantBool True]

data Mob = Mob { _mBase :: RigidBody2D, _mMinSpeed :: MVar Float, _mMaxSpeed :: MVar Float }
instance HasBaseClass Mob where
  type BaseClass Mob = RigidBody2D
  super = _mBase
instance NativeScript Mob where
  classInit base = Mob base <$> newMVar 150 <*> newMVar 250
  classMethods = [
    method0 "_ready" $ \self -> do
        n <- getNode @AnimatedSprite self "AnimatedSprite"
        name <- randomElement ["walk", "swim", "fly"]
        set_animation n =<< toLowLevel name
    , method0 "_on_VisibilityNotifier2D_screen_exited" $ \self -> do
        queue_free self
    ]

data HUD = HUD { _hBase :: CanvasLayer }
instance HasBaseClass HUD where
  type BaseClass HUD = CanvasLayer
  super = _hBase
instance NativeScript HUD where
  classInit base = pure $ HUD base
  classMethods = [method1 "show_message" show_message
                 ,method0 "show_game_over" show_game_over
                 ,method1 "update_score" update_score
                 ,method0 "_on_StartButton_pressed" _on_StartButton_pressed
                 ,method0 "_on_MessageTimer_timeout" _on_MessageTimer_timeout
                 ]
  classSignals = [
    signal "start_game" []
    ]

show_message :: HUD -> GodotString -> IO ()
show_message self text = do
  messageLabel <- getNode @Label self "MessageLabel"
  set_text messageLabel text
  G.show messageLabel
  join $ GT.start <$> (getNode @Timer self "MessageTimer") <*> pure (-1)

show_game_over self = do
  show_message self =<< toLowLevel "Game Over"
  timer <- getNode @Timer self "MessageTimer"
  await self timer "timeout"
    (\self -> do
        messageLabel <- getNode @Label self "MessageLabel"
        set_text messageLabel =<< toLowLevel "Dodge the\nCreeps!"
        G.show messageLabel
        G.show =<< getNode @Button self "StartButton") 

update_score self score = do
  l <- getNode @Label self "ScoreLabel"
  set_text l =<< toLowLevel (T.pack $ Prelude.show (score :: Int))

_on_StartButton_pressed self = do
  G.hide =<< getNode @Button self "StartButton"
  sg <- toLowLevel "start_game"
  emit_signal self sg []

_on_MessageTimer_timeout self = do
  G.hide =<< getNode @Label self "MessageLabel"

deriveBase ''Main
deriveBase ''Player
deriveBase ''Mob
deriveBase ''HUD
