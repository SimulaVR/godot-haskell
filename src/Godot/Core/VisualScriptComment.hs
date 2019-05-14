{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualScriptComment
       (Godot.Core.VisualScriptComment.set_title,
        Godot.Core.VisualScriptComment.get_title,
        Godot.Core.VisualScriptComment.set_description,
        Godot.Core.VisualScriptComment.get_description,
        Godot.Core.VisualScriptComment.set_size,
        Godot.Core.VisualScriptComment.get_size)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualScriptComment_set_title #-}

bindVisualScriptComment_set_title :: MethodBind
bindVisualScriptComment_set_title
  = unsafePerformIO $
      withCString "VisualScriptComment" $
        \ clsNamePtr ->
          withCString "set_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_title ::
            (VisualScriptComment :< cls, Object :< cls) =>
            cls -> GodotString -> IO ()
set_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptComment_set_title
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptComment_get_title #-}

bindVisualScriptComment_get_title :: MethodBind
bindVisualScriptComment_get_title
  = unsafePerformIO $
      withCString "VisualScriptComment" $
        \ clsNamePtr ->
          withCString "get_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_title ::
            (VisualScriptComment :< cls, Object :< cls) =>
            cls -> IO GodotString
get_title cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptComment_get_title
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptComment_set_description #-}

bindVisualScriptComment_set_description :: MethodBind
bindVisualScriptComment_set_description
  = unsafePerformIO $
      withCString "VisualScriptComment" $
        \ clsNamePtr ->
          withCString "set_description" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_description ::
                  (VisualScriptComment :< cls, Object :< cls) =>
                  cls -> GodotString -> IO ()
set_description cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptComment_set_description
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptComment_get_description #-}

bindVisualScriptComment_get_description :: MethodBind
bindVisualScriptComment_get_description
  = unsafePerformIO $
      withCString "VisualScriptComment" $
        \ clsNamePtr ->
          withCString "get_description" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_description ::
                  (VisualScriptComment :< cls, Object :< cls) =>
                  cls -> IO GodotString
get_description cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptComment_get_description
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptComment_set_size #-}

bindVisualScriptComment_set_size :: MethodBind
bindVisualScriptComment_set_size
  = unsafePerformIO $
      withCString "VisualScriptComment" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_size ::
           (VisualScriptComment :< cls, Object :< cls) =>
           cls -> Vector2 -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptComment_set_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualScriptComment_get_size #-}

bindVisualScriptComment_get_size :: MethodBind
bindVisualScriptComment_get_size
  = unsafePerformIO $
      withCString "VisualScriptComment" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_size ::
           (VisualScriptComment :< cls, Object :< cls) => cls -> IO Vector2
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptComment_get_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)