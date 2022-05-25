{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GeometryInstance
       (Godot.Core.GeometryInstance._SHADOW_CASTING_SETTING_DOUBLE_SIDED,
        Godot.Core.GeometryInstance._FLAG_MAX,
        Godot.Core.GeometryInstance._SHADOW_CASTING_SETTING_OFF,
        Godot.Core.GeometryInstance._FLAG_USE_BAKED_LIGHT,
        Godot.Core.GeometryInstance._SHADOW_CASTING_SETTING_ON,
        Godot.Core.GeometryInstance._FLAG_DRAW_NEXT_FRAME_IF_VISIBLE,
        Godot.Core.GeometryInstance._SHADOW_CASTING_SETTING_SHADOWS_ONLY,
        Godot.Core.GeometryInstance.get_cast_shadows_setting,
        Godot.Core.GeometryInstance.get_extra_cull_margin,
        Godot.Core.GeometryInstance.get_flag,
        Godot.Core.GeometryInstance.get_lod_max_distance,
        Godot.Core.GeometryInstance.get_lod_max_hysteresis,
        Godot.Core.GeometryInstance.get_lod_min_distance,
        Godot.Core.GeometryInstance.get_lod_min_hysteresis,
        Godot.Core.GeometryInstance.get_material_override,
        Godot.Core.GeometryInstance.set_cast_shadows_setting,
        Godot.Core.GeometryInstance.set_custom_aabb,
        Godot.Core.GeometryInstance.set_extra_cull_margin,
        Godot.Core.GeometryInstance.set_flag,
        Godot.Core.GeometryInstance.set_lod_max_distance,
        Godot.Core.GeometryInstance.set_lod_max_hysteresis,
        Godot.Core.GeometryInstance.set_lod_min_distance,
        Godot.Core.GeometryInstance.set_lod_min_hysteresis,
        Godot.Core.GeometryInstance.set_material_override)
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
import Godot.Core.VisualInstance()

_SHADOW_CASTING_SETTING_DOUBLE_SIDED :: Int
_SHADOW_CASTING_SETTING_DOUBLE_SIDED = 2

_FLAG_MAX :: Int
_FLAG_MAX = 2

_SHADOW_CASTING_SETTING_OFF :: Int
_SHADOW_CASTING_SETTING_OFF = 0

_FLAG_USE_BAKED_LIGHT :: Int
_FLAG_USE_BAKED_LIGHT = 0

_SHADOW_CASTING_SETTING_ON :: Int
_SHADOW_CASTING_SETTING_ON = 1

_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE :: Int
_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE = 1

_SHADOW_CASTING_SETTING_SHADOWS_ONLY :: Int
_SHADOW_CASTING_SETTING_SHADOWS_ONLY = 3

instance NodeProperty GeometryInstance "cast_shadow" Int 'False
         where
        nodeProperty
          = (get_cast_shadows_setting,
             wrapDroppingSetter set_cast_shadows_setting, Nothing)

instance NodeProperty GeometryInstance "extra_cull_margin" Float
           'False
         where
        nodeProperty
          = (get_extra_cull_margin, wrapDroppingSetter set_extra_cull_margin,
             Nothing)

instance NodeProperty GeometryInstance "lod_max_distance" Float
           'False
         where
        nodeProperty
          = (get_lod_max_distance, wrapDroppingSetter set_lod_max_distance,
             Nothing)

instance NodeProperty GeometryInstance "lod_max_hysteresis" Float
           'False
         where
        nodeProperty
          = (get_lod_max_hysteresis,
             wrapDroppingSetter set_lod_max_hysteresis, Nothing)

instance NodeProperty GeometryInstance "lod_min_distance" Float
           'False
         where
        nodeProperty
          = (get_lod_min_distance, wrapDroppingSetter set_lod_min_distance,
             Nothing)

instance NodeProperty GeometryInstance "lod_min_hysteresis" Float
           'False
         where
        nodeProperty
          = (get_lod_min_hysteresis,
             wrapDroppingSetter set_lod_min_hysteresis, Nothing)

instance NodeProperty GeometryInstance "material_override" Material
           'False
         where
        nodeProperty
          = (get_material_override, wrapDroppingSetter set_material_override,
             Nothing)

instance NodeProperty GeometryInstance "use_in_baked_light" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_flag, wrapIndexedSetter 0 set_flag,
             Nothing)

{-# NOINLINE bindGeometryInstance_get_cast_shadows_setting #-}

-- | The selected shadow casting flag. See @enum ShadowCastingSetting@ for possible values.
bindGeometryInstance_get_cast_shadows_setting :: MethodBind
bindGeometryInstance_get_cast_shadows_setting
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_cast_shadows_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The selected shadow casting flag. See @enum ShadowCastingSetting@ for possible values.
get_cast_shadows_setting ::
                           (GeometryInstance :< cls, Object :< cls) => cls -> IO Int
get_cast_shadows_setting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometryInstance_get_cast_shadows_setting
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "get_cast_shadows_setting" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.GeometryInstance.get_cast_shadows_setting

{-# NOINLINE bindGeometryInstance_get_extra_cull_margin #-}

-- | The extra distance added to the GeometryInstance's bounding box (@AABB@) to increase its cull box.
bindGeometryInstance_get_extra_cull_margin :: MethodBind
bindGeometryInstance_get_extra_cull_margin
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_extra_cull_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The extra distance added to the GeometryInstance's bounding box (@AABB@) to increase its cull box.
get_extra_cull_margin ::
                        (GeometryInstance :< cls, Object :< cls) => cls -> IO Float
get_extra_cull_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_get_extra_cull_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "get_extra_cull_margin" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.GeometryInstance.get_extra_cull_margin

{-# NOINLINE bindGeometryInstance_get_flag #-}

-- | Returns the @enum GeometryInstance.Flags@ that have been set for this object.
bindGeometryInstance_get_flag :: MethodBind
bindGeometryInstance_get_flag
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @enum GeometryInstance.Flags@ that have been set for this object.
get_flag ::
           (GeometryInstance :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_get_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "get_flag" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.GeometryInstance.get_flag

{-# NOINLINE bindGeometryInstance_get_lod_max_distance #-}

-- | The GeometryInstance's max LOD distance.
--   			__Note:__ This property currently has no effect.
bindGeometryInstance_get_lod_max_distance :: MethodBind
bindGeometryInstance_get_lod_max_distance
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_lod_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's max LOD distance.
--   			__Note:__ This property currently has no effect.
get_lod_max_distance ::
                       (GeometryInstance :< cls, Object :< cls) => cls -> IO Float
get_lod_max_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_get_lod_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "get_lod_max_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.GeometryInstance.get_lod_max_distance

{-# NOINLINE bindGeometryInstance_get_lod_max_hysteresis #-}

-- | The GeometryInstance's max LOD margin.
--   			__Note:__ This property currently has no effect.
bindGeometryInstance_get_lod_max_hysteresis :: MethodBind
bindGeometryInstance_get_lod_max_hysteresis
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_lod_max_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's max LOD margin.
--   			__Note:__ This property currently has no effect.
get_lod_max_hysteresis ::
                         (GeometryInstance :< cls, Object :< cls) => cls -> IO Float
get_lod_max_hysteresis cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_get_lod_max_hysteresis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "get_lod_max_hysteresis" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.GeometryInstance.get_lod_max_hysteresis

{-# NOINLINE bindGeometryInstance_get_lod_min_distance #-}

-- | The GeometryInstance's min LOD distance.
--   			__Note:__ This property currently has no effect.
bindGeometryInstance_get_lod_min_distance :: MethodBind
bindGeometryInstance_get_lod_min_distance
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_lod_min_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's min LOD distance.
--   			__Note:__ This property currently has no effect.
get_lod_min_distance ::
                       (GeometryInstance :< cls, Object :< cls) => cls -> IO Float
get_lod_min_distance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_get_lod_min_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "get_lod_min_distance" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.GeometryInstance.get_lod_min_distance

{-# NOINLINE bindGeometryInstance_get_lod_min_hysteresis #-}

-- | The GeometryInstance's min LOD margin.
--   			__Note:__ This property currently has no effect.
bindGeometryInstance_get_lod_min_hysteresis :: MethodBind
bindGeometryInstance_get_lod_min_hysteresis
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_lod_min_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's min LOD margin.
--   			__Note:__ This property currently has no effect.
get_lod_min_hysteresis ::
                         (GeometryInstance :< cls, Object :< cls) => cls -> IO Float
get_lod_min_hysteresis cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_get_lod_min_hysteresis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "get_lod_min_hysteresis" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.GeometryInstance.get_lod_min_hysteresis

{-# NOINLINE bindGeometryInstance_get_material_override #-}

-- | The material override for the whole geometry.
--   			If a material is assigned to this property, it will be used instead of any material set in any material slot of the mesh.
bindGeometryInstance_get_material_override :: MethodBind
bindGeometryInstance_get_material_override
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material override for the whole geometry.
--   			If a material is assigned to this property, it will be used instead of any material set in any material slot of the mesh.
get_material_override ::
                        (GeometryInstance :< cls, Object :< cls) => cls -> IO Material
get_material_override cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_get_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "get_material_override" '[]
           (IO Material)
         where
        nodeMethod = Godot.Core.GeometryInstance.get_material_override

{-# NOINLINE bindGeometryInstance_set_cast_shadows_setting #-}

-- | The selected shadow casting flag. See @enum ShadowCastingSetting@ for possible values.
bindGeometryInstance_set_cast_shadows_setting :: MethodBind
bindGeometryInstance_set_cast_shadows_setting
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_cast_shadows_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The selected shadow casting flag. See @enum ShadowCastingSetting@ for possible values.
set_cast_shadows_setting ::
                           (GeometryInstance :< cls, Object :< cls) => cls -> Int -> IO ()
set_cast_shadows_setting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindGeometryInstance_set_cast_shadows_setting
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_cast_shadows_setting"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_cast_shadows_setting

{-# NOINLINE bindGeometryInstance_set_custom_aabb #-}

-- | Overrides the bounding box of this node with a custom one. To remove it, set an @AABB@ with all fields set to zero.
bindGeometryInstance_set_custom_aabb :: MethodBind
bindGeometryInstance_set_custom_aabb
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the bounding box of this node with a custom one. To remove it, set an @AABB@ with all fields set to zero.
set_custom_aabb ::
                  (GeometryInstance :< cls, Object :< cls) => cls -> Aabb -> IO ()
set_custom_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_set_custom_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_custom_aabb" '[Aabb]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_custom_aabb

{-# NOINLINE bindGeometryInstance_set_extra_cull_margin #-}

-- | The extra distance added to the GeometryInstance's bounding box (@AABB@) to increase its cull box.
bindGeometryInstance_set_extra_cull_margin :: MethodBind
bindGeometryInstance_set_extra_cull_margin
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_extra_cull_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The extra distance added to the GeometryInstance's bounding box (@AABB@) to increase its cull box.
set_extra_cull_margin ::
                        (GeometryInstance :< cls, Object :< cls) => cls -> Float -> IO ()
set_extra_cull_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_set_extra_cull_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_extra_cull_margin"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_extra_cull_margin

{-# NOINLINE bindGeometryInstance_set_flag #-}

-- | Sets the @enum GeometryInstance.Flags@ specified. See @enum GeometryInstance.Flags@ for options.
bindGeometryInstance_set_flag :: MethodBind
bindGeometryInstance_set_flag
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @enum GeometryInstance.Flags@ specified. See @enum GeometryInstance.Flags@ for options.
set_flag ::
           (GeometryInstance :< cls, Object :< cls) =>
           cls -> Int -> Bool -> IO ()
set_flag cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_set_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_flag" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_flag

{-# NOINLINE bindGeometryInstance_set_lod_max_distance #-}

-- | The GeometryInstance's max LOD distance.
--   			__Note:__ This property currently has no effect.
bindGeometryInstance_set_lod_max_distance :: MethodBind
bindGeometryInstance_set_lod_max_distance
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_lod_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's max LOD distance.
--   			__Note:__ This property currently has no effect.
set_lod_max_distance ::
                       (GeometryInstance :< cls, Object :< cls) => cls -> Float -> IO ()
set_lod_max_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_set_lod_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_lod_max_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_lod_max_distance

{-# NOINLINE bindGeometryInstance_set_lod_max_hysteresis #-}

-- | The GeometryInstance's max LOD margin.
--   			__Note:__ This property currently has no effect.
bindGeometryInstance_set_lod_max_hysteresis :: MethodBind
bindGeometryInstance_set_lod_max_hysteresis
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_lod_max_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's max LOD margin.
--   			__Note:__ This property currently has no effect.
set_lod_max_hysteresis ::
                         (GeometryInstance :< cls, Object :< cls) => cls -> Float -> IO ()
set_lod_max_hysteresis cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_set_lod_max_hysteresis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_lod_max_hysteresis"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_lod_max_hysteresis

{-# NOINLINE bindGeometryInstance_set_lod_min_distance #-}

-- | The GeometryInstance's min LOD distance.
--   			__Note:__ This property currently has no effect.
bindGeometryInstance_set_lod_min_distance :: MethodBind
bindGeometryInstance_set_lod_min_distance
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_lod_min_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's min LOD distance.
--   			__Note:__ This property currently has no effect.
set_lod_min_distance ::
                       (GeometryInstance :< cls, Object :< cls) => cls -> Float -> IO ()
set_lod_min_distance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_set_lod_min_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_lod_min_distance"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_lod_min_distance

{-# NOINLINE bindGeometryInstance_set_lod_min_hysteresis #-}

-- | The GeometryInstance's min LOD margin.
--   			__Note:__ This property currently has no effect.
bindGeometryInstance_set_lod_min_hysteresis :: MethodBind
bindGeometryInstance_set_lod_min_hysteresis
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_lod_min_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's min LOD margin.
--   			__Note:__ This property currently has no effect.
set_lod_min_hysteresis ::
                         (GeometryInstance :< cls, Object :< cls) => cls -> Float -> IO ()
set_lod_min_hysteresis cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_set_lod_min_hysteresis
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_lod_min_hysteresis"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_lod_min_hysteresis

{-# NOINLINE bindGeometryInstance_set_material_override #-}

-- | The material override for the whole geometry.
--   			If a material is assigned to this property, it will be used instead of any material set in any material slot of the mesh.
bindGeometryInstance_set_material_override :: MethodBind
bindGeometryInstance_set_material_override
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The material override for the whole geometry.
--   			If a material is assigned to this property, it will be used instead of any material set in any material slot of the mesh.
set_material_override ::
                        (GeometryInstance :< cls, Object :< cls) =>
                        cls -> Material -> IO ()
set_material_override cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_set_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GeometryInstance "set_material_override"
           '[Material]
           (IO ())
         where
        nodeMethod = Godot.Core.GeometryInstance.set_material_override