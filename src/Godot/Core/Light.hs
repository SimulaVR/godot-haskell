{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Light
       (Godot.Core.Light._PARAM_SHADOW_NORMAL_BIAS,
        Godot.Core.Light._PARAM_SHADOW_SPLIT_2_OFFSET,
        Godot.Core.Light._PARAM_SPECULAR,
        Godot.Core.Light._PARAM_SHADOW_SPLIT_1_OFFSET,
        Godot.Core.Light._PARAM_INDIRECT_ENERGY,
        Godot.Core.Light._PARAM_RANGE,
        Godot.Core.Light._PARAM_SPOT_ATTENUATION,
        Godot.Core.Light._PARAM_SHADOW_MAX_DISTANCE,
        Godot.Core.Light._PARAM_MAX,
        Godot.Core.Light._PARAM_SHADOW_BIAS_SPLIT_SCALE,
        Godot.Core.Light._BAKE_DISABLED,
        Godot.Core.Light._PARAM_ATTENUATION,
        Godot.Core.Light._PARAM_ENERGY,
        Godot.Core.Light._PARAM_SHADOW_SPLIT_3_OFFSET,
        Godot.Core.Light._BAKE_INDIRECT,
        Godot.Core.Light._PARAM_SHADOW_BIAS, Godot.Core.Light._BAKE_ALL,
        Godot.Core.Light._PARAM_CONTACT_SHADOW_SIZE,
        Godot.Core.Light._PARAM_SPOT_ANGLE, Godot.Core.Light.get_bake_mode,
        Godot.Core.Light.get_color, Godot.Core.Light.get_cull_mask,
        Godot.Core.Light.get_param, Godot.Core.Light.get_shadow_color,
        Godot.Core.Light.get_shadow_reverse_cull_face,
        Godot.Core.Light.has_shadow, Godot.Core.Light.is_editor_only,
        Godot.Core.Light.is_negative, Godot.Core.Light.set_bake_mode,
        Godot.Core.Light.set_color, Godot.Core.Light.set_cull_mask,
        Godot.Core.Light.set_editor_only, Godot.Core.Light.set_negative,
        Godot.Core.Light.set_param, Godot.Core.Light.set_shadow,
        Godot.Core.Light.set_shadow_color,
        Godot.Core.Light.set_shadow_reverse_cull_face)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_PARAM_SHADOW_NORMAL_BIAS :: Int
_PARAM_SHADOW_NORMAL_BIAS = 12

_PARAM_SHADOW_SPLIT_2_OFFSET :: Int
_PARAM_SHADOW_SPLIT_2_OFFSET = 10

_PARAM_SPECULAR :: Int
_PARAM_SPECULAR = 2

_PARAM_SHADOW_SPLIT_1_OFFSET :: Int
_PARAM_SHADOW_SPLIT_1_OFFSET = 9

_PARAM_INDIRECT_ENERGY :: Int
_PARAM_INDIRECT_ENERGY = 1

_PARAM_RANGE :: Int
_PARAM_RANGE = 3

_PARAM_SPOT_ATTENUATION :: Int
_PARAM_SPOT_ATTENUATION = 6

_PARAM_SHADOW_MAX_DISTANCE :: Int
_PARAM_SHADOW_MAX_DISTANCE = 8

_PARAM_MAX :: Int
_PARAM_MAX = 15

_PARAM_SHADOW_BIAS_SPLIT_SCALE :: Int
_PARAM_SHADOW_BIAS_SPLIT_SCALE = 14

_BAKE_DISABLED :: Int
_BAKE_DISABLED = 0

_PARAM_ATTENUATION :: Int
_PARAM_ATTENUATION = 4

_PARAM_ENERGY :: Int
_PARAM_ENERGY = 0

_PARAM_SHADOW_SPLIT_3_OFFSET :: Int
_PARAM_SHADOW_SPLIT_3_OFFSET = 11

_BAKE_INDIRECT :: Int
_BAKE_INDIRECT = 1

_PARAM_SHADOW_BIAS :: Int
_PARAM_SHADOW_BIAS = 13

_BAKE_ALL :: Int
_BAKE_ALL = 2

_PARAM_CONTACT_SHADOW_SIZE :: Int
_PARAM_CONTACT_SHADOW_SIZE = 7

_PARAM_SPOT_ANGLE :: Int
_PARAM_SPOT_ANGLE = 5

{-# NOINLINE bindLight_get_bake_mode #-}

-- | The light's bake mode. See [enum BakeMode].
bindLight_get_bake_mode :: MethodBind
bindLight_get_bake_mode
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_bake_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light's bake mode. See [enum BakeMode].
get_bake_mode :: (Light :< cls, Object :< cls) => cls -> IO Int
get_bake_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_bake_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_get_color #-}

-- | The light's color. An [i]overbright[/i] color can be used to achieve a result equivalent to increasing the light's [member light_energy].
bindLight_get_color :: MethodBind
bindLight_get_color
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light's color. An [i]overbright[/i] color can be used to achieve a result equivalent to increasing the light's [member light_energy].
get_color :: (Light :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_color (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_get_cull_mask #-}

-- | The light will affect objects in the selected layers.
bindLight_get_cull_mask :: MethodBind
bindLight_get_cull_mask
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light will affect objects in the selected layers.
get_cull_mask :: (Light :< cls, Object :< cls) => cls -> IO Int
get_cull_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_cull_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_get_param #-}

-- | Returns the value of the specified [enum Light.Param] parameter.
bindLight_get_param :: MethodBind
bindLight_get_param
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the specified [enum Light.Param] parameter.
get_param ::
            (Light :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_param (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_get_shadow_color #-}

-- | The color of shadows cast by this light.
bindLight_get_shadow_color :: MethodBind
bindLight_get_shadow_color
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color of shadows cast by this light.
get_shadow_color ::
                   (Light :< cls, Object :< cls) => cls -> IO Color
get_shadow_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_shadow_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_get_shadow_reverse_cull_face #-}

-- | If [code]true[/code], reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double-sided shadows with [constant GeometryInstance.SHADOW_CASTING_SETTING_DOUBLE_SIDED].
bindLight_get_shadow_reverse_cull_face :: MethodBind
bindLight_get_shadow_reverse_cull_face
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "get_shadow_reverse_cull_face" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double-sided shadows with [constant GeometryInstance.SHADOW_CASTING_SETTING_DOUBLE_SIDED].
get_shadow_reverse_cull_face ::
                               (Light :< cls, Object :< cls) => cls -> IO Bool
get_shadow_reverse_cull_face cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_get_shadow_reverse_cull_face
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_has_shadow #-}

-- | If [code]true[/code], the light will cast shadows.
bindLight_has_shadow :: MethodBind
bindLight_has_shadow
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "has_shadow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the light will cast shadows.
has_shadow :: (Light :< cls, Object :< cls) => cls -> IO Bool
has_shadow cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_has_shadow (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_is_editor_only #-}

-- | If [code]true[/code], the light only appears in the editor and will not be visible at runtime.
bindLight_is_editor_only :: MethodBind
bindLight_is_editor_only
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "is_editor_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the light only appears in the editor and will not be visible at runtime.
is_editor_only :: (Light :< cls, Object :< cls) => cls -> IO Bool
is_editor_only cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_is_editor_only (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_is_negative #-}

-- | If [code]true[/code], the light's effect is reversed, darkening areas and casting bright shadows.
bindLight_is_negative :: MethodBind
bindLight_is_negative
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "is_negative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the light's effect is reversed, darkening areas and casting bright shadows.
is_negative :: (Light :< cls, Object :< cls) => cls -> IO Bool
is_negative cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_is_negative (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_bake_mode #-}

-- | The light's bake mode. See [enum BakeMode].
bindLight_set_bake_mode :: MethodBind
bindLight_set_bake_mode
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_bake_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light's bake mode. See [enum BakeMode].
set_bake_mode ::
                (Light :< cls, Object :< cls) => cls -> Int -> IO ()
set_bake_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_bake_mode (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_color #-}

-- | The light's color. An [i]overbright[/i] color can be used to achieve a result equivalent to increasing the light's [member light_energy].
bindLight_set_color :: MethodBind
bindLight_set_color
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light's color. An [i]overbright[/i] color can be used to achieve a result equivalent to increasing the light's [member light_energy].
set_color :: (Light :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_color (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_cull_mask #-}

-- | The light will affect objects in the selected layers.
bindLight_set_cull_mask :: MethodBind
bindLight_set_cull_mask
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light will affect objects in the selected layers.
set_cull_mask ::
                (Light :< cls, Object :< cls) => cls -> Int -> IO ()
set_cull_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_cull_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_editor_only #-}

-- | If [code]true[/code], the light only appears in the editor and will not be visible at runtime.
bindLight_set_editor_only :: MethodBind
bindLight_set_editor_only
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_editor_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the light only appears in the editor and will not be visible at runtime.
set_editor_only ::
                  (Light :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editor_only cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_editor_only (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_negative #-}

-- | If [code]true[/code], the light's effect is reversed, darkening areas and casting bright shadows.
bindLight_set_negative :: MethodBind
bindLight_set_negative
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_negative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the light's effect is reversed, darkening areas and casting bright shadows.
set_negative ::
               (Light :< cls, Object :< cls) => cls -> Bool -> IO ()
set_negative cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_negative (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_param #-}

-- | Sets the value of the specified [enum Light.Param] parameter.
bindLight_set_param :: MethodBind
bindLight_set_param
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the value of the specified [enum Light.Param] parameter.
set_param ::
            (Light :< cls, Object :< cls) => cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_param (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_shadow #-}

-- | If [code]true[/code], the light will cast shadows.
bindLight_set_shadow :: MethodBind
bindLight_set_shadow
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_shadow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the light will cast shadows.
set_shadow :: (Light :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shadow cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_shadow (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_shadow_color #-}

-- | The color of shadows cast by this light.
bindLight_set_shadow_color :: MethodBind
bindLight_set_shadow_color
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The color of shadows cast by this light.
set_shadow_color ::
                   (Light :< cls, Object :< cls) => cls -> Color -> IO ()
set_shadow_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_shadow_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLight_set_shadow_reverse_cull_face #-}

-- | If [code]true[/code], reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double-sided shadows with [constant GeometryInstance.SHADOW_CASTING_SETTING_DOUBLE_SIDED].
bindLight_set_shadow_reverse_cull_face :: MethodBind
bindLight_set_shadow_reverse_cull_face
  = unsafePerformIO $
      withCString "Light" $
        \ clsNamePtr ->
          withCString "set_shadow_reverse_cull_face" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double-sided shadows with [constant GeometryInstance.SHADOW_CASTING_SETTING_DOUBLE_SIDED].
set_shadow_reverse_cull_face ::
                               (Light :< cls, Object :< cls) => cls -> Bool -> IO ()
set_shadow_reverse_cull_face cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLight_set_shadow_reverse_cull_face
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)