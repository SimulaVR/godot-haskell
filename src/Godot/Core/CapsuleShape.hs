{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CapsuleShape
       (Godot.Core.CapsuleShape.get_height,
        Godot.Core.CapsuleShape.get_radius,
        Godot.Core.CapsuleShape.set_height,
        Godot.Core.CapsuleShape.set_radius)
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

instance NodeProperty CapsuleShape "height" Float 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty CapsuleShape "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

{-# NOINLINE bindCapsuleShape_get_height #-}

-- | The capsule's height.
bindCapsuleShape_get_height :: MethodBind
bindCapsuleShape_get_height
  = unsafePerformIO $
      withCString "CapsuleShape" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The capsule's height.
get_height ::
             (CapsuleShape :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleShape_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleShape "get_height" '[] (IO Float) where
        nodeMethod = Godot.Core.CapsuleShape.get_height

{-# NOINLINE bindCapsuleShape_get_radius #-}

-- | The capsule's radius.
bindCapsuleShape_get_radius :: MethodBind
bindCapsuleShape_get_radius
  = unsafePerformIO $
      withCString "CapsuleShape" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The capsule's radius.
get_radius ::
             (CapsuleShape :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleShape_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleShape "get_radius" '[] (IO Float) where
        nodeMethod = Godot.Core.CapsuleShape.get_radius

{-# NOINLINE bindCapsuleShape_set_height #-}

-- | The capsule's height.
bindCapsuleShape_set_height :: MethodBind
bindCapsuleShape_set_height
  = unsafePerformIO $
      withCString "CapsuleShape" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The capsule's height.
set_height ::
             (CapsuleShape :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleShape_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleShape "set_height" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CapsuleShape.set_height

{-# NOINLINE bindCapsuleShape_set_radius #-}

-- | The capsule's radius.
bindCapsuleShape_set_radius :: MethodBind
bindCapsuleShape_set_radius
  = unsafePerformIO $
      withCString "CapsuleShape" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The capsule's radius.
set_radius ::
             (CapsuleShape :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCapsuleShape_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CapsuleShape "set_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CapsuleShape.set_radius