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

godotGdnativeCore11ApiStruct :: GodotGdnativeCore11ApiStruct
godotGdnativeCore11ApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeCore11ApiStructRef

godotGdnativeCore12ApiStruct :: GodotGdnativeCore12ApiStruct
godotGdnativeCore12ApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeCore12ApiStructRef

godotGdnativeExtNativescriptApiStruct :: GodotGdnativeExtNativescriptApiStruct
godotGdnativeExtNativescriptApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtNativescriptApiStructRef

godotGdnativeExtNativescript11ApiStruct :: GodotGdnativeExtNativescript11ApiStruct
godotGdnativeExtNativescript11ApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtNativescript11ApiStructRef

godotGdnativeExtPluginscriptApiStruct :: GodotGdnativeExtPluginscriptApiStruct
godotGdnativeExtPluginscriptApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtPluginscriptApiStructRef

godotGdnativeExtArvrApiStruct :: GodotGdnativeExtArvrApiStruct
godotGdnativeExtArvrApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtArvrApiStructRef

godotGdnativeExtVideodecoderApiStruct :: GodotGdnativeExtVideodecoderApiStruct
godotGdnativeExtVideodecoderApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtVideodecoderApiStructRef

godotGdnativeExtNetApiStruct :: GodotGdnativeExtNetApiStruct
godotGdnativeExtNetApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtNetApiStructRef

godotGdnativeExtNet32ApiStruct :: GodotGdnativeExtNet32ApiStruct
godotGdnativeExtNet32ApiStruct = accursedUnutterablePerformIO $ readIORef godotGdnativeExtNet32ApiStructRef


$(do
    maybeApis <- eitherDecode <$> runIO (BL.readFile "godot_headers/gdnative_api.json")
    case maybeApis of
      Right apis -> apisToHs apis
      Left err -> error err)
