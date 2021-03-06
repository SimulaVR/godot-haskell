{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CurveTexture
       (Godot.Core.CurveTexture.get_width,
        Godot.Core.CurveTexture._update, Godot.Core.CurveTexture.get_curve,
        Godot.Core.CurveTexture.set_curve,
        Godot.Core.CurveTexture.set_width)
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

instance NodeProperty CurveTexture "curve" Curve 'False where
        nodeProperty = (get_curve, wrapDroppingSetter set_curve, Nothing)

{-# NOINLINE bindCurveTexture_get_width #-}

-- | The width of the texture.
bindCurveTexture_get_width :: MethodBind
bindCurveTexture_get_width
  = unsafePerformIO $
      withCString "CurveTexture" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width of the texture.
get_width :: (CurveTexture :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurveTexture_get_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CurveTexture "get_width" '[] (IO Int) where
        nodeMethod = Godot.Core.CurveTexture.get_width

instance NodeProperty CurveTexture "width" Int 'False where
        nodeProperty = (get_width, wrapDroppingSetter set_width, Nothing)

{-# NOINLINE bindCurveTexture__update #-}

bindCurveTexture__update :: MethodBind
bindCurveTexture__update
  = unsafePerformIO $
      withCString "CurveTexture" $
        \ clsNamePtr ->
          withCString "_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update :: (CurveTexture :< cls, Object :< cls) => cls -> IO ()
_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurveTexture__update (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CurveTexture "_update" '[] (IO ()) where
        nodeMethod = Godot.Core.CurveTexture._update

{-# NOINLINE bindCurveTexture_get_curve #-}

-- | The @curve@ rendered onto the texture.
bindCurveTexture_get_curve :: MethodBind
bindCurveTexture_get_curve
  = unsafePerformIO $
      withCString "CurveTexture" $
        \ clsNamePtr ->
          withCString "get_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @curve@ rendered onto the texture.
get_curve ::
            (CurveTexture :< cls, Object :< cls) => cls -> IO Curve
get_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurveTexture_get_curve (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CurveTexture "get_curve" '[] (IO Curve) where
        nodeMethod = Godot.Core.CurveTexture.get_curve

{-# NOINLINE bindCurveTexture_set_curve #-}

-- | The @curve@ rendered onto the texture.
bindCurveTexture_set_curve :: MethodBind
bindCurveTexture_set_curve
  = unsafePerformIO $
      withCString "CurveTexture" $
        \ clsNamePtr ->
          withCString "set_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @curve@ rendered onto the texture.
set_curve ::
            (CurveTexture :< cls, Object :< cls) => cls -> Curve -> IO ()
set_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurveTexture_set_curve (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CurveTexture "set_curve" '[Curve] (IO ()) where
        nodeMethod = Godot.Core.CurveTexture.set_curve

{-# NOINLINE bindCurveTexture_set_width #-}

-- | The width of the texture.
bindCurveTexture_set_width :: MethodBind
bindCurveTexture_set_width
  = unsafePerformIO $
      withCString "CurveTexture" $
        \ clsNamePtr ->
          withCString "set_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The width of the texture.
set_width ::
            (CurveTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCurveTexture_set_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CurveTexture "set_width" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CurveTexture.set_width