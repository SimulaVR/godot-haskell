{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.GeometryInstance
       (Godot.Core.GeometryInstance._SHADOW_CASTING_SETTING_SHADOWS_ONLY,
        Godot.Core.GeometryInstance._FLAG_USE_BAKED_LIGHT,
        Godot.Core.GeometryInstance._FLAG_MAX,
        Godot.Core.GeometryInstance._SHADOW_CASTING_SETTING_DOUBLE_SIDED,
        Godot.Core.GeometryInstance._SHADOW_CASTING_SETTING_OFF,
        Godot.Core.GeometryInstance._FLAG_DRAW_NEXT_FRAME_IF_VISIBLE,
        Godot.Core.GeometryInstance._SHADOW_CASTING_SETTING_ON,
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_SHADOW_CASTING_SETTING_SHADOWS_ONLY :: Int
_SHADOW_CASTING_SETTING_SHADOWS_ONLY = 3

_FLAG_USE_BAKED_LIGHT :: Int
_FLAG_USE_BAKED_LIGHT = 0

_FLAG_MAX :: Int
_FLAG_MAX = 2

_SHADOW_CASTING_SETTING_DOUBLE_SIDED :: Int
_SHADOW_CASTING_SETTING_DOUBLE_SIDED = 2

_SHADOW_CASTING_SETTING_OFF :: Int
_SHADOW_CASTING_SETTING_OFF = 0

_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE :: Int
_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE = 1

_SHADOW_CASTING_SETTING_ON :: Int
_SHADOW_CASTING_SETTING_ON = 1

{-# NOINLINE bindGeometryInstance_get_cast_shadows_setting #-}

-- | The selected shadow casting flag. See [enum ShadowCastingSetting] for possible values.
bindGeometryInstance_get_cast_shadows_setting :: MethodBind
bindGeometryInstance_get_cast_shadows_setting
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_cast_shadows_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The selected shadow casting flag. See [enum ShadowCastingSetting] for possible values.
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

{-# NOINLINE bindGeometryInstance_get_extra_cull_margin #-}

-- | The extra distance added to the GeometryInstance's bounding box ([AABB]) to increase its cull box.
bindGeometryInstance_get_extra_cull_margin :: MethodBind
bindGeometryInstance_get_extra_cull_margin
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_extra_cull_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The extra distance added to the GeometryInstance's bounding box ([AABB]) to increase its cull box.
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

{-# NOINLINE bindGeometryInstance_get_flag #-}

-- | If [code]true[/code], this GeometryInstance will be used when baking lights using a [GIProbe] or [BakedLightmap].
bindGeometryInstance_get_flag :: MethodBind
bindGeometryInstance_get_flag
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this GeometryInstance will be used when baking lights using a [GIProbe] or [BakedLightmap].
get_flag ::
           (GeometryInstance :< cls, Object :< cls) => cls -> Int -> IO Bool
get_flag cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGeometryInstance_get_flag (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGeometryInstance_get_lod_max_distance #-}

-- | The GeometryInstance's max LOD distance.
--   			[b]Note:[/b] This property currently has no effect.
bindGeometryInstance_get_lod_max_distance :: MethodBind
bindGeometryInstance_get_lod_max_distance
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_lod_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's max LOD distance.
--   			[b]Note:[/b] This property currently has no effect.
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

{-# NOINLINE bindGeometryInstance_get_lod_max_hysteresis #-}

-- | The GeometryInstance's max LOD margin.
--   			[b]Note:[/b] This property currently has no effect.
bindGeometryInstance_get_lod_max_hysteresis :: MethodBind
bindGeometryInstance_get_lod_max_hysteresis
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_lod_max_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's max LOD margin.
--   			[b]Note:[/b] This property currently has no effect.
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

{-# NOINLINE bindGeometryInstance_get_lod_min_distance #-}

-- | The GeometryInstance's min LOD distance.
--   			[b]Note:[/b] This property currently has no effect.
bindGeometryInstance_get_lod_min_distance :: MethodBind
bindGeometryInstance_get_lod_min_distance
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_lod_min_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's min LOD distance.
--   			[b]Note:[/b] This property currently has no effect.
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

{-# NOINLINE bindGeometryInstance_get_lod_min_hysteresis #-}

-- | The GeometryInstance's min LOD margin.
--   			[b]Note:[/b] This property currently has no effect.
bindGeometryInstance_get_lod_min_hysteresis :: MethodBind
bindGeometryInstance_get_lod_min_hysteresis
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "get_lod_min_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's min LOD margin.
--   			[b]Note:[/b] This property currently has no effect.
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

{-# NOINLINE bindGeometryInstance_set_cast_shadows_setting #-}

-- | The selected shadow casting flag. See [enum ShadowCastingSetting] for possible values.
bindGeometryInstance_set_cast_shadows_setting :: MethodBind
bindGeometryInstance_set_cast_shadows_setting
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_cast_shadows_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The selected shadow casting flag. See [enum ShadowCastingSetting] for possible values.
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

{-# NOINLINE bindGeometryInstance_set_custom_aabb #-}

bindGeometryInstance_set_custom_aabb :: MethodBind
bindGeometryInstance_set_custom_aabb
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindGeometryInstance_set_extra_cull_margin #-}

-- | The extra distance added to the GeometryInstance's bounding box ([AABB]) to increase its cull box.
bindGeometryInstance_set_extra_cull_margin :: MethodBind
bindGeometryInstance_set_extra_cull_margin
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_extra_cull_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The extra distance added to the GeometryInstance's bounding box ([AABB]) to increase its cull box.
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

{-# NOINLINE bindGeometryInstance_set_flag #-}

-- | If [code]true[/code], this GeometryInstance will be used when baking lights using a [GIProbe] or [BakedLightmap].
bindGeometryInstance_set_flag :: MethodBind
bindGeometryInstance_set_flag
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], this GeometryInstance will be used when baking lights using a [GIProbe] or [BakedLightmap].
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

{-# NOINLINE bindGeometryInstance_set_lod_max_distance #-}

-- | The GeometryInstance's max LOD distance.
--   			[b]Note:[/b] This property currently has no effect.
bindGeometryInstance_set_lod_max_distance :: MethodBind
bindGeometryInstance_set_lod_max_distance
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_lod_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's max LOD distance.
--   			[b]Note:[/b] This property currently has no effect.
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

{-# NOINLINE bindGeometryInstance_set_lod_max_hysteresis #-}

-- | The GeometryInstance's max LOD margin.
--   			[b]Note:[/b] This property currently has no effect.
bindGeometryInstance_set_lod_max_hysteresis :: MethodBind
bindGeometryInstance_set_lod_max_hysteresis
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_lod_max_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's max LOD margin.
--   			[b]Note:[/b] This property currently has no effect.
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

{-# NOINLINE bindGeometryInstance_set_lod_min_distance #-}

-- | The GeometryInstance's min LOD distance.
--   			[b]Note:[/b] This property currently has no effect.
bindGeometryInstance_set_lod_min_distance :: MethodBind
bindGeometryInstance_set_lod_min_distance
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_lod_min_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's min LOD distance.
--   			[b]Note:[/b] This property currently has no effect.
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

{-# NOINLINE bindGeometryInstance_set_lod_min_hysteresis #-}

-- | The GeometryInstance's min LOD margin.
--   			[b]Note:[/b] This property currently has no effect.
bindGeometryInstance_set_lod_min_hysteresis :: MethodBind
bindGeometryInstance_set_lod_min_hysteresis
  = unsafePerformIO $
      withCString "GeometryInstance" $
        \ clsNamePtr ->
          withCString "set_lod_min_hysteresis" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The GeometryInstance's min LOD margin.
--   			[b]Note:[/b] This property currently has no effect.
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