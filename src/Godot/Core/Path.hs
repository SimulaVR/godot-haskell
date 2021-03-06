{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Path
       (Godot.Core.Path.sig_curve_changed, Godot.Core.Path._curve_changed,
        Godot.Core.Path.get_curve, Godot.Core.Path.set_curve)
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
import Godot.Core.Spatial()

-- | Emitted when the @curve@ changes.
sig_curve_changed :: Godot.Internal.Dispatch.Signal Path
sig_curve_changed = Godot.Internal.Dispatch.Signal "curve_changed"

instance NodeSignal Path "curve_changed" '[]

instance NodeProperty Path "curve" Curve3D 'False where
        nodeProperty = (get_curve, wrapDroppingSetter set_curve, Nothing)

{-# NOINLINE bindPath__curve_changed #-}

bindPath__curve_changed :: MethodBind
bindPath__curve_changed
  = unsafePerformIO $
      withCString "Path" $
        \ clsNamePtr ->
          withCString "_curve_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_curve_changed :: (Path :< cls, Object :< cls) => cls -> IO ()
_curve_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPath__curve_changed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Path "_curve_changed" '[] (IO ()) where
        nodeMethod = Godot.Core.Path._curve_changed

{-# NOINLINE bindPath_get_curve #-}

-- | A @Curve3D@ describing the path.
bindPath_get_curve :: MethodBind
bindPath_get_curve
  = unsafePerformIO $
      withCString "Path" $
        \ clsNamePtr ->
          withCString "get_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A @Curve3D@ describing the path.
get_curve :: (Path :< cls, Object :< cls) => cls -> IO Curve3D
get_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPath_get_curve (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Path "get_curve" '[] (IO Curve3D) where
        nodeMethod = Godot.Core.Path.get_curve

{-# NOINLINE bindPath_set_curve #-}

-- | A @Curve3D@ describing the path.
bindPath_set_curve :: MethodBind
bindPath_set_curve
  = unsafePerformIO $
      withCString "Path" $
        \ clsNamePtr ->
          withCString "set_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A @Curve3D@ describing the path.
set_curve ::
            (Path :< cls, Object :< cls) => cls -> Curve3D -> IO ()
set_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPath_set_curve (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Path "set_curve" '[Curve3D] (IO ()) where
        nodeMethod = Godot.Core.Path.set_curve