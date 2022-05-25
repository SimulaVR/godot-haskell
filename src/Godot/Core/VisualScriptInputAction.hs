{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptInputAction
       (Godot.Core.VisualScriptInputAction._MODE_PRESSED,
        Godot.Core.VisualScriptInputAction._MODE_JUST_RELEASED,
        Godot.Core.VisualScriptInputAction._MODE_RELEASED,
        Godot.Core.VisualScriptInputAction._MODE_JUST_PRESSED,
        Godot.Core.VisualScriptInputAction.get_action_mode,
        Godot.Core.VisualScriptInputAction.get_action_name,
        Godot.Core.VisualScriptInputAction.set_action_mode,
        Godot.Core.VisualScriptInputAction.set_action_name)
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

_MODE_PRESSED :: Int
_MODE_PRESSED = 0

_MODE_JUST_RELEASED :: Int
_MODE_JUST_RELEASED = 3

_MODE_RELEASED :: Int
_MODE_RELEASED = 1

_MODE_JUST_PRESSED :: Int
_MODE_JUST_PRESSED = 2

instance NodeProperty VisualScriptInputAction "action" GodotString
           'False
         where
        nodeProperty
          = (get_action_name, wrapDroppingSetter set_action_name, Nothing)

instance NodeProperty VisualScriptInputAction "mode" Int 'False
         where
        nodeProperty
          = (get_action_mode, wrapDroppingSetter set_action_mode, Nothing)

{-# NOINLINE bindVisualScriptInputAction_get_action_mode #-}

bindVisualScriptInputAction_get_action_mode :: MethodBind
bindVisualScriptInputAction_get_action_mode
  = unsafePerformIO $
      withCString "VisualScriptInputAction" $
        \ clsNamePtr ->
          withCString "get_action_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_action_mode ::
                  (VisualScriptInputAction :< cls, Object :< cls) => cls -> IO Int
get_action_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptInputAction_get_action_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptInputAction "get_action_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptInputAction.get_action_mode

{-# NOINLINE bindVisualScriptInputAction_get_action_name #-}

bindVisualScriptInputAction_get_action_name :: MethodBind
bindVisualScriptInputAction_get_action_name
  = unsafePerformIO $
      withCString "VisualScriptInputAction" $
        \ clsNamePtr ->
          withCString "get_action_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_action_name ::
                  (VisualScriptInputAction :< cls, Object :< cls) =>
                  cls -> IO GodotString
get_action_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptInputAction_get_action_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptInputAction "get_action_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptInputAction.get_action_name

{-# NOINLINE bindVisualScriptInputAction_set_action_mode #-}

bindVisualScriptInputAction_set_action_mode :: MethodBind
bindVisualScriptInputAction_set_action_mode
  = unsafePerformIO $
      withCString "VisualScriptInputAction" $
        \ clsNamePtr ->
          withCString "set_action_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_action_mode ::
                  (VisualScriptInputAction :< cls, Object :< cls) =>
                  cls -> Int -> IO ()
set_action_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptInputAction_set_action_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptInputAction "set_action_mode"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptInputAction.set_action_mode

{-# NOINLINE bindVisualScriptInputAction_set_action_name #-}

bindVisualScriptInputAction_set_action_name :: MethodBind
bindVisualScriptInputAction_set_action_name
  = unsafePerformIO $
      withCString "VisualScriptInputAction" $
        \ clsNamePtr ->
          withCString "set_action_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_action_name ::
                  (VisualScriptInputAction :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
set_action_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptInputAction_set_action_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptInputAction "set_action_name"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptInputAction.set_action_name