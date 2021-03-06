{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptLists
       (Godot.Core.VisualScriptLists.add_input_data_port,
        Godot.Core.VisualScriptLists.add_output_data_port,
        Godot.Core.VisualScriptLists.remove_input_data_port,
        Godot.Core.VisualScriptLists.remove_output_data_port,
        Godot.Core.VisualScriptLists.set_input_data_port_name,
        Godot.Core.VisualScriptLists.set_input_data_port_type,
        Godot.Core.VisualScriptLists.set_output_data_port_name,
        Godot.Core.VisualScriptLists.set_output_data_port_type)
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
import Godot.Core.VisualScriptNode()

{-# NOINLINE bindVisualScriptLists_add_input_data_port #-}

bindVisualScriptLists_add_input_data_port :: MethodBind
bindVisualScriptLists_add_input_data_port
  = unsafePerformIO $
      withCString "VisualScriptLists" $
        \ clsNamePtr ->
          withCString "add_input_data_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_input_data_port ::
                      (VisualScriptLists :< cls, Object :< cls) =>
                      cls -> Int -> GodotString -> Int -> IO ()
add_input_data_port cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLists_add_input_data_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptLists "add_input_data_port"
           '[Int, GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptLists.add_input_data_port

{-# NOINLINE bindVisualScriptLists_add_output_data_port #-}

bindVisualScriptLists_add_output_data_port :: MethodBind
bindVisualScriptLists_add_output_data_port
  = unsafePerformIO $
      withCString "VisualScriptLists" $
        \ clsNamePtr ->
          withCString "add_output_data_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_output_data_port ::
                       (VisualScriptLists :< cls, Object :< cls) =>
                       cls -> Int -> GodotString -> Int -> IO ()
add_output_data_port cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLists_add_output_data_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptLists "add_output_data_port"
           '[Int, GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptLists.add_output_data_port

{-# NOINLINE bindVisualScriptLists_remove_input_data_port #-}

bindVisualScriptLists_remove_input_data_port :: MethodBind
bindVisualScriptLists_remove_input_data_port
  = unsafePerformIO $
      withCString "VisualScriptLists" $
        \ clsNamePtr ->
          withCString "remove_input_data_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_input_data_port ::
                         (VisualScriptLists :< cls, Object :< cls) => cls -> Int -> IO ()
remove_input_data_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptLists_remove_input_data_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptLists "remove_input_data_port"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptLists.remove_input_data_port

{-# NOINLINE bindVisualScriptLists_remove_output_data_port #-}

bindVisualScriptLists_remove_output_data_port :: MethodBind
bindVisualScriptLists_remove_output_data_port
  = unsafePerformIO $
      withCString "VisualScriptLists" $
        \ clsNamePtr ->
          withCString "remove_output_data_port" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_output_data_port ::
                          (VisualScriptLists :< cls, Object :< cls) => cls -> Int -> IO ()
remove_output_data_port cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptLists_remove_output_data_port
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptLists "remove_output_data_port"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptLists.remove_output_data_port

{-# NOINLINE bindVisualScriptLists_set_input_data_port_name #-}

bindVisualScriptLists_set_input_data_port_name :: MethodBind
bindVisualScriptLists_set_input_data_port_name
  = unsafePerformIO $
      withCString "VisualScriptLists" $
        \ clsNamePtr ->
          withCString "set_input_data_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_data_port_name ::
                           (VisualScriptLists :< cls, Object :< cls) =>
                           cls -> Int -> GodotString -> IO ()
set_input_data_port_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptLists_set_input_data_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptLists "set_input_data_port_name"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptLists.set_input_data_port_name

{-# NOINLINE bindVisualScriptLists_set_input_data_port_type #-}

bindVisualScriptLists_set_input_data_port_type :: MethodBind
bindVisualScriptLists_set_input_data_port_type
  = unsafePerformIO $
      withCString "VisualScriptLists" $
        \ clsNamePtr ->
          withCString "set_input_data_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_data_port_type ::
                           (VisualScriptLists :< cls, Object :< cls) =>
                           cls -> Int -> Int -> IO ()
set_input_data_port_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptLists_set_input_data_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptLists "set_input_data_port_type"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptLists.set_input_data_port_type

{-# NOINLINE bindVisualScriptLists_set_output_data_port_name #-}

bindVisualScriptLists_set_output_data_port_name :: MethodBind
bindVisualScriptLists_set_output_data_port_name
  = unsafePerformIO $
      withCString "VisualScriptLists" $
        \ clsNamePtr ->
          withCString "set_output_data_port_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_output_data_port_name ::
                            (VisualScriptLists :< cls, Object :< cls) =>
                            cls -> Int -> GodotString -> IO ()
set_output_data_port_name cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptLists_set_output_data_port_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptLists "set_output_data_port_name"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptLists.set_output_data_port_name

{-# NOINLINE bindVisualScriptLists_set_output_data_port_type #-}

bindVisualScriptLists_set_output_data_port_type :: MethodBind
bindVisualScriptLists_set_output_data_port_type
  = unsafePerformIO $
      withCString "VisualScriptLists" $
        \ clsNamePtr ->
          withCString "set_output_data_port_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_output_data_port_type ::
                            (VisualScriptLists :< cls, Object :< cls) =>
                            cls -> Int -> Int -> IO ()
set_output_data_port_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptLists_set_output_data_port_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptLists "set_output_data_port_type"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptLists.set_output_data_port_type