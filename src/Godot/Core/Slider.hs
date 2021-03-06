{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Slider
       (Godot.Core.Slider._gui_input, Godot.Core.Slider.get_ticks,
        Godot.Core.Slider.get_ticks_on_borders,
        Godot.Core.Slider.is_editable, Godot.Core.Slider.is_scrollable,
        Godot.Core.Slider.set_editable, Godot.Core.Slider.set_scrollable,
        Godot.Core.Slider.set_ticks,
        Godot.Core.Slider.set_ticks_on_borders)
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
import Godot.Core.Range()

instance NodeProperty Slider "editable" Bool 'False where
        nodeProperty
          = (is_editable, wrapDroppingSetter set_editable, Nothing)

instance NodeProperty Slider "scrollable" Bool 'False where
        nodeProperty
          = (is_scrollable, wrapDroppingSetter set_scrollable, Nothing)

instance NodeProperty Slider "tick_count" Int 'False where
        nodeProperty = (get_ticks, wrapDroppingSetter set_ticks, Nothing)

instance NodeProperty Slider "ticks_on_borders" Bool 'False where
        nodeProperty
          = (get_ticks_on_borders, wrapDroppingSetter set_ticks_on_borders,
             Nothing)

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

instance NodeMethod Slider "_gui_input" '[InputEvent] (IO ()) where
        nodeMethod = Godot.Core.Slider._gui_input

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

instance NodeMethod Slider "get_ticks" '[] (IO Int) where
        nodeMethod = Godot.Core.Slider.get_ticks

{-# NOINLINE bindSlider_get_ticks_on_borders #-}

-- | If @true@, the slider will display ticks for minimum and maximum values.
bindSlider_get_ticks_on_borders :: MethodBind
bindSlider_get_ticks_on_borders
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "get_ticks_on_borders" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the slider will display ticks for minimum and maximum values.
get_ticks_on_borders ::
                       (Slider :< cls, Object :< cls) => cls -> IO Bool
get_ticks_on_borders cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_get_ticks_on_borders (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Slider "get_ticks_on_borders" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Slider.get_ticks_on_borders

{-# NOINLINE bindSlider_is_editable #-}

-- | If @true@, the slider can be interacted with. If @false@, the value can be changed only by code.
bindSlider_is_editable :: MethodBind
bindSlider_is_editable
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "is_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the slider can be interacted with. If @false@, the value can be changed only by code.
is_editable :: (Slider :< cls, Object :< cls) => cls -> IO Bool
is_editable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_is_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Slider "is_editable" '[] (IO Bool) where
        nodeMethod = Godot.Core.Slider.is_editable

{-# NOINLINE bindSlider_is_scrollable #-}

-- | If @true@, the value can be changed using the mouse wheel.
bindSlider_is_scrollable :: MethodBind
bindSlider_is_scrollable
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "is_scrollable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the value can be changed using the mouse wheel.
is_scrollable :: (Slider :< cls, Object :< cls) => cls -> IO Bool
is_scrollable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_is_scrollable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Slider "is_scrollable" '[] (IO Bool) where
        nodeMethod = Godot.Core.Slider.is_scrollable

{-# NOINLINE bindSlider_set_editable #-}

-- | If @true@, the slider can be interacted with. If @false@, the value can be changed only by code.
bindSlider_set_editable :: MethodBind
bindSlider_set_editable
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "set_editable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the slider can be interacted with. If @false@, the value can be changed only by code.
set_editable ::
               (Slider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_set_editable (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Slider "set_editable" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Slider.set_editable

{-# NOINLINE bindSlider_set_scrollable #-}

-- | If @true@, the value can be changed using the mouse wheel.
bindSlider_set_scrollable :: MethodBind
bindSlider_set_scrollable
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "set_scrollable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the value can be changed using the mouse wheel.
set_scrollable ::
                 (Slider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_scrollable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_set_scrollable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Slider "set_scrollable" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Slider.set_scrollable

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

instance NodeMethod Slider "set_ticks" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Slider.set_ticks

{-# NOINLINE bindSlider_set_ticks_on_borders #-}

-- | If @true@, the slider will display ticks for minimum and maximum values.
bindSlider_set_ticks_on_borders :: MethodBind
bindSlider_set_ticks_on_borders
  = unsafePerformIO $
      withCString "Slider" $
        \ clsNamePtr ->
          withCString "set_ticks_on_borders" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the slider will display ticks for minimum and maximum values.
set_ticks_on_borders ::
                       (Slider :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ticks_on_borders cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSlider_set_ticks_on_borders (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Slider "set_ticks_on_borders" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Slider.set_ticks_on_borders