{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.BoxShape
       (Godot.Core.BoxShape.get_extents, Godot.Core.BoxShape.set_extents)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindBoxShape_get_extents #-}

-- | The shape's half extents.
bindBoxShape_get_extents :: MethodBind
bindBoxShape_get_extents
  = unsafePerformIO $
      withCString "BoxShape" $
        \ clsNamePtr ->
          withCString "get_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shape's half extents.
get_extents ::
              (BoxShape :< cls, Object :< cls) => cls -> IO Vector3
get_extents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoxShape_get_extents (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBoxShape_set_extents #-}

-- | The shape's half extents.
bindBoxShape_set_extents :: MethodBind
bindBoxShape_set_extents
  = unsafePerformIO $
      withCString "BoxShape" $
        \ clsNamePtr ->
          withCString "set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shape's half extents.
set_extents ::
              (BoxShape :< cls, Object :< cls) => cls -> Vector3 -> IO ()
set_extents cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoxShape_set_extents (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)