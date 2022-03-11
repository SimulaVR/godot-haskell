{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeGroupBase
       (Godot.Core.VisualShaderNodeGroupBase.add_input_port,
        Godot.Core.VisualShaderNodeGroupBase.add_output_port,
        Godot.Core.VisualShaderNodeGroupBase.clear_input_ports,
        Godot.Core.VisualShaderNodeGroupBase.clear_output_ports,
        Godot.Core.VisualShaderNodeGroupBase.get_free_input_port_id,
        Godot.Core.VisualShaderNodeGroupBase.get_free_output_port_id,
        Godot.Core.VisualShaderNodeGroupBase.get_input_port_count,
        Godot.Core.VisualShaderNodeGroupBase.get_inputs,
        Godot.Core.VisualShaderNodeGroupBase.get_output_port_count,
        Godot.Core.VisualShaderNodeGroupBase.get_outputs,
        Godot.Core.VisualShaderNodeGroupBase.get_size,
        Godot.Core.VisualShaderNodeGroupBase.has_input_port,
        Godot.Core.VisualShaderNodeGroupBase.has_output_port,
        Godot.Core.VisualShaderNodeGroupBase.is_valid_port_name,
        Godot.Core.VisualShaderNodeGroupBase.remove_input_port,
        Godot.Core.VisualShaderNodeGroupBase.remove_output_port,
        Godot.Core.VisualShaderNodeGroupBase.set_input_port_name,
        Godot.Core.VisualShaderNodeGroupBase.set_input_port_type,
        Godot.Core.VisualShaderNodeGroupBase.set_inputs,
        Godot.Core.VisualShaderNodeGroupBase.set_output_port_name,
        Godot.Core.VisualShaderNodeGroupBase.set_output_port_type,
        Godot.Core.VisualShaderNodeGroupBase.set_outputs,
        Godot.Core.VisualShaderNodeGroupBase.set_size)
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
import Godot.Core.VisualShaderNode()

instance NodeProperty VisualShaderNodeGroupBase "size" Vector2
           'False
         where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

{-# NOINLINE bindVisualShaderNodeGroupBase_add_input_port #-}

-- | Adds an input port with the specified @type@ (see @enum VisualShaderNode.PortType@) and @name@.
bindVisualShaderNodeGroupBase_add_input_port :: MethodBind
bindVisualShaderNodeGroupBase_add_input_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "add_input_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an input port with the specified @type@ (see @enum VisualShaderNode.PortType@) and @name@.
add_input_port ::
                 (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                 cls -> Int -> Int -> GodotString -> IO ()
add_input_port cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_add_input_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "add_input_port"
           '[Int, Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.add_input_port

{-# NOINLINE bindVisualShaderNodeGroupBase_add_output_port #-}

-- | Adds an output port with the specified @type@ (see @enum VisualShaderNode.PortType@) and @name@.
bindVisualShaderNodeGroupBase_add_output_port :: MethodBind
bindVisualShaderNodeGroupBase_add_output_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "add_output_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an output port with the specified @type@ (see @enum VisualShaderNode.PortType@) and @name@.
add_output_port ::
                  (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                  cls -> Int -> Int -> GodotString -> IO ()
add_output_port cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_add_output_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "add_output_port"
           '[Int, Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.add_output_port

{-# NOINLINE bindVisualShaderNodeGroupBase_clear_input_ports #-}

-- | Removes all previously specified input ports.
bindVisualShaderNodeGroupBase_clear_input_ports :: MethodBind
bindVisualShaderNodeGroupBase_clear_input_ports
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "clear_input_ports" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all previously specified input ports.
clear_input_ports ::
                    (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO ()
clear_input_ports cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_clear_input_ports
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "clear_input_ports"
           '[]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.clear_input_ports

{-# NOINLINE bindVisualShaderNodeGroupBase_clear_output_ports #-}

-- | Removes all previously specified output ports.
bindVisualShaderNodeGroupBase_clear_output_ports :: MethodBind
bindVisualShaderNodeGroupBase_clear_output_ports
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "clear_output_ports" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all previously specified output ports.
clear_output_ports ::
                     (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO ()
clear_output_ports cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_clear_output_ports
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "clear_output_ports"
           '[]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.clear_output_ports

{-# NOINLINE bindVisualShaderNodeGroupBase_get_free_input_port_id
             #-}

-- | Returns a free input port ID which can be used in @method add_input_port@.
bindVisualShaderNodeGroupBase_get_free_input_port_id :: MethodBind
bindVisualShaderNodeGroupBase_get_free_input_port_id
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_free_input_port_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a free input port ID which can be used in @method add_input_port@.
get_free_input_port_id ::
                         (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO Int
get_free_input_port_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_get_free_input_port_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase
           "get_free_input_port_id"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.get_free_input_port_id

{-# NOINLINE bindVisualShaderNodeGroupBase_get_free_output_port_id
             #-}

-- | Returns a free output port ID which can be used in @method add_output_port@.
bindVisualShaderNodeGroupBase_get_free_output_port_id :: MethodBind
bindVisualShaderNodeGroupBase_get_free_output_port_id
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_free_output_port_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a free output port ID which can be used in @method add_output_port@.
get_free_output_port_id ::
                          (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO Int
get_free_output_port_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_get_free_output_port_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase
           "get_free_output_port_id"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.get_free_output_port_id

{-# NOINLINE bindVisualShaderNodeGroupBase_get_input_port_count #-}

-- | Returns the number of input ports in use. Alternative for @method get_free_input_port_id@.
bindVisualShaderNodeGroupBase_get_input_port_count :: MethodBind
bindVisualShaderNodeGroupBase_get_input_port_count
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_input_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of input ports in use. Alternative for @method get_free_input_port_id@.
get_input_port_count ::
                       (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO Int
get_input_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_get_input_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase
           "get_input_port_count"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.get_input_port_count

{-# NOINLINE bindVisualShaderNodeGroupBase_get_inputs #-}

-- | Returns a @String@ description of the input ports as a colon-separated list using the format @id,type,name;@ (see @method add_input_port@).
bindVisualShaderNodeGroupBase_get_inputs :: MethodBind
bindVisualShaderNodeGroupBase_get_inputs
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @String@ description of the input ports as a colon-separated list using the format @id,type,name;@ (see @method add_input_port@).
get_inputs ::
             (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
             cls -> IO GodotString
get_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_get_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "get_inputs" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.get_inputs

{-# NOINLINE bindVisualShaderNodeGroupBase_get_output_port_count
             #-}

-- | Returns the number of output ports in use. Alternative for @method get_free_output_port_id@.
bindVisualShaderNodeGroupBase_get_output_port_count :: MethodBind
bindVisualShaderNodeGroupBase_get_output_port_count
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_output_port_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of output ports in use. Alternative for @method get_free_output_port_id@.
get_output_port_count ::
                        (VisualShaderNodeGroupBase :< cls, Object :< cls) => cls -> IO Int
get_output_port_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_get_output_port_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase
           "get_output_port_count"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.get_output_port_count

{-# NOINLINE bindVisualShaderNodeGroupBase_get_outputs #-}

-- | Returns a @String@ description of the output ports as a colon-separated list using the format @id,type,name;@ (see @method add_output_port@).
bindVisualShaderNodeGroupBase_get_outputs :: MethodBind
bindVisualShaderNodeGroupBase_get_outputs
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_outputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @String@ description of the output ports as a colon-separated list using the format @id,type,name;@ (see @method add_output_port@).
get_outputs ::
              (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
              cls -> IO GodotString
get_outputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_get_outputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "get_outputs" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.get_outputs

{-# NOINLINE bindVisualShaderNodeGroupBase_get_size #-}

-- | The size of the node in the visual shader graph.
bindVisualShaderNodeGroupBase_get_size :: MethodBind
bindVisualShaderNodeGroupBase_get_size
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the node in the visual shader graph.
get_size ::
           (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
           cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_get_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "get_size" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.get_size

{-# NOINLINE bindVisualShaderNodeGroupBase_has_input_port #-}

-- | Returns @true@ if the specified input port exists.
bindVisualShaderNodeGroupBase_has_input_port :: MethodBind
bindVisualShaderNodeGroupBase_has_input_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "has_input_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified input port exists.
has_input_port ::
                 (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                 cls -> Int -> IO Bool
has_input_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_has_input_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "has_input_port"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.has_input_port

{-# NOINLINE bindVisualShaderNodeGroupBase_has_output_port #-}

-- | Returns @true@ if the specified output port exists.
bindVisualShaderNodeGroupBase_has_output_port :: MethodBind
bindVisualShaderNodeGroupBase_has_output_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "has_output_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified output port exists.
has_output_port ::
                  (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                  cls -> Int -> IO Bool
has_output_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_has_output_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "has_output_port"
           '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.has_output_port

{-# NOINLINE bindVisualShaderNodeGroupBase_is_valid_port_name #-}

-- | Returns @true@ if the specified port name does not override an existed port name and is valid within the shader.
bindVisualShaderNodeGroupBase_is_valid_port_name :: MethodBind
bindVisualShaderNodeGroupBase_is_valid_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "is_valid_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified port name does not override an existed port name and is valid within the shader.
is_valid_port_name ::
                     (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                     cls -> GodotString -> IO Bool
is_valid_port_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_is_valid_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "is_valid_port_name"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.is_valid_port_name

{-# NOINLINE bindVisualShaderNodeGroupBase_remove_input_port #-}

-- | Removes the specified input port.
bindVisualShaderNodeGroupBase_remove_input_port :: MethodBind
bindVisualShaderNodeGroupBase_remove_input_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "remove_input_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the specified input port.
remove_input_port ::
                    (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                    cls -> Int -> IO ()
remove_input_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_remove_input_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "remove_input_port"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.remove_input_port

{-# NOINLINE bindVisualShaderNodeGroupBase_remove_output_port #-}

-- | Removes the specified output port.
bindVisualShaderNodeGroupBase_remove_output_port :: MethodBind
bindVisualShaderNodeGroupBase_remove_output_port
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "remove_output_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the specified output port.
remove_output_port ::
                     (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                     cls -> Int -> IO ()
remove_output_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_remove_output_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "remove_output_port"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.remove_output_port

{-# NOINLINE bindVisualShaderNodeGroupBase_set_input_port_name #-}

-- | Renames the specified input port.
bindVisualShaderNodeGroupBase_set_input_port_name :: MethodBind
bindVisualShaderNodeGroupBase_set_input_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_input_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames the specified input port.
set_input_port_name ::
                      (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                      cls -> Int -> GodotString -> IO ()
set_input_port_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_set_input_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "set_input_port_name"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.set_input_port_name

{-# NOINLINE bindVisualShaderNodeGroupBase_set_input_port_type #-}

-- | Sets the specified input port's type (see @enum VisualShaderNode.PortType@).
bindVisualShaderNodeGroupBase_set_input_port_type :: MethodBind
bindVisualShaderNodeGroupBase_set_input_port_type
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_input_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified input port's type (see @enum VisualShaderNode.PortType@).
set_input_port_type ::
                      (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                      cls -> Int -> Int -> IO ()
set_input_port_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_set_input_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "set_input_port_type"
           '[Int, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.set_input_port_type

{-# NOINLINE bindVisualShaderNodeGroupBase_set_inputs #-}

-- | Defines all input ports using a @String@ formatted as a colon-separated list: @id,type,name;@ (see @method add_input_port@).
bindVisualShaderNodeGroupBase_set_inputs :: MethodBind
bindVisualShaderNodeGroupBase_set_inputs
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines all input ports using a @String@ formatted as a colon-separated list: @id,type,name;@ (see @method add_input_port@).
set_inputs ::
             (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
             cls -> GodotString -> IO ()
set_inputs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_set_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "set_inputs"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.set_inputs

{-# NOINLINE bindVisualShaderNodeGroupBase_set_output_port_name #-}

-- | Renames the specified output port.
bindVisualShaderNodeGroupBase_set_output_port_name :: MethodBind
bindVisualShaderNodeGroupBase_set_output_port_name
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_output_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames the specified output port.
set_output_port_name ::
                       (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                       cls -> Int -> GodotString -> IO ()
set_output_port_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_set_output_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase
           "set_output_port_name"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.set_output_port_name

{-# NOINLINE bindVisualShaderNodeGroupBase_set_output_port_type #-}

-- | Sets the specified output port's type (see @enum VisualShaderNode.PortType@).
bindVisualShaderNodeGroupBase_set_output_port_type :: MethodBind
bindVisualShaderNodeGroupBase_set_output_port_type
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_output_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified output port's type (see @enum VisualShaderNode.PortType@).
set_output_port_type ::
                       (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
                       cls -> Int -> Int -> IO ()
set_output_port_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeGroupBase_set_output_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase
           "set_output_port_type"
           '[Int, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualShaderNodeGroupBase.set_output_port_type

{-# NOINLINE bindVisualShaderNodeGroupBase_set_outputs #-}

-- | Defines all output ports using a @String@ formatted as a colon-separated list: @id,type,name;@ (see @method add_output_port@).
bindVisualShaderNodeGroupBase_set_outputs :: MethodBind
bindVisualShaderNodeGroupBase_set_outputs
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_outputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines all output ports using a @String@ formatted as a colon-separated list: @id,type,name;@ (see @method add_output_port@).
set_outputs ::
              (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
set_outputs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_set_outputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "set_outputs"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.set_outputs

{-# NOINLINE bindVisualShaderNodeGroupBase_set_size #-}

-- | The size of the node in the visual shader graph.
bindVisualShaderNodeGroupBase_set_size :: MethodBind
bindVisualShaderNodeGroupBase_set_size
  = unsafePerformIO $
      withCString "VisualShaderNodeGroupBase" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the node in the visual shader graph.
set_size ::
           (VisualShaderNodeGroupBase :< cls, Object :< cls) =>
           cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeGroupBase_set_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeGroupBase "set_size" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeGroupBase.set_size