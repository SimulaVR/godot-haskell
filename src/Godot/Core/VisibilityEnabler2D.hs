{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisibilityEnabler2D
       (Godot.Core.VisibilityEnabler2D._ENABLER_PARENT_PROCESS,
        Godot.Core.VisibilityEnabler2D._ENABLER_MAX,
        Godot.Core.VisibilityEnabler2D._ENABLER_PARENT_PHYSICS_PROCESS,
        Godot.Core.VisibilityEnabler2D._ENABLER_PAUSE_ANIMATIONS,
        Godot.Core.VisibilityEnabler2D._ENABLER_PAUSE_ANIMATED_SPRITES,
        Godot.Core.VisibilityEnabler2D._ENABLER_PAUSE_PARTICLES,
        Godot.Core.VisibilityEnabler2D._ENABLER_FREEZE_BODIES,
        Godot.Core.VisibilityEnabler2D.set_enabler,
        Godot.Core.VisibilityEnabler2D.is_enabler_enabled,
        Godot.Core.VisibilityEnabler2D._node_removed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ENABLER_PARENT_PROCESS :: Int
_ENABLER_PARENT_PROCESS = 3

_ENABLER_MAX :: Int
_ENABLER_MAX = 6

_ENABLER_PARENT_PHYSICS_PROCESS :: Int
_ENABLER_PARENT_PHYSICS_PROCESS = 4

_ENABLER_PAUSE_ANIMATIONS :: Int
_ENABLER_PAUSE_ANIMATIONS = 0

_ENABLER_PAUSE_ANIMATED_SPRITES :: Int
_ENABLER_PAUSE_ANIMATED_SPRITES = 5

_ENABLER_PAUSE_PARTICLES :: Int
_ENABLER_PAUSE_PARTICLES = 2

_ENABLER_FREEZE_BODIES :: Int
_ENABLER_FREEZE_BODIES = 1

{-# NOINLINE bindVisibilityEnabler2D_set_enabler #-}

-- | If [code]true[/code], [RigidBody2D] nodes will be paused.
bindVisibilityEnabler2D_set_enabler :: MethodBind
bindVisibilityEnabler2D_set_enabler
  = unsafePerformIO $
      withCString "VisibilityEnabler2D" $
        \ clsNamePtr ->
          withCString "set_enabler" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [RigidBody2D] nodes will be paused.
set_enabler ::
              (VisibilityEnabler2D :< cls, Object :< cls) =>
              cls -> Int -> Bool -> IO ()
set_enabler cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler2D_set_enabler
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisibilityEnabler2D_is_enabler_enabled #-}

-- | If [code]true[/code], [RigidBody2D] nodes will be paused.
bindVisibilityEnabler2D_is_enabler_enabled :: MethodBind
bindVisibilityEnabler2D_is_enabler_enabled
  = unsafePerformIO $
      withCString "VisibilityEnabler2D" $
        \ clsNamePtr ->
          withCString "is_enabler_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [RigidBody2D] nodes will be paused.
is_enabler_enabled ::
                     (VisibilityEnabler2D :< cls, Object :< cls) =>
                     cls -> Int -> IO Bool
is_enabler_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler2D_is_enabler_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisibilityEnabler2D__node_removed #-}

bindVisibilityEnabler2D__node_removed :: MethodBind
bindVisibilityEnabler2D__node_removed
  = unsafePerformIO $
      withCString "VisibilityEnabler2D" $
        \ clsNamePtr ->
          withCString "_node_removed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_removed ::
                (VisibilityEnabler2D :< cls, Object :< cls) => cls -> Node -> IO ()
_node_removed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler2D__node_removed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)