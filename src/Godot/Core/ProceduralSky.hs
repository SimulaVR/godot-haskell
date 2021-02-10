{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ProceduralSky
       (Godot.Core.ProceduralSky._TEXTURE_SIZE_512,
        Godot.Core.ProceduralSky._TEXTURE_SIZE_2048,
        Godot.Core.ProceduralSky._TEXTURE_SIZE_1024,
        Godot.Core.ProceduralSky._TEXTURE_SIZE_256,
        Godot.Core.ProceduralSky._TEXTURE_SIZE_MAX,
        Godot.Core.ProceduralSky._TEXTURE_SIZE_4096,
        Godot.Core.ProceduralSky._thread_done,
        Godot.Core.ProceduralSky._update_sky,
        Godot.Core.ProceduralSky.get_ground_bottom_color,
        Godot.Core.ProceduralSky.get_ground_curve,
        Godot.Core.ProceduralSky.get_ground_energy,
        Godot.Core.ProceduralSky.get_ground_horizon_color,
        Godot.Core.ProceduralSky.get_sky_curve,
        Godot.Core.ProceduralSky.get_sky_energy,
        Godot.Core.ProceduralSky.get_sky_horizon_color,
        Godot.Core.ProceduralSky.get_sky_top_color,
        Godot.Core.ProceduralSky.get_sun_angle_max,
        Godot.Core.ProceduralSky.get_sun_angle_min,
        Godot.Core.ProceduralSky.get_sun_color,
        Godot.Core.ProceduralSky.get_sun_curve,
        Godot.Core.ProceduralSky.get_sun_energy,
        Godot.Core.ProceduralSky.get_sun_latitude,
        Godot.Core.ProceduralSky.get_sun_longitude,
        Godot.Core.ProceduralSky.get_texture_size,
        Godot.Core.ProceduralSky.set_ground_bottom_color,
        Godot.Core.ProceduralSky.set_ground_curve,
        Godot.Core.ProceduralSky.set_ground_energy,
        Godot.Core.ProceduralSky.set_ground_horizon_color,
        Godot.Core.ProceduralSky.set_sky_curve,
        Godot.Core.ProceduralSky.set_sky_energy,
        Godot.Core.ProceduralSky.set_sky_horizon_color,
        Godot.Core.ProceduralSky.set_sky_top_color,
        Godot.Core.ProceduralSky.set_sun_angle_max,
        Godot.Core.ProceduralSky.set_sun_angle_min,
        Godot.Core.ProceduralSky.set_sun_color,
        Godot.Core.ProceduralSky.set_sun_curve,
        Godot.Core.ProceduralSky.set_sun_energy,
        Godot.Core.ProceduralSky.set_sun_latitude,
        Godot.Core.ProceduralSky.set_sun_longitude,
        Godot.Core.ProceduralSky.set_texture_size)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_TEXTURE_SIZE_512 :: Int
_TEXTURE_SIZE_512 = 1

_TEXTURE_SIZE_2048 :: Int
_TEXTURE_SIZE_2048 = 3

_TEXTURE_SIZE_1024 :: Int
_TEXTURE_SIZE_1024 = 2

_TEXTURE_SIZE_256 :: Int
_TEXTURE_SIZE_256 = 0

_TEXTURE_SIZE_MAX :: Int
_TEXTURE_SIZE_MAX = 5

_TEXTURE_SIZE_4096 :: Int
_TEXTURE_SIZE_4096 = 4

{-# NOINLINE bindProceduralSky__thread_done #-}

bindProceduralSky__thread_done :: MethodBind
bindProceduralSky__thread_done
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "_thread_done" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_thread_done ::
               (ProceduralSky :< cls, Object :< cls) => cls -> Image -> IO ()
_thread_done cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky__thread_done (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky__update_sky #-}

bindProceduralSky__update_sky :: MethodBind
bindProceduralSky__update_sky
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "_update_sky" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_sky ::
              (ProceduralSky :< cls, Object :< cls) => cls -> IO ()
_update_sky cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky__update_sky (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_ground_bottom_color #-}

-- | Color of the ground at the bottom.
bindProceduralSky_get_ground_bottom_color :: MethodBind
bindProceduralSky_get_ground_bottom_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_ground_bottom_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color of the ground at the bottom.
get_ground_bottom_color ::
                          (ProceduralSky :< cls, Object :< cls) => cls -> IO Color
get_ground_bottom_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_ground_bottom_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_ground_curve #-}

-- | How quickly the [member ground_horizon_color] fades into the [member ground_bottom_color].
bindProceduralSky_get_ground_curve :: MethodBind
bindProceduralSky_get_ground_curve
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_ground_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How quickly the [member ground_horizon_color] fades into the [member ground_bottom_color].
get_ground_curve ::
                   (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_ground_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_ground_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_ground_energy #-}

-- | Amount of energy contribution from the ground.
bindProceduralSky_get_ground_energy :: MethodBind
bindProceduralSky_get_ground_energy
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_ground_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of energy contribution from the ground.
get_ground_energy ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_ground_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_ground_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_ground_horizon_color #-}

-- | Color of the ground at the horizon.
bindProceduralSky_get_ground_horizon_color :: MethodBind
bindProceduralSky_get_ground_horizon_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_ground_horizon_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color of the ground at the horizon.
get_ground_horizon_color ::
                           (ProceduralSky :< cls, Object :< cls) => cls -> IO Color
get_ground_horizon_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_ground_horizon_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sky_curve #-}

-- | How quickly the [member sky_horizon_color] fades into the [member sky_top_color].
bindProceduralSky_get_sky_curve :: MethodBind
bindProceduralSky_get_sky_curve
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sky_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How quickly the [member sky_horizon_color] fades into the [member sky_top_color].
get_sky_curve ::
                (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_sky_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sky_curve (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sky_energy #-}

-- | Amount of energy contribution from the sky.
bindProceduralSky_get_sky_energy :: MethodBind
bindProceduralSky_get_sky_energy
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sky_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of energy contribution from the sky.
get_sky_energy ::
                 (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_sky_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sky_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sky_horizon_color #-}

-- | Color of the sky at the horizon.
bindProceduralSky_get_sky_horizon_color :: MethodBind
bindProceduralSky_get_sky_horizon_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sky_horizon_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color of the sky at the horizon.
get_sky_horizon_color ::
                        (ProceduralSky :< cls, Object :< cls) => cls -> IO Color
get_sky_horizon_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sky_horizon_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sky_top_color #-}

-- | Color of the sky at the top.
bindProceduralSky_get_sky_top_color :: MethodBind
bindProceduralSky_get_sky_top_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sky_top_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color of the sky at the top.
get_sky_top_color ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> IO Color
get_sky_top_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sky_top_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sun_angle_max #-}

-- | Distance from center of sun where it fades out completely.
bindProceduralSky_get_sun_angle_max :: MethodBind
bindProceduralSky_get_sun_angle_max
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sun_angle_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance from center of sun where it fades out completely.
get_sun_angle_max ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_sun_angle_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sun_angle_max
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sun_angle_min #-}

-- | Distance from sun where it goes from solid to starting to fade.
bindProceduralSky_get_sun_angle_min :: MethodBind
bindProceduralSky_get_sun_angle_min
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sun_angle_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance from sun where it goes from solid to starting to fade.
get_sun_angle_min ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_sun_angle_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sun_angle_min
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sun_color #-}

-- | The sun's color.
bindProceduralSky_get_sun_color :: MethodBind
bindProceduralSky_get_sun_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sun_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sun's color.
get_sun_color ::
                (ProceduralSky :< cls, Object :< cls) => cls -> IO Color
get_sun_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sun_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sun_curve #-}

-- | How quickly the sun fades away between [member sun_angle_min] and [member sun_angle_max].
bindProceduralSky_get_sun_curve :: MethodBind
bindProceduralSky_get_sun_curve
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sun_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How quickly the sun fades away between [member sun_angle_min] and [member sun_angle_max].
get_sun_curve ::
                (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_sun_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sun_curve (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sun_energy #-}

-- | Amount of energy contribution from the sun.
bindProceduralSky_get_sun_energy :: MethodBind
bindProceduralSky_get_sun_energy
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sun_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of energy contribution from the sun.
get_sun_energy ::
                 (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_sun_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sun_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sun_latitude #-}

-- | The sun's height using polar coordinates.
bindProceduralSky_get_sun_latitude :: MethodBind
bindProceduralSky_get_sun_latitude
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sun_latitude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sun's height using polar coordinates.
get_sun_latitude ::
                   (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_sun_latitude cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sun_latitude
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_sun_longitude #-}

-- | The direction of the sun using polar coordinates.
bindProceduralSky_get_sun_longitude :: MethodBind
bindProceduralSky_get_sun_longitude
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_sun_longitude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The direction of the sun using polar coordinates.
get_sun_longitude ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> IO Float
get_sun_longitude cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_sun_longitude
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_get_texture_size #-}

-- | Size of [Texture] that the ProceduralSky will generate. The size is set using [enum TextureSize].
bindProceduralSky_get_texture_size :: MethodBind
bindProceduralSky_get_texture_size
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "get_texture_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of [Texture] that the ProceduralSky will generate. The size is set using [enum TextureSize].
get_texture_size ::
                   (ProceduralSky :< cls, Object :< cls) => cls -> IO Int
get_texture_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_get_texture_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_ground_bottom_color #-}

-- | Color of the ground at the bottom.
bindProceduralSky_set_ground_bottom_color :: MethodBind
bindProceduralSky_set_ground_bottom_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_ground_bottom_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color of the ground at the bottom.
set_ground_bottom_color ::
                          (ProceduralSky :< cls, Object :< cls) => cls -> Color -> IO ()
set_ground_bottom_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_ground_bottom_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_ground_curve #-}

-- | How quickly the [member ground_horizon_color] fades into the [member ground_bottom_color].
bindProceduralSky_set_ground_curve :: MethodBind
bindProceduralSky_set_ground_curve
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_ground_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How quickly the [member ground_horizon_color] fades into the [member ground_bottom_color].
set_ground_curve ::
                   (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_ground_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_ground_curve
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_ground_energy #-}

-- | Amount of energy contribution from the ground.
bindProceduralSky_set_ground_energy :: MethodBind
bindProceduralSky_set_ground_energy
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_ground_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of energy contribution from the ground.
set_ground_energy ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_ground_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_ground_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_ground_horizon_color #-}

-- | Color of the ground at the horizon.
bindProceduralSky_set_ground_horizon_color :: MethodBind
bindProceduralSky_set_ground_horizon_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_ground_horizon_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color of the ground at the horizon.
set_ground_horizon_color ::
                           (ProceduralSky :< cls, Object :< cls) => cls -> Color -> IO ()
set_ground_horizon_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_ground_horizon_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sky_curve #-}

-- | How quickly the [member sky_horizon_color] fades into the [member sky_top_color].
bindProceduralSky_set_sky_curve :: MethodBind
bindProceduralSky_set_sky_curve
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sky_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How quickly the [member sky_horizon_color] fades into the [member sky_top_color].
set_sky_curve ::
                (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_sky_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sky_curve (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sky_energy #-}

-- | Amount of energy contribution from the sky.
bindProceduralSky_set_sky_energy :: MethodBind
bindProceduralSky_set_sky_energy
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sky_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of energy contribution from the sky.
set_sky_energy ::
                 (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_sky_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sky_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sky_horizon_color #-}

-- | Color of the sky at the horizon.
bindProceduralSky_set_sky_horizon_color :: MethodBind
bindProceduralSky_set_sky_horizon_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sky_horizon_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color of the sky at the horizon.
set_sky_horizon_color ::
                        (ProceduralSky :< cls, Object :< cls) => cls -> Color -> IO ()
set_sky_horizon_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sky_horizon_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sky_top_color #-}

-- | Color of the sky at the top.
bindProceduralSky_set_sky_top_color :: MethodBind
bindProceduralSky_set_sky_top_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sky_top_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color of the sky at the top.
set_sky_top_color ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> Color -> IO ()
set_sky_top_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sky_top_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sun_angle_max #-}

-- | Distance from center of sun where it fades out completely.
bindProceduralSky_set_sun_angle_max :: MethodBind
bindProceduralSky_set_sun_angle_max
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sun_angle_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance from center of sun where it fades out completely.
set_sun_angle_max ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_sun_angle_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sun_angle_max
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sun_angle_min #-}

-- | Distance from sun where it goes from solid to starting to fade.
bindProceduralSky_set_sun_angle_min :: MethodBind
bindProceduralSky_set_sun_angle_min
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sun_angle_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Distance from sun where it goes from solid to starting to fade.
set_sun_angle_min ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_sun_angle_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sun_angle_min
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sun_color #-}

-- | The sun's color.
bindProceduralSky_set_sun_color :: MethodBind
bindProceduralSky_set_sun_color
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sun_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sun's color.
set_sun_color ::
                (ProceduralSky :< cls, Object :< cls) => cls -> Color -> IO ()
set_sun_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sun_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sun_curve #-}

-- | How quickly the sun fades away between [member sun_angle_min] and [member sun_angle_max].
bindProceduralSky_set_sun_curve :: MethodBind
bindProceduralSky_set_sun_curve
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sun_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How quickly the sun fades away between [member sun_angle_min] and [member sun_angle_max].
set_sun_curve ::
                (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_sun_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sun_curve (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sun_energy #-}

-- | Amount of energy contribution from the sun.
bindProceduralSky_set_sun_energy :: MethodBind
bindProceduralSky_set_sun_energy
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sun_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of energy contribution from the sun.
set_sun_energy ::
                 (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_sun_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sun_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sun_latitude #-}

-- | The sun's height using polar coordinates.
bindProceduralSky_set_sun_latitude :: MethodBind
bindProceduralSky_set_sun_latitude
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sun_latitude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sun's height using polar coordinates.
set_sun_latitude ::
                   (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_sun_latitude cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sun_latitude
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_sun_longitude #-}

-- | The direction of the sun using polar coordinates.
bindProceduralSky_set_sun_longitude :: MethodBind
bindProceduralSky_set_sun_longitude
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_sun_longitude" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The direction of the sun using polar coordinates.
set_sun_longitude ::
                    (ProceduralSky :< cls, Object :< cls) => cls -> Float -> IO ()
set_sun_longitude cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_sun_longitude
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindProceduralSky_set_texture_size #-}

-- | Size of [Texture] that the ProceduralSky will generate. The size is set using [enum TextureSize].
bindProceduralSky_set_texture_size :: MethodBind
bindProceduralSky_set_texture_size
  = unsafePerformIO $
      withCString "ProceduralSky" $
        \ clsNamePtr ->
          withCString "set_texture_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of [Texture] that the ProceduralSky will generate. The size is set using [enum TextureSize].
set_texture_size ::
                   (ProceduralSky :< cls, Object :< cls) => cls -> Int -> IO ()
set_texture_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindProceduralSky_set_texture_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)