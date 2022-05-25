{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TextureProgress
       (Godot.Core.TextureProgress._FILL_TOP_TO_BOTTOM,
        Godot.Core.TextureProgress._FILL_BOTTOM_TO_TOP,
        Godot.Core.TextureProgress._FILL_RIGHT_TO_LEFT,
        Godot.Core.TextureProgress._FILL_BILINEAR_LEFT_AND_RIGHT,
        Godot.Core.TextureProgress._FILL_COUNTER_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_BILINEAR_TOP_AND_BOTTOM,
        Godot.Core.TextureProgress._FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE,
        Godot.Core.TextureProgress._FILL_LEFT_TO_RIGHT,
        Godot.Core.TextureProgress.get_fill_degrees,
        Godot.Core.TextureProgress.get_fill_mode,
        Godot.Core.TextureProgress.get_nine_patch_stretch,
        Godot.Core.TextureProgress.get_over_texture,
        Godot.Core.TextureProgress.get_progress_texture,
        Godot.Core.TextureProgress.get_radial_center_offset,
        Godot.Core.TextureProgress.get_radial_initial_angle,
        Godot.Core.TextureProgress.get_stretch_margin,
        Godot.Core.TextureProgress.get_tint_over,
        Godot.Core.TextureProgress.get_tint_progress,
        Godot.Core.TextureProgress.get_tint_under,
        Godot.Core.TextureProgress.get_under_texture,
        Godot.Core.TextureProgress.set_fill_degrees,
        Godot.Core.TextureProgress.set_fill_mode,
        Godot.Core.TextureProgress.set_nine_patch_stretch,
        Godot.Core.TextureProgress.set_over_texture,
        Godot.Core.TextureProgress.set_progress_texture,
        Godot.Core.TextureProgress.set_radial_center_offset,
        Godot.Core.TextureProgress.set_radial_initial_angle,
        Godot.Core.TextureProgress.set_stretch_margin,
        Godot.Core.TextureProgress.set_tint_over,
        Godot.Core.TextureProgress.set_tint_progress,
        Godot.Core.TextureProgress.set_tint_under,
        Godot.Core.TextureProgress.set_under_texture)
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
import Godot.Core.Range()

_FILL_TOP_TO_BOTTOM :: Int
_FILL_TOP_TO_BOTTOM = 2

_FILL_BOTTOM_TO_TOP :: Int
_FILL_BOTTOM_TO_TOP = 3

_FILL_RIGHT_TO_LEFT :: Int
_FILL_RIGHT_TO_LEFT = 1

_FILL_BILINEAR_LEFT_AND_RIGHT :: Int
_FILL_BILINEAR_LEFT_AND_RIGHT = 6

_FILL_COUNTER_CLOCKWISE :: Int
_FILL_COUNTER_CLOCKWISE = 5

_FILL_CLOCKWISE :: Int
_FILL_CLOCKWISE = 4

_FILL_BILINEAR_TOP_AND_BOTTOM :: Int
_FILL_BILINEAR_TOP_AND_BOTTOM = 7

_FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE :: Int
_FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE = 8

_FILL_LEFT_TO_RIGHT :: Int
_FILL_LEFT_TO_RIGHT = 0

instance NodeProperty TextureProgress "fill_mode" Int 'False where
        nodeProperty
          = (get_fill_mode, wrapDroppingSetter set_fill_mode, Nothing)

instance NodeProperty TextureProgress "nine_patch_stretch" Bool
           'False
         where
        nodeProperty
          = (get_nine_patch_stretch,
             wrapDroppingSetter set_nine_patch_stretch, Nothing)

instance NodeProperty TextureProgress "radial_center_offset"
           Vector2
           'False
         where
        nodeProperty
          = (get_radial_center_offset,
             wrapDroppingSetter set_radial_center_offset, Nothing)

instance NodeProperty TextureProgress "radial_fill_degrees" Float
           'False
         where
        nodeProperty
          = (get_fill_degrees, wrapDroppingSetter set_fill_degrees, Nothing)

instance NodeProperty TextureProgress "radial_initial_angle" Float
           'False
         where
        nodeProperty
          = (get_radial_initial_angle,
             wrapDroppingSetter set_radial_initial_angle, Nothing)

instance NodeProperty TextureProgress "stretch_margin_bottom" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_stretch_margin,
             wrapIndexedSetter 3 set_stretch_margin, Nothing)

instance NodeProperty TextureProgress "stretch_margin_left" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_stretch_margin,
             wrapIndexedSetter 0 set_stretch_margin, Nothing)

instance NodeProperty TextureProgress "stretch_margin_right" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_stretch_margin,
             wrapIndexedSetter 2 set_stretch_margin, Nothing)

instance NodeProperty TextureProgress "stretch_margin_top" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_stretch_margin,
             wrapIndexedSetter 1 set_stretch_margin, Nothing)

instance NodeProperty TextureProgress "texture_over" Texture 'False
         where
        nodeProperty
          = (get_over_texture, wrapDroppingSetter set_over_texture, Nothing)

instance NodeProperty TextureProgress "texture_progress" Texture
           'False
         where
        nodeProperty
          = (get_progress_texture, wrapDroppingSetter set_progress_texture,
             Nothing)

instance NodeProperty TextureProgress "texture_under" Texture
           'False
         where
        nodeProperty
          = (get_under_texture, wrapDroppingSetter set_under_texture,
             Nothing)

instance NodeProperty TextureProgress "tint_over" Color 'False
         where
        nodeProperty
          = (get_tint_over, wrapDroppingSetter set_tint_over, Nothing)

instance NodeProperty TextureProgress "tint_progress" Color 'False
         where
        nodeProperty
          = (get_tint_progress, wrapDroppingSetter set_tint_progress,
             Nothing)

instance NodeProperty TextureProgress "tint_under" Color 'False
         where
        nodeProperty
          = (get_tint_under, wrapDroppingSetter set_tint_under, Nothing)

{-# NOINLINE bindTextureProgress_get_fill_degrees #-}

-- | Upper limit for the fill of @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@. When the node's @value@ is equal to its @max_value@, the texture fills up to this angle.
--   			See @Range.value@, @Range.max_value@.
bindTextureProgress_get_fill_degrees :: MethodBind
bindTextureProgress_get_fill_degrees
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_fill_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Upper limit for the fill of @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@. When the node's @value@ is equal to its @max_value@, the texture fills up to this angle.
--   			See @Range.value@, @Range.max_value@.
get_fill_degrees ::
                   (TextureProgress :< cls, Object :< cls) => cls -> IO Float
get_fill_degrees cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_fill_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_fill_degrees" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.TextureProgress.get_fill_degrees

{-# NOINLINE bindTextureProgress_get_fill_mode #-}

-- | The fill direction. See @enum FillMode@ for possible values.
bindTextureProgress_get_fill_mode :: MethodBind
bindTextureProgress_get_fill_mode
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_fill_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fill direction. See @enum FillMode@ for possible values.
get_fill_mode ::
                (TextureProgress :< cls, Object :< cls) => cls -> IO Int
get_fill_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_fill_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_fill_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.TextureProgress.get_fill_mode

{-# NOINLINE bindTextureProgress_get_nine_patch_stretch #-}

-- | If @true@, Godot treats the bar's textures like in @NinePatchRect@. Use the @stretch_margin_*@ properties like @stretch_margin_bottom@ to set up the nine patch's 3×3 grid. When using a radial @fill_mode@, this setting will enable stretching.
bindTextureProgress_get_nine_patch_stretch :: MethodBind
bindTextureProgress_get_nine_patch_stretch
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_nine_patch_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, Godot treats the bar's textures like in @NinePatchRect@. Use the @stretch_margin_*@ properties like @stretch_margin_bottom@ to set up the nine patch's 3×3 grid. When using a radial @fill_mode@, this setting will enable stretching.
get_nine_patch_stretch ::
                         (TextureProgress :< cls, Object :< cls) => cls -> IO Bool
get_nine_patch_stretch cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_nine_patch_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_nine_patch_stretch" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.TextureProgress.get_nine_patch_stretch

{-# NOINLINE bindTextureProgress_get_over_texture #-}

-- | @Texture@ that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of @texture_progress@.
bindTextureProgress_get_over_texture :: MethodBind
bindTextureProgress_get_over_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_over_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of @texture_progress@.
get_over_texture ::
                   (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_over_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_over_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_over_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureProgress.get_over_texture

{-# NOINLINE bindTextureProgress_get_progress_texture #-}

-- | @Texture@ that clips based on the node's @value@ and @fill_mode@. As @value@ increased, the texture fills up. It shows entirely when @value@ reaches @max_value@. It doesn't show at all if @value@ is equal to @min_value@.
--   			The @value@ property comes from @Range@. See @Range.value@, @Range.min_value@, @Range.max_value@.
bindTextureProgress_get_progress_texture :: MethodBind
bindTextureProgress_get_progress_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_progress_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ that clips based on the node's @value@ and @fill_mode@. As @value@ increased, the texture fills up. It shows entirely when @value@ reaches @max_value@. It doesn't show at all if @value@ is equal to @min_value@.
--   			The @value@ property comes from @Range@. See @Range.value@, @Range.min_value@, @Range.max_value@.
get_progress_texture ::
                       (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_progress_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_progress_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_progress_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureProgress.get_progress_texture

{-# NOINLINE bindTextureProgress_get_radial_center_offset #-}

-- | Offsets @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@.
bindTextureProgress_get_radial_center_offset :: MethodBind
bindTextureProgress_get_radial_center_offset
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_radial_center_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Offsets @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@.
get_radial_center_offset ::
                           (TextureProgress :< cls, Object :< cls) => cls -> IO Vector2
get_radial_center_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_radial_center_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_radial_center_offset" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.TextureProgress.get_radial_center_offset

{-# NOINLINE bindTextureProgress_get_radial_initial_angle #-}

-- | Starting angle for the fill of @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@. When the node's @value@ is equal to its @min_value@, the texture doesn't show up at all. When the @value@ increases, the texture fills and tends towards @radial_fill_degrees@.
bindTextureProgress_get_radial_initial_angle :: MethodBind
bindTextureProgress_get_radial_initial_angle
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_radial_initial_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starting angle for the fill of @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@. When the node's @value@ is equal to its @min_value@, the texture doesn't show up at all. When the @value@ increases, the texture fills and tends towards @radial_fill_degrees@.
get_radial_initial_angle ::
                           (TextureProgress :< cls, Object :< cls) => cls -> IO Float
get_radial_initial_angle cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_radial_initial_angle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_radial_initial_angle" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.TextureProgress.get_radial_initial_angle

{-# NOINLINE bindTextureProgress_get_stretch_margin #-}

-- | The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
bindTextureProgress_get_stretch_margin :: MethodBind
bindTextureProgress_get_stretch_margin
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_stretch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
get_stretch_margin ::
                     (TextureProgress :< cls, Object :< cls) => cls -> Int -> IO Int
get_stretch_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_stretch_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_stretch_margin" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.TextureProgress.get_stretch_margin

{-# NOINLINE bindTextureProgress_get_tint_over #-}

-- | Multiplies the color of the bar's @texture_over@ texture. The effect is similar to @CanvasItem.modulate@, except it only affects this specific texture instead of the entire node.
bindTextureProgress_get_tint_over :: MethodBind
bindTextureProgress_get_tint_over
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_over" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's @texture_over@ texture. The effect is similar to @CanvasItem.modulate@, except it only affects this specific texture instead of the entire node.
get_tint_over ::
                (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_over cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_over
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_tint_over" '[] (IO Color)
         where
        nodeMethod = Godot.Core.TextureProgress.get_tint_over

{-# NOINLINE bindTextureProgress_get_tint_progress #-}

-- | Multiplies the color of the bar's @texture_progress@ texture.
bindTextureProgress_get_tint_progress :: MethodBind
bindTextureProgress_get_tint_progress
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_progress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's @texture_progress@ texture.
get_tint_progress ::
                    (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_progress cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_progress
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_tint_progress" '[]
           (IO Color)
         where
        nodeMethod = Godot.Core.TextureProgress.get_tint_progress

{-# NOINLINE bindTextureProgress_get_tint_under #-}

-- | Multiplies the color of the bar's @texture_under@ texture.
bindTextureProgress_get_tint_under :: MethodBind
bindTextureProgress_get_tint_under
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_tint_under" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's @texture_under@ texture.
get_tint_under ::
                 (TextureProgress :< cls, Object :< cls) => cls -> IO Color
get_tint_under cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_tint_under
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_tint_under" '[] (IO Color)
         where
        nodeMethod = Godot.Core.TextureProgress.get_tint_under

{-# NOINLINE bindTextureProgress_get_under_texture #-}

-- | @Texture@ that draws under the progress bar. The bar's background.
bindTextureProgress_get_under_texture :: MethodBind
bindTextureProgress_get_under_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "get_under_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ that draws under the progress bar. The bar's background.
get_under_texture ::
                    (TextureProgress :< cls, Object :< cls) => cls -> IO Texture
get_under_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_get_under_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "get_under_texture" '[]
           (IO Texture)
         where
        nodeMethod = Godot.Core.TextureProgress.get_under_texture

{-# NOINLINE bindTextureProgress_set_fill_degrees #-}

-- | Upper limit for the fill of @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@. When the node's @value@ is equal to its @max_value@, the texture fills up to this angle.
--   			See @Range.value@, @Range.max_value@.
bindTextureProgress_set_fill_degrees :: MethodBind
bindTextureProgress_set_fill_degrees
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_fill_degrees" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Upper limit for the fill of @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@. When the node's @value@ is equal to its @max_value@, the texture fills up to this angle.
--   			See @Range.value@, @Range.max_value@.
set_fill_degrees ::
                   (TextureProgress :< cls, Object :< cls) => cls -> Float -> IO ()
set_fill_degrees cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_fill_degrees
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_fill_degrees" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_fill_degrees

{-# NOINLINE bindTextureProgress_set_fill_mode #-}

-- | The fill direction. See @enum FillMode@ for possible values.
bindTextureProgress_set_fill_mode :: MethodBind
bindTextureProgress_set_fill_mode
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_fill_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fill direction. See @enum FillMode@ for possible values.
set_fill_mode ::
                (TextureProgress :< cls, Object :< cls) => cls -> Int -> IO ()
set_fill_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_fill_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_fill_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_fill_mode

{-# NOINLINE bindTextureProgress_set_nine_patch_stretch #-}

-- | If @true@, Godot treats the bar's textures like in @NinePatchRect@. Use the @stretch_margin_*@ properties like @stretch_margin_bottom@ to set up the nine patch's 3×3 grid. When using a radial @fill_mode@, this setting will enable stretching.
bindTextureProgress_set_nine_patch_stretch :: MethodBind
bindTextureProgress_set_nine_patch_stretch
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_nine_patch_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, Godot treats the bar's textures like in @NinePatchRect@. Use the @stretch_margin_*@ properties like @stretch_margin_bottom@ to set up the nine patch's 3×3 grid. When using a radial @fill_mode@, this setting will enable stretching.
set_nine_patch_stretch ::
                         (TextureProgress :< cls, Object :< cls) => cls -> Bool -> IO ()
set_nine_patch_stretch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_nine_patch_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_nine_patch_stretch"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_nine_patch_stretch

{-# NOINLINE bindTextureProgress_set_over_texture #-}

-- | @Texture@ that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of @texture_progress@.
bindTextureProgress_set_over_texture :: MethodBind
bindTextureProgress_set_over_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_over_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ that draws over the progress bar. Use it to add highlights or an upper-frame that hides part of @texture_progress@.
set_over_texture ::
                   (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_over_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_over_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_over_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_over_texture

{-# NOINLINE bindTextureProgress_set_progress_texture #-}

-- | @Texture@ that clips based on the node's @value@ and @fill_mode@. As @value@ increased, the texture fills up. It shows entirely when @value@ reaches @max_value@. It doesn't show at all if @value@ is equal to @min_value@.
--   			The @value@ property comes from @Range@. See @Range.value@, @Range.min_value@, @Range.max_value@.
bindTextureProgress_set_progress_texture :: MethodBind
bindTextureProgress_set_progress_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_progress_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ that clips based on the node's @value@ and @fill_mode@. As @value@ increased, the texture fills up. It shows entirely when @value@ reaches @max_value@. It doesn't show at all if @value@ is equal to @min_value@.
--   			The @value@ property comes from @Range@. See @Range.value@, @Range.min_value@, @Range.max_value@.
set_progress_texture ::
                       (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_progress_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_progress_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_progress_texture"
           '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_progress_texture

{-# NOINLINE bindTextureProgress_set_radial_center_offset #-}

-- | Offsets @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@.
bindTextureProgress_set_radial_center_offset :: MethodBind
bindTextureProgress_set_radial_center_offset
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_radial_center_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Offsets @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@.
set_radial_center_offset ::
                           (TextureProgress :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_radial_center_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_radial_center_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_radial_center_offset"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_radial_center_offset

{-# NOINLINE bindTextureProgress_set_radial_initial_angle #-}

-- | Starting angle for the fill of @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@. When the node's @value@ is equal to its @min_value@, the texture doesn't show up at all. When the @value@ increases, the texture fills and tends towards @radial_fill_degrees@.
bindTextureProgress_set_radial_initial_angle :: MethodBind
bindTextureProgress_set_radial_initial_angle
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_radial_initial_angle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Starting angle for the fill of @texture_progress@ if @fill_mode@ is @FILL_CLOCKWISE@ or @FILL_COUNTER_CLOCKWISE@. When the node's @value@ is equal to its @min_value@, the texture doesn't show up at all. When the @value@ increases, the texture fills and tends towards @radial_fill_degrees@.
set_radial_initial_angle ::
                           (TextureProgress :< cls, Object :< cls) => cls -> Float -> IO ()
set_radial_initial_angle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_radial_initial_angle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_radial_initial_angle"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_radial_initial_angle

{-# NOINLINE bindTextureProgress_set_stretch_margin #-}

-- | The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
bindTextureProgress_set_stretch_margin :: MethodBind
bindTextureProgress_set_stretch_margin
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_stretch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The height of the 9-patch's bottom row. A margin of 16 means the 9-slice's bottom corners and side will have a height of 16 pixels. You can set all 4 margin values individually to create panels with non-uniform borders.
set_stretch_margin ::
                     (TextureProgress :< cls, Object :< cls) =>
                     cls -> Int -> Int -> IO ()
set_stretch_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_stretch_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_stretch_margin"
           '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_stretch_margin

{-# NOINLINE bindTextureProgress_set_tint_over #-}

-- | Multiplies the color of the bar's @texture_over@ texture. The effect is similar to @CanvasItem.modulate@, except it only affects this specific texture instead of the entire node.
bindTextureProgress_set_tint_over :: MethodBind
bindTextureProgress_set_tint_over
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_over" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's @texture_over@ texture. The effect is similar to @CanvasItem.modulate@, except it only affects this specific texture instead of the entire node.
set_tint_over ::
                (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_over cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_over
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_tint_over" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_tint_over

{-# NOINLINE bindTextureProgress_set_tint_progress #-}

-- | Multiplies the color of the bar's @texture_progress@ texture.
bindTextureProgress_set_tint_progress :: MethodBind
bindTextureProgress_set_tint_progress
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_progress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's @texture_progress@ texture.
set_tint_progress ::
                    (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_progress cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_progress
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_tint_progress" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_tint_progress

{-# NOINLINE bindTextureProgress_set_tint_under #-}

-- | Multiplies the color of the bar's @texture_under@ texture.
bindTextureProgress_set_tint_under :: MethodBind
bindTextureProgress_set_tint_under
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_tint_under" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the color of the bar's @texture_under@ texture.
set_tint_under ::
                 (TextureProgress :< cls, Object :< cls) => cls -> Color -> IO ()
set_tint_under cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_tint_under
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_tint_under" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_tint_under

{-# NOINLINE bindTextureProgress_set_under_texture #-}

-- | @Texture@ that draws under the progress bar. The bar's background.
bindTextureProgress_set_under_texture :: MethodBind
bindTextureProgress_set_under_texture
  = unsafePerformIO $
      withCString "TextureProgress" $
        \ clsNamePtr ->
          withCString "set_under_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ that draws under the progress bar. The bar's background.
set_under_texture ::
                    (TextureProgress :< cls, Object :< cls) => cls -> Texture -> IO ()
set_under_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureProgress_set_under_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureProgress "set_under_texture" '[Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureProgress.set_under_texture