{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CircleShape2D
       (Godot.Core.CircleShape2D.get_radius,
        Godot.Core.CircleShape2D.set_radius)
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
import Godot.Core.Shape2D()

instance NodeProperty CircleShape2D "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

{-# NOINLINE bindCircleShape2D_get_radius #-}

-- | The circle's radius.
bindCircleShape2D_get_radius :: MethodBind
bindCircleShape2D_get_radius
  = unsafePerformIO $
      withCString "CircleShape2D" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The circle's radius.
get_radius ::
             (CircleShape2D :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCircleShape2D_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CircleShape2D "get_radius" '[] (IO Float) where
        nodeMethod = Godot.Core.CircleShape2D.get_radius

{-# NOINLINE bindCircleShape2D_set_radius #-}

-- | The circle's radius.
bindCircleShape2D_set_radius :: MethodBind
bindCircleShape2D_set_radius
  = unsafePerformIO $
      withCString "CircleShape2D" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The circle's radius.
set_radius ::
             (CircleShape2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCircleShape2D_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CircleShape2D "set_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CircleShape2D.set_radius