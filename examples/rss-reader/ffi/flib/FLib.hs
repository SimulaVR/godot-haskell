{-# LANGUAGE ForeignFunctionInterface #-}
module FLib where

import qualified Foreign
import           Foreign(nullPtr, Ptr,newForeignPtr_,castPtr)
import qualified Godot.Gdnative.Internal       as FFI
import           Godot.Gdnative
import           Godot.Nativescript
import           Lib
import qualified Data.Text as T
import qualified Data.Text.IO as T

godot_nativescript_init :: GdnativeHandle -> IO ()
godot_nativescript_init desc = do
  defaultExports desc
  exports desc
  putStrLn "Haskell NativeScript lib initialized"

foreign export ccall godot_nativescript_init :: GdnativeHandle -> IO ()


godot_gdnative_init :: FFI.GdnativeInitOptionsPtr -> IO ()
godot_gdnative_init opts = do
  Foreign.peek opts >>= FFI.initApiStructs

foreign export ccall godot_gdnative_init :: FFI.GdnativeInitOptionsPtr -> IO ()


godot_gdnative_terminate :: FFI.GdnativeTerminateOptionsPtr -> IO ()
godot_gdnative_terminate handle = pure ()

foreign export ccall godot_gdnative_terminate :: FFI.GdnativeTerminateOptionsPtr -> IO ()
