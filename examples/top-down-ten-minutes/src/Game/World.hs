{-# LANGUAGE LambdaCase, TypeOperators #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}
module Game.World where
import Control.Lens
import Control.Monad
import Control.Monad.Extra
import Godot
import Godot.Core.Node as Node
import qualified Godot.Core.AnimationPlayer as A
import Godot.Core.Input as Input
import Godot.Core.KinematicBody2D
import Godot.Core.Node2D
import Godot.Core.Particles2D
import Godot.Core.Object
import Godot.Core.PathFollow2D
import Godot.Core.RigidBody2D
import Godot.Core.Timer as Timer
import Godot.Core.CanvasItem
import Godot.Core.SceneTree
import Godot.Gdnative
import Linear.V2
import System.Random
import Project.Support
import Project.Scenes.World()
import Project.Scenes.Bullet()
import Project.Scenes.Enemy()
import Project.Scenes.Explosion()
import Data.String
import System.IO.Unsafe
import qualified Data.Text as T
import Data.Coerce
import Data.Maybe
import Data.Typeable

instance IsString GodotString where
  fromString = unsafePerformIO . toLowLevel . T.pack

data Player = Player
  { _base     :: KinematicBody2D
  , _movespeed :: Float
  , _bulletspeed :: Float
  , _bullet :: MVar (PackedScene' "Bullet")
  }

data Enemy = Enemy
  { _ebase     :: KinematicBody2D
  , _motion    :: Vector2
  , _explosion :: MVar (PackedScene' "Explosion")
  }

data Bullet = Bullet
  { _bbase     :: RigidBody2D
  }

makeFieldsNoPrefix ''Player
makeFieldsNoPrefix ''Enemy
makeFieldsNoPrefix ''Bullet

-- * Player

instance NodeInit Player where
  init b = do
    Player b 500 500 <$> newEmptyMVar
instance NodeInit Enemy where
  init b = Enemy b <$> godot_vector2_new 0 0 <*> newEmptyMVar
instance NodeInit Bullet where
  init b = pure $ Bullet b

instance NodeMethod Player "_ready" '[] (IO ()) where
  nodeMethod self = putMVar (self ^. bullet) =<< preloadScene

instance NodeMethod Player "_physics_process" '[Float] (IO ()) where
  nodeMethod self _ = do
    Just inp <- getSingleton @Input
    action <- sum <$> mapM (\(c,v) -> (v *). fromIntegral . fromEnum <$>
                                  (is_action_pressed inp =<< toLowLevel c))
             [("left", V2 (-1) 0) ,("right", V2 1 0) ,("up", V2 0 (-1)) ,("down", V2 0 1)]
    motion <- godot_vector2_normalized =<< toLowLevel action
    motion <- godot_vector2_operator_multiply_scalar motion $ realToFrac (self ^. movespeed)
    void $ move_and_slide self motion Nothing Nothing Nothing Nothing Nothing
    look_at self =<< get_global_mouse_position self
    whenM (is_action_just_pressed inp =<< toLowLevel "LMB") $ fire self

instance NodeMethod Player "_on_Area2D_body_entered" '[Node] (IO ()) where
  nodeMethod self body = do
    n <- fromLowLevel =<< get_name body
    when ("Enemy" `T.isInfixOf` n) $ kill self

fire :: Player -> IO ()
fire self = do
    b <- sceneInstance =<< readMVar (self ^. bullet)
    set_position b =<< get_global_position self
    set_rotation_degrees b =<< get_rotation_degrees self
    apply_impulse b <$> toLowLevel (V2 0 0)
                    <*> (godot_vector2_rotated
                          <$> toLowLevel (V2 (self^.bulletspeed) 0)
                          <*> (realToFrac <$> get_rotation self)
                           & join)
                     & join
    call_deferred  <$> (get_root =<< get_tree self)
                   <*> toLowLevel "add_child"
                   <*> pure [toVariant b]
                    & join

-- * Enemy

instance NodeMethod Enemy "_ready" '[] (IO ()) where
  nodeMethod self = putMVar (self ^. explosion) =<< preloadScene

instance NodeMethod Enemy "_on_Area2D_body_entered" '[Node] (IO ()) where
  nodeMethod self body = do
    n <- fromLowLevel =<< get_name body
    when ("Bullet" `T.isInfixOf` n) $ do
      ex <- sceneInstance =<< readMVar (self ^. explosion)
      set_position ex =<< get_position self
      set_emitting ex True
      call_deferred  <$> (get_root =<< get_tree self)
                     <*> toLowLevel "add_child"
                     <*> pure [toVariant ex]
                      & join
      queue_free self

kill :: Player -> IO ()
kill self = void . reload_current_scene =<< get_tree self

instance NodeMethod Enemy "_physics_process" '[Float] (IO ()) where
  nodeMethod self _ = do
    pl <- get_node <$> get_parent self <*> toLowLevel "Player" & join
    pp <- get_position =<< tryCast' @Node2D pl
    ps <- get_position self
    set_position self =<< godot_vector2_operator_add ps
                      =<< (godot_vector2_operator_divide_scalar <$> godot_vector2_operator_subtract pp ps
                                                              <*> pure 50 & join)
    look_at self pp
    void $ move_and_collide self (self ^. motion) Nothing Nothing Nothing

-- * Bullet

instance NodeMethod Bullet "_on_Bullet_body_entered" '[Node] (IO ()) where
  nodeMethod self _ = do
    n <- getNode' @"AnimationPlayer" self
    A.play n (Just "fadeout") Nothing Nothing Nothing

instance NodeMethod Bullet "_on_AnimationPlayer_animation_finished" '[GodotString] (IO ()) where
  nodeMethod self _ = queue_free self

setupNode ''Player "World" "Player"
deriveBase ''Player

setupNode ''Enemy "Enemy" "Enemy"
deriveBase ''Enemy

setupNode ''Bullet "Bullet" "Bullet"
deriveBase ''Bullet
