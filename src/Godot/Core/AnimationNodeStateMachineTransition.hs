{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNodeStateMachineTransition
       (Godot.Core.AnimationNodeStateMachineTransition._SWITCH_MODE_SYNC,
        Godot.Core.AnimationNodeStateMachineTransition._SWITCH_MODE_IMMEDIATE,
        Godot.Core.AnimationNodeStateMachineTransition._SWITCH_MODE_AT_END,
        Godot.Core.AnimationNodeStateMachineTransition.sig_advance_condition_changed,
        Godot.Core.AnimationNodeStateMachineTransition.get_advance_condition,
        Godot.Core.AnimationNodeStateMachineTransition.get_priority,
        Godot.Core.AnimationNodeStateMachineTransition.get_switch_mode,
        Godot.Core.AnimationNodeStateMachineTransition.get_xfade_time,
        Godot.Core.AnimationNodeStateMachineTransition.has_auto_advance,
        Godot.Core.AnimationNodeStateMachineTransition.is_disabled,
        Godot.Core.AnimationNodeStateMachineTransition.set_advance_condition,
        Godot.Core.AnimationNodeStateMachineTransition.set_auto_advance,
        Godot.Core.AnimationNodeStateMachineTransition.set_disabled,
        Godot.Core.AnimationNodeStateMachineTransition.set_priority,
        Godot.Core.AnimationNodeStateMachineTransition.set_switch_mode,
        Godot.Core.AnimationNodeStateMachineTransition.set_xfade_time)
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

_SWITCH_MODE_SYNC :: Int
_SWITCH_MODE_SYNC = 1

_SWITCH_MODE_IMMEDIATE :: Int
_SWITCH_MODE_IMMEDIATE = 0

_SWITCH_MODE_AT_END :: Int
_SWITCH_MODE_AT_END = 2

-- | Emitted when @advance_condition@ is changed.
sig_advance_condition_changed ::
                              Godot.Internal.Dispatch.Signal AnimationNodeStateMachineTransition
sig_advance_condition_changed
  = Godot.Internal.Dispatch.Signal "advance_condition_changed"

instance NodeSignal AnimationNodeStateMachineTransition
           "advance_condition_changed"
           '[]

instance NodeProperty AnimationNodeStateMachineTransition
           "advance_condition"
           GodotString
           'False
         where
        nodeProperty
          = (get_advance_condition, wrapDroppingSetter set_advance_condition,
             Nothing)

instance NodeProperty AnimationNodeStateMachineTransition
           "auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (has_auto_advance, wrapDroppingSetter set_auto_advance, Nothing)

instance NodeProperty AnimationNodeStateMachineTransition
           "disabled"
           Bool
           'False
         where
        nodeProperty
          = (is_disabled, wrapDroppingSetter set_disabled, Nothing)

instance NodeProperty AnimationNodeStateMachineTransition
           "priority"
           Int
           'False
         where
        nodeProperty
          = (get_priority, wrapDroppingSetter set_priority, Nothing)

instance NodeProperty AnimationNodeStateMachineTransition
           "switch_mode"
           Int
           'False
         where
        nodeProperty
          = (get_switch_mode, wrapDroppingSetter set_switch_mode, Nothing)

instance NodeProperty AnimationNodeStateMachineTransition
           "xfade_time"
           Float
           'False
         where
        nodeProperty
          = (get_xfade_time, wrapDroppingSetter set_xfade_time, Nothing)

{-# NOINLINE bindAnimationNodeStateMachineTransition_get_advance_condition
             #-}

-- | Turn on auto advance when this condition is set. The provided name will become a boolean parameter on the @AnimationTree@ that can be controlled from code (see @url=https://docs.godotengine.org/en/latest/tutorials/animation/animation_tree.html#controlling-from-code@@/url@). For example, if @AnimationTree.tree_root@ is an @AnimationNodeStateMachine@ and @advance_condition@ is set to @"idle"@:
--   			
--   @
--   
--   			$animation_tree@"parameters/conditions/idle"@ = is_on_floor and (linear_velocity.x == 0)
--   			
--   @
bindAnimationNodeStateMachineTransition_get_advance_condition ::
                                                              MethodBind
bindAnimationNodeStateMachineTransition_get_advance_condition
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "get_advance_condition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turn on auto advance when this condition is set. The provided name will become a boolean parameter on the @AnimationTree@ that can be controlled from code (see @url=https://docs.godotengine.org/en/latest/tutorials/animation/animation_tree.html#controlling-from-code@@/url@). For example, if @AnimationTree.tree_root@ is an @AnimationNodeStateMachine@ and @advance_condition@ is set to @"idle"@:
--   			
--   @
--   
--   			$animation_tree@"parameters/conditions/idle"@ = is_on_floor and (linear_velocity.x == 0)
--   			
--   @
get_advance_condition ::
                        (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                        cls -> IO GodotString
get_advance_condition cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_get_advance_condition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "get_advance_condition"
           '[]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.get_advance_condition

{-# NOINLINE bindAnimationNodeStateMachineTransition_get_priority
             #-}

-- | Lower priority transitions are preferred when travelling through the tree via @method AnimationNodeStateMachinePlayback.travel@ or @auto_advance@.
bindAnimationNodeStateMachineTransition_get_priority :: MethodBind
bindAnimationNodeStateMachineTransition_get_priority
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "get_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lower priority transitions are preferred when travelling through the tree via @method AnimationNodeStateMachinePlayback.travel@ or @auto_advance@.
get_priority ::
               (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
               cls -> IO Int
get_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_get_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "get_priority"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.get_priority

{-# NOINLINE bindAnimationNodeStateMachineTransition_get_switch_mode
             #-}

-- | The transition type.
bindAnimationNodeStateMachineTransition_get_switch_mode ::
                                                        MethodBind
bindAnimationNodeStateMachineTransition_get_switch_mode
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "get_switch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition type.
get_switch_mode ::
                  (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                  cls -> IO Int
get_switch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_get_switch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "get_switch_mode"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.get_switch_mode

{-# NOINLINE bindAnimationNodeStateMachineTransition_get_xfade_time
             #-}

-- | The time to cross-fade between this state and the next.
bindAnimationNodeStateMachineTransition_get_xfade_time ::
                                                       MethodBind
bindAnimationNodeStateMachineTransition_get_xfade_time
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "get_xfade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time to cross-fade between this state and the next.
get_xfade_time ::
                 (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                 cls -> IO Float
get_xfade_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_get_xfade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "get_xfade_time"
           '[]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.get_xfade_time

{-# NOINLINE bindAnimationNodeStateMachineTransition_has_auto_advance
             #-}

-- | Turn on the transition automatically when this state is reached. This works best with @SWITCH_MODE_AT_END@.
bindAnimationNodeStateMachineTransition_has_auto_advance ::
                                                         MethodBind
bindAnimationNodeStateMachineTransition_has_auto_advance
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "has_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turn on the transition automatically when this state is reached. This works best with @SWITCH_MODE_AT_END@.
has_auto_advance ::
                   (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                   cls -> IO Bool
has_auto_advance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_has_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "has_auto_advance"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.has_auto_advance

{-# NOINLINE bindAnimationNodeStateMachineTransition_is_disabled
             #-}

-- | Don't use this transition during @method AnimationNodeStateMachinePlayback.travel@ or @auto_advance@.
bindAnimationNodeStateMachineTransition_is_disabled :: MethodBind
bindAnimationNodeStateMachineTransition_is_disabled
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "is_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Don't use this transition during @method AnimationNodeStateMachinePlayback.travel@ or @auto_advance@.
is_disabled ::
              (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
              cls -> IO Bool
is_disabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_is_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "is_disabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.is_disabled

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_advance_condition
             #-}

-- | Turn on auto advance when this condition is set. The provided name will become a boolean parameter on the @AnimationTree@ that can be controlled from code (see @url=https://docs.godotengine.org/en/latest/tutorials/animation/animation_tree.html#controlling-from-code@@/url@). For example, if @AnimationTree.tree_root@ is an @AnimationNodeStateMachine@ and @advance_condition@ is set to @"idle"@:
--   			
--   @
--   
--   			$animation_tree@"parameters/conditions/idle"@ = is_on_floor and (linear_velocity.x == 0)
--   			
--   @
bindAnimationNodeStateMachineTransition_set_advance_condition ::
                                                              MethodBind
bindAnimationNodeStateMachineTransition_set_advance_condition
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_advance_condition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turn on auto advance when this condition is set. The provided name will become a boolean parameter on the @AnimationTree@ that can be controlled from code (see @url=https://docs.godotengine.org/en/latest/tutorials/animation/animation_tree.html#controlling-from-code@@/url@). For example, if @AnimationTree.tree_root@ is an @AnimationNodeStateMachine@ and @advance_condition@ is set to @"idle"@:
--   			
--   @
--   
--   			$animation_tree@"parameters/conditions/idle"@ = is_on_floor and (linear_velocity.x == 0)
--   			
--   @
set_advance_condition ::
                        (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                        cls -> GodotString -> IO ()
set_advance_condition cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_advance_condition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "set_advance_condition"
           '[GodotString]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.set_advance_condition

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_auto_advance
             #-}

-- | Turn on the transition automatically when this state is reached. This works best with @SWITCH_MODE_AT_END@.
bindAnimationNodeStateMachineTransition_set_auto_advance ::
                                                         MethodBind
bindAnimationNodeStateMachineTransition_set_auto_advance
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Turn on the transition automatically when this state is reached. This works best with @SWITCH_MODE_AT_END@.
set_auto_advance ::
                   (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                   cls -> Bool -> IO ()
set_auto_advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "set_auto_advance"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.set_auto_advance

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_disabled
             #-}

-- | Don't use this transition during @method AnimationNodeStateMachinePlayback.travel@ or @auto_advance@.
bindAnimationNodeStateMachineTransition_set_disabled :: MethodBind
bindAnimationNodeStateMachineTransition_set_disabled
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_disabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Don't use this transition during @method AnimationNodeStateMachinePlayback.travel@ or @auto_advance@.
set_disabled ::
               (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
               cls -> Bool -> IO ()
set_disabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_disabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "set_disabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.set_disabled

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_priority
             #-}

-- | Lower priority transitions are preferred when travelling through the tree via @method AnimationNodeStateMachinePlayback.travel@ or @auto_advance@.
bindAnimationNodeStateMachineTransition_set_priority :: MethodBind
bindAnimationNodeStateMachineTransition_set_priority
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Lower priority transitions are preferred when travelling through the tree via @method AnimationNodeStateMachinePlayback.travel@ or @auto_advance@.
set_priority ::
               (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "set_priority"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.set_priority

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_switch_mode
             #-}

-- | The transition type.
bindAnimationNodeStateMachineTransition_set_switch_mode ::
                                                        MethodBind
bindAnimationNodeStateMachineTransition_set_switch_mode
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_switch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition type.
set_switch_mode ::
                  (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                  cls -> Int -> IO ()
set_switch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_switch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "set_switch_mode"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.set_switch_mode

{-# NOINLINE bindAnimationNodeStateMachineTransition_set_xfade_time
             #-}

-- | The time to cross-fade between this state and the next.
bindAnimationNodeStateMachineTransition_set_xfade_time ::
                                                       MethodBind
bindAnimationNodeStateMachineTransition_set_xfade_time
  = unsafePerformIO $
      withCString "AnimationNodeStateMachineTransition" $
        \ clsNamePtr ->
          withCString "set_xfade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time to cross-fade between this state and the next.
set_xfade_time ::
                 (AnimationNodeStateMachineTransition :< cls, Object :< cls) =>
                 cls -> Float -> IO ()
set_xfade_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachineTransition_set_xfade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeStateMachineTransition
           "set_xfade_time"
           '[Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeStateMachineTransition.set_xfade_time