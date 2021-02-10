{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Line2D
       (Godot.Core.Line2D._LINE_JOINT_ROUND,
        Godot.Core.Line2D._LINE_TEXTURE_NONE,
        Godot.Core.Line2D._LINE_CAP_ROUND,
        Godot.Core.Line2D._LINE_CAP_NONE,
        Godot.Core.Line2D._LINE_TEXTURE_TILE,
        Godot.Core.Line2D._LINE_JOINT_BEVEL,
        Godot.Core.Line2D._LINE_JOINT_SHARP,
        Godot.Core.Line2D._LINE_TEXTURE_STRETCH,
        Godot.Core.Line2D._LINE_CAP_BOX, Godot.Core.Line2D._curve_changed,
        Godot.Core.Line2D._gradient_changed, Godot.Core.Line2D.add_point,
        Godot.Core.Line2D.clear_points, Godot.Core.Line2D.get_antialiased,
        Godot.Core.Line2D.get_begin_cap_mode, Godot.Core.Line2D.get_curve,
        Godot.Core.Line2D.get_default_color,
        Godot.Core.Line2D.get_end_cap_mode, Godot.Core.Line2D.get_gradient,
        Godot.Core.Line2D.get_joint_mode,
        Godot.Core.Line2D.get_point_count,
        Godot.Core.Line2D.get_point_position, Godot.Core.Line2D.get_points,
        Godot.Core.Line2D.get_round_precision,
        Godot.Core.Line2D.get_sharp_limit, Godot.Core.Line2D.get_texture,
        Godot.Core.Line2D.get_texture_mode, Godot.Core.Line2D.get_width,
        Godot.Core.Line2D.remove_point, Godot.Core.Line2D.set_antialiased,
        Godot.Core.Line2D.set_begin_cap_mode, Godot.Core.Line2D.set_curve,
        Godot.Core.Line2D.set_default_color,
        Godot.Core.Line2D.set_end_cap_mode, Godot.Core.Line2D.set_gradient,
        Godot.Core.Line2D.set_joint_mode,
        Godot.Core.Line2D.set_point_position, Godot.Core.Line2D.set_points,
        Godot.Core.Line2D.set_round_precision,
        Godot.Core.Line2D.set_sharp_limit, Godot.Core.Line2D.set_texture,
        Godot.Core.Line2D.set_texture_mode, Godot.Core.Line2D.set_width)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_LINE_JOINT_ROUND :: Int
_LINE_JOINT_ROUND = 2

_LINE_TEXTURE_NONE :: Int
_LINE_TEXTURE_NONE = 0

_LINE_CAP_ROUND :: Int
_LINE_CAP_ROUND = 2

_LINE_CAP_NONE :: Int
_LINE_CAP_NONE = 0

_LINE_TEXTURE_TILE :: Int
_LINE_TEXTURE_TILE = 1

_LINE_JOINT_BEVEL :: Int
_LINE_JOINT_BEVEL = 1

_LINE_JOINT_SHARP :: Int
_LINE_JOINT_SHARP = 0

_LINE_TEXTURE_STRETCH :: Int
_LINE_TEXTURE_STRETCH = 2

_LINE_CAP_BOX :: Int
_LINE_CAP_BOX = 1

{-# NOINLINE bindLine2D__curve_changed #-}

bindLine2D__curve_changed :: MethodBind
bindLine2D__curve_changed
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "_curve_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_curve_changed :: (Line2D :< cls, Object :< cls) => cls -> IO ()
_curve_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D__curve_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D__gradient_changed #-}

bindLine2D__gradient_changed :: MethodBind
bindLine2D__gradient_changed
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "_gradient_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gradient_changed :: (Line2D :< cls, Object :< cls) => cls -> IO ()
_gradient_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D__gradient_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_add_point #-}

-- | Adds a point at the [code]position[/code]. Appends the point at the end of the line.
--   				If [code]at_position[/code] is given, the point is inserted before the point number [code]at_position[/code], moving that point (and every point after) after the inserted point. If [code]at_position[/code] is not given, or is an illegal value ([code]at_position < 0[/code] or [code]at_position >= [method get_point_count][/code]), the point will be appended at the end of the point list.
bindLine2D_add_point :: MethodBind
bindLine2D_add_point
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "add_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a point at the [code]position[/code]. Appends the point at the end of the line.
--   				If [code]at_position[/code] is given, the point is inserted before the point number [code]at_position[/code], moving that point (and every point after) after the inserted point. If [code]at_position[/code] is not given, or is an illegal value ([code]at_position < 0[/code] or [code]at_position >= [method get_point_count][/code]), the point will be appended at the end of the point list.
add_point ::
            (Line2D :< cls, Object :< cls) => cls -> Vector2 -> Int -> IO ()
add_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_add_point (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_clear_points #-}

-- | Removes all points from the line.
bindLine2D_clear_points :: MethodBind
bindLine2D_clear_points
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "clear_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all points from the line.
clear_points :: (Line2D :< cls, Object :< cls) => cls -> IO ()
clear_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_clear_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_antialiased #-}

-- | If [code]true[/code], the line's border will be anti-aliased.
bindLine2D_get_antialiased :: MethodBind
bindLine2D_get_antialiased
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_antialiased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the line's border will be anti-aliased.
get_antialiased :: (Line2D :< cls, Object :< cls) => cls -> IO Bool
get_antialiased cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_antialiased (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_begin_cap_mode #-}

-- | Controls the style of the line's first point. Use [enum LineCapMode] constants.
bindLine2D_get_begin_cap_mode :: MethodBind
bindLine2D_get_begin_cap_mode
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_begin_cap_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the style of the line's first point. Use [enum LineCapMode] constants.
get_begin_cap_mode ::
                     (Line2D :< cls, Object :< cls) => cls -> IO Int
get_begin_cap_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_begin_cap_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_curve #-}

-- | The line's width varies with the curve. The original width is simply multiply by the value of the Curve.
bindLine2D_get_curve :: MethodBind
bindLine2D_get_curve
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's width varies with the curve. The original width is simply multiply by the value of the Curve.
get_curve :: (Line2D :< cls, Object :< cls) => cls -> IO Curve
get_curve cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_curve (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_default_color #-}

-- | The line's color. Will not be used if a gradient is set.
bindLine2D_get_default_color :: MethodBind
bindLine2D_get_default_color
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_default_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's color. Will not be used if a gradient is set.
get_default_color ::
                    (Line2D :< cls, Object :< cls) => cls -> IO Color
get_default_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_default_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_end_cap_mode #-}

-- | Controls the style of the line's last point. Use [enum LineCapMode] constants.
bindLine2D_get_end_cap_mode :: MethodBind
bindLine2D_get_end_cap_mode
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_end_cap_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the style of the line's last point. Use [enum LineCapMode] constants.
get_end_cap_mode :: (Line2D :< cls, Object :< cls) => cls -> IO Int
get_end_cap_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_end_cap_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_gradient #-}

-- | The gradient is drawn through the whole line from start to finish. The default color will not be used if a gradient is set.
bindLine2D_get_gradient :: MethodBind
bindLine2D_get_gradient
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_gradient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The gradient is drawn through the whole line from start to finish. The default color will not be used if a gradient is set.
get_gradient ::
               (Line2D :< cls, Object :< cls) => cls -> IO Gradient
get_gradient cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_gradient (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_joint_mode #-}

-- | The style for the points between the start and the end.
bindLine2D_get_joint_mode :: MethodBind
bindLine2D_get_joint_mode
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_joint_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The style for the points between the start and the end.
get_joint_mode :: (Line2D :< cls, Object :< cls) => cls -> IO Int
get_joint_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_joint_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_point_count #-}

-- | Returns the Line2D's amount of points.
bindLine2D_get_point_count :: MethodBind
bindLine2D_get_point_count
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the Line2D's amount of points.
get_point_count :: (Line2D :< cls, Object :< cls) => cls -> IO Int
get_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_point_count (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_point_position #-}

-- | Returns point [code]i[/code]'s position.
bindLine2D_get_point_position :: MethodBind
bindLine2D_get_point_position
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns point [code]i[/code]'s position.
get_point_position ::
                     (Line2D :< cls, Object :< cls) => cls -> Int -> IO Vector2
get_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_points #-}

-- | The points that form the lines. The line is drawn between every point set in this array. Points are interpreted as local vectors.
bindLine2D_get_points :: MethodBind
bindLine2D_get_points
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The points that form the lines. The line is drawn between every point set in this array. Points are interpreted as local vectors.
get_points ::
             (Line2D :< cls, Object :< cls) => cls -> IO PoolVector2Array
get_points cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_round_precision #-}

-- | The smoothness of the rounded joints and caps. This is only used if a cap or joint is set as round.
bindLine2D_get_round_precision :: MethodBind
bindLine2D_get_round_precision
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_round_precision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The smoothness of the rounded joints and caps. This is only used if a cap or joint is set as round.
get_round_precision ::
                      (Line2D :< cls, Object :< cls) => cls -> IO Int
get_round_precision cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_round_precision (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_sharp_limit #-}

-- | The direction difference in radians between vector points. This value is only used if [code]joint mode[/code] is set to [constant LINE_JOINT_SHARP].
bindLine2D_get_sharp_limit :: MethodBind
bindLine2D_get_sharp_limit
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_sharp_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The direction difference in radians between vector points. This value is only used if [code]joint mode[/code] is set to [constant LINE_JOINT_SHARP].
get_sharp_limit ::
                  (Line2D :< cls, Object :< cls) => cls -> IO Float
get_sharp_limit cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_sharp_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_texture #-}

-- | The texture used for the line's texture. Uses [code]texture_mode[/code] for drawing style.
bindLine2D_get_texture :: MethodBind
bindLine2D_get_texture
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture used for the line's texture. Uses [code]texture_mode[/code] for drawing style.
get_texture :: (Line2D :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_texture_mode #-}

-- | The style to render the [code]texture[/code] on the line. Use [enum LineTextureMode] constants.
bindLine2D_get_texture_mode :: MethodBind
bindLine2D_get_texture_mode
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_texture_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The style to render the [code]texture[/code] on the line. Use [enum LineTextureMode] constants.
get_texture_mode :: (Line2D :< cls, Object :< cls) => cls -> IO Int
get_texture_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_texture_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_get_width #-}

-- | The line's width.
bindLine2D_get_width :: MethodBind
bindLine2D_get_width
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's width.
get_width :: (Line2D :< cls, Object :< cls) => cls -> IO Float
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_get_width (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_remove_point #-}

-- | Removes the point at index [code]i[/code] from the line.
bindLine2D_remove_point :: MethodBind
bindLine2D_remove_point
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "remove_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the point at index [code]i[/code] from the line.
remove_point ::
               (Line2D :< cls, Object :< cls) => cls -> Int -> IO ()
remove_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_remove_point (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_antialiased #-}

-- | If [code]true[/code], the line's border will be anti-aliased.
bindLine2D_set_antialiased :: MethodBind
bindLine2D_set_antialiased
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_antialiased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the line's border will be anti-aliased.
set_antialiased ::
                  (Line2D :< cls, Object :< cls) => cls -> Bool -> IO ()
set_antialiased cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_antialiased (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_begin_cap_mode #-}

-- | Controls the style of the line's first point. Use [enum LineCapMode] constants.
bindLine2D_set_begin_cap_mode :: MethodBind
bindLine2D_set_begin_cap_mode
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_begin_cap_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the style of the line's first point. Use [enum LineCapMode] constants.
set_begin_cap_mode ::
                     (Line2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_begin_cap_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_begin_cap_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_curve #-}

-- | The line's width varies with the curve. The original width is simply multiply by the value of the Curve.
bindLine2D_set_curve :: MethodBind
bindLine2D_set_curve
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_curve" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's width varies with the curve. The original width is simply multiply by the value of the Curve.
set_curve ::
            (Line2D :< cls, Object :< cls) => cls -> Curve -> IO ()
set_curve cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_curve (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_default_color #-}

-- | The line's color. Will not be used if a gradient is set.
bindLine2D_set_default_color :: MethodBind
bindLine2D_set_default_color
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_default_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's color. Will not be used if a gradient is set.
set_default_color ::
                    (Line2D :< cls, Object :< cls) => cls -> Color -> IO ()
set_default_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_default_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_end_cap_mode #-}

-- | Controls the style of the line's last point. Use [enum LineCapMode] constants.
bindLine2D_set_end_cap_mode :: MethodBind
bindLine2D_set_end_cap_mode
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_end_cap_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the style of the line's last point. Use [enum LineCapMode] constants.
set_end_cap_mode ::
                   (Line2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_end_cap_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_end_cap_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_gradient #-}

-- | The gradient is drawn through the whole line from start to finish. The default color will not be used if a gradient is set.
bindLine2D_set_gradient :: MethodBind
bindLine2D_set_gradient
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_gradient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The gradient is drawn through the whole line from start to finish. The default color will not be used if a gradient is set.
set_gradient ::
               (Line2D :< cls, Object :< cls) => cls -> Gradient -> IO ()
set_gradient cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_gradient (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_joint_mode #-}

-- | The style for the points between the start and the end.
bindLine2D_set_joint_mode :: MethodBind
bindLine2D_set_joint_mode
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_joint_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The style for the points between the start and the end.
set_joint_mode ::
                 (Line2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_joint_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_joint_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_point_position #-}

-- | Overwrites the position in point [code]i[/code] with the supplied [code]position[/code].
bindLine2D_set_point_position :: MethodBind
bindLine2D_set_point_position
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Overwrites the position in point [code]i[/code] with the supplied [code]position[/code].
set_point_position ::
                     (Line2D :< cls, Object :< cls) => cls -> Int -> Vector2 -> IO ()
set_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_point_position (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_points #-}

-- | The points that form the lines. The line is drawn between every point set in this array. Points are interpreted as local vectors.
bindLine2D_set_points :: MethodBind
bindLine2D_set_points
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_points" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The points that form the lines. The line is drawn between every point set in this array. Points are interpreted as local vectors.
set_points ::
             (Line2D :< cls, Object :< cls) => cls -> PoolVector2Array -> IO ()
set_points cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_points (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_round_precision #-}

-- | The smoothness of the rounded joints and caps. This is only used if a cap or joint is set as round.
bindLine2D_set_round_precision :: MethodBind
bindLine2D_set_round_precision
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_round_precision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The smoothness of the rounded joints and caps. This is only used if a cap or joint is set as round.
set_round_precision ::
                      (Line2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_round_precision cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_round_precision (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_sharp_limit #-}

-- | The direction difference in radians between vector points. This value is only used if [code]joint mode[/code] is set to [constant LINE_JOINT_SHARP].
bindLine2D_set_sharp_limit :: MethodBind
bindLine2D_set_sharp_limit
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_sharp_limit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The direction difference in radians between vector points. This value is only used if [code]joint mode[/code] is set to [constant LINE_JOINT_SHARP].
set_sharp_limit ::
                  (Line2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_sharp_limit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_sharp_limit (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_texture #-}

-- | The texture used for the line's texture. Uses [code]texture_mode[/code] for drawing style.
bindLine2D_set_texture :: MethodBind
bindLine2D_set_texture
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The texture used for the line's texture. Uses [code]texture_mode[/code] for drawing style.
set_texture ::
              (Line2D :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_texture (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_texture_mode #-}

-- | The style to render the [code]texture[/code] on the line. Use [enum LineTextureMode] constants.
bindLine2D_set_texture_mode :: MethodBind
bindLine2D_set_texture_mode
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_texture_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The style to render the [code]texture[/code] on the line. Use [enum LineTextureMode] constants.
set_texture_mode ::
                   (Line2D :< cls, Object :< cls) => cls -> Int -> IO ()
set_texture_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_texture_mode (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindLine2D_set_width #-}

-- | The line's width.
bindLine2D_set_width :: MethodBind
bindLine2D_set_width
  = unsafePerformIO $
      withCString "Line2D" $
        \ clsNamePtr ->
          withCString "set_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line's width.
set_width ::
            (Line2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindLine2D_set_width (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)