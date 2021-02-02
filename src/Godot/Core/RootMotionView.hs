{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRootMotionView_get_animation_path #-}

bindRootMotionView_get_animation_path :: MethodBind
bindRootMotionView_get_animation_path
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_animation_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindRootMotionView_set_animation_path #-}

bindRootMotionView_set_animation_path :: MethodBind
bindRootMotionView_set_animation_path
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_animation_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindRootMotionView_get_cell_size #-}

bindRootMotionView_get_cell_size :: MethodBind
bindRootMotionView_get_cell_size
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindRootMotionView_set_cell_size #-}

bindRootMotionView_set_cell_size :: MethodBind
bindRootMotionView_set_cell_size
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindRootMotionView_get_color #-}

bindRootMotionView_get_color :: MethodBind
bindRootMotionView_get_color
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_color ::
            (RootMotionView :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRootMotionView_set_color #-}

bindRootMotionView_set_color :: MethodBind
bindRootMotionView_set_color
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_color ::
            (RootMotionView :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRootMotionView_get_radius #-}

bindRootMotionView_get_radius :: MethodBind
bindRootMotionView_get_radius
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_radius ::
             (RootMotionView :< cls, Object :< cls) => cls -> IO Float
get_radius cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_get_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRootMotionView_set_radius #-}

bindRootMotionView_set_radius :: MethodBind
bindRootMotionView_set_radius
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_radius" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_radius ::
             (RootMotionView :< cls, Object :< cls) => cls -> Float -> IO ()
set_radius cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_set_radius (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRootMotionView_get_zero_y #-}

bindRootMotionView_get_zero_y :: MethodBind
bindRootMotionView_get_zero_y
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "get_zero_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_zero_y ::
             (RootMotionView :< cls, Object :< cls) => cls -> IO Bool
get_zero_y cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_get_zero_y (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRootMotionView_set_zero_y #-}

bindRootMotionView_set_zero_y :: MethodBind
bindRootMotionView_set_zero_y
  = unsafePerformIO $
      withCString "RootMotionView" $
        \ clsNamePtr ->
          withCString "set_zero_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_zero_y ::
             (RootMotionView :< cls, Object :< cls) => cls -> Bool -> IO ()
set_zero_y cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRootMotionView_set_zero_y (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)