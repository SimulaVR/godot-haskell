{-# LANGUAGE ForeignFunctionInterface #-}
module FLib where

import qualified Foreign
import qualified Godot.Gdnative.Internal       as FFI
import           Godot.Nativescript
import           Lib



godot_nativescript_init :: GdnativeHandle -> IO ()
godot_nativescript_init desc = do
  exports desc
  putStrLn "Haskell NativeScript lib initialized"

foreign export ccall godot_nativescript_init :: GdnativeHandle -> IO ()


godot_gdnative_init :: FFI.GodotGdnativeInitOptionsPtr -> IO ()
godot_gdnative_init opts = Foreign.peek opts >>= FFI.initApiStructs

foreign export ccall godot_gdnative_init :: FFI.GodotGdnativeInitOptionsPtr -> IO ()


godot_gdnative_terminate :: FFI.GodotGdnativeTerminateOptionsPtr -> IO ()
godot_gdnative_terminate _ = return ()

foreign export ccall godot_gdnative_terminate :: FFI.GodotGdnativeTerminateOptionsPtr -> IO ()


