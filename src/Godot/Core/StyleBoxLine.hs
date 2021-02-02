{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.StyleBoxLine
       (Godot.Core.StyleBoxLine.get_color,
        Godot.Core.StyleBoxLine.get_grow_begin,
        Godot.Core.StyleBoxLine.get_grow_end,
        Godot.Core.StyleBoxLine.get_thickness,
        Godot.Core.StyleBoxLine.is_vertical,
        Godot.Core.StyleBoxLine.set_color,
        Godot.Core.StyleBoxLine.set_grow_begin,
        Godot.Core.StyleBoxLine.set_grow_end,
        Godot.Core.StyleBoxLine.set_thickness,
        Godot.Core.StyleBoxLine.set_vertical)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindStyleBoxLine_get_color #-}

bindStyleBoxLine_get_color :: MethodBind
bindStyleBoxLine_get_color
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_color ::
            (StyleBoxLine :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_get_grow_begin #-}

bindStyleBoxLine_get_grow_begin :: MethodBind
bindStyleBoxLine_get_grow_begin
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "get_grow_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_grow_begin ::
                 (StyleBoxLine :< cls, Object :< cls) => cls -> IO Float
get_grow_begin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_get_grow_begin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_get_grow_end #-}

bindStyleBoxLine_get_grow_end :: MethodBind
bindStyleBoxLine_get_grow_end
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "get_grow_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_grow_end ::
               (StyleBoxLine :< cls, Object :< cls) => cls -> IO Float
get_grow_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_get_grow_end (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_get_thickness #-}

bindStyleBoxLine_get_thickness :: MethodBind
bindStyleBoxLine_get_thickness
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "get_thickness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_thickness ::
                (StyleBoxLine :< cls, Object :< cls) => cls -> IO Int
get_thickness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_get_thickness (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_is_vertical #-}

bindStyleBoxLine_is_vertical :: MethodBind
bindStyleBoxLine_is_vertical
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "is_vertical" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_vertical ::
              (StyleBoxLine :< cls, Object :< cls) => cls -> IO Bool
is_vertical cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_is_vertical (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_set_color #-}

bindStyleBoxLine_set_color :: MethodBind
bindStyleBoxLine_set_color
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_color ::
            (StyleBoxLine :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_set_grow_begin #-}

bindStyleBoxLine_set_grow_begin :: MethodBind
bindStyleBoxLine_set_grow_begin
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_grow_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_grow_begin ::
                 (StyleBoxLine :< cls, Object :< cls) => cls -> Float -> IO ()
set_grow_begin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_set_grow_begin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_set_grow_end #-}

bindStyleBoxLine_set_grow_end :: MethodBind
bindStyleBoxLine_set_grow_end
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_grow_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_grow_end ::
               (StyleBoxLine :< cls, Object :< cls) => cls -> Float -> IO ()
set_grow_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_set_grow_end (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_set_thickness #-}

bindStyleBoxLine_set_thickness :: MethodBind
bindStyleBoxLine_set_thickness
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_thickness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_thickness ::
                (StyleBoxLine :< cls, Object :< cls) => cls -> Int -> IO ()
set_thickness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_set_thickness (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindStyleBoxLine_set_vertical #-}

bindStyleBoxLine_set_vertical :: MethodBind
bindStyleBoxLine_set_vertical
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_vertical" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_vertical ::
               (StyleBoxLine :< cls, Object :< cls) => cls -> Bool -> IO ()
set_vertical cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_set_vertical (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)