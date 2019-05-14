{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationNodeStateMachine
       (Godot.Core.AnimationNodeStateMachine.add_node,
        Godot.Core.AnimationNodeStateMachine.get_node,
        Godot.Core.AnimationNodeStateMachine.remove_node,
        Godot.Core.AnimationNodeStateMachine.rename_node,
        Godot.Core.AnimationNodeStateMachine.has_node,
        Godot.Core.AnimationNodeStateMachine.get_node_name,
        Godot.Core.AnimationNodeStateMachine.set_node_position,
        Godot.Core.AnimationNodeStateMachine.get_node_position,
        Godot.Core.AnimationNodeStateMachine.has_transition,
        Godot.Core.AnimationNodeStateMachine.add_transition,
        Godot.Core.AnimationNodeStateMachine.get_transition,
        Godot.Core.AnimationNodeStateMachine.get_transition_from,
        Godot.Core.AnimationNodeStateMachine.get_transition_to,
        Godot.Core.AnimationNodeStateMachine.get_transition_count,
        Godot.Core.AnimationNodeStateMachine.remove_transition_by_index,
        Godot.Core.AnimationNodeStateMachine.remove_transition,
        Godot.Core.AnimationNodeStateMachine.set_start_node,
        Godot.Core.AnimationNodeStateMachine.get_start_node,
        Godot.Core.AnimationNodeStateMachine.set_end_node,
        Godot.Core.AnimationNodeStateMachine.get_end_node,
        Godot.Core.AnimationNodeStateMachine.set_graph_offset,
        Godot.Core.AnimationNodeStateMachine.get_graph_offset,
        Godot.Core.AnimationNodeStateMachine._tree_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindAnimationNodeStateMachine_add_node #-}

bindAnimationNodeStateMachine_add_node :: MethodBind
bindAnimationNodeStateMachine_add_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "add_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_node ::
           (AnimationNodeStateMachine :< cls, Object :< cls) =>
           cls -> GodotString -> AnimationNode -> Vector2 -> IO ()
add_node cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_add_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_node #-}

bindAnimationNodeStateMachine_get_node :: MethodBind
bindAnimationNodeStateMachine_get_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_node ::
           (AnimationNodeStateMachine :< cls, Object :< cls) =>
           cls -> GodotString -> IO AnimationNode
get_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_get_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_remove_node #-}

bindAnimationNodeStateMachine_remove_node :: MethodBind
bindAnimationNodeStateMachine_remove_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "remove_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_node ::
              (AnimationNodeStateMachine :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
remove_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_remove_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_rename_node #-}

bindAnimationNodeStateMachine_rename_node :: MethodBind
bindAnimationNodeStateMachine_rename_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "rename_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rename_node ::
              (AnimationNodeStateMachine :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> IO ()
rename_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_rename_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_has_node #-}

bindAnimationNodeStateMachine_has_node :: MethodBind
bindAnimationNodeStateMachine_has_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "has_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_node ::
           (AnimationNodeStateMachine :< cls, Object :< cls) =>
           cls -> GodotString -> IO Bool
has_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_has_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_node_name #-}

bindAnimationNodeStateMachine_get_node_name :: MethodBind
bindAnimationNodeStateMachine_get_node_name
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_node_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_node_name ::
                (AnimationNodeStateMachine :< cls, Object :< cls) =>
                cls -> AnimationNode -> IO GodotString
get_node_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_get_node_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_set_node_position #-}

bindAnimationNodeStateMachine_set_node_position :: MethodBind
bindAnimationNodeStateMachine_set_node_position
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "set_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_node_position ::
                    (AnimationNodeStateMachine :< cls, Object :< cls) =>
                    cls -> GodotString -> Vector2 -> IO ()
set_node_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_set_node_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_node_position #-}

bindAnimationNodeStateMachine_get_node_position :: MethodBind
bindAnimationNodeStateMachine_get_node_position
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_node_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_node_position ::
                    (AnimationNodeStateMachine :< cls, Object :< cls) =>
                    cls -> GodotString -> IO Vector2
get_node_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_get_node_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_has_transition #-}

bindAnimationNodeStateMachine_has_transition :: MethodBind
bindAnimationNodeStateMachine_has_transition
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "has_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_transition ::
                 (AnimationNodeStateMachine :< cls, Object :< cls) =>
                 cls -> GodotString -> GodotString -> IO Bool
has_transition cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_has_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_add_transition #-}

bindAnimationNodeStateMachine_add_transition :: MethodBind
bindAnimationNodeStateMachine_add_transition
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "add_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_transition ::
                 (AnimationNodeStateMachine :< cls, Object :< cls) =>
                 cls ->
                   GodotString ->
                     GodotString -> AnimationNodeStateMachineTransition -> IO ()
add_transition cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_add_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_transition #-}

bindAnimationNodeStateMachine_get_transition :: MethodBind
bindAnimationNodeStateMachine_get_transition
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_transition ::
                 (AnimationNodeStateMachine :< cls, Object :< cls) =>
                 cls -> Int -> IO AnimationNodeStateMachineTransition
get_transition cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_get_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_transition_from #-}

bindAnimationNodeStateMachine_get_transition_from :: MethodBind
bindAnimationNodeStateMachine_get_transition_from
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_transition_from" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_transition_from ::
                      (AnimationNodeStateMachine :< cls, Object :< cls) =>
                      cls -> Int -> IO GodotString
get_transition_from cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_get_transition_from
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_transition_to #-}

bindAnimationNodeStateMachine_get_transition_to :: MethodBind
bindAnimationNodeStateMachine_get_transition_to
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_transition_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_transition_to ::
                    (AnimationNodeStateMachine :< cls, Object :< cls) =>
                    cls -> Int -> IO GodotString
get_transition_to cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_get_transition_to
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_transition_count #-}

bindAnimationNodeStateMachine_get_transition_count :: MethodBind
bindAnimationNodeStateMachine_get_transition_count
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_transition_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_transition_count ::
                       (AnimationNodeStateMachine :< cls, Object :< cls) => cls -> IO Int
get_transition_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_get_transition_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_remove_transition_by_index
             #-}

bindAnimationNodeStateMachine_remove_transition_by_index ::
                                                         MethodBind
bindAnimationNodeStateMachine_remove_transition_by_index
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "remove_transition_by_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_transition_by_index ::
                             (AnimationNodeStateMachine :< cls, Object :< cls) =>
                             cls -> Int -> IO ()
remove_transition_by_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_remove_transition_by_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_remove_transition #-}

bindAnimationNodeStateMachine_remove_transition :: MethodBind
bindAnimationNodeStateMachine_remove_transition
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "remove_transition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_transition ::
                    (AnimationNodeStateMachine :< cls, Object :< cls) =>
                    cls -> GodotString -> GodotString -> IO ()
remove_transition cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_remove_transition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_set_start_node #-}

bindAnimationNodeStateMachine_set_start_node :: MethodBind
bindAnimationNodeStateMachine_set_start_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "set_start_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_start_node ::
                 (AnimationNodeStateMachine :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
set_start_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_set_start_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_start_node #-}

bindAnimationNodeStateMachine_get_start_node :: MethodBind
bindAnimationNodeStateMachine_get_start_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_start_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_start_node ::
                 (AnimationNodeStateMachine :< cls, Object :< cls) =>
                 cls -> IO GodotString
get_start_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_get_start_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_set_end_node #-}

bindAnimationNodeStateMachine_set_end_node :: MethodBind
bindAnimationNodeStateMachine_set_end_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "set_end_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_end_node ::
               (AnimationNodeStateMachine :< cls, Object :< cls) =>
               cls -> GodotString -> IO ()
set_end_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_set_end_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_end_node #-}

bindAnimationNodeStateMachine_get_end_node :: MethodBind
bindAnimationNodeStateMachine_get_end_node
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_end_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_end_node ::
               (AnimationNodeStateMachine :< cls, Object :< cls) =>
               cls -> IO GodotString
get_end_node cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine_get_end_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_set_graph_offset #-}

bindAnimationNodeStateMachine_set_graph_offset :: MethodBind
bindAnimationNodeStateMachine_set_graph_offset
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "set_graph_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_graph_offset ::
                   (AnimationNodeStateMachine :< cls, Object :< cls) =>
                   cls -> Vector2 -> IO ()
set_graph_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_set_graph_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine_get_graph_offset #-}

bindAnimationNodeStateMachine_get_graph_offset :: MethodBind
bindAnimationNodeStateMachine_get_graph_offset
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "get_graph_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_graph_offset ::
                   (AnimationNodeStateMachine :< cls, Object :< cls) =>
                   cls -> IO Vector2
get_graph_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeStateMachine_get_graph_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationNodeStateMachine__tree_changed #-}

bindAnimationNodeStateMachine__tree_changed :: MethodBind
bindAnimationNodeStateMachine__tree_changed
  = unsafePerformIO $
      withCString "AnimationNodeStateMachine" $
        \ clsNamePtr ->
          withCString "_tree_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_changed ::
                (AnimationNodeStateMachine :< cls, Object :< cls) => cls -> IO ()
_tree_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeStateMachine__tree_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)