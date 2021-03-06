{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PrismMesh
       (Godot.Core.PrismMesh.get_left_to_right,
        Godot.Core.PrismMesh.get_size,
        Godot.Core.PrismMesh.get_subdivide_depth,
        Godot.Core.PrismMesh.get_subdivide_height,
        Godot.Core.PrismMesh.get_subdivide_width,
        Godot.Core.PrismMesh.set_left_to_right,
        Godot.Core.PrismMesh.set_size,
        Godot.Core.PrismMesh.set_subdivide_depth,
        Godot.Core.PrismMesh.set_subdivide_height,
        Godot.Core.PrismMesh.set_subdivide_width)
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
import Godot.Core.PrimitiveMesh()

instance NodeProperty PrismMesh "left_to_right" Float 'False where
        nodeProperty
          = (get_left_to_right, wrapDroppingSetter set_left_to_right,
             Nothing)

instance NodeProperty PrismMesh "size" Vector3 'False where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

instance NodeProperty PrismMesh "subdivide_depth" Int 'False where
        nodeProperty
          = (get_subdivide_depth, wrapDroppingSetter set_subdivide_depth,
             Nothing)

instance NodeProperty PrismMesh "subdivide_height" Int 'False where
        nodeProperty
          = (get_subdivide_height, wrapDroppingSetter set_subdivide_height,
             Nothing)

instance NodeProperty PrismMesh "subdivide_width" Int 'False where
        nodeProperty
          = (get_subdivide_width, wrapDroppingSetter set_subdivide_width,
             Nothing)

{-# NOINLINE bindPrismMesh_get_left_to_right #-}

-- | Displacement of the upper edge along the X axis. 0.0 positions edge straight above the bottom-left edge.
bindPrismMesh_get_left_to_right :: MethodBind
bindPrismMesh_get_left_to_right
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "get_left_to_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Displacement of the upper edge along the X axis. 0.0 positions edge straight above the bottom-left edge.
get_left_to_right ::
                    (PrismMesh :< cls, Object :< cls) => cls -> IO Float
get_left_to_right cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_get_left_to_right (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "get_left_to_right" '[] (IO Float)
         where
        nodeMethod = Godot.Core.PrismMesh.get_left_to_right

{-# NOINLINE bindPrismMesh_get_size #-}

-- | Size of the prism.
bindPrismMesh_get_size :: MethodBind
bindPrismMesh_get_size
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of the prism.
get_size :: (PrismMesh :< cls, Object :< cls) => cls -> IO Vector3
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "get_size" '[] (IO Vector3) where
        nodeMethod = Godot.Core.PrismMesh.get_size

{-# NOINLINE bindPrismMesh_get_subdivide_depth #-}

-- | Number of added edge loops along the Z axis.
bindPrismMesh_get_subdivide_depth :: MethodBind
bindPrismMesh_get_subdivide_depth
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of added edge loops along the Z axis.
get_subdivide_depth ::
                      (PrismMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_get_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "get_subdivide_depth" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PrismMesh.get_subdivide_depth

{-# NOINLINE bindPrismMesh_get_subdivide_height #-}

-- | Number of added edge loops along the Y axis.
bindPrismMesh_get_subdivide_height :: MethodBind
bindPrismMesh_get_subdivide_height
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of added edge loops along the Y axis.
get_subdivide_height ::
                       (PrismMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_get_subdivide_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "get_subdivide_height" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PrismMesh.get_subdivide_height

{-# NOINLINE bindPrismMesh_get_subdivide_width #-}

-- | Number of added edge loops along the X axis.
bindPrismMesh_get_subdivide_width :: MethodBind
bindPrismMesh_get_subdivide_width
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of added edge loops along the X axis.
get_subdivide_width ::
                      (PrismMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_get_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "get_subdivide_width" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PrismMesh.get_subdivide_width

{-# NOINLINE bindPrismMesh_set_left_to_right #-}

-- | Displacement of the upper edge along the X axis. 0.0 positions edge straight above the bottom-left edge.
bindPrismMesh_set_left_to_right :: MethodBind
bindPrismMesh_set_left_to_right
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "set_left_to_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Displacement of the upper edge along the X axis. 0.0 positions edge straight above the bottom-left edge.
set_left_to_right ::
                    (PrismMesh :< cls, Object :< cls) => cls -> Float -> IO ()
set_left_to_right cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_set_left_to_right (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "set_left_to_right" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PrismMesh.set_left_to_right

{-# NOINLINE bindPrismMesh_set_size #-}

-- | Size of the prism.
bindPrismMesh_set_size :: MethodBind
bindPrismMesh_set_size
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of the prism.
set_size ::
           (PrismMesh :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "set_size" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.PrismMesh.set_size

{-# NOINLINE bindPrismMesh_set_subdivide_depth #-}

-- | Number of added edge loops along the Z axis.
bindPrismMesh_set_subdivide_depth :: MethodBind
bindPrismMesh_set_subdivide_depth
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of added edge loops along the Z axis.
set_subdivide_depth ::
                      (PrismMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_set_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "set_subdivide_depth" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PrismMesh.set_subdivide_depth

{-# NOINLINE bindPrismMesh_set_subdivide_height #-}

-- | Number of added edge loops along the Y axis.
bindPrismMesh_set_subdivide_height :: MethodBind
bindPrismMesh_set_subdivide_height
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of added edge loops along the Y axis.
set_subdivide_height ::
                       (PrismMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_set_subdivide_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "set_subdivide_height" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PrismMesh.set_subdivide_height

{-# NOINLINE bindPrismMesh_set_subdivide_width #-}

-- | Number of added edge loops along the X axis.
bindPrismMesh_set_subdivide_width :: MethodBind
bindPrismMesh_set_subdivide_width
  = unsafePerformIO $
      withCString "PrismMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of added edge loops along the X axis.
set_subdivide_width ::
                      (PrismMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPrismMesh_set_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PrismMesh "set_subdivide_width" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PrismMesh.set_subdivide_width