{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationTreePlayer
       (Godot.Core.AnimationTreePlayer._NODE_TIMESEEK,
        Godot.Core.AnimationTreePlayer._NODE_ONESHOT,
        Godot.Core.AnimationTreePlayer._NODE_TRANSITION,
        Godot.Core.AnimationTreePlayer._NODE_BLEND4,
        Godot.Core.AnimationTreePlayer._NODE_TIMESCALE,
        Godot.Core.AnimationTreePlayer._NODE_BLEND3,
        Godot.Core.AnimationTreePlayer._ANIMATION_PROCESS_PHYSICS,
        Godot.Core.AnimationTreePlayer._ANIMATION_PROCESS_IDLE,
        Godot.Core.AnimationTreePlayer._NODE_ANIMATION,
        Godot.Core.AnimationTreePlayer._NODE_OUTPUT,
        Godot.Core.AnimationTreePlayer._NODE_BLEND2,
        Godot.Core.AnimationTreePlayer._NODE_MIX,
        Godot.Core.AnimationTreePlayer.add_node,
        Godot.Core.AnimationTreePlayer.advance,
        Godot.Core.AnimationTreePlayer.animation_node_get_animation,
        Godot.Core.AnimationTreePlayer.animation_node_get_master_animation,
        Godot.Core.AnimationTreePlayer.animation_node_get_position,
        Godot.Core.AnimationTreePlayer.animation_node_set_animation,
        Godot.Core.AnimationTreePlayer.animation_node_set_filter_path,
        Godot.Core.AnimationTreePlayer.animation_node_set_master_animation,
        Godot.Core.AnimationTreePlayer.are_nodes_connected,
        Godot.Core.AnimationTreePlayer.blend2_node_get_amount,
        Godot.Core.AnimationTreePlayer.blend2_node_set_amount,
        Godot.Core.AnimationTreePlayer.blend2_node_set_filter_path,
        Godot.Core.AnimationTreePlayer.blend3_node_get_amount,
        Godot.Core.AnimationTreePlayer.blend3_node_set_amount,
        Godot.Core.AnimationTreePlayer.blend4_node_get_amount,
        Godot.Core.AnimationTreePlayer.blend4_node_set_amount,
        Godot.Core.AnimationTreePlayer.connect_nodes,
        Godot.Core.AnimationTreePlayer.disconnect_nodes,
        Godot.Core.AnimationTreePlayer.get_animation_process_mode,
        Godot.Core.AnimationTreePlayer.get_base_path,
        Godot.Core.AnimationTreePlayer.get_master_player,
        Godot.Core.AnimationTreePlayer.get_node_list,
        Godot.Core.AnimationTreePlayer.is_active,
        Godot.Core.AnimationTreePlayer.mix_node_get_amount,
        Godot.Core.AnimationTreePlayer.mix_node_set_amount,
        Godot.Core.AnimationTreePlayer.node_exists,
        Godot.Core.AnimationTreePlayer.node_get_input_count,
        Godot.Core.AnimationTreePlayer.node_get_input_source,
        Godot.Core.AnimationTreePlayer.node_get_position,
        Godot.Core.AnimationTreePlayer.node_get_type,
        Godot.Core.AnimationTreePlayer.node_rename,
        Godot.Core.AnimationTreePlayer.node_set_position,
        Godot.Core.AnimationTreePlayer.oneshot_node_get_autorestart_delay,
        Godot.Core.AnimationTreePlayer.oneshot_node_get_autorestart_random_delay,
        Godot.Core.AnimationTreePlayer.oneshot_node_get_fadein_time,
        Godot.Core.AnimationTreePlayer.oneshot_node_get_fadeout_time,
        Godot.Core.AnimationTreePlayer.oneshot_node_has_autorestart,
        Godot.Core.AnimationTreePlayer.oneshot_node_is_active,
        Godot.Core.AnimationTreePlayer.oneshot_node_set_autorestart,
        Godot.Core.AnimationTreePlayer.oneshot_node_set_autorestart_delay,
        Godot.Core.AnimationTreePlayer.oneshot_node_set_autorestart_random_delay,
        Godot.Core.AnimationTreePlayer.oneshot_node_set_fadein_time,
        Godot.Core.AnimationTreePlayer.oneshot_node_set_fadeout_time,
        Godot.Core.AnimationTreePlayer.oneshot_node_set_filter_path,
        Godot.Core.AnimationTreePlayer.oneshot_node_start,
        Godot.Core.AnimationTreePlayer.oneshot_node_stop,
        Godot.Core.AnimationTreePlayer.recompute_caches,
        Godot.Core.AnimationTreePlayer.remove_node,
        Godot.Core.AnimationTreePlayer.reset,
        Godot.Core.AnimationTreePlayer.set_active,
        Godot.Core.AnimationTreePlayer.set_animation_process_mode,
        Godot.Core.AnimationTreePlayer.set_base_path,
        Godot.Core.AnimationTreePlayer.set_master_player,
        Godot.Core.AnimationTreePlayer.timescale_node_get_scale,
        Godot.Core.AnimationTreePlayer.timescale_node_set_scale,
        Godot.Core.AnimationTreePlayer.timeseek_node_seek,
        Godot.Core.AnimationTreePlayer.transition_node_delete_input,
        Godot.Core.AnimationTreePlayer.transition_node_get_current,
        Godot.Core.AnimationTreePlayer.transition_node_get_input_count,
        Godot.Core.AnimationTreePlayer.transition_node_get_xfade_time,
        Godot.Core.AnimationTreePlayer.transition_node_has_input_auto_advance,
        Godot.Core.AnimationTreePlayer.transition_node_set_current,
        Godot.Core.AnimationTreePlayer.transition_node_set_input_auto_advance,
        Godot.Core.AnimationTreePlayer.transition_node_set_input_count,
        Godot.Core.AnimationTreePlayer.transition_node_set_xfade_time)
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

_NODE_TIMESEEK :: Int
_NODE_TIMESEEK = 8

_NODE_ONESHOT :: Int
_NODE_ONESHOT = 2

_NODE_TRANSITION :: Int
_NODE_TRANSITION = 9

_NODE_BLEND4 :: Int
_NODE_BLEND4 = 6

_NODE_TIMESCALE :: Int
_NODE_TIMESCALE = 7

_NODE_BLEND3 :: Int
_NODE_BLEND3 = 5

_ANIMATION_PROCESS_PHYSICS :: Int
_ANIMATION_PROCESS_PHYSICS = 0

_ANIMATION_PROCESS_IDLE :: Int
_ANIMATION_PROCESS_IDLE = 1

_NODE_ANIMATION :: Int
_NODE_ANIMATION = 1

_NODE_OUTPUT :: Int
_NODE_OUTPUT = 0

_NODE_BLEND2 :: Int
_NODE_BLEND2 = 4

_NODE_MIX :: Int
_NODE_MIX = 3

instance NodeProperty AnimationTreePlayer "active" Bool 'False
         where
        nodeProperty = (is_active, wrapDroppingSetter set_active, Nothing)

instance NodeProperty AnimationTreePlayer "base_path" NodePath
           'False
         where
        nodeProperty
          = (get_base_path, wrapDroppingSetter set_base_path, Nothing)

instance NodeProperty AnimationTreePlayer "master_player" NodePath
           'False
         where
        nodeProperty
          = (get_master_player, wrapDroppingSetter set_master_player,
             Nothing)

instance NodeProperty AnimationTreePlayer "playback_process_mode"
           Int
           'False
         where
        nodeProperty
          = (get_animation_process_mode,
             wrapDroppingSetter set_animation_process_mode, Nothing)

{-# NOINLINE bindAnimationTreePlayer_add_node #-}

-- | Adds a @type@ node to the graph with name @id@.
bindAnimationTreePlayer_add_node :: MethodBind
bindAnimationTreePlayer_add_node
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "add_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @type@ node to the graph with name @id@.
add_node ::
           (AnimationTreePlayer :< cls, Object :< cls) =>
           cls -> Int -> GodotString -> IO ()
add_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_add_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "add_node"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.add_node

{-# NOINLINE bindAnimationTreePlayer_advance #-}

-- | Shifts position in the animation timeline. @delta@ is the time in seconds to shift. Events between the current frame and @delta@ are handled.
bindAnimationTreePlayer_advance :: MethodBind
bindAnimationTreePlayer_advance
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shifts position in the animation timeline. @delta@ is the time in seconds to shift. Events between the current frame and @delta@ are handled.
advance ::
          (AnimationTreePlayer :< cls, Object :< cls) =>
          cls -> Float -> IO ()
advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_advance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "advance" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.advance

{-# NOINLINE bindAnimationTreePlayer_animation_node_get_animation
             #-}

-- | Returns the @AnimationPlayer@'s @Animation@ bound to the @AnimationTreePlayer@'s animation node with name @id@.
bindAnimationTreePlayer_animation_node_get_animation :: MethodBind
bindAnimationTreePlayer_animation_node_get_animation
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_get_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @AnimationPlayer@'s @Animation@ bound to the @AnimationTreePlayer@'s animation node with name @id@.
animation_node_get_animation ::
                               (AnimationTreePlayer :< cls, Object :< cls) =>
                               cls -> GodotString -> IO Animation
animation_node_get_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_animation_node_get_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "animation_node_get_animation"
           '[GodotString]
           (IO Animation)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.animation_node_get_animation

{-# NOINLINE bindAnimationTreePlayer_animation_node_get_master_animation
             #-}

-- | Returns the name of the @master_player@'s @Animation@ bound to this animation node.
bindAnimationTreePlayer_animation_node_get_master_animation ::
                                                            MethodBind
bindAnimationTreePlayer_animation_node_get_master_animation
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_get_master_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the @master_player@'s @Animation@ bound to this animation node.
animation_node_get_master_animation ::
                                      (AnimationTreePlayer :< cls, Object :< cls) =>
                                      cls -> GodotString -> IO GodotString
animation_node_get_master_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_animation_node_get_master_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "animation_node_get_master_animation"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.animation_node_get_master_animation

{-# NOINLINE bindAnimationTreePlayer_animation_node_get_position
             #-}

-- | Returns the absolute playback timestamp of the animation node with name @id@.
bindAnimationTreePlayer_animation_node_get_position :: MethodBind
bindAnimationTreePlayer_animation_node_get_position
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the absolute playback timestamp of the animation node with name @id@.
animation_node_get_position ::
                              (AnimationTreePlayer :< cls, Object :< cls) =>
                              cls -> GodotString -> IO Float
animation_node_get_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_animation_node_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "animation_node_get_position"
           '[GodotString]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.animation_node_get_position

{-# NOINLINE bindAnimationTreePlayer_animation_node_set_animation
             #-}

-- | Binds a new @Animation@ from the @master_player@ to the @AnimationTreePlayer@'s animation node with name @id@.
bindAnimationTreePlayer_animation_node_set_animation :: MethodBind
bindAnimationTreePlayer_animation_node_set_animation
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_set_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binds a new @Animation@ from the @master_player@ to the @AnimationTreePlayer@'s animation node with name @id@.
animation_node_set_animation ::
                               (AnimationTreePlayer :< cls, Object :< cls) =>
                               cls -> GodotString -> Animation -> IO ()
animation_node_set_animation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_animation_node_set_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "animation_node_set_animation"
           '[GodotString, Animation]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.animation_node_set_animation

{-# NOINLINE bindAnimationTreePlayer_animation_node_set_filter_path
             #-}

-- | If @enable@ is @true@, the animation node with ID @id@ turns off the track modifying the property at @path@. The modified node's children continue to animate.
bindAnimationTreePlayer_animation_node_set_filter_path ::
                                                       MethodBind
bindAnimationTreePlayer_animation_node_set_filter_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_set_filter_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @enable@ is @true@, the animation node with ID @id@ turns off the track modifying the property at @path@. The modified node's children continue to animate.
animation_node_set_filter_path ::
                                 (AnimationTreePlayer :< cls, Object :< cls) =>
                                 cls -> GodotString -> NodePath -> Bool -> IO ()
animation_node_set_filter_path cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_animation_node_set_filter_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "animation_node_set_filter_path"
           '[GodotString, NodePath, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.animation_node_set_filter_path

{-# NOINLINE bindAnimationTreePlayer_animation_node_set_master_animation
             #-}

-- | Binds the @Animation@ named @source@ from @master_player@ to the animation node @id@. Recalculates caches.
bindAnimationTreePlayer_animation_node_set_master_animation ::
                                                            MethodBind
bindAnimationTreePlayer_animation_node_set_master_animation
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_set_master_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binds the @Animation@ named @source@ from @master_player@ to the animation node @id@. Recalculates caches.
animation_node_set_master_animation ::
                                      (AnimationTreePlayer :< cls, Object :< cls) =>
                                      cls -> GodotString -> GodotString -> IO ()
animation_node_set_master_animation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_animation_node_set_master_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "animation_node_set_master_animation"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.animation_node_set_master_animation

{-# NOINLINE bindAnimationTreePlayer_are_nodes_connected #-}

-- | Returns whether node @id@ and @dst_id@ are connected at the specified slot.
bindAnimationTreePlayer_are_nodes_connected :: MethodBind
bindAnimationTreePlayer_are_nodes_connected
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "are_nodes_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether node @id@ and @dst_id@ are connected at the specified slot.
are_nodes_connected ::
                      (AnimationTreePlayer :< cls, Object :< cls) =>
                      cls -> GodotString -> GodotString -> Int -> IO Bool
are_nodes_connected cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_are_nodes_connected
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "are_nodes_connected"
           '[GodotString, GodotString, Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.are_nodes_connected

{-# NOINLINE bindAnimationTreePlayer_blend2_node_get_amount #-}

-- | Returns the blend amount of a Blend2 node given its name.
bindAnimationTreePlayer_blend2_node_get_amount :: MethodBind
bindAnimationTreePlayer_blend2_node_get_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend2_node_get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the blend amount of a Blend2 node given its name.
blend2_node_get_amount ::
                         (AnimationTreePlayer :< cls, Object :< cls) =>
                         cls -> GodotString -> IO Float
blend2_node_get_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_blend2_node_get_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "blend2_node_get_amount"
           '[GodotString]
           (IO Float)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.blend2_node_get_amount

{-# NOINLINE bindAnimationTreePlayer_blend2_node_set_amount #-}

-- | Sets the blend amount of a Blend2 node given its name and value.
--   				A Blend2 node blends two animations (A and B) with the amount between 0 and 1.
--   				At 0, output is input A. Towards 1, the influence of A gets lessened, the influence of B gets raised. At 1, output is input B.
bindAnimationTreePlayer_blend2_node_set_amount :: MethodBind
bindAnimationTreePlayer_blend2_node_set_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend2_node_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the blend amount of a Blend2 node given its name and value.
--   				A Blend2 node blends two animations (A and B) with the amount between 0 and 1.
--   				At 0, output is input A. Towards 1, the influence of A gets lessened, the influence of B gets raised. At 1, output is input B.
blend2_node_set_amount ::
                         (AnimationTreePlayer :< cls, Object :< cls) =>
                         cls -> GodotString -> Float -> IO ()
blend2_node_set_amount cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_blend2_node_set_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "blend2_node_set_amount"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.blend2_node_set_amount

{-# NOINLINE bindAnimationTreePlayer_blend2_node_set_filter_path
             #-}

-- | If @enable@ is @true@, the Blend2 node with name @id@ turns off the track modifying the property at @path@. The modified node's children continue to animate.
bindAnimationTreePlayer_blend2_node_set_filter_path :: MethodBind
bindAnimationTreePlayer_blend2_node_set_filter_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend2_node_set_filter_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @enable@ is @true@, the Blend2 node with name @id@ turns off the track modifying the property at @path@. The modified node's children continue to animate.
blend2_node_set_filter_path ::
                              (AnimationTreePlayer :< cls, Object :< cls) =>
                              cls -> GodotString -> NodePath -> Bool -> IO ()
blend2_node_set_filter_path cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_blend2_node_set_filter_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "blend2_node_set_filter_path"
           '[GodotString, NodePath, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.blend2_node_set_filter_path

{-# NOINLINE bindAnimationTreePlayer_blend3_node_get_amount #-}

-- | Returns the blend amount of a Blend3 node given its name.
bindAnimationTreePlayer_blend3_node_get_amount :: MethodBind
bindAnimationTreePlayer_blend3_node_get_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend3_node_get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the blend amount of a Blend3 node given its name.
blend3_node_get_amount ::
                         (AnimationTreePlayer :< cls, Object :< cls) =>
                         cls -> GodotString -> IO Float
blend3_node_get_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_blend3_node_get_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "blend3_node_get_amount"
           '[GodotString]
           (IO Float)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.blend3_node_get_amount

{-# NOINLINE bindAnimationTreePlayer_blend3_node_set_amount #-}

-- | Sets the blend amount of a Blend3 node given its name and value.
--   				A Blend3 Node blends three animations (A, B-, B+) with the amount between -1 and 1.
--   				At -1, output is input B-. From -1 to 0, the influence of B- gets lessened, the influence of A gets raised and the influence of B+ is 0. At 0, output is input A. From 0 to 1, the influence of A gets lessened, the influence of B+ gets raised and the influence of B+ is 0. At 1, output is input B+.
bindAnimationTreePlayer_blend3_node_set_amount :: MethodBind
bindAnimationTreePlayer_blend3_node_set_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend3_node_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the blend amount of a Blend3 node given its name and value.
--   				A Blend3 Node blends three animations (A, B-, B+) with the amount between -1 and 1.
--   				At -1, output is input B-. From -1 to 0, the influence of B- gets lessened, the influence of A gets raised and the influence of B+ is 0. At 0, output is input A. From 0 to 1, the influence of A gets lessened, the influence of B+ gets raised and the influence of B+ is 0. At 1, output is input B+.
blend3_node_set_amount ::
                         (AnimationTreePlayer :< cls, Object :< cls) =>
                         cls -> GodotString -> Float -> IO ()
blend3_node_set_amount cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_blend3_node_set_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "blend3_node_set_amount"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.blend3_node_set_amount

{-# NOINLINE bindAnimationTreePlayer_blend4_node_get_amount #-}

-- | Returns the blend amount of a Blend4 node given its name.
bindAnimationTreePlayer_blend4_node_get_amount :: MethodBind
bindAnimationTreePlayer_blend4_node_get_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend4_node_get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the blend amount of a Blend4 node given its name.
blend4_node_get_amount ::
                         (AnimationTreePlayer :< cls, Object :< cls) =>
                         cls -> GodotString -> IO Vector2
blend4_node_get_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_blend4_node_get_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "blend4_node_get_amount"
           '[GodotString]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.blend4_node_get_amount

{-# NOINLINE bindAnimationTreePlayer_blend4_node_set_amount #-}

-- | Sets the blend amount of a Blend4 node given its name and value.
--   				A Blend4 Node blends two pairs of animations.
--   				The two pairs are blended like Blend2 and then added together.
bindAnimationTreePlayer_blend4_node_set_amount :: MethodBind
bindAnimationTreePlayer_blend4_node_set_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend4_node_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the blend amount of a Blend4 node given its name and value.
--   				A Blend4 Node blends two pairs of animations.
--   				The two pairs are blended like Blend2 and then added together.
blend4_node_set_amount ::
                         (AnimationTreePlayer :< cls, Object :< cls) =>
                         cls -> GodotString -> Vector2 -> IO ()
blend4_node_set_amount cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_blend4_node_set_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "blend4_node_set_amount"
           '[GodotString, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.blend4_node_set_amount

{-# NOINLINE bindAnimationTreePlayer_connect_nodes #-}

-- | Connects node @id@ to @dst_id@ at the specified input slot.
bindAnimationTreePlayer_connect_nodes :: MethodBind
bindAnimationTreePlayer_connect_nodes
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "connect_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects node @id@ to @dst_id@ at the specified input slot.
connect_nodes ::
                (AnimationTreePlayer :< cls, Object :< cls) =>
                cls -> GodotString -> GodotString -> Int -> IO Int
connect_nodes cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_connect_nodes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "connect_nodes"
           '[GodotString, GodotString, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.connect_nodes

{-# NOINLINE bindAnimationTreePlayer_disconnect_nodes #-}

-- | Disconnects nodes connected to @id@ at the specified input slot.
bindAnimationTreePlayer_disconnect_nodes :: MethodBind
bindAnimationTreePlayer_disconnect_nodes
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "disconnect_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disconnects nodes connected to @id@ at the specified input slot.
disconnect_nodes ::
                   (AnimationTreePlayer :< cls, Object :< cls) =>
                   cls -> GodotString -> Int -> IO ()
disconnect_nodes cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_disconnect_nodes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "disconnect_nodes"
           '[GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.disconnect_nodes

{-# NOINLINE bindAnimationTreePlayer_get_animation_process_mode #-}

-- | The thread in which to update animations.
bindAnimationTreePlayer_get_animation_process_mode :: MethodBind
bindAnimationTreePlayer_get_animation_process_mode
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "get_animation_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The thread in which to update animations.
get_animation_process_mode ::
                             (AnimationTreePlayer :< cls, Object :< cls) => cls -> IO Int
get_animation_process_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_get_animation_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "get_animation_process_mode"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.get_animation_process_mode

{-# NOINLINE bindAnimationTreePlayer_get_base_path #-}

-- | The node from which to relatively access other nodes.
--   			It accesses the bones, so it should point to the same node the @AnimationPlayer@ would point its Root Node at.
bindAnimationTreePlayer_get_base_path :: MethodBind
bindAnimationTreePlayer_get_base_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "get_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node from which to relatively access other nodes.
--   			It accesses the bones, so it should point to the same node the @AnimationPlayer@ would point its Root Node at.
get_base_path ::
                (AnimationTreePlayer :< cls, Object :< cls) => cls -> IO NodePath
get_base_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_get_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "get_base_path" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.get_base_path

{-# NOINLINE bindAnimationTreePlayer_get_master_player #-}

-- | The path to the @AnimationPlayer@ from which this @AnimationTreePlayer@ binds animations to animation nodes.
--   			Once set, @Animation@ nodes can be added to the @AnimationTreePlayer@.
bindAnimationTreePlayer_get_master_player :: MethodBind
bindAnimationTreePlayer_get_master_player
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "get_master_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the @AnimationPlayer@ from which this @AnimationTreePlayer@ binds animations to animation nodes.
--   			Once set, @Animation@ nodes can be added to the @AnimationTreePlayer@.
get_master_player ::
                    (AnimationTreePlayer :< cls, Object :< cls) => cls -> IO NodePath
get_master_player cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_get_master_player
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "get_master_player" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.get_master_player

{-# NOINLINE bindAnimationTreePlayer_get_node_list #-}

-- | Returns a @PoolStringArray@ containing the name of all nodes.
bindAnimationTreePlayer_get_node_list :: MethodBind
bindAnimationTreePlayer_get_node_list
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "get_node_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @PoolStringArray@ containing the name of all nodes.
get_node_list ::
                (AnimationTreePlayer :< cls, Object :< cls) =>
                cls -> IO PoolStringArray
get_node_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_get_node_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "get_node_list" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.get_node_list

{-# NOINLINE bindAnimationTreePlayer_is_active #-}

-- | If @true@, the @AnimationTreePlayer@ is able to play animations.
bindAnimationTreePlayer_is_active :: MethodBind
bindAnimationTreePlayer_is_active
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @AnimationTreePlayer@ is able to play animations.
is_active ::
            (AnimationTreePlayer :< cls, Object :< cls) => cls -> IO Bool
is_active cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "is_active" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.is_active

{-# NOINLINE bindAnimationTreePlayer_mix_node_get_amount #-}

-- | Returns the mix amount of a Mix node given its name.
bindAnimationTreePlayer_mix_node_get_amount :: MethodBind
bindAnimationTreePlayer_mix_node_get_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "mix_node_get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the mix amount of a Mix node given its name.
mix_node_get_amount ::
                      (AnimationTreePlayer :< cls, Object :< cls) =>
                      cls -> GodotString -> IO Float
mix_node_get_amount cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_mix_node_get_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "mix_node_get_amount"
           '[GodotString]
           (IO Float)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.mix_node_get_amount

{-# NOINLINE bindAnimationTreePlayer_mix_node_set_amount #-}

-- | Sets the mix amount of a Mix node given its name and value.
--   				A Mix node adds input b to input a by the amount given by ratio.
bindAnimationTreePlayer_mix_node_set_amount :: MethodBind
bindAnimationTreePlayer_mix_node_set_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "mix_node_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the mix amount of a Mix node given its name and value.
--   				A Mix node adds input b to input a by the amount given by ratio.
mix_node_set_amount ::
                      (AnimationTreePlayer :< cls, Object :< cls) =>
                      cls -> GodotString -> Float -> IO ()
mix_node_set_amount cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_mix_node_set_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "mix_node_set_amount"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.mix_node_set_amount

{-# NOINLINE bindAnimationTreePlayer_node_exists #-}

-- | Check if a node exists (by name).
bindAnimationTreePlayer_node_exists :: MethodBind
bindAnimationTreePlayer_node_exists
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Check if a node exists (by name).
node_exists ::
              (AnimationTreePlayer :< cls, Object :< cls) =>
              cls -> GodotString -> IO Bool
node_exists cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_node_exists
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "node_exists"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.node_exists

{-# NOINLINE bindAnimationTreePlayer_node_get_input_count #-}

-- | Returns the input count for a given node. Different types of nodes have different amount of inputs.
bindAnimationTreePlayer_node_get_input_count :: MethodBind
bindAnimationTreePlayer_node_get_input_count
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_get_input_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the input count for a given node. Different types of nodes have different amount of inputs.
node_get_input_count ::
                       (AnimationTreePlayer :< cls, Object :< cls) =>
                       cls -> GodotString -> IO Int
node_get_input_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_node_get_input_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "node_get_input_count"
           '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.node_get_input_count

{-# NOINLINE bindAnimationTreePlayer_node_get_input_source #-}

-- | Returns the input source for a given node input.
bindAnimationTreePlayer_node_get_input_source :: MethodBind
bindAnimationTreePlayer_node_get_input_source
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_get_input_source" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the input source for a given node input.
node_get_input_source ::
                        (AnimationTreePlayer :< cls, Object :< cls) =>
                        cls -> GodotString -> Int -> IO GodotString
node_get_input_source cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_node_get_input_source
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "node_get_input_source"
           '[GodotString, Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.node_get_input_source

{-# NOINLINE bindAnimationTreePlayer_node_get_position #-}

-- | Returns position of a node in the graph given its name.
bindAnimationTreePlayer_node_get_position :: MethodBind
bindAnimationTreePlayer_node_get_position
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns position of a node in the graph given its name.
node_get_position ::
                    (AnimationTreePlayer :< cls, Object :< cls) =>
                    cls -> GodotString -> IO Vector2
node_get_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_node_get_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "node_get_position"
           '[GodotString]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.node_get_position

{-# NOINLINE bindAnimationTreePlayer_node_get_type #-}

-- | Gets the node type, will return from @enum NodeType@ enum.
bindAnimationTreePlayer_node_get_type :: MethodBind
bindAnimationTreePlayer_node_get_type
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the node type, will return from @enum NodeType@ enum.
node_get_type ::
                (AnimationTreePlayer :< cls, Object :< cls) =>
                cls -> GodotString -> IO Int
node_get_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_node_get_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "node_get_type"
           '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.node_get_type

{-# NOINLINE bindAnimationTreePlayer_node_rename #-}

-- | Renames a node in the graph.
bindAnimationTreePlayer_node_rename :: MethodBind
bindAnimationTreePlayer_node_rename
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_rename" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Renames a node in the graph.
node_rename ::
              (AnimationTreePlayer :< cls, Object :< cls) =>
              cls -> GodotString -> GodotString -> IO Int
node_rename cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_node_rename
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "node_rename"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.node_rename

{-# NOINLINE bindAnimationTreePlayer_node_set_position #-}

-- | Sets the position of a node in the graph given its name and position.
bindAnimationTreePlayer_node_set_position :: MethodBind
bindAnimationTreePlayer_node_set_position
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the position of a node in the graph given its name and position.
node_set_position ::
                    (AnimationTreePlayer :< cls, Object :< cls) =>
                    cls -> GodotString -> Vector2 -> IO ()
node_set_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_node_set_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "node_set_position"
           '[GodotString, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.node_set_position

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_get_autorestart_delay
             #-}

-- | Returns the autostart delay of a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_get_autorestart_delay ::
                                                           MethodBind
bindAnimationTreePlayer_oneshot_node_get_autorestart_delay
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_get_autorestart_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the autostart delay of a OneShot node given its name.
oneshot_node_get_autorestart_delay ::
                                     (AnimationTreePlayer :< cls, Object :< cls) =>
                                     cls -> GodotString -> IO Float
oneshot_node_get_autorestart_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_get_autorestart_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_get_autorestart_delay"
           '[GodotString]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_get_autorestart_delay

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_get_autorestart_random_delay
             #-}

-- | Returns the autostart random delay of a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_get_autorestart_random_delay ::
                                                                  MethodBind
bindAnimationTreePlayer_oneshot_node_get_autorestart_random_delay
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_get_autorestart_random_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the autostart random delay of a OneShot node given its name.
oneshot_node_get_autorestart_random_delay ::
                                            (AnimationTreePlayer :< cls, Object :< cls) =>
                                            cls -> GodotString -> IO Float
oneshot_node_get_autorestart_random_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_get_autorestart_random_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_get_autorestart_random_delay"
           '[GodotString]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_get_autorestart_random_delay

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_get_fadein_time
             #-}

-- | Returns the fade in time of a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_get_fadein_time :: MethodBind
bindAnimationTreePlayer_oneshot_node_get_fadein_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_get_fadein_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the fade in time of a OneShot node given its name.
oneshot_node_get_fadein_time ::
                               (AnimationTreePlayer :< cls, Object :< cls) =>
                               cls -> GodotString -> IO Float
oneshot_node_get_fadein_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_get_fadein_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_get_fadein_time"
           '[GodotString]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_get_fadein_time

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_get_fadeout_time
             #-}

-- | Returns the fade out time of a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_get_fadeout_time :: MethodBind
bindAnimationTreePlayer_oneshot_node_get_fadeout_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_get_fadeout_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the fade out time of a OneShot node given its name.
oneshot_node_get_fadeout_time ::
                                (AnimationTreePlayer :< cls, Object :< cls) =>
                                cls -> GodotString -> IO Float
oneshot_node_get_fadeout_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_get_fadeout_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_get_fadeout_time"
           '[GodotString]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_get_fadeout_time

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_has_autorestart
             #-}

-- | Returns whether a OneShot node will auto restart given its name.
bindAnimationTreePlayer_oneshot_node_has_autorestart :: MethodBind
bindAnimationTreePlayer_oneshot_node_has_autorestart
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_has_autorestart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a OneShot node will auto restart given its name.
oneshot_node_has_autorestart ::
                               (AnimationTreePlayer :< cls, Object :< cls) =>
                               cls -> GodotString -> IO Bool
oneshot_node_has_autorestart cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_has_autorestart
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_has_autorestart"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_has_autorestart

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_is_active #-}

-- | Returns whether a OneShot node is active given its name.
bindAnimationTreePlayer_oneshot_node_is_active :: MethodBind
bindAnimationTreePlayer_oneshot_node_is_active
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether a OneShot node is active given its name.
oneshot_node_is_active ::
                         (AnimationTreePlayer :< cls, Object :< cls) =>
                         cls -> GodotString -> IO Bool
oneshot_node_is_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_is_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "oneshot_node_is_active"
           '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.oneshot_node_is_active

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_autorestart
             #-}

-- | Sets the autorestart property of a OneShot node given its name and value.
bindAnimationTreePlayer_oneshot_node_set_autorestart :: MethodBind
bindAnimationTreePlayer_oneshot_node_set_autorestart
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_autorestart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the autorestart property of a OneShot node given its name and value.
oneshot_node_set_autorestart ::
                               (AnimationTreePlayer :< cls, Object :< cls) =>
                               cls -> GodotString -> Bool -> IO ()
oneshot_node_set_autorestart cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_set_autorestart
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_set_autorestart"
           '[GodotString, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_set_autorestart

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_autorestart_delay
             #-}

-- | Sets the autorestart delay of a OneShot node given its name and value in seconds.
bindAnimationTreePlayer_oneshot_node_set_autorestart_delay ::
                                                           MethodBind
bindAnimationTreePlayer_oneshot_node_set_autorestart_delay
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_autorestart_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the autorestart delay of a OneShot node given its name and value in seconds.
oneshot_node_set_autorestart_delay ::
                                     (AnimationTreePlayer :< cls, Object :< cls) =>
                                     cls -> GodotString -> Float -> IO ()
oneshot_node_set_autorestart_delay cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_set_autorestart_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_set_autorestart_delay"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_set_autorestart_delay

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_autorestart_random_delay
             #-}

-- | Sets the autorestart random delay of a OneShot node given its name and value in seconds.
bindAnimationTreePlayer_oneshot_node_set_autorestart_random_delay ::
                                                                  MethodBind
bindAnimationTreePlayer_oneshot_node_set_autorestart_random_delay
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_autorestart_random_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the autorestart random delay of a OneShot node given its name and value in seconds.
oneshot_node_set_autorestart_random_delay ::
                                            (AnimationTreePlayer :< cls, Object :< cls) =>
                                            cls -> GodotString -> Float -> IO ()
oneshot_node_set_autorestart_random_delay cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_set_autorestart_random_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_set_autorestart_random_delay"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_set_autorestart_random_delay

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_fadein_time
             #-}

-- | Sets the fade in time of a OneShot node given its name and value in seconds.
bindAnimationTreePlayer_oneshot_node_set_fadein_time :: MethodBind
bindAnimationTreePlayer_oneshot_node_set_fadein_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_fadein_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the fade in time of a OneShot node given its name and value in seconds.
oneshot_node_set_fadein_time ::
                               (AnimationTreePlayer :< cls, Object :< cls) =>
                               cls -> GodotString -> Float -> IO ()
oneshot_node_set_fadein_time cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_set_fadein_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_set_fadein_time"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_set_fadein_time

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_fadeout_time
             #-}

-- | Sets the fade out time of a OneShot node given its name and value in seconds.
bindAnimationTreePlayer_oneshot_node_set_fadeout_time :: MethodBind
bindAnimationTreePlayer_oneshot_node_set_fadeout_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_fadeout_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the fade out time of a OneShot node given its name and value in seconds.
oneshot_node_set_fadeout_time ::
                                (AnimationTreePlayer :< cls, Object :< cls) =>
                                cls -> GodotString -> Float -> IO ()
oneshot_node_set_fadeout_time cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_set_fadeout_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_set_fadeout_time"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_set_fadeout_time

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_filter_path
             #-}

-- | If @enable@ is @true@, the OneShot node with ID @id@ turns off the track modifying the property at @path@. The modified node's children continue to animate.
bindAnimationTreePlayer_oneshot_node_set_filter_path :: MethodBind
bindAnimationTreePlayer_oneshot_node_set_filter_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_filter_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @enable@ is @true@, the OneShot node with ID @id@ turns off the track modifying the property at @path@. The modified node's children continue to animate.
oneshot_node_set_filter_path ::
                               (AnimationTreePlayer :< cls, Object :< cls) =>
                               cls -> GodotString -> NodePath -> Bool -> IO ()
oneshot_node_set_filter_path cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_oneshot_node_set_filter_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "oneshot_node_set_filter_path"
           '[GodotString, NodePath, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.oneshot_node_set_filter_path

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_start #-}

-- | Starts a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_start :: MethodBind
bindAnimationTreePlayer_oneshot_node_start
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starts a OneShot node given its name.
oneshot_node_start ::
                     (AnimationTreePlayer :< cls, Object :< cls) =>
                     cls -> GodotString -> IO ()
oneshot_node_start cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_oneshot_node_start
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "oneshot_node_start"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.oneshot_node_start

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_stop #-}

-- | Stops the OneShot node with name @id@.
bindAnimationTreePlayer_oneshot_node_stop :: MethodBind
bindAnimationTreePlayer_oneshot_node_stop
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the OneShot node with name @id@.
oneshot_node_stop ::
                    (AnimationTreePlayer :< cls, Object :< cls) =>
                    cls -> GodotString -> IO ()
oneshot_node_stop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_oneshot_node_stop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "oneshot_node_stop"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.oneshot_node_stop

{-# NOINLINE bindAnimationTreePlayer_recompute_caches #-}

-- | Manually recalculates the cache of track information generated from animation nodes. Needed when external sources modify the animation nodes' state.
bindAnimationTreePlayer_recompute_caches :: MethodBind
bindAnimationTreePlayer_recompute_caches
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "recompute_caches" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Manually recalculates the cache of track information generated from animation nodes. Needed when external sources modify the animation nodes' state.
recompute_caches ::
                   (AnimationTreePlayer :< cls, Object :< cls) => cls -> IO ()
recompute_caches cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_recompute_caches
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "recompute_caches" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.recompute_caches

{-# NOINLINE bindAnimationTreePlayer_remove_node #-}

-- | Removes the animation node with name @id@.
bindAnimationTreePlayer_remove_node :: MethodBind
bindAnimationTreePlayer_remove_node
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "remove_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the animation node with name @id@.
remove_node ::
              (AnimationTreePlayer :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
remove_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_remove_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "remove_node"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.remove_node

{-# NOINLINE bindAnimationTreePlayer_reset #-}

-- | Resets this @AnimationTreePlayer@.
bindAnimationTreePlayer_reset :: MethodBind
bindAnimationTreePlayer_reset
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "reset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resets this @AnimationTreePlayer@.
reset ::
        (AnimationTreePlayer :< cls, Object :< cls) => cls -> IO ()
reset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_reset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "reset" '[] (IO ()) where
        nodeMethod = Godot.Core.AnimationTreePlayer.reset

{-# NOINLINE bindAnimationTreePlayer_set_active #-}

-- | If @true@, the @AnimationTreePlayer@ is able to play animations.
bindAnimationTreePlayer_set_active :: MethodBind
bindAnimationTreePlayer_set_active
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @AnimationTreePlayer@ is able to play animations.
set_active ::
             (AnimationTreePlayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_set_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "set_active" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.set_active

{-# NOINLINE bindAnimationTreePlayer_set_animation_process_mode #-}

-- | The thread in which to update animations.
bindAnimationTreePlayer_set_animation_process_mode :: MethodBind
bindAnimationTreePlayer_set_animation_process_mode
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "set_animation_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The thread in which to update animations.
set_animation_process_mode ::
                             (AnimationTreePlayer :< cls, Object :< cls) => cls -> Int -> IO ()
set_animation_process_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_set_animation_process_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "set_animation_process_mode"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.set_animation_process_mode

{-# NOINLINE bindAnimationTreePlayer_set_base_path #-}

-- | The node from which to relatively access other nodes.
--   			It accesses the bones, so it should point to the same node the @AnimationPlayer@ would point its Root Node at.
bindAnimationTreePlayer_set_base_path :: MethodBind
bindAnimationTreePlayer_set_base_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "set_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node from which to relatively access other nodes.
--   			It accesses the bones, so it should point to the same node the @AnimationPlayer@ would point its Root Node at.
set_base_path ::
                (AnimationTreePlayer :< cls, Object :< cls) =>
                cls -> NodePath -> IO ()
set_base_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_set_base_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "set_base_path" '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.set_base_path

{-# NOINLINE bindAnimationTreePlayer_set_master_player #-}

-- | The path to the @AnimationPlayer@ from which this @AnimationTreePlayer@ binds animations to animation nodes.
--   			Once set, @Animation@ nodes can be added to the @AnimationTreePlayer@.
bindAnimationTreePlayer_set_master_player :: MethodBind
bindAnimationTreePlayer_set_master_player
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "set_master_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the @AnimationPlayer@ from which this @AnimationTreePlayer@ binds animations to animation nodes.
--   			Once set, @Animation@ nodes can be added to the @AnimationTreePlayer@.
set_master_player ::
                    (AnimationTreePlayer :< cls, Object :< cls) =>
                    cls -> NodePath -> IO ()
set_master_player cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_set_master_player
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "set_master_player"
           '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.set_master_player

{-# NOINLINE bindAnimationTreePlayer_timescale_node_get_scale #-}

-- | Returns the time scale value of the TimeScale node with name @id@.
bindAnimationTreePlayer_timescale_node_get_scale :: MethodBind
bindAnimationTreePlayer_timescale_node_get_scale
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "timescale_node_get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the time scale value of the TimeScale node with name @id@.
timescale_node_get_scale ::
                           (AnimationTreePlayer :< cls, Object :< cls) =>
                           cls -> GodotString -> IO Float
timescale_node_get_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_timescale_node_get_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "timescale_node_get_scale"
           '[GodotString]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.timescale_node_get_scale

{-# NOINLINE bindAnimationTreePlayer_timescale_node_set_scale #-}

-- | Sets the time scale of the TimeScale node with name @id@ to @scale@.
--   				The TimeScale node is used to speed @Animation@s up if the scale is above 1 or slow them down if it is below 1.
--   				If applied after a blend or mix, affects all input animations to that blend or mix.
bindAnimationTreePlayer_timescale_node_set_scale :: MethodBind
bindAnimationTreePlayer_timescale_node_set_scale
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "timescale_node_set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the time scale of the TimeScale node with name @id@ to @scale@.
--   				The TimeScale node is used to speed @Animation@s up if the scale is above 1 or slow them down if it is below 1.
--   				If applied after a blend or mix, affects all input animations to that blend or mix.
timescale_node_set_scale ::
                           (AnimationTreePlayer :< cls, Object :< cls) =>
                           cls -> GodotString -> Float -> IO ()
timescale_node_set_scale cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_timescale_node_set_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "timescale_node_set_scale"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.timescale_node_set_scale

{-# NOINLINE bindAnimationTreePlayer_timeseek_node_seek #-}

-- | Sets the time seek value of the TimeSeek node with name @id@ to @seconds@.
--   				This functions as a seek in the @Animation@ or the blend or mix of @Animation@s input in it.
bindAnimationTreePlayer_timeseek_node_seek :: MethodBind
bindAnimationTreePlayer_timeseek_node_seek
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "timeseek_node_seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the time seek value of the TimeSeek node with name @id@ to @seconds@.
--   				This functions as a seek in the @Animation@ or the blend or mix of @Animation@s input in it.
timeseek_node_seek ::
                     (AnimationTreePlayer :< cls, Object :< cls) =>
                     cls -> GodotString -> Float -> IO ()
timeseek_node_seek cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_timeseek_node_seek
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer "timeseek_node_seek"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationTreePlayer.timeseek_node_seek

{-# NOINLINE bindAnimationTreePlayer_transition_node_delete_input
             #-}

-- | Deletes the input at @input_idx@ for the transition node with name @id@.
bindAnimationTreePlayer_transition_node_delete_input :: MethodBind
bindAnimationTreePlayer_transition_node_delete_input
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_delete_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the input at @input_idx@ for the transition node with name @id@.
transition_node_delete_input ::
                               (AnimationTreePlayer :< cls, Object :< cls) =>
                               cls -> GodotString -> Int -> IO ()
transition_node_delete_input cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_delete_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_delete_input"
           '[GodotString, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_delete_input

{-# NOINLINE bindAnimationTreePlayer_transition_node_get_current
             #-}

-- | Returns the index of the currently evaluated input for the transition node with name @id@.
bindAnimationTreePlayer_transition_node_get_current :: MethodBind
bindAnimationTreePlayer_transition_node_get_current
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_get_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the currently evaluated input for the transition node with name @id@.
transition_node_get_current ::
                              (AnimationTreePlayer :< cls, Object :< cls) =>
                              cls -> GodotString -> IO Int
transition_node_get_current cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_get_current
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_get_current"
           '[GodotString]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_get_current

{-# NOINLINE bindAnimationTreePlayer_transition_node_get_input_count
             #-}

-- | Returns the number of inputs for the transition node with name @id@. You can add inputs by right-clicking on the transition node.
bindAnimationTreePlayer_transition_node_get_input_count ::
                                                        MethodBind
bindAnimationTreePlayer_transition_node_get_input_count
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_get_input_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of inputs for the transition node with name @id@. You can add inputs by right-clicking on the transition node.
transition_node_get_input_count ::
                                  (AnimationTreePlayer :< cls, Object :< cls) =>
                                  cls -> GodotString -> IO Int
transition_node_get_input_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_get_input_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_get_input_count"
           '[GodotString]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_get_input_count

{-# NOINLINE bindAnimationTreePlayer_transition_node_get_xfade_time
             #-}

-- | Returns the cross fade time for the transition node with name @id@.
bindAnimationTreePlayer_transition_node_get_xfade_time ::
                                                       MethodBind
bindAnimationTreePlayer_transition_node_get_xfade_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_get_xfade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cross fade time for the transition node with name @id@.
transition_node_get_xfade_time ::
                                 (AnimationTreePlayer :< cls, Object :< cls) =>
                                 cls -> GodotString -> IO Float
transition_node_get_xfade_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_get_xfade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_get_xfade_time"
           '[GodotString]
           (IO Float)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_get_xfade_time

{-# NOINLINE bindAnimationTreePlayer_transition_node_has_input_auto_advance
             #-}

-- | Returns @true@ if the input at @input_idx@ on the transition node with name @id@ is set to automatically advance to the next input upon completion.
bindAnimationTreePlayer_transition_node_has_input_auto_advance ::
                                                               MethodBind
bindAnimationTreePlayer_transition_node_has_input_auto_advance
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_has_input_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the input at @input_idx@ on the transition node with name @id@ is set to automatically advance to the next input upon completion.
transition_node_has_input_auto_advance ::
                                         (AnimationTreePlayer :< cls, Object :< cls) =>
                                         cls -> GodotString -> Int -> IO Bool
transition_node_has_input_auto_advance cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_has_input_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_has_input_auto_advance"
           '[GodotString, Int]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_has_input_auto_advance

{-# NOINLINE bindAnimationTreePlayer_transition_node_set_current
             #-}

-- | The transition node with name @id@ sets its current input at @input_idx@.
bindAnimationTreePlayer_transition_node_set_current :: MethodBind
bindAnimationTreePlayer_transition_node_set_current
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_set_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition node with name @id@ sets its current input at @input_idx@.
transition_node_set_current ::
                              (AnimationTreePlayer :< cls, Object :< cls) =>
                              cls -> GodotString -> Int -> IO ()
transition_node_set_current cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_set_current
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_set_current"
           '[GodotString, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_set_current

{-# NOINLINE bindAnimationTreePlayer_transition_node_set_input_auto_advance
             #-}

-- | The transition node with name @id@ advances to its next input automatically when the input at @input_idx@ completes.
bindAnimationTreePlayer_transition_node_set_input_auto_advance ::
                                                               MethodBind
bindAnimationTreePlayer_transition_node_set_input_auto_advance
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_set_input_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition node with name @id@ advances to its next input automatically when the input at @input_idx@ completes.
transition_node_set_input_auto_advance ::
                                         (AnimationTreePlayer :< cls, Object :< cls) =>
                                         cls -> GodotString -> Int -> Bool -> IO ()
transition_node_set_input_auto_advance cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_set_input_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_set_input_auto_advance"
           '[GodotString, Int, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_set_input_auto_advance

{-# NOINLINE bindAnimationTreePlayer_transition_node_set_input_count
             #-}

-- | Resizes the number of inputs available for the transition node with name @id@.
bindAnimationTreePlayer_transition_node_set_input_count ::
                                                        MethodBind
bindAnimationTreePlayer_transition_node_set_input_count
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_set_input_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resizes the number of inputs available for the transition node with name @id@.
transition_node_set_input_count ::
                                  (AnimationTreePlayer :< cls, Object :< cls) =>
                                  cls -> GodotString -> Int -> IO ()
transition_node_set_input_count cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_set_input_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_set_input_count"
           '[GodotString, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_set_input_count

{-# NOINLINE bindAnimationTreePlayer_transition_node_set_xfade_time
             #-}

-- | The transition node with name @id@ sets its cross fade time to @time_sec@.
bindAnimationTreePlayer_transition_node_set_xfade_time ::
                                                       MethodBind
bindAnimationTreePlayer_transition_node_set_xfade_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_set_xfade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition node with name @id@ sets its cross fade time to @time_sec@.
transition_node_set_xfade_time ::
                                 (AnimationTreePlayer :< cls, Object :< cls) =>
                                 cls -> GodotString -> Float -> IO ()
transition_node_set_xfade_time cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationTreePlayer_transition_node_set_xfade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationTreePlayer
           "transition_node_set_xfade_time"
           '[GodotString, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationTreePlayer.transition_node_set_xfade_time