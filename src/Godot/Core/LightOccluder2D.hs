{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.LightOccluder2D
       (Godot.Core.LightOccluder2D._poly_changed,
        Godot.Core.LightOccluder2D.get_occluder_light_mask,
        Godot.Core.LightOccluder2D.get_occluder_polygon,
        Godot.Core.LightOccluder2D.set_occluder_light_mask,
        Godot.Core.LightOccluder2D.set_occluder_polygon)
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

instance NodeProperty LightOccluder2D "light_mask" Int 'False where
        nodeProperty
          = (get_occluder_light_mask,
             wrapDroppingSetter set_occluder_light_mask, Nothing)

instance NodeProperty LightOccluder2D "occluder" OccluderPolygon2D
           'False
         where
        nodeProperty
          = (get_occluder_polygon, wrapDroppingSetter set_occluder_polygon,
             Nothing)

{-# NOINLINE bindLightOccluder2D__poly_changed #-}

bindLightOccluder2D__poly_changed :: MethodBind
bindLightOccluder2D__poly_changed
  = unsafePerformIO $
      withCString "LightOccluder2D" $
        \ clsNamePtr ->
          withCString "_poly_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_poly_changed ::
                (LightOccluder2D :< cls, Object :< cls) => cls -> IO ()
_poly_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLightOccluder2D__poly_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LightOccluder2D "_poly_changed" '[] (IO ())
         where
        nodeMethod = Godot.Core.LightOccluder2D._poly_changed

{-# NOINLINE bindLightOccluder2D_get_occluder_light_mask #-}

-- | The LightOccluder2D's light mask. The LightOccluder2D will cast shadows only from Light2D(s) that have the same light mask(s).
bindLightOccluder2D_get_occluder_light_mask :: MethodBind
bindLightOccluder2D_get_occluder_light_mask
  = unsafePerformIO $
      withCString "LightOccluder2D" $
        \ clsNamePtr ->
          withCString "get_occluder_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The LightOccluder2D's light mask. The LightOccluder2D will cast shadows only from Light2D(s) that have the same light mask(s).
get_occluder_light_mask ::
                          (LightOccluder2D :< cls, Object :< cls) => cls -> IO Int
get_occluder_light_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLightOccluder2D_get_occluder_light_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LightOccluder2D "get_occluder_light_mask" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.LightOccluder2D.get_occluder_light_mask

{-# NOINLINE bindLightOccluder2D_get_occluder_polygon #-}

-- | The @OccluderPolygon2D@ used to compute the shadow.
bindLightOccluder2D_get_occluder_polygon :: MethodBind
bindLightOccluder2D_get_occluder_polygon
  = unsafePerformIO $
      withCString "LightOccluder2D" $
        \ clsNamePtr ->
          withCString "get_occluder_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @OccluderPolygon2D@ used to compute the shadow.
get_occluder_polygon ::
                       (LightOccluder2D :< cls, Object :< cls) =>
                       cls -> IO OccluderPolygon2D
get_occluder_polygon cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLightOccluder2D_get_occluder_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LightOccluder2D "get_occluder_polygon" '[]
           (IO OccluderPolygon2D)
         where
        nodeMethod = Godot.Core.LightOccluder2D.get_occluder_polygon

{-# NOINLINE bindLightOccluder2D_set_occluder_light_mask #-}

-- | The LightOccluder2D's light mask. The LightOccluder2D will cast shadows only from Light2D(s) that have the same light mask(s).
bindLightOccluder2D_set_occluder_light_mask :: MethodBind
bindLightOccluder2D_set_occluder_light_mask
  = unsafePerformIO $
      withCString "LightOccluder2D" $
        \ clsNamePtr ->
          withCString "set_occluder_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The LightOccluder2D's light mask. The LightOccluder2D will cast shadows only from Light2D(s) that have the same light mask(s).
set_occluder_light_mask ::
                          (LightOccluder2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_occluder_light_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLightOccluder2D_set_occluder_light_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LightOccluder2D "set_occluder_light_mask"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.LightOccluder2D.set_occluder_light_mask

{-# NOINLINE bindLightOccluder2D_set_occluder_polygon #-}

-- | The @OccluderPolygon2D@ used to compute the shadow.
bindLightOccluder2D_set_occluder_polygon :: MethodBind
bindLightOccluder2D_set_occluder_polygon
  = unsafePerformIO $
      withCString "LightOccluder2D" $
        \ clsNamePtr ->
          withCString "set_occluder_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @OccluderPolygon2D@ used to compute the shadow.
set_occluder_polygon ::
                       (LightOccluder2D :< cls, Object :< cls) =>
                       cls -> OccluderPolygon2D -> IO ()
set_occluder_polygon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLightOccluder2D_set_occluder_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LightOccluder2D "set_occluder_polygon"
           '[OccluderPolygon2D]
           (IO ())
         where
        nodeMethod = Godot.Core.LightOccluder2D.set_occluder_polygon