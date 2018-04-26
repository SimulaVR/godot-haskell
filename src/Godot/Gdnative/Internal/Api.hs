{-# LANGUAGE TemplateHaskell #-}
module Godot.Gdnative.Internal.Api where

import Data.Aeson
import qualified Data.ByteString.Lazy as BL
import Data.IORef

import Foreign
import Foreign.C

import Language.Haskell.TH

import Data.ByteString.Internal (accursedUnutterablePerformIO)
import System.IO.Unsafe

import Godot.Gdnative.Internal.Gdnative

import Generate

godotGdnativeCoreApiStructRef :: IORef GodotGdnativeCoreApiStruct
godotGdnativeCoreApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeCoreApiStructRef too early"
{-# NOINLINE godotGdnativeCoreApiStructRef #-}

godotGdnativeExtNativescriptApiStructRef :: IORef GodotGdnativeExtNativescriptApiStruct
godotGdnativeExtNativescriptApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeExtNativescriptApiStructRef too early"
{-# NOINLINE godotGdnativeExtNativescriptApiStructRef #-}

godotGdnativeExtNativescript11ApiStructRef :: IORef GodotGdnativeExtNativescript11ApiStruct
godotGdnativeExtNativescript11ApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeExtNativescript11ApiStructRef too early"
{-# NOINLINE godotGdnativeExtNativescript11ApiStructRef #-}

godotGdnativeExtPluginscriptApiStructRef :: IORef GodotGdnativeExtPluginscriptApiStruct
godotGdnativeExtPluginscriptApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeExtPluginscriptApiStructRef too early"
{-# NOINLINE godotGdnativeExtPluginscriptApiStructRef #-}

godotGdnativeExtArvrApiStructRef :: IORef GodotGdnativeExtArvrApiStruct
godotGdnativeExtArvrApiStructRef = unsafePerformIO $ newIORef $ 
  error "attempted to get godotGdnativeExtArvrApiStructRef too early"
{-# NOINLINE godotGdnativeExtArvrApiStructRef #-}

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
