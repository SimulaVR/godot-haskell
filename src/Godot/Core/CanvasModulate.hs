{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CanvasModulate
       (Godot.Core.CanvasModulate.get_color,
        Godot.Core.CanvasModulate.set_color)
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

instance NodeProperty CanvasModulate "color" Color 'False where
        nodeProperty = (get_color, wrapDroppingSetter set_color, Nothing)

{-# NOINLINE bindCanvasModulate_get_color #-}

-- | The tint color to apply.
bindCanvasModulate_get_color :: MethodBind
bindCanvasModulate_get_color
  = unsafePerformIO $
      withCString "CanvasModulate" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tint color to apply.
get_color ::
            (CanvasModulate :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasModulate_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasModulate "get_color" '[] (IO Color) where
        nodeMethod = Godot.Core.CanvasModulate.get_color

{-# NOINLINE bindCanvasModulate_set_color #-}

-- | The tint color to apply.
bindCanvasModulate_set_color :: MethodBind
bindCanvasModulate_set_color
  = unsafePerformIO $
      withCString "CanvasModulate" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The tint color to apply.
set_color ::
            (CanvasModulate :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCanvasModulate_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CanvasModulate "set_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.CanvasModulate.set_color