{-# LANGUAGE OverloadedStrings, TemplateHaskell, MultiParamTypeClasses #-}
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

data Main = Main
  { _mBase :: Node
  , _mTime :: MVar Float
  }

instance HasBaseClass Main where
  type BaseClass Main = Node
  super = _mBase
instance NativeScript Main where
  classInit base = Main base <$> newMVar 0
  classMethods =
    [ method1 "_process" $ main_process
    ]

main_process :: Main -> GodotVariant -> IO ()
main_process self deltaVt = do
  delta <- fromGodotVariant deltaVt
  (sec, sec') <- do
    t <- readMVar (_mTime self)
    let t' = t + delta
    _ <- swapMVar (_mTime self) t'
    return (floor t, floor t')
  when (sec < sec') $
    "Seconds passed: " ++ Prelude.show sec'
    & T.pack
    & (toLowLevel :: Text -> IO GodotString)
    >>= Api.godot_print

deriveBase ''Main


