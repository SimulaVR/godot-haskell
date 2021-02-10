{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationTree
       (Godot.Core.AnimationTree._ANIMATION_PROCESS_MANUAL,
        Godot.Core.AnimationTree._ANIMATION_PROCESS_PHYSICS,
        Godot.Core.AnimationTree._ANIMATION_PROCESS_IDLE,
        Godot.Core.AnimationTree._clear_caches,
        Godot.Core.AnimationTree._node_removed,
        Godot.Core.AnimationTree._tree_changed,
        Godot.Core.AnimationTree._update_properties,
        Godot.Core.AnimationTree.advance,
        Godot.Core.AnimationTree.get_animation_player,
        Godot.Core.AnimationTree.get_process_mode,
        Godot.Core.AnimationTree.get_root_motion_track,
        Godot.Core.AnimationTree.get_root_motion_transform,
        Godot.Core.AnimationTree.get_tree_root,
        Godot.Core.AnimationTree.is_active,
        Godot.Core.AnimationTree.rename_parameter,
        Godot.Core.AnimationTree.set_active,
        Godot.Core.AnimationTree.set_animation_player,
        Godot.Core.AnimationTree.set_process_mode,
        Godot.Core.AnimationTree.set_root_motion_track,
        Godot.Core.AnimationTree.set_tree_root)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ANIMATION_PROCESS_MANUAL :: Int
_ANIMATION_PROCESS_MANUAL = 2

_ANIMATION_PROCESS_PHYSICS :: Int
_ANIMATION_PROCESS_PHYSICS = 0

_ANIMATION_PROCESS_IDLE :: Int
_ANIMATION_PROCESS_IDLE = 1

{-# NOINLINE bindAnimationTree__clear_caches #-}

bindAnimationTree__clear_caches :: MethodBind
bindAnimationTree__clear_caches
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "_clear_caches" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_clear_caches ::
                (AnimationTree :< cls, Object :< cls) => cls -> IO ()
_clear_caches cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree__clear_caches (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree__node_removed #-}

bindAnimationTree__node_removed :: MethodBind
bindAnimationTree__node_removed
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "_node_removed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_removed ::
                (AnimationTree :< cls, Object :< cls) => cls -> Node -> IO ()
_node_removed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree__node_removed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree__tree_changed #-}

bindAnimationTree__tree_changed :: MethodBind
bindAnimationTree__tree_changed
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "_tree_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_changed ::
                (AnimationTree :< cls, Object :< cls) => cls -> IO ()
_tree_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree__tree_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree__update_properties #-}

bindAnimationTree__update_properties :: MethodBind
bindAnimationTree__update_properties
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "_update_properties" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_properties ::
                     (AnimationTree :< cls, Object :< cls) => cls -> IO ()
_update_properties cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree__update_properties
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_advance #-}

-- | Manually advance the animations by the specified time (in seconds).
bindAnimationTree_advance :: MethodBind
bindAnimationTree_advance
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Manually advance the animations by the specified time (in seconds).
advance ::
          (AnimationTree :< cls, Object :< cls) => cls -> Float -> IO ()
advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_advance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_get_animation_player #-}

-- | The path to the [AnimationPlayer] used for animating.
bindAnimationTree_get_animation_player :: MethodBind
bindAnimationTree_get_animation_player
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_animation_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the [AnimationPlayer] used for animating.
get_animation_player ::
                       (AnimationTree :< cls, Object :< cls) => cls -> IO NodePath
get_animation_player cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_get_animation_player
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_get_process_mode #-}

-- | The process mode of this [AnimationTree]. See [enum AnimationProcessMode] for available modes.
bindAnimationTree_get_process_mode :: MethodBind
bindAnimationTree_get_process_mode
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The process mode of this [AnimationTree]. See [enum AnimationProcessMode] for available modes.
get_process_mode ::
                   (AnimationTree :< cls, Object :< cls) => cls -> IO Int
get_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_get_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_get_root_motion_track #-}

-- | The path to the Animation track used for root motion. Paths must be valid scene-tree paths to a node, and must be specified starting from the parent node of the node that will reproduce the animation. To specify a track that controls properties or bones, append its name after the path, separated by [code]":"[/code]. For example, [code]"character/skeleton:ankle"[/code] or [code]"character/mesh:transform/local"[/code].
--   			If the track has type [constant Animation.TYPE_TRANSFORM], the transformation will be cancelled visually, and the animation will appear to stay in place.
bindAnimationTree_get_root_motion_track :: MethodBind
bindAnimationTree_get_root_motion_track
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_root_motion_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the Animation track used for root motion. Paths must be valid scene-tree paths to a node, and must be specified starting from the parent node of the node that will reproduce the animation. To specify a track that controls properties or bones, append its name after the path, separated by [code]":"[/code]. For example, [code]"character/skeleton:ankle"[/code] or [code]"character/mesh:transform/local"[/code].
--   			If the track has type [constant Animation.TYPE_TRANSFORM], the transformation will be cancelled visually, and the animation will appear to stay in place.
get_root_motion_track ::
                        (AnimationTree :< cls, Object :< cls) => cls -> IO NodePath
get_root_motion_track cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_get_root_motion_track
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_get_root_motion_transform #-}

-- | Retrieve the motion of the [member root_motion_track] as a [Transform] that can be used elsewhere. If [member root_motion_track] is not a path to a track of type [constant Animation.TYPE_TRANSFORM], returns an identity transformation.
bindAnimationTree_get_root_motion_transform :: MethodBind
bindAnimationTree_get_root_motion_transform
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_root_motion_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Retrieve the motion of the [member root_motion_track] as a [Transform] that can be used elsewhere. If [member root_motion_track] is not a path to a track of type [constant Animation.TYPE_TRANSFORM], returns an identity transformation.
get_root_motion_transform ::
                            (AnimationTree :< cls, Object :< cls) => cls -> IO Transform
get_root_motion_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_get_root_motion_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_get_tree_root #-}

-- | The root animation node of this [AnimationTree]. See [AnimationNode].
bindAnimationTree_get_tree_root :: MethodBind
bindAnimationTree_get_tree_root
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_tree_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The root animation node of this [AnimationTree]. See [AnimationNode].
get_tree_root ::
                (AnimationTree :< cls, Object :< cls) => cls -> IO AnimationNode
get_tree_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_get_tree_root (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_is_active #-}

-- | If [code]true[/code], the [AnimationTree] will be processing.
bindAnimationTree_is_active :: MethodBind
bindAnimationTree_is_active
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [AnimationTree] will be processing.
is_active ::
            (AnimationTree :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_is_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_rename_parameter #-}

bindAnimationTree_rename_parameter :: MethodBind
bindAnimationTree_rename_parameter
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "rename_parameter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

rename_parameter ::
                   (AnimationTree :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO ()
rename_parameter cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_rename_parameter
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_set_active #-}

-- | If [code]true[/code], the [AnimationTree] will be processing.
bindAnimationTree_set_active :: MethodBind
bindAnimationTree_set_active
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [AnimationTree] will be processing.
set_active ::
             (AnimationTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_set_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_set_animation_player #-}

-- | The path to the [AnimationPlayer] used for animating.
bindAnimationTree_set_animation_player :: MethodBind
bindAnimationTree_set_animation_player
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_animation_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the [AnimationPlayer] used for animating.
set_animation_player ::
                       (AnimationTree :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_animation_player cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_set_animation_player
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_set_process_mode #-}

-- | The process mode of this [AnimationTree]. See [enum AnimationProcessMode] for available modes.
bindAnimationTree_set_process_mode :: MethodBind
bindAnimationTree_set_process_mode
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The process mode of this [AnimationTree]. See [enum AnimationProcessMode] for available modes.
set_process_mode ::
                   (AnimationTree :< cls, Object :< cls) => cls -> Int -> IO ()
set_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_set_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_set_root_motion_track #-}

-- | The path to the Animation track used for root motion. Paths must be valid scene-tree paths to a node, and must be specified starting from the parent node of the node that will reproduce the animation. To specify a track that controls properties or bones, append its name after the path, separated by [code]":"[/code]. For example, [code]"character/skeleton:ankle"[/code] or [code]"character/mesh:transform/local"[/code].
--   			If the track has type [constant Animation.TYPE_TRANSFORM], the transformation will be cancelled visually, and the animation will appear to stay in place.
bindAnimationTree_set_root_motion_track :: MethodBind
bindAnimationTree_set_root_motion_track
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_root_motion_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the Animation track used for root motion. Paths must be valid scene-tree paths to a node, and must be specified starting from the parent node of the node that will reproduce the animation. To specify a track that controls properties or bones, append its name after the path, separated by [code]":"[/code]. For example, [code]"character/skeleton:ankle"[/code] or [code]"character/mesh:transform/local"[/code].
--   			If the track has type [constant Animation.TYPE_TRANSFORM], the transformation will be cancelled visually, and the animation will appear to stay in place.
set_root_motion_track ::
                        (AnimationTree :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_root_motion_track cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_set_root_motion_track
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTree_set_tree_root #-}

-- | The root animation node of this [AnimationTree]. See [AnimationNode].
bindAnimationTree_set_tree_root :: MethodBind
bindAnimationTree_set_tree_root
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_tree_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The root animation node of this [AnimationTree]. See [AnimationNode].
set_tree_root ::
                (AnimationTree :< cls, Object :< cls) =>
                cls -> AnimationNode -> IO ()
set_tree_root cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_set_tree_root (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)