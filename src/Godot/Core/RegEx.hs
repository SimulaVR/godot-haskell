{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RegEx
       (Godot.Core.RegEx.clear, Godot.Core.RegEx.compile,
        Godot.Core.RegEx.get_group_count, Godot.Core.RegEx.get_names,
        Godot.Core.RegEx.get_pattern, Godot.Core.RegEx.is_valid,
        Godot.Core.RegEx.search, Godot.Core.RegEx.search_all,
        Godot.Core.RegEx.sub)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRegEx_clear #-}

bindRegEx_clear :: MethodBind
bindRegEx_clear
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear :: (RegEx :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_clear (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegEx_compile #-}

bindRegEx_compile :: MethodBind
bindRegEx_compile
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "compile" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

compile ::
          (RegEx :< cls, Object :< cls) => cls -> GodotString -> IO Int
compile cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_compile (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegEx_get_group_count #-}

bindRegEx_get_group_count :: MethodBind
bindRegEx_get_group_count
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "get_group_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_group_count :: (RegEx :< cls, Object :< cls) => cls -> IO Int
get_group_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_get_group_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegEx_get_names #-}

bindRegEx_get_names :: MethodBind
bindRegEx_get_names
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "get_names" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_names :: (RegEx :< cls, Object :< cls) => cls -> IO Array
get_names cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_get_names (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegEx_get_pattern #-}

bindRegEx_get_pattern :: MethodBind
bindRegEx_get_pattern
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "get_pattern" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_pattern ::
              (RegEx :< cls, Object :< cls) => cls -> IO GodotString
get_pattern cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_get_pattern (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegEx_is_valid #-}

bindRegEx_is_valid :: MethodBind
bindRegEx_is_valid
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_valid :: (RegEx :< cls, Object :< cls) => cls -> IO Bool
is_valid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_is_valid (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegEx_search #-}

bindRegEx_search :: MethodBind
bindRegEx_search
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "search" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

search ::
         (RegEx :< cls, Object :< cls) =>
         cls -> GodotString -> Int -> Int -> IO RegExMatch
search cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_search (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegEx_search_all #-}

bindRegEx_search_all :: MethodBind
bindRegEx_search_all
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "search_all" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

search_all ::
             (RegEx :< cls, Object :< cls) =>
             cls -> GodotString -> Int -> Int -> IO Array
search_all cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_search_all (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRegEx_sub #-}

bindRegEx_sub :: MethodBind
bindRegEx_sub
  = unsafePerformIO $
      withCString "RegEx" $
        \ clsNamePtr ->
          withCString "sub" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

sub ::
      (RegEx :< cls, Object :< cls) =>
      cls ->
        GodotString -> GodotString -> Bool -> Int -> Int -> IO GodotString
sub cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegEx_sub (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)