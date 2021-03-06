{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.QuadMesh
       (Godot.Core.QuadMesh.get_size, Godot.Core.QuadMesh.set_size) where
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
import Godot.Core.PrimitiveMesh()

instance NodeProperty QuadMesh "size" Vector2 'False where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

{-# NOINLINE bindQuadMesh_get_size #-}

-- | Size on the X and Y axes.
bindQuadMesh_get_size :: MethodBind
bindQuadMesh_get_size
  = unsafePerformIO $
      withCString "QuadMesh" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size on the X and Y axes.
get_size :: (QuadMesh :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindQuadMesh_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod QuadMesh "get_size" '[] (IO Vector2) where
        nodeMethod = Godot.Core.QuadMesh.get_size

{-# NOINLINE bindQuadMesh_set_size #-}

-- | Size on the X and Y axes.
bindQuadMesh_set_size :: MethodBind
bindQuadMesh_set_size
  = unsafePerformIO $
      withCString "QuadMesh" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size on the X and Y axes.
set_size ::
           (QuadMesh :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindQuadMesh_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod QuadMesh "set_size" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.QuadMesh.set_size