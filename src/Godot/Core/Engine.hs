{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Engine
       (Godot.Core.Engine.is_editor_hint,
        Godot.Core.Engine.set_editor_hint,
        Godot.Core.Engine.get_iterations_per_second,
        Godot.Core.Engine.set_iterations_per_second,
        Godot.Core.Engine.get_physics_jitter_fix,
        Godot.Core.Engine.set_physics_jitter_fix,
        Godot.Core.Engine.get_target_fps, Godot.Core.Engine.set_target_fps,
        Godot.Core.Engine.get_time_scale, Godot.Core.Engine.set_time_scale,
        Godot.Core.Engine.get_author_info,
        Godot.Core.Engine.get_copyright_info,
        Godot.Core.Engine.get_donor_info,
        Godot.Core.Engine.get_frames_drawn,
        Godot.Core.Engine.get_frames_per_second,
        Godot.Core.Engine.get_idle_frames,
        Godot.Core.Engine.get_license_info,
        Godot.Core.Engine.get_license_text,
        Godot.Core.Engine.get_main_loop,
        Godot.Core.Engine.get_physics_frames,
        Godot.Core.Engine.get_physics_interpolation_fraction,
        Godot.Core.Engine.get_singleton,
        Godot.Core.Engine.get_version_info,
        Godot.Core.Engine.has_singleton,
        Godot.Core.Engine.is_in_physics_frame)
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

{-# NOINLINE bindEngine_is_editor_hint #-}

-- | If @true@, the script is currently running inside the editor. This is useful for @tool@ scripts to conditionally draw editor helpers, or prevent accidentally running "game" code that would affect the scene state while in the editor:
--   			
--   @
--   
--   			if Engine.editor_hint:
--   			    draw_gizmos()
--   			else:
--   			    simulate_physics()
--   			
--   @
--   
--   			See @url=https://docs.godotengine.org/en/3.4/tutorials/misc/running_code_in_the_editor.html@Running code in the editor@/url@ in the documentation for more information.
--   			__Note:__ To detect whether the script is run from an editor @i@build@/i@ (e.g. when pressing @F5@), use @method OS.has_feature@ with the @"editor"@ argument instead. @OS.has_feature("editor")@ will evaluate to @true@ both when the code is running in the editor and when running the project from the editor, but it will evaluate to @false@ when the code is run from an exported project.
bindEngine_is_editor_hint :: MethodBind
bindEngine_is_editor_hint
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "is_editor_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the script is currently running inside the editor. This is useful for @tool@ scripts to conditionally draw editor helpers, or prevent accidentally running "game" code that would affect the scene state while in the editor:
--   			
--   @
--   
--   			if Engine.editor_hint:
--   			    draw_gizmos()
--   			else:
--   			    simulate_physics()
--   			
--   @
--   
--   			See @url=https://docs.godotengine.org/en/3.4/tutorials/misc/running_code_in_the_editor.html@Running code in the editor@/url@ in the documentation for more information.
--   			__Note:__ To detect whether the script is run from an editor @i@build@/i@ (e.g. when pressing @F5@), use @method OS.has_feature@ with the @"editor"@ argument instead. @OS.has_feature("editor")@ will evaluate to @true@ both when the code is running in the editor and when running the project from the editor, but it will evaluate to @false@ when the code is run from an exported project.
is_editor_hint :: (Engine :< cls, Object :< cls) => cls -> IO Bool
is_editor_hint cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_is_editor_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "is_editor_hint" '[] (IO Bool) where
        nodeMethod = Godot.Core.Engine.is_editor_hint

{-# NOINLINE bindEngine_set_editor_hint #-}

-- | If @true@, the script is currently running inside the editor. This is useful for @tool@ scripts to conditionally draw editor helpers, or prevent accidentally running "game" code that would affect the scene state while in the editor:
--   			
--   @
--   
--   			if Engine.editor_hint:
--   			    draw_gizmos()
--   			else:
--   			    simulate_physics()
--   			
--   @
--   
--   			See @url=https://docs.godotengine.org/en/3.4/tutorials/misc/running_code_in_the_editor.html@Running code in the editor@/url@ in the documentation for more information.
--   			__Note:__ To detect whether the script is run from an editor @i@build@/i@ (e.g. when pressing @F5@), use @method OS.has_feature@ with the @"editor"@ argument instead. @OS.has_feature("editor")@ will evaluate to @true@ both when the code is running in the editor and when running the project from the editor, but it will evaluate to @false@ when the code is run from an exported project.
bindEngine_set_editor_hint :: MethodBind
bindEngine_set_editor_hint
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_editor_hint" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the script is currently running inside the editor. This is useful for @tool@ scripts to conditionally draw editor helpers, or prevent accidentally running "game" code that would affect the scene state while in the editor:
--   			
--   @
--   
--   			if Engine.editor_hint:
--   			    draw_gizmos()
--   			else:
--   			    simulate_physics()
--   			
--   @
--   
--   			See @url=https://docs.godotengine.org/en/3.4/tutorials/misc/running_code_in_the_editor.html@Running code in the editor@/url@ in the documentation for more information.
--   			__Note:__ To detect whether the script is run from an editor @i@build@/i@ (e.g. when pressing @F5@), use @method OS.has_feature@ with the @"editor"@ argument instead. @OS.has_feature("editor")@ will evaluate to @true@ both when the code is running in the editor and when running the project from the editor, but it will evaluate to @false@ when the code is run from an exported project.
set_editor_hint ::
                  (Engine :< cls, Object :< cls) => cls -> Bool -> IO ()
set_editor_hint cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_set_editor_hint (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "set_editor_hint" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Engine.set_editor_hint

instance NodeProperty Engine "editor_hint" Bool 'False where
        nodeProperty
          = (is_editor_hint, wrapDroppingSetter set_editor_hint, Nothing)

{-# NOINLINE bindEngine_get_iterations_per_second #-}

-- | The number of fixed iterations per second. This controls how often physics simulation and @method Node._physics_process@ methods are run. This value should generally always be set to @60@ or above, as Godot doesn't interpolate the physics step. As a result, values lower than @60@ will look stuttery. This value can be increased to make input more reactive or work around collision tunneling issues, but keep in mind doing so will increase CPU usage. See also @target_fps@ and @ProjectSettings.physics/common/physics_fps@.
--   			__Note:__ Only 8 physics ticks may be simulated per rendered frame at most. If more than 8 physics ticks have to be simulated per rendered frame to keep up with rendering, the game will appear to slow down (even if @delta@ is used consistently in physics calculations). Therefore, it is recommended not to increase @Engine.iterations_per_second@ above 240. Otherwise, the game will slow down when the rendering framerate goes below 30 FPS.
bindEngine_get_iterations_per_second :: MethodBind
bindEngine_get_iterations_per_second
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_iterations_per_second" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of fixed iterations per second. This controls how often physics simulation and @method Node._physics_process@ methods are run. This value should generally always be set to @60@ or above, as Godot doesn't interpolate the physics step. As a result, values lower than @60@ will look stuttery. This value can be increased to make input more reactive or work around collision tunneling issues, but keep in mind doing so will increase CPU usage. See also @target_fps@ and @ProjectSettings.physics/common/physics_fps@.
--   			__Note:__ Only 8 physics ticks may be simulated per rendered frame at most. If more than 8 physics ticks have to be simulated per rendered frame to keep up with rendering, the game will appear to slow down (even if @delta@ is used consistently in physics calculations). Therefore, it is recommended not to increase @Engine.iterations_per_second@ above 240. Otherwise, the game will slow down when the rendering framerate goes below 30 FPS.
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

instance NodeMethod Engine "get_iterations_per_second" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Engine.get_iterations_per_second

{-# NOINLINE bindEngine_set_iterations_per_second #-}

-- | The number of fixed iterations per second. This controls how often physics simulation and @method Node._physics_process@ methods are run. This value should generally always be set to @60@ or above, as Godot doesn't interpolate the physics step. As a result, values lower than @60@ will look stuttery. This value can be increased to make input more reactive or work around collision tunneling issues, but keep in mind doing so will increase CPU usage. See also @target_fps@ and @ProjectSettings.physics/common/physics_fps@.
--   			__Note:__ Only 8 physics ticks may be simulated per rendered frame at most. If more than 8 physics ticks have to be simulated per rendered frame to keep up with rendering, the game will appear to slow down (even if @delta@ is used consistently in physics calculations). Therefore, it is recommended not to increase @Engine.iterations_per_second@ above 240. Otherwise, the game will slow down when the rendering framerate goes below 30 FPS.
bindEngine_set_iterations_per_second :: MethodBind
bindEngine_set_iterations_per_second
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_iterations_per_second" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of fixed iterations per second. This controls how often physics simulation and @method Node._physics_process@ methods are run. This value should generally always be set to @60@ or above, as Godot doesn't interpolate the physics step. As a result, values lower than @60@ will look stuttery. This value can be increased to make input more reactive or work around collision tunneling issues, but keep in mind doing so will increase CPU usage. See also @target_fps@ and @ProjectSettings.physics/common/physics_fps@.
--   			__Note:__ Only 8 physics ticks may be simulated per rendered frame at most. If more than 8 physics ticks have to be simulated per rendered frame to keep up with rendering, the game will appear to slow down (even if @delta@ is used consistently in physics calculations). Therefore, it is recommended not to increase @Engine.iterations_per_second@ above 240. Otherwise, the game will slow down when the rendering framerate goes below 30 FPS.
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

instance NodeMethod Engine "set_iterations_per_second" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.Engine.set_iterations_per_second

instance NodeProperty Engine "iterations_per_second" Int 'False
         where
        nodeProperty
          = (get_iterations_per_second,
             wrapDroppingSetter set_iterations_per_second, Nothing)

{-# NOINLINE bindEngine_get_physics_jitter_fix #-}

-- | Controls how much physics ticks are synchronized with real time. For 0 or less, the ticks are synchronized. Such values are recommended for network games, where clock synchronization matters. Higher values cause higher deviation of the in-game clock and real clock but smooth out framerate jitters. The default value of 0.5 should be fine for most; values above 2 could cause the game to react to dropped frames with a noticeable delay and are not recommended.
--   			__Note:__ For best results, when using a custom physics interpolation solution, the physics jitter fix should be disabled by setting @physics_jitter_fix@ to @0@.
bindEngine_get_physics_jitter_fix :: MethodBind
bindEngine_get_physics_jitter_fix
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_physics_jitter_fix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls how much physics ticks are synchronized with real time. For 0 or less, the ticks are synchronized. Such values are recommended for network games, where clock synchronization matters. Higher values cause higher deviation of the in-game clock and real clock but smooth out framerate jitters. The default value of 0.5 should be fine for most; values above 2 could cause the game to react to dropped frames with a noticeable delay and are not recommended.
--   			__Note:__ For best results, when using a custom physics interpolation solution, the physics jitter fix should be disabled by setting @physics_jitter_fix@ to @0@.
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

instance NodeMethod Engine "get_physics_jitter_fix" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Engine.get_physics_jitter_fix

{-# NOINLINE bindEngine_set_physics_jitter_fix #-}

-- | Controls how much physics ticks are synchronized with real time. For 0 or less, the ticks are synchronized. Such values are recommended for network games, where clock synchronization matters. Higher values cause higher deviation of the in-game clock and real clock but smooth out framerate jitters. The default value of 0.5 should be fine for most; values above 2 could cause the game to react to dropped frames with a noticeable delay and are not recommended.
--   			__Note:__ For best results, when using a custom physics interpolation solution, the physics jitter fix should be disabled by setting @physics_jitter_fix@ to @0@.
bindEngine_set_physics_jitter_fix :: MethodBind
bindEngine_set_physics_jitter_fix
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_physics_jitter_fix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls how much physics ticks are synchronized with real time. For 0 or less, the ticks are synchronized. Such values are recommended for network games, where clock synchronization matters. Higher values cause higher deviation of the in-game clock and real clock but smooth out framerate jitters. The default value of 0.5 should be fine for most; values above 2 could cause the game to react to dropped frames with a noticeable delay and are not recommended.
--   			__Note:__ For best results, when using a custom physics interpolation solution, the physics jitter fix should be disabled by setting @physics_jitter_fix@ to @0@.
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

instance NodeMethod Engine "set_physics_jitter_fix" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Engine.set_physics_jitter_fix

instance NodeProperty Engine "physics_jitter_fix" Float 'False
         where
        nodeProperty
          = (get_physics_jitter_fix,
             wrapDroppingSetter set_physics_jitter_fix, Nothing)

{-# NOINLINE bindEngine_get_target_fps #-}

-- | The desired frames per second. If the hardware cannot keep up, this setting may not be respected. A value of 0 means no limit.
bindEngine_get_target_fps :: MethodBind
bindEngine_get_target_fps
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_target_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The desired frames per second. If the hardware cannot keep up, this setting may not be respected. A value of 0 means no limit.
get_target_fps :: (Engine :< cls, Object :< cls) => cls -> IO Int
get_target_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_target_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_target_fps" '[] (IO Int) where
        nodeMethod = Godot.Core.Engine.get_target_fps

{-# NOINLINE bindEngine_set_target_fps #-}

-- | The desired frames per second. If the hardware cannot keep up, this setting may not be respected. A value of 0 means no limit.
bindEngine_set_target_fps :: MethodBind
bindEngine_set_target_fps
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "set_target_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The desired frames per second. If the hardware cannot keep up, this setting may not be respected. A value of 0 means no limit.
set_target_fps ::
                 (Engine :< cls, Object :< cls) => cls -> Int -> IO ()
set_target_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_set_target_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "set_target_fps" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Engine.set_target_fps

instance NodeProperty Engine "target_fps" Int 'False where
        nodeProperty
          = (get_target_fps, wrapDroppingSetter set_target_fps, Nothing)

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

instance NodeMethod Engine "get_time_scale" '[] (IO Float) where
        nodeMethod = Godot.Core.Engine.get_time_scale

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

instance NodeMethod Engine "set_time_scale" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Engine.set_time_scale

instance NodeProperty Engine "time_scale" Float 'False where
        nodeProperty
          = (get_time_scale, wrapDroppingSetter set_time_scale, Nothing)

{-# NOINLINE bindEngine_get_author_info #-}

-- | Returns engine author information in a Dictionary.
--   				@lead_developers@    - Array of Strings, lead developer names
--   				@founders@           - Array of Strings, founder names
--   				@project_managers@   - Array of Strings, project manager names
--   				@developers@         - Array of Strings, developer names
bindEngine_get_author_info :: MethodBind
bindEngine_get_author_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_author_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns engine author information in a Dictionary.
--   				@lead_developers@    - Array of Strings, lead developer names
--   				@founders@           - Array of Strings, founder names
--   				@project_managers@   - Array of Strings, project manager names
--   				@developers@         - Array of Strings, developer names
get_author_info ::
                  (Engine :< cls, Object :< cls) => cls -> IO Dictionary
get_author_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_author_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_author_info" '[] (IO Dictionary)
         where
        nodeMethod = Godot.Core.Engine.get_author_info

{-# NOINLINE bindEngine_get_copyright_info #-}

-- | Returns an Array of copyright information Dictionaries.
--   				@name@    - String, component name
--   				@parts@   - Array of Dictionaries {@files@, @copyright@, @license@} describing subsections of the component
bindEngine_get_copyright_info :: MethodBind
bindEngine_get_copyright_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_copyright_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an Array of copyright information Dictionaries.
--   				@name@    - String, component name
--   				@parts@   - Array of Dictionaries {@files@, @copyright@, @license@} describing subsections of the component
get_copyright_info ::
                     (Engine :< cls, Object :< cls) => cls -> IO Array
get_copyright_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_copyright_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_copyright_info" '[] (IO Array)
         where
        nodeMethod = Godot.Core.Engine.get_copyright_info

{-# NOINLINE bindEngine_get_donor_info #-}

-- | Returns a Dictionary of Arrays of donor names.
--   				{@platinum_sponsors@, @gold_sponsors@, @silver_sponsors@, @bronze_sponsors@, @mini_sponsors@, @gold_donors@, @silver_donors@, @bronze_donors@}
bindEngine_get_donor_info :: MethodBind
bindEngine_get_donor_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_donor_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a Dictionary of Arrays of donor names.
--   				{@platinum_sponsors@, @gold_sponsors@, @silver_sponsors@, @bronze_sponsors@, @mini_sponsors@, @gold_donors@, @silver_donors@, @bronze_donors@}
get_donor_info ::
                 (Engine :< cls, Object :< cls) => cls -> IO Dictionary
get_donor_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_donor_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_donor_info" '[] (IO Dictionary)
         where
        nodeMethod = Godot.Core.Engine.get_donor_info

{-# NOINLINE bindEngine_get_frames_drawn #-}

-- | Returns the total number of frames drawn. On headless platforms, or if the render loop is disabled with @--disable-render-loop@ via command line, @method get_frames_drawn@ always returns @0@. See @method get_idle_frames@.
bindEngine_get_frames_drawn :: MethodBind
bindEngine_get_frames_drawn
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_frames_drawn" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of frames drawn. On headless platforms, or if the render loop is disabled with @--disable-render-loop@ via command line, @method get_frames_drawn@ always returns @0@. See @method get_idle_frames@.
get_frames_drawn :: (Engine :< cls, Object :< cls) => cls -> IO Int
get_frames_drawn cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_frames_drawn (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_frames_drawn" '[] (IO Int) where
        nodeMethod = Godot.Core.Engine.get_frames_drawn

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

instance NodeMethod Engine "get_frames_per_second" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Engine.get_frames_per_second

{-# NOINLINE bindEngine_get_idle_frames #-}

-- | Returns the total number of frames passed since engine initialization which is advanced on each __idle frame__, regardless of whether the render loop is enabled. See also @method get_frames_drawn@ and @method get_physics_frames@.
--   				@method get_idle_frames@ can be used to run expensive logic less often without relying on a @Timer@:
--   				
--   @
--   
--   				func _process(_delta):
--   				    if Engine.get_idle_frames() % 2 == 0:
--   				        pass  # Run expensive logic only once every 2 idle (render) frames here.
--   				
--   @
bindEngine_get_idle_frames :: MethodBind
bindEngine_get_idle_frames
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_idle_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of frames passed since engine initialization which is advanced on each __idle frame__, regardless of whether the render loop is enabled. See also @method get_frames_drawn@ and @method get_physics_frames@.
--   				@method get_idle_frames@ can be used to run expensive logic less often without relying on a @Timer@:
--   				
--   @
--   
--   				func _process(_delta):
--   				    if Engine.get_idle_frames() % 2 == 0:
--   				        pass  # Run expensive logic only once every 2 idle (render) frames here.
--   				
--   @
get_idle_frames :: (Engine :< cls, Object :< cls) => cls -> IO Int
get_idle_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_idle_frames (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_idle_frames" '[] (IO Int) where
        nodeMethod = Godot.Core.Engine.get_idle_frames

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

instance NodeMethod Engine "get_license_info" '[] (IO Dictionary)
         where
        nodeMethod = Godot.Core.Engine.get_license_info

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

instance NodeMethod Engine "get_license_text" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.Engine.get_license_text

{-# NOINLINE bindEngine_get_main_loop #-}

-- | Returns the main loop object (see @MainLoop@ and @SceneTree@).
bindEngine_get_main_loop :: MethodBind
bindEngine_get_main_loop
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_main_loop" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the main loop object (see @MainLoop@ and @SceneTree@).
get_main_loop ::
                (Engine :< cls, Object :< cls) => cls -> IO MainLoop
get_main_loop cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_main_loop (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_main_loop" '[] (IO MainLoop) where
        nodeMethod = Godot.Core.Engine.get_main_loop

{-# NOINLINE bindEngine_get_physics_frames #-}

-- | Returns the total number of frames passed since engine initialization which is advanced on each __physics frame__. See also @method get_idle_frames@.
--   				@method get_physics_frames@ can be used to run expensive logic less often without relying on a @Timer@:
--   				
--   @
--   
--   				func _physics_process(_delta):
--   				    if Engine.get_physics_frames() % 2 == 0:
--   				        pass  # Run expensive logic only once every 2 physics frames here.
--   				
--   @
bindEngine_get_physics_frames :: MethodBind
bindEngine_get_physics_frames
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_physics_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total number of frames passed since engine initialization which is advanced on each __physics frame__. See also @method get_idle_frames@.
--   				@method get_physics_frames@ can be used to run expensive logic less often without relying on a @Timer@:
--   				
--   @
--   
--   				func _physics_process(_delta):
--   				    if Engine.get_physics_frames() % 2 == 0:
--   				        pass  # Run expensive logic only once every 2 physics frames here.
--   				
--   @
get_physics_frames ::
                     (Engine :< cls, Object :< cls) => cls -> IO Int
get_physics_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_physics_frames (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_physics_frames" '[] (IO Int) where
        nodeMethod = Godot.Core.Engine.get_physics_frames

{-# NOINLINE bindEngine_get_physics_interpolation_fraction #-}

-- | Returns the fraction through the current physics tick we are at the time of rendering the frame. This can be used to implement fixed timestep interpolation.
bindEngine_get_physics_interpolation_fraction :: MethodBind
bindEngine_get_physics_interpolation_fraction
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_physics_interpolation_fraction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the fraction through the current physics tick we are at the time of rendering the frame. This can be used to implement fixed timestep interpolation.
get_physics_interpolation_fraction ::
                                     (Engine :< cls, Object :< cls) => cls -> IO Float
get_physics_interpolation_fraction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEngine_get_physics_interpolation_fraction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_physics_interpolation_fraction" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.Engine.get_physics_interpolation_fraction

{-# NOINLINE bindEngine_get_singleton #-}

-- | Returns a global singleton with given @name@. Often used for plugins, e.g. @GodotPayment@ on Android.
bindEngine_get_singleton :: MethodBind
bindEngine_get_singleton
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a global singleton with given @name@. Often used for plugins, e.g. @GodotPayment@ on Android.
get_singleton ::
                (Engine :< cls, Object :< cls) => cls -> GodotString -> IO Object
get_singleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_singleton (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_singleton" '[GodotString]
           (IO Object)
         where
        nodeMethod = Godot.Core.Engine.get_singleton

{-# NOINLINE bindEngine_get_version_info #-}

-- | Returns the current engine version information in a Dictionary.
--   				@major@    - Holds the major version number as an int
--   				@minor@    - Holds the minor version number as an int
--   				@patch@    - Holds the patch version number as an int
--   				@hex@      - Holds the full version number encoded as a hexadecimal int with one byte (2 places) per number (see example below)
--   				@status@   - Holds the status (e.g. "beta", "rc1", "rc2", ... "stable") as a String
--   				@build@    - Holds the build name (e.g. "custom_build") as a String
--   				@hash@     - Holds the full Git commit hash as a String
--   				@year@     - Holds the year the version was released in as an int
--   				@string@   - @major@ + @minor@ + @patch@ + @status@ + @build@ in a single String
--   				The @hex@ value is encoded as follows, from left to right: one byte for the major, one byte for the minor, one byte for the patch version. For example, "3.1.12" would be @0x03010C@. __Note:__ It's still an int internally, and printing it will give you its decimal representation, which is not particularly meaningful. Use hexadecimal literals for easy version comparisons from code:
--   				
--   @
--   
--   				if Engine.get_version_info().hex >= 0x030200:
--   				    # Do things specific to version 3.2 or later
--   				else:
--   				    # Do things specific to versions before 3.2
--   				
--   @
bindEngine_get_version_info :: MethodBind
bindEngine_get_version_info
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "get_version_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current engine version information in a Dictionary.
--   				@major@    - Holds the major version number as an int
--   				@minor@    - Holds the minor version number as an int
--   				@patch@    - Holds the patch version number as an int
--   				@hex@      - Holds the full version number encoded as a hexadecimal int with one byte (2 places) per number (see example below)
--   				@status@   - Holds the status (e.g. "beta", "rc1", "rc2", ... "stable") as a String
--   				@build@    - Holds the build name (e.g. "custom_build") as a String
--   				@hash@     - Holds the full Git commit hash as a String
--   				@year@     - Holds the year the version was released in as an int
--   				@string@   - @major@ + @minor@ + @patch@ + @status@ + @build@ in a single String
--   				The @hex@ value is encoded as follows, from left to right: one byte for the major, one byte for the minor, one byte for the patch version. For example, "3.1.12" would be @0x03010C@. __Note:__ It's still an int internally, and printing it will give you its decimal representation, which is not particularly meaningful. Use hexadecimal literals for easy version comparisons from code:
--   				
--   @
--   
--   				if Engine.get_version_info().hex >= 0x030200:
--   				    # Do things specific to version 3.2 or later
--   				else:
--   				    # Do things specific to versions before 3.2
--   				
--   @
get_version_info ::
                   (Engine :< cls, Object :< cls) => cls -> IO Dictionary
get_version_info cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_get_version_info (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "get_version_info" '[] (IO Dictionary)
         where
        nodeMethod = Godot.Core.Engine.get_version_info

{-# NOINLINE bindEngine_has_singleton #-}

-- | Returns @true@ if a singleton with given @name@ exists in global scope.
bindEngine_has_singleton :: MethodBind
bindEngine_has_singleton
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "has_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a singleton with given @name@ exists in global scope.
has_singleton ::
                (Engine :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_singleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_has_singleton (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "has_singleton" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.Engine.has_singleton

{-# NOINLINE bindEngine_is_in_physics_frame #-}

-- | Returns @true@ if the game is inside the fixed process and physics phase of the game loop.
bindEngine_is_in_physics_frame :: MethodBind
bindEngine_is_in_physics_frame
  = unsafePerformIO $
      withCString "_Engine" $
        \ clsNamePtr ->
          withCString "is_in_physics_frame" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the game is inside the fixed process and physics phase of the game loop.
is_in_physics_frame ::
                      (Engine :< cls, Object :< cls) => cls -> IO Bool
is_in_physics_frame cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEngine_is_in_physics_frame (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Engine "is_in_physics_frame" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Engine.is_in_physics_frame