{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
module Lib
  ( exports
  )
where

import           Godot
import qualified Godot.Gdnative.Internal.Api   as Api
import qualified Data.Text                     as T
import           Control.Monad
import           Data.Function                            ( (&) )

exports :: GdnativeHandle -> IO ()
exports desc = do
  registerClass $ RegClass desc $ classInit @Main
  -- registerClass $ RegClass desc $ classInit @MyOtherClass

data Main = Main
  { _mBase :: GodotNode
  , _mTime :: TVar Float
  }

instance HasBaseClass Main where
  type BaseClass Main = GodotNode
  super = _mBase
instance GodotClass Main where
  classInit base = Main base <$> newTVarIO 0
  classMethods =
    [ func NoRPC "_process" $
        \self [deltaVt] -> do
          delta <- fromGodotVariant deltaVt
          (sec, sec') <- atomically $ do
            t <- readTVar (_mTime self)
            let t' = t + delta
            writeTVar (_mTime self) t'
            return (floor t, floor t') :: STM (Int, Int)
          when (sec < sec') $
            "Seconds passed: " ++ Prelude.show sec'
              & T.pack
              & (toLowLevel :: Text -> IO GodotString)
              >>= Api.godot_print
    ]


