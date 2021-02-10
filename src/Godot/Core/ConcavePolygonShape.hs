{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ConcavePolygonShape
       (Godot.Core.ConcavePolygonShape.get_faces,
        Godot.Core.ConcavePolygonShape.set_faces)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindConcavePolygonShape_get_faces #-}

-- | Returns the faces (an array of triangles).
bindConcavePolygonShape_get_faces :: MethodBind
bindConcavePolygonShape_get_faces
  = unsafePerformIO $
      withCString "ConcavePolygonShape" $
        \ clsNamePtr ->
          withCString "get_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the faces (an array of triangles).
get_faces ::
            (ConcavePolygonShape :< cls, Object :< cls) =>
            cls -> IO PoolVector3Array
get_faces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConcavePolygonShape_get_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConcavePolygonShape_set_faces #-}

-- | Sets the faces (an array of triangles).
bindConcavePolygonShape_set_faces :: MethodBind
bindConcavePolygonShape_set_faces
  = unsafePerformIO $
      withCString "ConcavePolygonShape" $
        \ clsNamePtr ->
          withCString "set_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the faces (an array of triangles).
set_faces ::
            (ConcavePolygonShape :< cls, Object :< cls) =>
            cls -> PoolVector3Array -> IO ()
set_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConcavePolygonShape_set_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)