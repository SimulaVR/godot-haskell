{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ARVROrigin
       (Godot.Core.ARVROrigin.get_world_scale,
        Godot.Core.ARVROrigin.set_world_scale)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindARVROrigin_get_world_scale #-}

-- | Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 meter in the real world.
--   			Note that this method is a passthrough to the [ARVRServer] itself.
bindARVROrigin_get_world_scale :: MethodBind
bindARVROrigin_get_world_scale
  = unsafePerformIO $
      withCString "ARVROrigin" $
        \ clsNamePtr ->
          withCString "get_world_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 meter in the real world.
--   			Note that this method is a passthrough to the [ARVRServer] itself.
get_world_scale ::
                  (ARVROrigin :< cls, Object :< cls) => cls -> IO Float
get_world_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVROrigin_get_world_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindARVROrigin_set_world_scale #-}

-- | Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 meter in the real world.
--   			Note that this method is a passthrough to the [ARVRServer] itself.
bindARVROrigin_set_world_scale :: MethodBind
bindARVROrigin_set_world_scale
  = unsafePerformIO $
      withCString "ARVROrigin" $
        \ clsNamePtr ->
          withCString "set_world_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allows you to adjust the scale to your game's units. Most AR/VR platforms assume a scale of 1 game world unit = 1 meter in the real world.
--   			Note that this method is a passthrough to the [ARVRServer] itself.
set_world_scale ::
                  (ARVROrigin :< cls, Object :< cls) => cls -> Float -> IO ()
set_world_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindARVROrigin_set_world_scale (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)