{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RayShape2D
       (Godot.Core.RayShape2D.get_length,
        Godot.Core.RayShape2D.get_slips_on_slope,
        Godot.Core.RayShape2D.set_length,
        Godot.Core.RayShape2D.set_slips_on_slope)
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
import Godot.Core.Shape2D()

instance NodeProperty RayShape2D "length" Float 'False where
        nodeProperty = (get_length, wrapDroppingSetter set_length, Nothing)

instance NodeProperty RayShape2D "slips_on_slope" Bool 'False where
        nodeProperty
          = (get_slips_on_slope, wrapDroppingSetter set_slips_on_slope,
             Nothing)

{-# NOINLINE bindRayShape2D_get_length #-}

-- | The ray's length.
bindRayShape2D_get_length :: MethodBind
bindRayShape2D_get_length
  = unsafePerformIO $
      withCString "RayShape2D" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's length.
get_length :: (RayShape2D :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayShape2D_get_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RayShape2D "get_length" '[] (IO Float) where
        nodeMethod = Godot.Core.RayShape2D.get_length

{-# NOINLINE bindRayShape2D_get_slips_on_slope #-}

-- | If @true@, allow the shape to return the correct normal.
bindRayShape2D_get_slips_on_slope :: MethodBind
bindRayShape2D_get_slips_on_slope
  = unsafePerformIO $
      withCString "RayShape2D" $
        \ clsNamePtr ->
          withCString "get_slips_on_slope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, allow the shape to return the correct normal.
get_slips_on_slope ::
                     (RayShape2D :< cls, Object :< cls) => cls -> IO Bool
get_slips_on_slope cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayShape2D_get_slips_on_slope
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RayShape2D "get_slips_on_slope" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.RayShape2D.get_slips_on_slope

{-# NOINLINE bindRayShape2D_set_length #-}

-- | The ray's length.
bindRayShape2D_set_length :: MethodBind
bindRayShape2D_set_length
  = unsafePerformIO $
      withCString "RayShape2D" $
        \ clsNamePtr ->
          withCString "set_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's length.
set_length ::
             (RayShape2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayShape2D_set_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RayShape2D "set_length" '[Float] (IO ()) where
        nodeMethod = Godot.Core.RayShape2D.set_length

{-# NOINLINE bindRayShape2D_set_slips_on_slope #-}

-- | If @true@, allow the shape to return the correct normal.
bindRayShape2D_set_slips_on_slope :: MethodBind
bindRayShape2D_set_slips_on_slope
  = unsafePerformIO $
      withCString "RayShape2D" $
        \ clsNamePtr ->
          withCString "set_slips_on_slope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, allow the shape to return the correct normal.
set_slips_on_slope ::
                     (RayShape2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_slips_on_slope cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayShape2D_set_slips_on_slope
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RayShape2D "set_slips_on_slope" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.RayShape2D.set_slips_on_slope