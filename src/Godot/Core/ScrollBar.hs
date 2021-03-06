{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ScrollBar
       (Godot.Core.ScrollBar.sig_scrolling,
        Godot.Core.ScrollBar._drag_node_exit,
        Godot.Core.ScrollBar._drag_node_input,
        Godot.Core.ScrollBar._gui_input,
        Godot.Core.ScrollBar.get_custom_step,
        Godot.Core.ScrollBar.set_custom_step)
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

-- | Emitted when the scrollbar is being scrolled.
sig_scrolling :: Godot.Internal.Dispatch.Signal ScrollBar
sig_scrolling = Godot.Internal.Dispatch.Signal "scrolling"

instance NodeSignal ScrollBar "scrolling" '[]

instance NodeProperty ScrollBar "custom_step" Float 'False where
        nodeProperty
          = (get_custom_step, wrapDroppingSetter set_custom_step, Nothing)

{-# NOINLINE bindScrollBar__drag_node_exit #-}

bindScrollBar__drag_node_exit :: MethodBind
bindScrollBar__drag_node_exit
  = unsafePerformIO $
      withCString "ScrollBar" $
        \ clsNamePtr ->
          withCString "_drag_node_exit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_drag_node_exit ::
                  (ScrollBar :< cls, Object :< cls) => cls -> IO ()
_drag_node_exit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollBar__drag_node_exit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ScrollBar "_drag_node_exit" '[] (IO ()) where
        nodeMethod = Godot.Core.ScrollBar._drag_node_exit

{-# NOINLINE bindScrollBar__drag_node_input #-}

bindScrollBar__drag_node_input :: MethodBind
bindScrollBar__drag_node_input
  = unsafePerformIO $
      withCString "ScrollBar" $
        \ clsNamePtr ->
          withCString "_drag_node_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_drag_node_input ::
                   (ScrollBar :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_drag_node_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollBar__drag_node_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ScrollBar "_drag_node_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.ScrollBar._drag_node_input

{-# NOINLINE bindScrollBar__gui_input #-}

bindScrollBar__gui_input :: MethodBind
bindScrollBar__gui_input
  = unsafePerformIO $
      withCString "ScrollBar" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (ScrollBar :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollBar__gui_input (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ScrollBar "_gui_input" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.ScrollBar._gui_input

{-# NOINLINE bindScrollBar_get_custom_step #-}

-- | Overrides the step used when clicking increment and decrement buttons or when using arrow keys when the @ScrollBar@ is focused.
bindScrollBar_get_custom_step :: MethodBind
bindScrollBar_get_custom_step
  = unsafePerformIO $
      withCString "ScrollBar" $
        \ clsNamePtr ->
          withCString "get_custom_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the step used when clicking increment and decrement buttons or when using arrow keys when the @ScrollBar@ is focused.
get_custom_step ::
                  (ScrollBar :< cls, Object :< cls) => cls -> IO Float
get_custom_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollBar_get_custom_step (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ScrollBar "get_custom_step" '[] (IO Float)
         where
        nodeMethod = Godot.Core.ScrollBar.get_custom_step

{-# NOINLINE bindScrollBar_set_custom_step #-}

-- | Overrides the step used when clicking increment and decrement buttons or when using arrow keys when the @ScrollBar@ is focused.
bindScrollBar_set_custom_step :: MethodBind
bindScrollBar_set_custom_step
  = unsafePerformIO $
      withCString "ScrollBar" $
        \ clsNamePtr ->
          withCString "set_custom_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overrides the step used when clicking increment and decrement buttons or when using arrow keys when the @ScrollBar@ is focused.
set_custom_step ::
                  (ScrollBar :< cls, Object :< cls) => cls -> Float -> IO ()
set_custom_step cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindScrollBar_set_custom_step (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ScrollBar "set_custom_step" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.ScrollBar.set_custom_step