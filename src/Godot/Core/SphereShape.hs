{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SphereShape
       (Godot.Core.SphereShape.get_radius,
        Godot.Core.SphereShape.set_radius)
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
import Godot.Core.Shape()

instance NodeProperty SphereShape "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

{-# NOINLINE bindSphereShape_get_radius #-}

-- | The sphere's radius. The shape's diameter is double the radius.
bindSphereShape_get_radius :: MethodBind
bindSphereShape_get_radius
  = unsafePerformIO $
      withCString "SphereShape" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius. The shape's diameter is double the radius.
get_radius ::
             (SphereShape :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereShape_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereShape "get_radius" '[] (IO Float) where
        nodeMethod = Godot.Core.SphereShape.get_radius

{-# NOINLINE bindSphereShape_set_radius #-}

-- | The sphere's radius. The shape's diameter is double the radius.
bindSphereShape_set_radius :: MethodBind
bindSphereShape_set_radius
  = unsafePerformIO $
      withCString "SphereShape" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The sphere's radius. The shape's diameter is double the radius.
set_radius ::
             (SphereShape :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSphereShape_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SphereShape "set_radius" '[Float] (IO ()) where
        nodeMethod = Godot.Core.SphereShape.set_radius