{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Path2D
       (Godot.Core.Path2D.set_curve, Godot.Core.Path2D.get_curve,
        Godot.Core.Path2D._curve_changed)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindPath2D_set_curve #-}

-- | A [Curve2D] describing the path.
bindPath2D_set_curve :: MethodBind
bindPath2D_set_curve
  = unsafePerformIO $
      withCString "Path2D" $
        \ clsNamePtr ->
          withCString "set_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A [Curve2D] describing the path.
set_curve ::
            (Path2D :< cls, Object :< cls) => cls -> Curve2D -> IO ()
set_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPath2D_set_curve (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPath2D_get_curve #-}

-- | A [Curve2D] describing the path.
bindPath2D_get_curve :: MethodBind
bindPath2D_get_curve
  = unsafePerformIO $
      withCString "Path2D" $
        \ clsNamePtr ->
          withCString "get_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A [Curve2D] describing the path.
get_curve :: (Path2D :< cls, Object :< cls) => cls -> IO Curve2D
get_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPath2D_get_curve (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindPath2D__curve_changed #-}

bindPath2D__curve_changed :: MethodBind
bindPath2D__curve_changed
  = unsafePerformIO $
      withCString "Path2D" $
        \ clsNamePtr ->
          withCString "_curve_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_curve_changed :: (Path2D :< cls, Object :< cls) => cls -> IO ()
_curve_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPath2D__curve_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)