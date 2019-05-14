{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Engine
       (Godot.Core.Engine.is_editor_hint,
        Godot.Core.Engine.set_editor_hint,
        Godot.Core.Engine.get_iterations_per_second,
        Godot.Core.Engine.set_iterations_per_second,
        Godot.Core.Engine.get_target_fps, Godot.Core.Engine.set_target_fps,
        Godot.Core.Engine.get_time_scale, Godot.Core.Engine.set_time_scale,
        Godot.Core.Engine.get_physics_jitter_fix,
        Godot.Core.Engine.set_physics_jitter_fix,
        Godot.Core.Engine.get_frames_drawn,
        Godot.Core.Engine.get_frames_per_second,
        Godot.Core.Engine.get_main_loop,
        Godot.Core.Engine.get_version_info,
        Godot.Core.Engine.get_author_info,
        Godot.Core.Engine.get_copyright_info,
        Godot.Core.Engine.get_donor_info,
        Godot.Core.Engine.get_license_info,
        Godot.Core.Engine.get_license_text,
        Godot.Core.Engine.is_in_physics_frame,
        Godot.Core.Engine.has_singleton, Godot.Core.Engine.get_singleton)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEngine_is_editor_hint #-}

-- | If [code]true[/code], it is running inside the editor. Useful for tool scripts.
bindEngine_is_editor_hint :: MethodBind
bindEngine_is_editor_hint
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "is_editor_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], it is running inside the editor. Useful for tool scripts.
is_editor_hint :: (Engine :< cls, Object :< cls) => cls -> IO Bool
is_editor_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_is_editor_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_set_editor_hint #-}

-- | If [code]true[/code], it is running inside the editor. Useful for tool scripts.
bindEngine_set_editor_hint :: MethodBind
bindEngine_set_editor_hint
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_editor_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], it is running inside the editor. Useful for tool scripts.
set_editor_hint ::
                  (Engine :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editor_hint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_set_editor_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_iterations_per_second #-}

-- | The number of fixed iterations per second (for fixed process and physics).
bindEngine_get_iterations_per_second :: MethodBind
bindEngine_get_iterations_per_second
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_iterations_per_second" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of fixed iterations per second (for fixed process and physics).
get_iterations_per_second ::
                            (Engine :< cls, Object :< cls) => cls -> IO Int
get_iterations_per_second cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_iterations_per_second
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_set_iterations_per_second #-}

-- | The number of fixed iterations per second (for fixed process and physics).
bindEngine_set_iterations_per_second :: MethodBind
bindEngine_set_iterations_per_second
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_iterations_per_second" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of fixed iterations per second (for fixed process and physics).
set_iterations_per_second ::
                            (Engine :< cls, Object :< cls) => cls -> Int -> IO ()
set_iterations_per_second cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_set_iterations_per_second
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_target_fps #-}

-- | The desired frames per second. If the hardware cannot keep up, this setting may not be respected. Defaults to 0, which indicates no limit.
bindEngine_get_target_fps :: MethodBind
bindEngine_get_target_fps
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_target_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The desired frames per second. If the hardware cannot keep up, this setting may not be respected. Defaults to 0, which indicates no limit.
get_target_fps :: (Engine :< cls, Object :< cls) => cls -> IO Int
get_target_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_target_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_set_target_fps #-}

-- | The desired frames per second. If the hardware cannot keep up, this setting may not be respected. Defaults to 0, which indicates no limit.
bindEngine_set_target_fps :: MethodBind
bindEngine_set_target_fps
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_target_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The desired frames per second. If the hardware cannot keep up, this setting may not be respected. Defaults to 0, which indicates no limit.
set_target_fps ::
                 (Engine :< cls, Object :< cls) => cls -> Int -> IO ()
set_target_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_set_target_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_time_scale #-}

-- | Controls how fast or slow the in-game clock ticks versus the real life one. It defaults to 1.0. A value of 2.0 means the game moves twice as fast as real life, whilst a value of 0.5 means the game moves at half the regular speed.
bindEngine_get_time_scale :: MethodBind
bindEngine_get_time_scale
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_time_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls how fast or slow the in-game clock ticks versus the real life one. It defaults to 1.0. A value of 2.0 means the game moves twice as fast as real life, whilst a value of 0.5 means the game moves at half the regular speed.
get_time_scale :: (Engine :< cls, Object :< cls) => cls -> IO Float
get_time_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_time_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_set_time_scale #-}

-- | Controls how fast or slow the in-game clock ticks versus the real life one. It defaults to 1.0. A value of 2.0 means the game moves twice as fast as real life, whilst a value of 0.5 means the game moves at half the regular speed.
bindEngine_set_time_scale :: MethodBind
bindEngine_set_time_scale
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_time_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls how fast or slow the in-game clock ticks versus the real life one. It defaults to 1.0. A value of 2.0 means the game moves twice as fast as real life, whilst a value of 0.5 means the game moves at half the regular speed.
set_time_scale ::
                 (Engine :< cls, Object :< cls) => cls -> Float -> IO ()
set_time_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_set_time_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_physics_jitter_fix #-}

bindEngine_get_physics_jitter_fix :: MethodBind
bindEngine_get_physics_jitter_fix
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_physics_jitter_fix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_physics_jitter_fix ::
                         (Engine :< cls, Object :< cls) => cls -> IO Float
get_physics_jitter_fix cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_physics_jitter_fix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_set_physics_jitter_fix #-}

bindEngine_set_physics_jitter_fix :: MethodBind
bindEngine_set_physics_jitter_fix
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_physics_jitter_fix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_physics_jitter_fix ::
                         (Engine :< cls, Object :< cls) => cls -> Float -> IO ()
set_physics_jitter_fix cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_set_physics_jitter_fix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_frames_drawn #-}

-- | Returns the total number of frames drawn.
bindEngine_get_frames_drawn :: MethodBind
bindEngine_get_frames_drawn
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_frames_drawn" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of frames drawn.
get_frames_drawn :: (Engine :< cls, Object :< cls) => cls -> IO Int
get_frames_drawn cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_frames_drawn (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_frames_per_second #-}

-- | Returns the frames per second of the running game.
bindEngine_get_frames_per_second :: MethodBind
bindEngine_get_frames_per_second
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_frames_per_second" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the frames per second of the running game.
get_frames_per_second ::
                        (Engine :< cls, Object :< cls) => cls -> IO Float
get_frames_per_second cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_frames_per_second
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_main_loop #-}

-- | Returns the main loop object (see [MainLoop] and [SceneTree]).
bindEngine_get_main_loop :: MethodBind
bindEngine_get_main_loop
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_main_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the main loop object (see [MainLoop] and [SceneTree]).
get_main_loop ::
                (Engine :< cls, Object :< cls) => cls -> IO MainLoop
get_main_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_main_loop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_version_info #-}

-- | Returns the current engine version information in a Dictionary.
--   				"major"    - Holds the major version number as an int
--   				"minor"    - Holds the minor version number as an int
--   				"patch"    - Holds the patch version number as an int
--   				"hex"      - Holds the full version number encoded as an hexadecimal int with one byte (2 places) per number (see example below)
--   				"status"   - Holds the status (e.g. "beta", "rc1", "rc2", ... "stable") as a String
--   				"build"    - Holds the build name (e.g. "custom-build") as a String
--   				"string"   - major + minor + patch + status + build in a single String
--   				The "hex" value is encoded as follows, from left to right: one byte for the major, one byte for the minor, one byte for the patch version. For example, "3.1.12" would be [code]0x03010C[/code]. Note that it's still an int internally, and printing it will give you its decimal representation, which is not particularly meaningful. Use hexadecimal literals for easy version comparisons from code:
--   				[codeblock]
--   				if Engine.get_version_info().hex >= 0x030200:
--   				    # do things specific to version 3.2 or later
--   				else:
--   				    # do things specific to versions before 3.2
--   				[/codeblock]
bindEngine_get_version_info :: MethodBind
bindEngine_get_version_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_version_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current engine version information in a Dictionary.
--   				"major"    - Holds the major version number as an int
--   				"minor"    - Holds the minor version number as an int
--   				"patch"    - Holds the patch version number as an int
--   				"hex"      - Holds the full version number encoded as an hexadecimal int with one byte (2 places) per number (see example below)
--   				"status"   - Holds the status (e.g. "beta", "rc1", "rc2", ... "stable") as a String
--   				"build"    - Holds the build name (e.g. "custom-build") as a String
--   				"string"   - major + minor + patch + status + build in a single String
--   				The "hex" value is encoded as follows, from left to right: one byte for the major, one byte for the minor, one byte for the patch version. For example, "3.1.12" would be [code]0x03010C[/code]. Note that it's still an int internally, and printing it will give you its decimal representation, which is not particularly meaningful. Use hexadecimal literals for easy version comparisons from code:
--   				[codeblock]
--   				if Engine.get_version_info().hex >= 0x030200:
--   				    # do things specific to version 3.2 or later
--   				else:
--   				    # do things specific to versions before 3.2
--   				[/codeblock]
get_version_info ::
                   (Engine :< cls, Object :< cls) => cls -> IO Dictionary
get_version_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_version_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_author_info #-}

-- | Returns engine author information in a Dictionary.
--   				"lead_developers" - Array of Strings, lead developer names
--   				"founders" - Array of Strings, founder names
--   				"project_managers" - Array of Strings, project manager names
--   				"developers" - Array of Strings, developer names
bindEngine_get_author_info :: MethodBind
bindEngine_get_author_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_author_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns engine author information in a Dictionary.
--   				"lead_developers" - Array of Strings, lead developer names
--   				"founders" - Array of Strings, founder names
--   				"project_managers" - Array of Strings, project manager names
--   				"developers" - Array of Strings, developer names
get_author_info ::
                  (Engine :< cls, Object :< cls) => cls -> IO Dictionary
get_author_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_author_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_copyright_info #-}

-- | Returns an Array of copyright information Dictionaries.
--   				"name" - String, component name
--   				"parts" - Array of Dictionaries {"files", "copyright", "license"} describing subsections of the component
bindEngine_get_copyright_info :: MethodBind
bindEngine_get_copyright_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_copyright_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an Array of copyright information Dictionaries.
--   				"name" - String, component name
--   				"parts" - Array of Dictionaries {"files", "copyright", "license"} describing subsections of the component
get_copyright_info ::
                     (Engine :< cls, Object :< cls) => cls -> IO Array
get_copyright_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_copyright_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_donor_info #-}

-- | Returns a Dictionary of Arrays of donor names.
--   				{"platinum_sponsors", "gold_sponsors", "mini_sponsors", "gold_donors", "silver_donors", "bronze_donors"}
bindEngine_get_donor_info :: MethodBind
bindEngine_get_donor_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_donor_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a Dictionary of Arrays of donor names.
--   				{"platinum_sponsors", "gold_sponsors", "mini_sponsors", "gold_donors", "silver_donors", "bronze_donors"}
get_donor_info ::
                 (Engine :< cls, Object :< cls) => cls -> IO Dictionary
get_donor_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_donor_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_license_info #-}

-- | Returns Dictionary of licenses used by Godot and included third party components.
bindEngine_get_license_info :: MethodBind
bindEngine_get_license_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_license_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns Dictionary of licenses used by Godot and included third party components.
get_license_info ::
                   (Engine :< cls, Object :< cls) => cls -> IO Dictionary
get_license_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_license_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_license_text #-}

-- | Returns Godot license text.
bindEngine_get_license_text :: MethodBind
bindEngine_get_license_text
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_license_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns Godot license text.
get_license_text ::
                   (Engine :< cls, Object :< cls) => cls -> IO GodotString
get_license_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_license_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_is_in_physics_frame #-}

-- | Returns [code]true[/code] if the game is inside the fixed process and physics phase of the game loop.
bindEngine_is_in_physics_frame :: MethodBind
bindEngine_is_in_physics_frame
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "is_in_physics_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the game is inside the fixed process and physics phase of the game loop.
is_in_physics_frame ::
                      (Engine :< cls, Object :< cls) => cls -> IO Bool
is_in_physics_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_is_in_physics_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_has_singleton #-}

bindEngine_has_singleton :: MethodBind
bindEngine_has_singleton
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "has_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_singleton ::
                (Engine :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_singleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_has_singleton (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEngine_get_singleton #-}

bindEngine_get_singleton :: MethodBind
bindEngine_get_singleton
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_singleton ::
                (Engine :< cls, Object :< cls) => cls -> GodotString -> IO Object
get_singleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_singleton (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)