{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.World
       (Godot.Core.World.get_direct_space_state,
        Godot.Core.World.get_environment,
        Godot.Core.World.get_fallback_environment,
        Godot.Core.World.get_scenario, Godot.Core.World.get_space,
        Godot.Core.World.set_environment,
        Godot.Core.World.set_fallback_environment)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindWorld_get_direct_space_state #-}

-- | Direct access to the world's physics 3D space state. Used for querying current and potential collisions. Must only be accessed from within [code]_physics_process(delta)[/code].
bindWorld_get_direct_space_state :: MethodBind
bindWorld_get_direct_space_state
  = unsafePerformIO $
      withCString "World" $
        \ clsNamePtr ->
          withCString "get_direct_space_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Direct access to the world's physics 3D space state. Used for querying current and potential collisions. Must only be accessed from within [code]_physics_process(delta)[/code].
get_direct_space_state ::
                         (World :< cls, Object :< cls) => cls -> IO PhysicsDirectSpaceState
get_direct_space_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld_get_direct_space_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWorld_get_environment #-}

-- | The World's [Environment].
bindWorld_get_environment :: MethodBind
bindWorld_get_environment
  = unsafePerformIO $
      withCString "World" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The World's [Environment].
get_environment ::
                  (World :< cls, Object :< cls) => cls -> IO Environment
get_environment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld_get_environment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWorld_get_fallback_environment #-}

-- | The World's fallback_environment will be used if the World's [Environment] fails or is missing.
bindWorld_get_fallback_environment :: MethodBind
bindWorld_get_fallback_environment
  = unsafePerformIO $
      withCString "World" $
        \ clsNamePtr ->
          withCString "get_fallback_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The World's fallback_environment will be used if the World's [Environment] fails or is missing.
get_fallback_environment ::
                           (World :< cls, Object :< cls) => cls -> IO Environment
get_fallback_environment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld_get_fallback_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWorld_get_scenario #-}

-- | The World's visual scenario.
bindWorld_get_scenario :: MethodBind
bindWorld_get_scenario
  = unsafePerformIO $
      withCString "World" $
        \ clsNamePtr ->
          withCString "get_scenario" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The World's visual scenario.
get_scenario :: (World :< cls, Object :< cls) => cls -> IO Rid
get_scenario cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld_get_scenario (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWorld_get_space #-}

-- | The World's physics space.
bindWorld_get_space :: MethodBind
bindWorld_get_space
  = unsafePerformIO $
      withCString "World" $
        \ clsNamePtr ->
          withCString "get_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The World's physics space.
get_space :: (World :< cls, Object :< cls) => cls -> IO Rid
get_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld_get_space (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWorld_set_environment #-}

-- | The World's [Environment].
bindWorld_set_environment :: MethodBind
bindWorld_set_environment
  = unsafePerformIO $
      withCString "World" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The World's [Environment].
set_environment ::
                  (World :< cls, Object :< cls) => cls -> Environment -> IO ()
set_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld_set_environment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWorld_set_fallback_environment #-}

-- | The World's fallback_environment will be used if the World's [Environment] fails or is missing.
bindWorld_set_fallback_environment :: MethodBind
bindWorld_set_fallback_environment
  = unsafePerformIO $
      withCString "World" $
        \ clsNamePtr ->
          withCString "set_fallback_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The World's fallback_environment will be used if the World's [Environment] fails or is missing.
set_fallback_environment ::
                           (World :< cls, Object :< cls) => cls -> Environment -> IO ()
set_fallback_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld_set_fallback_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)