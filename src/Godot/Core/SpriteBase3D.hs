{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SpriteBase3D
       (Godot.Core.SpriteBase3D._FLAG_SHADED,
        Godot.Core.SpriteBase3D._ALPHA_CUT_OPAQUE_PREPASS,
        Godot.Core.SpriteBase3D._FLAG_DOUBLE_SIDED,
        Godot.Core.SpriteBase3D._ALPHA_CUT_DISABLED,
        Godot.Core.SpriteBase3D._ALPHA_CUT_DISCARD,
        Godot.Core.SpriteBase3D._FLAG_MAX,
        Godot.Core.SpriteBase3D._FLAG_TRANSPARENT,
        Godot.Core.SpriteBase3D._im_update,
        Godot.Core.SpriteBase3D._queue_update,
        Godot.Core.SpriteBase3D.generate_triangle_mesh,
        Godot.Core.SpriteBase3D.get_alpha_cut_mode,
        Godot.Core.SpriteBase3D.get_axis,
        Godot.Core.SpriteBase3D.get_billboard_mode,
        Godot.Core.SpriteBase3D.get_draw_flag,
        Godot.Core.SpriteBase3D.get_item_rect,
        Godot.Core.SpriteBase3D.get_modulate,
        Godot.Core.SpriteBase3D.get_offset,
        Godot.Core.SpriteBase3D.get_opacity,
        Godot.Core.SpriteBase3D.get_pixel_size,
        Godot.Core.SpriteBase3D.is_centered,
        Godot.Core.SpriteBase3D.is_flipped_h,
        Godot.Core.SpriteBase3D.is_flipped_v,
        Godot.Core.SpriteBase3D.set_alpha_cut_mode,
        Godot.Core.SpriteBase3D.set_axis,
        Godot.Core.SpriteBase3D.set_billboard_mode,
        Godot.Core.SpriteBase3D.set_centered,
        Godot.Core.SpriteBase3D.set_draw_flag,
        Godot.Core.SpriteBase3D.set_flip_h,
        Godot.Core.SpriteBase3D.set_flip_v,
        Godot.Core.SpriteBase3D.set_modulate,
        Godot.Core.SpriteBase3D.set_offset,
        Godot.Core.SpriteBase3D.set_opacity,
        Godot.Core.SpriteBase3D.set_pixel_size)
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
import Godot.Core.GeometryInstance()

_FLAG_SHADED :: Int
_FLAG_SHADED = 1

_ALPHA_CUT_OPAQUE_PREPASS :: Int
_ALPHA_CUT_OPAQUE_PREPASS = 2

_FLAG_DOUBLE_SIDED :: Int
_FLAG_DOUBLE_SIDED = 2

_ALPHA_CUT_DISABLED :: Int
_ALPHA_CUT_DISABLED = 0

_ALPHA_CUT_DISCARD :: Int
_ALPHA_CUT_DISCARD = 1

_FLAG_MAX :: Int
_FLAG_MAX = 3

_FLAG_TRANSPARENT :: Int
_FLAG_TRANSPARENT = 0

instance NodeProperty SpriteBase3D "alpha_cut" Int 'False where
        nodeProperty
          = (get_alpha_cut_mode, wrapDroppingSetter set_alpha_cut_mode,
             Nothing)

instance NodeProperty SpriteBase3D "axis" Int 'False where
        nodeProperty = (get_axis, wrapDroppingSetter set_axis, Nothing)

instance NodeProperty SpriteBase3D "billboard" Int 'False where
        nodeProperty
          = (get_billboard_mode, wrapDroppingSetter set_billboard_mode,
             Nothing)

instance NodeProperty SpriteBase3D "centered" Bool 'False where
        nodeProperty
          = (is_centered, wrapDroppingSetter set_centered, Nothing)

instance NodeProperty SpriteBase3D "double_sided" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 2 get_draw_flag,
             wrapIndexedSetter 2 set_draw_flag, Nothing)

instance NodeProperty SpriteBase3D "flip_h" Bool 'False where
        nodeProperty
          = (is_flipped_h, wrapDroppingSetter set_flip_h, Nothing)

instance NodeProperty SpriteBase3D "flip_v" Bool 'False where
        nodeProperty
          = (is_flipped_v, wrapDroppingSetter set_flip_v, Nothing)

instance NodeProperty SpriteBase3D "modulate" Color 'False where
        nodeProperty
          = (get_modulate, wrapDroppingSetter set_modulate, Nothing)

instance NodeProperty SpriteBase3D "offset" Vector2 'False where
        nodeProperty = (get_offset, wrapDroppingSetter set_offset, Nothing)

instance NodeProperty SpriteBase3D "opacity" Float 'False where
        nodeProperty
          = (get_opacity, wrapDroppingSetter set_opacity, Nothing)

instance NodeProperty SpriteBase3D "pixel_size" Float 'False where
        nodeProperty
          = (get_pixel_size, wrapDroppingSetter set_pixel_size, Nothing)

instance NodeProperty SpriteBase3D "shaded" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 1 get_draw_flag,
             wrapIndexedSetter 1 set_draw_flag, Nothing)

instance NodeProperty SpriteBase3D "transparent" Bool 'False where
        nodeProperty
          = (wrapIndexedGetter 0 get_draw_flag,
             wrapIndexedSetter 0 set_draw_flag, Nothing)

{-# NOINLINE bindSpriteBase3D__im_update #-}

bindSpriteBase3D__im_update :: MethodBind
bindSpriteBase3D__im_update
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "_im_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_im_update :: (SpriteBase3D :< cls, Object :< cls) => cls -> IO ()
_im_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D__im_update (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "_im_update" '[] (IO ()) where
        nodeMethod = Godot.Core.SpriteBase3D._im_update

{-# NOINLINE bindSpriteBase3D__queue_update #-}

bindSpriteBase3D__queue_update :: MethodBind
bindSpriteBase3D__queue_update
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "_queue_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_queue_update ::
                (SpriteBase3D :< cls, Object :< cls) => cls -> IO ()
_queue_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D__queue_update (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "_queue_update" '[] (IO ()) where
        nodeMethod = Godot.Core.SpriteBase3D._queue_update

{-# NOINLINE bindSpriteBase3D_generate_triangle_mesh #-}

bindSpriteBase3D_generate_triangle_mesh :: MethodBind
bindSpriteBase3D_generate_triangle_mesh
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "generate_triangle_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

generate_triangle_mesh ::
                         (SpriteBase3D :< cls, Object :< cls) => cls -> IO TriangleMesh
generate_triangle_mesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_generate_triangle_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "generate_triangle_mesh" '[]
           (IO TriangleMesh)
         where
        nodeMethod = Godot.Core.SpriteBase3D.generate_triangle_mesh

{-# NOINLINE bindSpriteBase3D_get_alpha_cut_mode #-}

bindSpriteBase3D_get_alpha_cut_mode :: MethodBind
bindSpriteBase3D_get_alpha_cut_mode
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_alpha_cut_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_alpha_cut_mode ::
                     (SpriteBase3D :< cls, Object :< cls) => cls -> IO Int
get_alpha_cut_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_alpha_cut_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_alpha_cut_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SpriteBase3D.get_alpha_cut_mode

{-# NOINLINE bindSpriteBase3D_get_axis #-}

-- | The direction in which the front of the texture faces.
bindSpriteBase3D_get_axis :: MethodBind
bindSpriteBase3D_get_axis
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The direction in which the front of the texture faces.
get_axis :: (SpriteBase3D :< cls, Object :< cls) => cls -> IO Int
get_axis cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_axis (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_axis" '[] (IO Int) where
        nodeMethod = Godot.Core.SpriteBase3D.get_axis

{-# NOINLINE bindSpriteBase3D_get_billboard_mode #-}

bindSpriteBase3D_get_billboard_mode :: MethodBind
bindSpriteBase3D_get_billboard_mode
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_billboard_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_billboard_mode ::
                     (SpriteBase3D :< cls, Object :< cls) => cls -> IO Int
get_billboard_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_billboard_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_billboard_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SpriteBase3D.get_billboard_mode

{-# NOINLINE bindSpriteBase3D_get_draw_flag #-}

-- | Returns the value of the specified flag.
bindSpriteBase3D_get_draw_flag :: MethodBind
bindSpriteBase3D_get_draw_flag
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_draw_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the specified flag.
get_draw_flag ::
                (SpriteBase3D :< cls, Object :< cls) => cls -> Int -> IO Bool
get_draw_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_draw_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_draw_flag" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.SpriteBase3D.get_draw_flag

{-# NOINLINE bindSpriteBase3D_get_item_rect #-}

-- | Returns the rectangle representing this sprite.
bindSpriteBase3D_get_item_rect :: MethodBind
bindSpriteBase3D_get_item_rect
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_item_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the rectangle representing this sprite.
get_item_rect ::
                (SpriteBase3D :< cls, Object :< cls) => cls -> IO Rect2
get_item_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_item_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_item_rect" '[] (IO Rect2)
         where
        nodeMethod = Godot.Core.SpriteBase3D.get_item_rect

{-# NOINLINE bindSpriteBase3D_get_modulate #-}

-- | A color value that gets multiplied on, could be used for mood-coloring or to simulate the color of light.
bindSpriteBase3D_get_modulate :: MethodBind
bindSpriteBase3D_get_modulate
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A color value that gets multiplied on, could be used for mood-coloring or to simulate the color of light.
get_modulate ::
               (SpriteBase3D :< cls, Object :< cls) => cls -> IO Color
get_modulate cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_modulate" '[] (IO Color)
         where
        nodeMethod = Godot.Core.SpriteBase3D.get_modulate

{-# NOINLINE bindSpriteBase3D_get_offset #-}

-- | The texture's drawing offset.
bindSpriteBase3D_get_offset :: MethodBind
bindSpriteBase3D_get_offset
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's drawing offset.
get_offset ::
             (SpriteBase3D :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_offset" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.SpriteBase3D.get_offset

{-# NOINLINE bindSpriteBase3D_get_opacity #-}

-- | The objects visibility on a scale from @0@ fully invisible to @1@ fully visible.
bindSpriteBase3D_get_opacity :: MethodBind
bindSpriteBase3D_get_opacity
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_opacity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The objects visibility on a scale from @0@ fully invisible to @1@ fully visible.
get_opacity ::
              (SpriteBase3D :< cls, Object :< cls) => cls -> IO Float
get_opacity cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_opacity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_opacity" '[] (IO Float) where
        nodeMethod = Godot.Core.SpriteBase3D.get_opacity

{-# NOINLINE bindSpriteBase3D_get_pixel_size #-}

-- | The size of one pixel's width on the sprite to scale it in 3D.
bindSpriteBase3D_get_pixel_size :: MethodBind
bindSpriteBase3D_get_pixel_size
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "get_pixel_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of one pixel's width on the sprite to scale it in 3D.
get_pixel_size ::
                 (SpriteBase3D :< cls, Object :< cls) => cls -> IO Float
get_pixel_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_get_pixel_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "get_pixel_size" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SpriteBase3D.get_pixel_size

{-# NOINLINE bindSpriteBase3D_is_centered #-}

-- | If @true@, texture will be centered.
bindSpriteBase3D_is_centered :: MethodBind
bindSpriteBase3D_is_centered
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "is_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture will be centered.
is_centered ::
              (SpriteBase3D :< cls, Object :< cls) => cls -> IO Bool
is_centered cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_is_centered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "is_centered" '[] (IO Bool) where
        nodeMethod = Godot.Core.SpriteBase3D.is_centered

{-# NOINLINE bindSpriteBase3D_is_flipped_h #-}

-- | If @true@, texture is flipped horizontally.
bindSpriteBase3D_is_flipped_h :: MethodBind
bindSpriteBase3D_is_flipped_h
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "is_flipped_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped horizontally.
is_flipped_h ::
               (SpriteBase3D :< cls, Object :< cls) => cls -> IO Bool
is_flipped_h cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_is_flipped_h (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "is_flipped_h" '[] (IO Bool) where
        nodeMethod = Godot.Core.SpriteBase3D.is_flipped_h

{-# NOINLINE bindSpriteBase3D_is_flipped_v #-}

-- | If @true@, texture is flipped vertically.
bindSpriteBase3D_is_flipped_v :: MethodBind
bindSpriteBase3D_is_flipped_v
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "is_flipped_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped vertically.
is_flipped_v ::
               (SpriteBase3D :< cls, Object :< cls) => cls -> IO Bool
is_flipped_v cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_is_flipped_v (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "is_flipped_v" '[] (IO Bool) where
        nodeMethod = Godot.Core.SpriteBase3D.is_flipped_v

{-# NOINLINE bindSpriteBase3D_set_alpha_cut_mode #-}

bindSpriteBase3D_set_alpha_cut_mode :: MethodBind
bindSpriteBase3D_set_alpha_cut_mode
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_alpha_cut_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_alpha_cut_mode ::
                     (SpriteBase3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_alpha_cut_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_alpha_cut_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_alpha_cut_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpriteBase3D.set_alpha_cut_mode

{-# NOINLINE bindSpriteBase3D_set_axis #-}

-- | The direction in which the front of the texture faces.
bindSpriteBase3D_set_axis :: MethodBind
bindSpriteBase3D_set_axis
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_axis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The direction in which the front of the texture faces.
set_axis ::
           (SpriteBase3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_axis cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_axis (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_axis" '[Int] (IO ()) where
        nodeMethod = Godot.Core.SpriteBase3D.set_axis

{-# NOINLINE bindSpriteBase3D_set_billboard_mode #-}

bindSpriteBase3D_set_billboard_mode :: MethodBind
bindSpriteBase3D_set_billboard_mode
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_billboard_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_billboard_mode ::
                     (SpriteBase3D :< cls, Object :< cls) => cls -> Int -> IO ()
set_billboard_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_billboard_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_billboard_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SpriteBase3D.set_billboard_mode

{-# NOINLINE bindSpriteBase3D_set_centered #-}

-- | If @true@, texture will be centered.
bindSpriteBase3D_set_centered :: MethodBind
bindSpriteBase3D_set_centered
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_centered" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture will be centered.
set_centered ::
               (SpriteBase3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_centered cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_centered (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_centered" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.SpriteBase3D.set_centered

{-# NOINLINE bindSpriteBase3D_set_draw_flag #-}

-- | If @true@, the specified flag will be enabled.
bindSpriteBase3D_set_draw_flag :: MethodBind
bindSpriteBase3D_set_draw_flag
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_draw_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the specified flag will be enabled.
set_draw_flag ::
                (SpriteBase3D :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_draw_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_draw_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_draw_flag" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SpriteBase3D.set_draw_flag

{-# NOINLINE bindSpriteBase3D_set_flip_h #-}

-- | If @true@, texture is flipped horizontally.
bindSpriteBase3D_set_flip_h :: MethodBind
bindSpriteBase3D_set_flip_h
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_flip_h" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped horizontally.
set_flip_h ::
             (SpriteBase3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_h cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_flip_h (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_flip_h" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.SpriteBase3D.set_flip_h

{-# NOINLINE bindSpriteBase3D_set_flip_v #-}

-- | If @true@, texture is flipped vertically.
bindSpriteBase3D_set_flip_v :: MethodBind
bindSpriteBase3D_set_flip_v
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_flip_v" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, texture is flipped vertically.
set_flip_v ::
             (SpriteBase3D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_flip_v cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_flip_v (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_flip_v" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.SpriteBase3D.set_flip_v

{-# NOINLINE bindSpriteBase3D_set_modulate #-}

-- | A color value that gets multiplied on, could be used for mood-coloring or to simulate the color of light.
bindSpriteBase3D_set_modulate :: MethodBind
bindSpriteBase3D_set_modulate
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A color value that gets multiplied on, could be used for mood-coloring or to simulate the color of light.
set_modulate ::
               (SpriteBase3D :< cls, Object :< cls) => cls -> Color -> IO ()
set_modulate cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_modulate (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_modulate" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.SpriteBase3D.set_modulate

{-# NOINLINE bindSpriteBase3D_set_offset #-}

-- | The texture's drawing offset.
bindSpriteBase3D_set_offset :: MethodBind
bindSpriteBase3D_set_offset
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture's drawing offset.
set_offset ::
             (SpriteBase3D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_offset" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.SpriteBase3D.set_offset

{-# NOINLINE bindSpriteBase3D_set_opacity #-}

-- | The objects visibility on a scale from @0@ fully invisible to @1@ fully visible.
bindSpriteBase3D_set_opacity :: MethodBind
bindSpriteBase3D_set_opacity
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_opacity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The objects visibility on a scale from @0@ fully invisible to @1@ fully visible.
set_opacity ::
              (SpriteBase3D :< cls, Object :< cls) => cls -> Float -> IO ()
set_opacity cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_opacity (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_opacity" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SpriteBase3D.set_opacity

{-# NOINLINE bindSpriteBase3D_set_pixel_size #-}

-- | The size of one pixel's width on the sprite to scale it in 3D.
bindSpriteBase3D_set_pixel_size :: MethodBind
bindSpriteBase3D_set_pixel_size
  = unsafePerformIO $
      withCString "SpriteBase3D" $
        \ clsNamePtr ->
          withCString "set_pixel_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of one pixel's width on the sprite to scale it in 3D.
set_pixel_size ::
                 (SpriteBase3D :< cls, Object :< cls) => cls -> Float -> IO ()
set_pixel_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSpriteBase3D_set_pixel_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SpriteBase3D "set_pixel_size" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SpriteBase3D.set_pixel_size