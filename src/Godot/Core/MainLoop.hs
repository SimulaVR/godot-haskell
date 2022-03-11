{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MainLoop
       (Godot.Core.MainLoop._NOTIFICATION_WM_ABOUT,
        Godot.Core.MainLoop._NOTIFICATION_APP_PAUSED,
        Godot.Core.MainLoop._NOTIFICATION_WM_GO_BACK_REQUEST,
        Godot.Core.MainLoop._NOTIFICATION_WM_QUIT_REQUEST,
        Godot.Core.MainLoop._NOTIFICATION_WM_FOCUS_IN,
        Godot.Core.MainLoop._NOTIFICATION_WM_MOUSE_EXIT,
        Godot.Core.MainLoop._NOTIFICATION_TRANSLATION_CHANGED,
        Godot.Core.MainLoop._NOTIFICATION_WM_FOCUS_OUT,
        Godot.Core.MainLoop._NOTIFICATION_OS_MEMORY_WARNING,
        Godot.Core.MainLoop._NOTIFICATION_WM_UNFOCUS_REQUEST,
        Godot.Core.MainLoop._NOTIFICATION_OS_IME_UPDATE,
        Godot.Core.MainLoop._NOTIFICATION_APP_RESUMED,
        Godot.Core.MainLoop._NOTIFICATION_WM_MOUSE_ENTER,
        Godot.Core.MainLoop._NOTIFICATION_CRASH,
        Godot.Core.MainLoop.sig_on_request_permissions_result,
        Godot.Core.MainLoop._drop_files, Godot.Core.MainLoop._finalize,
        Godot.Core.MainLoop._global_menu_action, Godot.Core.MainLoop._idle,
        Godot.Core.MainLoop._initialize, Godot.Core.MainLoop._input_event,
        Godot.Core.MainLoop._input_text, Godot.Core.MainLoop._iteration,
        Godot.Core.MainLoop.finish, Godot.Core.MainLoop.idle,
        Godot.Core.MainLoop.init, Godot.Core.MainLoop.input_event,
        Godot.Core.MainLoop.input_text, Godot.Core.MainLoop.iteration)
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
import Godot.Core.Object()

_NOTIFICATION_WM_ABOUT :: Int
_NOTIFICATION_WM_ABOUT = 1011

_NOTIFICATION_APP_PAUSED :: Int
_NOTIFICATION_APP_PAUSED = 1015

_NOTIFICATION_WM_GO_BACK_REQUEST :: Int
_NOTIFICATION_WM_GO_BACK_REQUEST = 1007

_NOTIFICATION_WM_QUIT_REQUEST :: Int
_NOTIFICATION_WM_QUIT_REQUEST = 1006

_NOTIFICATION_WM_FOCUS_IN :: Int
_NOTIFICATION_WM_FOCUS_IN = 1004

_NOTIFICATION_WM_MOUSE_EXIT :: Int
_NOTIFICATION_WM_MOUSE_EXIT = 1003

_NOTIFICATION_TRANSLATION_CHANGED :: Int
_NOTIFICATION_TRANSLATION_CHANGED = 1010

_NOTIFICATION_WM_FOCUS_OUT :: Int
_NOTIFICATION_WM_FOCUS_OUT = 1005

_NOTIFICATION_OS_MEMORY_WARNING :: Int
_NOTIFICATION_OS_MEMORY_WARNING = 1009

_NOTIFICATION_WM_UNFOCUS_REQUEST :: Int
_NOTIFICATION_WM_UNFOCUS_REQUEST = 1008

_NOTIFICATION_OS_IME_UPDATE :: Int
_NOTIFICATION_OS_IME_UPDATE = 1013

_NOTIFICATION_APP_RESUMED :: Int
_NOTIFICATION_APP_RESUMED = 1014

_NOTIFICATION_WM_MOUSE_ENTER :: Int
_NOTIFICATION_WM_MOUSE_ENTER = 1002

_NOTIFICATION_CRASH :: Int
_NOTIFICATION_CRASH = 1012

-- | Emitted when a user responds to a permission request.
sig_on_request_permissions_result ::
                                  Godot.Internal.Dispatch.Signal MainLoop
sig_on_request_permissions_result
  = Godot.Internal.Dispatch.Signal "on_request_permissions_result"

instance NodeSignal MainLoop "on_request_permissions_result"
           '[GodotString, Bool]

{-# NOINLINE bindMainLoop__drop_files #-}

-- | Called when files are dragged from the OS file manager and dropped in the game window. The arguments are a list of file paths and the identifier of the screen where the drag originated.
bindMainLoop__drop_files :: MethodBind
bindMainLoop__drop_files
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_drop_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when files are dragged from the OS file manager and dropped in the game window. The arguments are a list of file paths and the identifier of the screen where the drag originated.
_drop_files ::
              (MainLoop :< cls, Object :< cls) =>
              cls -> PoolStringArray -> Int -> IO ()
_drop_files cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__drop_files (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "_drop_files" '[PoolStringArray, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.MainLoop._drop_files

{-# NOINLINE bindMainLoop__finalize #-}

-- | Called before the program exits.
bindMainLoop__finalize :: MethodBind
bindMainLoop__finalize
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_finalize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called before the program exits.
_finalize :: (MainLoop :< cls, Object :< cls) => cls -> IO ()
_finalize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__finalize (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "_finalize" '[] (IO ()) where
        nodeMethod = Godot.Core.MainLoop._finalize

{-# NOINLINE bindMainLoop__global_menu_action #-}

-- | Called when the user performs an action in the system global menu (e.g. the Mac OS menu bar).
bindMainLoop__global_menu_action :: MethodBind
bindMainLoop__global_menu_action
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_global_menu_action" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when the user performs an action in the system global menu (e.g. the Mac OS menu bar).
_global_menu_action ::
                      (MainLoop :< cls, Object :< cls) =>
                      cls -> GodotVariant -> GodotVariant -> IO ()
_global_menu_action cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__global_menu_action
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "_global_menu_action"
           '[GodotVariant, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.MainLoop._global_menu_action

{-# NOINLINE bindMainLoop__idle #-}

-- | Called each idle frame with the time since the last idle frame as argument (in seconds). Equivalent to @method Node._process@.
--   				If implemented, the method must return a boolean value. @true@ ends the main loop, while @false@ lets it proceed to the next frame.
bindMainLoop__idle :: MethodBind
bindMainLoop__idle
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_idle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called each idle frame with the time since the last idle frame as argument (in seconds). Equivalent to @method Node._process@.
--   				If implemented, the method must return a boolean value. @true@ ends the main loop, while @false@ lets it proceed to the next frame.
_idle ::
        (MainLoop :< cls, Object :< cls) => cls -> Float -> IO Bool
_idle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__idle (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "_idle" '[Float] (IO Bool) where
        nodeMethod = Godot.Core.MainLoop._idle

{-# NOINLINE bindMainLoop__initialize #-}

-- | Called once during initialization.
bindMainLoop__initialize :: MethodBind
bindMainLoop__initialize
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_initialize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called once during initialization.
_initialize :: (MainLoop :< cls, Object :< cls) => cls -> IO ()
_initialize cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__initialize (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "_initialize" '[] (IO ()) where
        nodeMethod = Godot.Core.MainLoop._initialize

{-# NOINLINE bindMainLoop__input_event #-}

-- | Called whenever an @InputEvent@ is received by the main loop.
bindMainLoop__input_event :: MethodBind
bindMainLoop__input_event
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called whenever an @InputEvent@ is received by the main loop.
_input_event ::
               (MainLoop :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_input_event cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__input_event (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "_input_event" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.MainLoop._input_event

{-# NOINLINE bindMainLoop__input_text #-}

-- | Deprecated callback, does not do anything. Use @method _input_event@ to parse text input. Will be removed in Godot 4.0.
bindMainLoop__input_text :: MethodBind
bindMainLoop__input_text
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_input_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deprecated callback, does not do anything. Use @method _input_event@ to parse text input. Will be removed in Godot 4.0.
_input_text ::
              (MainLoop :< cls, Object :< cls) => cls -> GodotString -> IO ()
_input_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__input_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "_input_text" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.MainLoop._input_text

{-# NOINLINE bindMainLoop__iteration #-}

-- | Called each physics frame with the time since the last physics frame as argument (@delta@, in seconds). Equivalent to @method Node._physics_process@.
--   				If implemented, the method must return a boolean value. @true@ ends the main loop, while @false@ lets it proceed to the next frame.
bindMainLoop__iteration :: MethodBind
bindMainLoop__iteration
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_iteration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called each physics frame with the time since the last physics frame as argument (@delta@, in seconds). Equivalent to @method Node._physics_process@.
--   				If implemented, the method must return a boolean value. @true@ ends the main loop, while @false@ lets it proceed to the next frame.
_iteration ::
             (MainLoop :< cls, Object :< cls) => cls -> Float -> IO Bool
_iteration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__iteration (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "_iteration" '[Float] (IO Bool) where
        nodeMethod = Godot.Core.MainLoop._iteration

{-# NOINLINE bindMainLoop_finish #-}

-- | Should not be called manually, override @method _finalize@ instead. Will be removed in Godot 4.0.
bindMainLoop_finish :: MethodBind
bindMainLoop_finish
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "finish" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Should not be called manually, override @method _finalize@ instead. Will be removed in Godot 4.0.
finish :: (MainLoop :< cls, Object :< cls) => cls -> IO ()
finish cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_finish (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "finish" '[] (IO ()) where
        nodeMethod = Godot.Core.MainLoop.finish

{-# NOINLINE bindMainLoop_idle #-}

-- | Should not be called manually, override @method _idle@ instead. Will be removed in Godot 4.0.
bindMainLoop_idle :: MethodBind
bindMainLoop_idle
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "idle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Should not be called manually, override @method _idle@ instead. Will be removed in Godot 4.0.
idle :: (MainLoop :< cls, Object :< cls) => cls -> Float -> IO Bool
idle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_idle (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "idle" '[Float] (IO Bool) where
        nodeMethod = Godot.Core.MainLoop.idle

{-# NOINLINE bindMainLoop_init #-}

-- | Should not be called manually, override @method _initialize@ instead. Will be removed in Godot 4.0.
bindMainLoop_init :: MethodBind
bindMainLoop_init
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "init" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Should not be called manually, override @method _initialize@ instead. Will be removed in Godot 4.0.
init :: (MainLoop :< cls, Object :< cls) => cls -> IO ()
init cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_init (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "init" '[] (IO ()) where
        nodeMethod = Godot.Core.MainLoop.init

{-# NOINLINE bindMainLoop_input_event #-}

-- | Should not be called manually, override @method _input_event@ instead. Will be removed in Godot 4.0.
bindMainLoop_input_event :: MethodBind
bindMainLoop_input_event
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Should not be called manually, override @method _input_event@ instead. Will be removed in Godot 4.0.
input_event ::
              (MainLoop :< cls, Object :< cls) => cls -> InputEvent -> IO ()
input_event cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_input_event (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "input_event" '[InputEvent] (IO ())
         where
        nodeMethod = Godot.Core.MainLoop.input_event

{-# NOINLINE bindMainLoop_input_text #-}

-- | Should not be called manually, override @method _input_text@ instead. Will be removed in Godot 4.0.
bindMainLoop_input_text :: MethodBind
bindMainLoop_input_text
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "input_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Should not be called manually, override @method _input_text@ instead. Will be removed in Godot 4.0.
input_text ::
             (MainLoop :< cls, Object :< cls) => cls -> GodotString -> IO ()
input_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_input_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "input_text" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.MainLoop.input_text

{-# NOINLINE bindMainLoop_iteration #-}

-- | Should not be called manually, override @method _iteration@ instead. Will be removed in Godot 4.0.
bindMainLoop_iteration :: MethodBind
bindMainLoop_iteration
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "iteration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Should not be called manually, override @method _iteration@ instead. Will be removed in Godot 4.0.
iteration ::
            (MainLoop :< cls, Object :< cls) => cls -> Float -> IO Bool
iteration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_iteration (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MainLoop "iteration" '[Float] (IO Bool) where
        nodeMethod = Godot.Core.MainLoop.iteration