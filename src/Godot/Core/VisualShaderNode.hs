{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNode
       (Godot.Core.VisualShaderNode._PORT_TYPE_MAX,
        Godot.Core.VisualShaderNode._PORT_TYPE_TRANSFORM,
        Godot.Core.VisualShaderNode._PORT_TYPE_VECTOR,
        Godot.Core.VisualShaderNode._PORT_TYPE_SCALAR,
        Godot.Core.VisualShaderNode._PORT_TYPE_SAMPLER,
        Godot.Core.VisualShaderNode._PORT_TYPE_BOOLEAN,
        Godot.Core.VisualShaderNode.sig_editor_refresh_request,
        Godot.Core.VisualShaderNode.get_default_input_values,
        Godot.Core.VisualShaderNode.get_input_port_default_value,
        Godot.Core.VisualShaderNode.get_output_port_for_preview,
        Godot.Core.VisualShaderNode.set_default_input_values,
        Godot.Core.VisualShaderNode.set_input_port_default_value,
        Godot.Core.VisualShaderNode.set_output_port_for_preview)
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

_PORT_TYPE_MAX :: Int
_PORT_TYPE_MAX = 5

_PORT_TYPE_TRANSFORM :: Int
_PORT_TYPE_TRANSFORM = 3

_PORT_TYPE_VECTOR :: Int
_PORT_TYPE_VECTOR = 1

_PORT_TYPE_SCALAR :: Int
_PORT_TYPE_SCALAR = 0

_PORT_TYPE_SAMPLER :: Int
_PORT_TYPE_SAMPLER = 4

_PORT_TYPE_BOOLEAN :: Int
_PORT_TYPE_BOOLEAN = 2

-- | Emitted when the node requests an editor refresh. Currently called only in setter of @VisualShaderNodeTexture.source@, @VisualShaderNodeTexture@, and @VisualShaderNodeCubeMap@ (and their derivatives).
sig_editor_refresh_request ::
                           Godot.Internal.Dispatch.Signal VisualShaderNode
sig_editor_refresh_request
  = Godot.Internal.Dispatch.Signal "editor_refresh_request"

instance NodeSignal VisualShaderNode "editor_refresh_request" '[]

instance NodeProperty VisualShaderNode "default_input_values" Array
           'False
         where
        nodeProperty
          = (get_default_input_values,
             wrapDroppingSetter set_default_input_values, Nothing)

instance NodeProperty VisualShaderNode "output_port_for_preview"
           Int
           'False
         where
        nodeProperty
          = (get_output_port_for_preview,
             wrapDroppingSetter set_output_port_for_preview, Nothing)

{-# NOINLINE bindVisualShaderNode_get_default_input_values #-}

-- | Returns an @Array@ containing default values for all of the input ports of the node in the form @@index0, value0, index1, value1, ...@@.
bindVisualShaderNode_get_default_input_values :: MethodBind
bindVisualShaderNode_get_default_input_values
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "get_default_input_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ containing default values for all of the input ports of the node in the form @@index0, value0, index1, value1, ...@@.
get_default_input_values ::
                           (VisualShaderNode :< cls, Object :< cls) => cls -> IO Array
get_default_input_values cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_get_default_input_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNode "get_default_input_values" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualShaderNode.get_default_input_values

{-# NOINLINE bindVisualShaderNode_get_input_port_default_value #-}

-- | Returns the default value of the input @port@.
bindVisualShaderNode_get_input_port_default_value :: MethodBind
bindVisualShaderNode_get_input_port_default_value
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "get_input_port_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the default value of the input @port@.
get_input_port_default_value ::
                               (VisualShaderNode :< cls, Object :< cls) =>
                               cls -> Int -> IO GodotVariant
get_input_port_default_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_get_input_port_default_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNode "get_input_port_default_value"
           '[Int]
           (IO GodotVariant)
         where
        nodeMethod
          = Godot.Core.VisualShaderNode.get_input_port_default_value

{-# NOINLINE bindVisualShaderNode_get_output_port_for_preview #-}

-- | Sets the output port index which will be showed for preview. If set to @-1@ no port will be open for preview.
bindVisualShaderNode_get_output_port_for_preview :: MethodBind
bindVisualShaderNode_get_output_port_for_preview
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "get_output_port_for_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the output port index which will be showed for preview. If set to @-1@ no port will be open for preview.
get_output_port_for_preview ::
                              (VisualShaderNode :< cls, Object :< cls) => cls -> IO Int
get_output_port_for_preview cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_get_output_port_for_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNode "get_output_port_for_preview"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualShaderNode.get_output_port_for_preview

{-# NOINLINE bindVisualShaderNode_set_default_input_values #-}

-- | Sets the default input ports values using an @Array@ of the form @@index0, value0, index1, value1, ...@@. For example: @@0, Vector3(0, 0, 0), 1, Vector3(0, 0, 0)@@.
bindVisualShaderNode_set_default_input_values :: MethodBind
bindVisualShaderNode_set_default_input_values
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "set_default_input_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default input ports values using an @Array@ of the form @@index0, value0, index1, value1, ...@@. For example: @@0, Vector3(0, 0, 0), 1, Vector3(0, 0, 0)@@.
set_default_input_values ::
                           (VisualShaderNode :< cls, Object :< cls) => cls -> Array -> IO ()
set_default_input_values cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_set_default_input_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNode "set_default_input_values"
           '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNode.set_default_input_values

{-# NOINLINE bindVisualShaderNode_set_input_port_default_value #-}

-- | Sets the default value for the selected input @port@.
bindVisualShaderNode_set_input_port_default_value :: MethodBind
bindVisualShaderNode_set_input_port_default_value
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "set_input_port_default_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default value for the selected input @port@.
set_input_port_default_value ::
                               (VisualShaderNode :< cls, Object :< cls) =>
                               cls -> Int -> GodotVariant -> IO ()
set_input_port_default_value cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_set_input_port_default_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNode "set_input_port_default_value"
           '[Int, GodotVariant]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNode.set_input_port_default_value

{-# NOINLINE bindVisualShaderNode_set_output_port_for_preview #-}

-- | Sets the output port index which will be showed for preview. If set to @-1@ no port will be open for preview.
bindVisualShaderNode_set_output_port_for_preview :: MethodBind
bindVisualShaderNode_set_output_port_for_preview
  = unsafePerformIO $
      withCString "VisualShaderNode" $
        \ clsNamePtr ->
          withCString "set_output_port_for_preview" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the output port index which will be showed for preview. If set to @-1@ no port will be open for preview.
set_output_port_for_preview ::
                              (VisualShaderNode :< cls, Object :< cls) => cls -> Int -> IO ()
set_output_port_for_preview cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNode_set_output_port_for_preview
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNode "set_output_port_for_preview"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNode.set_output_port_for_preview