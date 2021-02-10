{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptSceneNode
       (Godot.Core.VisualScriptSceneNode.get_node_path,
        Godot.Core.VisualScriptSceneNode.set_node_path)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptSceneNode_get_node_path #-}

bindVisualScriptSceneNode_get_node_path :: MethodBind
bindVisualScriptSceneNode_get_node_path
  = unsafePerformIO $
      withCString "VisualScriptSceneNode" $
        \ clsNamePtr ->
          withCString "get_node_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_node_path ::
                (VisualScriptSceneNode :< cls, Object :< cls) => cls -> IO NodePath
get_node_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSceneNode_get_node_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptSceneNode_set_node_path #-}

bindVisualScriptSceneNode_set_node_path :: MethodBind
bindVisualScriptSceneNode_set_node_path
  = unsafePerformIO $
      withCString "VisualScriptSceneNode" $
        \ clsNamePtr ->
          withCString "set_node_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_node_path ::
                (VisualScriptSceneNode :< cls, Object :< cls) =>
                cls -> NodePath -> IO ()
set_node_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptSceneNode_set_node_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)