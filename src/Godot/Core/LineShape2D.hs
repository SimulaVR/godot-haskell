{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.LineShape2D
       (Godot.Core.LineShape2D.get_d, Godot.Core.LineShape2D.get_normal,
        Godot.Core.LineShape2D.set_d, Godot.Core.LineShape2D.set_normal)
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

instance NodeProperty LineShape2D "d" Float 'False where
        nodeProperty = (get_d, wrapDroppingSetter set_d, Nothing)

instance NodeProperty LineShape2D "normal" Vector2 'False where
        nodeProperty = (get_normal, wrapDroppingSetter set_normal, Nothing)

{-# NOINLINE bindLineShape2D_get_d #-}

-- | The line's distance from the origin.
bindLineShape2D_get_d :: MethodBind
bindLineShape2D_get_d
  = unsafePerformIO $
      withCString "LineShape2D" $
        \ clsNamePtr ->
          withCString "get_d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's distance from the origin.
get_d :: (LineShape2D :< cls, Object :< cls) => cls -> IO Float
get_d cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineShape2D_get_d (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineShape2D "get_d" '[] (IO Float) where
        nodeMethod = Godot.Core.LineShape2D.get_d

{-# NOINLINE bindLineShape2D_get_normal #-}

-- | The line's normal.
bindLineShape2D_get_normal :: MethodBind
bindLineShape2D_get_normal
  = unsafePerformIO $
      withCString "LineShape2D" $
        \ clsNamePtr ->
          withCString "get_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's normal.
get_normal ::
             (LineShape2D :< cls, Object :< cls) => cls -> IO Vector2
get_normal cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineShape2D_get_normal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineShape2D "get_normal" '[] (IO Vector2) where
        nodeMethod = Godot.Core.LineShape2D.get_normal

{-# NOINLINE bindLineShape2D_set_d #-}

-- | The line's distance from the origin.
bindLineShape2D_set_d :: MethodBind
bindLineShape2D_set_d
  = unsafePerformIO $
      withCString "LineShape2D" $
        \ clsNamePtr ->
          withCString "set_d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's distance from the origin.
set_d ::
        (LineShape2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_d cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineShape2D_set_d (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineShape2D "set_d" '[Float] (IO ()) where
        nodeMethod = Godot.Core.LineShape2D.set_d

{-# NOINLINE bindLineShape2D_set_normal #-}

-- | The line's normal.
bindLineShape2D_set_normal :: MethodBind
bindLineShape2D_set_normal
  = unsafePerformIO $
      withCString "LineShape2D" $
        \ clsNamePtr ->
          withCString "set_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's normal.
set_normal ::
             (LineShape2D :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLineShape2D_set_normal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod LineShape2D "set_normal" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.LineShape2D.set_normal