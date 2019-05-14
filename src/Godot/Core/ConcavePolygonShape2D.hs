{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ConcavePolygonShape2D
       (Godot.Core.ConcavePolygonShape2D.set_segments,
        Godot.Core.ConcavePolygonShape2D.get_segments)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindConcavePolygonShape2D_set_segments #-}

-- | The array of points that make up the [code]ConcavePolygonShape2D[/code]'s line segments.
bindConcavePolygonShape2D_set_segments :: MethodBind
bindConcavePolygonShape2D_set_segments
  = unsafePerformIO $
      withCString "ConcavePolygonShape2D" $
        \ clsNamePtr ->
          withCString "set_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The array of points that make up the [code]ConcavePolygonShape2D[/code]'s line segments.
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

{-# NOINLINE bindConcavePolygonShape2D_get_segments #-}

-- | The array of points that make up the [code]ConcavePolygonShape2D[/code]'s line segments.
bindConcavePolygonShape2D_get_segments :: MethodBind
bindConcavePolygonShape2D_get_segments
  = unsafePerformIO $
      withCString "ConcavePolygonShape2D" $
        \ clsNamePtr ->
          withCString "get_segments" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The array of points that make up the [code]ConcavePolygonShape2D[/code]'s line segments.
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