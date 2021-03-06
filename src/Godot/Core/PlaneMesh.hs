{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PlaneMesh
       (Godot.Core.PlaneMesh.get_size,
        Godot.Core.PlaneMesh.get_subdivide_depth,
        Godot.Core.PlaneMesh.get_subdivide_width,
        Godot.Core.PlaneMesh.set_size,
        Godot.Core.PlaneMesh.set_subdivide_depth,
        Godot.Core.PlaneMesh.set_subdivide_width)
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

instance NodeProperty PlaneMesh "size" Vector2 'False where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

instance NodeProperty PlaneMesh "subdivide_depth" Int 'False where
        nodeProperty
          = (get_subdivide_depth, wrapDroppingSetter set_subdivide_depth,
             Nothing)

instance NodeProperty PlaneMesh "subdivide_width" Int 'False where
        nodeProperty
          = (get_subdivide_width, wrapDroppingSetter set_subdivide_width,
             Nothing)

{-# NOINLINE bindPlaneMesh_get_size #-}

-- | Size of the generated plane.
bindPlaneMesh_get_size :: MethodBind
bindPlaneMesh_get_size
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of the generated plane.
get_size :: (PlaneMesh :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_get_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PlaneMesh "get_size" '[] (IO Vector2) where
        nodeMethod = Godot.Core.PlaneMesh.get_size

{-# NOINLINE bindPlaneMesh_get_subdivide_depth #-}

-- | Number of subdivision along the Z axis.
bindPlaneMesh_get_subdivide_depth :: MethodBind
bindPlaneMesh_get_subdivide_depth
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of subdivision along the Z axis.
get_subdivide_depth ::
                      (PlaneMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_get_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PlaneMesh "get_subdivide_depth" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PlaneMesh.get_subdivide_depth

{-# NOINLINE bindPlaneMesh_get_subdivide_width #-}

-- | Number of subdivision along the X axis.
bindPlaneMesh_get_subdivide_width :: MethodBind
bindPlaneMesh_get_subdivide_width
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "get_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of subdivision along the X axis.
get_subdivide_width ::
                      (PlaneMesh :< cls, Object :< cls) => cls -> IO Int
get_subdivide_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_get_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PlaneMesh "get_subdivide_width" '[] (IO Int)
         where
        nodeMethod = Godot.Core.PlaneMesh.get_subdivide_width

{-# NOINLINE bindPlaneMesh_set_size #-}

-- | Size of the generated plane.
bindPlaneMesh_set_size :: MethodBind
bindPlaneMesh_set_size
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Size of the generated plane.
set_size ::
           (PlaneMesh :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_set_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PlaneMesh "set_size" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.PlaneMesh.set_size

{-# NOINLINE bindPlaneMesh_set_subdivide_depth #-}

-- | Number of subdivision along the Z axis.
bindPlaneMesh_set_subdivide_depth :: MethodBind
bindPlaneMesh_set_subdivide_depth
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of subdivision along the Z axis.
set_subdivide_depth ::
                      (PlaneMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_set_subdivide_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PlaneMesh "set_subdivide_depth" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PlaneMesh.set_subdivide_depth

{-# NOINLINE bindPlaneMesh_set_subdivide_width #-}

-- | Number of subdivision along the X axis.
bindPlaneMesh_set_subdivide_width :: MethodBind
bindPlaneMesh_set_subdivide_width
  = unsafePerformIO $
      withCString "PlaneMesh" $
        \ clsNamePtr ->
          withCString "set_subdivide_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of subdivision along the X axis.
set_subdivide_width ::
                      (PlaneMesh :< cls, Object :< cls) => cls -> Int -> IO ()
set_subdivide_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPlaneMesh_set_subdivide_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PlaneMesh "set_subdivide_width" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.PlaneMesh.set_subdivide_width