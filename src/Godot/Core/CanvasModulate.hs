{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CanvasModulate
       (Godot.Core.CanvasModulate.set_color,
        Godot.Core.CanvasModulate.get_color)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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