{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Material
       (Godot.Core.Material._RENDER_PRIORITY_MIN,
        Godot.Core.Material._RENDER_PRIORITY_MAX,
        Godot.Core.Material.get_next_pass,
        Godot.Core.Material.get_render_priority,
        Godot.Core.Material.set_next_pass,
        Godot.Core.Material.set_render_priority)
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
import Godot.Core.Resource()

_RENDER_PRIORITY_MIN :: Int
_RENDER_PRIORITY_MIN = -128

_RENDER_PRIORITY_MAX :: Int
_RENDER_PRIORITY_MAX = 127

instance NodeProperty Material "next_pass" Material 'False where
        nodeProperty
          = (get_next_pass, wrapDroppingSetter set_next_pass, Nothing)

instance NodeProperty Material "render_priority" Int 'False where
        nodeProperty
          = (get_render_priority, wrapDroppingSetter set_render_priority,
             Nothing)

{-# NOINLINE bindMaterial_get_next_pass #-}

-- | Sets the @Material@ to be used for the next pass. This renders the object again using a different material.
--   			__Note:__ only applies to @SpatialMaterial@s and @ShaderMaterial@s with type "Spatial".
bindMaterial_get_next_pass :: MethodBind
bindMaterial_get_next_pass
  = unsafePerformIO $
      withCString "Material" $
        \ clsNamePtr ->
          withCString "get_next_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Material@ to be used for the next pass. This renders the object again using a different material.
--   			__Note:__ only applies to @SpatialMaterial@s and @ShaderMaterial@s with type "Spatial".
get_next_pass ::
                (Material :< cls, Object :< cls) => cls -> IO Material
get_next_pass cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMaterial_get_next_pass (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Material "get_next_pass" '[] (IO Material)
         where
        nodeMethod = Godot.Core.Material.get_next_pass

{-# NOINLINE bindMaterial_get_render_priority #-}

-- | Sets the render priority for transparent objects in 3D scenes. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ this only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are sorted based on depth, while transparent objects are sorted from back to front (subject to priority).
bindMaterial_get_render_priority :: MethodBind
bindMaterial_get_render_priority
  = unsafePerformIO $
      withCString "Material" $
        \ clsNamePtr ->
          withCString "get_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the render priority for transparent objects in 3D scenes. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ this only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are sorted based on depth, while transparent objects are sorted from back to front (subject to priority).
get_render_priority ::
                      (Material :< cls, Object :< cls) => cls -> IO Int
get_render_priority cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMaterial_get_render_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Material "get_render_priority" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Material.get_render_priority

{-# NOINLINE bindMaterial_set_next_pass #-}

-- | Sets the @Material@ to be used for the next pass. This renders the object again using a different material.
--   			__Note:__ only applies to @SpatialMaterial@s and @ShaderMaterial@s with type "Spatial".
bindMaterial_set_next_pass :: MethodBind
bindMaterial_set_next_pass
  = unsafePerformIO $
      withCString "Material" $
        \ clsNamePtr ->
          withCString "set_next_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Material@ to be used for the next pass. This renders the object again using a different material.
--   			__Note:__ only applies to @SpatialMaterial@s and @ShaderMaterial@s with type "Spatial".
set_next_pass ::
                (Material :< cls, Object :< cls) => cls -> Material -> IO ()
set_next_pass cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMaterial_set_next_pass (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Material "set_next_pass" '[Material] (IO ())
         where
        nodeMethod = Godot.Core.Material.set_next_pass

{-# NOINLINE bindMaterial_set_render_priority #-}

-- | Sets the render priority for transparent objects in 3D scenes. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ this only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are sorted based on depth, while transparent objects are sorted from back to front (subject to priority).
bindMaterial_set_render_priority :: MethodBind
bindMaterial_set_render_priority
  = unsafePerformIO $
      withCString "Material" $
        \ clsNamePtr ->
          withCString "set_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the render priority for transparent objects in 3D scenes. Higher priority objects will be sorted in front of lower priority objects.
--   			__Note:__ this only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are sorted based on depth, while transparent objects are sorted from back to front (subject to priority).
set_render_priority ::
                      (Material :< cls, Object :< cls) => cls -> Int -> IO ()
set_render_priority cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMaterial_set_render_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Material "set_render_priority" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Material.set_render_priority