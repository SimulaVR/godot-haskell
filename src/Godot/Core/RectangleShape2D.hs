{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RectangleShape2D
       (Godot.Core.RectangleShape2D.get_extents,
        Godot.Core.RectangleShape2D.set_extents)
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

instance NodeProperty RectangleShape2D "extents" Vector2 'False
         where
        nodeProperty
          = (get_extents, wrapDroppingSetter set_extents, Nothing)

{-# NOINLINE bindRectangleShape2D_get_extents #-}

-- | The rectangle's half extents. The width and height of this shape is twice the half extents.
bindRectangleShape2D_get_extents :: MethodBind
bindRectangleShape2D_get_extents
  = unsafePerformIO $
      withCString "RectangleShape2D" $
        \ clsNamePtr ->
          withCString "get_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rectangle's half extents. The width and height of this shape is twice the half extents.
get_extents ::
              (RectangleShape2D :< cls, Object :< cls) => cls -> IO Vector2
get_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRectangleShape2D_get_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RectangleShape2D "get_extents" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.RectangleShape2D.get_extents

{-# NOINLINE bindRectangleShape2D_set_extents #-}

-- | The rectangle's half extents. The width and height of this shape is twice the half extents.
bindRectangleShape2D_set_extents :: MethodBind
bindRectangleShape2D_set_extents
  = unsafePerformIO $
      withCString "RectangleShape2D" $
        \ clsNamePtr ->
          withCString "set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The rectangle's half extents. The width and height of this shape is twice the half extents.
set_extents ::
              (RectangleShape2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRectangleShape2D_set_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RectangleShape2D "set_extents" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.RectangleShape2D.set_extents