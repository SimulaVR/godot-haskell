{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.SpriteFrames
       (Godot.Core.SpriteFrames.add_animation,
        Godot.Core.SpriteFrames.has_animation,
        Godot.Core.SpriteFrames.remove_animation,
        Godot.Core.SpriteFrames.rename_animation,
        Godot.Core.SpriteFrames.get_animation_names,
        Godot.Core.SpriteFrames.set_animation_speed,
        Godot.Core.SpriteFrames.get_animation_speed,
        Godot.Core.SpriteFrames.set_animation_loop,
        Godot.Core.SpriteFrames.get_animation_loop,
        Godot.Core.SpriteFrames.add_frame,
        Godot.Core.SpriteFrames.get_frame_count,
        Godot.Core.SpriteFrames.get_frame,
        Godot.Core.SpriteFrames.set_frame,
        Godot.Core.SpriteFrames.remove_frame,
        Godot.Core.SpriteFrames.clear, Godot.Core.SpriteFrames.clear_all,
        Godot.Core.SpriteFrames._set_frames,
        Godot.Core.SpriteFrames._get_frames,
        Godot.Core.SpriteFrames._set_animations,
        Godot.Core.SpriteFrames._get_animations)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSpriteFrames_add_animation #-}

-- | Adds a new animation to the library.
bindSpriteFrames_add_animation :: MethodBind
bindSpriteFrames_add_animation
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "add_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new animation to the library.
add_animation ::
                (SpriteFrames :< cls, Object :< cls) => cls -> GodotString -> IO ()
add_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_add_animation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_has_animation #-}

-- | If [code]true[/code], the named animation exists.
bindSpriteFrames_has_animation :: MethodBind
bindSpriteFrames_has_animation
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "has_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the named animation exists.
has_animation ::
                (SpriteFrames :< cls, Object :< cls) =>
                cls -> GodotString -> IO Bool
has_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_has_animation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_remove_animation #-}

-- | Removes the given animation.
bindSpriteFrames_remove_animation :: MethodBind
bindSpriteFrames_remove_animation
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "remove_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the given animation.
remove_animation ::
                   (SpriteFrames :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_animation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_remove_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_rename_animation #-}

-- | Changes the animation's name to [code]newname[/code].
bindSpriteFrames_rename_animation :: MethodBind
bindSpriteFrames_rename_animation
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "rename_animation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the animation's name to [code]newname[/code].
rename_animation ::
                   (SpriteFrames :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO ()
rename_animation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_rename_animation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_get_animation_names #-}

-- | Returns an array containing the names associated to each animation. Values are placed in alphabetical order.
bindSpriteFrames_get_animation_names :: MethodBind
bindSpriteFrames_get_animation_names
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "get_animation_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array containing the names associated to each animation. Values are placed in alphabetical order.
get_animation_names ::
                      (SpriteFrames :< cls, Object :< cls) => cls -> IO PoolStringArray
get_animation_names cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_get_animation_names
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_set_animation_speed #-}

-- | The animation's speed in frames per second.
bindSpriteFrames_set_animation_speed :: MethodBind
bindSpriteFrames_set_animation_speed
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "set_animation_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The animation's speed in frames per second.
set_animation_speed ::
                      (SpriteFrames :< cls, Object :< cls) =>
                      cls -> GodotString -> Float -> IO ()
set_animation_speed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_set_animation_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_get_animation_speed #-}

-- | The animation's speed in frames per second.
bindSpriteFrames_get_animation_speed :: MethodBind
bindSpriteFrames_get_animation_speed
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "get_animation_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The animation's speed in frames per second.
get_animation_speed ::
                      (SpriteFrames :< cls, Object :< cls) =>
                      cls -> GodotString -> IO Float
get_animation_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_get_animation_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_set_animation_loop #-}

-- | If [code]true[/code], the animation will loop.
bindSpriteFrames_set_animation_loop :: MethodBind
bindSpriteFrames_set_animation_loop
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "set_animation_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the animation will loop.
set_animation_loop ::
                     (SpriteFrames :< cls, Object :< cls) =>
                     cls -> GodotString -> Bool -> IO ()
set_animation_loop cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_set_animation_loop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_get_animation_loop #-}

-- | If [code]true[/code], the given animation will loop.
bindSpriteFrames_get_animation_loop :: MethodBind
bindSpriteFrames_get_animation_loop
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "get_animation_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the given animation will loop.
get_animation_loop ::
                     (SpriteFrames :< cls, Object :< cls) =>
                     cls -> GodotString -> IO Bool
get_animation_loop cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_get_animation_loop
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_add_frame #-}

-- | Adds a frame to the given animation.
bindSpriteFrames_add_frame :: MethodBind
bindSpriteFrames_add_frame
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "add_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a frame to the given animation.
add_frame ::
            (SpriteFrames :< cls, Object :< cls) =>
            cls -> GodotString -> Texture -> Int -> IO ()
add_frame cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_add_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_get_frame_count #-}

-- | Returns the number of frames in the animation.
bindSpriteFrames_get_frame_count :: MethodBind
bindSpriteFrames_get_frame_count
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "get_frame_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of frames in the animation.
get_frame_count ::
                  (SpriteFrames :< cls, Object :< cls) =>
                  cls -> GodotString -> IO Int
get_frame_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_get_frame_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_get_frame #-}

-- | Returns the animation's selected frame.
bindSpriteFrames_get_frame :: MethodBind
bindSpriteFrames_get_frame
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "get_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the animation's selected frame.
get_frame ::
            (SpriteFrames :< cls, Object :< cls) =>
            cls -> GodotString -> Int -> IO Texture
get_frame cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_get_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_set_frame #-}

-- | Sets the texture of the given frame.
bindSpriteFrames_set_frame :: MethodBind
bindSpriteFrames_set_frame
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "set_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the texture of the given frame.
set_frame ::
            (SpriteFrames :< cls, Object :< cls) =>
            cls -> GodotString -> Int -> Texture -> IO ()
set_frame cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_set_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_remove_frame #-}

-- | Removes the animation's selected frame.
bindSpriteFrames_remove_frame :: MethodBind
bindSpriteFrames_remove_frame
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "remove_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the animation's selected frame.
remove_frame ::
               (SpriteFrames :< cls, Object :< cls) =>
               cls -> GodotString -> Int -> IO ()
remove_frame cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_remove_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_clear #-}

-- | Removes all frames from the given animation.
bindSpriteFrames_clear :: MethodBind
bindSpriteFrames_clear
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all frames from the given animation.
clear ::
        (SpriteFrames :< cls, Object :< cls) => cls -> GodotString -> IO ()
clear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames_clear_all #-}

-- | Removes all animations. A "default" animation will be created.
bindSpriteFrames_clear_all :: MethodBind
bindSpriteFrames_clear_all
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "clear_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all animations. A "default" animation will be created.
clear_all :: (SpriteFrames :< cls, Object :< cls) => cls -> IO ()
clear_all cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames_clear_all (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames__set_frames #-}

bindSpriteFrames__set_frames :: MethodBind
bindSpriteFrames__set_frames
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "_set_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_frames ::
              (SpriteFrames :< cls, Object :< cls) => cls -> Array -> IO ()
_set_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames__set_frames (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames__get_frames #-}

bindSpriteFrames__get_frames :: MethodBind
bindSpriteFrames__get_frames
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "_get_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_frames ::
              (SpriteFrames :< cls, Object :< cls) => cls -> IO Array
_get_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames__get_frames (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames__set_animations #-}

bindSpriteFrames__set_animations :: MethodBind
bindSpriteFrames__set_animations
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "_set_animations" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_animations ::
                  (SpriteFrames :< cls, Object :< cls) => cls -> Array -> IO ()
_set_animations cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames__set_animations
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSpriteFrames__get_animations #-}

bindSpriteFrames__get_animations :: MethodBind
bindSpriteFrames__get_animations
  = unsafePerformIO $
      withCString "SpriteFrames" $
        \ clsNamePtr ->
          withCString "_get_animations" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_animations ::
                  (SpriteFrames :< cls, Object :< cls) => cls -> IO Array
_get_animations cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteFrames__get_animations
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)