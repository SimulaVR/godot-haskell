{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CSGPrimitive
       (Godot.Core.CSGPrimitive.is_inverting_faces,
        Godot.Core.CSGPrimitive.set_invert_faces)
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
import Godot.Core.CSGShape()

instance NodeProperty CSGPrimitive "invert_faces" Bool 'False where
        nodeProperty
          = (is_inverting_faces, wrapDroppingSetter set_invert_faces,
             Nothing)

{-# NOINLINE bindCSGPrimitive_is_inverting_faces #-}

bindCSGPrimitive_is_inverting_faces :: MethodBind
bindCSGPrimitive_is_inverting_faces
  = unsafePerformIO $
      withCString "CSGPrimitive" $
        \ clsNamePtr ->
          withCString "is_inverting_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_inverting_faces ::
                     (CSGPrimitive :< cls, Object :< cls) => cls -> IO Bool
is_inverting_faces cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPrimitive_is_inverting_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGPrimitive "is_inverting_faces" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.CSGPrimitive.is_inverting_faces

{-# NOINLINE bindCSGPrimitive_set_invert_faces #-}

bindCSGPrimitive_set_invert_faces :: MethodBind
bindCSGPrimitive_set_invert_faces
  = unsafePerformIO $
      withCString "CSGPrimitive" $
        \ clsNamePtr ->
          withCString "set_invert_faces" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_invert_faces ::
                   (CSGPrimitive :< cls, Object :< cls) => cls -> Bool -> IO ()
set_invert_faces cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGPrimitive_set_invert_faces
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CSGPrimitive "set_invert_faces" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.CSGPrimitive.set_invert_faces