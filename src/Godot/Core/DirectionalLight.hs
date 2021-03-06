{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.DirectionalLight
       (Godot.Core.DirectionalLight._SHADOW_ORTHOGONAL,
        Godot.Core.DirectionalLight._SHADOW_PARALLEL_4_SPLITS,
        Godot.Core.DirectionalLight._SHADOW_DEPTH_RANGE_STABLE,
        Godot.Core.DirectionalLight._SHADOW_DEPTH_RANGE_OPTIMIZED,
        Godot.Core.DirectionalLight._SHADOW_PARALLEL_2_SPLITS,
        Godot.Core.DirectionalLight.get_param,
        Godot.Core.DirectionalLight.set_param,
        Godot.Core.DirectionalLight.get_shadow_depth_range,
        Godot.Core.DirectionalLight.get_shadow_mode,
        Godot.Core.DirectionalLight.is_blend_splits_enabled,
        Godot.Core.DirectionalLight.set_blend_splits,
        Godot.Core.DirectionalLight.set_shadow_depth_range,
        Godot.Core.DirectionalLight.set_shadow_mode)
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
import Godot.Core.Light()

_SHADOW_ORTHOGONAL :: Int
_SHADOW_ORTHOGONAL = 0

_SHADOW_PARALLEL_4_SPLITS :: Int
_SHADOW_PARALLEL_4_SPLITS = 2

_SHADOW_DEPTH_RANGE_STABLE :: Int
_SHADOW_DEPTH_RANGE_STABLE = 0

_SHADOW_DEPTH_RANGE_OPTIMIZED :: Int
_SHADOW_DEPTH_RANGE_OPTIMIZED = 1

_SHADOW_PARALLEL_2_SPLITS :: Int
_SHADOW_PARALLEL_2_SPLITS = 1

{-# NOINLINE bindDirectionalLight_get_param #-}

-- | Amount of extra bias for shadow splits that are far away. If self-shadowing occurs only on the splits far away, increasing this value can fix them.
bindDirectionalLight_get_param :: MethodBind
bindDirectionalLight_get_param
  = unsafePerformIO $
      withCString "DirectionalLight" $
        \ clsNamePtr ->
          withCString "get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of extra bias for shadow splits that are far away. If self-shadowing occurs only on the splits far away, increasing this value can fix them.
get_param ::
            (DirectionalLight :< cls, Object :< cls) => cls -> Int -> IO Float
get_param cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectionalLight_get_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DirectionalLight "get_param" '[Int] (IO Float)
         where
        nodeMethod = Godot.Core.DirectionalLight.get_param

{-# NOINLINE bindDirectionalLight_set_param #-}

-- | Amount of extra bias for shadow splits that are far away. If self-shadowing occurs only on the splits far away, increasing this value can fix them.
bindDirectionalLight_set_param :: MethodBind
bindDirectionalLight_set_param
  = unsafePerformIO $
      withCString "DirectionalLight" $
        \ clsNamePtr ->
          withCString "set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Amount of extra bias for shadow splits that are far away. If self-shadowing occurs only on the splits far away, increasing this value can fix them.
set_param ::
            (DirectionalLight :< cls, Object :< cls) =>
            cls -> Int -> Float -> IO ()
set_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectionalLight_set_param (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DirectionalLight "set_param" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.DirectionalLight.set_param

instance NodeProperty DirectionalLight
           "directional_shadow_bias_split_scale"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_param, wrapIndexedSetter 14 set_param,
             Nothing)

instance NodeProperty DirectionalLight
           "directional_shadow_blend_splits"
           Bool
           'False
         where
        nodeProperty
          = (is_blend_splits_enabled, wrapDroppingSetter set_blend_splits,
             Nothing)

instance NodeProperty DirectionalLight
           "directional_shadow_depth_range"
           Int
           'False
         where
        nodeProperty
          = (get_shadow_depth_range,
             wrapDroppingSetter set_shadow_depth_range, Nothing)

instance NodeProperty DirectionalLight
           "directional_shadow_max_distance"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_param, wrapIndexedSetter 8 set_param,
             Nothing)

instance NodeProperty DirectionalLight "directional_shadow_mode"
           Int
           'False
         where
        nodeProperty
          = (get_shadow_mode, wrapDroppingSetter set_shadow_mode, Nothing)

instance NodeProperty DirectionalLight
           "directional_shadow_normal_bias"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_param, wrapIndexedSetter 12 set_param,
             Nothing)

instance NodeProperty DirectionalLight "directional_shadow_split_1"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_param, wrapIndexedSetter 9 set_param,
             Nothing)

instance NodeProperty DirectionalLight "directional_shadow_split_2"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_param, wrapIndexedSetter 10 set_param,
             Nothing)

instance NodeProperty DirectionalLight "directional_shadow_split_3"
           Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_param, wrapIndexedSetter 11 set_param,
             Nothing)

{-# NOINLINE bindDirectionalLight_get_shadow_depth_range #-}

-- | Optimizes shadow rendering for detail versus movement. See @enum ShadowDepthRange@.
bindDirectionalLight_get_shadow_depth_range :: MethodBind
bindDirectionalLight_get_shadow_depth_range
  = unsafePerformIO $
      withCString "DirectionalLight" $
        \ clsNamePtr ->
          withCString "get_shadow_depth_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Optimizes shadow rendering for detail versus movement. See @enum ShadowDepthRange@.
get_shadow_depth_range ::
                         (DirectionalLight :< cls, Object :< cls) => cls -> IO Int
get_shadow_depth_range cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectionalLight_get_shadow_depth_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DirectionalLight "get_shadow_depth_range" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.DirectionalLight.get_shadow_depth_range

{-# NOINLINE bindDirectionalLight_get_shadow_mode #-}

-- | The light's shadow rendering algorithm. See @enum ShadowMode@.
bindDirectionalLight_get_shadow_mode :: MethodBind
bindDirectionalLight_get_shadow_mode
  = unsafePerformIO $
      withCString "DirectionalLight" $
        \ clsNamePtr ->
          withCString "get_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light's shadow rendering algorithm. See @enum ShadowMode@.
get_shadow_mode ::
                  (DirectionalLight :< cls, Object :< cls) => cls -> IO Int
get_shadow_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectionalLight_get_shadow_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DirectionalLight "get_shadow_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.DirectionalLight.get_shadow_mode

{-# NOINLINE bindDirectionalLight_is_blend_splits_enabled #-}

-- | If @true@, shadow detail is sacrificed in exchange for smoother transitions between splits.
bindDirectionalLight_is_blend_splits_enabled :: MethodBind
bindDirectionalLight_is_blend_splits_enabled
  = unsafePerformIO $
      withCString "DirectionalLight" $
        \ clsNamePtr ->
          withCString "is_blend_splits_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, shadow detail is sacrificed in exchange for smoother transitions between splits.
is_blend_splits_enabled ::
                          (DirectionalLight :< cls, Object :< cls) => cls -> IO Bool
is_blend_splits_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectionalLight_is_blend_splits_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DirectionalLight "is_blend_splits_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.DirectionalLight.is_blend_splits_enabled

{-# NOINLINE bindDirectionalLight_set_blend_splits #-}

-- | If @true@, shadow detail is sacrificed in exchange for smoother transitions between splits.
bindDirectionalLight_set_blend_splits :: MethodBind
bindDirectionalLight_set_blend_splits
  = unsafePerformIO $
      withCString "DirectionalLight" $
        \ clsNamePtr ->
          withCString "set_blend_splits" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, shadow detail is sacrificed in exchange for smoother transitions between splits.
set_blend_splits ::
                   (DirectionalLight :< cls, Object :< cls) => cls -> Bool -> IO ()
set_blend_splits cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectionalLight_set_blend_splits
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DirectionalLight "set_blend_splits" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.DirectionalLight.set_blend_splits

{-# NOINLINE bindDirectionalLight_set_shadow_depth_range #-}

-- | Optimizes shadow rendering for detail versus movement. See @enum ShadowDepthRange@.
bindDirectionalLight_set_shadow_depth_range :: MethodBind
bindDirectionalLight_set_shadow_depth_range
  = unsafePerformIO $
      withCString "DirectionalLight" $
        \ clsNamePtr ->
          withCString "set_shadow_depth_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Optimizes shadow rendering for detail versus movement. See @enum ShadowDepthRange@.
set_shadow_depth_range ::
                         (DirectionalLight :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_depth_range cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectionalLight_set_shadow_depth_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DirectionalLight "set_shadow_depth_range"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.DirectionalLight.set_shadow_depth_range

{-# NOINLINE bindDirectionalLight_set_shadow_mode #-}

-- | The light's shadow rendering algorithm. See @enum ShadowMode@.
bindDirectionalLight_set_shadow_mode :: MethodBind
bindDirectionalLight_set_shadow_mode
  = unsafePerformIO $
      withCString "DirectionalLight" $
        \ clsNamePtr ->
          withCString "set_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light's shadow rendering algorithm. See @enum ShadowMode@.
set_shadow_mode ::
                  (DirectionalLight :< cls, Object :< cls) => cls -> Int -> IO ()
set_shadow_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDirectionalLight_set_shadow_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DirectionalLight "set_shadow_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.DirectionalLight.set_shadow_mode