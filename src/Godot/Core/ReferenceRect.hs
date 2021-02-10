{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ReferenceRect
       (Godot.Core.ReferenceRect.get_border_color,
        Godot.Core.ReferenceRect.get_editor_only,
        Godot.Core.ReferenceRect.set_border_color,
        Godot.Core.ReferenceRect.set_editor_only)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindReferenceRect_get_border_color #-}

-- | Sets the border [Color] of the [ReferenceRect].
bindReferenceRect_get_border_color :: MethodBind
bindReferenceRect_get_border_color
  = unsafePerformIO $
      withCString "ReferenceRect" $
        \ clsNamePtr ->
          withCString "get_border_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the border [Color] of the [ReferenceRect].
get_border_color ::
                   (ReferenceRect :< cls, Object :< cls) => cls -> IO Color
get_border_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReferenceRect_get_border_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReferenceRect_get_editor_only #-}

-- | If set to [code]true[/code], the [ReferenceRect] will only be visible while in editor. Otherwise, [ReferenceRect] will be visible in game.
bindReferenceRect_get_editor_only :: MethodBind
bindReferenceRect_get_editor_only
  = unsafePerformIO $
      withCString "ReferenceRect" $
        \ clsNamePtr ->
          withCString "get_editor_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set to [code]true[/code], the [ReferenceRect] will only be visible while in editor. Otherwise, [ReferenceRect] will be visible in game.
get_editor_only ::
                  (ReferenceRect :< cls, Object :< cls) => cls -> IO Bool
get_editor_only cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReferenceRect_get_editor_only
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReferenceRect_set_border_color #-}

-- | Sets the border [Color] of the [ReferenceRect].
bindReferenceRect_set_border_color :: MethodBind
bindReferenceRect_set_border_color
  = unsafePerformIO $
      withCString "ReferenceRect" $
        \ clsNamePtr ->
          withCString "set_border_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the border [Color] of the [ReferenceRect].
set_border_color ::
                   (ReferenceRect :< cls, Object :< cls) => cls -> Color -> IO ()
set_border_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReferenceRect_set_border_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReferenceRect_set_editor_only #-}

-- | If set to [code]true[/code], the [ReferenceRect] will only be visible while in editor. Otherwise, [ReferenceRect] will be visible in game.
bindReferenceRect_set_editor_only :: MethodBind
bindReferenceRect_set_editor_only
  = unsafePerformIO $
      withCString "ReferenceRect" $
        \ clsNamePtr ->
          withCString "set_editor_only" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set to [code]true[/code], the [ReferenceRect] will only be visible while in editor. Otherwise, [ReferenceRect] will be visible in game.
set_editor_only ::
                  (ReferenceRect :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editor_only cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReferenceRect_set_editor_only
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)