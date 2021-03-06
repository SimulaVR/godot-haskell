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
  { _base     :: Node
  , _score    :: MVar Int
  , _mobScene :: MVar PackedScene
  }
makeFieldsNoPrefix ''Main

instance NodeInit Main where
  init b = Main b <$> newMVar 0 <*> newEmptyMVar

instance NodeMethod Main "_on_MobTimer_timeout" '[] (IO ()) where
  nodeMethod = on_MobTimer_timeout
instance NodeMethod Main "_on_StartTimer_timeout" '[] (IO ()) where
  nodeMethod = on_StartTimer_timeout
instance NodeMethod Main "_on_ScoreTimer_timeout" '[] (IO ()) where
  nodeMethod = on_ScoreTimer_timeout
instance NodeMethod Main "game_over" '[] (IO ()) where
  nodeMethod = game_over
instance NodeMethod Main "new_game" '[] (IO ()) where
  nodeMethod = new_game

instance NodeProperty Main "PackedScene" PackedScene 'False where
  nodeProperty = createMVarProperty' "PackedScene" _mobScene (Left VariantTypeObject)

game_over :: Main -> IO ()
game_over self = do
  getNode' @"ScoreTimer"  self  >>= Timer.stop
  getNode' @"MobTimer"    self  >>= Timer.stop
  getNodeNativeScript' @"HUD" self >>= show_game_over & void

new_game :: Main -> IO ()
new_game self = do
  void $ swapMVar (self ^. score) 0
  position <- getNode' @"StartPosition" self >>= get_position
  void $ call
    <$> getNodeNativeScript' @"Player" self 
    <*> toLowLevel "_start"
    <*> pure [toVariant position]
    &   join
  getNode' @"StartTimer" self >>= start `flip` Nothing
  hud <- getNodeNativeScript' @"HUD" self
  update_score hud 0
  show_message hud =<< toLowLevel "Get Ready!"

on_StartTimer_timeout :: Main -> IO ()
on_StartTimer_timeout self = do
  getNode' @"MobTimer" self  >>= start `flip` Nothing
  getNode' @"ScoreTimer" self  >>= start `flip` Nothing

on_ScoreTimer_timeout :: Main -> IO ()
on_ScoreTimer_timeout self = do
  modifyMVar_ (self ^. score) (pure . (+) 1)
  update_score
    <$> getNodeNativeScript' @"HUD" self
    <*> readMVar (self ^. score)
    &   join

on_MobTimer_timeout :: Main -> IO ()
on_MobTimer_timeout self@(Main _ _ mobScene_) = do
  -- Choose a random location on Path2D.
  mobSpawnLoc <- getNode' @"MobPath/MobSpawnLocation" self 
  PathFollow2D.set_offset mobSpawnLoc . fromInteger =<< randomIO
  -- Create a Mob instance and add it to the scene.
  mob :: Mob <- readMVar mobScene_
            >>= (`PackedScene.instance'` Just 0)
            >>= (asNativeScript . upcast)
            >>= maybe (error "Couldn't cast mob to NativeScript") pure
  add_child self (upcast mob) (Just False)
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

setupNode ''Main "Main" "Main"
deriveBase ''Main
