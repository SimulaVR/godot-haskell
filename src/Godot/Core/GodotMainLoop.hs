module Godot.Core.GodotMainLoop where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NOTIFICATION_CRASH :: Int

pattern NOTIFICATION_CRASH = 1012

pattern NOTIFICATION_TRANSLATION_CHANGED :: Int

pattern NOTIFICATION_TRANSLATION_CHANGED = 1010

pattern NOTIFICATION_WM_GO_BACK_REQUEST :: Int

pattern NOTIFICATION_WM_GO_BACK_REQUEST = 1007

pattern NOTIFICATION_OS_MEMORY_WARNING :: Int

pattern NOTIFICATION_OS_MEMORY_WARNING = 1009

pattern NOTIFICATION_WM_ABOUT :: Int

pattern NOTIFICATION_WM_ABOUT = 1011

pattern NOTIFICATION_WM_MOUSE_ENTER :: Int

pattern NOTIFICATION_WM_MOUSE_ENTER = 1002

pattern NOTIFICATION_WM_FOCUS_OUT :: Int

pattern NOTIFICATION_WM_FOCUS_OUT = 1005

pattern NOTIFICATION_WM_MOUSE_EXIT :: Int

pattern NOTIFICATION_WM_MOUSE_EXIT = 1003

pattern NOTIFICATION_WM_FOCUS_IN :: Int

pattern NOTIFICATION_WM_FOCUS_IN = 1004

pattern NOTIFICATION_WM_UNFOCUS_REQUEST :: Int

pattern NOTIFICATION_WM_UNFOCUS_REQUEST = 1008

pattern NOTIFICATION_OS_IME_UPDATE :: Int

pattern NOTIFICATION_OS_IME_UPDATE = 1013

pattern NOTIFICATION_WM_QUIT_REQUEST :: Int

pattern NOTIFICATION_WM_QUIT_REQUEST = 1006

pattern NOTIFICATION_APP_PAUSED :: Int

pattern NOTIFICATION_APP_PAUSED = 1015

pattern NOTIFICATION_APP_RESUMED :: Int

pattern NOTIFICATION_APP_RESUMED = 1014

on_request_permissions_result :: Signal GodotMainLoop
on_request_permissions_result
  = Signal "on_request_permissions_result"