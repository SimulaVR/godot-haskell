{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ConcavePolygonShape2D
       (Godot.Core.ConcavePolygonShape2D.get_segments,
        Godot.Core.ConcavePolygonShape2D.set_segments)
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

instance NodeProperty ConcavePolygonShape2D "segments"
           PoolVector2Array
           'False
         where
        nodeProperty
          = (get_segments, wrapDroppingSetter set_segments, Nothing)

{-# NOINLINE bindConcavePolygonShape2D_get_segments #-}

-- | The array of points that make up the @ConcavePolygonShape2D@'s line segments.
bindConcavePolygonShape2D_get_segments :: MethodBind
bindConcavePolygonShape2D_get_segments
  = unsafePerformIO $
      withCString "ConcavePolygonShape2D" $
        \ clsNamePtr ->
          withCString "get_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The array of points that make up the @ConcavePolygonShape2D@'s line segments.
get_segments ::
               (ConcavePolygonShape2D :< cls, Object :< cls) =>
               cls -> IO PoolVector2Array
get_segments cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConcavePolygonShape2D_get_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConcavePolygonShape2D "get_segments" '[]
           (IO PoolVector2Array)
         where
        nodeMethod = Godot.Core.ConcavePolygonShape2D.get_segments

{-# NOINLINE bindConcavePolygonShape2D_set_segments #-}

-- | The array of points that make up the @ConcavePolygonShape2D@'s line segments.
bindConcavePolygonShape2D_set_segments :: MethodBind
bindConcavePolygonShape2D_set_segments
  = unsafePerformIO $
      withCString "ConcavePolygonShape2D" $
        \ clsNamePtr ->
          withCString "set_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The array of points that make up the @ConcavePolygonShape2D@'s line segments.
set_segments ::
               (ConcavePolygonShape2D :< cls, Object :< cls) =>
               cls -> PoolVector2Array -> IO ()
set_segments cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConcavePolygonShape2D_set_segments
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConcavePolygonShape2D "set_segments"
           '[PoolVector2Array]
           (IO ())
         where
        nodeMethod = Godot.Core.ConcavePolygonShape2D.set_segments