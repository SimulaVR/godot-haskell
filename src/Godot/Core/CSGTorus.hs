{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CSGTorus
       (Godot.Core.CSGTorus.get_inner_radius,
        Godot.Core.CSGTorus.get_material,
        Godot.Core.CSGTorus.get_outer_radius,
        Godot.Core.CSGTorus.get_ring_sides, Godot.Core.CSGTorus.get_sides,
        Godot.Core.CSGTorus.get_smooth_faces,
        Godot.Core.CSGTorus.set_inner_radius,
        Godot.Core.CSGTorus.set_material,
        Godot.Core.CSGTorus.set_outer_radius,
        Godot.Core.CSGTorus.set_ring_sides, Godot.Core.CSGTorus.set_sides,
        Godot.Core.CSGTorus.set_smooth_faces)
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
import Godot.Core.CSGPrimitive()

instance NodeProperty CSGTorus "inner_radius" Float 'False where
        nodeProperty
          = (get_inner_radius, wrapDroppingSetter set_inner_radius, Nothing)

instance NodeProperty CSGTorus "material" Material 'False where
        nodeProperty
          = (get_material, wrapDroppingSetter set_material, Nothing)

instance NodeProperty CSGTorus "outer_radius" Float 'False where
        nodeProperty
          = (get_outer_radius, wrapDroppingSetter set_outer_radius, Nothing)

instance NodeProperty CSGTorus "ring_sides" Int 'False where
        nodeProperty
          = (get_ring_sides, wrapDroppingSetter set_ring_sides, Nothing)

instance NodeProperty CSGTorus "sides" Int 'False where
        nodeProperty = (get_sides, wrapDroppingSetter set_sides, Nothing)

instance NodeProperty CSGTorus "smooth_faces" Bool 'False where
        nodeProperty
          = (get_smooth_faces, wrapDroppingSetter set_smooth_faces, Nothing)

{-# NOINLINE bindCSGTorus_get_inner_radius #-}

bindCSGTorus_get_inner_radius :: MethodBind
bindCSGTorus_get_inner_radius
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "get_inner_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_inner_radius ::
                   (CSGTorus :< cls, Object :< cls) => cls -> IO Float
get_inner_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_get_inner_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "get_inner_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.CSGTorus.get_inner_radius

{-# NOINLINE bindCSGTorus_get_material #-}

bindCSGTorus_get_material :: MethodBind
bindCSGTorus_get_material
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_material ::
               (CSGTorus :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "get_material" '[] (IO Material) where
        nodeMethod = Godot.Core.CSGTorus.get_material

{-# NOINLINE bindCSGTorus_get_outer_radius #-}

bindCSGTorus_get_outer_radius :: MethodBind
bindCSGTorus_get_outer_radius
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "get_outer_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_outer_radius ::
                   (CSGTorus :< cls, Object :< cls) => cls -> IO Float
get_outer_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_get_outer_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "get_outer_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.CSGTorus.get_outer_radius

{-# NOINLINE bindCSGTorus_get_ring_sides #-}

bindCSGTorus_get_ring_sides :: MethodBind
bindCSGTorus_get_ring_sides
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "get_ring_sides" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_ring_sides :: (CSGTorus :< cls, Object :< cls) => cls -> IO Int
get_ring_sides cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_get_ring_sides (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "get_ring_sides" '[] (IO Int) where
        nodeMethod = Godot.Core.CSGTorus.get_ring_sides

{-# NOINLINE bindCSGTorus_get_sides #-}

bindCSGTorus_get_sides :: MethodBind
bindCSGTorus_get_sides
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "get_sides" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sides :: (CSGTorus :< cls, Object :< cls) => cls -> IO Int
get_sides cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_get_sides (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "get_sides" '[] (IO Int) where
        nodeMethod = Godot.Core.CSGTorus.get_sides

{-# NOINLINE bindCSGTorus_get_smooth_faces #-}

bindCSGTorus_get_smooth_faces :: MethodBind
bindCSGTorus_get_smooth_faces
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "get_smooth_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_smooth_faces ::
                   (CSGTorus :< cls, Object :< cls) => cls -> IO Bool
get_smooth_faces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_get_smooth_faces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "get_smooth_faces" '[] (IO Bool) where
        nodeMethod = Godot.Core.CSGTorus.get_smooth_faces

{-# NOINLINE bindCSGTorus_set_inner_radius #-}

bindCSGTorus_set_inner_radius :: MethodBind
bindCSGTorus_set_inner_radius
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "set_inner_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_inner_radius ::
                   (CSGTorus :< cls, Object :< cls) => cls -> Float -> IO ()
set_inner_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_set_inner_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "set_inner_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CSGTorus.set_inner_radius

{-# NOINLINE bindCSGTorus_set_material #-}

bindCSGTorus_set_material :: MethodBind
bindCSGTorus_set_material
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_material ::
               (CSGTorus :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "set_material" '[Material] (IO ())
         where
        nodeMethod = Godot.Core.CSGTorus.set_material

{-# NOINLINE bindCSGTorus_set_outer_radius #-}

bindCSGTorus_set_outer_radius :: MethodBind
bindCSGTorus_set_outer_radius
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "set_outer_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_outer_radius ::
                   (CSGTorus :< cls, Object :< cls) => cls -> Float -> IO ()
set_outer_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_set_outer_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "set_outer_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.CSGTorus.set_outer_radius

{-# NOINLINE bindCSGTorus_set_ring_sides #-}

bindCSGTorus_set_ring_sides :: MethodBind
bindCSGTorus_set_ring_sides
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "set_ring_sides" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_ring_sides ::
                 (CSGTorus :< cls, Object :< cls) => cls -> Int -> IO ()
set_ring_sides cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_set_ring_sides (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "set_ring_sides" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CSGTorus.set_ring_sides

{-# NOINLINE bindCSGTorus_set_sides #-}

bindCSGTorus_set_sides :: MethodBind
bindCSGTorus_set_sides
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "set_sides" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sides ::
            (CSGTorus :< cls, Object :< cls) => cls -> Int -> IO ()
set_sides cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_set_sides (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "set_sides" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CSGTorus.set_sides

{-# NOINLINE bindCSGTorus_set_smooth_faces #-}

bindCSGTorus_set_smooth_faces :: MethodBind
bindCSGTorus_set_smooth_faces
  = unsafePerformIO $
      withCString "CSGTorus" $
        \ clsNamePtr ->
          withCString "set_smooth_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_smooth_faces ::
                   (CSGTorus :< cls, Object :< cls) => cls -> Bool -> IO ()
set_smooth_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGTorus_set_smooth_faces (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGTorus "set_smooth_faces" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.CSGTorus.set_smooth_faces