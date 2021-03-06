{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CSGCylinder
       (Godot.Core.CSGCylinder.get_height,
        Godot.Core.CSGCylinder.get_material,
        Godot.Core.CSGCylinder.get_radius,
        Godot.Core.CSGCylinder.get_sides,
        Godot.Core.CSGCylinder.get_smooth_faces,
        Godot.Core.CSGCylinder.is_cone, Godot.Core.CSGCylinder.set_cone,
        Godot.Core.CSGCylinder.set_height,
        Godot.Core.CSGCylinder.set_material,
        Godot.Core.CSGCylinder.set_radius,
        Godot.Core.CSGCylinder.set_sides,
        Godot.Core.CSGCylinder.set_smooth_faces)
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

instance NodeProperty CSGCylinder "cone" Bool 'False where
        nodeProperty = (is_cone, wrapDroppingSetter set_cone, Nothing)

instance NodeProperty CSGCylinder "height" Float 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty CSGCylinder "material" Material 'False where
        nodeProperty
          = (get_material, wrapDroppingSetter set_material, Nothing)

instance NodeProperty CSGCylinder "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

instance NodeProperty CSGCylinder "sides" Int 'False where
        nodeProperty = (get_sides, wrapDroppingSetter set_sides, Nothing)

instance NodeProperty CSGCylinder "smooth_faces" Bool 'False where
        nodeProperty
          = (get_smooth_faces, wrapDroppingSetter set_smooth_faces, Nothing)

{-# NOINLINE bindCSGCylinder_get_height #-}

bindCSGCylinder_get_height :: MethodBind
bindCSGCylinder_get_height
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_height ::
             (CSGCylinder :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "get_height" '[] (IO Float) where
        nodeMethod = Godot.Core.CSGCylinder.get_height

{-# NOINLINE bindCSGCylinder_get_material #-}

bindCSGCylinder_get_material :: MethodBind
bindCSGCylinder_get_material
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_material ::
               (CSGCylinder :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_get_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "get_material" '[] (IO Material)
         where
        nodeMethod = Godot.Core.CSGCylinder.get_material

{-# NOINLINE bindCSGCylinder_get_radius #-}

bindCSGCylinder_get_radius :: MethodBind
bindCSGCylinder_get_radius
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_radius ::
             (CSGCylinder :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "get_radius" '[] (IO Float) where
        nodeMethod = Godot.Core.CSGCylinder.get_radius

{-# NOINLINE bindCSGCylinder_get_sides #-}

bindCSGCylinder_get_sides :: MethodBind
bindCSGCylinder_get_sides
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "get_sides" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_sides :: (CSGCylinder :< cls, Object :< cls) => cls -> IO Int
get_sides cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_get_sides (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "get_sides" '[] (IO Int) where
        nodeMethod = Godot.Core.CSGCylinder.get_sides

{-# NOINLINE bindCSGCylinder_get_smooth_faces #-}

bindCSGCylinder_get_smooth_faces :: MethodBind
bindCSGCylinder_get_smooth_faces
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "get_smooth_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_smooth_faces ::
                   (CSGCylinder :< cls, Object :< cls) => cls -> IO Bool
get_smooth_faces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_get_smooth_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "get_smooth_faces" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CSGCylinder.get_smooth_faces

{-# NOINLINE bindCSGCylinder_is_cone #-}

bindCSGCylinder_is_cone :: MethodBind
bindCSGCylinder_is_cone
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "is_cone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_cone :: (CSGCylinder :< cls, Object :< cls) => cls -> IO Bool
is_cone cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_is_cone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "is_cone" '[] (IO Bool) where
        nodeMethod = Godot.Core.CSGCylinder.is_cone

{-# NOINLINE bindCSGCylinder_set_cone #-}

bindCSGCylinder_set_cone :: MethodBind
bindCSGCylinder_set_cone
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "set_cone" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cone ::
           (CSGCylinder :< cls, Object :< cls) => cls -> Bool -> IO ()
set_cone cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_set_cone (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "set_cone" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.CSGCylinder.set_cone

{-# NOINLINE bindCSGCylinder_set_height #-}

bindCSGCylinder_set_height :: MethodBind
bindCSGCylinder_set_height
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_height ::
             (CSGCylinder :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "set_height" '[Float] (IO ()) where
        nodeMethod = Godot.Core.CSGCylinder.set_height

{-# NOINLINE bindCSGCylinder_set_material #-}

bindCSGCylinder_set_material :: MethodBind
bindCSGCylinder_set_material
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_material ::
               (CSGCylinder :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "set_material" '[Material] (IO ())
         where
        nodeMethod = Godot.Core.CSGCylinder.set_material

{-# NOINLINE bindCSGCylinder_set_radius #-}

bindCSGCylinder_set_radius :: MethodBind
bindCSGCylinder_set_radius
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_radius ::
             (CSGCylinder :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "set_radius" '[Float] (IO ()) where
        nodeMethod = Godot.Core.CSGCylinder.set_radius

{-# NOINLINE bindCSGCylinder_set_sides #-}

bindCSGCylinder_set_sides :: MethodBind
bindCSGCylinder_set_sides
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "set_sides" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_sides ::
            (CSGCylinder :< cls, Object :< cls) => cls -> Int -> IO ()
set_sides cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_set_sides (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "set_sides" '[Int] (IO ()) where
        nodeMethod = Godot.Core.CSGCylinder.set_sides

{-# NOINLINE bindCSGCylinder_set_smooth_faces #-}

bindCSGCylinder_set_smooth_faces :: MethodBind
bindCSGCylinder_set_smooth_faces
  = unsafePerformIO $
      withCString "CSGCylinder" $
        \ clsNamePtr ->
          withCString "set_smooth_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_smooth_faces ::
                   (CSGCylinder :< cls, Object :< cls) => cls -> Bool -> IO ()
set_smooth_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGCylinder_set_smooth_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGCylinder "set_smooth_faces" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.CSGCylinder.set_smooth_faces