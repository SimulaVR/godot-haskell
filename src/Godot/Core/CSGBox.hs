{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CSGBox
       (Godot.Core.CSGBox.get_depth, Godot.Core.CSGBox.get_height,
        Godot.Core.CSGBox.get_material, Godot.Core.CSGBox.get_width,
        Godot.Core.CSGBox.set_depth, Godot.Core.CSGBox.set_height,
        Godot.Core.CSGBox.set_material, Godot.Core.CSGBox.set_width)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCSGBox_get_depth #-}

bindCSGBox_get_depth :: MethodBind
bindCSGBox_get_depth
  = unsafePerformIO $
      withCString "CSGBox" $
        \ clsNamePtr ->
          withCString "get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_depth :: (CSGBox :< cls, Object :< cls) => cls -> IO Float
get_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGBox_get_depth (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGBox_get_height #-}

bindCSGBox_get_height :: MethodBind
bindCSGBox_get_height
  = unsafePerformIO $
      withCString "CSGBox" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_height :: (CSGBox :< cls, Object :< cls) => cls -> IO Float
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGBox_get_height (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGBox_get_material #-}

bindCSGBox_get_material :: MethodBind
bindCSGBox_get_material
  = unsafePerformIO $
      withCString "CSGBox" $
        \ clsNamePtr ->
          withCString "get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_material ::
               (CSGBox :< cls, Object :< cls) => cls -> IO Material
get_material cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGBox_get_material (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGBox_get_width #-}

bindCSGBox_get_width :: MethodBind
bindCSGBox_get_width
  = unsafePerformIO $
      withCString "CSGBox" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_width :: (CSGBox :< cls, Object :< cls) => cls -> IO Float
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGBox_get_width (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGBox_set_depth #-}

bindCSGBox_set_depth :: MethodBind
bindCSGBox_set_depth
  = unsafePerformIO $
      withCString "CSGBox" $
        \ clsNamePtr ->
          withCString "set_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_depth ::
            (CSGBox :< cls, Object :< cls) => cls -> Float -> IO ()
set_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGBox_set_depth (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGBox_set_height #-}

bindCSGBox_set_height :: MethodBind
bindCSGBox_set_height
  = unsafePerformIO $
      withCString "CSGBox" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_height ::
             (CSGBox :< cls, Object :< cls) => cls -> Float -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGBox_set_height (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGBox_set_material #-}

bindCSGBox_set_material :: MethodBind
bindCSGBox_set_material
  = unsafePerformIO $
      withCString "CSGBox" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_material ::
               (CSGBox :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGBox_set_material (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCSGBox_set_width #-}

bindCSGBox_set_width :: MethodBind
bindCSGBox_set_width
  = unsafePerformIO $
      withCString "CSGBox" $
        \ clsNamePtr ->
          withCString "set_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_width ::
            (CSGBox :< cls, Object :< cls) => cls -> Float -> IO ()
set_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCSGBox_set_width (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)