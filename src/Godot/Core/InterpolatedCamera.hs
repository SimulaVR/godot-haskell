{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.InterpolatedCamera
       (Godot.Core.InterpolatedCamera.get_speed,
        Godot.Core.InterpolatedCamera.get_target_path,
        Godot.Core.InterpolatedCamera.is_interpolation_enabled,
        Godot.Core.InterpolatedCamera.set_interpolation_enabled,
        Godot.Core.InterpolatedCamera.set_speed,
        Godot.Core.InterpolatedCamera.set_target,
        Godot.Core.InterpolatedCamera.set_target_path)
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
import Godot.Core.Camera()

instance NodeProperty InterpolatedCamera "enabled" Bool 'False
         where
        nodeProperty
          = (is_interpolation_enabled,
             wrapDroppingSetter set_interpolation_enabled, Nothing)

instance NodeProperty InterpolatedCamera "speed" Float 'False where
        nodeProperty = (get_speed, wrapDroppingSetter set_speed, Nothing)

instance NodeProperty InterpolatedCamera "target" NodePath 'False
         where
        nodeProperty
          = (get_target_path, wrapDroppingSetter set_target_path, Nothing)

{-# NOINLINE bindInterpolatedCamera_get_speed #-}

-- | How quickly the camera moves toward its target. Higher values will result in tighter camera motion.
bindInterpolatedCamera_get_speed :: MethodBind
bindInterpolatedCamera_get_speed
  = unsafePerformIO $
      withCString "InterpolatedCamera" $
        \ clsNamePtr ->
          withCString "get_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How quickly the camera moves toward its target. Higher values will result in tighter camera motion.
get_speed ::
            (InterpolatedCamera :< cls, Object :< cls) => cls -> IO Float
get_speed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInterpolatedCamera_get_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InterpolatedCamera "get_speed" '[] (IO Float)
         where
        nodeMethod = Godot.Core.InterpolatedCamera.get_speed

{-# NOINLINE bindInterpolatedCamera_get_target_path #-}

-- | The target's @NodePath@.
bindInterpolatedCamera_get_target_path :: MethodBind
bindInterpolatedCamera_get_target_path
  = unsafePerformIO $
      withCString "InterpolatedCamera" $
        \ clsNamePtr ->
          withCString "get_target_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The target's @NodePath@.
get_target_path ::
                  (InterpolatedCamera :< cls, Object :< cls) => cls -> IO NodePath
get_target_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInterpolatedCamera_get_target_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InterpolatedCamera "get_target_path" '[]
           (IO NodePath)
         where
        nodeMethod = Godot.Core.InterpolatedCamera.get_target_path

{-# NOINLINE bindInterpolatedCamera_is_interpolation_enabled #-}

-- | If @true@, and a target is set, the camera will move automatically.
bindInterpolatedCamera_is_interpolation_enabled :: MethodBind
bindInterpolatedCamera_is_interpolation_enabled
  = unsafePerformIO $
      withCString "InterpolatedCamera" $
        \ clsNamePtr ->
          withCString "is_interpolation_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, and a target is set, the camera will move automatically.
is_interpolation_enabled ::
                           (InterpolatedCamera :< cls, Object :< cls) => cls -> IO Bool
is_interpolation_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindInterpolatedCamera_is_interpolation_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InterpolatedCamera "is_interpolation_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.InterpolatedCamera.is_interpolation_enabled

{-# NOINLINE bindInterpolatedCamera_set_interpolation_enabled #-}

-- | If @true@, and a target is set, the camera will move automatically.
bindInterpolatedCamera_set_interpolation_enabled :: MethodBind
bindInterpolatedCamera_set_interpolation_enabled
  = unsafePerformIO $
      withCString "InterpolatedCamera" $
        \ clsNamePtr ->
          withCString "set_interpolation_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, and a target is set, the camera will move automatically.
set_interpolation_enabled ::
                            (InterpolatedCamera :< cls, Object :< cls) => cls -> Bool -> IO ()
set_interpolation_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindInterpolatedCamera_set_interpolation_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InterpolatedCamera "set_interpolation_enabled"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.InterpolatedCamera.set_interpolation_enabled

{-# NOINLINE bindInterpolatedCamera_set_speed #-}

-- | How quickly the camera moves toward its target. Higher values will result in tighter camera motion.
bindInterpolatedCamera_set_speed :: MethodBind
bindInterpolatedCamera_set_speed
  = unsafePerformIO $
      withCString "InterpolatedCamera" $
        \ clsNamePtr ->
          withCString "set_speed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | How quickly the camera moves toward its target. Higher values will result in tighter camera motion.
set_speed ::
            (InterpolatedCamera :< cls, Object :< cls) => cls -> Float -> IO ()
set_speed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInterpolatedCamera_set_speed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InterpolatedCamera "set_speed" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.InterpolatedCamera.set_speed

{-# NOINLINE bindInterpolatedCamera_set_target #-}

-- | Sets the node to move toward and orient with.
bindInterpolatedCamera_set_target :: MethodBind
bindInterpolatedCamera_set_target
  = unsafePerformIO $
      withCString "InterpolatedCamera" $
        \ clsNamePtr ->
          withCString "set_target" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the node to move toward and orient with.
set_target ::
             (InterpolatedCamera :< cls, Object :< cls) =>
             cls -> Object -> IO ()
set_target cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInterpolatedCamera_set_target
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InterpolatedCamera "set_target" '[Object]
           (IO ())
         where
        nodeMethod = Godot.Core.InterpolatedCamera.set_target

{-# NOINLINE bindInterpolatedCamera_set_target_path #-}

-- | The target's @NodePath@.
bindInterpolatedCamera_set_target_path :: MethodBind
bindInterpolatedCamera_set_target_path
  = unsafePerformIO $
      withCString "InterpolatedCamera" $
        \ clsNamePtr ->
          withCString "set_target_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The target's @NodePath@.
set_target_path ::
                  (InterpolatedCamera :< cls, Object :< cls) =>
                  cls -> NodePath -> IO ()
set_target_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindInterpolatedCamera_set_target_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod InterpolatedCamera "set_target_path"
           '[NodePath]
           (IO ())
         where
        nodeMethod = Godot.Core.InterpolatedCamera.set_target_path