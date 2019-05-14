{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.BoxContainer
       (Godot.Core.BoxContainer._ALIGN_END,
        Godot.Core.BoxContainer._ALIGN_BEGIN,
        Godot.Core.BoxContainer._ALIGN_CENTER,
        Godot.Core.BoxContainer.add_spacer,
        Godot.Core.BoxContainer.get_alignment,
        Godot.Core.BoxContainer.set_alignment)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ALIGN_END :: Int
_ALIGN_END = 2

_ALIGN_BEGIN :: Int
_ALIGN_BEGIN = 0

_ALIGN_CENTER :: Int
_ALIGN_CENTER = 1

{-# NOINLINE bindBoxContainer_add_spacer #-}

-- | Adds a control to the box as a spacer. If [code]true[/code], [i]begin[/i] will insert the spacer control in front of other children.
bindBoxContainer_add_spacer :: MethodBind
bindBoxContainer_add_spacer
  = unsafePerformIO $
      withCString "BoxContainer" $
        \ clsNamePtr ->
          withCString "add_spacer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a control to the box as a spacer. If [code]true[/code], [i]begin[/i] will insert the spacer control in front of other children.
add_spacer ::
             (BoxContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
add_spacer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoxContainer_add_spacer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBoxContainer_get_alignment #-}

-- | The alignment of the container's children (must be one of ALIGN_BEGIN, ALIGN_CENTER, or ALIGN_END).
bindBoxContainer_get_alignment :: MethodBind
bindBoxContainer_get_alignment
  = unsafePerformIO $
      withCString "BoxContainer" $
        \ clsNamePtr ->
          withCString "get_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of the container's children (must be one of ALIGN_BEGIN, ALIGN_CENTER, or ALIGN_END).
get_alignment ::
                (BoxContainer :< cls, Object :< cls) => cls -> IO Int
get_alignment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoxContainer_get_alignment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBoxContainer_set_alignment #-}

-- | The alignment of the container's children (must be one of ALIGN_BEGIN, ALIGN_CENTER, or ALIGN_END).
bindBoxContainer_set_alignment :: MethodBind
bindBoxContainer_set_alignment
  = unsafePerformIO $
      withCString "BoxContainer" $
        \ clsNamePtr ->
          withCString "set_alignment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The alignment of the container's children (must be one of ALIGN_BEGIN, ALIGN_CENTER, or ALIGN_END).
set_alignment ::
                (BoxContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_alignment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoxContainer_set_alignment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)