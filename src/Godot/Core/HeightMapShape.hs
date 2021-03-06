{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.HeightMapShape
       (Godot.Core.HeightMapShape.get_map_data,
        Godot.Core.HeightMapShape.get_map_depth,
        Godot.Core.HeightMapShape.get_map_width,
        Godot.Core.HeightMapShape.set_map_data,
        Godot.Core.HeightMapShape.set_map_depth,
        Godot.Core.HeightMapShape.set_map_width)
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
import Godot.Core.Shape()

instance NodeProperty HeightMapShape "map_data" PoolRealArray
           'False
         where
        nodeProperty
          = (get_map_data, wrapDroppingSetter set_map_data, Nothing)

instance NodeProperty HeightMapShape "map_depth" Int 'False where
        nodeProperty
          = (get_map_depth, wrapDroppingSetter set_map_depth, Nothing)

instance NodeProperty HeightMapShape "map_width" Int 'False where
        nodeProperty
          = (get_map_width, wrapDroppingSetter set_map_width, Nothing)

{-# NOINLINE bindHeightMapShape_get_map_data #-}

-- | Height map data, pool array must be of @map_width@ * @map_depth@ size.
bindHeightMapShape_get_map_data :: MethodBind
bindHeightMapShape_get_map_data
  = unsafePerformIO $
      withCString "HeightMapShape" $
        \ clsNamePtr ->
          withCString "get_map_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Height map data, pool array must be of @map_width@ * @map_depth@ size.
get_map_data ::
               (HeightMapShape :< cls, Object :< cls) => cls -> IO PoolRealArray
get_map_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHeightMapShape_get_map_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HeightMapShape "get_map_data" '[]
           (IO PoolRealArray)
         where
        nodeMethod = Godot.Core.HeightMapShape.get_map_data

{-# NOINLINE bindHeightMapShape_get_map_depth #-}

-- | Depth of the height map data. Changing this will resize the @map_data@.
bindHeightMapShape_get_map_depth :: MethodBind
bindHeightMapShape_get_map_depth
  = unsafePerformIO $
      withCString "HeightMapShape" $
        \ clsNamePtr ->
          withCString "get_map_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Depth of the height map data. Changing this will resize the @map_data@.
get_map_depth ::
                (HeightMapShape :< cls, Object :< cls) => cls -> IO Int
get_map_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHeightMapShape_get_map_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HeightMapShape "get_map_depth" '[] (IO Int)
         where
        nodeMethod = Godot.Core.HeightMapShape.get_map_depth

{-# NOINLINE bindHeightMapShape_get_map_width #-}

-- | Width of the height map data. Changing this will resize the @map_data@.
bindHeightMapShape_get_map_width :: MethodBind
bindHeightMapShape_get_map_width
  = unsafePerformIO $
      withCString "HeightMapShape" $
        \ clsNamePtr ->
          withCString "get_map_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Width of the height map data. Changing this will resize the @map_data@.
get_map_width ::
                (HeightMapShape :< cls, Object :< cls) => cls -> IO Int
get_map_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHeightMapShape_get_map_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HeightMapShape "get_map_width" '[] (IO Int)
         where
        nodeMethod = Godot.Core.HeightMapShape.get_map_width

{-# NOINLINE bindHeightMapShape_set_map_data #-}

-- | Height map data, pool array must be of @map_width@ * @map_depth@ size.
bindHeightMapShape_set_map_data :: MethodBind
bindHeightMapShape_set_map_data
  = unsafePerformIO $
      withCString "HeightMapShape" $
        \ clsNamePtr ->
          withCString "set_map_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Height map data, pool array must be of @map_width@ * @map_depth@ size.
set_map_data ::
               (HeightMapShape :< cls, Object :< cls) =>
               cls -> PoolRealArray -> IO ()
set_map_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHeightMapShape_set_map_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HeightMapShape "set_map_data" '[PoolRealArray]
           (IO ())
         where
        nodeMethod = Godot.Core.HeightMapShape.set_map_data

{-# NOINLINE bindHeightMapShape_set_map_depth #-}

-- | Depth of the height map data. Changing this will resize the @map_data@.
bindHeightMapShape_set_map_depth :: MethodBind
bindHeightMapShape_set_map_depth
  = unsafePerformIO $
      withCString "HeightMapShape" $
        \ clsNamePtr ->
          withCString "set_map_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Depth of the height map data. Changing this will resize the @map_data@.
set_map_depth ::
                (HeightMapShape :< cls, Object :< cls) => cls -> Int -> IO ()
set_map_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHeightMapShape_set_map_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HeightMapShape "set_map_depth" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.HeightMapShape.set_map_depth

{-# NOINLINE bindHeightMapShape_set_map_width #-}

-- | Width of the height map data. Changing this will resize the @map_data@.
bindHeightMapShape_set_map_width :: MethodBind
bindHeightMapShape_set_map_width
  = unsafePerformIO $
      withCString "HeightMapShape" $
        \ clsNamePtr ->
          withCString "set_map_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Width of the height map data. Changing this will resize the @map_data@.
set_map_width ::
                (HeightMapShape :< cls, Object :< cls) => cls -> Int -> IO ()
set_map_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindHeightMapShape_set_map_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod HeightMapShape "set_map_width" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.HeightMapShape.set_map_width