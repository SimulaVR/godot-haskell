{-# LANGUAGE TemplateHaskell #-}
module Godot.Gdnative.Internal.Api where

import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import Data.IORef

import Foreign.C

import Language.Haskell.TH

import Data.ByteString.Internal (accursedUnutterablePerformIO)

import Godot.Gdnative.Internal.Gdnative

import Generate

godotGdnativeCoreApiStruct :: GodotGdnativeCoreApiStruct
godotGdnativeCoreApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeCoreApiStructRef

godotGdnativeExtNativescriptApiStruct :: GodotGdnativeExtNativescriptApiStruct
godotGdnativeExtNativescriptApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtNativescriptApiStructRef

godotGdnativeExtNativescript11ApiStruct :: GodotGdnativeExtNativescript11ApiStruct
godotGdnativeExtNativescript11ApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtNativescript11ApiStructRef

godotGdnativeExtPluginscriptApiStruct :: GodotGdnativeExtPluginscriptApiStruct
godotGdnativeExtPluginscriptApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtPluginscriptApiStructRef

godotGdnativeExtArvrApiStruct :: GodotGdnativeExtArvrApiStruct
godotGdnativeExtArvrApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtArvrApiStructRef


$(do
     Just apis <- decode <$> runIO (BL.readFile "godot_headers/gdnative_api.json")
     apisToHs apis)
