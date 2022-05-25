{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationTree
       (Godot.Core.AnimationTree._ANIMATION_PROCESS_PHYSICS,
        Godot.Core.AnimationTree._ANIMATION_PROCESS_IDLE,
        Godot.Core.AnimationTree._ANIMATION_PROCESS_MANUAL,
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Node()

_ANIMATION_PROCESS_PHYSICS :: Int
_ANIMATION_PROCESS_PHYSICS = 0

_ANIMATION_PROCESS_IDLE :: Int
_ANIMATION_PROCESS_IDLE = 1

_ANIMATION_PROCESS_MANUAL :: Int
_ANIMATION_PROCESS_MANUAL = 2

instance NodeProperty AnimationTree "active" Bool 'False where
        nodeProperty = (is_active, wrapDroppingSetter set_active, Nothing)

instance NodeProperty AnimationTree "anim_player" NodePath 'False
         where
        nodeProperty
          = (get_animation_player, wrapDroppingSetter set_animation_player,
             Nothing)

instance NodeProperty AnimationTree "process_mode" Int 'False where
        nodeProperty
          = (get_process_mode, wrapDroppingSetter set_process_mode, Nothing)

instance NodeProperty AnimationTree "root_motion_track" NodePath
           'False
         where
        nodeProperty
          = (get_root_motion_track, wrapDroppingSetter set_root_motion_track,
             Nothing)

instance NodeProperty AnimationTree "tree_root" AnimationNode
           'False
         where
        nodeProperty
          = (get_tree_root, wrapDroppingSetter set_tree_root, Nothing)

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

instance NodeMethod AnimationTree "_clear_caches" '[] (IO ()) where
        nodeMethod = Godot.Core.AnimationTree._clear_caches

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

instance NodeMethod AnimationTree "_node_removed" '[Node] (IO ())
         where
        nodeMethod = Godot.Core.AnimationTree._node_removed

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

instance NodeMethod AnimationTree "_tree_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.AnimationTree._tree_changed

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

instance NodeMethod AnimationTree "_update_properties" '[] (IO ())
         where
        nodeMethod = Godot.Core.AnimationTree._update_properties

{-# NOINLINE bindAnimationTree_advance #-}

bindAnimationTree_advance :: MethodBind
bindAnimationTree_advance
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

advance ::
          (AnimationTree :< cls, Object :< cls) => cls -> Float -> IO ()
advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_advance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTree "advance" '[Float] (IO ()) where
        nodeMethod = Godot.Core.AnimationTree.advance

{-# NOINLINE bindAnimationTree_get_animation_player #-}

bindAnimationTree_get_animation_player :: MethodBind
bindAnimationTree_get_animation_player
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_animation_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

instance NodeMethod AnimationTree "get_animation_player" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.AnimationTree.get_animation_player

{-# NOINLINE bindAnimationTree_get_process_mode #-}

bindAnimationTree_get_process_mode :: MethodBind
bindAnimationTree_get_process_mode
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

instance NodeMethod AnimationTree "get_process_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.AnimationTree.get_process_mode

{-# NOINLINE bindAnimationTree_get_root_motion_track #-}

bindAnimationTree_get_root_motion_track :: MethodBind
bindAnimationTree_get_root_motion_track
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_root_motion_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

instance NodeMethod AnimationTree "get_root_motion_track" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.AnimationTree.get_root_motion_track

{-# NOINLINE bindAnimationTree_get_root_motion_transform #-}

bindAnimationTree_get_root_motion_transform :: MethodBind
bindAnimationTree_get_root_motion_transform
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_root_motion_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

instance NodeMethod AnimationTree "get_root_motion_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.AnimationTree.get_root_motion_transform

{-# NOINLINE bindAnimationTree_get_tree_root #-}

bindAnimationTree_get_tree_root :: MethodBind
bindAnimationTree_get_tree_root
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "get_tree_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_tree_root ::
                (AnimationTree :< cls, Object :< cls) => cls -> IO AnimationNode
get_tree_root cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_get_tree_root (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTree "get_tree_root" '[]
           (IO AnimationNode)
         where
        nodeMethod = Godot.Core.AnimationTree.get_tree_root

{-# NOINLINE bindAnimationTree_is_active #-}

bindAnimationTree_is_active :: MethodBind
bindAnimationTree_is_active
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_active ::
            (AnimationTree :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_is_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTree "is_active" '[] (IO Bool) where
        nodeMethod = Godot.Core.AnimationTree.is_active

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

instance NodeMethod AnimationTree "rename_parameter"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTree.rename_parameter

{-# NOINLINE bindAnimationTree_set_active #-}

bindAnimationTree_set_active :: MethodBind
bindAnimationTree_set_active
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_active ::
             (AnimationTree :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTree_set_active (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTree "set_active" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AnimationTree.set_active

{-# NOINLINE bindAnimationTree_set_animation_player #-}

bindAnimationTree_set_animation_player :: MethodBind
bindAnimationTree_set_animation_player
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_animation_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

instance NodeMethod AnimationTree "set_animation_player"
           '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTree.set_animation_player

{-# NOINLINE bindAnimationTree_set_process_mode #-}

bindAnimationTree_set_process_mode :: MethodBind
bindAnimationTree_set_process_mode
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

instance NodeMethod AnimationTree "set_process_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.AnimationTree.set_process_mode

{-# NOINLINE bindAnimationTree_set_root_motion_track #-}

bindAnimationTree_set_root_motion_track :: MethodBind
bindAnimationTree_set_root_motion_track
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_root_motion_track" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

instance NodeMethod AnimationTree "set_root_motion_track"
           '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTree.set_root_motion_track

{-# NOINLINE bindAnimationTree_set_tree_root #-}

bindAnimationTree_set_tree_root :: MethodBind
bindAnimationTree_set_tree_root
  = unsafePerformIO $
      withCString "AnimationTree" $
        \ clsNamePtr ->
          withCString "set_tree_root" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

instance NodeMethod AnimationTree "set_tree_root" '[AnimationNode]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTree.set_tree_root