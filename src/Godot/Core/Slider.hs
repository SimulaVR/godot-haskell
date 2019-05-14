{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Slider
       (Godot.Core.Slider.get_focus_mode,
        Godot.Core.Slider.set_focus_mode, Godot.Core.Slider._gui_input,
        Godot.Core.Slider.set_ticks, Godot.Core.Slider.get_ticks,
        Godot.Core.Slider.get_ticks_on_borders,
        Godot.Core.Slider.set_ticks_on_borders,
        Godot.Core.Slider.set_editable, Godot.Core.Slider.is_editable,
        Godot.Core.Slider.set_scrollable, Godot.Core.Slider.is_scrollable)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSlider_get_focus_mode #-}

bindSlider_get_focus_mode :: MethodBind
bindSlider_get_focus_mode
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "get_focus_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_focus_mode :: (Slider :< cls, Object :< cls) => cls -> IO Int
get_focus_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_get_focus_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_set_focus_mode #-}

bindSlider_set_focus_mode :: MethodBind
bindSlider_set_focus_mode
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "set_focus_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_focus_mode ::
                 (Slider :< cls, Object :< cls) => cls -> Int -> IO ()
set_focus_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_set_focus_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider__gui_input #-}

bindSlider__gui_input :: MethodBind
bindSlider__gui_input
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (Slider :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_set_ticks #-}

-- | Number of ticks displayed on the slider, including border ticks. Ticks are uniformly-distributed value markers.
bindSlider_set_ticks :: MethodBind
bindSlider_set_ticks
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "set_ticks" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of ticks displayed on the slider, including border ticks. Ticks are uniformly-distributed value markers.
set_ticks :: (Slider :< cls, Object :< cls) => cls -> Int -> IO ()
set_ticks cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_set_ticks (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_get_ticks #-}

-- | Number of ticks displayed on the slider, including border ticks. Ticks are uniformly-distributed value markers.
bindSlider_get_ticks :: MethodBind
bindSlider_get_ticks
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "get_ticks" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of ticks displayed on the slider, including border ticks. Ticks are uniformly-distributed value markers.
get_ticks :: (Slider :< cls, Object :< cls) => cls -> IO Int
get_ticks cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_get_ticks (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_get_ticks_on_borders #-}

-- | If [code]true[/code], the slider will display ticks for minimum and maximum values.
bindSlider_get_ticks_on_borders :: MethodBind
bindSlider_get_ticks_on_borders
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "get_ticks_on_borders" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the slider will display ticks for minimum and maximum values.
get_ticks_on_borders ::
                       (Slider :< cls, Object :< cls) => cls -> IO Bool
get_ticks_on_borders cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_get_ticks_on_borders (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_set_ticks_on_borders #-}

-- | If [code]true[/code], the slider will display ticks for minimum and maximum values.
bindSlider_set_ticks_on_borders :: MethodBind
bindSlider_set_ticks_on_borders
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "set_ticks_on_borders" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the slider will display ticks for minimum and maximum values.
set_ticks_on_borders ::
                       (Slider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ticks_on_borders cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_set_ticks_on_borders (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_set_editable #-}

-- | If [code]true[/code], the slider can be interacted with. If [code]false[/code], the value can be changed only by code.
bindSlider_set_editable :: MethodBind
bindSlider_set_editable
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "set_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the slider can be interacted with. If [code]false[/code], the value can be changed only by code.
set_editable ::
               (Slider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_set_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_is_editable #-}

-- | If [code]true[/code], the slider can be interacted with. If [code]false[/code], the value can be changed only by code.
bindSlider_is_editable :: MethodBind
bindSlider_is_editable
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "is_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the slider can be interacted with. If [code]false[/code], the value can be changed only by code.
is_editable :: (Slider :< cls, Object :< cls) => cls -> IO Bool
is_editable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_is_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_set_scrollable #-}

-- | If [code]true[/code], the value can be changed using the mouse wheel.
bindSlider_set_scrollable :: MethodBind
bindSlider_set_scrollable
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "set_scrollable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the value can be changed using the mouse wheel.
set_scrollable ::
                 (Slider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_scrollable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_set_scrollable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSlider_is_scrollable #-}

-- | If [code]true[/code], the value can be changed using the mouse wheel.
bindSlider_is_scrollable :: MethodBind
bindSlider_is_scrollable
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "is_scrollable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the value can be changed using the mouse wheel.
is_scrollable :: (Slider :< cls, Object :< cls) => cls -> IO Bool
is_scrollable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_is_scrollable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)