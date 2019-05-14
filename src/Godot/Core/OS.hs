{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.OS
       (Godot.Core.OS._POWERSTATE_NO_BATTERY,
        Godot.Core.OS._SCREEN_ORIENTATION_SENSOR_PORTRAIT,
        Godot.Core.OS._SCREEN_ORIENTATION_SENSOR,
        Godot.Core.OS._DAY_THURSDAY, Godot.Core.OS._POWERSTATE_UNKNOWN,
        Godot.Core.OS._MONTH_MARCH, Godot.Core.OS._DAY_FRIDAY,
        Godot.Core.OS._SYSTEM_DIR_DOWNLOADS, Godot.Core.OS._MONTH_NOVEMBER,
        Godot.Core.OS._MONTH_JULY, Godot.Core.OS._SYSTEM_DIR_PICTURES,
        Godot.Core.OS._MONTH_DECEMBER, Godot.Core.OS._DAY_TUESDAY,
        Godot.Core.OS._SYSTEM_DIR_DESKTOP, Godot.Core.OS._DAY_MONDAY,
        Godot.Core.OS._SYSTEM_DIR_MUSIC,
        Godot.Core.OS._SYSTEM_DIR_RINGTONES, Godot.Core.OS._MONTH_AUGUST,
        Godot.Core.OS._SYSTEM_DIR_DOCUMENTS,
        Godot.Core.OS._SYSTEM_DIR_MOVIES, Godot.Core.OS._SYSTEM_DIR_DCIM,
        Godot.Core.OS._POWERSTATE_CHARGED, Godot.Core.OS._MONTH_APRIL,
        Godot.Core.OS._POWERSTATE_ON_BATTERY, Godot.Core.OS._DAY_SUNDAY,
        Godot.Core.OS._MONTH_MAY,
        Godot.Core.OS._SCREEN_ORIENTATION_REVERSE_PORTRAIT,
        Godot.Core.OS._MONTH_JANUARY, Godot.Core.OS._MONTH_OCTOBER,
        Godot.Core.OS._SCREEN_ORIENTATION_PORTRAIT,
        Godot.Core.OS._SCREEN_ORIENTATION_SENSOR_LANDSCAPE,
        Godot.Core.OS._MONTH_SEPTEMBER, Godot.Core.OS._VIDEO_DRIVER_GLES2,
        Godot.Core.OS._POWERSTATE_CHARGING, Godot.Core.OS._MONTH_FEBRUARY,
        Godot.Core.OS._MONTH_JUNE,
        Godot.Core.OS._SCREEN_ORIENTATION_REVERSE_LANDSCAPE,
        Godot.Core.OS._DAY_SATURDAY,
        Godot.Core.OS._SCREEN_ORIENTATION_LANDSCAPE,
        Godot.Core.OS._DAY_WEDNESDAY, Godot.Core.OS._VIDEO_DRIVER_GLES3,
        Godot.Core.OS.get_clipboard, Godot.Core.OS.set_clipboard,
        Godot.Core.OS.get_current_screen, Godot.Core.OS.set_current_screen,
        Godot.Core.OS.get_exit_code, Godot.Core.OS.set_exit_code,
        Godot.Core.OS.is_vsync_enabled, Godot.Core.OS.set_use_vsync,
        Godot.Core.OS.is_in_low_processor_usage_mode,
        Godot.Core.OS.set_low_processor_usage_mode,
        Godot.Core.OS.is_keep_screen_on, Godot.Core.OS.set_keep_screen_on,
        Godot.Core.OS.get_screen_orientation,
        Godot.Core.OS.set_screen_orientation,
        Godot.Core.OS.get_borderless_window,
        Godot.Core.OS.set_borderless_window,
        Godot.Core.OS.get_window_per_pixel_transparency_enabled,
        Godot.Core.OS.set_window_per_pixel_transparency_enabled,
        Godot.Core.OS.is_window_fullscreen,
        Godot.Core.OS.set_window_fullscreen,
        Godot.Core.OS.is_window_maximized,
        Godot.Core.OS.set_window_maximized,
        Godot.Core.OS.is_window_minimized,
        Godot.Core.OS.set_window_minimized,
        Godot.Core.OS.is_window_resizable,
        Godot.Core.OS.set_window_resizable,
        Godot.Core.OS.get_window_position,
        Godot.Core.OS.set_window_position, Godot.Core.OS.get_window_size,
        Godot.Core.OS.set_window_size,
        Godot.Core.OS.get_video_driver_count,
        Godot.Core.OS.get_video_driver_name,
        Godot.Core.OS.get_current_video_driver,
        Godot.Core.OS.get_audio_driver_count,
        Godot.Core.OS.get_audio_driver_name,
        Godot.Core.OS.get_connected_midi_inputs,
        Godot.Core.OS.open_midi_inputs, Godot.Core.OS.close_midi_inputs,
        Godot.Core.OS.get_screen_count, Godot.Core.OS.get_screen_position,
        Godot.Core.OS.get_screen_size, Godot.Core.OS.get_screen_dpi,
        Godot.Core.OS.get_window_safe_area,
        Godot.Core.OS.set_window_always_on_top,
        Godot.Core.OS.is_window_always_on_top,
        Godot.Core.OS.request_attention,
        Godot.Core.OS.get_real_window_size, Godot.Core.OS.center_window,
        Godot.Core.OS.move_window_to_foreground,
        Godot.Core.OS.set_ime_active, Godot.Core.OS.set_ime_position,
        Godot.Core.OS.get_ime_selection, Godot.Core.OS.get_ime_text,
        Godot.Core.OS.has_touchscreen_ui_hint,
        Godot.Core.OS.set_window_title, Godot.Core.OS.get_processor_count,
        Godot.Core.OS.get_executable_path, Godot.Core.OS.execute,
        Godot.Core.OS.kill, Godot.Core.OS.shell_open,
        Godot.Core.OS.get_process_id, Godot.Core.OS.get_environment,
        Godot.Core.OS.has_environment, Godot.Core.OS.get_name,
        Godot.Core.OS.get_cmdline_args, Godot.Core.OS.get_datetime,
        Godot.Core.OS.get_date, Godot.Core.OS.get_time,
        Godot.Core.OS.get_time_zone_info, Godot.Core.OS.get_unix_time,
        Godot.Core.OS.get_datetime_from_unix_time,
        Godot.Core.OS.get_unix_time_from_datetime,
        Godot.Core.OS.get_system_time_secs,
        Godot.Core.OS.get_system_time_msecs, Godot.Core.OS.set_icon,
        Godot.Core.OS.delay_usec, Godot.Core.OS.delay_msec,
        Godot.Core.OS.get_ticks_msec, Godot.Core.OS.get_ticks_usec,
        Godot.Core.OS.get_splash_tick_msec, Godot.Core.OS.get_locale,
        Godot.Core.OS.get_latin_keyboard_variant,
        Godot.Core.OS.get_model_name, Godot.Core.OS.can_draw,
        Godot.Core.OS.is_userfs_persistent,
        Godot.Core.OS.is_stdout_verbose, Godot.Core.OS.can_use_threads,
        Godot.Core.OS.is_debug_build, Godot.Core.OS.dump_memory_to_file,
        Godot.Core.OS.dump_resources_to_file,
        Godot.Core.OS.has_virtual_keyboard,
        Godot.Core.OS.show_virtual_keyboard,
        Godot.Core.OS.hide_virtual_keyboard,
        Godot.Core.OS.get_virtual_keyboard_height,
        Godot.Core.OS.print_resources_in_use,
        Godot.Core.OS.print_all_resources,
        Godot.Core.OS.get_static_memory_usage,
        Godot.Core.OS.get_static_memory_peak_usage,
        Godot.Core.OS.get_dynamic_memory_usage,
        Godot.Core.OS.get_user_data_dir, Godot.Core.OS.get_system_dir,
        Godot.Core.OS.get_unique_id,
        Godot.Core.OS.is_ok_left_and_cancel_right,
        Godot.Core.OS.print_all_textures_by_size,
        Godot.Core.OS.print_resources_by_type,
        Godot.Core.OS.native_video_play,
        Godot.Core.OS.native_video_is_playing,
        Godot.Core.OS.native_video_stop, Godot.Core.OS.native_video_pause,
        Godot.Core.OS.native_video_unpause,
        Godot.Core.OS.get_scancode_string,
        Godot.Core.OS.is_scancode_unicode,
        Godot.Core.OS.find_scancode_from_string,
        Godot.Core.OS.set_use_file_access_save_and_swap,
        Godot.Core.OS.alert, Godot.Core.OS.set_thread_name,
        Godot.Core.OS.has_feature, Godot.Core.OS.get_power_state,
        Godot.Core.OS.get_power_seconds_left,
        Godot.Core.OS.get_power_percent_left,
        Godot.Core.OS.request_permission)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_POWERSTATE_NO_BATTERY :: Int
_POWERSTATE_NO_BATTERY = 2

_SCREEN_ORIENTATION_SENSOR_PORTRAIT :: Int
_SCREEN_ORIENTATION_SENSOR_PORTRAIT = 5

_SCREEN_ORIENTATION_SENSOR :: Int
_SCREEN_ORIENTATION_SENSOR = 6

_DAY_THURSDAY :: Int
_DAY_THURSDAY = 4

_POWERSTATE_UNKNOWN :: Int
_POWERSTATE_UNKNOWN = 0

_MONTH_MARCH :: Int
_MONTH_MARCH = 3

_DAY_FRIDAY :: Int
_DAY_FRIDAY = 5

_SYSTEM_DIR_DOWNLOADS :: Int
_SYSTEM_DIR_DOWNLOADS = 3

_MONTH_NOVEMBER :: Int
_MONTH_NOVEMBER = 11

_MONTH_JULY :: Int
_MONTH_JULY = 7

_SYSTEM_DIR_PICTURES :: Int
_SYSTEM_DIR_PICTURES = 6

_MONTH_DECEMBER :: Int
_MONTH_DECEMBER = 12

_DAY_TUESDAY :: Int
_DAY_TUESDAY = 2

_SYSTEM_DIR_DESKTOP :: Int
_SYSTEM_DIR_DESKTOP = 0

_DAY_MONDAY :: Int
_DAY_MONDAY = 1

_SYSTEM_DIR_MUSIC :: Int
_SYSTEM_DIR_MUSIC = 5

_SYSTEM_DIR_RINGTONES :: Int
_SYSTEM_DIR_RINGTONES = 7

_MONTH_AUGUST :: Int
_MONTH_AUGUST = 8

_SYSTEM_DIR_DOCUMENTS :: Int
_SYSTEM_DIR_DOCUMENTS = 2

_SYSTEM_DIR_MOVIES :: Int
_SYSTEM_DIR_MOVIES = 4

_SYSTEM_DIR_DCIM :: Int
_SYSTEM_DIR_DCIM = 1

_POWERSTATE_CHARGED :: Int
_POWERSTATE_CHARGED = 4

_MONTH_APRIL :: Int
_MONTH_APRIL = 4

_POWERSTATE_ON_BATTERY :: Int
_POWERSTATE_ON_BATTERY = 1

_DAY_SUNDAY :: Int
_DAY_SUNDAY = 0

_MONTH_MAY :: Int
_MONTH_MAY = 5

_SCREEN_ORIENTATION_REVERSE_PORTRAIT :: Int
_SCREEN_ORIENTATION_REVERSE_PORTRAIT = 3

_MONTH_JANUARY :: Int
_MONTH_JANUARY = 1

_MONTH_OCTOBER :: Int
_MONTH_OCTOBER = 10

_SCREEN_ORIENTATION_PORTRAIT :: Int
_SCREEN_ORIENTATION_PORTRAIT = 1

_SCREEN_ORIENTATION_SENSOR_LANDSCAPE :: Int
_SCREEN_ORIENTATION_SENSOR_LANDSCAPE = 4

_MONTH_SEPTEMBER :: Int
_MONTH_SEPTEMBER = 9

_VIDEO_DRIVER_GLES2 :: Int
_VIDEO_DRIVER_GLES2 = 1

_POWERSTATE_CHARGING :: Int
_POWERSTATE_CHARGING = 3

_MONTH_FEBRUARY :: Int
_MONTH_FEBRUARY = 2

_MONTH_JUNE :: Int
_MONTH_JUNE = 6

_SCREEN_ORIENTATION_REVERSE_LANDSCAPE :: Int
_SCREEN_ORIENTATION_REVERSE_LANDSCAPE = 2

_DAY_SATURDAY :: Int
_DAY_SATURDAY = 6

_SCREEN_ORIENTATION_LANDSCAPE :: Int
_SCREEN_ORIENTATION_LANDSCAPE = 0

_DAY_WEDNESDAY :: Int
_DAY_WEDNESDAY = 3

_VIDEO_DRIVER_GLES3 :: Int
_VIDEO_DRIVER_GLES3 = 0

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

{-# NOINLINE bindOS_get_exit_code #-}

-- | The exit code passed to the OS when the main loop exits.
bindOS_get_exit_code :: MethodBind
bindOS_get_exit_code
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_exit_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The exit code passed to the OS when the main loop exits.
get_exit_code :: (OS :< cls, Object :< cls) => cls -> IO Int
get_exit_code cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_exit_code (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_exit_code #-}

-- | The exit code passed to the OS when the main loop exits.
bindOS_set_exit_code :: MethodBind
bindOS_set_exit_code
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_exit_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The exit code passed to the OS when the main loop exits.
set_exit_code :: (OS :< cls, Object :< cls) => cls -> Int -> IO ()
set_exit_code cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_exit_code (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_vsync_enabled #-}

-- | If [code]true[/code], vertical synchronization (Vsync) is enabled.
bindOS_is_vsync_enabled :: MethodBind
bindOS_is_vsync_enabled
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_vsync_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], vertical synchronization (Vsync) is enabled.
is_vsync_enabled :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_vsync_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_vsync_enabled (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_use_vsync #-}

-- | If [code]true[/code], vertical synchronization (Vsync) is enabled.
bindOS_set_use_vsync :: MethodBind
bindOS_set_use_vsync
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_use_vsync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], vertical synchronization (Vsync) is enabled.
set_use_vsync :: (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_vsync cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_use_vsync (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_in_low_processor_usage_mode #-}

-- | If [code]true[/code], the engine optimizes for low processor usage by only refreshing the screen if needed. Can improve battery consumption on mobile.
bindOS_is_in_low_processor_usage_mode :: MethodBind
bindOS_is_in_low_processor_usage_mode
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_in_low_processor_usage_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the engine optimizes for low processor usage by only refreshing the screen if needed. Can improve battery consumption on mobile.
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

{-# NOINLINE bindOS_set_low_processor_usage_mode #-}

-- | If [code]true[/code], the engine optimizes for low processor usage by only refreshing the screen if needed. Can improve battery consumption on mobile.
bindOS_set_low_processor_usage_mode :: MethodBind
bindOS_set_low_processor_usage_mode
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_low_processor_usage_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the engine optimizes for low processor usage by only refreshing the screen if needed. Can improve battery consumption on mobile.
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

{-# NOINLINE bindOS_is_keep_screen_on #-}

-- | If [code]true[/code], the engine tries to keep the screen on while the game is running. Useful on mobile.
bindOS_is_keep_screen_on :: MethodBind
bindOS_is_keep_screen_on
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_keep_screen_on" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the engine tries to keep the screen on while the game is running. Useful on mobile.
is_keep_screen_on :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_keep_screen_on cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_keep_screen_on (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_keep_screen_on #-}

-- | If [code]true[/code], the engine tries to keep the screen on while the game is running. Useful on mobile.
bindOS_set_keep_screen_on :: MethodBind
bindOS_set_keep_screen_on
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_keep_screen_on" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the engine tries to keep the screen on while the game is running. Useful on mobile.
set_keep_screen_on ::
                     (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_keep_screen_on cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_keep_screen_on (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_borderless_window #-}

-- | If [code]true[/code], removes the window frame.
bindOS_get_borderless_window :: MethodBind
bindOS_get_borderless_window
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_borderless_window" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], removes the window frame.
get_borderless_window ::
                        (OS :< cls, Object :< cls) => cls -> IO Bool
get_borderless_window cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_borderless_window (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_borderless_window #-}

-- | If [code]true[/code], removes the window frame.
bindOS_set_borderless_window :: MethodBind
bindOS_set_borderless_window
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_borderless_window" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], removes the window frame.
set_borderless_window ::
                        (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_borderless_window cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_borderless_window (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_window_per_pixel_transparency_enabled #-}

bindOS_get_window_per_pixel_transparency_enabled :: MethodBind
bindOS_get_window_per_pixel_transparency_enabled
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_window_per_pixel_transparency_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindOS_set_window_per_pixel_transparency_enabled #-}

bindOS_set_window_per_pixel_transparency_enabled :: MethodBind
bindOS_set_window_per_pixel_transparency_enabled
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_per_pixel_transparency_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindOS_is_window_fullscreen #-}

-- | If [code]true[/code], the window is fullscreen.
bindOS_is_window_fullscreen :: MethodBind
bindOS_is_window_fullscreen
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_fullscreen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the window is fullscreen.
is_window_fullscreen ::
                       (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_fullscreen cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_fullscreen (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_window_fullscreen #-}

-- | If [code]true[/code], the window is fullscreen.
bindOS_set_window_fullscreen :: MethodBind
bindOS_set_window_fullscreen
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_fullscreen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the window is fullscreen.
set_window_fullscreen ::
                        (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_fullscreen cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_fullscreen (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_window_maximized #-}

-- | If [code]true[/code], the window is maximized.
bindOS_is_window_maximized :: MethodBind
bindOS_is_window_maximized
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_maximized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the window is maximized.
is_window_maximized :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_maximized cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_maximized (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_window_maximized #-}

-- | If [code]true[/code], the window is maximized.
bindOS_set_window_maximized :: MethodBind
bindOS_set_window_maximized
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_maximized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the window is maximized.
set_window_maximized ::
                       (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_maximized cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_maximized (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_window_minimized #-}

-- | If [code]true[/code], the window is minimized.
bindOS_is_window_minimized :: MethodBind
bindOS_is_window_minimized
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_minimized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the window is minimized.
is_window_minimized :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_minimized cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_minimized (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_window_minimized #-}

-- | If [code]true[/code], the window is minimized.
bindOS_set_window_minimized :: MethodBind
bindOS_set_window_minimized
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_minimized" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the window is minimized.
set_window_minimized ::
                       (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_minimized cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_minimized (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_window_resizable #-}

-- | If [code]true[/code], the window is resizable by the user.
bindOS_is_window_resizable :: MethodBind
bindOS_is_window_resizable
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the window is resizable by the user.
is_window_resizable :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_resizable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_window_resizable #-}

-- | If [code]true[/code], the window is resizable by the user.
bindOS_set_window_resizable :: MethodBind
bindOS_set_window_resizable
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_resizable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the window is resizable by the user.
set_window_resizable ::
                       (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_resizable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_resizable (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_video_driver_name #-}

-- | Returns the name of the video driver matching the given [code]driver[/code] index. This index is a value from [enum OS.VideoDriver], and you can use [method get_current_video_driver] to get the current backend's index.
bindOS_get_video_driver_name :: MethodBind
bindOS_get_video_driver_name
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_video_driver_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the video driver matching the given [code]driver[/code] index. This index is a value from [enum OS.VideoDriver], and you can use [method get_current_video_driver] to get the current backend's index.
get_video_driver_name ::
                        (OS :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_video_driver_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_video_driver_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_current_video_driver #-}

-- | Returns the currently used video driver, using one of the values from [enum OS.VideoDriver].
bindOS_get_current_video_driver :: MethodBind
bindOS_get_current_video_driver
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_current_video_driver" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the currently used video driver, using one of the values from [enum OS.VideoDriver].
get_current_video_driver ::
                           (OS :< cls, Object :< cls) => cls -> IO Int
get_current_video_driver cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_current_video_driver (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_connected_midi_inputs #-}

bindOS_get_connected_midi_inputs :: MethodBind
bindOS_get_connected_midi_inputs
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_connected_midi_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindOS_open_midi_inputs #-}

bindOS_open_midi_inputs :: MethodBind
bindOS_open_midi_inputs
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "open_midi_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

open_midi_inputs :: (OS :< cls, Object :< cls) => cls -> IO ()
open_midi_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_open_midi_inputs (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_close_midi_inputs #-}

bindOS_close_midi_inputs :: MethodBind
bindOS_close_midi_inputs
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "close_midi_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

close_midi_inputs :: (OS :< cls, Object :< cls) => cls -> IO ()
close_midi_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_close_midi_inputs (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_screen_position #-}

-- | Returns the position of the specified screen by index. If no screen index is provided, the current screen will be used.
bindOS_get_screen_position :: MethodBind
bindOS_get_screen_position
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_screen_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the specified screen by index. If no screen index is provided, the current screen will be used.
get_screen_position ::
                      (OS :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_screen_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_screen_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_screen_size #-}

-- | Returns the dimensions in pixels of the specified screen.
bindOS_get_screen_size :: MethodBind
bindOS_get_screen_size
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_screen_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the dimensions in pixels of the specified screen.
get_screen_size ::
                  (OS :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_screen_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_screen_size (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_screen_dpi #-}

-- | Returns the dots per inch density of the specified screen.
--   				On Android Devices, the actual screen densities are grouped into six generalized densities:
--   					ldpi    - 120 dpi
--   					mdpi    - 160 dpi
--   					hdpi    - 240 dpi
--   					xhdpi   - 320 dpi
--   					xxhdpi  - 480 dpi
--   					xxxhdpi - 640 dpi
bindOS_get_screen_dpi :: MethodBind
bindOS_get_screen_dpi
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_screen_dpi" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the dots per inch density of the specified screen.
--   				On Android Devices, the actual screen densities are grouped into six generalized densities:
--   					ldpi    - 120 dpi
--   					mdpi    - 160 dpi
--   					hdpi    - 240 dpi
--   					xhdpi   - 320 dpi
--   					xxhdpi  - 480 dpi
--   					xxxhdpi - 640 dpi
get_screen_dpi ::
                 (OS :< cls, Object :< cls) => cls -> Int -> IO Int
get_screen_dpi cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_screen_dpi (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_window_safe_area #-}

bindOS_get_window_safe_area :: MethodBind
bindOS_get_window_safe_area
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_window_safe_area" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_window_safe_area ::
                       (OS :< cls, Object :< cls) => cls -> IO Rect2
get_window_safe_area cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_window_safe_area (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_window_always_on_top #-}

-- | Sets whether the window should always be on top.
bindOS_set_window_always_on_top :: MethodBind
bindOS_set_window_always_on_top
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_always_on_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether the window should always be on top.
set_window_always_on_top ::
                           (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_window_always_on_top cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_always_on_top (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_window_always_on_top #-}

-- | Returns [code]true[/code] if the window should always be on top of other windows.
bindOS_is_window_always_on_top :: MethodBind
bindOS_is_window_always_on_top
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_window_always_on_top" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the window should always be on top of other windows.
is_window_always_on_top ::
                          (OS :< cls, Object :< cls) => cls -> IO Bool
is_window_always_on_top cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_window_always_on_top (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_request_attention #-}

-- | Request the user attention to the window. It'll flash the taskbar button on Windows or bounce the dock icon on OSX.
bindOS_request_attention :: MethodBind
bindOS_request_attention
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "request_attention" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Request the user attention to the window. It'll flash the taskbar button on Windows or bounce the dock icon on OSX.
request_attention :: (OS :< cls, Object :< cls) => cls -> IO ()
request_attention cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_request_attention (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_move_window_to_foreground #-}

-- | Moves the window to the front.
bindOS_move_window_to_foreground :: MethodBind
bindOS_move_window_to_foreground
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "move_window_to_foreground" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the window to the front.
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

{-# NOINLINE bindOS_set_ime_active #-}

-- | Sets whether IME input mode should be enabled.
bindOS_set_ime_active :: MethodBind
bindOS_set_ime_active
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_ime_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether IME input mode should be enabled.
set_ime_active ::
                 (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
set_ime_active cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_ime_active (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_ime_position #-}

-- | Sets position of IME suggestion list popup (in window coordinates).
bindOS_set_ime_position :: MethodBind
bindOS_set_ime_position
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_ime_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets position of IME suggestion list popup (in window coordinates).
set_ime_position ::
                   (OS :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_ime_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_ime_position (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_ime_selection #-}

-- | Returns IME selection range.
bindOS_get_ime_selection :: MethodBind
bindOS_get_ime_selection
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_ime_selection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns IME selection range.
get_ime_selection ::
                    (OS :< cls, Object :< cls) => cls -> IO Vector2
get_ime_selection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_ime_selection (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_ime_text #-}

-- | Returns IME intermediate text.
bindOS_get_ime_text :: MethodBind
bindOS_get_ime_text
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_ime_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns IME intermediate text.
get_ime_text :: (OS :< cls, Object :< cls) => cls -> IO GodotString
get_ime_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_ime_text (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_has_touchscreen_ui_hint #-}

-- | Returns [code]true[/code] if the device has a touchscreen or emulates one.
bindOS_has_touchscreen_ui_hint :: MethodBind
bindOS_has_touchscreen_ui_hint
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "has_touchscreen_ui_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the device has a touchscreen or emulates one.
has_touchscreen_ui_hint ::
                          (OS :< cls, Object :< cls) => cls -> IO Bool
has_touchscreen_ui_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_has_touchscreen_ui_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_set_window_title #-}

-- | Sets the window title to the specified string.
bindOS_set_window_title :: MethodBind
bindOS_set_window_title
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_window_title" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the window title to the specified string.
set_window_title ::
                   (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_window_title cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_window_title (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_processor_count #-}

-- | Returns the number of cores available in the host machine.
bindOS_get_processor_count :: MethodBind
bindOS_get_processor_count
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_processor_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of cores available in the host machine.
get_processor_count :: (OS :< cls, Object :< cls) => cls -> IO Int
get_processor_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_processor_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_execute #-}

-- | Execute the file at the given path with the arguments passed as an array of strings. Platform path resolution will take place. The resolved file must exist and be executable.
--   				The arguments are used in the given order and separated by a space, so [code]OS.execute('ping', ['-w', '3', 'godotengine.org'], false)[/code] will resolve to [code]ping -w 3 godotengine.org[/code] in the system's shell.
--   				This method has slightly different behaviour based on whether the [code]blocking[/code] mode is enabled.
--   				When [code]blocking[/code] is enabled, the Godot thread will pause its execution while waiting for the process to terminate. The shell output of the process will be written to the [code]output[/code] array as a single string. When the process terminates, the Godot thread will resume execution.
--   				When [code]blocking[/code] is disabled, the Godot thread will continue while the new process runs. It is not possible to retrieve the shell output in non-blocking mode, so [code]output[/code] will be empty.
--   				The return value also depends on the blocking mode. When blocking, the method will return -2 (no process ID information is available in blocking mode). When non-blocking, the method returns a process ID, which you can use to monitor the process (and potentially terminate it with [method kill]). If the process forking (non-blocking) or opening (blocking) fails, the method will return -1.
--   				Example of blocking mode and retrieving the shell output:
--   				[codeblock]
--   				var output = []
--   				OS.execute('ls', ['-l', '/tmp'], true, output)
--   				[/codeblock]
--   				Example of non-blocking mode, running another instance of the project and storing its process ID:
--   				[codeblock]
--   				var pid = OS.execute(OS.get_executable_path(), [], false)
--   				[/codeblock]
--   				If you wish to access a shell built-in or perform a composite command, a platform-specific shell can be invoked. For example:
--   				[codeblock]
--   				OS.execute('CMD.exe', ['/C', 'cd %TEMP% && dir'], true, output)
--   				[/codeblock]
bindOS_execute :: MethodBind
bindOS_execute
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "execute" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Execute the file at the given path with the arguments passed as an array of strings. Platform path resolution will take place. The resolved file must exist and be executable.
--   				The arguments are used in the given order and separated by a space, so [code]OS.execute('ping', ['-w', '3', 'godotengine.org'], false)[/code] will resolve to [code]ping -w 3 godotengine.org[/code] in the system's shell.
--   				This method has slightly different behaviour based on whether the [code]blocking[/code] mode is enabled.
--   				When [code]blocking[/code] is enabled, the Godot thread will pause its execution while waiting for the process to terminate. The shell output of the process will be written to the [code]output[/code] array as a single string. When the process terminates, the Godot thread will resume execution.
--   				When [code]blocking[/code] is disabled, the Godot thread will continue while the new process runs. It is not possible to retrieve the shell output in non-blocking mode, so [code]output[/code] will be empty.
--   				The return value also depends on the blocking mode. When blocking, the method will return -2 (no process ID information is available in blocking mode). When non-blocking, the method returns a process ID, which you can use to monitor the process (and potentially terminate it with [method kill]). If the process forking (non-blocking) or opening (blocking) fails, the method will return -1.
--   				Example of blocking mode and retrieving the shell output:
--   				[codeblock]
--   				var output = []
--   				OS.execute('ls', ['-l', '/tmp'], true, output)
--   				[/codeblock]
--   				Example of non-blocking mode, running another instance of the project and storing its process ID:
--   				[codeblock]
--   				var pid = OS.execute(OS.get_executable_path(), [], false)
--   				[/codeblock]
--   				If you wish to access a shell built-in or perform a composite command, a platform-specific shell can be invoked. For example:
--   				[codeblock]
--   				OS.execute('CMD.exe', ['/C', 'cd %TEMP% && dir'], true, output)
--   				[/codeblock]
execute ::
          (OS :< cls, Object :< cls) =>
          cls -> GodotString -> PoolStringArray -> Bool -> Array -> IO Int
execute cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_execute (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_kill #-}

-- | Kill (terminate) the process identified by the given process ID ([code]pid[/code]), e.g. the one returned by [method execute] in non-blocking mode.
--   				Note that this method can also be used to kill processes that were not spawned by the game.
bindOS_kill :: MethodBind
bindOS_kill
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "kill" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Kill (terminate) the process identified by the given process ID ([code]pid[/code]), e.g. the one returned by [method execute] in non-blocking mode.
--   				Note that this method can also be used to kill processes that were not spawned by the game.
kill :: (OS :< cls, Object :< cls) => cls -> Int -> IO Int
kill cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_kill (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_shell_open #-}

-- | Requests the OS to open a resource with the most appropriate program. For example.
--   					[code]OS.shell_open("C:\\Users\name\Downloads")[/code] on Windows opens the file explorer at the downloads folders of the user.
--   					[code]OS.shell_open("https://godotengine.org")[/code] opens the default web browser on the official Godot website.
bindOS_shell_open :: MethodBind
bindOS_shell_open
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "shell_open" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Requests the OS to open a resource with the most appropriate program. For example.
--   					[code]OS.shell_open("C:\\Users\name\Downloads")[/code] on Windows opens the file explorer at the downloads folders of the user.
--   					[code]OS.shell_open("https://godotengine.org")[/code] opens the default web browser on the official Godot website.
shell_open ::
             (OS :< cls, Object :< cls) => cls -> GodotString -> IO Int
shell_open cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_shell_open (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_process_id #-}

-- | Returns the game process ID
bindOS_get_process_id :: MethodBind
bindOS_get_process_id
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_process_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the game process ID
get_process_id :: (OS :< cls, Object :< cls) => cls -> IO Int
get_process_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_process_id (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_has_environment #-}

-- | Returns [code]true[/code] if an environment variable exists.
bindOS_has_environment :: MethodBind
bindOS_has_environment
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "has_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if an environment variable exists.
has_environment ::
                  (OS :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_has_environment (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_name #-}

-- | Returns the name of the host OS. Possible values are: "Android", "Haiku", "iOS", "HTML5", "OSX", "Server", "Windows", "UWP", "X11".
bindOS_get_name :: MethodBind
bindOS_get_name
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the host OS. Possible values are: "Android", "Haiku", "iOS", "HTML5", "OSX", "Server", "Windows", "UWP", "X11".
get_name :: (OS :< cls, Object :< cls) => cls -> IO GodotString
get_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_name (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_datetime #-}

-- | Returns current datetime as a dictionary of keys: year, month, day, weekday, dst (daylight savings time), hour, minute, second.
bindOS_get_datetime :: MethodBind
bindOS_get_datetime
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_datetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns current datetime as a dictionary of keys: year, month, day, weekday, dst (daylight savings time), hour, minute, second.
get_datetime ::
               (OS :< cls, Object :< cls) => cls -> Bool -> IO Dictionary
get_datetime cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_datetime (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_date #-}

-- | Returns current date as a dictionary of keys: year, month, day, weekday, dst (daylight savings time).
bindOS_get_date :: MethodBind
bindOS_get_date
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_date" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns current date as a dictionary of keys: year, month, day, weekday, dst (daylight savings time).
get_date ::
           (OS :< cls, Object :< cls) => cls -> Bool -> IO Dictionary
get_date cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_date (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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
           (OS :< cls, Object :< cls) => cls -> Bool -> IO Dictionary
get_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_time (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_unix_time #-}

-- | Returns the current unix epoch timestamp.
bindOS_get_unix_time :: MethodBind
bindOS_get_unix_time
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current unix epoch timestamp.
get_unix_time :: (OS :< cls, Object :< cls) => cls -> IO Int
get_unix_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_unix_time (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_datetime_from_unix_time #-}

-- | Get a dictionary of time values when given epoch time.
--   				Dictionary Time values will be a union of values from [method get_time] and [method get_date] dictionaries (with the exception of dst = day light standard time, as it cannot be determined from epoch).
bindOS_get_datetime_from_unix_time :: MethodBind
bindOS_get_datetime_from_unix_time
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_datetime_from_unix_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get a dictionary of time values when given epoch time.
--   				Dictionary Time values will be a union of values from [method get_time] and [method get_date] dictionaries (with the exception of dst = day light standard time, as it cannot be determined from epoch).
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

{-# NOINLINE bindOS_get_unix_time_from_datetime #-}

-- | Get an epoch time value from a dictionary of time values.
--   				[code]datetime[/code] must be populated with the following keys: year, month, day, hour, minute, second.
--   				You can pass the output from [method get_datetime_from_unix_time] directly into this function. Daylight savings time (dst), if present, is ignored.
bindOS_get_unix_time_from_datetime :: MethodBind
bindOS_get_unix_time_from_datetime
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_unix_time_from_datetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get an epoch time value from a dictionary of time values.
--   				[code]datetime[/code] must be populated with the following keys: year, month, day, hour, minute, second.
--   				You can pass the output from [method get_datetime_from_unix_time] directly into this function. Daylight savings time (dst), if present, is ignored.
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

{-# NOINLINE bindOS_set_icon #-}

-- | Sets the game's icon.
bindOS_set_icon :: MethodBind
bindOS_set_icon
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_icon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the game's icon.
set_icon :: (OS :< cls, Object :< cls) => cls -> Image -> IO ()
set_icon cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_set_icon (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_delay_usec #-}

-- | Delay execution of the current thread by given microseconds.
bindOS_delay_usec :: MethodBind
bindOS_delay_usec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "delay_usec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Delay execution of the current thread by given microseconds.
delay_usec :: (OS :< cls, Object :< cls) => cls -> Int -> IO ()
delay_usec cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_delay_usec (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_delay_msec #-}

-- | Delay execution of the current thread by given milliseconds.
bindOS_delay_msec :: MethodBind
bindOS_delay_msec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "delay_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Delay execution of the current thread by given milliseconds.
delay_msec :: (OS :< cls, Object :< cls) => cls -> Int -> IO ()
delay_msec cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_delay_msec (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_splash_tick_msec #-}

bindOS_get_splash_tick_msec :: MethodBind
bindOS_get_splash_tick_msec
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_splash_tick_msec" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_splash_tick_msec :: (OS :< cls, Object :< cls) => cls -> IO Int
get_splash_tick_msec cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_splash_tick_msec (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_latin_keyboard_variant #-}

-- | Returns the current latin keyboard variant as a String.
--   				Possible return values are: "QWERTY", "AZERTY", "QZERTY", "DVORAK", "NEO", "COLEMAK" or "ERROR".
bindOS_get_latin_keyboard_variant :: MethodBind
bindOS_get_latin_keyboard_variant
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_latin_keyboard_variant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current latin keyboard variant as a String.
--   				Possible return values are: "QWERTY", "AZERTY", "QZERTY", "DVORAK", "NEO", "COLEMAK" or "ERROR".
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

{-# NOINLINE bindOS_get_model_name #-}

-- | Returns the model name of the current device.
bindOS_get_model_name :: MethodBind
bindOS_get_model_name
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_model_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the model name of the current device.
get_model_name ::
                 (OS :< cls, Object :< cls) => cls -> IO GodotString
get_model_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_model_name (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_can_draw #-}

-- | Returns [code]true[/code] if the host OS allows drawing.
bindOS_can_draw :: MethodBind
bindOS_can_draw
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "can_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the host OS allows drawing.
can_draw :: (OS :< cls, Object :< cls) => cls -> IO Bool
can_draw cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_can_draw (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_userfs_persistent #-}

-- | If [code]true[/code], the [code]user://[/code] file system is persistent, so that its state is the same after a player quits and starts the game again. Relevant to the HTML5 platform, where this persistence may be unavailable.
bindOS_is_userfs_persistent :: MethodBind
bindOS_is_userfs_persistent
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_userfs_persistent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the [code]user://[/code] file system is persistent, so that its state is the same after a player quits and starts the game again. Relevant to the HTML5 platform, where this persistence may be unavailable.
is_userfs_persistent ::
                       (OS :< cls, Object :< cls) => cls -> IO Bool
is_userfs_persistent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_userfs_persistent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_stdout_verbose #-}

-- | Returns [code]true[/code] if the engine was executed with -v (verbose stdout).
bindOS_is_stdout_verbose :: MethodBind
bindOS_is_stdout_verbose
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_stdout_verbose" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the engine was executed with -v (verbose stdout).
is_stdout_verbose :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_stdout_verbose cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_stdout_verbose (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_can_use_threads #-}

-- | Returns [code]true[/code] if the current host platform is using multiple threads.
bindOS_can_use_threads :: MethodBind
bindOS_can_use_threads
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "can_use_threads" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the current host platform is using multiple threads.
can_use_threads :: (OS :< cls, Object :< cls) => cls -> IO Bool
can_use_threads cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_can_use_threads (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_debug_build #-}

-- | Returns [code]true[/code] if the build is a debug build.
--   				Returns [code]true[/code] when running in the editor.
--   				Returns [code]false[/code] if the build is a release build.
bindOS_is_debug_build :: MethodBind
bindOS_is_debug_build
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_debug_build" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the build is a debug build.
--   				Returns [code]true[/code] when running in the editor.
--   				Returns [code]false[/code] if the build is a release build.
is_debug_build :: (OS :< cls, Object :< cls) => cls -> IO Bool
is_debug_build cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_debug_build (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_has_virtual_keyboard #-}

-- | Returns [code]true[/code] if the platform has a virtual keyboard, [code]false[/code] otherwise.
bindOS_has_virtual_keyboard :: MethodBind
bindOS_has_virtual_keyboard
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "has_virtual_keyboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the platform has a virtual keyboard, [code]false[/code] otherwise.
has_virtual_keyboard ::
                       (OS :< cls, Object :< cls) => cls -> IO Bool
has_virtual_keyboard cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_has_virtual_keyboard (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_show_virtual_keyboard #-}

-- | Shows the virtual keyboard if the platform has one. The [i]existing_text[/i] parameter is useful for implementing your own LineEdit, as it tells the virtual keyboard what text has already been typed (the virtual keyboard uses it for auto-correct and predictions).
bindOS_show_virtual_keyboard :: MethodBind
bindOS_show_virtual_keyboard
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "show_virtual_keyboard" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows the virtual keyboard if the platform has one. The [i]existing_text[/i] parameter is useful for implementing your own LineEdit, as it tells the virtual keyboard what text has already been typed (the virtual keyboard uses it for auto-correct and predictions).
show_virtual_keyboard ::
                        (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
show_virtual_keyboard cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_show_virtual_keyboard (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_virtual_keyboard_height #-}

-- | Returns the on-screen keyboard's height in pixels. Returns 0 if there is no keyboard or it is currently hidden.
bindOS_get_virtual_keyboard_height :: MethodBind
bindOS_get_virtual_keyboard_height
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_virtual_keyboard_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the on-screen keyboard's height in pixels. Returns 0 if there is no keyboard or it is currently hidden.
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
                         (OS :< cls, Object :< cls) => cls -> Bool -> IO ()
print_resources_in_use cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_print_resources_in_use (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_print_all_resources #-}

-- | Shows all resources in the game. Optionally the list can be written to a file.
bindOS_print_all_resources :: MethodBind
bindOS_print_all_resources
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "print_all_resources" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shows all resources in the game. Optionally the list can be written to a file.
print_all_resources ::
                      (OS :< cls, Object :< cls) => cls -> GodotString -> IO ()
print_all_resources cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_print_all_resources (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_get_static_memory_peak_usage #-}

-- | Returns the max amount of static memory used (only works in debug).
bindOS_get_static_memory_peak_usage :: MethodBind
bindOS_get_static_memory_peak_usage
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_static_memory_peak_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the max amount of static memory used (only works in debug).
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

{-# NOINLINE bindOS_get_user_data_dir #-}

-- | Returns the absolute directory path where user data is written ([code]user://[/code]).
--   				On Linux, this is [code]~/.local/share/godot/app_userdata/[project_name][/code], or [code]~/.local/share/[custom_name][/code] if [code]use_custom_user_dir[/code] is set.
--   				On macOS, this is [code]~/Library/Application Support/Godot/app_userdata/[project_name][/code], or [code]~/Library/Application Support/[custom_name][/code] if [code]use_custom_user_dir[/code] is set.
--   				On Windows, this is [code]%APPDATA%/Godot/app_userdata/[project_name][/code], or [code]%APPDATA%/[custom_name][/code] if [code]use_custom_user_dir[/code] is set.
--   				If the project name is empty, [code]user://[/code] falls back to [code]res://[/code].
bindOS_get_user_data_dir :: MethodBind
bindOS_get_user_data_dir
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_user_data_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the absolute directory path where user data is written ([code]user://[/code]).
--   				On Linux, this is [code]~/.local/share/godot/app_userdata/[project_name][/code], or [code]~/.local/share/[custom_name][/code] if [code]use_custom_user_dir[/code] is set.
--   				On macOS, this is [code]~/Library/Application Support/Godot/app_userdata/[project_name][/code], or [code]~/Library/Application Support/[custom_name][/code] if [code]use_custom_user_dir[/code] is set.
--   				On Windows, this is [code]%APPDATA%/Godot/app_userdata/[project_name][/code], or [code]%APPDATA%/[custom_name][/code] if [code]use_custom_user_dir[/code] is set.
--   				If the project name is empty, [code]user://[/code] falls back to [code]res://[/code].
get_user_data_dir ::
                    (OS :< cls, Object :< cls) => cls -> IO GodotString
get_user_data_dir cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_user_data_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_system_dir #-}

-- | Returns the actual path to commonly used folders across different platforms. Available locations are specified in [enum OS.SystemDir].
bindOS_get_system_dir :: MethodBind
bindOS_get_system_dir
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_system_dir" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the actual path to commonly used folders across different platforms. Available locations are specified in [enum OS.SystemDir].
get_system_dir ::
                 (OS :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_system_dir cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_system_dir (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_unique_id #-}

-- | Returns a string that is unique to the device.
--   				Returns empty string on HTML5 and UWP which are not supported yet.
bindOS_get_unique_id :: MethodBind
bindOS_get_unique_id
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_unique_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a string that is unique to the device.
--   				Returns empty string on HTML5 and UWP which are not supported yet.
get_unique_id ::
                (OS :< cls, Object :< cls) => cls -> IO GodotString
get_unique_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_unique_id (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_ok_left_and_cancel_right #-}

-- | Returns [code]true[/code] if the "Okay" button should appear on the left and "Cancel" on the right.
bindOS_is_ok_left_and_cancel_right :: MethodBind
bindOS_is_ok_left_and_cancel_right
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_ok_left_and_cancel_right" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the "Okay" button should appear on the left and "Cancel" on the right.
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

{-# NOINLINE bindOS_native_video_play #-}

-- | Plays native video from the specified path, at the given volume and with audio and subtitle tracks.
--   				Note: This method is only implemented on Android and iOS, and the current Android implementation does not support the [code]volume[/code], [code]audio_track[/code] and [code]subtitle_track[/code] options.
bindOS_native_video_play :: MethodBind
bindOS_native_video_play
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_play" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Plays native video from the specified path, at the given volume and with audio and subtitle tracks.
--   				Note: This method is only implemented on Android and iOS, and the current Android implementation does not support the [code]volume[/code], [code]audio_track[/code] and [code]subtitle_track[/code] options.
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

{-# NOINLINE bindOS_native_video_is_playing #-}

-- | Returns [code]true[/code] if native video is playing.
bindOS_native_video_is_playing :: MethodBind
bindOS_native_video_is_playing
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_is_playing" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if native video is playing.
native_video_is_playing ::
                          (OS :< cls, Object :< cls) => cls -> IO Bool
native_video_is_playing cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_is_playing (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_native_video_stop #-}

-- | Stops native video playback.
bindOS_native_video_stop :: MethodBind
bindOS_native_video_stop
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_stop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops native video playback.
native_video_stop :: (OS :< cls, Object :< cls) => cls -> IO ()
native_video_stop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_stop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_native_video_pause #-}

-- | Pauses native video playback.
bindOS_native_video_pause :: MethodBind
bindOS_native_video_pause
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_pause" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pauses native video playback.
native_video_pause :: (OS :< cls, Object :< cls) => cls -> IO ()
native_video_pause cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_pause (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_native_video_unpause #-}

-- | Resumes native video playback.
bindOS_native_video_unpause :: MethodBind
bindOS_native_video_unpause
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "native_video_unpause" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resumes native video playback.
native_video_unpause :: (OS :< cls, Object :< cls) => cls -> IO ()
native_video_unpause cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_native_video_unpause (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_scancode_string #-}

-- | Returns the given scancode as a string (e.g. Return values: "Escape", "Shift+Escape").
bindOS_get_scancode_string :: MethodBind
bindOS_get_scancode_string
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_scancode_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given scancode as a string (e.g. Return values: "Escape", "Shift+Escape").
get_scancode_string ::
                      (OS :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_scancode_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_scancode_string (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_is_scancode_unicode #-}

-- | Returns [code]true[/code] if the input code has a unicode character.
bindOS_is_scancode_unicode :: MethodBind
bindOS_is_scancode_unicode
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "is_scancode_unicode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the input code has a unicode character.
is_scancode_unicode ::
                      (OS :< cls, Object :< cls) => cls -> Int -> IO Bool
is_scancode_unicode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_is_scancode_unicode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_find_scancode_from_string #-}

-- | Returns the scancode of the given string (e.g. "Escape")
bindOS_find_scancode_from_string :: MethodBind
bindOS_find_scancode_from_string
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "find_scancode_from_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the scancode of the given string (e.g. "Escape")
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

{-# NOINLINE bindOS_set_use_file_access_save_and_swap #-}

-- | Enables backup saves if [code]enabled[/code] is [code]true[/code].
bindOS_set_use_file_access_save_and_swap :: MethodBind
bindOS_set_use_file_access_save_and_swap
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "set_use_file_access_save_and_swap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables backup saves if [code]enabled[/code] is [code]true[/code].
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

{-# NOINLINE bindOS_alert #-}

-- | Displays a modal dialog box utilizing the host OS.
bindOS_alert :: MethodBind
bindOS_alert
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "alert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Displays a modal dialog box utilizing the host OS.
alert ::
        (OS :< cls, Object :< cls) =>
        cls -> GodotString -> GodotString -> IO ()
alert cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_alert (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindOS_has_feature #-}

-- | Returns [code]true[/code] if the feature for the given feature tag is supported in the currently running instance, depending on platform, build etc. Can be used to check whether you're currently running a debug build, on a certain platform or arch, etc. See feature tags documentation.
bindOS_has_feature :: MethodBind
bindOS_has_feature
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "has_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the feature for the given feature tag is supported in the currently running instance, depending on platform, build etc. Can be used to check whether you're currently running a debug build, on a certain platform or arch, etc. See feature tags documentation.
has_feature ::
              (OS :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_feature cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_has_feature (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_power_state #-}

-- | Returns the current state of the device regarding battery and power. See [code]POWERSTATE_*[/code] constants.
bindOS_get_power_state :: MethodBind
bindOS_get_power_state
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_power_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current state of the device regarding battery and power. See [code]POWERSTATE_*[/code] constants.
get_power_state :: (OS :< cls, Object :< cls) => cls -> IO Int
get_power_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_power_state (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_power_seconds_left #-}

-- | Returns the time in seconds before the device runs out of battery.
bindOS_get_power_seconds_left :: MethodBind
bindOS_get_power_seconds_left
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_power_seconds_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the time in seconds before the device runs out of battery.
get_power_seconds_left ::
                         (OS :< cls, Object :< cls) => cls -> IO Int
get_power_seconds_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_power_seconds_left (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_get_power_percent_left #-}

-- | Returns the amount of battery left in the device as a percentage.
bindOS_get_power_percent_left :: MethodBind
bindOS_get_power_percent_left
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "get_power_percent_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the amount of battery left in the device as a percentage.
get_power_percent_left ::
                         (OS :< cls, Object :< cls) => cls -> IO Int
get_power_percent_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_get_power_percent_left (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindOS_request_permission #-}

-- | At the moment this function is only used by [code]AudioDriverOpenSL[/code] to request permission for [code]RECORD_AUDIO[/code] on Android.
bindOS_request_permission :: MethodBind
bindOS_request_permission
  = unsafePerformIO $
      withCString "_OS" $
        \ clsNamePtr ->
          withCString "request_permission" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | At the moment this function is only used by [code]AudioDriverOpenSL[/code] to request permission for [code]RECORD_AUDIO[/code] on Android.
request_permission ::
                     (OS :< cls, Object :< cls) => cls -> GodotString -> IO Bool
request_permission cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindOS_request_permission (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)