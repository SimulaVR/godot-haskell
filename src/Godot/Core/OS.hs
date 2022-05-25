{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.OS
       (Godot.Core.OS._MONTH_MAY, Godot.Core.OS._SYSTEM_DIR_MOVIES,
        Godot.Core.OS._MONTH_DECEMBER, Godot.Core.OS._MONTH_MARCH,
        Godot.Core.OS._DAY_THURSDAY, Godot.Core.OS._SYSTEM_DIR_DCIM,
        Godot.Core.OS._DAY_MONDAY, Godot.Core.OS._DAY_TUESDAY,
        Godot.Core.OS._SCREEN_ORIENTATION_SENSOR_LANDSCAPE,
        Godot.Core.OS._POWERSTATE_CHARGING,
        Godot.Core.OS._VIDEO_DRIVER_GLES2,
        Godot.Core.OS._SYSTEM_DIR_RINGTONES,
        Godot.Core.OS._POWERSTATE_NO_BATTERY, Godot.Core.OS._MONTH_APRIL,
        Godot.Core.OS._DAY_FRIDAY, Godot.Core.OS._MONTH_SEPTEMBER,
        Godot.Core.OS._POWERSTATE_CHARGED,
        Godot.Core.OS._SCREEN_ORIENTATION_SENSOR,
        Godot.Core.OS._SYSTEM_DIR_MUSIC,
        Godot.Core.OS._SYSTEM_DIR_PICTURES,
        Godot.Core.OS._SCREEN_ORIENTATION_PORTRAIT,
        Godot.Core.OS._SCREEN_ORIENTATION_REVERSE_LANDSCAPE,
        Godot.Core.OS._DAY_WEDNESDAY, Godot.Core.OS._MONTH_JULY,
        Godot.Core.OS._MONTH_NOVEMBER,
        Godot.Core.OS._SCREEN_ORIENTATION_REVERSE_PORTRAIT,
        Godot.Core.OS._VIDEO_DRIVER_GLES3, Godot.Core.OS._DAY_SATURDAY,
        Godot.Core.OS._SYSTEM_DIR_DOCUMENTS, Godot.Core.OS._MONTH_FEBRUARY,
        Godot.Core.OS._SCREEN_ORIENTATION_LANDSCAPE,
        Godot.Core.OS._POWERSTATE_UNKNOWN, Godot.Core.OS._DAY_SUNDAY,
        Godot.Core.OS._MONTH_JANUARY, Godot.Core.OS._MONTH_OCTOBER,
        Godot.Core.OS._SCREEN_ORIENTATION_SENSOR_PORTRAIT,
        Godot.Core.OS._SYSTEM_DIR_DOWNLOADS, Godot.Core.OS._MONTH_JUNE,
        Godot.Core.OS._MONTH_AUGUST, Godot.Core.OS._SYSTEM_DIR_DESKTOP,
        Godot.Core.OS._POWERSTATE_ON_BATTERY, Godot.Core.OS.get_clipboard,
        Godot.Core.OS.set_clipboard, Godot.Core.OS.get_current_screen,
        Godot.Core.OS.set_current_screen, Godot.Core.OS.get_exit_code,
        Godot.Core.OS.set_exit_code, Godot.Core.OS.is_keep_screen_on,
        Godot.Core.OS.set_keep_screen_on,
        Godot.Core.OS.is_in_low_processor_usage_mode,
        Godot.Core.OS.set_low_processor_usage_mode,
        Godot.Core.OS.get_low_processor_usage_mode_sleep_usec,
        Godot.Core.OS.set_low_processor_usage_mode_sleep_usec,
        Godot.Core.OS.get_max_window_size,
        Godot.Core.OS.set_max_window_size,
        Godot.Core.OS.get_min_window_size,
        Godot.Core.OS.set_min_window_size,
        Godot.Core.OS.get_screen_orientation,
        Godot.Core.OS.set_screen_orientation,
        Godot.Core.OS.is_vsync_enabled, Godot.Core.OS.set_use_vsync,
        Godot.Core.OS.is_vsync_via_compositor_enabled,
        Godot.Core.OS.set_vsync_via_compositor,
        Godot.Core.OS.get_borderless_window,
        Godot.Core.OS.set_borderless_window,
        Godot.Core.OS.is_window_fullscreen,
        Godot.Core.OS.set_window_fullscreen,
        Godot.Core.OS.is_window_maximized,
        Godot.Core.OS.set_window_maximized,
        Godot.Core.OS.is_window_minimized,
        Godot.Core.OS.set_window_minimized,
        Godot.Core.OS.get_window_per_pixel_transparency_enabled,
        Godot.Core.OS.set_window_per_pixel_transparency_enabled,
        Godot.Core.OS.get_window_position,
        Godot.Core.OS.set_window_position,
        Godot.Core.OS.is_window_resizable,
        Godot.Core.OS.set_window_resizable, Godot.Core.OS.get_window_size,
        Godot.Core.OS.set_window_size, Godot.Core.OS.alert,
        Godot.Core.OS.can_draw, Godot.Core.OS.can_use_threads,
        Godot.Core.OS.center_window, Godot.Core.OS.close_midi_inputs,
        Godot.Core.OS.delay_msec, Godot.Core.OS.delay_usec,
        Godot.Core.OS.dump_memory_to_file,
        Godot.Core.OS.dump_resources_to_file, Godot.Core.OS.execute,
        Godot.Core.OS.find_scancode_from_string,
        Godot.Core.OS.get_audio_driver_count,
        Godot.Core.OS.get_audio_driver_name,
        Godot.Core.OS.get_cmdline_args,
        Godot.Core.OS.get_connected_midi_inputs,
        Godot.Core.OS.get_current_video_driver, Godot.Core.OS.get_date,
        Godot.Core.OS.get_datetime,
        Godot.Core.OS.get_datetime_from_unix_time,
        Godot.Core.OS.get_dynamic_memory_usage,
        Godot.Core.OS.get_environment, Godot.Core.OS.get_executable_path,
        Godot.Core.OS.get_granted_permissions,
        Godot.Core.OS.get_ime_selection, Godot.Core.OS.get_ime_text,
        Godot.Core.OS.get_latin_keyboard_variant, Godot.Core.OS.get_locale,
        Godot.Core.OS.get_model_name, Godot.Core.OS.get_name,
        Godot.Core.OS.get_power_percent_left,
        Godot.Core.OS.get_power_seconds_left,
        Godot.Core.OS.get_power_state, Godot.Core.OS.get_process_id,
        Godot.Core.OS.get_processor_count,
        Godot.Core.OS.get_real_window_size,
        Godot.Core.OS.get_scancode_string, Godot.Core.OS.get_screen_count,
        Godot.Core.OS.get_screen_dpi, Godot.Core.OS.get_screen_position,
        Godot.Core.OS.get_screen_size, Godot.Core.OS.get_splash_tick_msec,
        Godot.Core.OS.get_static_memory_peak_usage,
        Godot.Core.OS.get_static_memory_usage,
        Godot.Core.OS.get_system_dir, Godot.Core.OS.get_system_time_msecs,
        Godot.Core.OS.get_system_time_secs, Godot.Core.OS.get_ticks_msec,
        Godot.Core.OS.get_ticks_usec, Godot.Core.OS.get_time,
        Godot.Core.OS.get_time_zone_info, Godot.Core.OS.get_unique_id,
        Godot.Core.OS.get_unix_time,
        Godot.Core.OS.get_unix_time_from_datetime,
        Godot.Core.OS.get_user_data_dir,
        Godot.Core.OS.get_video_driver_count,
        Godot.Core.OS.get_video_driver_name,
        Godot.Core.OS.get_virtual_keyboard_height,
        Godot.Core.OS.get_window_safe_area,
        Godot.Core.OS.global_menu_add_item,
        Godot.Core.OS.global_menu_add_separator,
        Godot.Core.OS.global_menu_clear,
        Godot.Core.OS.global_menu_remove_item,
        Godot.Core.OS.has_environment, Godot.Core.OS.has_feature,
        Godot.Core.OS.has_touchscreen_ui_hint,
        Godot.Core.OS.has_virtual_keyboard,
        Godot.Core.OS.hide_virtual_keyboard, Godot.Core.OS.is_debug_build,
        Godot.Core.OS.is_ok_left_and_cancel_right,
        Godot.Core.OS.is_scancode_unicode, Godot.Core.OS.is_stdout_verbose,
        Godot.Core.OS.is_userfs_persistent,
        Godot.Core.OS.is_window_always_on_top,
        Godot.Core.OS.is_window_focused, Godot.Core.OS.kill,
        Godot.Core.OS.move_window_to_foreground,
        Godot.Core.OS.native_video_is_playing,
        Godot.Core.OS.native_video_pause, Godot.Core.OS.native_video_play,
        Godot.Core.OS.native_video_stop,
        Godot.Core.OS.native_video_unpause, Godot.Core.OS.open_midi_inputs,
        Godot.Core.OS.print_all_resources,
        Godot.Core.OS.print_all_textures_by_size,
        Godot.Core.OS.print_resources_by_type,
        Godot.Core.OS.print_resources_in_use,
        Godot.Core.OS.request_attention, Godot.Core.OS.request_permission,
        Godot.Core.OS.request_permissions, Godot.Core.OS.set_icon,
        Godot.Core.OS.set_ime_active, Godot.Core.OS.set_ime_position,
        Godot.Core.OS.set_native_icon, Godot.Core.OS.set_thread_name,
        Godot.Core.OS.set_use_file_access_save_and_swap,
        Godot.Core.OS.set_window_always_on_top,
        Godot.Core.OS.set_window_title, Godot.Core.OS.shell_open,
        Godot.Core.OS.show_virtual_keyboard)
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

_MONTH_MAY :: Int
_MONTH_MAY = 5

_SYSTEM_DIR_MOVIES :: Int
_SYSTEM_DIR_MOVIES = 4

_MONTH_DECEMBER :: Int
_MONTH_DECEMBER = 12

_MONTH_MARCH :: Int
_MONTH_MARCH = 3

_DAY_THURSDAY :: Int
_DAY_THURSDAY = 4

_SYSTEM_DIR_DCIM :: Int
_SYSTEM_DIR_DCIM = 1

_DAY_MONDAY :: Int
_DAY_MONDAY = 1

_DAY_TUESDAY :: Int
_DAY_TUESDAY = 2

_SCREEN_ORIENTATION_SENSOR_LANDSCAPE :: Int
_SCREEN_ORIENTATION_SENSOR_LANDSCAPE = 4

_POWERSTATE_CHARGING :: Int
_POWERSTATE_CHARGING = 3

_VIDEO_DRIVER_GLES2 :: Int
_VIDEO_DRIVER_GLES2 = 1

_SYSTEM_DIR_RINGTONES :: Int
_SYSTEM_DIR_RINGTONES = 7

_POWERSTATE_NO_BATTERY :: Int
_POWERSTATE_NO_BATTERY = 2

_MONTH_APRIL :: Int
_MONTH_APRIL = 4

_DAY_FRIDAY :: Int
_DAY_FRIDAY = 5

_MONTH_SEPTEMBER :: Int
_MONTH_SEPTEMBER = 9

_POWERSTATE_CHARGED :: Int
_POWERSTATE_CHARGED = 4

_SCREEN_ORIENTATION_SENSOR :: Int
_SCREEN_ORIENTATION_SENSOR = 6

_SYSTEM_DIR_MUSIC :: Int
_SYSTEM_DIR_MUSIC = 5

_SYSTEM_DIR_PICTURES :: Int
_SYSTEM_DIR_PICTURES = 6

_SCREEN_ORIENTATION_PORTRAIT :: Int
_SCREEN_ORIENTATION_PORTRAIT = 1

_SCREEN_ORIENTATION_REVERSE_LANDSCAPE :: Int
_SCREEN_ORIENTATION_REVERSE_LANDSCAPE = 2

_DAY_WEDNESDAY :: Int
_DAY_WEDNESDAY = 3

_MONTH_JULY :: Int
_MONTH_JULY = 7

_MONTH_NOVEMBER :: Int
_MONTH_NOVEMBER = 11

_SCREEN_ORIENTATION_REVERSE_PORTRAIT :: Int
_SCREEN_ORIENTATION_REVERSE_PORTRAIT = 3

_VIDEO_DRIVER_GLES3 :: Int
_VIDEO_DRIVER_GLES3 = 0

_DAY_SATURDAY :: Int
_DAY_SATURDAY = 6

_SYSTEM_DIR_DOCUMENTS :: Int
_SYSTEM_DIR_DOCUMENTS = 2

_MONTH_FEBRUARY :: Int
_MONTH_FEBRUARY = 2

_SCREEN_ORIENTATION_LANDSCAPE :: Int
_SCREEN_ORIENTATION_LANDSCAPE = 0

_POWERSTATE_UNKNOWN :: Int
_POWERSTATE_UNKNOWN = 0

_DAY_SUNDAY :: Int
_DAY_SUNDAY = 0

_MONTH_JANUARY :: Int
_MONTH_JANUARY = 1

_MONTH_OCTOBER :: Int
_MONTH_OCTOBER = 10

_SCREEN_ORIENTATION_SENSOR_PORTRAIT :: Int
_SCREEN_ORIENTATION_SENSOR_PORTRAIT = 5

_SYSTEM_DIR_DOWNLOADS :: Int
_SYSTEM_DIR_DOWNLOADS = 3

_MONTH_JUNE :: Int
_MONTH_JUNE = 6

_MONTH_AUGUST :: Int
_MONTH_AUGUST = 8

_SYSTEM_DIR_DESKTOP :: Int
_SYSTEM_DIR_DESKTOP = 0

_POWERSTATE_ON_BATTERY :: Int
_POWERSTATE_ON_BATTERY = 1

{-# NOINLINE bindOS_get_clipboard #-}

-- | The clipboard from the host OS. Might be unavailable on some platforms.
bindOS_get_clipboard :: MethodBind
bindOS_get_clipboard
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_clipboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The clipboard from the host OS. Might be unavailable on some platforms.
get_clipboard ::
                (OS :< cls, Object :< cls) => cls -> IO GodotString
get_clipboard cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_clipboard (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_clipboard" '[] (IO GodotString) where
        nodeMethod = Godot.Core.OS.get_clipboard

{-# NOINLINE bindOS_set_clipboard #-}

-- | The clipboard from the host OS. Might be unavailable on some platforms.
bindOS_set_clipboard :: MethodBind
bindOS_set_clipboard
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_clipboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The clipboard from the host OS. Might be unavailable on some platforms.
set_clipboard ::
                (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_clipboard cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_clipboard (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_clipboard" '[GodotString] (IO ()) where
        nodeMethod = Godot.Core.OS.set_clipboard

instance NodeProperty OS "clipboard" GodotString 'False where
        nodeProperty
          = (get_clipboard, wrapDroppingSetter set_clipboard, Nothing)

{-# NOINLINE bindOS_get_current_screen #-}

-- | The current screen index (starting from 0).
bindOS_get_current_screen :: MethodBind
bindOS_get_current_screen
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_current_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current screen index (starting from 0).
get_current_screen :: (OS :< cls, Object :< cls) => cls -> IO Int
get_current_screen cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_current_screen (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_current_screen" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_current_screen

{-# NOINLINE bindOS_set_current_screen #-}

-- | The current screen index (starting from 0).
bindOS_set_current_screen :: MethodBind
bindOS_set_current_screen
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_current_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current screen index (starting from 0).
set_current_screen ::
                     (OS :< cls, Object :< cls) => cls -> Int -> IO ()
set_current_screen cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_current_screen (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_current_screen" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OS.set_current_screen

instance NodeProperty OS "current_screen" Int 'False where
        nodeProperty
          = (get_current_screen, wrapDroppingSetter set_current_screen,
             Nothing)

{-# NOINLINE bindOS_get_exit_code #-}

-- | The exit code passed to the OS when the main loop exits. By convention, an exit code of @0@ indicates success whereas a non-zero exit code indicates an error. For portability reasons, the exit code should be set between 0 and 125 (inclusive).
--   			__Note:__ This value will be ignored if using @method SceneTree.quit@ with an @exit_code@ argument passed.
bindOS_get_exit_code :: MethodBind
bindOS_get_exit_code
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_exit_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The exit code passed to the OS when the main loop exits. By convention, an exit code of @0@ indicates success whereas a non-zero exit code indicates an error. For portability reasons, the exit code should be set between 0 and 125 (inclusive).
--   			__Note:__ This value will be ignored if using @method SceneTree.quit@ with an @exit_code@ argument passed.
get_exit_code :: (OS :< cls, Object :< cls) => cls -> IO Int
get_exit_code cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_exit_code (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_exit_code" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_exit_code

{-# NOINLINE bindOS_set_exit_code #-}

-- | The exit code passed to the OS when the main loop exits. By convention, an exit code of @0@ indicates success whereas a non-zero exit code indicates an error. For portability reasons, the exit code should be set between 0 and 125 (inclusive).
--   			__Note:__ This value will be ignored if using @method SceneTree.quit@ with an @exit_code@ argument passed.
bindOS_set_exit_code :: MethodBind
bindOS_set_exit_code
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_exit_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The exit code passed to the OS when the main loop exits. By convention, an exit code of @0@ indicates success whereas a non-zero exit code indicates an error. For portability reasons, the exit code should be set between 0 and 125 (inclusive).
--   			__Note:__ This value will be ignored if using @method SceneTree.quit@ with an @exit_code@ argument passed.
set_exit_code :: (OS :< cls, Object :< cls) => cls -> Int -> IO ()
set_exit_code cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_exit_code (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_exit_code" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OS.set_exit_code

instance NodeProperty OS "exit_code" Int 'False where
        nodeProperty
          = (get_exit_code, wrapDroppingSetter set_exit_code, Nothing)

{-# NOINLINE bindOS_is_keep_screen_on #-}

-- | If @true@, the engine tries to keep the screen on while the game is running. Useful on mobile.
bindOS_is_keep_screen_on :: MethodBind
bindOS_is_keep_screen_on
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_keep_screen_on" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the engine tries to keep the screen on while the game is running. Useful on mobile.
is_keep_screen_on :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_keep_screen_on cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_keep_screen_on (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_keep_screen_on" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_keep_screen_on

{-# NOINLINE bindOS_set_keep_screen_on #-}

-- | If @true@, the engine tries to keep the screen on while the game is running. Useful on mobile.
bindOS_set_keep_screen_on :: MethodBind
bindOS_set_keep_screen_on
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_keep_screen_on" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the engine tries to keep the screen on while the game is running. Useful on mobile.
set_keep_screen_on ::
                     (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_keep_screen_on cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_keep_screen_on (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_keep_screen_on" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.OS.set_keep_screen_on

instance NodeProperty OS "keep_screen_on" Bool 'False where
        nodeProperty
          = (is_keep_screen_on, wrapDroppingSetter set_keep_screen_on,
             Nothing)

{-# NOINLINE bindOS_is_in_low_processor_usage_mode #-}

-- | If @true@, the engine optimizes for low processor usage by only refreshing the screen if needed. Can improve battery consumption on mobile.
bindOS_is_in_low_processor_usage_mode :: MethodBind
bindOS_is_in_low_processor_usage_mode
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_in_low_processor_usage_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the engine optimizes for low processor usage by only refreshing the screen if needed. Can improve battery consumption on mobile.
is_in_low_processor_usage_mode ::
                                 (OS :< cls, Object :< cls) => cls -> IO Bool
is_in_low_processor_usage_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_in_low_processor_usage_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_in_low_processor_usage_mode" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.OS.is_in_low_processor_usage_mode

{-# NOINLINE bindOS_set_low_processor_usage_mode #-}

-- | If @true@, the engine optimizes for low processor usage by only refreshing the screen if needed. Can improve battery consumption on mobile.
bindOS_set_low_processor_usage_mode :: MethodBind
bindOS_set_low_processor_usage_mode
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_low_processor_usage_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the engine optimizes for low processor usage by only refreshing the screen if needed. Can improve battery consumption on mobile.
set_low_processor_usage_mode ::
                               (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_low_processor_usage_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_low_processor_usage_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_low_processor_usage_mode" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.set_low_processor_usage_mode

instance NodeProperty OS "low_processor_usage_mode" Bool 'False
         where
        nodeProperty
          = (is_in_low_processor_usage_mode,
             wrapDroppingSetter set_low_processor_usage_mode, Nothing)

{-# NOINLINE bindOS_get_low_processor_usage_mode_sleep_usec #-}

-- | The amount of sleeping between frames when the low-processor usage mode is enabled (in microseconds). Higher values will result in lower CPU usage.
bindOS_get_low_processor_usage_mode_sleep_usec :: MethodBind
bindOS_get_low_processor_usage_mode_sleep_usec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_low_processor_usage_mode_sleep_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of sleeping between frames when the low-processor usage mode is enabled (in microseconds). Higher values will result in lower CPU usage.
get_low_processor_usage_mode_sleep_usec ::
                                          (OS :< cls, Object :< cls) => cls -> IO Int
get_low_processor_usage_mode_sleep_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindOS_get_low_processor_usage_mode_sleep_usec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_low_processor_usage_mode_sleep_usec"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.OS.get_low_processor_usage_mode_sleep_usec

{-# NOINLINE bindOS_set_low_processor_usage_mode_sleep_usec #-}

-- | The amount of sleeping between frames when the low-processor usage mode is enabled (in microseconds). Higher values will result in lower CPU usage.
bindOS_set_low_processor_usage_mode_sleep_usec :: MethodBind
bindOS_set_low_processor_usage_mode_sleep_usec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_low_processor_usage_mode_sleep_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The amount of sleeping between frames when the low-processor usage mode is enabled (in microseconds). Higher values will result in lower CPU usage.
set_low_processor_usage_mode_sleep_usec ::
                                          (OS :< cls, Object :< cls) => cls -> Int -> IO ()
set_low_processor_usage_mode_sleep_usec cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindOS_set_low_processor_usage_mode_sleep_usec
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_low_processor_usage_mode_sleep_usec"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.set_low_processor_usage_mode_sleep_usec

instance NodeProperty OS "low_processor_usage_mode_sleep_usec" Int
           'False
         where
        nodeProperty
          = (get_low_processor_usage_mode_sleep_usec,
             wrapDroppingSetter set_low_processor_usage_mode_sleep_usec,
             Nothing)

{-# NOINLINE bindOS_get_max_window_size #-}

-- | The maximum size of the window (without counting window manager decorations). Does not affect fullscreen mode. Set to @(0, 0)@ to reset to the system default value.
bindOS_get_max_window_size :: MethodBind
bindOS_get_max_window_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_max_window_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum size of the window (without counting window manager decorations). Does not affect fullscreen mode. Set to @(0, 0)@ to reset to the system default value.
get_max_window_size ::
                      (OS :< cls, Object :< cls) => cls -> IO Vector2
get_max_window_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_max_window_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_max_window_size" '[] (IO Vector2) where
        nodeMethod = Godot.Core.OS.get_max_window_size

{-# NOINLINE bindOS_set_max_window_size #-}

-- | The maximum size of the window (without counting window manager decorations). Does not affect fullscreen mode. Set to @(0, 0)@ to reset to the system default value.
bindOS_set_max_window_size :: MethodBind
bindOS_set_max_window_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_max_window_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The maximum size of the window (without counting window manager decorations). Does not affect fullscreen mode. Set to @(0, 0)@ to reset to the system default value.
set_max_window_size ::
                      (OS :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_max_window_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_max_window_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_max_window_size" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_max_window_size

instance NodeProperty OS "max_window_size" Vector2 'False where
        nodeProperty
          = (get_max_window_size, wrapDroppingSetter set_max_window_size,
             Nothing)

{-# NOINLINE bindOS_get_min_window_size #-}

-- | The minimum size of the window (without counting window manager decorations). Does not affect fullscreen mode. Set to @(0, 0)@ to reset to the system default value.
bindOS_get_min_window_size :: MethodBind
bindOS_get_min_window_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_min_window_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum size of the window (without counting window manager decorations). Does not affect fullscreen mode. Set to @(0, 0)@ to reset to the system default value.
get_min_window_size ::
                      (OS :< cls, Object :< cls) => cls -> IO Vector2
get_min_window_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_min_window_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_min_window_size" '[] (IO Vector2) where
        nodeMethod = Godot.Core.OS.get_min_window_size

{-# NOINLINE bindOS_set_min_window_size #-}

-- | The minimum size of the window (without counting window manager decorations). Does not affect fullscreen mode. Set to @(0, 0)@ to reset to the system default value.
bindOS_set_min_window_size :: MethodBind
bindOS_set_min_window_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_min_window_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The minimum size of the window (without counting window manager decorations). Does not affect fullscreen mode. Set to @(0, 0)@ to reset to the system default value.
set_min_window_size ::
                      (OS :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_min_window_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_min_window_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_min_window_size" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_min_window_size

instance NodeProperty OS "min_window_size" Vector2 'False where
        nodeProperty
          = (get_min_window_size, wrapDroppingSetter set_min_window_size,
             Nothing)

{-# NOINLINE bindOS_get_screen_orientation #-}

-- | The current screen orientation.
bindOS_get_screen_orientation :: MethodBind
bindOS_get_screen_orientation
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_screen_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current screen orientation.
get_screen_orientation ::
                         (OS :< cls, Object :< cls) => cls -> IO Int
get_screen_orientation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_screen_orientation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_screen_orientation" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_screen_orientation

{-# NOINLINE bindOS_set_screen_orientation #-}

-- | The current screen orientation.
bindOS_set_screen_orientation :: MethodBind
bindOS_set_screen_orientation
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_screen_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current screen orientation.
set_screen_orientation ::
                         (OS :< cls, Object :< cls) => cls -> Int -> IO ()
set_screen_orientation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_screen_orientation (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_screen_orientation" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_screen_orientation

instance NodeProperty OS "screen_orientation" Int 'False where
        nodeProperty
          = (get_screen_orientation,
             wrapDroppingSetter set_screen_orientation, Nothing)

{-# NOINLINE bindOS_is_vsync_enabled #-}

-- | If @true@, vertical synchronization (Vsync) is enabled.
bindOS_is_vsync_enabled :: MethodBind
bindOS_is_vsync_enabled
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_vsync_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, vertical synchronization (Vsync) is enabled.
is_vsync_enabled :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_vsync_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_vsync_enabled (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_vsync_enabled" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_vsync_enabled

{-# NOINLINE bindOS_set_use_vsync #-}

-- | If @true@, vertical synchronization (Vsync) is enabled.
bindOS_set_use_vsync :: MethodBind
bindOS_set_use_vsync
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_use_vsync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, vertical synchronization (Vsync) is enabled.
set_use_vsync :: (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_vsync cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_use_vsync (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_use_vsync" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.OS.set_use_vsync

instance NodeProperty OS "vsync_enabled" Bool 'False where
        nodeProperty
          = (is_vsync_enabled, wrapDroppingSetter set_use_vsync, Nothing)

{-# NOINLINE bindOS_is_vsync_via_compositor_enabled #-}

-- | If @true@ and @vsync_enabled@ is true, the operating system's window compositor will be used for vsync when the compositor is enabled and the game is in windowed mode.
--   			__Note:__ This option is experimental and meant to alleviate stutter experienced by some users. However, some users have experienced a Vsync framerate halving (e.g. from 60 FPS to 30 FPS) when using it.
--   			__Note:__ This property is only implemented on Windows.
bindOS_is_vsync_via_compositor_enabled :: MethodBind
bindOS_is_vsync_via_compositor_enabled
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_vsync_via_compositor_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ and @vsync_enabled@ is true, the operating system's window compositor will be used for vsync when the compositor is enabled and the game is in windowed mode.
--   			__Note:__ This option is experimental and meant to alleviate stutter experienced by some users. However, some users have experienced a Vsync framerate halving (e.g. from 60 FPS to 30 FPS) when using it.
--   			__Note:__ This property is only implemented on Windows.
is_vsync_via_compositor_enabled ::
                                  (OS :< cls, Object :< cls) => cls -> IO Bool
is_vsync_via_compositor_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_vsync_via_compositor_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_vsync_via_compositor_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.OS.is_vsync_via_compositor_enabled

{-# NOINLINE bindOS_set_vsync_via_compositor #-}

-- | If @true@ and @vsync_enabled@ is true, the operating system's window compositor will be used for vsync when the compositor is enabled and the game is in windowed mode.
--   			__Note:__ This option is experimental and meant to alleviate stutter experienced by some users. However, some users have experienced a Vsync framerate halving (e.g. from 60 FPS to 30 FPS) when using it.
--   			__Note:__ This property is only implemented on Windows.
bindOS_set_vsync_via_compositor :: MethodBind
bindOS_set_vsync_via_compositor
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_vsync_via_compositor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@ and @vsync_enabled@ is true, the operating system's window compositor will be used for vsync when the compositor is enabled and the game is in windowed mode.
--   			__Note:__ This option is experimental and meant to alleviate stutter experienced by some users. However, some users have experienced a Vsync framerate halving (e.g. from 60 FPS to 30 FPS) when using it.
--   			__Note:__ This property is only implemented on Windows.
set_vsync_via_compositor ::
                           (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_vsync_via_compositor cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_vsync_via_compositor (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_vsync_via_compositor" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_vsync_via_compositor

instance NodeProperty OS "vsync_via_compositor" Bool 'False where
        nodeProperty
          = (is_vsync_via_compositor_enabled,
             wrapDroppingSetter set_vsync_via_compositor, Nothing)

{-# NOINLINE bindOS_get_borderless_window #-}

-- | If @true@, removes the window frame.
--   			__Note:__ Setting @window_borderless@ to @false@ disables per-pixel transparency.
bindOS_get_borderless_window :: MethodBind
bindOS_get_borderless_window
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_borderless_window" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, removes the window frame.
--   			__Note:__ Setting @window_borderless@ to @false@ disables per-pixel transparency.
get_borderless_window ::
                        (OS :< cls, Object :< cls) => cls -> IO Bool
get_borderless_window cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_borderless_window (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_borderless_window" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.get_borderless_window

{-# NOINLINE bindOS_set_borderless_window #-}

-- | If @true@, removes the window frame.
--   			__Note:__ Setting @window_borderless@ to @false@ disables per-pixel transparency.
bindOS_set_borderless_window :: MethodBind
bindOS_set_borderless_window
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_borderless_window" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, removes the window frame.
--   			__Note:__ Setting @window_borderless@ to @false@ disables per-pixel transparency.
set_borderless_window ::
                        (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_borderless_window cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_borderless_window (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_borderless_window" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_borderless_window

instance NodeProperty OS "window_borderless" Bool 'False where
        nodeProperty
          = (get_borderless_window, wrapDroppingSetter set_borderless_window,
             Nothing)

{-# NOINLINE bindOS_is_window_fullscreen #-}

-- | If @true@, the window is fullscreen.
bindOS_is_window_fullscreen :: MethodBind
bindOS_is_window_fullscreen
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_fullscreen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window is fullscreen.
is_window_fullscreen ::
                       (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_fullscreen cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_fullscreen (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_window_fullscreen" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_window_fullscreen

{-# NOINLINE bindOS_set_window_fullscreen #-}

-- | If @true@, the window is fullscreen.
bindOS_set_window_fullscreen :: MethodBind
bindOS_set_window_fullscreen
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_fullscreen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window is fullscreen.
set_window_fullscreen ::
                        (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_fullscreen cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_fullscreen (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_fullscreen" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_window_fullscreen

instance NodeProperty OS "window_fullscreen" Bool 'False where
        nodeProperty
          = (is_window_fullscreen, wrapDroppingSetter set_window_fullscreen,
             Nothing)

{-# NOINLINE bindOS_is_window_maximized #-}

-- | If @true@, the window is maximized.
bindOS_is_window_maximized :: MethodBind
bindOS_is_window_maximized
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_maximized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window is maximized.
is_window_maximized :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_maximized cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_maximized (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_window_maximized" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_window_maximized

{-# NOINLINE bindOS_set_window_maximized #-}

-- | If @true@, the window is maximized.
bindOS_set_window_maximized :: MethodBind
bindOS_set_window_maximized
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_maximized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window is maximized.
set_window_maximized ::
                       (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_maximized cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_maximized (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_maximized" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.OS.set_window_maximized

instance NodeProperty OS "window_maximized" Bool 'False where
        nodeProperty
          = (is_window_maximized, wrapDroppingSetter set_window_maximized,
             Nothing)

{-# NOINLINE bindOS_is_window_minimized #-}

-- | If @true@, the window is minimized.
bindOS_is_window_minimized :: MethodBind
bindOS_is_window_minimized
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_minimized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window is minimized.
is_window_minimized :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_minimized cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_minimized (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_window_minimized" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_window_minimized

{-# NOINLINE bindOS_set_window_minimized #-}

-- | If @true@, the window is minimized.
bindOS_set_window_minimized :: MethodBind
bindOS_set_window_minimized
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_minimized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window is minimized.
set_window_minimized ::
                       (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_minimized cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_minimized (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_minimized" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.OS.set_window_minimized

instance NodeProperty OS "window_minimized" Bool 'False where
        nodeProperty
          = (is_window_minimized, wrapDroppingSetter set_window_minimized,
             Nothing)

{-# NOINLINE bindOS_get_window_per_pixel_transparency_enabled #-}

-- | If @true@, the window background is transparent and window frame is removed.
--   			Use @get_tree().get_root().set_transparent_background(true)@ to disable main viewport background rendering.
--   			__Note:__ This property has no effect if __Project > Project Settings > Display > Window > Per-pixel transparency > Allowed__ setting is disabled.
--   			__Note:__ This property is implemented on HTML5, Linux, macOS and Windows.
bindOS_get_window_per_pixel_transparency_enabled :: MethodBind
bindOS_get_window_per_pixel_transparency_enabled
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_window_per_pixel_transparency_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window background is transparent and window frame is removed.
--   			Use @get_tree().get_root().set_transparent_background(true)@ to disable main viewport background rendering.
--   			__Note:__ This property has no effect if __Project > Project Settings > Display > Window > Per-pixel transparency > Allowed__ setting is disabled.
--   			__Note:__ This property is implemented on HTML5, Linux, macOS and Windows.
get_window_per_pixel_transparency_enabled ::
                                            (OS :< cls, Object :< cls) => cls -> IO Bool
get_window_per_pixel_transparency_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindOS_get_window_per_pixel_transparency_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_window_per_pixel_transparency_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.OS.get_window_per_pixel_transparency_enabled

{-# NOINLINE bindOS_set_window_per_pixel_transparency_enabled #-}

-- | If @true@, the window background is transparent and window frame is removed.
--   			Use @get_tree().get_root().set_transparent_background(true)@ to disable main viewport background rendering.
--   			__Note:__ This property has no effect if __Project > Project Settings > Display > Window > Per-pixel transparency > Allowed__ setting is disabled.
--   			__Note:__ This property is implemented on HTML5, Linux, macOS and Windows.
bindOS_set_window_per_pixel_transparency_enabled :: MethodBind
bindOS_set_window_per_pixel_transparency_enabled
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_per_pixel_transparency_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window background is transparent and window frame is removed.
--   			Use @get_tree().get_root().set_transparent_background(true)@ to disable main viewport background rendering.
--   			__Note:__ This property has no effect if __Project > Project Settings > Display > Window > Per-pixel transparency > Allowed__ setting is disabled.
--   			__Note:__ This property is implemented on HTML5, Linux, macOS and Windows.
set_window_per_pixel_transparency_enabled ::
                                            (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_per_pixel_transparency_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindOS_set_window_per_pixel_transparency_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_per_pixel_transparency_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.OS.set_window_per_pixel_transparency_enabled

instance NodeProperty OS "window_per_pixel_transparency_enabled"
           Bool
           'False
         where
        nodeProperty
          = (get_window_per_pixel_transparency_enabled,
             wrapDroppingSetter set_window_per_pixel_transparency_enabled,
             Nothing)

{-# NOINLINE bindOS_get_window_position #-}

-- | The window position relative to the screen, the origin is the top left corner, +Y axis goes to the bottom and +X axis goes to the right.
bindOS_get_window_position :: MethodBind
bindOS_get_window_position
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_window_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The window position relative to the screen, the origin is the top left corner, +Y axis goes to the bottom and +X axis goes to the right.
get_window_position ::
                      (OS :< cls, Object :< cls) => cls -> IO Vector2
get_window_position cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_window_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_window_position" '[] (IO Vector2) where
        nodeMethod = Godot.Core.OS.get_window_position

{-# NOINLINE bindOS_set_window_position #-}

-- | The window position relative to the screen, the origin is the top left corner, +Y axis goes to the bottom and +X axis goes to the right.
bindOS_set_window_position :: MethodBind
bindOS_set_window_position
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The window position relative to the screen, the origin is the top left corner, +Y axis goes to the bottom and +X axis goes to the right.
set_window_position ::
                      (OS :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_window_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_position" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_window_position

instance NodeProperty OS "window_position" Vector2 'False where
        nodeProperty
          = (get_window_position, wrapDroppingSetter set_window_position,
             Nothing)

{-# NOINLINE bindOS_is_window_resizable #-}

-- | If @true@, the window is resizable by the user.
bindOS_is_window_resizable :: MethodBind
bindOS_is_window_resizable
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window is resizable by the user.
is_window_resizable :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_resizable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_window_resizable" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_window_resizable

{-# NOINLINE bindOS_set_window_resizable #-}

-- | If @true@, the window is resizable by the user.
bindOS_set_window_resizable :: MethodBind
bindOS_set_window_resizable
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the window is resizable by the user.
set_window_resizable ::
                       (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_resizable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_resizable" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.OS.set_window_resizable

instance NodeProperty OS "window_resizable" Bool 'False where
        nodeProperty
          = (is_window_resizable, wrapDroppingSetter set_window_resizable,
             Nothing)

{-# NOINLINE bindOS_get_window_size #-}

-- | The size of the window (without counting window manager decorations).
bindOS_get_window_size :: MethodBind
bindOS_get_window_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_window_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the window (without counting window manager decorations).
get_window_size :: (OS :< cls, Object :< cls) => cls -> IO Vector2
get_window_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_window_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_window_size" '[] (IO Vector2) where
        nodeMethod = Godot.Core.OS.get_window_size

{-# NOINLINE bindOS_set_window_size #-}

-- | The size of the window (without counting window manager decorations).
bindOS_set_window_size :: MethodBind
bindOS_set_window_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The size of the window (without counting window manager decorations).
set_window_size ::
                  (OS :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_window_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_size" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.OS.set_window_size

instance NodeProperty OS "window_size" Vector2 'False where
        nodeProperty
          = (get_window_size, wrapDroppingSetter set_window_size, Nothing)

{-# NOINLINE bindOS_alert #-}

-- | Displays a modal dialog box using the host OS' facilities. Execution is blocked until the dialog is closed.
bindOS_alert :: MethodBind
bindOS_alert
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "alert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Displays a modal dialog box using the host OS' facilities. Execution is blocked until the dialog is closed.
alert ::
        (OS :< cls, Object :< cls) =>
        cls -> GodotString -> Maybe GodotString -> IO ()
alert cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "Alert!" arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_alert (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "alert" '[GodotString, Maybe GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.alert

{-# NOINLINE bindOS_can_draw #-}

-- | Returns @true@ if the host OS allows drawing.
bindOS_can_draw :: MethodBind
bindOS_can_draw
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "can_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the host OS allows drawing.
can_draw :: (OS :< cls, Object :< cls) => cls -> IO Bool
can_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_can_draw (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "can_draw" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.can_draw

{-# NOINLINE bindOS_can_use_threads #-}

-- | Returns @true@ if the current host platform is using multiple threads.
bindOS_can_use_threads :: MethodBind
bindOS_can_use_threads
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "can_use_threads" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the current host platform is using multiple threads.
can_use_threads :: (OS :< cls, Object :< cls) => cls -> IO Bool
can_use_threads cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_can_use_threads (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "can_use_threads" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.can_use_threads

{-# NOINLINE bindOS_center_window #-}

-- | Centers the window on the screen if in windowed mode.
bindOS_center_window :: MethodBind
bindOS_center_window
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "center_window" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Centers the window on the screen if in windowed mode.
center_window :: (OS :< cls, Object :< cls) => cls -> IO ()
center_window cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_center_window (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "center_window" '[] (IO ()) where
        nodeMethod = Godot.Core.OS.center_window

{-# NOINLINE bindOS_close_midi_inputs #-}

-- | Shuts down system MIDI driver.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_close_midi_inputs :: MethodBind
bindOS_close_midi_inputs
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "close_midi_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shuts down system MIDI driver.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
close_midi_inputs :: (OS :< cls, Object :< cls) => cls -> IO ()
close_midi_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_close_midi_inputs (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "close_midi_inputs" '[] (IO ()) where
        nodeMethod = Godot.Core.OS.close_midi_inputs

{-# NOINLINE bindOS_delay_msec #-}

-- | Delay execution of the current thread by @msec@ milliseconds.
bindOS_delay_msec :: MethodBind
bindOS_delay_msec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "delay_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Delay execution of the current thread by @msec@ milliseconds.
delay_msec :: (OS :< cls, Object :< cls) => cls -> Int -> IO ()
delay_msec cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_delay_msec (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "delay_msec" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OS.delay_msec

{-# NOINLINE bindOS_delay_usec #-}

-- | Delay execution of the current thread by @usec@ microseconds.
bindOS_delay_usec :: MethodBind
bindOS_delay_usec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "delay_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Delay execution of the current thread by @usec@ microseconds.
delay_usec :: (OS :< cls, Object :< cls) => cls -> Int -> IO ()
delay_usec cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_delay_usec (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "delay_usec" '[Int] (IO ()) where
        nodeMethod = Godot.Core.OS.delay_usec

{-# NOINLINE bindOS_dump_memory_to_file #-}

-- | Dumps the memory allocation ringlist to a file (only works in debug).
--   				Entry format per line: "Address - Size - Description".
bindOS_dump_memory_to_file :: MethodBind
bindOS_dump_memory_to_file
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "dump_memory_to_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dumps the memory allocation ringlist to a file (only works in debug).
--   				Entry format per line: "Address - Size - Description".
dump_memory_to_file ::
                      (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
dump_memory_to_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_dump_memory_to_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "dump_memory_to_file" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.OS.dump_memory_to_file

{-# NOINLINE bindOS_dump_resources_to_file #-}

-- | Dumps all used resources to file (only works in debug).
--   				Entry format per line: "Resource Type : Resource Location".
--   				At the end of the file is a statistic of all used Resource Types.
bindOS_dump_resources_to_file :: MethodBind
bindOS_dump_resources_to_file
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "dump_resources_to_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Dumps all used resources to file (only works in debug).
--   				Entry format per line: "Resource Type : Resource Location".
--   				At the end of the file is a statistic of all used Resource Types.
dump_resources_to_file ::
                         (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
dump_resources_to_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_dump_resources_to_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "dump_resources_to_file" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.dump_resources_to_file

{-# NOINLINE bindOS_execute #-}

-- | Execute the file at the given path with the arguments passed as an array of strings. Platform path resolution will take place. The resolved file must exist and be executable.
--   				The arguments are used in the given order and separated by a space, so @OS.execute("ping", @"-w", "3", "godotengine.org"@, false)@ will resolve to @ping -w 3 godotengine.org@ in the system's shell.
--   				This method has slightly different behavior based on whether the @blocking@ mode is enabled.
--   				If @blocking@ is @true@, the Godot thread will pause its execution while waiting for the process to terminate. The shell output of the process will be written to the @output@ array as a single string. When the process terminates, the Godot thread will resume execution.
--   				If @blocking@ is @false@, the Godot thread will continue while the new process runs. It is not possible to retrieve the shell output in non-blocking mode, so @output@ will be empty.
--   				The return value also depends on the blocking mode. When blocking, the method will return an exit code of the process. When non-blocking, the method returns a process ID, which you can use to monitor the process (and potentially terminate it with @method kill@). If the process forking (non-blocking) or opening (blocking) fails, the method will return @-1@ or another exit code.
--   				Example of blocking mode and retrieving the shell output:
--   				
--   @
--   
--   				var output = @@
--   				var exit_code = OS.execute("ls", @"-l", "/tmp"@, true, output)
--   				
--   @
--   
--   				Example of non-blocking mode, running another instance of the project and storing its process ID:
--   				
--   @
--   
--   				var pid = OS.execute(OS.get_executable_path(), @@, false)
--   				
--   @
--   
--   				If you wish to access a shell built-in or perform a composite command, a platform-specific shell can be invoked. For example:
--   				
--   @
--   
--   				OS.execute("CMD.exe", @"/C", "cd %TEMP% && dir"@, true, output)
--   				
--   @
--   
--   				__Note:__ This method is implemented on Android, iOS, Linux, macOS and Windows.
bindOS_execute :: MethodBind
bindOS_execute
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "execute" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Execute the file at the given path with the arguments passed as an array of strings. Platform path resolution will take place. The resolved file must exist and be executable.
--   				The arguments are used in the given order and separated by a space, so @OS.execute("ping", @"-w", "3", "godotengine.org"@, false)@ will resolve to @ping -w 3 godotengine.org@ in the system's shell.
--   				This method has slightly different behavior based on whether the @blocking@ mode is enabled.
--   				If @blocking@ is @true@, the Godot thread will pause its execution while waiting for the process to terminate. The shell output of the process will be written to the @output@ array as a single string. When the process terminates, the Godot thread will resume execution.
--   				If @blocking@ is @false@, the Godot thread will continue while the new process runs. It is not possible to retrieve the shell output in non-blocking mode, so @output@ will be empty.
--   				The return value also depends on the blocking mode. When blocking, the method will return an exit code of the process. When non-blocking, the method returns a process ID, which you can use to monitor the process (and potentially terminate it with @method kill@). If the process forking (non-blocking) or opening (blocking) fails, the method will return @-1@ or another exit code.
--   				Example of blocking mode and retrieving the shell output:
--   				
--   @
--   
--   				var output = @@
--   				var exit_code = OS.execute("ls", @"-l", "/tmp"@, true, output)
--   				
--   @
--   
--   				Example of non-blocking mode, running another instance of the project and storing its process ID:
--   				
--   @
--   
--   				var pid = OS.execute(OS.get_executable_path(), @@, false)
--   				
--   @
--   
--   				If you wish to access a shell built-in or perform a composite command, a platform-specific shell can be invoked. For example:
--   				
--   @
--   
--   				OS.execute("CMD.exe", @"/C", "cd %TEMP% && dir"@, true, output)
--   				
--   @
--   
--   				__Note:__ This method is implemented on Android, iOS, Linux, macOS and Windows.
execute ::
          (OS :< cls, Object :< cls) =>
          cls ->
            GodotString ->
              PoolStringArray ->
                Maybe Bool -> Maybe Array -> Maybe Bool -> IO Int
execute cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool True) toVariant arg3,
       defaultedVariant VariantArray V.empty arg4,
       maybe (VariantBool False) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_execute (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "execute"
           '[GodotString, PoolStringArray, Maybe Bool, Maybe Array,
             Maybe Bool]
           (IO Int)
         where
        nodeMethod = Godot.Core.OS.execute

{-# NOINLINE bindOS_find_scancode_from_string #-}

-- | Returns the scancode of the given string (e.g. "Escape").
bindOS_find_scancode_from_string :: MethodBind
bindOS_find_scancode_from_string
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "find_scancode_from_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the scancode of the given string (e.g. "Escape").
find_scancode_from_string ::
                            (OS :< cls, Object :< cls) => cls -> GodotString -> IO Int
find_scancode_from_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_find_scancode_from_string
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "find_scancode_from_string" '[GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.OS.find_scancode_from_string

{-# NOINLINE bindOS_get_audio_driver_count #-}

-- | Returns the total number of available audio drivers.
bindOS_get_audio_driver_count :: MethodBind
bindOS_get_audio_driver_count
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_audio_driver_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of available audio drivers.
get_audio_driver_count ::
                         (OS :< cls, Object :< cls) => cls -> IO Int
get_audio_driver_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_audio_driver_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_audio_driver_count" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_audio_driver_count

{-# NOINLINE bindOS_get_audio_driver_name #-}

-- | Returns the audio driver name for the given index.
bindOS_get_audio_driver_name :: MethodBind
bindOS_get_audio_driver_name
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_audio_driver_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the audio driver name for the given index.
get_audio_driver_name ::
                        (OS :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_audio_driver_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_audio_driver_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_audio_driver_name" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.OS.get_audio_driver_name

{-# NOINLINE bindOS_get_cmdline_args #-}

-- | Returns the command line arguments passed to the engine.
bindOS_get_cmdline_args :: MethodBind
bindOS_get_cmdline_args
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_cmdline_args" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the command line arguments passed to the engine.
get_cmdline_args ::
                   (OS :< cls, Object :< cls) => cls -> IO PoolStringArray
get_cmdline_args cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_cmdline_args (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_cmdline_args" '[] (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.OS.get_cmdline_args

{-# NOINLINE bindOS_get_connected_midi_inputs #-}

-- | Returns an array of MIDI device names.
--   				The returned array will be empty if the system MIDI driver has not previously been initialised with @method open_midi_inputs@.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_get_connected_midi_inputs :: MethodBind
bindOS_get_connected_midi_inputs
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_connected_midi_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of MIDI device names.
--   				The returned array will be empty if the system MIDI driver has not previously been initialised with @method open_midi_inputs@.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
get_connected_midi_inputs ::
                            (OS :< cls, Object :< cls) => cls -> IO PoolStringArray
get_connected_midi_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_connected_midi_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_connected_midi_inputs" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.OS.get_connected_midi_inputs

{-# NOINLINE bindOS_get_current_video_driver #-}

-- | Returns the currently used video driver, using one of the values from @enum VideoDriver@.
bindOS_get_current_video_driver :: MethodBind
bindOS_get_current_video_driver
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_current_video_driver" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently used video driver, using one of the values from @enum VideoDriver@.
get_current_video_driver ::
                           (OS :< cls, Object :< cls) => cls -> IO Int
get_current_video_driver cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_current_video_driver (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_current_video_driver" '[] (IO Int)
         where
        nodeMethod = Godot.Core.OS.get_current_video_driver

{-# NOINLINE bindOS_get_date #-}

-- | Returns current date as a dictionary of keys: @year@, @month@, @day@, @weekday@, @dst@ (Daylight Savings Time).
bindOS_get_date :: MethodBind
bindOS_get_date
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_date" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns current date as a dictionary of keys: @year@, @month@, @day@, @weekday@, @dst@ (Daylight Savings Time).
get_date ::
           (OS :< cls, Object :< cls) => cls -> Maybe Bool -> IO Dictionary
get_date cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_date (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_date" '[Maybe Bool] (IO Dictionary)
         where
        nodeMethod = Godot.Core.OS.get_date

{-# NOINLINE bindOS_get_datetime #-}

-- | Returns current datetime as a dictionary of keys: @year@, @month@, @day@, @weekday@, @dst@ (Daylight Savings Time), @hour@, @minute@, @second@.
bindOS_get_datetime :: MethodBind
bindOS_get_datetime
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_datetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns current datetime as a dictionary of keys: @year@, @month@, @day@, @weekday@, @dst@ (Daylight Savings Time), @hour@, @minute@, @second@.
get_datetime ::
               (OS :< cls, Object :< cls) => cls -> Maybe Bool -> IO Dictionary
get_datetime cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_datetime (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_datetime" '[Maybe Bool] (IO Dictionary)
         where
        nodeMethod = Godot.Core.OS.get_datetime

{-# NOINLINE bindOS_get_datetime_from_unix_time #-}

-- | Gets a dictionary of time values corresponding to the given UNIX epoch time (in seconds).
--   				The returned Dictionary's values will be the same as @method get_datetime@, with the exception of Daylight Savings Time as it cannot be determined from the epoch.
bindOS_get_datetime_from_unix_time :: MethodBind
bindOS_get_datetime_from_unix_time
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_datetime_from_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets a dictionary of time values corresponding to the given UNIX epoch time (in seconds).
--   				The returned Dictionary's values will be the same as @method get_datetime@, with the exception of Daylight Savings Time as it cannot be determined from the epoch.
get_datetime_from_unix_time ::
                              (OS :< cls, Object :< cls) => cls -> Int -> IO Dictionary
get_datetime_from_unix_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_datetime_from_unix_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_datetime_from_unix_time" '[Int]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.OS.get_datetime_from_unix_time

{-# NOINLINE bindOS_get_dynamic_memory_usage #-}

-- | Returns the total amount of dynamic memory used (only works in debug).
bindOS_get_dynamic_memory_usage :: MethodBind
bindOS_get_dynamic_memory_usage
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_dynamic_memory_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total amount of dynamic memory used (only works in debug).
get_dynamic_memory_usage ::
                           (OS :< cls, Object :< cls) => cls -> IO Int
get_dynamic_memory_usage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_dynamic_memory_usage (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_dynamic_memory_usage" '[] (IO Int)
         where
        nodeMethod = Godot.Core.OS.get_dynamic_memory_usage

{-# NOINLINE bindOS_get_environment #-}

-- | Returns an environment variable.
bindOS_get_environment :: MethodBind
bindOS_get_environment
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an environment variable.
get_environment ::
                  (OS :< cls, Object :< cls) => cls -> GodotString -> IO GodotString
get_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_environment (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_environment" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.OS.get_environment

{-# NOINLINE bindOS_get_executable_path #-}

-- | Returns the path to the current engine executable.
bindOS_get_executable_path :: MethodBind
bindOS_get_executable_path
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_executable_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the path to the current engine executable.
get_executable_path ::
                      (OS :< cls, Object :< cls) => cls -> IO GodotString
get_executable_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_executable_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_executable_path" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.OS.get_executable_path

{-# NOINLINE bindOS_get_granted_permissions #-}

-- | With this function you can get the list of dangerous permissions that have been granted to the Android application.
--   				__Note:__ This method is implemented on Android.
bindOS_get_granted_permissions :: MethodBind
bindOS_get_granted_permissions
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_granted_permissions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | With this function you can get the list of dangerous permissions that have been granted to the Android application.
--   				__Note:__ This method is implemented on Android.
get_granted_permissions ::
                          (OS :< cls, Object :< cls) => cls -> IO PoolStringArray
get_granted_permissions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_granted_permissions (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_granted_permissions" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.OS.get_granted_permissions

{-# NOINLINE bindOS_get_ime_selection #-}

-- | Returns the IME cursor position (the currently-edited portion of the string) relative to the characters in the composition string.
--   				@MainLoop.NOTIFICATION_OS_IME_UPDATE@ is sent to the application to notify it of changes to the IME cursor position.
--   				__Note:__ This method is implemented on macOS.
bindOS_get_ime_selection :: MethodBind
bindOS_get_ime_selection
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_ime_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the IME cursor position (the currently-edited portion of the string) relative to the characters in the composition string.
--   				@MainLoop.NOTIFICATION_OS_IME_UPDATE@ is sent to the application to notify it of changes to the IME cursor position.
--   				__Note:__ This method is implemented on macOS.
get_ime_selection ::
                    (OS :< cls, Object :< cls) => cls -> IO Vector2
get_ime_selection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_ime_selection (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_ime_selection" '[] (IO Vector2) where
        nodeMethod = Godot.Core.OS.get_ime_selection

{-# NOINLINE bindOS_get_ime_text #-}

-- | Returns the IME intermediate composition string.
--   				@MainLoop.NOTIFICATION_OS_IME_UPDATE@ is sent to the application to notify it of changes to the IME composition string.
--   				__Note:__ This method is implemented on macOS.
bindOS_get_ime_text :: MethodBind
bindOS_get_ime_text
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_ime_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the IME intermediate composition string.
--   				@MainLoop.NOTIFICATION_OS_IME_UPDATE@ is sent to the application to notify it of changes to the IME composition string.
--   				__Note:__ This method is implemented on macOS.
get_ime_text :: (OS :< cls, Object :< cls) => cls -> IO GodotString
get_ime_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_ime_text (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_ime_text" '[] (IO GodotString) where
        nodeMethod = Godot.Core.OS.get_ime_text

{-# NOINLINE bindOS_get_latin_keyboard_variant #-}

-- | Returns the current latin keyboard variant as a String.
--   				Possible return values are: @"QWERTY"@, @"AZERTY"@, @"QZERTY"@, @"DVORAK"@, @"NEO"@, @"COLEMAK"@ or @"ERROR"@.
--   				__Note:__ This method is implemented on Linux, macOS and Windows. Returns @"QWERTY"@ on unsupported platforms.
bindOS_get_latin_keyboard_variant :: MethodBind
bindOS_get_latin_keyboard_variant
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_latin_keyboard_variant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current latin keyboard variant as a String.
--   				Possible return values are: @"QWERTY"@, @"AZERTY"@, @"QZERTY"@, @"DVORAK"@, @"NEO"@, @"COLEMAK"@ or @"ERROR"@.
--   				__Note:__ This method is implemented on Linux, macOS and Windows. Returns @"QWERTY"@ on unsupported platforms.
get_latin_keyboard_variant ::
                             (OS :< cls, Object :< cls) => cls -> IO GodotString
get_latin_keyboard_variant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_latin_keyboard_variant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_latin_keyboard_variant" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.OS.get_latin_keyboard_variant

{-# NOINLINE bindOS_get_locale #-}

-- | Returns the host OS locale.
bindOS_get_locale :: MethodBind
bindOS_get_locale
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_locale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the host OS locale.
get_locale :: (OS :< cls, Object :< cls) => cls -> IO GodotString
get_locale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_locale (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_locale" '[] (IO GodotString) where
        nodeMethod = Godot.Core.OS.get_locale

{-# NOINLINE bindOS_get_model_name #-}

-- | Returns the model name of the current device.
--   				__Note:__ This method is implemented on Android and iOS. Returns @"GenericDevice"@ on unsupported platforms.
bindOS_get_model_name :: MethodBind
bindOS_get_model_name
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_model_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the model name of the current device.
--   				__Note:__ This method is implemented on Android and iOS. Returns @"GenericDevice"@ on unsupported platforms.
get_model_name ::
                 (OS :< cls, Object :< cls) => cls -> IO GodotString
get_model_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_model_name (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_model_name" '[] (IO GodotString) where
        nodeMethod = Godot.Core.OS.get_model_name

{-# NOINLINE bindOS_get_name #-}

-- | Returns the name of the host OS. Possible values are: @"Android"@, @"Haiku"@, @"iOS"@, @"HTML5"@, @"OSX"@, @"Server"@, @"Windows"@, @"UWP"@, @"X11"@.
bindOS_get_name :: MethodBind
bindOS_get_name
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the host OS. Possible values are: @"Android"@, @"Haiku"@, @"iOS"@, @"HTML5"@, @"OSX"@, @"Server"@, @"Windows"@, @"UWP"@, @"X11"@.
get_name :: (OS :< cls, Object :< cls) => cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_name (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_name" '[] (IO GodotString) where
        nodeMethod = Godot.Core.OS.get_name

{-# NOINLINE bindOS_get_power_percent_left #-}

-- | Returns the amount of battery left in the device as a percentage. Returns @-1@ if power state is unknown.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_get_power_percent_left :: MethodBind
bindOS_get_power_percent_left
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_power_percent_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of battery left in the device as a percentage. Returns @-1@ if power state is unknown.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
get_power_percent_left ::
                         (OS :< cls, Object :< cls) => cls -> IO Int
get_power_percent_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_power_percent_left (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_power_percent_left" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_power_percent_left

{-# NOINLINE bindOS_get_power_seconds_left #-}

-- | Returns an estimate of the time left in seconds before the device runs out of battery. Returns @-1@ if power state is unknown.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_get_power_seconds_left :: MethodBind
bindOS_get_power_seconds_left
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_power_seconds_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an estimate of the time left in seconds before the device runs out of battery. Returns @-1@ if power state is unknown.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
get_power_seconds_left ::
                         (OS :< cls, Object :< cls) => cls -> IO Int
get_power_seconds_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_power_seconds_left (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_power_seconds_left" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_power_seconds_left

{-# NOINLINE bindOS_get_power_state #-}

-- | Returns the current state of the device regarding battery and power. See @enum PowerState@ constants.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_get_power_state :: MethodBind
bindOS_get_power_state
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_power_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current state of the device regarding battery and power. See @enum PowerState@ constants.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
get_power_state :: (OS :< cls, Object :< cls) => cls -> IO Int
get_power_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_power_state (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_power_state" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_power_state

{-# NOINLINE bindOS_get_process_id #-}

-- | Returns the project's process ID.
--   				__Note:__ This method is implemented on Android, iOS, Linux, macOS and Windows.
bindOS_get_process_id :: MethodBind
bindOS_get_process_id
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_process_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the project's process ID.
--   				__Note:__ This method is implemented on Android, iOS, Linux, macOS and Windows.
get_process_id :: (OS :< cls, Object :< cls) => cls -> IO Int
get_process_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_process_id (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_process_id" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_process_id

{-# NOINLINE bindOS_get_processor_count #-}

-- | Returns the number of threads available on the host machine.
bindOS_get_processor_count :: MethodBind
bindOS_get_processor_count
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_processor_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of threads available on the host machine.
get_processor_count :: (OS :< cls, Object :< cls) => cls -> IO Int
get_processor_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_processor_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_processor_count" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_processor_count

{-# NOINLINE bindOS_get_real_window_size #-}

-- | Returns the window size including decorations like window borders.
bindOS_get_real_window_size :: MethodBind
bindOS_get_real_window_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_real_window_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the window size including decorations like window borders.
get_real_window_size ::
                       (OS :< cls, Object :< cls) => cls -> IO Vector2
get_real_window_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_real_window_size (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_real_window_size" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.OS.get_real_window_size

{-# NOINLINE bindOS_get_scancode_string #-}

-- | Returns the given scancode as a string (e.g. Return values: @"Escape"@, @"Shift+Escape"@).
--   				See also @InputEventKey.scancode@ and @method InputEventKey.get_scancode_with_modifiers@.
bindOS_get_scancode_string :: MethodBind
bindOS_get_scancode_string
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_scancode_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given scancode as a string (e.g. Return values: @"Escape"@, @"Shift+Escape"@).
--   				See also @InputEventKey.scancode@ and @method InputEventKey.get_scancode_with_modifiers@.
get_scancode_string ::
                      (OS :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_scancode_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_scancode_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_scancode_string" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.OS.get_scancode_string

{-# NOINLINE bindOS_get_screen_count #-}

-- | Returns the number of displays attached to the host machine.
bindOS_get_screen_count :: MethodBind
bindOS_get_screen_count
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_screen_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of displays attached to the host machine.
get_screen_count :: (OS :< cls, Object :< cls) => cls -> IO Int
get_screen_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_screen_count (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_screen_count" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_screen_count

{-# NOINLINE bindOS_get_screen_dpi #-}

-- | Returns the dots per inch density of the specified screen. If @screen@ is @-1@ (the default value), the current screen will be used.
--   				On Android devices, the actual screen densities are grouped into six generalized densities:
--   				
--   @
--   
--   				   ldpi - 120 dpi
--   				   mdpi - 160 dpi
--   				   hdpi - 240 dpi
--   				  xhdpi - 320 dpi
--   				 xxhdpi - 480 dpi
--   				xxxhdpi - 640 dpi
--   				
--   @
--   
--   				__Note:__ This method is implemented on Android, Linux, macOS and Windows. Returns @72@ on unsupported platforms.
bindOS_get_screen_dpi :: MethodBind
bindOS_get_screen_dpi
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_screen_dpi" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the dots per inch density of the specified screen. If @screen@ is @-1@ (the default value), the current screen will be used.
--   				On Android devices, the actual screen densities are grouped into six generalized densities:
--   				
--   @
--   
--   				   ldpi - 120 dpi
--   				   mdpi - 160 dpi
--   				   hdpi - 240 dpi
--   				  xhdpi - 320 dpi
--   				 xxhdpi - 480 dpi
--   				xxxhdpi - 640 dpi
--   				
--   @
--   
--   				__Note:__ This method is implemented on Android, Linux, macOS and Windows. Returns @72@ on unsupported platforms.
get_screen_dpi ::
                 (OS :< cls, Object :< cls) => cls -> Maybe Int -> IO Int
get_screen_dpi cls arg1
  = withVariantArray [maybe (VariantInt (-1)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_screen_dpi (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_screen_dpi" '[Maybe Int] (IO Int) where
        nodeMethod = Godot.Core.OS.get_screen_dpi

{-# NOINLINE bindOS_get_screen_position #-}

-- | Returns the position of the specified screen by index. If @screen@ is @-1@ (the default value), the current screen will be used.
bindOS_get_screen_position :: MethodBind
bindOS_get_screen_position
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_screen_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the specified screen by index. If @screen@ is @-1@ (the default value), the current screen will be used.
get_screen_position ::
                      (OS :< cls, Object :< cls) => cls -> Maybe Int -> IO Vector2
get_screen_position cls arg1
  = withVariantArray [maybe (VariantInt (-1)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_screen_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_screen_position" '[Maybe Int]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.OS.get_screen_position

{-# NOINLINE bindOS_get_screen_size #-}

-- | Returns the dimensions in pixels of the specified screen. If @screen@ is @-1@ (the default value), the current screen will be used.
bindOS_get_screen_size :: MethodBind
bindOS_get_screen_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_screen_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the dimensions in pixels of the specified screen. If @screen@ is @-1@ (the default value), the current screen will be used.
get_screen_size ::
                  (OS :< cls, Object :< cls) => cls -> Maybe Int -> IO Vector2
get_screen_size cls arg1
  = withVariantArray [maybe (VariantInt (-1)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_screen_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_screen_size" '[Maybe Int] (IO Vector2)
         where
        nodeMethod = Godot.Core.OS.get_screen_size

{-# NOINLINE bindOS_get_splash_tick_msec #-}

-- | Returns the amount of time in milliseconds it took for the boot logo to appear.
bindOS_get_splash_tick_msec :: MethodBind
bindOS_get_splash_tick_msec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_splash_tick_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of time in milliseconds it took for the boot logo to appear.
get_splash_tick_msec :: (OS :< cls, Object :< cls) => cls -> IO Int
get_splash_tick_msec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_splash_tick_msec (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_splash_tick_msec" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_splash_tick_msec

{-# NOINLINE bindOS_get_static_memory_peak_usage #-}

-- | Returns the maximum amount of static memory used (only works in debug).
bindOS_get_static_memory_peak_usage :: MethodBind
bindOS_get_static_memory_peak_usage
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_static_memory_peak_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the maximum amount of static memory used (only works in debug).
get_static_memory_peak_usage ::
                               (OS :< cls, Object :< cls) => cls -> IO Int
get_static_memory_peak_usage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_static_memory_peak_usage
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_static_memory_peak_usage" '[] (IO Int)
         where
        nodeMethod = Godot.Core.OS.get_static_memory_peak_usage

{-# NOINLINE bindOS_get_static_memory_usage #-}

-- | Returns the amount of static memory being used by the program in bytes.
bindOS_get_static_memory_usage :: MethodBind
bindOS_get_static_memory_usage
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_static_memory_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of static memory being used by the program in bytes.
get_static_memory_usage ::
                          (OS :< cls, Object :< cls) => cls -> IO Int
get_static_memory_usage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_static_memory_usage (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_static_memory_usage" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_static_memory_usage

{-# NOINLINE bindOS_get_system_dir #-}

-- | Returns the actual path to commonly used folders across different platforms. Available locations are specified in @enum SystemDir@.
--   				__Note:__ This method is implemented on Android, Linux, macOS and Windows.
bindOS_get_system_dir :: MethodBind
bindOS_get_system_dir
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_system_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the actual path to commonly used folders across different platforms. Available locations are specified in @enum SystemDir@.
--   				__Note:__ This method is implemented on Android, Linux, macOS and Windows.
get_system_dir ::
                 (OS :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_system_dir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_system_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_system_dir" '[Int] (IO GodotString)
         where
        nodeMethod = Godot.Core.OS.get_system_dir

{-# NOINLINE bindOS_get_system_time_msecs #-}

-- | Returns the epoch time of the operating system in milliseconds.
bindOS_get_system_time_msecs :: MethodBind
bindOS_get_system_time_msecs
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_system_time_msecs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the epoch time of the operating system in milliseconds.
get_system_time_msecs ::
                        (OS :< cls, Object :< cls) => cls -> IO Int
get_system_time_msecs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_system_time_msecs (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_system_time_msecs" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_system_time_msecs

{-# NOINLINE bindOS_get_system_time_secs #-}

-- | Returns the epoch time of the operating system in seconds.
bindOS_get_system_time_secs :: MethodBind
bindOS_get_system_time_secs
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_system_time_secs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the epoch time of the operating system in seconds.
get_system_time_secs :: (OS :< cls, Object :< cls) => cls -> IO Int
get_system_time_secs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_system_time_secs (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_system_time_secs" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_system_time_secs

{-# NOINLINE bindOS_get_ticks_msec #-}

-- | Returns the amount of time passed in milliseconds since the engine started.
bindOS_get_ticks_msec :: MethodBind
bindOS_get_ticks_msec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_ticks_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of time passed in milliseconds since the engine started.
get_ticks_msec :: (OS :< cls, Object :< cls) => cls -> IO Int
get_ticks_msec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_ticks_msec (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_ticks_msec" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_ticks_msec

{-# NOINLINE bindOS_get_ticks_usec #-}

-- | Returns the amount of time passed in microseconds since the engine started.
bindOS_get_ticks_usec :: MethodBind
bindOS_get_ticks_usec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_ticks_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of time passed in microseconds since the engine started.
get_ticks_usec :: (OS :< cls, Object :< cls) => cls -> IO Int
get_ticks_usec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_ticks_usec (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_ticks_usec" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_ticks_usec

{-# NOINLINE bindOS_get_time #-}

-- | Returns current time as a dictionary of keys: hour, minute, second.
bindOS_get_time :: MethodBind
bindOS_get_time
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns current time as a dictionary of keys: hour, minute, second.
get_time ::
           (OS :< cls, Object :< cls) => cls -> Maybe Bool -> IO Dictionary
get_time cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_time (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_time" '[Maybe Bool] (IO Dictionary)
         where
        nodeMethod = Godot.Core.OS.get_time

{-# NOINLINE bindOS_get_time_zone_info #-}

-- | Returns the current time zone as a dictionary with the keys: bias and name.
bindOS_get_time_zone_info :: MethodBind
bindOS_get_time_zone_info
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_time_zone_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current time zone as a dictionary with the keys: bias and name.
get_time_zone_info ::
                     (OS :< cls, Object :< cls) => cls -> IO Dictionary
get_time_zone_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_time_zone_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_time_zone_info" '[] (IO Dictionary)
         where
        nodeMethod = Godot.Core.OS.get_time_zone_info

{-# NOINLINE bindOS_get_unique_id #-}

-- | Returns a string that is unique to the device.
--   				__Note:__ Returns an empty string on HTML5 and UWP, as this method isn't implemented on those platforms yet.
bindOS_get_unique_id :: MethodBind
bindOS_get_unique_id
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_unique_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a string that is unique to the device.
--   				__Note:__ Returns an empty string on HTML5 and UWP, as this method isn't implemented on those platforms yet.
get_unique_id ::
                (OS :< cls, Object :< cls) => cls -> IO GodotString
get_unique_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_unique_id (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_unique_id" '[] (IO GodotString) where
        nodeMethod = Godot.Core.OS.get_unique_id

{-# NOINLINE bindOS_get_unix_time #-}

-- | Returns the current UNIX epoch timestamp.
bindOS_get_unix_time :: MethodBind
bindOS_get_unix_time
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current UNIX epoch timestamp.
get_unix_time :: (OS :< cls, Object :< cls) => cls -> IO Int
get_unix_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_unix_time (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_unix_time" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_unix_time

{-# NOINLINE bindOS_get_unix_time_from_datetime #-}

-- | Gets an epoch time value from a dictionary of time values.
--   				@datetime@ must be populated with the following keys: @year@, @month@, @day@, @hour@, @minute@, @second@.
--   				You can pass the output from @method get_datetime_from_unix_time@ directly into this function. Daylight Savings Time (@dst@), if present, is ignored.
bindOS_get_unix_time_from_datetime :: MethodBind
bindOS_get_unix_time_from_datetime
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_unix_time_from_datetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets an epoch time value from a dictionary of time values.
--   				@datetime@ must be populated with the following keys: @year@, @month@, @day@, @hour@, @minute@, @second@.
--   				You can pass the output from @method get_datetime_from_unix_time@ directly into this function. Daylight Savings Time (@dst@), if present, is ignored.
get_unix_time_from_datetime ::
                              (OS :< cls, Object :< cls) => cls -> Dictionary -> IO Int
get_unix_time_from_datetime cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_unix_time_from_datetime
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_unix_time_from_datetime" '[Dictionary]
           (IO Int)
         where
        nodeMethod = Godot.Core.OS.get_unix_time_from_datetime

{-# NOINLINE bindOS_get_user_data_dir #-}

-- | Returns the absolute directory path where user data is written (@user://@).
--   				On Linux, this is @~/.local/share/godot/app_userdata/@project_name@@, or @~/.local/share/@custom_name@@ if @use_custom_user_dir@ is set.
--   				On macOS, this is @~/Library/Application Support/Godot/app_userdata/@project_name@@, or @~/Library/Application Support/@custom_name@@ if @use_custom_user_dir@ is set.
--   				On Windows, this is @%APPDATA%\Godot\app_userdata\@project_name@@, or @%APPDATA%\@custom_name@@ if @use_custom_user_dir@ is set. @%APPDATA%@ expands to @%USERPROFILE%\AppData\Roaming@.
--   				If the project name is empty, @user://@ falls back to @res://@.
bindOS_get_user_data_dir :: MethodBind
bindOS_get_user_data_dir
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_user_data_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the absolute directory path where user data is written (@user://@).
--   				On Linux, this is @~/.local/share/godot/app_userdata/@project_name@@, or @~/.local/share/@custom_name@@ if @use_custom_user_dir@ is set.
--   				On macOS, this is @~/Library/Application Support/Godot/app_userdata/@project_name@@, or @~/Library/Application Support/@custom_name@@ if @use_custom_user_dir@ is set.
--   				On Windows, this is @%APPDATA%\Godot\app_userdata\@project_name@@, or @%APPDATA%\@custom_name@@ if @use_custom_user_dir@ is set. @%APPDATA%@ expands to @%USERPROFILE%\AppData\Roaming@.
--   				If the project name is empty, @user://@ falls back to @res://@.
get_user_data_dir ::
                    (OS :< cls, Object :< cls) => cls -> IO GodotString
get_user_data_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_user_data_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_user_data_dir" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.OS.get_user_data_dir

{-# NOINLINE bindOS_get_video_driver_count #-}

-- | Returns the number of video drivers supported on the current platform.
bindOS_get_video_driver_count :: MethodBind
bindOS_get_video_driver_count
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_video_driver_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of video drivers supported on the current platform.
get_video_driver_count ::
                         (OS :< cls, Object :< cls) => cls -> IO Int
get_video_driver_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_video_driver_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_video_driver_count" '[] (IO Int) where
        nodeMethod = Godot.Core.OS.get_video_driver_count

{-# NOINLINE bindOS_get_video_driver_name #-}

-- | Returns the name of the video driver matching the given @driver@ index. This index is a value from @enum VideoDriver@, and you can use @method get_current_video_driver@ to get the current backend's index.
bindOS_get_video_driver_name :: MethodBind
bindOS_get_video_driver_name
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_video_driver_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the video driver matching the given @driver@ index. This index is a value from @enum VideoDriver@, and you can use @method get_current_video_driver@ to get the current backend's index.
get_video_driver_name ::
                        (OS :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_video_driver_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_video_driver_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_video_driver_name" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.OS.get_video_driver_name

{-# NOINLINE bindOS_get_virtual_keyboard_height #-}

-- | Returns the on-screen keyboard's height in pixels. Returns 0 if there is no keyboard or if it is currently hidden.
bindOS_get_virtual_keyboard_height :: MethodBind
bindOS_get_virtual_keyboard_height
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_virtual_keyboard_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the on-screen keyboard's height in pixels. Returns 0 if there is no keyboard or if it is currently hidden.
get_virtual_keyboard_height ::
                              (OS :< cls, Object :< cls) => cls -> IO Int
get_virtual_keyboard_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_virtual_keyboard_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_virtual_keyboard_height" '[] (IO Int)
         where
        nodeMethod = Godot.Core.OS.get_virtual_keyboard_height

{-# NOINLINE bindOS_get_window_safe_area #-}

-- | Returns unobscured area of the window where interactive controls should be rendered.
bindOS_get_window_safe_area :: MethodBind
bindOS_get_window_safe_area
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_window_safe_area" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns unobscured area of the window where interactive controls should be rendered.
get_window_safe_area ::
                       (OS :< cls, Object :< cls) => cls -> IO Rect2
get_window_safe_area cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_window_safe_area (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "get_window_safe_area" '[] (IO Rect2) where
        nodeMethod = Godot.Core.OS.get_window_safe_area

{-# NOINLINE bindOS_global_menu_add_item #-}

-- | Add a new item with text "label" to global menu. Use "_dock" menu to add item to the macOS dock icon menu.
--   				__Note:__ This method is implemented on macOS.
bindOS_global_menu_add_item :: MethodBind
bindOS_global_menu_add_item
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "global_menu_add_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a new item with text "label" to global menu. Use "_dock" menu to add item to the macOS dock icon menu.
--   				__Note:__ This method is implemented on macOS.
global_menu_add_item ::
                       (OS :< cls, Object :< cls) =>
                       cls ->
                         GodotString -> GodotString -> GodotVariant -> GodotVariant -> IO ()
global_menu_add_item cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_global_menu_add_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "global_menu_add_item"
           '[GodotString, GodotString, GodotVariant, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.global_menu_add_item

{-# NOINLINE bindOS_global_menu_add_separator #-}

-- | Add a separator between items. Separators also occupy an index.
--   				__Note:__ This method is implemented on macOS.
bindOS_global_menu_add_separator :: MethodBind
bindOS_global_menu_add_separator
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "global_menu_add_separator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add a separator between items. Separators also occupy an index.
--   				__Note:__ This method is implemented on macOS.
global_menu_add_separator ::
                            (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
global_menu_add_separator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_global_menu_add_separator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "global_menu_add_separator" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.global_menu_add_separator

{-# NOINLINE bindOS_global_menu_clear #-}

-- | Clear the global menu, in effect removing all items.
--   				__Note:__ This method is implemented on macOS.
bindOS_global_menu_clear :: MethodBind
bindOS_global_menu_clear
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "global_menu_clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear the global menu, in effect removing all items.
--   				__Note:__ This method is implemented on macOS.
global_menu_clear ::
                    (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
global_menu_clear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_global_menu_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "global_menu_clear" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.OS.global_menu_clear

{-# NOINLINE bindOS_global_menu_remove_item #-}

-- | Removes the item at index "idx" from the global menu. Note that the indexes of items after the removed item are going to be shifted by one.
--   				__Note:__ This method is implemented on macOS.
bindOS_global_menu_remove_item :: MethodBind
bindOS_global_menu_remove_item
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "global_menu_remove_item" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the item at index "idx" from the global menu. Note that the indexes of items after the removed item are going to be shifted by one.
--   				__Note:__ This method is implemented on macOS.
global_menu_remove_item ::
                          (OS :< cls, Object :< cls) => cls -> GodotString -> Int -> IO ()
global_menu_remove_item cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_global_menu_remove_item (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "global_menu_remove_item"
           '[GodotString, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.global_menu_remove_item

{-# NOINLINE bindOS_has_environment #-}

-- | Returns @true@ if an environment variable exists.
bindOS_has_environment :: MethodBind
bindOS_has_environment
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "has_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if an environment variable exists.
has_environment ::
                  (OS :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_has_environment (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "has_environment" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.OS.has_environment

{-# NOINLINE bindOS_has_feature #-}

-- | Returns @true@ if the feature for the given feature tag is supported in the currently running instance, depending on platform, build etc. Can be used to check whether you're currently running a debug build, on a certain platform or arch, etc. Refer to the @url=https://docs.godotengine.org/en/latest/getting_started/workflow/export/feature_tags.html@Feature Tags@/url@ documentation for more details.
--   				__Note:__ Tag names are case-sensitive.
bindOS_has_feature :: MethodBind
bindOS_has_feature
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "has_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the feature for the given feature tag is supported in the currently running instance, depending on platform, build etc. Can be used to check whether you're currently running a debug build, on a certain platform or arch, etc. Refer to the @url=https://docs.godotengine.org/en/latest/getting_started/workflow/export/feature_tags.html@Feature Tags@/url@ documentation for more details.
--   				__Note:__ Tag names are case-sensitive.
has_feature ::
              (OS :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_feature cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_has_feature (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "has_feature" '[GodotString] (IO Bool) where
        nodeMethod = Godot.Core.OS.has_feature

{-# NOINLINE bindOS_has_touchscreen_ui_hint #-}

-- | Returns @true@ if the device has a touchscreen or emulates one.
bindOS_has_touchscreen_ui_hint :: MethodBind
bindOS_has_touchscreen_ui_hint
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "has_touchscreen_ui_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the device has a touchscreen or emulates one.
has_touchscreen_ui_hint ::
                          (OS :< cls, Object :< cls) => cls -> IO Bool
has_touchscreen_ui_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_has_touchscreen_ui_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "has_touchscreen_ui_hint" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.OS.has_touchscreen_ui_hint

{-# NOINLINE bindOS_has_virtual_keyboard #-}

-- | Returns @true@ if the platform has a virtual keyboard, @false@ otherwise.
bindOS_has_virtual_keyboard :: MethodBind
bindOS_has_virtual_keyboard
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "has_virtual_keyboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the platform has a virtual keyboard, @false@ otherwise.
has_virtual_keyboard ::
                       (OS :< cls, Object :< cls) => cls -> IO Bool
has_virtual_keyboard cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_has_virtual_keyboard (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "has_virtual_keyboard" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.has_virtual_keyboard

{-# NOINLINE bindOS_hide_virtual_keyboard #-}

-- | Hides the virtual keyboard if it is shown, does nothing otherwise.
bindOS_hide_virtual_keyboard :: MethodBind
bindOS_hide_virtual_keyboard
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "hide_virtual_keyboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Hides the virtual keyboard if it is shown, does nothing otherwise.
hide_virtual_keyboard :: (OS :< cls, Object :< cls) => cls -> IO ()
hide_virtual_keyboard cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_hide_virtual_keyboard (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "hide_virtual_keyboard" '[] (IO ()) where
        nodeMethod = Godot.Core.OS.hide_virtual_keyboard

{-# NOINLINE bindOS_is_debug_build #-}

-- | Returns @true@ if the Godot binary used to run the project is a @i@debug@/i@ export template, or when running in the editor.
--   				Returns @false@ if the Godot binary used to run the project is a @i@release@/i@ export template.
--   				To check whether the Godot binary used to run the project is an export template (debug or release), use @OS.has_feature("standalone")@ instead.
bindOS_is_debug_build :: MethodBind
bindOS_is_debug_build
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_debug_build" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the Godot binary used to run the project is a @i@debug@/i@ export template, or when running in the editor.
--   				Returns @false@ if the Godot binary used to run the project is a @i@release@/i@ export template.
--   				To check whether the Godot binary used to run the project is an export template (debug or release), use @OS.has_feature("standalone")@ instead.
is_debug_build :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_debug_build cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_debug_build (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_debug_build" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_debug_build

{-# NOINLINE bindOS_is_ok_left_and_cancel_right #-}

-- | Returns @true@ if the __OK__ button should appear on the left and __Cancel__ on the right.
bindOS_is_ok_left_and_cancel_right :: MethodBind
bindOS_is_ok_left_and_cancel_right
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_ok_left_and_cancel_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the __OK__ button should appear on the left and __Cancel__ on the right.
is_ok_left_and_cancel_right ::
                              (OS :< cls, Object :< cls) => cls -> IO Bool
is_ok_left_and_cancel_right cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_ok_left_and_cancel_right
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_ok_left_and_cancel_right" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.OS.is_ok_left_and_cancel_right

{-# NOINLINE bindOS_is_scancode_unicode #-}

-- | Returns @true@ if the input scancode corresponds to a Unicode character.
bindOS_is_scancode_unicode :: MethodBind
bindOS_is_scancode_unicode
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_scancode_unicode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the input scancode corresponds to a Unicode character.
is_scancode_unicode ::
                      (OS :< cls, Object :< cls) => cls -> Int -> IO Bool
is_scancode_unicode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_scancode_unicode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_scancode_unicode" '[Int] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_scancode_unicode

{-# NOINLINE bindOS_is_stdout_verbose #-}

-- | Returns @true@ if the engine was executed with @-v@ (verbose stdout).
bindOS_is_stdout_verbose :: MethodBind
bindOS_is_stdout_verbose
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_stdout_verbose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the engine was executed with @-v@ (verbose stdout).
is_stdout_verbose :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_stdout_verbose cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_stdout_verbose (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_stdout_verbose" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_stdout_verbose

{-# NOINLINE bindOS_is_userfs_persistent #-}

-- | If @true@, the @user://@ file system is persistent, so that its state is the same after a player quits and starts the game again. Relevant to the HTML5 platform, where this persistence may be unavailable.
bindOS_is_userfs_persistent :: MethodBind
bindOS_is_userfs_persistent
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_userfs_persistent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the @user://@ file system is persistent, so that its state is the same after a player quits and starts the game again. Relevant to the HTML5 platform, where this persistence may be unavailable.
is_userfs_persistent ::
                       (OS :< cls, Object :< cls) => cls -> IO Bool
is_userfs_persistent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_userfs_persistent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_userfs_persistent" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_userfs_persistent

{-# NOINLINE bindOS_is_window_always_on_top #-}

-- | Returns @true@ if the window should always be on top of other windows.
bindOS_is_window_always_on_top :: MethodBind
bindOS_is_window_always_on_top
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_always_on_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the window should always be on top of other windows.
is_window_always_on_top ::
                          (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_always_on_top cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_always_on_top (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_window_always_on_top" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.OS.is_window_always_on_top

{-# NOINLINE bindOS_is_window_focused #-}

-- | Returns @true@ if the window is currently focused.
--   				__Note:__ Only implemented on desktop platforms. On other platforms, it will always return @true@.
bindOS_is_window_focused :: MethodBind
bindOS_is_window_focused
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_focused" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the window is currently focused.
--   				__Note:__ Only implemented on desktop platforms. On other platforms, it will always return @true@.
is_window_focused :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_focused cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_focused (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "is_window_focused" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.is_window_focused

{-# NOINLINE bindOS_kill #-}

-- | Kill (terminate) the process identified by the given process ID (@pid@), e.g. the one returned by @method execute@ in non-blocking mode.
--   				__Note:__ This method can also be used to kill processes that were not spawned by the game.
--   				__Note:__ This method is implemented on Android, iOS, Linux, macOS and Windows.
bindOS_kill :: MethodBind
bindOS_kill
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "kill" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Kill (terminate) the process identified by the given process ID (@pid@), e.g. the one returned by @method execute@ in non-blocking mode.
--   				__Note:__ This method can also be used to kill processes that were not spawned by the game.
--   				__Note:__ This method is implemented on Android, iOS, Linux, macOS and Windows.
kill :: (OS :< cls, Object :< cls) => cls -> Int -> IO Int
kill cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_kill (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "kill" '[Int] (IO Int) where
        nodeMethod = Godot.Core.OS.kill

{-# NOINLINE bindOS_move_window_to_foreground #-}

-- | Moves the window to the front.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_move_window_to_foreground :: MethodBind
bindOS_move_window_to_foreground
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "move_window_to_foreground" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the window to the front.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
move_window_to_foreground ::
                            (OS :< cls, Object :< cls) => cls -> IO ()
move_window_to_foreground cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_move_window_to_foreground
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "move_window_to_foreground" '[] (IO ())
         where
        nodeMethod = Godot.Core.OS.move_window_to_foreground

{-# NOINLINE bindOS_native_video_is_playing #-}

-- | Returns @true@ if native video is playing.
--   				__Note:__ This method is implemented on Android and iOS.
bindOS_native_video_is_playing :: MethodBind
bindOS_native_video_is_playing
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if native video is playing.
--   				__Note:__ This method is implemented on Android and iOS.
native_video_is_playing ::
                          (OS :< cls, Object :< cls) => cls -> IO Bool
native_video_is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_is_playing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "native_video_is_playing" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.OS.native_video_is_playing

{-# NOINLINE bindOS_native_video_pause #-}

-- | Pauses native video playback.
--   				__Note:__ This method is implemented on Android and iOS.
bindOS_native_video_pause :: MethodBind
bindOS_native_video_pause
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_pause" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pauses native video playback.
--   				__Note:__ This method is implemented on Android and iOS.
native_video_pause :: (OS :< cls, Object :< cls) => cls -> IO ()
native_video_pause cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_pause (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "native_video_pause" '[] (IO ()) where
        nodeMethod = Godot.Core.OS.native_video_pause

{-# NOINLINE bindOS_native_video_play #-}

-- | Plays native video from the specified path, at the given volume and with audio and subtitle tracks.
--   				__Note:__ This method is implemented on Android and iOS, and the current Android implementation does not support the @volume@, @audio_track@ and @subtitle_track@ options.
bindOS_native_video_play :: MethodBind
bindOS_native_video_play
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Plays native video from the specified path, at the given volume and with audio and subtitle tracks.
--   				__Note:__ This method is implemented on Android and iOS, and the current Android implementation does not support the @volume@, @audio_track@ and @subtitle_track@ options.
native_video_play ::
                    (OS :< cls, Object :< cls) =>
                    cls -> GodotString -> Float -> GodotString -> GodotString -> IO Int
native_video_play cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_play (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "native_video_play"
           '[GodotString, Float, GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.OS.native_video_play

{-# NOINLINE bindOS_native_video_stop #-}

-- | Stops native video playback.
--   				__Note:__ This method is implemented on Android and iOS.
bindOS_native_video_stop :: MethodBind
bindOS_native_video_stop
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops native video playback.
--   				__Note:__ This method is implemented on Android and iOS.
native_video_stop :: (OS :< cls, Object :< cls) => cls -> IO ()
native_video_stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_stop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "native_video_stop" '[] (IO ()) where
        nodeMethod = Godot.Core.OS.native_video_stop

{-# NOINLINE bindOS_native_video_unpause #-}

-- | Resumes native video playback.
--   				__Note:__ This method is implemented on Android and iOS.
bindOS_native_video_unpause :: MethodBind
bindOS_native_video_unpause
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_unpause" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resumes native video playback.
--   				__Note:__ This method is implemented on Android and iOS.
native_video_unpause :: (OS :< cls, Object :< cls) => cls -> IO ()
native_video_unpause cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_unpause (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "native_video_unpause" '[] (IO ()) where
        nodeMethod = Godot.Core.OS.native_video_unpause

{-# NOINLINE bindOS_open_midi_inputs #-}

-- | Initialises the singleton for the system MIDI driver.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_open_midi_inputs :: MethodBind
bindOS_open_midi_inputs
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "open_midi_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initialises the singleton for the system MIDI driver.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
open_midi_inputs :: (OS :< cls, Object :< cls) => cls -> IO ()
open_midi_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_open_midi_inputs (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "open_midi_inputs" '[] (IO ()) where
        nodeMethod = Godot.Core.OS.open_midi_inputs

{-# NOINLINE bindOS_print_all_resources #-}

-- | Shows all resources in the game. Optionally, the list can be written to a file by specifying a file path in @tofile@.
bindOS_print_all_resources :: MethodBind
bindOS_print_all_resources
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "print_all_resources" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows all resources in the game. Optionally, the list can be written to a file by specifying a file path in @tofile@.
print_all_resources ::
                      (OS :< cls, Object :< cls) => cls -> Maybe GodotString -> IO ()
print_all_resources cls arg1
  = withVariantArray [defaultedVariant VariantString "" arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_print_all_resources (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "print_all_resources" '[Maybe GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.print_all_resources

{-# NOINLINE bindOS_print_all_textures_by_size #-}

-- | Shows the list of loaded textures sorted by size in memory.
bindOS_print_all_textures_by_size :: MethodBind
bindOS_print_all_textures_by_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "print_all_textures_by_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows the list of loaded textures sorted by size in memory.
print_all_textures_by_size ::
                             (OS :< cls, Object :< cls) => cls -> IO ()
print_all_textures_by_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_print_all_textures_by_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "print_all_textures_by_size" '[] (IO ())
         where
        nodeMethod = Godot.Core.OS.print_all_textures_by_size

{-# NOINLINE bindOS_print_resources_by_type #-}

-- | Shows the number of resources loaded by the game of the given types.
bindOS_print_resources_by_type :: MethodBind
bindOS_print_resources_by_type
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "print_resources_by_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows the number of resources loaded by the game of the given types.
print_resources_by_type ::
                          (OS :< cls, Object :< cls) => cls -> PoolStringArray -> IO ()
print_resources_by_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_print_resources_by_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "print_resources_by_type" '[PoolStringArray]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.print_resources_by_type

{-# NOINLINE bindOS_print_resources_in_use #-}

-- | Shows all resources currently used by the game.
bindOS_print_resources_in_use :: MethodBind
bindOS_print_resources_in_use
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "print_resources_in_use" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows all resources currently used by the game.
print_resources_in_use ::
                         (OS :< cls, Object :< cls) => cls -> Maybe Bool -> IO ()
print_resources_in_use cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_print_resources_in_use (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "print_resources_in_use" '[Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.print_resources_in_use

{-# NOINLINE bindOS_request_attention #-}

-- | Request the user attention to the window. It'll flash the taskbar button on Windows or bounce the dock icon on OSX.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_request_attention :: MethodBind
bindOS_request_attention
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "request_attention" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Request the user attention to the window. It'll flash the taskbar button on Windows or bounce the dock icon on OSX.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
request_attention :: (OS :< cls, Object :< cls) => cls -> IO ()
request_attention cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_request_attention (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "request_attention" '[] (IO ()) where
        nodeMethod = Godot.Core.OS.request_attention

{-# NOINLINE bindOS_request_permission #-}

-- | At the moment this function is only used by @AudioDriverOpenSL@ to request permission for @RECORD_AUDIO@ on Android.
bindOS_request_permission :: MethodBind
bindOS_request_permission
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "request_permission" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | At the moment this function is only used by @AudioDriverOpenSL@ to request permission for @RECORD_AUDIO@ on Android.
request_permission ::
                     (OS :< cls, Object :< cls) => cls -> GodotString -> IO Bool
request_permission cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_request_permission (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "request_permission" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.OS.request_permission

{-# NOINLINE bindOS_request_permissions #-}

-- | With this function you can request dangerous permissions since normal permissions are automatically granted at install time in Android application.
--   				__Note:__ This method is implemented on Android.
bindOS_request_permissions :: MethodBind
bindOS_request_permissions
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "request_permissions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | With this function you can request dangerous permissions since normal permissions are automatically granted at install time in Android application.
--   				__Note:__ This method is implemented on Android.
request_permissions :: (OS :< cls, Object :< cls) => cls -> IO Bool
request_permissions cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_request_permissions (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "request_permissions" '[] (IO Bool) where
        nodeMethod = Godot.Core.OS.request_permissions

{-# NOINLINE bindOS_set_icon #-}

-- | Sets the game's icon using an @Image@ resource.
--   				The same image is used for window caption, taskbar/dock and window selection dialog. Image is scaled as needed.
--   				__Note:__ This method is implemented on HTML5, Linux, macOS and Windows.
bindOS_set_icon :: MethodBind
bindOS_set_icon
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the game's icon using an @Image@ resource.
--   				The same image is used for window caption, taskbar/dock and window selection dialog. Image is scaled as needed.
--   				__Note:__ This method is implemented on HTML5, Linux, macOS and Windows.
set_icon :: (OS :< cls, Object :< cls) => cls -> Image -> IO ()
set_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_icon (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_icon" '[Image] (IO ()) where
        nodeMethod = Godot.Core.OS.set_icon

{-# NOINLINE bindOS_set_ime_active #-}

-- | Sets whether IME input mode should be enabled.
--   				If active IME handles key events before the application and creates an composition string and suggestion list.
--   				Application can retrieve the composition status by using @method get_ime_selection@ and @method get_ime_text@ functions.
--   				Completed composition string is committed when input is finished.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_set_ime_active :: MethodBind
bindOS_set_ime_active
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_ime_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether IME input mode should be enabled.
--   				If active IME handles key events before the application and creates an composition string and suggestion list.
--   				Application can retrieve the composition status by using @method get_ime_selection@ and @method get_ime_text@ functions.
--   				Completed composition string is committed when input is finished.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
set_ime_active ::
                 (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ime_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_ime_active (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_ime_active" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.OS.set_ime_active

{-# NOINLINE bindOS_set_ime_position #-}

-- | Sets position of IME suggestion list popup (in window coordinates).
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_set_ime_position :: MethodBind
bindOS_set_ime_position
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_ime_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets position of IME suggestion list popup (in window coordinates).
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
set_ime_position ::
                   (OS :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_ime_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_ime_position (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_ime_position" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.OS.set_ime_position

{-# NOINLINE bindOS_set_native_icon #-}

-- | Sets the game's icon using a multi-size platform-specific icon file (@*.ico@ on Windows and @*.icns@ on macOS).
--   				Appropriate size sub-icons are used for window caption, taskbar/dock and window selection dialog.
--   				__Note:__ This method is implemented on macOS and Windows.
bindOS_set_native_icon :: MethodBind
bindOS_set_native_icon
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_native_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the game's icon using a multi-size platform-specific icon file (@*.ico@ on Windows and @*.icns@ on macOS).
--   				Appropriate size sub-icons are used for window caption, taskbar/dock and window selection dialog.
--   				__Note:__ This method is implemented on macOS and Windows.
set_native_icon ::
                  (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_native_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_native_icon (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_native_icon" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_native_icon

{-# NOINLINE bindOS_set_thread_name #-}

-- | Sets the name of the current thread.
bindOS_set_thread_name :: MethodBind
bindOS_set_thread_name
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_thread_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the name of the current thread.
set_thread_name ::
                  (OS :< cls, Object :< cls) => cls -> GodotString -> IO Int
set_thread_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_thread_name (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_thread_name" '[GodotString] (IO Int)
         where
        nodeMethod = Godot.Core.OS.set_thread_name

{-# NOINLINE bindOS_set_use_file_access_save_and_swap #-}

-- | Enables backup saves if @enabled@ is @true@.
bindOS_set_use_file_access_save_and_swap :: MethodBind
bindOS_set_use_file_access_save_and_swap
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_use_file_access_save_and_swap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables backup saves if @enabled@ is @true@.
set_use_file_access_save_and_swap ::
                                    (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_file_access_save_and_swap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_use_file_access_save_and_swap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_use_file_access_save_and_swap" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.set_use_file_access_save_and_swap

{-# NOINLINE bindOS_set_window_always_on_top #-}

-- | Sets whether the window should always be on top.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
bindOS_set_window_always_on_top :: MethodBind
bindOS_set_window_always_on_top
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_always_on_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the window should always be on top.
--   				__Note:__ This method is implemented on Linux, macOS and Windows.
set_window_always_on_top ::
                           (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_always_on_top cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_always_on_top (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_always_on_top" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_window_always_on_top

{-# NOINLINE bindOS_set_window_title #-}

-- | Sets the window title to the specified string.
--   				__Note:__ This should be used sporadically. Don't set this every frame, as that will negatively affect performance on some window managers.
--   				__Note:__ This method is implemented on HTML5, Linux, macOS and Windows.
bindOS_set_window_title :: MethodBind
bindOS_set_window_title
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the window title to the specified string.
--   				__Note:__ This should be used sporadically. Don't set this every frame, as that will negatively affect performance on some window managers.
--   				__Note:__ This method is implemented on HTML5, Linux, macOS and Windows.
set_window_title ::
                   (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_window_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_title (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "set_window_title" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.OS.set_window_title

{-# NOINLINE bindOS_shell_open #-}

-- | Requests the OS to open a resource with the most appropriate program. For example:
--   				- @OS.shell_open("C:\\Users\name\Downloads")@ on Windows opens the file explorer at the user's Downloads folder.
--   				- @OS.shell_open("https://godotengine.org")@ opens the default web browser on the official Godot website.
--   				- @OS.shell_open("mailto:example@example.com")@ opens the default email client with the "To" field set to @example@example.com@. See @url=https://blog.escapecreative.com/customizing-mailto-links/@Customizing @mailto:@ Links@/url@ for a list of fields that can be added.
--   				__Note:__ This method is implemented on Android, iOS, HTML5, Linux, macOS and Windows.
bindOS_shell_open :: MethodBind
bindOS_shell_open
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "shell_open" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Requests the OS to open a resource with the most appropriate program. For example:
--   				- @OS.shell_open("C:\\Users\name\Downloads")@ on Windows opens the file explorer at the user's Downloads folder.
--   				- @OS.shell_open("https://godotengine.org")@ opens the default web browser on the official Godot website.
--   				- @OS.shell_open("mailto:example@example.com")@ opens the default email client with the "To" field set to @example@example.com@. See @url=https://blog.escapecreative.com/customizing-mailto-links/@Customizing @mailto:@ Links@/url@ for a list of fields that can be added.
--   				__Note:__ This method is implemented on Android, iOS, HTML5, Linux, macOS and Windows.
shell_open ::
             (OS :< cls, Object :< cls) => cls -> GodotString -> IO Int
shell_open cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_shell_open (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "shell_open" '[GodotString] (IO Int) where
        nodeMethod = Godot.Core.OS.shell_open

{-# NOINLINE bindOS_show_virtual_keyboard #-}

-- | Shows the virtual keyboard if the platform has one. The @existing_text@ parameter is useful for implementing your own LineEdit, as it tells the virtual keyboard what text has already been typed (the virtual keyboard uses it for auto-correct and predictions).
--   				__Note:__ This method is implemented on Android, iOS and UWP.
bindOS_show_virtual_keyboard :: MethodBind
bindOS_show_virtual_keyboard
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "show_virtual_keyboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows the virtual keyboard if the platform has one. The @existing_text@ parameter is useful for implementing your own LineEdit, as it tells the virtual keyboard what text has already been typed (the virtual keyboard uses it for auto-correct and predictions).
--   				__Note:__ This method is implemented on Android, iOS and UWP.
show_virtual_keyboard ::
                        (OS :< cls, Object :< cls) => cls -> Maybe GodotString -> IO ()
show_virtual_keyboard cls arg1
  = withVariantArray [defaultedVariant VariantString "" arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_show_virtual_keyboard (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod OS "show_virtual_keyboard" '[Maybe GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.OS.show_virtual_keyboard