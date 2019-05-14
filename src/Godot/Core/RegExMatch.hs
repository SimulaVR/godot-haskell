{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.RegExMatch
       (Godot.Core.RegExMatch.get_subject,
        Godot.Core.RegExMatch.get_group_count,
        Godot.Core.RegExMatch.get_names, Godot.Core.RegExMatch.get_strings,
        Godot.Core.RegExMatch.get_string, Godot.Core.RegExMatch.get_start,
        Godot.Core.RegExMatch.get_end)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRegExMatch_get_subject #-}

bindRegExMatch_get_subject :: MethodBind
bindRegExMatch_get_subject
  = unsafePerformIO $
      withCString "RegExMatch" $
        \ clsNamePtr ->
          withCString "get_subject" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_subject ::
              (RegExMatch :< cls, Object :< cls) => cls -> IO GodotString
get_subject cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_subject (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegExMatch_get_group_count #-}

bindRegExMatch_get_group_count :: MethodBind
bindRegExMatch_get_group_count
  = unsafePerformIO $
      withCString "RegExMatch" $
        \ clsNamePtr ->
          withCString "get_group_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_group_count ::
                  (RegExMatch :< cls, Object :< cls) => cls -> IO Int
get_group_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_group_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegExMatch_get_names #-}

bindRegExMatch_get_names :: MethodBind
bindRegExMatch_get_names
  = unsafePerformIO $
      withCString "RegExMatch" $
        \ clsNamePtr ->
          withCString "get_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_names ::
            (RegExMatch :< cls, Object :< cls) => cls -> IO Dictionary
get_names cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_names (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegExMatch_get_strings #-}

bindRegExMatch_get_strings :: MethodBind
bindRegExMatch_get_strings
  = unsafePerformIO $
      withCString "RegExMatch" $
        \ clsNamePtr ->
          withCString "get_strings" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_strings ::
              (RegExMatch :< cls, Object :< cls) => cls -> IO Array
get_strings cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_strings (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegExMatch_get_string #-}

bindRegExMatch_get_string :: MethodBind
bindRegExMatch_get_string
  = unsafePerformIO $
      withCString "RegExMatch" $
        \ clsNamePtr ->
          withCString "get_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_string ::
             (RegExMatch :< cls, Object :< cls) =>
             cls -> GodotVariant -> IO GodotString
get_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegExMatch_get_start #-}

bindRegExMatch_get_start :: MethodBind
bindRegExMatch_get_start
  = unsafePerformIO $
      withCString "RegExMatch" $
        \ clsNamePtr ->
          withCString "get_start" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_start ::
            (RegExMatch :< cls, Object :< cls) => cls -> GodotVariant -> IO Int
get_start cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_start (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegExMatch_get_end #-}

bindRegExMatch_get_end :: MethodBind
bindRegExMatch_get_end
  = unsafePerformIO $
      withCString "RegExMatch" $
        \ clsNamePtr ->
          withCString "get_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_end ::
          (RegExMatch :< cls, Object :< cls) => cls -> GodotVariant -> IO Int
get_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_end (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)