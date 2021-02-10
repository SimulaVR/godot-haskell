{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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

-- | The line's color.
bindStyleBoxLine_get_color :: MethodBind
bindStyleBoxLine_get_color
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's color.
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

-- | The number of pixels the line will extend before the [StyleBoxLine]'s bounds. If set to a negative value, the line will begin inside the [StyleBoxLine]'s bounds.
bindStyleBoxLine_get_grow_begin :: MethodBind
bindStyleBoxLine_get_grow_begin
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "get_grow_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of pixels the line will extend before the [StyleBoxLine]'s bounds. If set to a negative value, the line will begin inside the [StyleBoxLine]'s bounds.
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

-- | The number of pixels the line will extend past the [StyleBoxLine]'s bounds. If set to a negative value, the line will end inside the [StyleBoxLine]'s bounds.
bindStyleBoxLine_get_grow_end :: MethodBind
bindStyleBoxLine_get_grow_end
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "get_grow_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of pixels the line will extend past the [StyleBoxLine]'s bounds. If set to a negative value, the line will end inside the [StyleBoxLine]'s bounds.
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

-- | The line's thickness in pixels.
bindStyleBoxLine_get_thickness :: MethodBind
bindStyleBoxLine_get_thickness
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "get_thickness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's thickness in pixels.
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

-- | If [code]true[/code], the line will be vertical. If [code]false[/code], the line will be horizontal.
bindStyleBoxLine_is_vertical :: MethodBind
bindStyleBoxLine_is_vertical
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "is_vertical" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the line will be vertical. If [code]false[/code], the line will be horizontal.
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

-- | The line's color.
bindStyleBoxLine_set_color :: MethodBind
bindStyleBoxLine_set_color
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's color.
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

-- | The number of pixels the line will extend before the [StyleBoxLine]'s bounds. If set to a negative value, the line will begin inside the [StyleBoxLine]'s bounds.
bindStyleBoxLine_set_grow_begin :: MethodBind
bindStyleBoxLine_set_grow_begin
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_grow_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of pixels the line will extend before the [StyleBoxLine]'s bounds. If set to a negative value, the line will begin inside the [StyleBoxLine]'s bounds.
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

-- | The number of pixels the line will extend past the [StyleBoxLine]'s bounds. If set to a negative value, the line will end inside the [StyleBoxLine]'s bounds.
bindStyleBoxLine_set_grow_end :: MethodBind
bindStyleBoxLine_set_grow_end
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_grow_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of pixels the line will extend past the [StyleBoxLine]'s bounds. If set to a negative value, the line will end inside the [StyleBoxLine]'s bounds.
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

-- | The line's thickness in pixels.
bindStyleBoxLine_set_thickness :: MethodBind
bindStyleBoxLine_set_thickness
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_thickness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's thickness in pixels.
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

-- | If [code]true[/code], the line will be vertical. If [code]false[/code], the line will be horizontal.
bindStyleBoxLine_set_vertical :: MethodBind
bindStyleBoxLine_set_vertical
  = unsafePerformIO $
      withCString "StyleBoxLine" $
        \ clsNamePtr ->
          withCString "set_vertical" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the line will be vertical. If [code]false[/code], the line will be horizontal.
set_vertical ::
               (StyleBoxLine :< cls, Object :< cls) => cls -> Bool -> IO ()
set_vertical cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStyleBoxLine_set_vertical (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)