{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.CharFXTransform
       (Godot.Core.CharFXTransform.get_absolute_index,
        Godot.Core.CharFXTransform.get_character,
        Godot.Core.CharFXTransform.get_color,
        Godot.Core.CharFXTransform.get_elapsed_time,
        Godot.Core.CharFXTransform.get_environment,
        Godot.Core.CharFXTransform.get_offset,
        Godot.Core.CharFXTransform.get_relative_index,
        Godot.Core.CharFXTransform.is_visible,
        Godot.Core.CharFXTransform.set_absolute_index,
        Godot.Core.CharFXTransform.set_character,
        Godot.Core.CharFXTransform.set_color,
        Godot.Core.CharFXTransform.set_elapsed_time,
        Godot.Core.CharFXTransform.set_environment,
        Godot.Core.CharFXTransform.set_offset,
        Godot.Core.CharFXTransform.set_relative_index,
        Godot.Core.CharFXTransform.set_visibility)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindCharFXTransform_get_absolute_index #-}

bindCharFXTransform_get_absolute_index :: MethodBind
bindCharFXTransform_get_absolute_index
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_absolute_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_absolute_index ::
                     (CharFXTransform :< cls, Object :< cls) => cls -> IO Int
get_absolute_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_absolute_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_get_character #-}

bindCharFXTransform_get_character :: MethodBind
bindCharFXTransform_get_character
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_character" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_character ::
                (CharFXTransform :< cls, Object :< cls) => cls -> IO Int
get_character cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_character
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_get_color #-}

bindCharFXTransform_get_color :: MethodBind
bindCharFXTransform_get_color
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_color ::
            (CharFXTransform :< cls, Object :< cls) => cls -> IO Color
get_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_get_elapsed_time #-}

bindCharFXTransform_get_elapsed_time :: MethodBind
bindCharFXTransform_get_elapsed_time
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_elapsed_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_elapsed_time ::
                   (CharFXTransform :< cls, Object :< cls) => cls -> IO Float
get_elapsed_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_elapsed_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_get_environment #-}

bindCharFXTransform_get_environment :: MethodBind
bindCharFXTransform_get_environment
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_environment ::
                  (CharFXTransform :< cls, Object :< cls) => cls -> IO Dictionary
get_environment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_get_offset #-}

bindCharFXTransform_get_offset :: MethodBind
bindCharFXTransform_get_offset
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_offset ::
             (CharFXTransform :< cls, Object :< cls) => cls -> IO Vector2
get_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_get_relative_index #-}

bindCharFXTransform_get_relative_index :: MethodBind
bindCharFXTransform_get_relative_index
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "get_relative_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_relative_index ::
                     (CharFXTransform :< cls, Object :< cls) => cls -> IO Int
get_relative_index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_get_relative_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_is_visible #-}

bindCharFXTransform_is_visible :: MethodBind
bindCharFXTransform_is_visible
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "is_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_visible ::
             (CharFXTransform :< cls, Object :< cls) => cls -> IO Bool
is_visible cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_is_visible (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_set_absolute_index #-}

bindCharFXTransform_set_absolute_index :: MethodBind
bindCharFXTransform_set_absolute_index
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_absolute_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_absolute_index ::
                     (CharFXTransform :< cls, Object :< cls) => cls -> Int -> IO ()
set_absolute_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_absolute_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_set_character #-}

bindCharFXTransform_set_character :: MethodBind
bindCharFXTransform_set_character
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_character" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_character ::
                (CharFXTransform :< cls, Object :< cls) => cls -> Int -> IO ()
set_character cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_character
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_set_color #-}

bindCharFXTransform_set_color :: MethodBind
bindCharFXTransform_set_color
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_color ::
            (CharFXTransform :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_set_elapsed_time #-}

bindCharFXTransform_set_elapsed_time :: MethodBind
bindCharFXTransform_set_elapsed_time
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_elapsed_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_elapsed_time ::
                   (CharFXTransform :< cls, Object :< cls) => cls -> Float -> IO ()
set_elapsed_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_elapsed_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_set_environment #-}

bindCharFXTransform_set_environment :: MethodBind
bindCharFXTransform_set_environment
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_environment ::
                  (CharFXTransform :< cls, Object :< cls) =>
                  cls -> Dictionary -> IO ()
set_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_set_offset #-}

bindCharFXTransform_set_offset :: MethodBind
bindCharFXTransform_set_offset
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_offset ::
             (CharFXTransform :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_set_relative_index #-}

bindCharFXTransform_set_relative_index :: MethodBind
bindCharFXTransform_set_relative_index
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_relative_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_relative_index ::
                     (CharFXTransform :< cls, Object :< cls) => cls -> Int -> IO ()
set_relative_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_relative_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCharFXTransform_set_visibility #-}

bindCharFXTransform_set_visibility :: MethodBind
bindCharFXTransform_set_visibility
  = unsafePerformIO $
      withCString "CharFXTransform" $
        \ clsNamePtr ->
          withCString "set_visibility" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_visibility ::
                 (CharFXTransform :< cls, Object :< cls) => cls -> Bool -> IO ()
set_visibility cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCharFXTransform_set_visibility
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)