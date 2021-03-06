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

instance NodeInit Mob where
  init base = Mob base <$> newMVar 150 <*> newMVar 250 <*> newMVar ["walk", "swim", "fly"]
instance NodeMethod Mob "_ready" '[] (IO ()) where
  nodeMethod self = do
        let randElem xs = (xs !!) <$> randomRIO (0, length xs - 1)
        randAnim <- readMVar (_mMobTypes self) >>= randElem >>= toLowLevel
        getNode' @"AnimatedSprite" self >>= (`set_animation` randAnim)
instance NodeMethod Mob "_on_VisibilityNotifier2D_screen_exited" '[] (IO ()) where
  nodeMethod = queue_free

setupNode ''Mob "Mob" "Mob"
deriveBase ''Mob
