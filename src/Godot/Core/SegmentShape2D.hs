{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SegmentShape2D
       (Godot.Core.SegmentShape2D.get_a, Godot.Core.SegmentShape2D.get_b,
        Godot.Core.SegmentShape2D.set_a, Godot.Core.SegmentShape2D.set_b)
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

instance NodeProperty SegmentShape2D "a" Vector2 'False where
        nodeProperty = (get_a, wrapDroppingSetter set_a, Nothing)

instance NodeProperty SegmentShape2D "b" Vector2 'False where
        nodeProperty = (get_b, wrapDroppingSetter set_b, Nothing)

{-# NOINLINE bindSegmentShape2D_get_a #-}

-- | The segment's first point position.
bindSegmentShape2D_get_a :: MethodBind
bindSegmentShape2D_get_a
  = unsafePerformIO $
      withCString "SegmentShape2D" $
        \ clsNamePtr ->
          withCString "get_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The segment's first point position.
get_a ::
        (SegmentShape2D :< cls, Object :< cls) => cls -> IO Vector2
get_a cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSegmentShape2D_get_a (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SegmentShape2D "get_a" '[] (IO Vector2) where
        nodeMethod = Godot.Core.SegmentShape2D.get_a

{-# NOINLINE bindSegmentShape2D_get_b #-}

-- | The segment's second point position.
bindSegmentShape2D_get_b :: MethodBind
bindSegmentShape2D_get_b
  = unsafePerformIO $
      withCString "SegmentShape2D" $
        \ clsNamePtr ->
          withCString "get_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The segment's second point position.
get_b ::
        (SegmentShape2D :< cls, Object :< cls) => cls -> IO Vector2
get_b cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSegmentShape2D_get_b (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SegmentShape2D "get_b" '[] (IO Vector2) where
        nodeMethod = Godot.Core.SegmentShape2D.get_b

{-# NOINLINE bindSegmentShape2D_set_a #-}

-- | The segment's first point position.
bindSegmentShape2D_set_a :: MethodBind
bindSegmentShape2D_set_a
  = unsafePerformIO $
      withCString "SegmentShape2D" $
        \ clsNamePtr ->
          withCString "set_a" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The segment's first point position.
set_a ::
        (SegmentShape2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_a cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSegmentShape2D_set_a (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SegmentShape2D "set_a" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.SegmentShape2D.set_a

{-# NOINLINE bindSegmentShape2D_set_b #-}

-- | The segment's second point position.
bindSegmentShape2D_set_b :: MethodBind
bindSegmentShape2D_set_b
  = unsafePerformIO $
      withCString "SegmentShape2D" $
        \ clsNamePtr ->
          withCString "set_b" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The segment's second point position.
set_b ::
        (SegmentShape2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_b cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSegmentShape2D_set_b (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SegmentShape2D "set_b" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.SegmentShape2D.set_b