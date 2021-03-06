{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Shape
       (Godot.Core.Shape.get_margin, Godot.Core.Shape.set_margin) where
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
import Godot.Core.Resource()

instance NodeProperty Shape "margin" Float 'False where
        nodeProperty = (get_margin, wrapDroppingSetter set_margin, Nothing)

{-# NOINLINE bindShape_get_margin #-}

-- | The collision margin for the shape.
bindShape_get_margin :: MethodBind
bindShape_get_margin
  = unsafePerformIO $
      withCString "Shape" $
        \ clsNamePtr ->
          withCString "get_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision margin for the shape.
get_margin :: (Shape :< cls, Object :< cls) => cls -> IO Float
get_margin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape_get_margin (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Shape "get_margin" '[] (IO Float) where
        nodeMethod = Godot.Core.Shape.get_margin

{-# NOINLINE bindShape_set_margin #-}

-- | The collision margin for the shape.
bindShape_set_margin :: MethodBind
bindShape_set_margin
  = unsafePerformIO $
      withCString "Shape" $
        \ clsNamePtr ->
          withCString "set_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The collision margin for the shape.
set_margin ::
             (Shape :< cls, Object :< cls) => cls -> Float -> IO ()
set_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindShape_set_margin (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Shape "set_margin" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Shape.set_margin