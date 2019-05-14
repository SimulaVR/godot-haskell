{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Camera
       (Godot.Core.Camera._PROJECTION_ORTHOGONAL,
        Godot.Core.Camera._KEEP_HEIGHT,
        Godot.Core.Camera._DOPPLER_TRACKING_PHYSICS_STEP,
        Godot.Core.Camera._DOPPLER_TRACKING_DISABLED,
        Godot.Core.Camera._KEEP_WIDTH,
        Godot.Core.Camera._DOPPLER_TRACKING_IDLE_STEP,
        Godot.Core.Camera._PROJECTION_PERSPECTIVE,
        Godot.Core.Camera.project_ray_normal,
        Godot.Core.Camera.project_local_ray_normal,
        Godot.Core.Camera.project_ray_origin,
        Godot.Core.Camera.unproject_position,
        Godot.Core.Camera.is_position_behind,
        Godot.Core.Camera.project_position,
        Godot.Core.Camera.set_perspective,
        Godot.Core.Camera.set_orthogonal, Godot.Core.Camera.make_current,
        Godot.Core.Camera.clear_current, Godot.Core.Camera.set_current,
        Godot.Core.Camera.is_current,
        Godot.Core.Camera.get_camera_transform, Godot.Core.Camera.get_fov,
        Godot.Core.Camera.get_size, Godot.Core.Camera.get_zfar,
        Godot.Core.Camera.get_znear, Godot.Core.Camera.set_fov,
        Godot.Core.Camera.set_size, Godot.Core.Camera.set_zfar,
        Godot.Core.Camera.set_znear, Godot.Core.Camera.get_projection,
        Godot.Core.Camera.set_projection, Godot.Core.Camera.set_h_offset,
        Godot.Core.Camera.get_h_offset, Godot.Core.Camera.set_v_offset,
        Godot.Core.Camera.get_v_offset, Godot.Core.Camera.set_cull_mask,
        Godot.Core.Camera.get_cull_mask, Godot.Core.Camera.set_environment,
        Godot.Core.Camera.get_environment,
        Godot.Core.Camera.set_keep_aspect_mode,
        Godot.Core.Camera.get_keep_aspect_mode,
        Godot.Core.Camera.set_doppler_tracking,
        Godot.Core.Camera.get_doppler_tracking,
        Godot.Core.Camera.get_frustum, Godot.Core.Camera.set_cull_mask_bit,
        Godot.Core.Camera.get_cull_mask_bit)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

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

{-# NOINLINE bindCamera_project_ray_normal #-}

-- | Returns a normal vector in worldspace, that is the result of projecting a point on the [Viewport] rectangle by the camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
bindCamera_project_ray_normal :: MethodBind
bindCamera_project_ray_normal
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_ray_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a normal vector in worldspace, that is the result of projecting a point on the [Viewport] rectangle by the camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
project_ray_normal ::
                     (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_ray_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_ray_normal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindCamera_project_ray_origin #-}

-- | Returns a 3D position in worldspace, that is the result of projecting a point on the [Viewport] rectangle by the camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
bindCamera_project_ray_origin :: MethodBind
bindCamera_project_ray_origin
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_ray_origin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a 3D position in worldspace, that is the result of projecting a point on the [Viewport] rectangle by the camera projection. This is useful for casting rays in the form of (origin, normal) for object intersection or picking.
project_ray_origin ::
                     (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_ray_origin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_ray_origin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_unproject_position #-}

-- | Returns the 2D coordinate in the [Viewport] rectangle that maps to the given 3D point in worldspace.
bindCamera_unproject_position :: MethodBind
bindCamera_unproject_position
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "unproject_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 2D coordinate in the [Viewport] rectangle that maps to the given 3D point in worldspace.
unproject_position ::
                     (Camera :< cls, Object :< cls) => cls -> Vector3 -> IO Vector2
unproject_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_unproject_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_is_position_behind #-}

-- | Returns [code]true[/code] if the given position is behind the Camera. Note that a position which returns [code]false[/code] may still be outside the Camera's field of view.
bindCamera_is_position_behind :: MethodBind
bindCamera_is_position_behind
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "is_position_behind" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given position is behind the Camera. Note that a position which returns [code]false[/code] may still be outside the Camera's field of view.
is_position_behind ::
                     (Camera :< cls, Object :< cls) => cls -> Vector3 -> IO Bool
is_position_behind cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_is_position_behind (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_project_position #-}

-- | Returns the 3D point in worldspace that maps to the given 2D coordinate in the [Viewport] rectangle.
bindCamera_project_position :: MethodBind
bindCamera_project_position
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "project_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the 3D point in worldspace that maps to the given 2D coordinate in the [Viewport] rectangle.
project_position ::
                   (Camera :< cls, Object :< cls) => cls -> Vector2 -> IO Vector3
project_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_project_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_perspective #-}

-- | Sets the camera projection to perspective mode, by specifying a [i]FOV[/i] Y angle in degrees (FOV means Field of View), and the [i]near[/i] and [i]far[/i] clip planes in worldspace units.
bindCamera_set_perspective :: MethodBind
bindCamera_set_perspective
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_perspective" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the camera projection to perspective mode, by specifying a [i]FOV[/i] Y angle in degrees (FOV means Field of View), and the [i]near[/i] and [i]far[/i] clip planes in worldspace units.
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

{-# NOINLINE bindCamera_set_orthogonal #-}

-- | Sets the camera projection to orthogonal mode, by specifying a width and the [i]near[/i] and [i]far[/i] clip planes in worldspace units. (As a hint, 2D games often use this projection, with values specified in pixels)
bindCamera_set_orthogonal :: MethodBind
bindCamera_set_orthogonal
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_orthogonal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the camera projection to orthogonal mode, by specifying a width and the [i]near[/i] and [i]far[/i] clip planes in worldspace units. (As a hint, 2D games often use this projection, with values specified in pixels)
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

{-# NOINLINE bindCamera_make_current #-}

-- | Makes this camera the current Camera for the [Viewport] (see class description). If the Camera Node is outside the scene tree, it will attempt to become current once it's added.
bindCamera_make_current :: MethodBind
bindCamera_make_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Makes this camera the current Camera for the [Viewport] (see class description). If the Camera Node is outside the scene tree, it will attempt to become current once it's added.
make_current :: (Camera :< cls, Object :< cls) => cls -> IO ()
make_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_make_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_clear_current #-}

-- | If this is the current Camera, remove it from being current. If [code]enable_next[/code] is true, request to make the next Camera current, if any.
bindCamera_clear_current :: MethodBind
bindCamera_clear_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "clear_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this is the current Camera, remove it from being current. If [code]enable_next[/code] is true, request to make the next Camera current, if any.
clear_current ::
                (Camera :< cls, Object :< cls) => cls -> Bool -> IO ()
clear_current cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_clear_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_current #-}

-- | If [code]true[/code], the ancestor [Viewport] is currently using this Camera. Default value: [code]false[/code].
bindCamera_set_current :: MethodBind
bindCamera_set_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the ancestor [Viewport] is currently using this Camera. Default value: [code]false[/code].
set_current ::
              (Camera :< cls, Object :< cls) => cls -> Bool -> IO ()
set_current cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_is_current #-}

-- | If [code]true[/code], the ancestor [Viewport] is currently using this Camera. Default value: [code]false[/code].
bindCamera_is_current :: MethodBind
bindCamera_is_current
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "is_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the ancestor [Viewport] is currently using this Camera. Default value: [code]false[/code].
is_current :: (Camera :< cls, Object :< cls) => cls -> IO Bool
is_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_is_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_camera_transform #-}

-- | Gets the camera transform. Subclassed cameras (such as CharacterCamera) may provide different transforms than the [Node] transform.
bindCamera_get_camera_transform :: MethodBind
bindCamera_get_camera_transform
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_camera_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the camera transform. Subclassed cameras (such as CharacterCamera) may provide different transforms than the [Node] transform.
get_camera_transform ::
                       (Camera :< cls, Object :< cls) => cls -> IO Transform
get_camera_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_camera_transform (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_fov #-}

-- | The camera's field of view angle (in degrees). Only applicable in perspective mode. Since [member keep_aspect] locks one axis, [code]fov[/code] sets the other axis' field of view angle.
bindCamera_get_fov :: MethodBind
bindCamera_get_fov
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's field of view angle (in degrees). Only applicable in perspective mode. Since [member keep_aspect] locks one axis, [code]fov[/code] sets the other axis' field of view angle.
get_fov :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_fov cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_fov (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_size #-}

-- | The camera's size measured as 1/2 the width or height. Only applicable in orthogonal mode. Since [member keep_aspect] locks on axis, [code]size[/code] sets the other axis' size length.
bindCamera_get_size :: MethodBind
bindCamera_get_size
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's size measured as 1/2 the width or height. Only applicable in orthogonal mode. Since [member keep_aspect] locks on axis, [code]size[/code] sets the other axis' size length.
get_size :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_size cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_zfar #-}

-- | The distance to the far culling boundary for this Camera relative to its local z-axis.
bindCamera_get_zfar :: MethodBind
bindCamera_get_zfar
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_zfar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to the far culling boundary for this Camera relative to its local z-axis.
get_zfar :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_zfar cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_zfar (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_znear #-}

-- | The distance to the near culling boundary for this Camera relative to its local z-axis.
bindCamera_get_znear :: MethodBind
bindCamera_get_znear
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_znear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to the near culling boundary for this Camera relative to its local z-axis.
get_znear :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_znear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_znear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_fov #-}

-- | The camera's field of view angle (in degrees). Only applicable in perspective mode. Since [member keep_aspect] locks one axis, [code]fov[/code] sets the other axis' field of view angle.
bindCamera_set_fov :: MethodBind
bindCamera_set_fov
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's field of view angle (in degrees). Only applicable in perspective mode. Since [member keep_aspect] locks one axis, [code]fov[/code] sets the other axis' field of view angle.
set_fov :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_fov cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_fov (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_size #-}

-- | The camera's size measured as 1/2 the width or height. Only applicable in orthogonal mode. Since [member keep_aspect] locks on axis, [code]size[/code] sets the other axis' size length.
bindCamera_set_size :: MethodBind
bindCamera_set_size
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's size measured as 1/2 the width or height. Only applicable in orthogonal mode. Since [member keep_aspect] locks on axis, [code]size[/code] sets the other axis' size length.
set_size :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_size (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_zfar #-}

-- | The distance to the far culling boundary for this Camera relative to its local z-axis.
bindCamera_set_zfar :: MethodBind
bindCamera_set_zfar
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_zfar" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to the far culling boundary for this Camera relative to its local z-axis.
set_zfar :: (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_zfar cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_zfar (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_znear #-}

-- | The distance to the near culling boundary for this Camera relative to its local z-axis.
bindCamera_set_znear :: MethodBind
bindCamera_set_znear
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_znear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The distance to the near culling boundary for this Camera relative to its local z-axis.
set_znear ::
            (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_znear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_znear (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_projection #-}

-- | The camera's projection mode. In [code]PROJECTION_PERSPECTIVE[/code] mode, objects' z-distance from the camera's local space scales their perceived size.
bindCamera_get_projection :: MethodBind
bindCamera_get_projection
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's projection mode. In [code]PROJECTION_PERSPECTIVE[/code] mode, objects' z-distance from the camera's local space scales their perceived size.
get_projection :: (Camera :< cls, Object :< cls) => cls -> IO Int
get_projection cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_projection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_projection #-}

-- | The camera's projection mode. In [code]PROJECTION_PERSPECTIVE[/code] mode, objects' z-distance from the camera's local space scales their perceived size.
bindCamera_set_projection :: MethodBind
bindCamera_set_projection
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The camera's projection mode. In [code]PROJECTION_PERSPECTIVE[/code] mode, objects' z-distance from the camera's local space scales their perceived size.
set_projection ::
                 (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_projection cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_projection (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_h_offset #-}

-- | The horizontal (X) offset of the Camera viewport.
bindCamera_set_h_offset :: MethodBind
bindCamera_set_h_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The horizontal (X) offset of the Camera viewport.
set_h_offset ::
               (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_h_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_h_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_h_offset #-}

-- | The horizontal (X) offset of the Camera viewport.
bindCamera_get_h_offset :: MethodBind
bindCamera_get_h_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_h_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The horizontal (X) offset of the Camera viewport.
get_h_offset :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_h_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_h_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_v_offset #-}

-- | The vertical (Y) offset of the Camera viewport.
bindCamera_set_v_offset :: MethodBind
bindCamera_set_v_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The vertical (Y) offset of the Camera viewport.
set_v_offset ::
               (Camera :< cls, Object :< cls) => cls -> Float -> IO ()
set_v_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_v_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_v_offset #-}

-- | The vertical (Y) offset of the Camera viewport.
bindCamera_get_v_offset :: MethodBind
bindCamera_get_v_offset
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_v_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The vertical (Y) offset of the Camera viewport.
get_v_offset :: (Camera :< cls, Object :< cls) => cls -> IO Float
get_v_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_v_offset (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindCamera_set_environment #-}

-- | The [Environment] to use for this Camera.
bindCamera_set_environment :: MethodBind
bindCamera_set_environment
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Environment] to use for this Camera.
set_environment ::
                  (Camera :< cls, Object :< cls) => cls -> Environment -> IO ()
set_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_environment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_environment #-}

-- | The [Environment] to use for this Camera.
bindCamera_get_environment :: MethodBind
bindCamera_get_environment
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Environment] to use for this Camera.
get_environment ::
                  (Camera :< cls, Object :< cls) => cls -> IO Environment
get_environment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_environment (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_keep_aspect_mode #-}

-- | The axis to lock during [member fov]/[member size] adjustments. Can be either [code]KEEP_WIDTH[/code] or [code]KEEP_HEIGHT[/code].
bindCamera_set_keep_aspect_mode :: MethodBind
bindCamera_set_keep_aspect_mode
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_keep_aspect_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The axis to lock during [member fov]/[member size] adjustments. Can be either [code]KEEP_WIDTH[/code] or [code]KEEP_HEIGHT[/code].
set_keep_aspect_mode ::
                       (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_keep_aspect_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_keep_aspect_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_keep_aspect_mode #-}

-- | The axis to lock during [member fov]/[member size] adjustments. Can be either [code]KEEP_WIDTH[/code] or [code]KEEP_HEIGHT[/code].
bindCamera_get_keep_aspect_mode :: MethodBind
bindCamera_get_keep_aspect_mode
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_keep_aspect_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The axis to lock during [member fov]/[member size] adjustments. Can be either [code]KEEP_WIDTH[/code] or [code]KEEP_HEIGHT[/code].
get_keep_aspect_mode ::
                       (Camera :< cls, Object :< cls) => cls -> IO Int
get_keep_aspect_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_keep_aspect_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_doppler_tracking #-}

-- | If not [code]DOPPLER_TRACKING_DISABLED[/code] this Camera will simulate the Doppler effect for objects changed in particular [code]_process[/code] methods. Default value: [code]DOPPLER_TRACKING_DISABLED[/code].
bindCamera_set_doppler_tracking :: MethodBind
bindCamera_set_doppler_tracking
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_doppler_tracking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If not [code]DOPPLER_TRACKING_DISABLED[/code] this Camera will simulate the Doppler effect for objects changed in particular [code]_process[/code] methods. Default value: [code]DOPPLER_TRACKING_DISABLED[/code].
set_doppler_tracking ::
                       (Camera :< cls, Object :< cls) => cls -> Int -> IO ()
set_doppler_tracking cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_doppler_tracking (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_doppler_tracking #-}

-- | If not [code]DOPPLER_TRACKING_DISABLED[/code] this Camera will simulate the Doppler effect for objects changed in particular [code]_process[/code] methods. Default value: [code]DOPPLER_TRACKING_DISABLED[/code].
bindCamera_get_doppler_tracking :: MethodBind
bindCamera_get_doppler_tracking
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_doppler_tracking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If not [code]DOPPLER_TRACKING_DISABLED[/code] this Camera will simulate the Doppler effect for objects changed in particular [code]_process[/code] methods. Default value: [code]DOPPLER_TRACKING_DISABLED[/code].
get_doppler_tracking ::
                       (Camera :< cls, Object :< cls) => cls -> IO Int
get_doppler_tracking cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_doppler_tracking (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_frustum #-}

bindCamera_get_frustum :: MethodBind
bindCamera_get_frustum
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_frustum" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_frustum :: (Camera :< cls, Object :< cls) => cls -> IO Array
get_frustum cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_frustum (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_set_cull_mask_bit #-}

bindCamera_set_cull_mask_bit :: MethodBind
bindCamera_set_cull_mask_bit
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "set_cull_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cull_mask_bit ::
                    (Camera :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
set_cull_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_set_cull_mask_bit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindCamera_get_cull_mask_bit #-}

bindCamera_get_cull_mask_bit :: MethodBind
bindCamera_get_cull_mask_bit
  = unsafePerformIO $
      withCString "Camera" $
        \ clsNamePtr ->
          withCString "get_cull_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cull_mask_bit ::
                    (Camera :< cls, Object :< cls) => cls -> Int -> IO Bool
get_cull_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCamera_get_cull_mask_bit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)