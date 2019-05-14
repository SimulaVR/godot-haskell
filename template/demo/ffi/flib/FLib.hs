{-# LANGUAGE ForeignFunctionInterface #-}
module FLib where

import qualified Foreign
import qualified Godot.Gdnative.Internal       as FFI
import           Godot.Gdnative
import           Godot.Nativescript
import           Lib



godot_nativescript_init :: GdnativeHandle -> IO ()
godot_nativescript_init desc = do
  defaultExports desc
  exports desc
  putStrLn "Haskell NativeScript lib initialized"

foreign export ccall godot_nativescript_init :: GdnativeHandle -> IO ()


godot_gdnative_init :: FFI.GdnativeInitOptionsPtr -> IO ()
godot_gdnative_init opts = Foreign.peek opts >>= FFI.initApiStructs

foreign export ccall godot_gdnative_init :: FFI.GdnativeInitOptionsPtr -> IO ()


godot_gdnative_terminate :: FFI.GdnativeTerminateOptionsPtr -> IO ()
godot_gdnative_terminate _ = return ()

foreign export ccall godot_gdnative_terminate :: FFI.GdnativeTerminateOptionsPtr -> IO ()


