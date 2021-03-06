{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Camera
       (Godot.Core.Camera._PROJECTION_FRUSTUM,
        Godot.Core.Camera._PROJECTION_ORTHOGONAL,
        Godot.Core.Camera._KEEP_HEIGHT,
        Godot.Core.Camera._DOPPLER_TRACKING_PHYSICS_STEP,
        Godot.Core.Camera._DOPPLER_TRACKING_DISABLED,
        Godot.Core.Camera._KEEP_WIDTH,
        Godot.Core.Camera._DOPPLER_TRACKING_IDLE_STEP,
        Godot.Core.Camera._PROJECTION_PERSPECTIVE,
        Godot.Core.Camera.clear_current, Godot.Core.Camera.get_camera_rid,
        Godot.Core.Camera.get_camera_transform,
        Godot.Core.Camera.get_cull_mask,
        Godot.Core.Camera.get_cull_mask_bit,
        Godot.Core.Camera.get_doppler_tracking,
        Godot.Core.Camera.get_environment, Godot.Core.Camera.get_fov,
        Godot.Core.Camera.get_frustum,
        Godot.Core.Camera.get_frustum_offset,
        Godot.Core.Camera.get_h_offset,
        Godot.Core.Camera.get_keep_aspect_mode,
        Godot.Core.Camera.get_projection, Godot.Core.Camera.get_size,
        Godot.Core.Camera.get_v_offset, Godot.Core.Camera.get_zfar,
        Godot.Core.Camera.get_znear, Godot.Core.Camera.is_current,
        Godot.Core.Camera.is_position_behind,
        Godot.Core.Camera.make_current,
        Godot.Core.Camera.project_local_ray_normal,
        Godot.Core.Camera.project_position,
        Godot.Core.Camera.project_ray_normal,
        Godot.Core.Camera.project_ray_origin,
        Godot.Core.Camera.set_cull_mask,
        Godot.Core.Camera.set_cull_mask_bit, Godot.Core.Camera.set_current,
        Godot.Core.Camera.set_doppler_tracking,
        Godot.Core.Camera.set_environment, Godot.Core.Camera.set_fov,
        Godot.Core.Camera.set_frustum,
        Godot.Core.Camera.set_frustum_offset,
        Godot.Core.Camera.set_h_offset,
        Godot.Core.Camera.set_keep_aspect_mode,
        Godot.Core.Camera.set_orthogonal,
        Godot.Core.Camera.set_perspective,
        Godot.Core.Camera.set_projection, Godot.Core.Camera.set_size,
        Godot.Core.Camera.set_v_offset, Godot.Core.Camera.set_zfar,
        Godot.Core.Camera.set_znear, Godot.Core.Camera.unproject_position)
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
import Godot.Core.Spatial()

_PROJECTION_FRUSTUM :: Int
_PROJECTION_FRUSTUM = 2

_PROJECTION_ORTHOGONAL :: Int
_PROJECTION_ORTHOGONAL = 1

_KEEP_HEIGHT :: Int
_KEEP_HEIGHT = 1

_DOPPLER_TRACKING_PHYSICS_STEP :: Int
_DOPPLER_TRACKING_PHYSICS_STEP = 2

_DOPPLER_TRACKING_DISABLED :: Int
_DOPPLER_TRACKING_DISABLED = 0

_KEEP_WIDTH :: Int
_KEEP_WIDTH = 0

_DOPPLER_TRACKING_IDLE_STEP :: Int
_DOPPLER_TRACKING_IDLE_STEP = 1

_PROJECTION_PERSPECTIVE :: Int
_PROJECTION_PERSPECTIVE = 0

instance NodeProperty Camera "cull_mask" Int 'False where
        nodeProperty
          = (get_cull_mask, wrapDroppingSetter set_cull_mask, Nothing)

instance NodeProperty Camera "current" Bool 'False where
        nodeProperty
          = (is_current, wrapDroppingSetter set_current, Nothing)

instance NodeProperty Camera "doppler_tracking" Int 'False where
        nodeProperty
          = (get_doppler_tracking, wrapDroppingSetter set_doppler_tracking,
             Nothing)

instance NodeProperty Camera "environment" Environment 'False where
        nodeProperty
          = (get_environment, wrapDroppingSetter set_environment, Nothing)

instance NodeProperty Camera "far" Float 'False where
        nodeProperty = (get_zfar, wrapDroppingSetter set_zfar, Nothing)

instance NodeProperty Camera "fov" Float 'False where
        nodeProperty = (get_fov, wrapDroppingSetter set_fov, Nothing)

instance NodeProperty Camera "frustum_offset" Vector2 'False where
        nodeProperty
          = (get_frustum_offset, wrapDroppingSetter set_frustum_offset,
             Nothing)

instance NodeProperty Camera "h_offset" Float 'False where
        nodeProperty
          = (get_h_offset, wrapDroppingSetter set_h_offset, Nothing)

instance NodeProperty Camera "keep_aspect" Int 'False where
        nodeProperty
          = (get_keep_aspect_mode, wrapDroppingSetter set_keep_aspect_mode,
             Nothing)

instance NodeProperty Camera "near" Float 'False where
        nodeProperty = (get_znear, wrapDroppingSetter set_znear, Nothing)

instance NodeProperty Camera "projection" Int 'False where
        nodeProperty
          = (get_projection, wrapDroppingSetter set_projection, Nothing)

instance NodeProperty Camera "size" Float 'False where
        nodeProperty = (get_size, wrapDroppingSetter set_size, Nothing)

instance NodeProperty Camera "v_offset" Float 'False where
        nodeProperty
          = (get_v_offset, wrapDroppingSetter set_v_offset, Nothing)

{-# NOINLINE bindCamera_clear_current #-}

-- | If this is the current camera, remove it from being current. If @enable_next@ is @true@, request to make the next camera current, if any.
bindCamera_clear_current :: MethodBind
bindCamera_clear_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "clear_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this is the current camera, remove it from being current. If @enable_next@ is @true@, request to make the next camera current, if any.
clear_current ::
                (Camera :< cls, Object :< cls) => cls -> Maybe Bool -> IO ()
clear_current cls arg1
  = withVariantArray [maybe (VariantBool True) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_clear_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "clear_current" '[Maybe Bool] (IO ())
         where
        nodeMethod = Godot.Core.Camera.clear_current

{-# NOINLINE bindCamera_get_camera_rid #-}

-- | Returns the camera's RID from the @VisualServer@.
bindCamera_get_camera_rid :: MethodBind
bindCamera_get_camera_rid
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_camera_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the camera's RID from the @VisualServer@.
get_camera_rid :: (Camera :< cls, Object :< cls) => cls -> IO Rid
get_camera_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_camera_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_camera_rid" '[] (IO Rid) where
        nodeMethod = Godot.Core.Camera.get_camera_rid

{-# NOINLINE bindCamera_get_camera_transform #-}

-- | Gets the camera transform. Subclassed cameras such as @InterpolatedCamera@ may provide different transforms than the @Node@ transform.
bindCamera_get_camera_transform :: MethodBind
bindCamera_get_camera_transform
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_camera_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the camera transform. Subclassed cameras such as @InterpolatedCamera@ may provide different transforms than the @Node@ transform.
get_camera_transform ::
                       (Camera :< cls, Object :< cls) => cls -> IO Transform
get_camera_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_camera_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_camera_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.Camera.get_camera_transform

{-# NOINLINE bindCamera_get_cull_mask #-}

-- | The culling mask that describes which 3D render layers are rendered by this camera.
bindCamera_get_cull_mask :: MethodBind
bindCamera_get_cull_mask
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The culling mask that describes which 3D render layers are rendered by this camera.
get_cull_mask :: (Camera :< cls, Object :< cls) => cls -> IO Int
get_cull_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_cull_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_cull_mask" '[] (IO Int) where
        nodeMethod = Godot.Core.Camera.get_cull_mask

{-# NOINLINE bindCamera_get_cull_mask_bit #-}

-- | Returns @true@ if the given @layer@ in the @cull_mask@ is enabled, @false@ otherwise.
bindCamera_get_cull_mask_bit :: MethodBind
bindCamera_get_cull_mask_bit
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_cull_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given @layer@ in the @cull_mask@ is enabled, @false@ otherwise.
get_cull_mask_bit ::
                    (Camera :< cls, Object :< cls) => cls -> Int -> IO Bool
get_cull_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_cull_mask_bit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_cull_mask_bit" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.Camera.get_cull_mask_bit

{-# NOINLINE bindCamera_get_doppler_tracking #-}

-- | If not @DOPPLER_TRACKING_DISABLED@, this camera will simulate the @url=https://en.wikipedia.org/wiki/Doppler_effect@Doppler effect@/url@ for objects changed in particular @_process@ methods. See @enum DopplerTracking@ for possible values.
bindCamera_get_doppler_tracking :: MethodBind
bindCamera_get_doppler_tracking
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_doppler_tracking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If not @DOPPLER_TRACKING_DISABLED@, this camera will simulate the @url=https://en.wikipedia.org/wiki/Doppler_effect@Doppler effect@/url@ for objects changed in particular @_process@ methods. See @enum DopplerTracking@ for possible values.
get_doppler_tracking ::
                       (Camera :< cls, Object :< cls) => cls -> IO Int
get_doppler_tracking cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_doppler_tracking (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_doppler_tracking" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Camera.get_doppler_tracking

{-# NOINLINE bindCamera_get_environment #-}

-- | The @Environment@ to use for this camera.
bindCamera_get_environment :: MethodBind
bindCamera_get_environment
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Environment@ to use for this camera.
get_environment ::
                  (Camera :< cls, Object :< cls) => cls -> IO Environment
get_environment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_environment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_environment" '[] (IO Environment)
         where
        nodeMethod = Godot.Core.Camera.get_environment

{-# NOINLINE bindCamera_get_fov #-}

-- | The camera's field of view angle (in degrees). Only applicable in perspective mode. Since @keep_aspect@ locks one axis, @fov@ sets the other axis' field of view angle.
bindCamera_get_fov :: MethodBind
bindCamera_get_fov
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's field of view angle (in degrees). Only applicable in perspective mode. Since @keep_aspect@ locks one axis, @fov@ sets the other axis' field of view angle.
get_fov :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_fov cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_fov (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_fov" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_fov

{-# NOINLINE bindCamera_get_frustum #-}

-- | Returns the camera's frustum planes in world-space units as an array of @Plane@s in the following order: near, far, left, top, right, bottom. Not to be confused with @frustum_offset@.
bindCamera_get_frustum :: MethodBind
bindCamera_get_frustum
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_frustum" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the camera's frustum planes in world-space units as an array of @Plane@s in the following order: near, far, left, top, right, bottom. Not to be confused with @frustum_offset@.
get_frustum :: (Camera :< cls, Object :< cls) => cls -> IO Array
get_frustum cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_frustum (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_frustum" '[] (IO Array) where
        nodeMethod = Godot.Core.Camera.get_frustum

{-# NOINLINE bindCamera_get_frustum_offset #-}

-- | The camera's frustum offset. This can be changed from the default to create "tilted frustum" effects such as @url=https://zdoom.org/wiki/Y-shearing@Y-shearing@/url@.
bindCamera_get_frustum_offset :: MethodBind
bindCamera_get_frustum_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_frustum_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's frustum offset. This can be changed from the default to create "tilted frustum" effects such as @url=https://zdoom.org/wiki/Y-shearing@Y-shearing@/url@.
get_frustum_offset ::
                     (Camera :< cls, Object :< cls) => cls -> IO Vector2
get_frustum_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_frustum_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_frustum_offset" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.Camera.get_frustum_offset

{-# NOINLINE bindCamera_get_h_offset #-}

-- | The horizontal (X) offset of the camera viewport.
bindCamera_get_h_offset :: MethodBind
bindCamera_get_h_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The horizontal (X) offset of the camera viewport.
get_h_offset :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_h_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_h_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_h_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_h_offset

{-# NOINLINE bindCamera_get_keep_aspect_mode #-}

-- | The axis to lock during @fov@/@size@ adjustments. Can be either @KEEP_WIDTH@ or @KEEP_HEIGHT@.
bindCamera_get_keep_aspect_mode :: MethodBind
bindCamera_get_keep_aspect_mode
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_keep_aspect_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The axis to lock during @fov@/@size@ adjustments. Can be either @KEEP_WIDTH@ or @KEEP_HEIGHT@.
get_keep_aspect_mode ::
                       (Camera :< cls, Object :< cls) => cls -> IO Int
get_keep_aspect_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_keep_aspect_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_keep_aspect_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Camera.get_keep_aspect_mode

{-# NOINLINE bindCamera_get_projection #-}

-- | The camera's projection mode. In @PROJECTION_PERSPECTIVE@ mode, objects' Z distance from the camera's local space scales their perceived size.
bindCamera_get_projection :: MethodBind
bindCamera_get_projection
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's projection mode. In @PROJECTION_PERSPECTIVE@ mode, objects' Z distance from the camera's local space scales their perceived size.
get_projection :: (Camera :< cls, Object :< cls) => cls -> IO Int
get_projection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_projection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_projection" '[] (IO Int) where
        nodeMethod = Godot.Core.Camera.get_projection

{-# NOINLINE bindCamera_get_size #-}

-- | The camera's size measured as 1/2 the width or height. Only applicable in orthogonal mode. Since @keep_aspect@ locks on axis, @size@ sets the other axis' size length.
bindCamera_get_size :: MethodBind
bindCamera_get_size
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's size measured as 1/2 the width or height. Only applicable in orthogonal mode. Since @keep_aspect@ locks on axis, @size@ sets the other axis' size length.
get_size :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_size" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_size

{-# NOINLINE bindCamera_get_v_offset #-}

-- | The vertical (Y) offset of the camera viewport.
bindCamera_get_v_offset :: MethodBind
bindCamera_get_v_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The vertical (Y) offset of the camera viewport.
get_v_offset :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_v_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_v_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_v_offset" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_v_offset

{-# NOINLINE bindCamera_get_zfar #-}

-- | The distance to the far culling boundary for this camera relative to its local Z axis.
bindCamera_get_zfar :: MethodBind
bindCamera_get_zfar
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_zfar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to the far culling boundary for this camera relative to its local Z axis.
get_zfar :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_zfar cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_zfar (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_zfar" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_zfar

{-# NOINLINE bindCamera_get_znear #-}

-- | The distance to the near culling boundary for this camera relative to its local Z axis.
bindCamera_get_znear :: MethodBind
bindCamera_get_znear
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_znear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to the near culling boundary for this camera relative to its local Z axis.
get_znear :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_znear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_znear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "get_znear" '[] (IO Float) where
        nodeMethod = Godot.Core.Camera.get_znear

{-# NOINLINE bindCamera_is_current #-}

-- | If @true@, the ancestor @Viewport@ is currently using this camera.
bindCamera_is_current :: MethodBind
bindCamera_is_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "is_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the ancestor @Viewport@ is currently using this camera.
is_current :: (Camera :< cls, Object :< cls) => cls -> IO Bool
is_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_is_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "is_current" '[] (IO Bool) where
        nodeMethod = Godot.Core.Camera.is_current

{-# NOINLINE bindCamera_is_position_behind #-}

-- | Returns @true@ if the given position is behind the camera.
--   				__Note:__ A position which returns @false@ may still be outside the camera's field of view.
bindCamera_is_position_behind :: MethodBind
bindCamera_is_position_behind
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "is_position_behind" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given position is behind the camera.
--   				__Note:__ A position which returns @false@ may still be outside the camera's field of view.
is_position_behind ::
                     (Camera :< cls, Object :< cls) => cls -> Vector3 -> IO Bool
is_position_behind cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_is_position_behind (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "is_position_behind" '[Vector3]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Camera.is_position_behind

{-# NOINLINE bindCamera_make_current #-}

-- | Makes this camera the current camera for the @Viewport@ (see class description). If the camera node is outside the scene tree, it will attempt to become current once it's added.
bindCamera_make_current :: MethodBind
bindCamera_make_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes this camera the current camera for the @Viewport@ (see class description). If the camera node is outside the scene tree, it will attempt to become current once it's added.
make_current :: (Camera :< cls, Object :< cls) => cls -> IO ()
make_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_make_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "make_current" '[] (IO ()) where
        nodeMethod = Godot.Core.Camera.make_current

{-# NOINLINE bindCamera_project_local_ray_normal #-}

-- | Returns a normal vector from the screen point location directed along the camera. Orthogonal cameras are normalized. Perspective cameras account for perspective, screen width/height, etc.
bindCamera_project_local_ray_normal :: MethodBind
bindCamera_project_local_ray_normal
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_local_ray_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a normal vector from the screen point location directed along the camera. Orthogonal cameras are normalized. Perspective cameras account for perspective, screen width/height, etc.
project_local_ray_normal ::
                           (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_local_ray_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_local_ray_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "project_local_ray_normal" '[Vector2]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Camera.project_local_ray_normal

{-# NOINLINE bindCamera_project_position #-}

-- | Returns the 3D point in worldspace that maps to the given 2D coordinate in the @Viewport@ rectangle on a plane that is the given @z_depth@ distance into the scene away from the camera.
bindCamera_project_position :: MethodBind
bindCamera_project_position
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 3D point in worldspace that maps to the given 2D coordinate in the @Viewport@ rectangle on a plane that is the given @z_depth@ distance into the scene away from the camera.
project_position ::
                   (Camera :< cls, Object :< cls) =>
                   cls -> Vector2 -> Float -> IO Vector3
project_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "project_position" '[Vector2, Float]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Camera.project_position

{-# NOINLINE bindCamera_project_ray_normal #-}

-- | Returns a normal vector in worldspace, that is the result of projecting a point on the @Viewport@ rectangle by the camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
bindCamera_project_ray_normal :: MethodBind
bindCamera_project_ray_normal
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_ray_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a normal vector in worldspace, that is the result of projecting a point on the @Viewport@ rectangle by the camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
project_ray_normal ::
                     (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_ray_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_ray_normal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "project_ray_normal" '[Vector2]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Camera.project_ray_normal

{-# NOINLINE bindCamera_project_ray_origin #-}

-- | Returns a 3D position in worldspace, that is the result of projecting a point on the @Viewport@ rectangle by the camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
bindCamera_project_ray_origin :: MethodBind
bindCamera_project_ray_origin
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_ray_origin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a 3D position in worldspace, that is the result of projecting a point on the @Viewport@ rectangle by the camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
project_ray_origin ::
                     (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_ray_origin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_ray_origin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "project_ray_origin" '[Vector2]
           (IO Vector3)
         where
        nodeMethod = Godot.Core.Camera.project_ray_origin

{-# NOINLINE bindCamera_set_cull_mask #-}

-- | The culling mask that describes which 3D render layers are rendered by this camera.
bindCamera_set_cull_mask :: MethodBind
bindCamera_set_cull_mask
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The culling mask that describes which 3D render layers are rendered by this camera.
set_cull_mask ::
                (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_cull_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_cull_mask (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_cull_mask" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_cull_mask

{-# NOINLINE bindCamera_set_cull_mask_bit #-}

-- | Enables or disables the given @layer@ in the @cull_mask@.
bindCamera_set_cull_mask_bit :: MethodBind
bindCamera_set_cull_mask_bit
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_cull_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables the given @layer@ in the @cull_mask@.
set_cull_mask_bit ::
                    (Camera :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_cull_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_cull_mask_bit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_cull_mask_bit" '[Int, Bool] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_cull_mask_bit

{-# NOINLINE bindCamera_set_current #-}

-- | If @true@, the ancestor @Viewport@ is currently using this camera.
bindCamera_set_current :: MethodBind
bindCamera_set_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the ancestor @Viewport@ is currently using this camera.
set_current ::
              (Camera :< cls, Object :< cls) => cls -> Bool -> IO ()
set_current cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_current" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_current

{-# NOINLINE bindCamera_set_doppler_tracking #-}

-- | If not @DOPPLER_TRACKING_DISABLED@, this camera will simulate the @url=https://en.wikipedia.org/wiki/Doppler_effect@Doppler effect@/url@ for objects changed in particular @_process@ methods. See @enum DopplerTracking@ for possible values.
bindCamera_set_doppler_tracking :: MethodBind
bindCamera_set_doppler_tracking
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_doppler_tracking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If not @DOPPLER_TRACKING_DISABLED@, this camera will simulate the @url=https://en.wikipedia.org/wiki/Doppler_effect@Doppler effect@/url@ for objects changed in particular @_process@ methods. See @enum DopplerTracking@ for possible values.
set_doppler_tracking ::
                       (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_doppler_tracking cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_doppler_tracking (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_doppler_tracking" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_doppler_tracking

{-# NOINLINE bindCamera_set_environment #-}

-- | The @Environment@ to use for this camera.
bindCamera_set_environment :: MethodBind
bindCamera_set_environment
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Environment@ to use for this camera.
set_environment ::
                  (Camera :< cls, Object :< cls) => cls -> Environment -> IO ()
set_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_environment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_environment" '[Environment] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_environment

{-# NOINLINE bindCamera_set_fov #-}

-- | The camera's field of view angle (in degrees). Only applicable in perspective mode. Since @keep_aspect@ locks one axis, @fov@ sets the other axis' field of view angle.
bindCamera_set_fov :: MethodBind
bindCamera_set_fov
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's field of view angle (in degrees). Only applicable in perspective mode. Since @keep_aspect@ locks one axis, @fov@ sets the other axis' field of view angle.
set_fov :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_fov cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_fov (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_fov" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_fov

{-# NOINLINE bindCamera_set_frustum #-}

-- | Sets the camera projection to frustum mode (see @PROJECTION_FRUSTUM@), by specifying a @size@, an @offset@, and the @z_near@ and @z_far@ clip planes in world-space units.
bindCamera_set_frustum :: MethodBind
bindCamera_set_frustum
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_frustum" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the camera projection to frustum mode (see @PROJECTION_FRUSTUM@), by specifying a @size@, an @offset@, and the @z_near@ and @z_far@ clip planes in world-space units.
set_frustum ::
              (Camera :< cls, Object :< cls) =>
              cls -> Float -> Vector2 -> Float -> Float -> IO ()
set_frustum cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_frustum (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_frustum"
           '[Float, Vector2, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_frustum

{-# NOINLINE bindCamera_set_frustum_offset #-}

-- | The camera's frustum offset. This can be changed from the default to create "tilted frustum" effects such as @url=https://zdoom.org/wiki/Y-shearing@Y-shearing@/url@.
bindCamera_set_frustum_offset :: MethodBind
bindCamera_set_frustum_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_frustum_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's frustum offset. This can be changed from the default to create "tilted frustum" effects such as @url=https://zdoom.org/wiki/Y-shearing@Y-shearing@/url@.
set_frustum_offset ::
                     (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_frustum_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_frustum_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_frustum_offset" '[Vector2] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_frustum_offset

{-# NOINLINE bindCamera_set_h_offset #-}

-- | The horizontal (X) offset of the camera viewport.
bindCamera_set_h_offset :: MethodBind
bindCamera_set_h_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The horizontal (X) offset of the camera viewport.
set_h_offset ::
               (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_h_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_h_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_h_offset" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_h_offset

{-# NOINLINE bindCamera_set_keep_aspect_mode #-}

-- | The axis to lock during @fov@/@size@ adjustments. Can be either @KEEP_WIDTH@ or @KEEP_HEIGHT@.
bindCamera_set_keep_aspect_mode :: MethodBind
bindCamera_set_keep_aspect_mode
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_keep_aspect_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The axis to lock during @fov@/@size@ adjustments. Can be either @KEEP_WIDTH@ or @KEEP_HEIGHT@.
set_keep_aspect_mode ::
                       (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_keep_aspect_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_keep_aspect_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_keep_aspect_mode" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_keep_aspect_mode

{-# NOINLINE bindCamera_set_orthogonal #-}

-- | Sets the camera projection to orthogonal mode (see @PROJECTION_ORTHOGONAL@), by specifying a @size@, and the @z_near@ and @z_far@ clip planes in world-space units. (As a hint, 2D games often use this projection, with values specified in pixels.)
bindCamera_set_orthogonal :: MethodBind
bindCamera_set_orthogonal
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_orthogonal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the camera projection to orthogonal mode (see @PROJECTION_ORTHOGONAL@), by specifying a @size@, and the @z_near@ and @z_far@ clip planes in world-space units. (As a hint, 2D games often use this projection, with values specified in pixels.)
set_orthogonal ::
                 (Camera :< cls, Object :< cls) =>
                 cls -> Float -> Float -> Float -> IO ()
set_orthogonal cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_orthogonal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_orthogonal" '[Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_orthogonal

{-# NOINLINE bindCamera_set_perspective #-}

-- | Sets the camera projection to perspective mode (see @PROJECTION_PERSPECTIVE@), by specifying a @fov@ (field of view) angle in degrees, and the @z_near@ and @z_far@ clip planes in world-space units.
bindCamera_set_perspective :: MethodBind
bindCamera_set_perspective
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_perspective" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the camera projection to perspective mode (see @PROJECTION_PERSPECTIVE@), by specifying a @fov@ (field of view) angle in degrees, and the @z_near@ and @z_far@ clip planes in world-space units.
set_perspective ::
                  (Camera :< cls, Object :< cls) =>
                  cls -> Float -> Float -> Float -> IO ()
set_perspective cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_perspective (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_perspective" '[Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.Camera.set_perspective

{-# NOINLINE bindCamera_set_projection #-}

-- | The camera's projection mode. In @PROJECTION_PERSPECTIVE@ mode, objects' Z distance from the camera's local space scales their perceived size.
bindCamera_set_projection :: MethodBind
bindCamera_set_projection
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's projection mode. In @PROJECTION_PERSPECTIVE@ mode, objects' Z distance from the camera's local space scales their perceived size.
set_projection ::
                 (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_projection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_projection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_projection" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_projection

{-# NOINLINE bindCamera_set_size #-}

-- | The camera's size measured as 1/2 the width or height. Only applicable in orthogonal mode. Since @keep_aspect@ locks on axis, @size@ sets the other axis' size length.
bindCamera_set_size :: MethodBind
bindCamera_set_size
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's size measured as 1/2 the width or height. Only applicable in orthogonal mode. Since @keep_aspect@ locks on axis, @size@ sets the other axis' size length.
set_size :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_size" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_size

{-# NOINLINE bindCamera_set_v_offset #-}

-- | The vertical (Y) offset of the camera viewport.
bindCamera_set_v_offset :: MethodBind
bindCamera_set_v_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The vertical (Y) offset of the camera viewport.
set_v_offset ::
               (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_v_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_v_offset" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_v_offset

{-# NOINLINE bindCamera_set_zfar #-}

-- | The distance to the far culling boundary for this camera relative to its local Z axis.
bindCamera_set_zfar :: MethodBind
bindCamera_set_zfar
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_zfar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to the far culling boundary for this camera relative to its local Z axis.
set_zfar :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_zfar cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_zfar (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_zfar" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_zfar

{-# NOINLINE bindCamera_set_znear #-}

-- | The distance to the near culling boundary for this camera relative to its local Z axis.
bindCamera_set_znear :: MethodBind
bindCamera_set_znear
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_znear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to the near culling boundary for this camera relative to its local Z axis.
set_znear ::
            (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_znear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_znear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "set_znear" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Camera.set_znear

{-# NOINLINE bindCamera_unproject_position #-}

-- | Returns the 2D coordinate in the @Viewport@ rectangle that maps to the given 3D point in worldspace.
bindCamera_unproject_position :: MethodBind
bindCamera_unproject_position
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "unproject_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 2D coordinate in the @Viewport@ rectangle that maps to the given 3D point in worldspace.
unproject_position ::
                     (Camera :< cls, Object :< cls) => cls -> Vector3 -> IO Vector2
unproject_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_unproject_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Camera "unproject_position" '[Vector3]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.Camera.unproject_position