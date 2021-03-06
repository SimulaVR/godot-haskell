{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisibilityNotifier2D
       (Godot.Core.VisibilityNotifier2D.sig_screen_entered,
        Godot.Core.VisibilityNotifier2D.sig_screen_exited,
        Godot.Core.VisibilityNotifier2D.sig_viewport_entered,
        Godot.Core.VisibilityNotifier2D.sig_viewport_exited,
        Godot.Core.VisibilityNotifier2D.get_rect,
        Godot.Core.VisibilityNotifier2D.is_on_screen,
        Godot.Core.VisibilityNotifier2D.set_rect)
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
import Godot.Core.Node2D()

-- | Emitted when the VisibilityNotifier2D enters the screen.
sig_screen_entered ::
                   Godot.Internal.Dispatch.Signal VisibilityNotifier2D
sig_screen_entered
  = Godot.Internal.Dispatch.Signal "screen_entered"

instance NodeSignal VisibilityNotifier2D "screen_entered" '[]

-- | Emitted when the VisibilityNotifier2D exits the screen.
sig_screen_exited ::
                  Godot.Internal.Dispatch.Signal VisibilityNotifier2D
sig_screen_exited = Godot.Internal.Dispatch.Signal "screen_exited"

instance NodeSignal VisibilityNotifier2D "screen_exited" '[]

-- | Emitted when the VisibilityNotifier2D enters a @Viewport@'s view.
sig_viewport_entered ::
                     Godot.Internal.Dispatch.Signal VisibilityNotifier2D
sig_viewport_entered
  = Godot.Internal.Dispatch.Signal "viewport_entered"

instance NodeSignal VisibilityNotifier2D "viewport_entered"
           '[Viewport]

-- | Emitted when the VisibilityNotifier2D exits a @Viewport@'s view.
sig_viewport_exited ::
                    Godot.Internal.Dispatch.Signal VisibilityNotifier2D
sig_viewport_exited
  = Godot.Internal.Dispatch.Signal "viewport_exited"

instance NodeSignal VisibilityNotifier2D "viewport_exited"
           '[Viewport]

instance NodeProperty VisibilityNotifier2D "rect" Rect2 'False
         where
        nodeProperty = (get_rect, wrapDroppingSetter set_rect, Nothing)

{-# NOINLINE bindVisibilityNotifier2D_get_rect #-}

-- | The VisibilityNotifier2D's bounding rectangle.
bindVisibilityNotifier2D_get_rect :: MethodBind
bindVisibilityNotifier2D_get_rect
  = unsafePerformIO $
      withCString "VisibilityNotifier2D" $
        \ clsNamePtr ->
          withCString "get_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The VisibilityNotifier2D's bounding rectangle.
get_rect ::
           (VisibilityNotifier2D :< cls, Object :< cls) => cls -> IO Rect2
get_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier2D_get_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier2D "get_rect" '[] (IO Rect2)
         where
        nodeMethod = Godot.Core.VisibilityNotifier2D.get_rect

{-# NOINLINE bindVisibilityNotifier2D_is_on_screen #-}

-- | If @true@, the bounding rectangle is on the screen.
--   				__Note:__ It takes one frame for the node's visibility to be assessed once added to the scene tree, so this method will return @false@ right after it is instantiated, even if it will be on screen in the draw pass.
bindVisibilityNotifier2D_is_on_screen :: MethodBind
bindVisibilityNotifier2D_is_on_screen
  = unsafePerformIO $
      withCString "VisibilityNotifier2D" $
        \ clsNamePtr ->
          withCString "is_on_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the bounding rectangle is on the screen.
--   				__Note:__ It takes one frame for the node's visibility to be assessed once added to the scene tree, so this method will return @false@ right after it is instantiated, even if it will be on screen in the draw pass.
is_on_screen ::
               (VisibilityNotifier2D :< cls, Object :< cls) => cls -> IO Bool
is_on_screen cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier2D_is_on_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier2D "is_on_screen" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisibilityNotifier2D.is_on_screen

{-# NOINLINE bindVisibilityNotifier2D_set_rect #-}

-- | The VisibilityNotifier2D's bounding rectangle.
bindVisibilityNotifier2D_set_rect :: MethodBind
bindVisibilityNotifier2D_set_rect
  = unsafePerformIO $
      withCString "VisibilityNotifier2D" $
        \ clsNamePtr ->
          withCString "set_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The VisibilityNotifier2D's bounding rectangle.
set_rect ::
           (VisibilityNotifier2D :< cls, Object :< cls) =>
           cls -> Rect2 -> IO ()
set_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier2D_set_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier2D "set_rect" '[Rect2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisibilityNotifier2D.set_rect