{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptNode
       (Godot.Core.VisualScriptNode.sig_ports_changed,
        Godot.Core.VisualScriptNode._get_default_input_values,
        Godot.Core.VisualScriptNode._set_default_input_values,
        Godot.Core.VisualScriptNode.get_default_input_value,
        Godot.Core.VisualScriptNode.get_visual_script,
        Godot.Core.VisualScriptNode.ports_changed_notify,
        Godot.Core.VisualScriptNode.set_default_input_value)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Resource()

sig_ports_changed ::
                  Godot.Internal.Dispatch.Signal VisualScriptNode
sig_ports_changed = Godot.Internal.Dispatch.Signal "ports_changed"

instance NodeSignal VisualScriptNode "ports_changed" '[]

instance NodeProperty VisualScriptNode "_default_input_values"
           Array
           'False
         where
        nodeProperty
          = (_get_default_input_values,
             wrapDroppingSetter _set_default_input_values, Nothing)

{-# NOINLINE bindVisualScriptNode__get_default_input_values #-}

bindVisualScriptNode__get_default_input_values :: MethodBind
bindVisualScriptNode__get_default_input_values
  = unsafePerformIO $
      withCString "VisualScriptNode" $
        \ clsNamePtr ->
          withCString "_get_default_input_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_default_input_values ::
                            (VisualScriptNode :< cls, Object :< cls) => cls -> IO Array
_get_default_input_values cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptNode__get_default_input_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptNode "_get_default_input_values"
           '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualScriptNode._get_default_input_values

{-# NOINLINE bindVisualScriptNode__set_default_input_values #-}

bindVisualScriptNode__set_default_input_values :: MethodBind
bindVisualScriptNode__set_default_input_values
  = unsafePerformIO $
      withCString "VisualScriptNode" $
        \ clsNamePtr ->
          withCString "_set_default_input_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_default_input_values ::
                            (VisualScriptNode :< cls, Object :< cls) => cls -> Array -> IO ()
_set_default_input_values cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptNode__set_default_input_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptNode "_set_default_input_values"
           '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptNode._set_default_input_values

{-# NOINLINE bindVisualScriptNode_get_default_input_value #-}

bindVisualScriptNode_get_default_input_value :: MethodBind
bindVisualScriptNode_get_default_input_value
  = unsafePerformIO $
      withCString "VisualScriptNode" $
        \ clsNamePtr ->
          withCString "get_default_input_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_default_input_value ::
                          (VisualScriptNode :< cls, Object :< cls) =>
                          cls -> Int -> IO GodotVariant
get_default_input_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptNode_get_default_input_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptNode "get_default_input_value"
           '[Int]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.VisualScriptNode.get_default_input_value

{-# NOINLINE bindVisualScriptNode_get_visual_script #-}

bindVisualScriptNode_get_visual_script :: MethodBind
bindVisualScriptNode_get_visual_script
  = unsafePerformIO $
      withCString "VisualScriptNode" $
        \ clsNamePtr ->
          withCString "get_visual_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_visual_script ::
                    (VisualScriptNode :< cls, Object :< cls) => cls -> IO VisualScript
get_visual_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptNode_get_visual_script
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptNode "get_visual_script" '[]
           (IO VisualScript)
         where
        nodeMethod = Godot.Core.VisualScriptNode.get_visual_script

{-# NOINLINE bindVisualScriptNode_ports_changed_notify #-}

bindVisualScriptNode_ports_changed_notify :: MethodBind
bindVisualScriptNode_ports_changed_notify
  = unsafePerformIO $
      withCString "VisualScriptNode" $
        \ clsNamePtr ->
          withCString "ports_changed_notify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

ports_changed_notify ::
                       (VisualScriptNode :< cls, Object :< cls) => cls -> IO ()
ports_changed_notify cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptNode_ports_changed_notify
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptNode "ports_changed_notify" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptNode.ports_changed_notify

{-# NOINLINE bindVisualScriptNode_set_default_input_value #-}

bindVisualScriptNode_set_default_input_value :: MethodBind
bindVisualScriptNode_set_default_input_value
  = unsafePerformIO $
      withCString "VisualScriptNode" $
        \ clsNamePtr ->
          withCString "set_default_input_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_default_input_value ::
                          (VisualScriptNode :< cls, Object :< cls) =>
                          cls -> Int -> GodotVariant -> IO ()
set_default_input_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptNode_set_default_input_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptNode "set_default_input_value"
           '[Int, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptNode.set_default_input_value