{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.AnimationTreePlayer
       (Godot.Core.AnimationTreePlayer._NODE_TIMESEEK,
        Godot.Core.AnimationTreePlayer._NODE_OUTPUT,
        Godot.Core.AnimationTreePlayer._NODE_ANIMATION,
        Godot.Core.AnimationTreePlayer._NODE_BLEND2,
        Godot.Core.AnimationTreePlayer._NODE_TIMESCALE,
        Godot.Core.AnimationTreePlayer._NODE_BLEND4,
        Godot.Core.AnimationTreePlayer._NODE_BLEND3,
        Godot.Core.AnimationTreePlayer._NODE_TRANSITION,
        Godot.Core.AnimationTreePlayer._NODE_MIX,
        Godot.Core.AnimationTreePlayer._NODE_ONESHOT,
        Godot.Core.AnimationTreePlayer._ANIMATION_PROCESS_PHYSICS,
        Godot.Core.AnimationTreePlayer._ANIMATION_PROCESS_IDLE,
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_NODE_TIMESEEK :: Int
_NODE_TIMESEEK = 8

_NODE_OUTPUT :: Int
_NODE_OUTPUT = 0

_NODE_ANIMATION :: Int
_NODE_ANIMATION = 1

_NODE_BLEND2 :: Int
_NODE_BLEND2 = 4

_NODE_TIMESCALE :: Int
_NODE_TIMESCALE = 7

_NODE_BLEND4 :: Int
_NODE_BLEND4 = 6

_NODE_BLEND3 :: Int
_NODE_BLEND3 = 5

_NODE_TRANSITION :: Int
_NODE_TRANSITION = 9

_NODE_MIX :: Int
_NODE_MIX = 3

_NODE_ONESHOT :: Int
_NODE_ONESHOT = 2

_ANIMATION_PROCESS_PHYSICS :: Int
_ANIMATION_PROCESS_PHYSICS = 0

_ANIMATION_PROCESS_IDLE :: Int
_ANIMATION_PROCESS_IDLE = 1

{-# NOINLINE bindAnimationTreePlayer_add_node #-}

-- | Adds a [code]type[/code] node to the graph with name [code]id[/code].
bindAnimationTreePlayer_add_node :: MethodBind
bindAnimationTreePlayer_add_node
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "add_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [code]type[/code] node to the graph with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_advance #-}

-- | Shifts position in the animation timeline. Delta is the time in seconds to shift. Events between the current frame and [code]delta[/code] are handled.
bindAnimationTreePlayer_advance :: MethodBind
bindAnimationTreePlayer_advance
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shifts position in the animation timeline. Delta is the time in seconds to shift. Events between the current frame and [code]delta[/code] are handled.
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

{-# NOINLINE bindAnimationTreePlayer_animation_node_get_animation
             #-}

-- | Returns the [AnimationPlayer]'s [Animation] bound to the [code]AnimationTreePlayer[/code]'s animation node with name [code]id[/code].
bindAnimationTreePlayer_animation_node_get_animation :: MethodBind
bindAnimationTreePlayer_animation_node_get_animation
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_get_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [AnimationPlayer]'s [Animation] bound to the [code]AnimationTreePlayer[/code]'s animation node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_animation_node_get_master_animation
             #-}

-- | Returns the name of the [member master_player]'s [Animation] bound to this animation node.
bindAnimationTreePlayer_animation_node_get_master_animation ::
                                                            MethodBind
bindAnimationTreePlayer_animation_node_get_master_animation
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_get_master_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the [member master_player]'s [Animation] bound to this animation node.
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

{-# NOINLINE bindAnimationTreePlayer_animation_node_get_position
             #-}

bindAnimationTreePlayer_animation_node_get_position :: MethodBind
bindAnimationTreePlayer_animation_node_get_position
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_get_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindAnimationTreePlayer_animation_node_set_animation
             #-}

-- | Binds a new [Animation] from the [member master_player] to the [code]AnimationTreePlayer[/code]'s animation node with name [code]id[/code].
bindAnimationTreePlayer_animation_node_set_animation :: MethodBind
bindAnimationTreePlayer_animation_node_set_animation
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_set_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binds a new [Animation] from the [member master_player] to the [code]AnimationTreePlayer[/code]'s animation node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_animation_node_set_filter_path
             #-}

-- | If [code]enable[/code] is [code]true[/code], the animation node with ID [code]id[/code] turns off the track modifying the property at [code]path[/code]. The modified node's children continue to animate.
bindAnimationTreePlayer_animation_node_set_filter_path ::
                                                       MethodBind
bindAnimationTreePlayer_animation_node_set_filter_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_set_filter_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]enable[/code] is [code]true[/code], the animation node with ID [code]id[/code] turns off the track modifying the property at [code]path[/code]. The modified node's children continue to animate.
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

{-# NOINLINE bindAnimationTreePlayer_animation_node_set_master_animation
             #-}

-- | Binds the [Animation] named [code]source[/code] from [member master_player] to the animation node [code]id[/code]. Recalculates caches.
bindAnimationTreePlayer_animation_node_set_master_animation ::
                                                            MethodBind
bindAnimationTreePlayer_animation_node_set_master_animation
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "animation_node_set_master_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binds the [Animation] named [code]source[/code] from [member master_player] to the animation node [code]id[/code]. Recalculates caches.
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

{-# NOINLINE bindAnimationTreePlayer_are_nodes_connected #-}

-- | Returns whether node [code]id[/code] and [code]dst_id[/code] are connected at the specified slot.
bindAnimationTreePlayer_are_nodes_connected :: MethodBind
bindAnimationTreePlayer_are_nodes_connected
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "are_nodes_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether node [code]id[/code] and [code]dst_id[/code] are connected at the specified slot.
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

{-# NOINLINE bindAnimationTreePlayer_blend2_node_set_amount #-}

-- | Sets the blend amount of a Blend2 node given its name and value.
--   				A Blend2 Node blends two animations with the amount between 0 and 1.
--   				At 0, Output is input a.
--   				Towards 1, the influence of a gets lessened, the influence of b gets raised.
--   				At 1, Output is input b.
bindAnimationTreePlayer_blend2_node_set_amount :: MethodBind
bindAnimationTreePlayer_blend2_node_set_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend2_node_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the blend amount of a Blend2 node given its name and value.
--   				A Blend2 Node blends two animations with the amount between 0 and 1.
--   				At 0, Output is input a.
--   				Towards 1, the influence of a gets lessened, the influence of b gets raised.
--   				At 1, Output is input b.
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

{-# NOINLINE bindAnimationTreePlayer_blend2_node_set_filter_path
             #-}

-- | If [code]enable[/code] is [code]true[/code], the blend2 node with ID [code]id[/code] turns off the track modifying the property at [code]path[/code]. The modified node's children continue to animate.
bindAnimationTreePlayer_blend2_node_set_filter_path :: MethodBind
bindAnimationTreePlayer_blend2_node_set_filter_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend2_node_set_filter_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]enable[/code] is [code]true[/code], the blend2 node with ID [code]id[/code] turns off the track modifying the property at [code]path[/code]. The modified node's children continue to animate.
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

{-# NOINLINE bindAnimationTreePlayer_blend3_node_set_amount #-}

-- | Sets the blend amount of a Blend3 node given its name and value.
--   				A Blend3 Node blends three animations with the amount between -1 and 1.
--   				At -1, Output is input b-.
--   				From -1 to 0, the influence of b- gets lessened, the influence of a gets raised and the influence of b+ is 0.
--   				At 0, Output is input a.
--   				From 0 to 1, the influence of a gets lessened, the influence of b+ gets raised and the influence of b+ is 0.
--   				At 1, Output is input b+.
bindAnimationTreePlayer_blend3_node_set_amount :: MethodBind
bindAnimationTreePlayer_blend3_node_set_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "blend3_node_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the blend amount of a Blend3 node given its name and value.
--   				A Blend3 Node blends three animations with the amount between -1 and 1.
--   				At -1, Output is input b-.
--   				From -1 to 0, the influence of b- gets lessened, the influence of a gets raised and the influence of b+ is 0.
--   				At 0, Output is input a.
--   				From 0 to 1, the influence of a gets lessened, the influence of b+ gets raised and the influence of b+ is 0.
--   				At 1, Output is input b+.
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

{-# NOINLINE bindAnimationTreePlayer_blend4_node_set_amount #-}

-- | Sets the blend amount of a Blend4 node given its name and value.
--   				A Blend4 Node blends two pairs of animations.
--   				The two pairs are blended like blend2 and then added together.
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
--   				The two pairs are blended like blend2 and then added together.
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

{-# NOINLINE bindAnimationTreePlayer_connect_nodes #-}

-- | Connects node [code]id[/code] to [code]dst_id[/code] at the specified input slot.
bindAnimationTreePlayer_connect_nodes :: MethodBind
bindAnimationTreePlayer_connect_nodes
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "connect_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects node [code]id[/code] to [code]dst_id[/code] at the specified input slot.
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

{-# NOINLINE bindAnimationTreePlayer_disconnect_nodes #-}

-- | Disconnects nodes connected to [code]id[/code] at the specified input slot.
bindAnimationTreePlayer_disconnect_nodes :: MethodBind
bindAnimationTreePlayer_disconnect_nodes
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "disconnect_nodes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disconnects nodes connected to [code]id[/code] at the specified input slot.
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

{-# NOINLINE bindAnimationTreePlayer_get_animation_process_mode #-}

-- | The thread in which to update animations. Default value: [constant ANIMATION_PROCESS_IDLE].
bindAnimationTreePlayer_get_animation_process_mode :: MethodBind
bindAnimationTreePlayer_get_animation_process_mode
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "get_animation_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The thread in which to update animations. Default value: [constant ANIMATION_PROCESS_IDLE].
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

{-# NOINLINE bindAnimationTreePlayer_get_base_path #-}

-- | The node from which to relatively access other nodes. Default value: [code]".."[/code].
--   			It accesses the Bones, so it should point to the same Node the AnimationPlayer would point its Root Node at.
bindAnimationTreePlayer_get_base_path :: MethodBind
bindAnimationTreePlayer_get_base_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "get_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node from which to relatively access other nodes. Default value: [code]".."[/code].
--   			It accesses the Bones, so it should point to the same Node the AnimationPlayer would point its Root Node at.
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

{-# NOINLINE bindAnimationTreePlayer_get_master_player #-}

-- | The path to the [AnimationPlayer] from which this [code]AnimationTreePlayer[/code] binds animations to animation nodes.
--   			Once set, Animation nodes can be added to the AnimationTreePlayer.
bindAnimationTreePlayer_get_master_player :: MethodBind
bindAnimationTreePlayer_get_master_player
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "get_master_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the [AnimationPlayer] from which this [code]AnimationTreePlayer[/code] binds animations to animation nodes.
--   			Once set, Animation nodes can be added to the AnimationTreePlayer.
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

{-# NOINLINE bindAnimationTreePlayer_get_node_list #-}

-- | Returns a [PoolStringArray] containing the name of all nodes.
bindAnimationTreePlayer_get_node_list :: MethodBind
bindAnimationTreePlayer_get_node_list
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "get_node_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a [PoolStringArray] containing the name of all nodes.
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

{-# NOINLINE bindAnimationTreePlayer_is_active #-}

-- | If [code]true[/code], the [code]AnimationTreePlayer[/code] is able to play animations. Default value: [code]false[/code].
bindAnimationTreePlayer_is_active :: MethodBind
bindAnimationTreePlayer_is_active
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "is_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [code]AnimationTreePlayer[/code] is able to play animations. Default value: [code]false[/code].
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

{-# NOINLINE bindAnimationTreePlayer_mix_node_get_amount #-}

-- | Returns mix amount of a Mix node given its name.
bindAnimationTreePlayer_mix_node_get_amount :: MethodBind
bindAnimationTreePlayer_mix_node_get_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "mix_node_get_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns mix amount of a Mix node given its name.
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

{-# NOINLINE bindAnimationTreePlayer_mix_node_set_amount #-}

-- | Sets mix amount of a Mix node given its name and value.
--   				A Mix node adds input b to input a by a the amount given by ratio.
bindAnimationTreePlayer_mix_node_set_amount :: MethodBind
bindAnimationTreePlayer_mix_node_set_amount
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "mix_node_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets mix amount of a Mix node given its name and value.
--   				A Mix node adds input b to input a by a the amount given by ratio.
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

{-# NOINLINE bindAnimationTreePlayer_node_get_type #-}

-- | Get the node type, will return from NODE_* enum.
bindAnimationTreePlayer_node_get_type :: MethodBind
bindAnimationTreePlayer_node_get_type
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the node type, will return from NODE_* enum.
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

{-# NOINLINE bindAnimationTreePlayer_node_rename #-}

-- | Rename a node in the graph.
bindAnimationTreePlayer_node_rename :: MethodBind
bindAnimationTreePlayer_node_rename
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_rename" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rename a node in the graph.
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

{-# NOINLINE bindAnimationTreePlayer_node_set_position #-}

-- | Sets position of a node in the graph given its name and position.
bindAnimationTreePlayer_node_set_position :: MethodBind
bindAnimationTreePlayer_node_set_position
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "node_set_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets position of a node in the graph given its name and position.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_get_autorestart_delay
             #-}

-- | Returns autostart delay of a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_get_autorestart_delay ::
                                                           MethodBind
bindAnimationTreePlayer_oneshot_node_get_autorestart_delay
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_get_autorestart_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns autostart delay of a OneShot node given its name.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_get_autorestart_random_delay
             #-}

-- | Returns autostart random delay of a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_get_autorestart_random_delay ::
                                                                  MethodBind
bindAnimationTreePlayer_oneshot_node_get_autorestart_random_delay
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_get_autorestart_random_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns autostart random delay of a OneShot node given its name.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_get_fadein_time
             #-}

-- | Returns fade in time of a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_get_fadein_time :: MethodBind
bindAnimationTreePlayer_oneshot_node_get_fadein_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_get_fadein_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns fade in time of a OneShot node given its name.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_get_fadeout_time
             #-}

-- | Returns fade out time of a OneShot node given its name.
bindAnimationTreePlayer_oneshot_node_get_fadeout_time :: MethodBind
bindAnimationTreePlayer_oneshot_node_get_fadeout_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_get_fadeout_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns fade out time of a OneShot node given its name.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_autorestart
             #-}

-- | Sets autorestart property of a OneShot node given its name and value.
bindAnimationTreePlayer_oneshot_node_set_autorestart :: MethodBind
bindAnimationTreePlayer_oneshot_node_set_autorestart
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_autorestart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets autorestart property of a OneShot node given its name and value.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_autorestart_delay
             #-}

-- | Sets autorestart delay of a OneShot node given its name and value in seconds.
bindAnimationTreePlayer_oneshot_node_set_autorestart_delay ::
                                                           MethodBind
bindAnimationTreePlayer_oneshot_node_set_autorestart_delay
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_autorestart_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets autorestart delay of a OneShot node given its name and value in seconds.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_autorestart_random_delay
             #-}

-- | Sets autorestart random delay of a OneShot node given its name and value in seconds.
bindAnimationTreePlayer_oneshot_node_set_autorestart_random_delay ::
                                                                  MethodBind
bindAnimationTreePlayer_oneshot_node_set_autorestart_random_delay
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_autorestart_random_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets autorestart random delay of a OneShot node given its name and value in seconds.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_fadein_time
             #-}

-- | Sets fade in time of a OneShot node given its name and value in seconds.
bindAnimationTreePlayer_oneshot_node_set_fadein_time :: MethodBind
bindAnimationTreePlayer_oneshot_node_set_fadein_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_fadein_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets fade in time of a OneShot node given its name and value in seconds.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_fadeout_time
             #-}

-- | Sets fade out time of a OneShot node given its name and value in seconds.
bindAnimationTreePlayer_oneshot_node_set_fadeout_time :: MethodBind
bindAnimationTreePlayer_oneshot_node_set_fadeout_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_fadeout_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets fade out time of a OneShot node given its name and value in seconds.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_set_filter_path
             #-}

-- | If [code]enable[/code] is [code]true[/code], the oneshot node with ID [code]id[/code] turns off the track modifying the property at [code]path[/code]. The modified node's children continue to animate.
bindAnimationTreePlayer_oneshot_node_set_filter_path :: MethodBind
bindAnimationTreePlayer_oneshot_node_set_filter_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_set_filter_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]enable[/code] is [code]true[/code], the oneshot node with ID [code]id[/code] turns off the track modifying the property at [code]path[/code]. The modified node's children continue to animate.
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

{-# NOINLINE bindAnimationTreePlayer_oneshot_node_stop #-}

-- | Stops the OneShot node with name [code]id[/code].
bindAnimationTreePlayer_oneshot_node_stop :: MethodBind
bindAnimationTreePlayer_oneshot_node_stop
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "oneshot_node_stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the OneShot node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_remove_node #-}

-- | Removes the animation node with name [code]id[/code].
bindAnimationTreePlayer_remove_node :: MethodBind
bindAnimationTreePlayer_remove_node
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "remove_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the animation node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_reset #-}

-- | Resets this [code]AnimationTreePlayer[/code].
bindAnimationTreePlayer_reset :: MethodBind
bindAnimationTreePlayer_reset
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "reset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resets this [code]AnimationTreePlayer[/code].
reset ::
        (AnimationTreePlayer :< cls, Object :< cls) => cls -> IO ()
reset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationTreePlayer_reset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindAnimationTreePlayer_set_active #-}

-- | If [code]true[/code], the [code]AnimationTreePlayer[/code] is able to play animations. Default value: [code]false[/code].
bindAnimationTreePlayer_set_active :: MethodBind
bindAnimationTreePlayer_set_active
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [code]AnimationTreePlayer[/code] is able to play animations. Default value: [code]false[/code].
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

{-# NOINLINE bindAnimationTreePlayer_set_animation_process_mode #-}

-- | The thread in which to update animations. Default value: [constant ANIMATION_PROCESS_IDLE].
bindAnimationTreePlayer_set_animation_process_mode :: MethodBind
bindAnimationTreePlayer_set_animation_process_mode
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "set_animation_process_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The thread in which to update animations. Default value: [constant ANIMATION_PROCESS_IDLE].
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

{-# NOINLINE bindAnimationTreePlayer_set_base_path #-}

-- | The node from which to relatively access other nodes. Default value: [code]".."[/code].
--   			It accesses the Bones, so it should point to the same Node the AnimationPlayer would point its Root Node at.
bindAnimationTreePlayer_set_base_path :: MethodBind
bindAnimationTreePlayer_set_base_path
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "set_base_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node from which to relatively access other nodes. Default value: [code]".."[/code].
--   			It accesses the Bones, so it should point to the same Node the AnimationPlayer would point its Root Node at.
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

{-# NOINLINE bindAnimationTreePlayer_set_master_player #-}

-- | The path to the [AnimationPlayer] from which this [code]AnimationTreePlayer[/code] binds animations to animation nodes.
--   			Once set, Animation nodes can be added to the AnimationTreePlayer.
bindAnimationTreePlayer_set_master_player :: MethodBind
bindAnimationTreePlayer_set_master_player
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "set_master_player" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the [AnimationPlayer] from which this [code]AnimationTreePlayer[/code] binds animations to animation nodes.
--   			Once set, Animation nodes can be added to the AnimationTreePlayer.
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

{-# NOINLINE bindAnimationTreePlayer_timescale_node_get_scale #-}

-- | Returns time scale value of the TimeScale node with name [code]id[/code].
bindAnimationTreePlayer_timescale_node_get_scale :: MethodBind
bindAnimationTreePlayer_timescale_node_get_scale
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "timescale_node_get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns time scale value of the TimeScale node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_timescale_node_set_scale #-}

-- | Sets the time scale of the TimeScale node with name [code]id[/code] to [code]scale[/code].
--   				The timescale node is used to speed [Animation]s up if the scale is above 1 or slow them down if it is below 1.
--   				If applied after a blend or mix, affects all input animations to that blend or mix.
bindAnimationTreePlayer_timescale_node_set_scale :: MethodBind
bindAnimationTreePlayer_timescale_node_set_scale
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "timescale_node_set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the time scale of the TimeScale node with name [code]id[/code] to [code]scale[/code].
--   				The timescale node is used to speed [Animation]s up if the scale is above 1 or slow them down if it is below 1.
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

{-# NOINLINE bindAnimationTreePlayer_timeseek_node_seek #-}

-- | Sets the time seek value of the TimeSeek node with name [code]id[/code] to [code]seconds[/code]
--   				This functions as a seek in the [Animation] or the blend or mix of [Animation]s input in it.
bindAnimationTreePlayer_timeseek_node_seek :: MethodBind
bindAnimationTreePlayer_timeseek_node_seek
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "timeseek_node_seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the time seek value of the TimeSeek node with name [code]id[/code] to [code]seconds[/code]
--   				This functions as a seek in the [Animation] or the blend or mix of [Animation]s input in it.
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_delete_input
             #-}

-- | Deletes the input at [code]input_idx[/code] for the transition node with name [code]id[/code].
bindAnimationTreePlayer_transition_node_delete_input :: MethodBind
bindAnimationTreePlayer_transition_node_delete_input
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_delete_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the input at [code]input_idx[/code] for the transition node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_get_current
             #-}

-- | Returns the index of the currently evaluated input for the transition node with name [code]id[/code].
bindAnimationTreePlayer_transition_node_get_current :: MethodBind
bindAnimationTreePlayer_transition_node_get_current
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_get_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the index of the currently evaluated input for the transition node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_get_input_count
             #-}

-- | Returns the number of inputs for the transition node with name [code]id[/code]. You can add inputs by rightclicking on the transition node.
bindAnimationTreePlayer_transition_node_get_input_count ::
                                                        MethodBind
bindAnimationTreePlayer_transition_node_get_input_count
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_get_input_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of inputs for the transition node with name [code]id[/code]. You can add inputs by rightclicking on the transition node.
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_get_xfade_time
             #-}

-- | Returns the cross fade time for the transition node with name [code]id[/code].
bindAnimationTreePlayer_transition_node_get_xfade_time ::
                                                       MethodBind
bindAnimationTreePlayer_transition_node_get_xfade_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_get_xfade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cross fade time for the transition node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_has_input_auto_advance
             #-}

-- | Returns [code]true[/code] if the input at [code]input_idx[/code] on transition node with name [code]id[/code] is set to automatically advance to the next input upon completion.
bindAnimationTreePlayer_transition_node_has_input_auto_advance ::
                                                               MethodBind
bindAnimationTreePlayer_transition_node_has_input_auto_advance
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_has_input_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the input at [code]input_idx[/code] on transition node with name [code]id[/code] is set to automatically advance to the next input upon completion.
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_set_current
             #-}

-- | The transition node with name [code]id[/code] sets its current input at [code]input_idx[/code].
bindAnimationTreePlayer_transition_node_set_current :: MethodBind
bindAnimationTreePlayer_transition_node_set_current
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_set_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition node with name [code]id[/code] sets its current input at [code]input_idx[/code].
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_set_input_auto_advance
             #-}

-- | The transition node with name [code]id[/code] advances to its next input automatically when the input at [code]input_idx[/code] completes.
bindAnimationTreePlayer_transition_node_set_input_auto_advance ::
                                                               MethodBind
bindAnimationTreePlayer_transition_node_set_input_auto_advance
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_set_input_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition node with name [code]id[/code] advances to its next input automatically when the input at [code]input_idx[/code] completes.
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_set_input_count
             #-}

-- | Resizes the number of inputs available for the transition node with name [code]id[/code].
bindAnimationTreePlayer_transition_node_set_input_count ::
                                                        MethodBind
bindAnimationTreePlayer_transition_node_set_input_count
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_set_input_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resizes the number of inputs available for the transition node with name [code]id[/code].
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

{-# NOINLINE bindAnimationTreePlayer_transition_node_set_xfade_time
             #-}

-- | The transition node with name [code]id[/code] sets its cross fade time to [code]time_sec[/code].
bindAnimationTreePlayer_transition_node_set_xfade_time ::
                                                       MethodBind
bindAnimationTreePlayer_transition_node_set_xfade_time
  = unsafePerformIO $
      withCString "AnimationTreePlayer" $
        \ clsNamePtr ->
          withCString "transition_node_set_xfade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The transition node with name [code]id[/code] sets its cross fade time to [code]time_sec[/code].
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