{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.MainLoop
       (Godot.Core.MainLoop._NOTIFICATION_WM_ABOUT,
        Godot.Core.MainLoop._NOTIFICATION_WM_GO_BACK_REQUEST,
        Godot.Core.MainLoop._NOTIFICATION_WM_QUIT_REQUEST,
        Godot.Core.MainLoop._NOTIFICATION_WM_FOCUS_IN,
        Godot.Core.MainLoop._NOTIFICATION_WM_MOUSE_EXIT,
        Godot.Core.MainLoop._NOTIFICATION_TRANSLATION_CHANGED,
        Godot.Core.MainLoop._NOTIFICATION_WM_FOCUS_OUT,
        Godot.Core.MainLoop._NOTIFICATION_OS_MEMORY_WARNING,
        Godot.Core.MainLoop._NOTIFICATION_WM_UNFOCUS_REQUEST,
        Godot.Core.MainLoop._NOTIFICATION_OS_IME_UPDATE,
        Godot.Core.MainLoop._NOTIFICATION_WM_MOUSE_ENTER,
        Godot.Core.MainLoop._NOTIFICATION_CRASH,
        Godot.Core.MainLoop._input_event, Godot.Core.MainLoop._input_text,
        Godot.Core.MainLoop._initialize, Godot.Core.MainLoop._iteration,
        Godot.Core.MainLoop._idle, Godot.Core.MainLoop._drop_files,
        Godot.Core.MainLoop._finalize, Godot.Core.MainLoop.input_event,
        Godot.Core.MainLoop.input_text, Godot.Core.MainLoop.init,
        Godot.Core.MainLoop.iteration, Godot.Core.MainLoop.idle,
        Godot.Core.MainLoop.finish)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_NOTIFICATION_WM_ABOUT :: Int
_NOTIFICATION_WM_ABOUT = 91

_NOTIFICATION_WM_GO_BACK_REQUEST :: Int
_NOTIFICATION_WM_GO_BACK_REQUEST = 7

_NOTIFICATION_WM_QUIT_REQUEST :: Int
_NOTIFICATION_WM_QUIT_REQUEST = 6

_NOTIFICATION_WM_FOCUS_IN :: Int
_NOTIFICATION_WM_FOCUS_IN = 4

_NOTIFICATION_WM_MOUSE_EXIT :: Int
_NOTIFICATION_WM_MOUSE_EXIT = 3

_NOTIFICATION_TRANSLATION_CHANGED :: Int
_NOTIFICATION_TRANSLATION_CHANGED = 90

_NOTIFICATION_WM_FOCUS_OUT :: Int
_NOTIFICATION_WM_FOCUS_OUT = 5

_NOTIFICATION_OS_MEMORY_WARNING :: Int
_NOTIFICATION_OS_MEMORY_WARNING = 9

_NOTIFICATION_WM_UNFOCUS_REQUEST :: Int
_NOTIFICATION_WM_UNFOCUS_REQUEST = 8

_NOTIFICATION_OS_IME_UPDATE :: Int
_NOTIFICATION_OS_IME_UPDATE = 93

_NOTIFICATION_WM_MOUSE_ENTER :: Int
_NOTIFICATION_WM_MOUSE_ENTER = 2

_NOTIFICATION_CRASH :: Int
_NOTIFICATION_CRASH = 92

{-# NOINLINE bindMainLoop__input_event #-}

bindMainLoop__input_event :: MethodBind
bindMainLoop__input_event
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_input_event ::
               (MainLoop :< cls, Object :< cls) => cls -> InputEvent -> IO ()
_input_event cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__input_event (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMainLoop__input_text #-}

bindMainLoop__input_text :: MethodBind
bindMainLoop__input_text
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_input_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_input_text ::
              (MainLoop :< cls, Object :< cls) => cls -> GodotString -> IO ()
_input_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__input_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindMainLoop__iteration #-}

bindMainLoop__iteration :: MethodBind
bindMainLoop__iteration
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_iteration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_iteration ::
             (MainLoop :< cls, Object :< cls) => cls -> Float -> IO ()
_iteration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__iteration (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMainLoop__idle #-}

-- | Called each idle frame with time since last call as an only argument.
bindMainLoop__idle :: MethodBind
bindMainLoop__idle
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_idle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called each idle frame with time since last call as an only argument.
_idle :: (MainLoop :< cls, Object :< cls) => cls -> Float -> IO ()
_idle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__idle (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMainLoop__drop_files #-}

bindMainLoop__drop_files :: MethodBind
bindMainLoop__drop_files
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "_drop_files" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_drop_files ::
              (MainLoop :< cls, Object :< cls) =>
              cls -> PoolStringArray -> Int -> IO ()
_drop_files cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop__drop_files (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindMainLoop_input_event #-}

bindMainLoop_input_event :: MethodBind
bindMainLoop_input_event
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "input_event" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

input_event ::
              (MainLoop :< cls, Object :< cls) => cls -> InputEvent -> IO ()
input_event cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_input_event (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMainLoop_input_text #-}

bindMainLoop_input_text :: MethodBind
bindMainLoop_input_text
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "input_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

input_text ::
             (MainLoop :< cls, Object :< cls) => cls -> GodotString -> IO ()
input_text cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_input_text (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMainLoop_init #-}

bindMainLoop_init :: MethodBind
bindMainLoop_init
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "init" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

init :: (MainLoop :< cls, Object :< cls) => cls -> IO ()
init cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_init (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMainLoop_iteration #-}

bindMainLoop_iteration :: MethodBind
bindMainLoop_iteration
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "iteration" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

iteration ::
            (MainLoop :< cls, Object :< cls) => cls -> Float -> IO Bool
iteration cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_iteration (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMainLoop_idle #-}

bindMainLoop_idle :: MethodBind
bindMainLoop_idle
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "idle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

idle :: (MainLoop :< cls, Object :< cls) => cls -> Float -> IO Bool
idle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_idle (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMainLoop_finish #-}

bindMainLoop_finish :: MethodBind
bindMainLoop_finish
  = unsafePerformIO $
      withCString "MainLoop" $
        \ clsNamePtr ->
          withCString "finish" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

finish :: (MainLoop :< cls, Object :< cls) => cls -> IO ()
finish cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMainLoop_finish (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)