module Game.Main where
import Control.Lens
import Control.Monad
import Foreign.C.Types
import Godot
import Godot.Core.Node as Node
import Godot.Core.Node2D as Node2D
import Godot.Core.Object as Object
import Godot.Core.PackedScene as PackedScene
import Godot.Core.PathFollow2D as PathFollow2D
import Godot.Core.RigidBody2D as RigidBody2D
import Godot.Core.Timer as Timer
import Godot.Gdnative
import Linear.V2
import System.Random
import Project.Support
import Project.Scenes.Main()
import Game.HUD
import Game.Mob
import Game.Player()

data Main = Main
  { _mainBase :: Node
  , _mainScore :: MVar Int
  , _mainMobScene :: MVar PackedScene
  }
instance HasBaseClass Main where
  type BaseClass Main = Node
  super = _mainBase
instance NodeInScene "Main" "Main" Main
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
  getNode' @"ScoreTimer"  self  >>= Timer.stop
  getNode' @"MobTimer"    self  >>= Timer.stop
  getNodeNativeScript' @"HUD" self >>= show_game_over & void

new_game :: Main -> IO ()
new_game self = do
  _        <- swapMVar (_mainScore self) 0
  position <- getNode' @"StartPosition" self >>= get_position
  void $ call
    <$> getNodeNativeScript' @"Player" self 
    <*> toLowLevel "start"
    <*> pure [toVariant position]
    &   join
  getNode' @"StartTimer" self >>= start `flip` (-1)
  hud <- getNodeNativeScript' @"HUD" self
  update_score hud 0
  show_message hud =<< toLowLevel "Get Ready!"

on_StartTimer_timeout :: Main -> IO ()
on_StartTimer_timeout self = do
  getNode' @"MobTimer" self  >>= start `flip` (-1)
  getNode' @"ScoreTimer" self  >>= start `flip` (-1)

on_ScoreTimer_timeout :: Main -> IO ()
on_ScoreTimer_timeout self = do
  modifyMVar_ (_mainScore self) (pure . (+) 1)
  update_score
    <$> getNodeNativeScript' @"HUD" self
    <*> readMVar (_mainScore self)
    &   join

on_MobTimer_timeout :: Main -> IO ()
on_MobTimer_timeout self@(Main _ _ mobScene) = do
  -- Choose a random location on Path2D.
  mobSpawnLoc <- getNode' @"MobPath/MobSpawnLocation" self 
  PathFollow2D.set_offset mobSpawnLoc . fromInteger =<< randomIO
  -- Create a Mob instance and add it to the scene.
  mob :: Mob <- readMVar mobScene
            >>= (`PackedScene.instance'` 0)
            >>= (asNativeScript . upcast)
            >>= maybe (error "Couldn't cast mob to NativeScript") pure
  add_child self (upcast mob) False
  -- Set the mob's direction perpendicular to the path direction.
  direction <- get_rotation mobSpawnLoc <&> (+ pi / 2)
  -- Set the mob's position to a random location.
  Node2D.set_position mob =<< get_position mobSpawnLoc
  -- Add some randomness to the direction.
  direction' <- (direction +) <$> randomRIO ((-pi) / 4, pi / 4)
  set_rotation mob direction'
  -- Set the velocity' (speed & direction).
  liftM2 (,) (readMVar $ _mMinSpeed mob) (readMVar $ _mMaxSpeed mob)
    >>= randomRIO
    >>= (\x -> toLowLevel (V2 x 0))
    >>= (`godot_vector2_rotated` CFloat direction')
    >>= set_linear_velocity mob

deriveBase ''Main
