{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CanvasLayer
       (Godot.Core.CanvasLayer.get_canvas,
        Godot.Core.CanvasLayer.get_custom_viewport,
        Godot.Core.CanvasLayer.get_follow_viewport_scale,
        Godot.Core.CanvasLayer.get_layer,
        Godot.Core.CanvasLayer.get_offset,
        Godot.Core.CanvasLayer.get_rotation,
        Godot.Core.CanvasLayer.get_rotation_degrees,
        Godot.Core.CanvasLayer.get_scale,
        Godot.Core.CanvasLayer.get_transform,
        Godot.Core.CanvasLayer.is_following_viewport,
        Godot.Core.CanvasLayer.set_custom_viewport,
        Godot.Core.CanvasLayer.set_follow_viewport,
        Godot.Core.CanvasLayer.set_follow_viewport_scale,
        Godot.Core.CanvasLayer.set_layer,
        Godot.Core.CanvasLayer.set_offset,
        Godot.Core.CanvasLayer.set_rotation,
        Godot.Core.CanvasLayer.set_rotation_degrees,
        Godot.Core.CanvasLayer.set_scale,
        Godot.Core.CanvasLayer.set_transform)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCanvasLayer_get_canvas #-}

-- | Returns the RID of the canvas used by this layer.
bindCanvasLayer_get_canvas :: MethodBind
bindCanvasLayer_get_canvas
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the RID of the canvas used by this layer.
get_canvas :: (CanvasLayer :< cls, Object :< cls) => cls -> IO Rid
get_canvas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_canvas (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_get_custom_viewport #-}

-- | The custom [Viewport] node assigned to the [code]CanvasLayer[/code]. If null, uses the default viewport instead.
bindCanvasLayer_get_custom_viewport :: MethodBind
bindCanvasLayer_get_custom_viewport
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_custom_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [Viewport] node assigned to the [code]CanvasLayer[/code]. If null, uses the default viewport instead.
get_custom_viewport ::
                      (CanvasLayer :< cls, Object :< cls) => cls -> IO Node
get_custom_viewport cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_custom_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_get_follow_viewport_scale #-}

bindCanvasLayer_get_follow_viewport_scale :: MethodBind
bindCanvasLayer_get_follow_viewport_scale
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_follow_viewport_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_follow_viewport_scale ::
                            (CanvasLayer :< cls, Object :< cls) => cls -> IO Float
get_follow_viewport_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_follow_viewport_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_get_layer #-}

-- | Layer index for draw order. Lower values are drawn first. Default value: [code]1[/code].
bindCanvasLayer_get_layer :: MethodBind
bindCanvasLayer_get_layer
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Layer index for draw order. Lower values are drawn first. Default value: [code]1[/code].
get_layer :: (CanvasLayer :< cls, Object :< cls) => cls -> IO Int
get_layer cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_get_offset #-}

-- | The layer's base offset.
bindCanvasLayer_get_offset :: MethodBind
bindCanvasLayer_get_offset
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's base offset.
get_offset ::
             (CanvasLayer :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_get_rotation #-}

-- | The layer's rotation in radians.
bindCanvasLayer_get_rotation :: MethodBind
bindCanvasLayer_get_rotation
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's rotation in radians.
get_rotation ::
               (CanvasLayer :< cls, Object :< cls) => cls -> IO Float
get_rotation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_rotation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_get_rotation_degrees #-}

-- | The layer's rotation in degrees.
bindCanvasLayer_get_rotation_degrees :: MethodBind
bindCanvasLayer_get_rotation_degrees
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's rotation in degrees.
get_rotation_degrees ::
                       (CanvasLayer :< cls, Object :< cls) => cls -> IO Float
get_rotation_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_get_scale #-}

-- | The layer's scale.
bindCanvasLayer_get_scale :: MethodBind
bindCanvasLayer_get_scale
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's scale.
get_scale ::
            (CanvasLayer :< cls, Object :< cls) => cls -> IO Vector2
get_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_get_transform #-}

-- | The layer's transform.
bindCanvasLayer_get_transform :: MethodBind
bindCanvasLayer_get_transform
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's transform.
get_transform ::
                (CanvasLayer :< cls, Object :< cls) => cls -> IO Transform2d
get_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_get_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_is_following_viewport #-}

bindCanvasLayer_is_following_viewport :: MethodBind
bindCanvasLayer_is_following_viewport
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "is_following_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_following_viewport ::
                        (CanvasLayer :< cls, Object :< cls) => cls -> IO Bool
is_following_viewport cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_is_following_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_custom_viewport #-}

-- | The custom [Viewport] node assigned to the [code]CanvasLayer[/code]. If null, uses the default viewport instead.
bindCanvasLayer_set_custom_viewport :: MethodBind
bindCanvasLayer_set_custom_viewport
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_custom_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The custom [Viewport] node assigned to the [code]CanvasLayer[/code]. If null, uses the default viewport instead.
set_custom_viewport ::
                      (CanvasLayer :< cls, Object :< cls) => cls -> Node -> IO ()
set_custom_viewport cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_custom_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_follow_viewport #-}

bindCanvasLayer_set_follow_viewport :: MethodBind
bindCanvasLayer_set_follow_viewport
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_follow_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_follow_viewport ::
                      (CanvasLayer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_follow_viewport cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_follow_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_follow_viewport_scale #-}

bindCanvasLayer_set_follow_viewport_scale :: MethodBind
bindCanvasLayer_set_follow_viewport_scale
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_follow_viewport_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_follow_viewport_scale ::
                            (CanvasLayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_follow_viewport_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_follow_viewport_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_layer #-}

-- | Layer index for draw order. Lower values are drawn first. Default value: [code]1[/code].
bindCanvasLayer_set_layer :: MethodBind
bindCanvasLayer_set_layer
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Layer index for draw order. Lower values are drawn first. Default value: [code]1[/code].
set_layer ::
            (CanvasLayer :< cls, Object :< cls) => cls -> Int -> IO ()
set_layer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_layer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_offset #-}

-- | The layer's base offset.
bindCanvasLayer_set_offset :: MethodBind
bindCanvasLayer_set_offset
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's base offset.
set_offset ::
             (CanvasLayer :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_rotation #-}

-- | The layer's rotation in radians.
bindCanvasLayer_set_rotation :: MethodBind
bindCanvasLayer_set_rotation
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_rotation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's rotation in radians.
set_rotation ::
               (CanvasLayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_rotation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_rotation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_rotation_degrees #-}

-- | The layer's rotation in degrees.
bindCanvasLayer_set_rotation_degrees :: MethodBind
bindCanvasLayer_set_rotation_degrees
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_rotation_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's rotation in degrees.
set_rotation_degrees ::
                       (CanvasLayer :< cls, Object :< cls) => cls -> Float -> IO ()
set_rotation_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_rotation_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_scale #-}

-- | The layer's scale.
bindCanvasLayer_set_scale :: MethodBind
bindCanvasLayer_set_scale
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's scale.
set_scale ::
            (CanvasLayer :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCanvasLayer_set_transform #-}

-- | The layer's transform.
bindCanvasLayer_set_transform :: MethodBind
bindCanvasLayer_set_transform
  = unsafePerformIO $
      withCString "CanvasLayer" $
        \ clsNamePtr ->
          withCString "set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer's transform.
set_transform ::
                (CanvasLayer :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasLayer_set_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)