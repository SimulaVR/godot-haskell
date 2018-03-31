{-# LANGUAGE TemplateHaskell #-}
module Godot.Gdnative.Api where

import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import Foreign
import Foreign.C

import Language.Haskell.TH

import Godot.Gdnative.Gdnative

import Generate

$(do
     Just apis <- decode <$> runIO (BL.readFile "godot_headers/gdnative_api.json")
     apisToHs apis)
