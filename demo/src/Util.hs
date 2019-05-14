module Util where
import           Godot
import           Godot.Gdnative
import qualified Godot.Gdnative.Internal.Api   as Api
import qualified Godot.Api                     as GApi
import qualified Foreign.C                     as Foreign
import           System.Random
import           Linear.V2

liftLowLevel
  :: (GodotFFI low0 high0, GodotFFI low1 high1)
  => (high0 -> high1)
  -> low0
  -> IO low1
liftLowLevel f low = toLowLevel =<< f <$> fromLowLevel low

randomElement :: [a] -> IO a
randomElement l = do
  i <- randomRIO (0, length l - 1)
  return $ l !! i

clamp2 :: Ord a => V2 a -> V2 a -> V2 a -> V2 a
clamp2 (V2 lx ly) (V2 ux uy) (V2 x y) =
  V2 (clamp lx ux x) (clamp ly uy y)

clamp :: Ord a => a -> a -> a -> a
clamp l u a | l > a = l
            | u < a = u
            | otherwise = a
