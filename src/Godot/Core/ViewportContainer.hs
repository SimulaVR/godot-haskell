{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ViewportContainer
       (Godot.Core.ViewportContainer._input,
        Godot.Core.ViewportContainer._unhandled_input,
        Godot.Core.ViewportContainer.get_stretch_shrink,
        Godot.Core.ViewportContainer.is_stretch_enabled,
        Godot.Core.ViewportContainer.set_stretch,
        Godot.Core.ViewportContainer.set_stretch_shrink)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindViewportContainer__input #-}

bindViewportContainer__input :: MethodBind
bindViewportContainer__input
  = unsafePerformIO $
      withCString "ViewportContainer" $
        \ clsNamePtr ->
          withCString "_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_input ::
         (ViewportContainer :< cls, Object :< cls) =>
         cls -> InputEvent -> IO ()
_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewportContainer__input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewportContainer__unhandled_input #-}

bindViewportContainer__unhandled_input :: MethodBind
bindViewportContainer__unhandled_input
  = unsafePerformIO $
      withCString "ViewportContainer" $
        \ clsNamePtr ->
          withCString "_unhandled_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_unhandled_input ::
                   (ViewportContainer :< cls, Object :< cls) =>
                   cls -> InputEvent -> IO ()
_unhandled_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewportContainer__unhandled_input
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewportContainer_get_stretch_shrink #-}

-- | Divides the viewport's effective resolution by this value while preserving its scale. This can be used to speed up rendering.
--   			For example, a 1280×720 viewport with [member stretch_shrink] set to [code]2[/code] will be rendered at 640×360 while occupying the same size in the container.
--   			[b]Note:[/b] [member stretch] must be [code]true[/code] for this property to work.
bindViewportContainer_get_stretch_shrink :: MethodBind
bindViewportContainer_get_stretch_shrink
  = unsafePerformIO $
      withCString "ViewportContainer" $
        \ clsNamePtr ->
          withCString "get_stretch_shrink" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Divides the viewport's effective resolution by this value while preserving its scale. This can be used to speed up rendering.
--   			For example, a 1280×720 viewport with [member stretch_shrink] set to [code]2[/code] will be rendered at 640×360 while occupying the same size in the container.
--   			[b]Note:[/b] [member stretch] must be [code]true[/code] for this property to work.
get_stretch_shrink ::
                     (ViewportContainer :< cls, Object :< cls) => cls -> IO Int
get_stretch_shrink cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewportContainer_get_stretch_shrink
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewportContainer_is_stretch_enabled #-}

-- | If [code]true[/code], the viewport will be scaled to the control's size.
bindViewportContainer_is_stretch_enabled :: MethodBind
bindViewportContainer_is_stretch_enabled
  = unsafePerformIO $
      withCString "ViewportContainer" $
        \ clsNamePtr ->
          withCString "is_stretch_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will be scaled to the control's size.
is_stretch_enabled ::
                     (ViewportContainer :< cls, Object :< cls) => cls -> IO Bool
is_stretch_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewportContainer_is_stretch_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewportContainer_set_stretch #-}

-- | If [code]true[/code], the viewport will be scaled to the control's size.
bindViewportContainer_set_stretch :: MethodBind
bindViewportContainer_set_stretch
  = unsafePerformIO $
      withCString "ViewportContainer" $
        \ clsNamePtr ->
          withCString "set_stretch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport will be scaled to the control's size.
set_stretch ::
              (ViewportContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_stretch cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewportContainer_set_stretch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindViewportContainer_set_stretch_shrink #-}

-- | Divides the viewport's effective resolution by this value while preserving its scale. This can be used to speed up rendering.
--   			For example, a 1280×720 viewport with [member stretch_shrink] set to [code]2[/code] will be rendered at 640×360 while occupying the same size in the container.
--   			[b]Note:[/b] [member stretch] must be [code]true[/code] for this property to work.
bindViewportContainer_set_stretch_shrink :: MethodBind
bindViewportContainer_set_stretch_shrink
  = unsafePerformIO $
      withCString "ViewportContainer" $
        \ clsNamePtr ->
          withCString "set_stretch_shrink" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Divides the viewport's effective resolution by this value while preserving its scale. This can be used to speed up rendering.
--   			For example, a 1280×720 viewport with [member stretch_shrink] set to [code]2[/code] will be rendered at 640×360 while occupying the same size in the container.
--   			[b]Note:[/b] [member stretch] must be [code]true[/code] for this property to work.
set_stretch_shrink ::
                     (ViewportContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_stretch_shrink cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindViewportContainer_set_stretch_shrink
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)