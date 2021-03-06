{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.VisualScriptEditor
       (Godot.Tools.VisualScriptEditor.sig_custom_nodes_updated,
        Godot.Tools.VisualScriptEditor.add_custom_node,
        Godot.Tools.VisualScriptEditor.remove_custom_node)
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
import Godot.Core.Object()

sig_custom_nodes_updated ::
                         Godot.Internal.Dispatch.Signal VisualScriptEditor
sig_custom_nodes_updated
  = Godot.Internal.Dispatch.Signal "custom_nodes_updated"

instance NodeSignal VisualScriptEditor "custom_nodes_updated" '[]

{-# NOINLINE bindVisualScriptEditor_add_custom_node #-}

bindVisualScriptEditor_add_custom_node :: MethodBind
bindVisualScriptEditor_add_custom_node
  = unsafePerformIO $
      withCString "_VisualScriptEditor" $
        \ clsNamePtr ->
          withCString "add_custom_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_custom_node ::
                  (VisualScriptEditor :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> Script -> IO ()
add_custom_node cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptEditor_add_custom_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptEditor "add_custom_node"
           '[GodotString, GodotString, Script]
           (IO ())
         where
        nodeMethod = Godot.Tools.VisualScriptEditor.add_custom_node

{-# NOINLINE bindVisualScriptEditor_remove_custom_node #-}

bindVisualScriptEditor_remove_custom_node :: MethodBind
bindVisualScriptEditor_remove_custom_node
  = unsafePerformIO $
      withCString "_VisualScriptEditor" $
        \ clsNamePtr ->
          withCString "remove_custom_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_custom_node ::
                     (VisualScriptEditor :< cls, Object :< cls) =>
                     cls -> GodotString -> GodotString -> IO ()
remove_custom_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptEditor_remove_custom_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptEditor "remove_custom_node"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Tools.VisualScriptEditor.remove_custom_node