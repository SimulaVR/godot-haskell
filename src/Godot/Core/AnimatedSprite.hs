{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimatedSprite
       (Godot.Core.AnimatedSprite.sig_animation_finished,
        Godot.Core.AnimatedSprite.sig_frame_changed,
        Godot.Core.AnimatedSprite._is_playing,
        Godot.Core.AnimatedSprite._res_changed,
        Godot.Core.AnimatedSprite._set_playing,
        Godot.Core.AnimatedSprite.get_animation,
        Godot.Core.AnimatedSprite.get_frame,
        Godot.Core.AnimatedSprite.get_offset,
        Godot.Core.AnimatedSprite.get_speed_scale,
        Godot.Core.AnimatedSprite.get_sprite_frames,
        Godot.Core.AnimatedSprite.is_centered,
        Godot.Core.AnimatedSprite.is_flipped_h,
        Godot.Core.AnimatedSprite.is_flipped_v,
        Godot.Core.AnimatedSprite.is_playing,
        Godot.Core.AnimatedSprite.play,
        Godot.Core.AnimatedSprite.set_animation,
        Godot.Core.AnimatedSprite.set_centered,
        Godot.Core.AnimatedSprite.set_flip_h,
        Godot.Core.AnimatedSprite.set_flip_v,
        Godot.Core.AnimatedSprite.set_frame,
        Godot.Core.AnimatedSprite.set_offset,
        Godot.Core.AnimatedSprite.set_speed_scale,
        Godot.Core.AnimatedSprite.set_sprite_frames,
        Godot.Core.AnimatedSprite.stop)
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
import Godot.Core.Node2D()

-- | Emitted when the animation is finished (when it plays the last frame). If the animation is looping, this signal is emitted every time the last frame is drawn.
sig_animation_finished ::
                       Godot.Internal.Dispatch.Signal AnimatedSprite
sig_animation_finished
  = Godot.Internal.Dispatch.Signal "animation_finished"

instance NodeSignal AnimatedSprite "animation_finished" '[]

-- | Emitted when @frame@ changed.
sig_frame_changed :: Godot.Internal.Dispatch.Signal AnimatedSprite
sig_frame_changed = Godot.Internal.Dispatch.Signal "frame_changed"

instance NodeSignal AnimatedSprite "frame_changed" '[]

instance NodeProperty AnimatedSprite "animation" GodotString 'False
         where
        nodeProperty
          = (get_animation, wrapDroppingSetter set_animation, Nothing)

instance NodeProperty AnimatedSprite "centered" Bool 'False where
        nodeProperty
          = (is_centered, wrapDroppingSetter set_centered, Nothing)

instance NodeProperty AnimatedSprite "flip_h" Bool 'False where
        nodeProperty
          = (is_flipped_h, wrapDroppingSetter set_flip_h, Nothing)

instance NodeProperty AnimatedSprite "flip_v" Bool 'False where
        nodeProperty
          = (is_flipped_v, wrapDroppingSetter set_flip_v, Nothing)

instance NodeProperty AnimatedSprite "frame" Int 'False where
        nodeProperty = (get_frame, wrapDroppingSetter set_frame, Nothing)

instance NodeProperty AnimatedSprite "frames" SpriteFrames 'False
         where
        nodeProperty
          = (get_sprite_frames, wrapDroppingSetter set_sprite_frames,
             Nothing)

instance NodeProperty AnimatedSprite "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty AnimatedSprite "playing" Bool 'False where
        nodeProperty
          = (_is_playing, wrapDroppingSetter _set_playing, Nothing)

instance NodeProperty AnimatedSprite "speed_scale" Float 'False
         where
        nodeProperty
          = (get_speed_scale, wrapDroppingSetter set_speed_scale, Nothing)

{-# NOINLINE bindAnimatedSprite__is_playing #-}

-- | If @true@, the @animation@ is currently playing.
bindAnimatedSprite__is_playing :: MethodBind
bindAnimatedSprite__is_playing
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "_is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @animation@ is currently playing.
_is_playing ::
              (AnimatedSprite :< cls, Object :< cls) => cls -> IO Bool
_is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite__is_playing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "_is_playing" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AnimatedSprite._is_playing

{-# NOINLINE bindAnimatedSprite__res_changed #-}

bindAnimatedSprite__res_changed :: MethodBind
bindAnimatedSprite__res_changed
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "_res_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_res_changed ::
               (AnimatedSprite :< cls, Object :< cls) => cls -> IO ()
_res_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite__res_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "_res_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.AnimatedSprite._res_changed

{-# NOINLINE bindAnimatedSprite__set_playing #-}

-- | If @true@, the @animation@ is currently playing.
bindAnimatedSprite__set_playing :: MethodBind
bindAnimatedSprite__set_playing
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "_set_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @animation@ is currently playing.
_set_playing ::
               (AnimatedSprite :< cls, Object :< cls) => cls -> Bool -> IO ()
_set_playing cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite__set_playing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "_set_playing" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite._set_playing

{-# NOINLINE bindAnimatedSprite_get_animation #-}

-- | The current animation from the @frames@ resource. If this value changes, the @frame@ counter is reset.
bindAnimatedSprite_get_animation :: MethodBind
bindAnimatedSprite_get_animation
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "get_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current animation from the @frames@ resource. If this value changes, the @frame@ counter is reset.
get_animation ::
                (AnimatedSprite :< cls, Object :< cls) => cls -> IO GodotString
get_animation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_get_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "get_animation" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AnimatedSprite.get_animation

{-# NOINLINE bindAnimatedSprite_get_frame #-}

-- | The displayed animation frame's index.
bindAnimatedSprite_get_frame :: MethodBind
bindAnimatedSprite_get_frame
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The displayed animation frame's index.
get_frame ::
            (AnimatedSprite :< cls, Object :< cls) => cls -> IO Int
get_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_get_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "get_frame" '[] (IO Int) where
        nodeMethod = Godot.Core.AnimatedSprite.get_frame

{-# NOINLINE bindAnimatedSprite_get_offset #-}

-- | The texture's drawing offset.
bindAnimatedSprite_get_offset :: MethodBind
bindAnimatedSprite_get_offset
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's drawing offset.
get_offset ::
             (AnimatedSprite :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_get_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "get_offset" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.AnimatedSprite.get_offset

{-# NOINLINE bindAnimatedSprite_get_speed_scale #-}

-- | The animation speed is multiplied by this value.
bindAnimatedSprite_get_speed_scale :: MethodBind
bindAnimatedSprite_get_speed_scale
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "get_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The animation speed is multiplied by this value.
get_speed_scale ::
                  (AnimatedSprite :< cls, Object :< cls) => cls -> IO Float
get_speed_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_get_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "get_speed_scale" '[] (IO Float)
         where
        nodeMethod = Godot.Core.AnimatedSprite.get_speed_scale

{-# NOINLINE bindAnimatedSprite_get_sprite_frames #-}

-- | The @SpriteFrames@ resource containing the animation(s).
bindAnimatedSprite_get_sprite_frames :: MethodBind
bindAnimatedSprite_get_sprite_frames
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "get_sprite_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @SpriteFrames@ resource containing the animation(s).
get_sprite_frames ::
                    (AnimatedSprite :< cls, Object :< cls) => cls -> IO SpriteFrames
get_sprite_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_get_sprite_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "get_sprite_frames" '[]
           (IO SpriteFrames)
         where
        nodeMethod = Godot.Core.AnimatedSprite.get_sprite_frames

{-# NOINLINE bindAnimatedSprite_is_centered #-}

-- | If @true@, texture will be centered.
bindAnimatedSprite_is_centered :: MethodBind
bindAnimatedSprite_is_centered
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "is_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture will be centered.
is_centered ::
              (AnimatedSprite :< cls, Object :< cls) => cls -> IO Bool
is_centered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_is_centered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "is_centered" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AnimatedSprite.is_centered

{-# NOINLINE bindAnimatedSprite_is_flipped_h #-}

-- | If @true@, texture is flipped horizontally.
bindAnimatedSprite_is_flipped_h :: MethodBind
bindAnimatedSprite_is_flipped_h
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "is_flipped_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped horizontally.
is_flipped_h ::
               (AnimatedSprite :< cls, Object :< cls) => cls -> IO Bool
is_flipped_h cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_is_flipped_h (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "is_flipped_h" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AnimatedSprite.is_flipped_h

{-# NOINLINE bindAnimatedSprite_is_flipped_v #-}

-- | If @true@, texture is flipped vertically.
bindAnimatedSprite_is_flipped_v :: MethodBind
bindAnimatedSprite_is_flipped_v
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "is_flipped_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped vertically.
is_flipped_v ::
               (AnimatedSprite :< cls, Object :< cls) => cls -> IO Bool
is_flipped_v cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_is_flipped_v (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "is_flipped_v" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.AnimatedSprite.is_flipped_v

{-# NOINLINE bindAnimatedSprite_is_playing #-}

-- | Returns @true@ if an animation is currently being played.
bindAnimatedSprite_is_playing :: MethodBind
bindAnimatedSprite_is_playing
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if an animation is currently being played.
is_playing ::
             (AnimatedSprite :< cls, Object :< cls) => cls -> IO Bool
is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_is_playing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "is_playing" '[] (IO Bool) where
        nodeMethod = Godot.Core.AnimatedSprite.is_playing

{-# NOINLINE bindAnimatedSprite_play #-}

-- | Plays the animation named @anim@. If no @anim@ is provided, the current animation is played. If @backwards@ is @true@, the animation will be played in reverse.
bindAnimatedSprite_play :: MethodBind
bindAnimatedSprite_play
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Plays the animation named @anim@. If no @anim@ is provided, the current animation is played. If @backwards@ is @true@, the animation will be played in reverse.
play ::
       (AnimatedSprite :< cls, Object :< cls) =>
       cls -> Maybe GodotString -> Maybe Bool -> IO ()
play cls arg1 arg2
  = withVariantArray
      [defaultedVariant VariantString "" arg1,
       maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_play (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "play"
           '[Maybe GodotString, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite.play

{-# NOINLINE bindAnimatedSprite_set_animation #-}

-- | The current animation from the @frames@ resource. If this value changes, the @frame@ counter is reset.
bindAnimatedSprite_set_animation :: MethodBind
bindAnimatedSprite_set_animation
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "set_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current animation from the @frames@ resource. If this value changes, the @frame@ counter is reset.
set_animation ::
                (AnimatedSprite :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_set_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "set_animation" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite.set_animation

{-# NOINLINE bindAnimatedSprite_set_centered #-}

-- | If @true@, texture will be centered.
bindAnimatedSprite_set_centered :: MethodBind
bindAnimatedSprite_set_centered
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "set_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture will be centered.
set_centered ::
               (AnimatedSprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_centered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_set_centered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "set_centered" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite.set_centered

{-# NOINLINE bindAnimatedSprite_set_flip_h #-}

-- | If @true@, texture is flipped horizontally.
bindAnimatedSprite_set_flip_h :: MethodBind
bindAnimatedSprite_set_flip_h
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "set_flip_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped horizontally.
set_flip_h ::
             (AnimatedSprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_h cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_set_flip_h (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "set_flip_h" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite.set_flip_h

{-# NOINLINE bindAnimatedSprite_set_flip_v #-}

-- | If @true@, texture is flipped vertically.
bindAnimatedSprite_set_flip_v :: MethodBind
bindAnimatedSprite_set_flip_v
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "set_flip_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped vertically.
set_flip_v ::
             (AnimatedSprite :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_v cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_set_flip_v (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "set_flip_v" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite.set_flip_v

{-# NOINLINE bindAnimatedSprite_set_frame #-}

-- | The displayed animation frame's index.
bindAnimatedSprite_set_frame :: MethodBind
bindAnimatedSprite_set_frame
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "set_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The displayed animation frame's index.
set_frame ::
            (AnimatedSprite :< cls, Object :< cls) => cls -> Int -> IO ()
set_frame cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_set_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "set_frame" '[Int] (IO ()) where
        nodeMethod = Godot.Core.AnimatedSprite.set_frame

{-# NOINLINE bindAnimatedSprite_set_offset #-}

-- | The texture's drawing offset.
bindAnimatedSprite_set_offset :: MethodBind
bindAnimatedSprite_set_offset
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's drawing offset.
set_offset ::
             (AnimatedSprite :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_set_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "set_offset" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite.set_offset

{-# NOINLINE bindAnimatedSprite_set_speed_scale #-}

-- | The animation speed is multiplied by this value.
bindAnimatedSprite_set_speed_scale :: MethodBind
bindAnimatedSprite_set_speed_scale
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The animation speed is multiplied by this value.
set_speed_scale ::
                  (AnimatedSprite :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_set_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "set_speed_scale" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite.set_speed_scale

{-# NOINLINE bindAnimatedSprite_set_sprite_frames #-}

-- | The @SpriteFrames@ resource containing the animation(s).
bindAnimatedSprite_set_sprite_frames :: MethodBind
bindAnimatedSprite_set_sprite_frames
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "set_sprite_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @SpriteFrames@ resource containing the animation(s).
set_sprite_frames ::
                    (AnimatedSprite :< cls, Object :< cls) =>
                    cls -> SpriteFrames -> IO ()
set_sprite_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_set_sprite_frames
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "set_sprite_frames"
           '[SpriteFrames]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimatedSprite.set_sprite_frames

{-# NOINLINE bindAnimatedSprite_stop #-}

-- | Stops the current animation (does not reset the frame counter).
bindAnimatedSprite_stop :: MethodBind
bindAnimatedSprite_stop
  = unsafePerformIO $
      withCString "AnimatedSprite" $
        \ clsNamePtr ->
          withCString "stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops the current animation (does not reset the frame counter).
stop :: (AnimatedSprite :< cls, Object :< cls) => cls -> IO ()
stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedSprite_stop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedSprite "stop" '[] (IO ()) where
        nodeMethod = Godot.Core.AnimatedSprite.stop