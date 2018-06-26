{-# LANGUAGE RecursiveDo #-}
module Godot.Nativescript where

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
               -> (GodotObject -> a -> Vector GodotVariant -> IO GodotVariant)
               -> IO ()
registerMethod pHandle clsName mtdName rpc method  = do
  methodFun <- mkInstanceMethodFun $ \outPtr ins _ objPtr numArgs argsPtr = do
    obj <- deRefStablePtr $ castPtrToStablePtr objPtr
    undefined
--    V.generateM numArgs $
--      \idx -> GodotVariant (argsPtr `plusPtr` (opaqueSizeOf @GodotVariant * idx))
    res <- method ins obj args


-- void GDAPI godot_nativescript_register_method(void *p_gdnative_handle, const char *p_name, const char *p_function_name, godot_method_attributes p_attr, godot_instance_method p_method);
