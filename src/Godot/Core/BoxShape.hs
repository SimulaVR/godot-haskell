{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.BoxShape
       (Godot.Core.BoxShape.get_extents, Godot.Core.BoxShape.set_extents)
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

instance NodeProperty BoxShape "extents" Vector3 'False where
        nodeProperty
          = (get_extents, wrapDroppingSetter set_extents, Nothing)

{-# NOINLINE bindBoxShape_get_extents #-}

-- | The box's half extents. The width, height and depth of this shape is twice the half extents.
bindBoxShape_get_extents :: MethodBind
bindBoxShape_get_extents
  = unsafePerformIO $
      withCString "BoxShape" $
        \ clsNamePtr ->
          withCString "get_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The box's half extents. The width, height and depth of this shape is twice the half extents.
get_extents ::
              (BoxShape :< cls, Object :< cls) => cls -> IO Vector3
get_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoxShape_get_extents (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BoxShape "get_extents" '[] (IO Vector3) where
        nodeMethod = Godot.Core.BoxShape.get_extents

{-# NOINLINE bindBoxShape_set_extents #-}

-- | The box's half extents. The width, height and depth of this shape is twice the half extents.
bindBoxShape_set_extents :: MethodBind
bindBoxShape_set_extents
  = unsafePerformIO $
      withCString "BoxShape" $
        \ clsNamePtr ->
          withCString "set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The box's half extents. The width, height and depth of this shape is twice the half extents.
set_extents ::
              (BoxShape :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoxShape_set_extents (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BoxShape "set_extents" '[Vector3] (IO ()) where
        nodeMethod = Godot.Core.BoxShape.set_extents