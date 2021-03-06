{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.RegExMatch
       (Godot.Core.RegExMatch.get_end,
        Godot.Core.RegExMatch.get_group_count,
        Godot.Core.RegExMatch.get_names, Godot.Core.RegExMatch.get_start,
        Godot.Core.RegExMatch.get_string,
        Godot.Core.RegExMatch.get_strings,
        Godot.Core.RegExMatch.get_subject)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Reference()

instance NodeProperty RegExMatch "names" Dictionary 'True where
        nodeProperty = (get_names, (), Nothing)

instance NodeProperty RegExMatch "strings" Array 'True where
        nodeProperty = (get_strings, (), Nothing)

instance NodeProperty RegExMatch "subject" GodotString 'True where
        nodeProperty = (get_subject, (), Nothing)

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
          (RegExMatch :< cls, Object :< cls) =>
          cls -> Maybe GodotVariant -> IO Int
get_end cls arg1
  = withVariantArray [maybe (VariantInt 0) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_end (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RegExMatch "get_end" '[Maybe GodotVariant]
           (IO Int)
         where
        nodeMethod = Godot.Core.RegExMatch.get_end

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

instance NodeMethod RegExMatch "get_group_count" '[] (IO Int) where
        nodeMethod = Godot.Core.RegExMatch.get_group_count

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

instance NodeMethod RegExMatch "get_names" '[] (IO Dictionary)
         where
        nodeMethod = Godot.Core.RegExMatch.get_names

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
            (RegExMatch :< cls, Object :< cls) =>
            cls -> Maybe GodotVariant -> IO Int
get_start cls arg1
  = withVariantArray [maybe (VariantInt 0) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_start (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RegExMatch "get_start" '[Maybe GodotVariant]
           (IO Int)
         where
        nodeMethod = Godot.Core.RegExMatch.get_start

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
             cls -> Maybe GodotVariant -> IO GodotString
get_string cls arg1
  = withVariantArray [maybe (VariantInt 0) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRegExMatch_get_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod RegExMatch "get_string" '[Maybe GodotVariant]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.RegExMatch.get_string

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

instance NodeMethod RegExMatch "get_strings" '[] (IO Array) where
        nodeMethod = Godot.Core.RegExMatch.get_strings

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

instance NodeMethod RegExMatch "get_subject" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.RegExMatch.get_subject