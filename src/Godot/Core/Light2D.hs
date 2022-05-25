{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Light2D
       (Godot.Core.Light2D._SHADOW_FILTER_NONE,
        Godot.Core.Light2D._SHADOW_FILTER_PCF5,
        Godot.Core.Light2D._MODE_SUB,
        Godot.Core.Light2D._SHADOW_FILTER_PCF9,
        Godot.Core.Light2D._SHADOW_FILTER_PCF7,
        Godot.Core.Light2D._MODE_MASK, Godot.Core.Light2D._MODE_ADD,
        Godot.Core.Light2D._SHADOW_FILTER_PCF3,
        Godot.Core.Light2D._SHADOW_FILTER_PCF13,
        Godot.Core.Light2D._MODE_MIX, Godot.Core.Light2D.get_color,
        Godot.Core.Light2D.get_energy, Godot.Core.Light2D.get_height,
        Godot.Core.Light2D.get_item_cull_mask,
        Godot.Core.Light2D.get_item_shadow_cull_mask,
        Godot.Core.Light2D.get_layer_range_max,
        Godot.Core.Light2D.get_layer_range_min,
        Godot.Core.Light2D.get_mode,
        Godot.Core.Light2D.get_shadow_buffer_size,
        Godot.Core.Light2D.get_shadow_color,
        Godot.Core.Light2D.get_shadow_filter,
        Godot.Core.Light2D.get_shadow_gradient_length,
        Godot.Core.Light2D.get_shadow_smooth,
        Godot.Core.Light2D.get_texture,
        Godot.Core.Light2D.get_texture_offset,
        Godot.Core.Light2D.get_texture_scale,
        Godot.Core.Light2D.get_z_range_max,
        Godot.Core.Light2D.get_z_range_min,
        Godot.Core.Light2D.is_editor_only, Godot.Core.Light2D.is_enabled,
        Godot.Core.Light2D.is_shadow_enabled, Godot.Core.Light2D.set_color,
        Godot.Core.Light2D.set_editor_only, Godot.Core.Light2D.set_enabled,
        Godot.Core.Light2D.set_energy, Godot.Core.Light2D.set_height,
        Godot.Core.Light2D.set_item_cull_mask,
        Godot.Core.Light2D.set_item_shadow_cull_mask,
        Godot.Core.Light2D.set_layer_range_max,
        Godot.Core.Light2D.set_layer_range_min,
        Godot.Core.Light2D.set_mode,
        Godot.Core.Light2D.set_shadow_buffer_size,
        Godot.Core.Light2D.set_shadow_color,
        Godot.Core.Light2D.set_shadow_enabled,
        Godot.Core.Light2D.set_shadow_filter,
        Godot.Core.Light2D.set_shadow_gradient_length,
        Godot.Core.Light2D.set_shadow_smooth,
        Godot.Core.Light2D.set_texture,
        Godot.Core.Light2D.set_texture_offset,
        Godot.Core.Light2D.set_texture_scale,
        Godot.Core.Light2D.set_z_range_max,
        Godot.Core.Light2D.set_z_range_min)
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

_SHADOW_FILTER_NONE :: Int
_SHADOW_FILTER_NONE = 0

_SHADOW_FILTER_PCF5 :: Int
_SHADOW_FILTER_PCF5 = 2

_MODE_SUB :: Int
_MODE_SUB = 1

_SHADOW_FILTER_PCF9 :: Int
_SHADOW_FILTER_PCF9 = 4

_SHADOW_FILTER_PCF7 :: Int
_SHADOW_FILTER_PCF7 = 3

_MODE_MASK :: Int
_MODE_MASK = 3

_MODE_ADD :: Int
_MODE_ADD = 0

_SHADOW_FILTER_PCF3 :: Int
_SHADOW_FILTER_PCF3 = 1

_SHADOW_FILTER_PCF13 :: Int
_SHADOW_FILTER_PCF13 = 5

_MODE_MIX :: Int
_MODE_MIX = 2

instance NodeProperty Light2D "color" Color 'False where
        nodeProperty = (get_color, wrapDroppingSetter set_color, Nothing)

instance NodeProperty Light2D "editor_only" Bool 'False where
        nodeProperty
          = (is_editor_only, wrapDroppingSetter set_editor_only, Nothing)

instance NodeProperty Light2D "enabled" Bool 'False where
        nodeProperty
          = (is_enabled, wrapDroppingSetter set_enabled, Nothing)

instance NodeProperty Light2D "energy" Float 'False where
        nodeProperty = (get_energy, wrapDroppingSetter set_energy, Nothing)

instance NodeProperty Light2D "mode" Int 'False where
        nodeProperty = (get_mode, wrapDroppingSetter set_mode, Nothing)

instance NodeProperty Light2D "offset" Vector2 'False where
        nodeProperty
          = (get_texture_offset, wrapDroppingSetter set_texture_offset,
             Nothing)

instance NodeProperty Light2D "range_height" Float 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty Light2D "range_item_cull_mask" Int 'False
         where
        nodeProperty
          = (get_item_cull_mask, wrapDroppingSetter set_item_cull_mask,
             Nothing)

instance NodeProperty Light2D "range_layer_max" Int 'False where
        nodeProperty
          = (get_layer_range_max, wrapDroppingSetter set_layer_range_max,
             Nothing)

instance NodeProperty Light2D "range_layer_min" Int 'False where
        nodeProperty
          = (get_layer_range_min, wrapDroppingSetter set_layer_range_min,
             Nothing)

instance NodeProperty Light2D "range_z_max" Int 'False where
        nodeProperty
          = (get_z_range_max, wrapDroppingSetter set_z_range_max, Nothing)

instance NodeProperty Light2D "range_z_min" Int 'False where
        nodeProperty
          = (get_z_range_min, wrapDroppingSetter set_z_range_min, Nothing)

instance NodeProperty Light2D "shadow_buffer_size" Int 'False where
        nodeProperty
          = (get_shadow_buffer_size,
             wrapDroppingSetter set_shadow_buffer_size, Nothing)

instance NodeProperty Light2D "shadow_color" Color 'False where
        nodeProperty
          = (get_shadow_color, wrapDroppingSetter set_shadow_color, Nothing)

instance NodeProperty Light2D "shadow_enabled" Bool 'False where
        nodeProperty
          = (is_shadow_enabled, wrapDroppingSetter set_shadow_enabled,
             Nothing)

instance NodeProperty Light2D "shadow_filter" Int 'False where
        nodeProperty
          = (get_shadow_filter, wrapDroppingSetter set_shadow_filter,
             Nothing)

instance NodeProperty Light2D "shadow_filter_smooth" Float 'False
         where
        nodeProperty
          = (get_shadow_smooth, wrapDroppingSetter set_shadow_smooth,
             Nothing)

instance NodeProperty Light2D "shadow_gradient_length" Float 'False
         where
        nodeProperty
          = (get_shadow_gradient_length,
             wrapDroppingSetter set_shadow_gradient_length, Nothing)

instance NodeProperty Light2D "shadow_item_cull_mask" Int 'False
         where
        nodeProperty
          = (get_item_shadow_cull_mask,
             wrapDroppingSetter set_item_shadow_cull_mask, Nothing)

instance NodeProperty Light2D "texture" Texture 'False where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

instance NodeProperty Light2D "texture_scale" Float 'False where
        nodeProperty
          = (get_texture_scale, wrapDroppingSetter set_texture_scale,
             Nothing)

{-# NOINLINE bindLight2D_get_color #-}

-- | The Light2D's @Color@.
bindLight2D_get_color :: MethodBind
bindLight2D_get_color
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Light2D's @Color@.
get_color :: (Light2D :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_color" '[] (IO Color) where
        nodeMethod = Godot.Core.Light2D.get_color

{-# NOINLINE bindLight2D_get_energy #-}

-- | The Light2D's energy value. The larger the value, the stronger the light.
bindLight2D_get_energy :: MethodBind
bindLight2D_get_energy
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Light2D's energy value. The larger the value, the stronger the light.
get_energy :: (Light2D :< cls, Object :< cls) => cls -> IO Float
get_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_energy (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_energy" '[] (IO Float) where
        nodeMethod = Godot.Core.Light2D.get_energy

{-# NOINLINE bindLight2D_get_height #-}

-- | The height of the Light2D. Used with 2D normal mapping.
bindLight2D_get_height :: MethodBind
bindLight2D_get_height
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The height of the Light2D. Used with 2D normal mapping.
get_height :: (Light2D :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_height (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_height" '[] (IO Float) where
        nodeMethod = Godot.Core.Light2D.get_height

{-# NOINLINE bindLight2D_get_item_cull_mask #-}

-- | The layer mask. Only objects with a matching mask will be affected by the Light2D.
bindLight2D_get_item_cull_mask :: MethodBind
bindLight2D_get_item_cull_mask
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_item_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer mask. Only objects with a matching mask will be affected by the Light2D.
get_item_cull_mask ::
                     (Light2D :< cls, Object :< cls) => cls -> IO Int
get_item_cull_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_item_cull_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_item_cull_mask" '[] (IO Int) where
        nodeMethod = Godot.Core.Light2D.get_item_cull_mask

{-# NOINLINE bindLight2D_get_item_shadow_cull_mask #-}

-- | The shadow mask. Used with @LightOccluder2D@ to cast shadows. Only occluders with a matching light mask will cast shadows.
bindLight2D_get_item_shadow_cull_mask :: MethodBind
bindLight2D_get_item_shadow_cull_mask
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_item_shadow_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow mask. Used with @LightOccluder2D@ to cast shadows. Only occluders with a matching light mask will cast shadows.
get_item_shadow_cull_mask ::
                            (Light2D :< cls, Object :< cls) => cls -> IO Int
get_item_shadow_cull_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_item_shadow_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_item_shadow_cull_mask" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Light2D.get_item_shadow_cull_mask

{-# NOINLINE bindLight2D_get_layer_range_max #-}

-- | Maximum layer value of objects that are affected by the Light2D.
bindLight2D_get_layer_range_max :: MethodBind
bindLight2D_get_layer_range_max
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_layer_range_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum layer value of objects that are affected by the Light2D.
get_layer_range_max ::
                      (Light2D :< cls, Object :< cls) => cls -> IO Int
get_layer_range_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_layer_range_max (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_layer_range_max" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Light2D.get_layer_range_max

{-# NOINLINE bindLight2D_get_layer_range_min #-}

-- | Minimum layer value of objects that are affected by the Light2D.
bindLight2D_get_layer_range_min :: MethodBind
bindLight2D_get_layer_range_min
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_layer_range_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum layer value of objects that are affected by the Light2D.
get_layer_range_min ::
                      (Light2D :< cls, Object :< cls) => cls -> IO Int
get_layer_range_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_layer_range_min (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_layer_range_min" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Light2D.get_layer_range_min

{-# NOINLINE bindLight2D_get_mode #-}

-- | The Light2D's mode. See @enum Mode@ constants for values.
bindLight2D_get_mode :: MethodBind
bindLight2D_get_mode
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Light2D's mode. See @enum Mode@ constants for values.
get_mode :: (Light2D :< cls, Object :< cls) => cls -> IO Int
get_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_mode" '[] (IO Int) where
        nodeMethod = Godot.Core.Light2D.get_mode

{-# NOINLINE bindLight2D_get_shadow_buffer_size #-}

-- | Shadow buffer size.
bindLight2D_get_shadow_buffer_size :: MethodBind
bindLight2D_get_shadow_buffer_size
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_shadow_buffer_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shadow buffer size.
get_shadow_buffer_size ::
                         (Light2D :< cls, Object :< cls) => cls -> IO Int
get_shadow_buffer_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_shadow_buffer_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_shadow_buffer_size" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Light2D.get_shadow_buffer_size

{-# NOINLINE bindLight2D_get_shadow_color #-}

-- | @Color@ of shadows cast by the Light2D.
bindLight2D_get_shadow_color :: MethodBind
bindLight2D_get_shadow_color
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Color@ of shadows cast by the Light2D.
get_shadow_color ::
                   (Light2D :< cls, Object :< cls) => cls -> IO Color
get_shadow_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_shadow_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_shadow_color" '[] (IO Color) where
        nodeMethod = Godot.Core.Light2D.get_shadow_color

{-# NOINLINE bindLight2D_get_shadow_filter #-}

-- | Shadow filter type. See @enum ShadowFilter@ for possible values.
bindLight2D_get_shadow_filter :: MethodBind
bindLight2D_get_shadow_filter
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_shadow_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shadow filter type. See @enum ShadowFilter@ for possible values.
get_shadow_filter ::
                    (Light2D :< cls, Object :< cls) => cls -> IO Int
get_shadow_filter cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_shadow_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_shadow_filter" '[] (IO Int) where
        nodeMethod = Godot.Core.Light2D.get_shadow_filter

{-# NOINLINE bindLight2D_get_shadow_gradient_length #-}

-- | Smooth shadow gradient length.
bindLight2D_get_shadow_gradient_length :: MethodBind
bindLight2D_get_shadow_gradient_length
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_shadow_gradient_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Smooth shadow gradient length.
get_shadow_gradient_length ::
                             (Light2D :< cls, Object :< cls) => cls -> IO Float
get_shadow_gradient_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_shadow_gradient_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_shadow_gradient_length" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Light2D.get_shadow_gradient_length

{-# NOINLINE bindLight2D_get_shadow_smooth #-}

-- | Smoothing value for shadows.
bindLight2D_get_shadow_smooth :: MethodBind
bindLight2D_get_shadow_smooth
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_shadow_smooth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Smoothing value for shadows.
get_shadow_smooth ::
                    (Light2D :< cls, Object :< cls) => cls -> IO Float
get_shadow_smooth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_shadow_smooth (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_shadow_smooth" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Light2D.get_shadow_smooth

{-# NOINLINE bindLight2D_get_texture #-}

-- | @Texture@ used for the Light2D's appearance.
bindLight2D_get_texture :: MethodBind
bindLight2D_get_texture
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ used for the Light2D's appearance.
get_texture :: (Light2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_texture" '[] (IO Texture) where
        nodeMethod = Godot.Core.Light2D.get_texture

{-# NOINLINE bindLight2D_get_texture_offset #-}

-- | The offset of the Light2D's @texture@.
bindLight2D_get_texture_offset :: MethodBind
bindLight2D_get_texture_offset
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset of the Light2D's @texture@.
get_texture_offset ::
                     (Light2D :< cls, Object :< cls) => cls -> IO Vector2
get_texture_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_texture_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_texture_offset" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Light2D.get_texture_offset

{-# NOINLINE bindLight2D_get_texture_scale #-}

-- | The @texture@'s scale factor.
bindLight2D_get_texture_scale :: MethodBind
bindLight2D_get_texture_scale
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_texture_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @texture@'s scale factor.
get_texture_scale ::
                    (Light2D :< cls, Object :< cls) => cls -> IO Float
get_texture_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_texture_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_texture_scale" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Light2D.get_texture_scale

{-# NOINLINE bindLight2D_get_z_range_max #-}

-- | Maximum @z@ value of objects that are affected by the Light2D.
bindLight2D_get_z_range_max :: MethodBind
bindLight2D_get_z_range_max
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_z_range_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum @z@ value of objects that are affected by the Light2D.
get_z_range_max :: (Light2D :< cls, Object :< cls) => cls -> IO Int
get_z_range_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_z_range_max (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_z_range_max" '[] (IO Int) where
        nodeMethod = Godot.Core.Light2D.get_z_range_max

{-# NOINLINE bindLight2D_get_z_range_min #-}

-- | Minimum @z@ value of objects that are affected by the Light2D.
bindLight2D_get_z_range_min :: MethodBind
bindLight2D_get_z_range_min
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "get_z_range_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum @z@ value of objects that are affected by the Light2D.
get_z_range_min :: (Light2D :< cls, Object :< cls) => cls -> IO Int
get_z_range_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_get_z_range_min (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "get_z_range_min" '[] (IO Int) where
        nodeMethod = Godot.Core.Light2D.get_z_range_min

{-# NOINLINE bindLight2D_is_editor_only #-}

-- | If @true@, Light2D will only appear when editing the scene.
bindLight2D_is_editor_only :: MethodBind
bindLight2D_is_editor_only
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "is_editor_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, Light2D will only appear when editing the scene.
is_editor_only :: (Light2D :< cls, Object :< cls) => cls -> IO Bool
is_editor_only cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_is_editor_only (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "is_editor_only" '[] (IO Bool) where
        nodeMethod = Godot.Core.Light2D.is_editor_only

{-# NOINLINE bindLight2D_is_enabled #-}

-- | If @true@, Light2D will emit light.
bindLight2D_is_enabled :: MethodBind
bindLight2D_is_enabled
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "is_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, Light2D will emit light.
is_enabled :: (Light2D :< cls, Object :< cls) => cls -> IO Bool
is_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_is_enabled (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "is_enabled" '[] (IO Bool) where
        nodeMethod = Godot.Core.Light2D.is_enabled

{-# NOINLINE bindLight2D_is_shadow_enabled #-}

-- | If @true@, the Light2D will cast shadows.
bindLight2D_is_shadow_enabled :: MethodBind
bindLight2D_is_shadow_enabled
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "is_shadow_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the Light2D will cast shadows.
is_shadow_enabled ::
                    (Light2D :< cls, Object :< cls) => cls -> IO Bool
is_shadow_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_is_shadow_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "is_shadow_enabled" '[] (IO Bool) where
        nodeMethod = Godot.Core.Light2D.is_shadow_enabled

{-# NOINLINE bindLight2D_set_color #-}

-- | The Light2D's @Color@.
bindLight2D_set_color :: MethodBind
bindLight2D_set_color
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Light2D's @Color@.
set_color ::
            (Light2D :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_color (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_color" '[Color] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_color

{-# NOINLINE bindLight2D_set_editor_only #-}

-- | If @true@, Light2D will only appear when editing the scene.
bindLight2D_set_editor_only :: MethodBind
bindLight2D_set_editor_only
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_editor_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, Light2D will only appear when editing the scene.
set_editor_only ::
                  (Light2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editor_only cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_editor_only (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_editor_only" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_editor_only

{-# NOINLINE bindLight2D_set_enabled #-}

-- | If @true@, Light2D will emit light.
bindLight2D_set_enabled :: MethodBind
bindLight2D_set_enabled
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, Light2D will emit light.
set_enabled ::
              (Light2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_enabled (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_enabled" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_enabled

{-# NOINLINE bindLight2D_set_energy #-}

-- | The Light2D's energy value. The larger the value, the stronger the light.
bindLight2D_set_energy :: MethodBind
bindLight2D_set_energy
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Light2D's energy value. The larger the value, the stronger the light.
set_energy ::
             (Light2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_energy (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_energy" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_energy

{-# NOINLINE bindLight2D_set_height #-}

-- | The height of the Light2D. Used with 2D normal mapping.
bindLight2D_set_height :: MethodBind
bindLight2D_set_height
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The height of the Light2D. Used with 2D normal mapping.
set_height ::
             (Light2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_height (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_height" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_height

{-# NOINLINE bindLight2D_set_item_cull_mask #-}

-- | The layer mask. Only objects with a matching mask will be affected by the Light2D.
bindLight2D_set_item_cull_mask :: MethodBind
bindLight2D_set_item_cull_mask
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_item_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer mask. Only objects with a matching mask will be affected by the Light2D.
set_item_cull_mask ::
                     (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_item_cull_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_item_cull_mask (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_item_cull_mask" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_item_cull_mask

{-# NOINLINE bindLight2D_set_item_shadow_cull_mask #-}

-- | The shadow mask. Used with @LightOccluder2D@ to cast shadows. Only occluders with a matching light mask will cast shadows.
bindLight2D_set_item_shadow_cull_mask :: MethodBind
bindLight2D_set_item_shadow_cull_mask
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_item_shadow_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow mask. Used with @LightOccluder2D@ to cast shadows. Only occluders with a matching light mask will cast shadows.
set_item_shadow_cull_mask ::
                            (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_item_shadow_cull_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_item_shadow_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_item_shadow_cull_mask" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_item_shadow_cull_mask

{-# NOINLINE bindLight2D_set_layer_range_max #-}

-- | Maximum layer value of objects that are affected by the Light2D.
bindLight2D_set_layer_range_max :: MethodBind
bindLight2D_set_layer_range_max
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_layer_range_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum layer value of objects that are affected by the Light2D.
set_layer_range_max ::
                      (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_layer_range_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_layer_range_max (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_layer_range_max" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_layer_range_max

{-# NOINLINE bindLight2D_set_layer_range_min #-}

-- | Minimum layer value of objects that are affected by the Light2D.
bindLight2D_set_layer_range_min :: MethodBind
bindLight2D_set_layer_range_min
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_layer_range_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum layer value of objects that are affected by the Light2D.
set_layer_range_min ::
                      (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_layer_range_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_layer_range_min (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_layer_range_min" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_layer_range_min

{-# NOINLINE bindLight2D_set_mode #-}

-- | The Light2D's mode. See @enum Mode@ constants for values.
bindLight2D_set_mode :: MethodBind
bindLight2D_set_mode
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The Light2D's mode. See @enum Mode@ constants for values.
set_mode :: (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_mode (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_mode" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_mode

{-# NOINLINE bindLight2D_set_shadow_buffer_size #-}

-- | Shadow buffer size.
bindLight2D_set_shadow_buffer_size :: MethodBind
bindLight2D_set_shadow_buffer_size
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_shadow_buffer_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shadow buffer size.
set_shadow_buffer_size ::
                         (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_buffer_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_shadow_buffer_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_shadow_buffer_size" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_shadow_buffer_size

{-# NOINLINE bindLight2D_set_shadow_color #-}

-- | @Color@ of shadows cast by the Light2D.
bindLight2D_set_shadow_color :: MethodBind
bindLight2D_set_shadow_color
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Color@ of shadows cast by the Light2D.
set_shadow_color ::
                   (Light2D :< cls, Object :< cls) => cls -> Color -> IO ()
set_shadow_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_shadow_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_shadow_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_shadow_color

{-# NOINLINE bindLight2D_set_shadow_enabled #-}

-- | If @true@, the Light2D will cast shadows.
bindLight2D_set_shadow_enabled :: MethodBind
bindLight2D_set_shadow_enabled
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_shadow_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the Light2D will cast shadows.
set_shadow_enabled ::
                     (Light2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shadow_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_shadow_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_shadow_enabled" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_shadow_enabled

{-# NOINLINE bindLight2D_set_shadow_filter #-}

-- | Shadow filter type. See @enum ShadowFilter@ for possible values.
bindLight2D_set_shadow_filter :: MethodBind
bindLight2D_set_shadow_filter
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_shadow_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shadow filter type. See @enum ShadowFilter@ for possible values.
set_shadow_filter ::
                    (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_filter cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_shadow_filter (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_shadow_filter" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_shadow_filter

{-# NOINLINE bindLight2D_set_shadow_gradient_length #-}

-- | Smooth shadow gradient length.
bindLight2D_set_shadow_gradient_length :: MethodBind
bindLight2D_set_shadow_gradient_length
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_shadow_gradient_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Smooth shadow gradient length.
set_shadow_gradient_length ::
                             (Light2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_shadow_gradient_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_shadow_gradient_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_shadow_gradient_length" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_shadow_gradient_length

{-# NOINLINE bindLight2D_set_shadow_smooth #-}

-- | Smoothing value for shadows.
bindLight2D_set_shadow_smooth :: MethodBind
bindLight2D_set_shadow_smooth
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_shadow_smooth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Smoothing value for shadows.
set_shadow_smooth ::
                    (Light2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_shadow_smooth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_shadow_smooth (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_shadow_smooth" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_shadow_smooth

{-# NOINLINE bindLight2D_set_texture #-}

-- | @Texture@ used for the Light2D's appearance.
bindLight2D_set_texture :: MethodBind
bindLight2D_set_texture
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | @Texture@ used for the Light2D's appearance.
set_texture ::
              (Light2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_texture" '[Texture] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_texture

{-# NOINLINE bindLight2D_set_texture_offset #-}

-- | The offset of the Light2D's @texture@.
bindLight2D_set_texture_offset :: MethodBind
bindLight2D_set_texture_offset
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The offset of the Light2D's @texture@.
set_texture_offset ::
                     (Light2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_texture_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_texture_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_texture_offset" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_texture_offset

{-# NOINLINE bindLight2D_set_texture_scale #-}

-- | The @texture@'s scale factor.
bindLight2D_set_texture_scale :: MethodBind
bindLight2D_set_texture_scale
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_texture_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @texture@'s scale factor.
set_texture_scale ::
                    (Light2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_texture_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_texture_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_texture_scale" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Light2D.set_texture_scale

{-# NOINLINE bindLight2D_set_z_range_max #-}

-- | Maximum @z@ value of objects that are affected by the Light2D.
bindLight2D_set_z_range_max :: MethodBind
bindLight2D_set_z_range_max
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_z_range_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum @z@ value of objects that are affected by the Light2D.
set_z_range_max ::
                  (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_z_range_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_z_range_max (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_z_range_max" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_z_range_max

{-# NOINLINE bindLight2D_set_z_range_min #-}

-- | Minimum @z@ value of objects that are affected by the Light2D.
bindLight2D_set_z_range_min :: MethodBind
bindLight2D_set_z_range_min
  = unsafePerformIO $
      withCString "Light2D" $
        \ clsNamePtr ->
          withCString "set_z_range_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum @z@ value of objects that are affected by the Light2D.
set_z_range_min ::
                  (Light2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_z_range_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight2D_set_z_range_min (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Light2D "set_z_range_min" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Light2D.set_z_range_min