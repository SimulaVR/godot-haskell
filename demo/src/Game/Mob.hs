module Game.Mob where
import Godot
import Godot.Core.AnimatedSprite as AnimatedSprite
import Godot.Core.Node as Node
import System.Random
import Project.Support
import Project.Scenes.Mob()

data Mob = Mob
  { _mBase :: RigidBody2D
  , _mMinSpeed :: MVar Float
  , _mMaxSpeed :: MVar Float
  , _mMobTypes :: MVar [Text]
  }

instance HasBaseClass Mob where
  type BaseClass Mob = RigidBody2D
  super = _mBase
instance NodeInScene "Mob" "Mob" Mob
instance NativeScript Mob where
  classInit base = Mob base
    <$> newMVar 150
    <*> newMVar 250
    <*> newMVar ["walk", "swim", "fly"]
  classMethods =
    [ method0 "_ready" $ \self -> do
        let randElem xs = (xs !!) <$> randomRIO (0, length xs - 1)
        randAnim <- readMVar (_mMobTypes self) >>= randElem >>= toLowLevel
        getNode' @"AnimatedSprite" self >>= (`set_animation` randAnim)
    , method0 "_on_VisibilityNotifier2D_screen_exited" $ \self -> do
        queue_free self
    ]

deriveBase ''Mob
