{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GradientTexture
       (Godot.Core.GradientTexture.get_width,
        Godot.Core.GradientTexture._update,
        Godot.Core.GradientTexture.get_gradient,
        Godot.Core.GradientTexture.set_gradient,
        Godot.Core.GradientTexture.set_width)
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
import Godot.Core.Texture()

instance NodeProperty GradientTexture "gradient" Gradient 'False
         where
        nodeProperty
          = (get_gradient, wrapDroppingSetter set_gradient, Nothing)

{-# NOINLINE bindGradientTexture_get_width #-}

-- | The number of color samples that will be obtained from the @Gradient@.
bindGradientTexture_get_width :: MethodBind
bindGradientTexture_get_width
  = unsafePerformIO $
      withCString "GradientTexture" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of color samples that will be obtained from the @Gradient@.
get_width ::
            (GradientTexture :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture_get_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GradientTexture "get_width" '[] (IO Int) where
        nodeMethod = Godot.Core.GradientTexture.get_width

instance NodeProperty GradientTexture "width" Int 'False where
        nodeProperty = (get_width, wrapDroppingSetter set_width, Nothing)

{-# NOINLINE bindGradientTexture__update #-}

bindGradientTexture__update :: MethodBind
bindGradientTexture__update
  = unsafePerformIO $
      withCString "GradientTexture" $
        \ clsNamePtr ->
          withCString "_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update :: (GradientTexture :< cls, Object :< cls) => cls -> IO ()
_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture__update (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GradientTexture "_update" '[] (IO ()) where
        nodeMethod = Godot.Core.GradientTexture._update

{-# NOINLINE bindGradientTexture_get_gradient #-}

-- | The @Gradient@ that will be used to fill the texture.
bindGradientTexture_get_gradient :: MethodBind
bindGradientTexture_get_gradient
  = unsafePerformIO $
      withCString "GradientTexture" $
        \ clsNamePtr ->
          withCString "get_gradient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Gradient@ that will be used to fill the texture.
get_gradient ::
               (GradientTexture :< cls, Object :< cls) => cls -> IO Gradient
get_gradient cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture_get_gradient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GradientTexture "get_gradient" '[]
           (IO Gradient)
         where
        nodeMethod = Godot.Core.GradientTexture.get_gradient

{-# NOINLINE bindGradientTexture_set_gradient #-}

-- | The @Gradient@ that will be used to fill the texture.
bindGradientTexture_set_gradient :: MethodBind
bindGradientTexture_set_gradient
  = unsafePerformIO $
      withCString "GradientTexture" $
        \ clsNamePtr ->
          withCString "set_gradient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Gradient@ that will be used to fill the texture.
set_gradient ::
               (GradientTexture :< cls, Object :< cls) => cls -> Gradient -> IO ()
set_gradient cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture_set_gradient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GradientTexture "set_gradient" '[Gradient]
           (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture.set_gradient

{-# NOINLINE bindGradientTexture_set_width #-}

-- | The number of color samples that will be obtained from the @Gradient@.
bindGradientTexture_set_width :: MethodBind
bindGradientTexture_set_width
  = unsafePerformIO $
      withCString "GradientTexture" $
        \ clsNamePtr ->
          withCString "set_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of color samples that will be obtained from the @Gradient@.
set_width ::
            (GradientTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGradientTexture_set_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GradientTexture "set_width" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.GradientTexture.set_width