{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CSGPrimitive
       (Godot.Core.CSGPrimitive.set_invert_faces,
        Godot.Core.CSGPrimitive.is_inverting_faces)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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