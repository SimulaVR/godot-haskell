{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RootMotionView
       (Godot.Core.RootMotionView.get_animation_path,
        Godot.Core.RootMotionView.set_animation_path,
        Godot.Core.RootMotionView.get_cell_size,
        Godot.Core.RootMotionView.set_cell_size,
        Godot.Core.RootMotionView.get_color,
        Godot.Core.RootMotionView.set_color,
        Godot.Core.RootMotionView.get_radius,
        Godot.Core.RootMotionView.set_radius,
        Godot.Core.RootMotionView.get_zero_y,
        Godot.Core.RootMotionView.set_zero_y)
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
import Godot.Core.VisualInstance()

{-# NOINLINE bindRootMotionView_get_animation_path #-}

-- | Path to an @AnimationTree@ node to use as a basis for root motion.
bindRootMotionView_get_animation_path :: MethodBind
bindRootMotionView_get_animation_path
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_animation_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Path to an @AnimationTree@ node to use as a basis for root motion.
get_animation_path ::
                     (RootMotionView :< cls, Object :< cls) => cls -> IO NodePath
get_animation_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_get_animation_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "get_animation_path" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.RootMotionView.get_animation_path

{-# NOINLINE bindRootMotionView_set_animation_path #-}

-- | Path to an @AnimationTree@ node to use as a basis for root motion.
bindRootMotionView_set_animation_path :: MethodBind
bindRootMotionView_set_animation_path
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_animation_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Path to an @AnimationTree@ node to use as a basis for root motion.
set_animation_path ::
                     (RootMotionView :< cls, Object :< cls) => cls -> NodePath -> IO ()
set_animation_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_set_animation_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "set_animation_path" '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.RootMotionView.set_animation_path

instance NodeProperty RootMotionView "animation_path" NodePath
           'False
         where
        nodeProperty
          = (get_animation_path, wrapDroppingSetter set_animation_path,
             Nothing)

{-# NOINLINE bindRootMotionView_get_cell_size #-}

-- | The grid's cell size in 3D units.
bindRootMotionView_get_cell_size :: MethodBind
bindRootMotionView_get_cell_size
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The grid's cell size in 3D units.
get_cell_size ::
                (RootMotionView :< cls, Object :< cls) => cls -> IO Float
get_cell_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_get_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "get_cell_size" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RootMotionView.get_cell_size

{-# NOINLINE bindRootMotionView_set_cell_size #-}

-- | The grid's cell size in 3D units.
bindRootMotionView_set_cell_size :: MethodBind
bindRootMotionView_set_cell_size
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The grid's cell size in 3D units.
set_cell_size ::
                (RootMotionView :< cls, Object :< cls) => cls -> Float -> IO ()
set_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_set_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "set_cell_size" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RootMotionView.set_cell_size

instance NodeProperty RootMotionView "cell_size" Float 'False where
        nodeProperty
          = (get_cell_size, wrapDroppingSetter set_cell_size, Nothing)

{-# NOINLINE bindRootMotionView_get_color #-}

-- | The grid's color.
bindRootMotionView_get_color :: MethodBind
bindRootMotionView_get_color
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The grid's color.
get_color ::
            (RootMotionView :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "get_color" '[] (IO Color) where
        nodeMethod = Godot.Core.RootMotionView.get_color

{-# NOINLINE bindRootMotionView_set_color #-}

-- | The grid's color.
bindRootMotionView_set_color :: MethodBind
bindRootMotionView_set_color
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The grid's color.
set_color ::
            (RootMotionView :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "set_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.RootMotionView.set_color

instance NodeProperty RootMotionView "color" Color 'False where
        nodeProperty = (get_color, wrapDroppingSetter set_color, Nothing)

{-# NOINLINE bindRootMotionView_get_radius #-}

-- | The grid's radius in 3D units. The grid's opacity will fade gradually as the distance from the origin increases until this @radius@ is reached.
bindRootMotionView_get_radius :: MethodBind
bindRootMotionView_get_radius
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The grid's radius in 3D units. The grid's opacity will fade gradually as the distance from the origin increases until this @radius@ is reached.
get_radius ::
             (RootMotionView :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "get_radius" '[] (IO Float)
         where
        nodeMethod = Godot.Core.RootMotionView.get_radius

{-# NOINLINE bindRootMotionView_set_radius #-}

-- | The grid's radius in 3D units. The grid's opacity will fade gradually as the distance from the origin increases until this @radius@ is reached.
bindRootMotionView_set_radius :: MethodBind
bindRootMotionView_set_radius
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The grid's radius in 3D units. The grid's opacity will fade gradually as the distance from the origin increases until this @radius@ is reached.
set_radius ::
             (RootMotionView :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "set_radius" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.RootMotionView.set_radius

instance NodeProperty RootMotionView "radius" Float 'False where
        nodeProperty = (get_radius, wrapDroppingSetter set_radius, Nothing)

{-# NOINLINE bindRootMotionView_get_zero_y #-}

-- | If @true@, the grid's points will all be on the same Y coordinate (@i@local@/i@ Y = 0). If @false@, the points' original Y coordinate is preserved.
bindRootMotionView_get_zero_y :: MethodBind
bindRootMotionView_get_zero_y
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_zero_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the grid's points will all be on the same Y coordinate (@i@local@/i@ Y = 0). If @false@, the points' original Y coordinate is preserved.
get_zero_y ::
             (RootMotionView :< cls, Object :< cls) => cls -> IO Bool
get_zero_y cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_get_zero_y (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "get_zero_y" '[] (IO Bool) where
        nodeMethod = Godot.Core.RootMotionView.get_zero_y

{-# NOINLINE bindRootMotionView_set_zero_y #-}

-- | If @true@, the grid's points will all be on the same Y coordinate (@i@local@/i@ Y = 0). If @false@, the points' original Y coordinate is preserved.
bindRootMotionView_set_zero_y :: MethodBind
bindRootMotionView_set_zero_y
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_zero_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the grid's points will all be on the same Y coordinate (@i@local@/i@ Y = 0). If @false@, the points' original Y coordinate is preserved.
set_zero_y ::
             (RootMotionView :< cls, Object :< cls) => cls -> Bool -> IO ()
set_zero_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_set_zero_y (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RootMotionView "set_zero_y" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RootMotionView.set_zero_y

instance NodeProperty RootMotionView "zero_y" Bool 'False where
        nodeProperty = (get_zero_y, wrapDroppingSetter set_zero_y, Nothing)