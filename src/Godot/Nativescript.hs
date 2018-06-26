{-# LANGUAGE RecursiveDo #-}
module Godot.Nativescript where

import Data.Typeable
import Data.Vector (Vector)
import qualified Data.Vector as V

import Foreign
import Foreign.C

import Godot.Gdnative.Internal

type GdnativeHandle = Ptr ()

registerClass :: Typeable a
              => GdnativeHandle
              -> String -- ^ class name
              -> String -- ^ base class
              -> (GodotObject -> IO a) -- ^ create action
              -> (GodotObject -> a -> IO ()) -- ^ destroy action
              -> IO ()
registerClass pHandle name base create destroy = do
  createFun <- mkInstanceCreateFunPtr $
    \ins _ -> create ins >>= newStablePtr >>= (return . castStablePtrToPtr)
  destroyFun <- mkInstanceDestroyFunPtr $
    \ins _ objPtr -> do
      let stPtr = castPtrToStablePtr objPtr
      obj <- deRefStablePtr stPtr
      freeStablePtr stPtr
      destroy ins obj
  rec 
    createFreeFun <- mkInstanceFreeFunPtr $
      \_ -> freeHaskellFunPtr createFun >> freeHaskellFunPtr createFreeFun
    destroyFreeFun <- mkInstanceFreeFunPtr $
      \_ -> freeHaskellFunPtr destroyFun >> freeHaskellFunPtr destroyFreeFun
      
  let createFunObj = GodotInstanceCreateFunc createFun nullPtr createFreeFun
  let destroyFunObj = GodotInstanceDestroyFunc destroyFun nullPtr destroyFreeFun
  withCString name $ \namePtr -> withCString base $
    \basePtr -> godot_nativescript_register_class pHandle namePtr basePtr createFunObj destroyFunObj
 
registerMethod :: Typeable a
               => GdnativeHandle
               -> String -- ^ class name
               -> String -- ^ method name
               -> GodotMethodRpcMode
               -> (GodotObject -> a -> Vector GodotVariant -> IO GodotVariant) -- ^ the godot variants are destroyed at the end of the call
               -> IO ()
registerMethod pHandle clsName mtdName rpc method  = do
  methodFun <- mkInstanceMethodFunPtr $ \outPtr ins _ objPtr numArgs argsPtr -> do
    obj <- deRefStablePtr $ castPtrToStablePtr objPtr
    args <- V.generateM (fromIntegral numArgs) $
      \idx -> GodotVariant <$> newForeignPtr_ (argsPtr `plusPtr` (opaqueSizeOf @GodotVariant * idx))
    res <- method ins obj args
    withGodotVariant res $ \resPtr -> copyBytes outPtr resPtr (opaqueSizeOf @GodotVariant)
    return outPtr
    
  rec
    methodFreeFun <- mkInstanceFreeFunPtr $
      \_ -> freeHaskellFunPtr methodFun >> freeHaskellFunPtr methodFreeFun

  let methodObj = GodotInstanceMethod methodFun nullPtr methodFreeFun
  
  withCString clsName $ \clsNamePtr -> withCString mtdName $
    \mtdNamePtr -> godot_nativescript_register_method pHandle clsNamePtr mtdNamePtr (GodotMethodAttributes rpc) methodObj

