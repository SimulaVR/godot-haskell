{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.LineShape2D
       (Godot.Core.LineShape2D.get_d, Godot.Core.LineShape2D.get_normal,
        Godot.Core.LineShape2D.set_d, Godot.Core.LineShape2D.set_normal)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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