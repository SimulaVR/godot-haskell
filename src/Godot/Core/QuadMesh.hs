{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.QuadMesh
       (Godot.Core.QuadMesh.get_size, Godot.Core.QuadMesh.set_size) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindQuadMesh_get_size #-}

-- | Size in the X and Y axes. Default is [code]Vector2(1, 1)[/code].
bindQuadMesh_get_size :: MethodBind
bindQuadMesh_get_size
  = unsafePerformIO $
      withCString "QuadMesh" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size in the X and Y axes. Default is [code]Vector2(1, 1)[/code].
get_size :: (QuadMesh :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindQuadMesh_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindQuadMesh_set_size #-}

-- | Size in the X and Y axes. Default is [code]Vector2(1, 1)[/code].
bindQuadMesh_set_size :: MethodBind
bindQuadMesh_set_size
  = unsafePerformIO $
      withCString "QuadMesh" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size in the X and Y axes. Default is [code]Vector2(1, 1)[/code].
set_size ::
           (QuadMesh :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindQuadMesh_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)