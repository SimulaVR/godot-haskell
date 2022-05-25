{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNodeBlendSpace2D
       (Godot.Core.AnimationNodeBlendSpace2D._BLEND_MODE_DISCRETE,
        Godot.Core.AnimationNodeBlendSpace2D._BLEND_MODE_INTERPOLATED,
        Godot.Core.AnimationNodeBlendSpace2D._BLEND_MODE_DISCRETE_CARRY,
        Godot.Core.AnimationNodeBlendSpace2D.sig_triangles_updated,
        Godot.Core.AnimationNodeBlendSpace2D._add_blend_point,
        Godot.Core.AnimationNodeBlendSpace2D._get_triangles,
        Godot.Core.AnimationNodeBlendSpace2D._set_triangles,
        Godot.Core.AnimationNodeBlendSpace2D._tree_changed,
        Godot.Core.AnimationNodeBlendSpace2D._update_triangles,
        Godot.Core.AnimationNodeBlendSpace2D.add_blend_point,
        Godot.Core.AnimationNodeBlendSpace2D.add_triangle,
        Godot.Core.AnimationNodeBlendSpace2D.get_auto_triangles,
        Godot.Core.AnimationNodeBlendSpace2D.get_blend_mode,
        Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_count,
        Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_node,
        Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_position,
        Godot.Core.AnimationNodeBlendSpace2D.get_max_space,
        Godot.Core.AnimationNodeBlendSpace2D.get_min_space,
        Godot.Core.AnimationNodeBlendSpace2D.get_snap,
        Godot.Core.AnimationNodeBlendSpace2D.get_triangle_count,
        Godot.Core.AnimationNodeBlendSpace2D.get_triangle_point,
        Godot.Core.AnimationNodeBlendSpace2D.get_x_label,
        Godot.Core.AnimationNodeBlendSpace2D.get_y_label,
        Godot.Core.AnimationNodeBlendSpace2D.remove_blend_point,
        Godot.Core.AnimationNodeBlendSpace2D.remove_triangle,
        Godot.Core.AnimationNodeBlendSpace2D.set_auto_triangles,
        Godot.Core.AnimationNodeBlendSpace2D.set_blend_mode,
        Godot.Core.AnimationNodeBlendSpace2D.set_blend_point_node,
        Godot.Core.AnimationNodeBlendSpace2D.set_blend_point_position,
        Godot.Core.AnimationNodeBlendSpace2D.set_max_space,
        Godot.Core.AnimationNodeBlendSpace2D.set_min_space,
        Godot.Core.AnimationNodeBlendSpace2D.set_snap,
        Godot.Core.AnimationNodeBlendSpace2D.set_x_label,
        Godot.Core.AnimationNodeBlendSpace2D.set_y_label)
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
import Godot.Core.AnimationRootNode()

_BLEND_MODE_DISCRETE :: Int
_BLEND_MODE_DISCRETE = 1

_BLEND_MODE_INTERPOLATED :: Int
_BLEND_MODE_INTERPOLATED = 0

_BLEND_MODE_DISCRETE_CARRY :: Int
_BLEND_MODE_DISCRETE_CARRY = 2

-- | Emitted every time the blend space's triangles are created, removed, or when one of their vertices changes position.
sig_triangles_updated ::
                      Godot.Internal.Dispatch.Signal AnimationNodeBlendSpace2D
sig_triangles_updated
  = Godot.Internal.Dispatch.Signal "triangles_updated"

instance NodeSignal AnimationNodeBlendSpace2D "triangles_updated"
           '[]

instance NodeProperty AnimationNodeBlendSpace2D "auto_triangles"
           Bool
           'False
         where
        nodeProperty
          = (get_auto_triangles, wrapDroppingSetter set_auto_triangles,
             Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_mode" Int
           'False
         where
        nodeProperty
          = (get_blend_mode, wrapDroppingSetter set_blend_mode, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_0/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_blend_point_node,
             wrapIndexedSetter 0 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_0/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_blend_point_position,
             wrapIndexedSetter 0 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_1/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_blend_point_node,
             wrapIndexedSetter 1 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_1/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_blend_point_position,
             wrapIndexedSetter 1 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_10/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_blend_point_node,
             wrapIndexedSetter 10 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_10/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_blend_point_position,
             wrapIndexedSetter 10 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_11/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_blend_point_node,
             wrapIndexedSetter 11 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_11/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_blend_point_position,
             wrapIndexedSetter 11 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_12/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_blend_point_node,
             wrapIndexedSetter 12 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_12/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_blend_point_position,
             wrapIndexedSetter 12 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_13/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_blend_point_node,
             wrapIndexedSetter 13 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_13/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_blend_point_position,
             wrapIndexedSetter 13 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_14/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_blend_point_node,
             wrapIndexedSetter 14 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_14/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_blend_point_position,
             wrapIndexedSetter 14 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_15/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_blend_point_node,
             wrapIndexedSetter 15 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_15/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_blend_point_position,
             wrapIndexedSetter 15 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_16/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_blend_point_node,
             wrapIndexedSetter 16 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_16/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_blend_point_position,
             wrapIndexedSetter 16 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_17/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_blend_point_node,
             wrapIndexedSetter 17 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_17/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_blend_point_position,
             wrapIndexedSetter 17 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_18/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_blend_point_node,
             wrapIndexedSetter 18 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_18/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_blend_point_position,
             wrapIndexedSetter 18 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_19/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 get_blend_point_node,
             wrapIndexedSetter 19 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_19/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 get_blend_point_position,
             wrapIndexedSetter 19 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_2/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_blend_point_node,
             wrapIndexedSetter 2 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_2/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_blend_point_position,
             wrapIndexedSetter 2 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_20/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 get_blend_point_node,
             wrapIndexedSetter 20 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_20/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 get_blend_point_position,
             wrapIndexedSetter 20 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_21/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 get_blend_point_node,
             wrapIndexedSetter 21 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_21/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 get_blend_point_position,
             wrapIndexedSetter 21 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_22/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 22 get_blend_point_node,
             wrapIndexedSetter 22 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_22/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 22 get_blend_point_position,
             wrapIndexedSetter 22 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_23/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 23 get_blend_point_node,
             wrapIndexedSetter 23 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_23/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 23 get_blend_point_position,
             wrapIndexedSetter 23 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_24/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 24 get_blend_point_node,
             wrapIndexedSetter 24 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_24/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 24 get_blend_point_position,
             wrapIndexedSetter 24 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_25/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 25 get_blend_point_node,
             wrapIndexedSetter 25 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_25/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 25 get_blend_point_position,
             wrapIndexedSetter 25 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_26/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 26 get_blend_point_node,
             wrapIndexedSetter 26 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_26/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 26 get_blend_point_position,
             wrapIndexedSetter 26 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_27/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 27 get_blend_point_node,
             wrapIndexedSetter 27 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_27/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 27 get_blend_point_position,
             wrapIndexedSetter 27 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_28/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 28 get_blend_point_node,
             wrapIndexedSetter 28 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_28/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 28 get_blend_point_position,
             wrapIndexedSetter 28 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_29/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 29 get_blend_point_node,
             wrapIndexedSetter 29 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_29/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 29 get_blend_point_position,
             wrapIndexedSetter 29 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_3/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_blend_point_node,
             wrapIndexedSetter 3 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_3/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_blend_point_position,
             wrapIndexedSetter 3 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_30/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 30 get_blend_point_node,
             wrapIndexedSetter 30 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_30/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 30 get_blend_point_position,
             wrapIndexedSetter 30 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_31/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 31 get_blend_point_node,
             wrapIndexedSetter 31 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_31/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 31 get_blend_point_position,
             wrapIndexedSetter 31 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_32/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 32 get_blend_point_node,
             wrapIndexedSetter 32 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_32/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 32 get_blend_point_position,
             wrapIndexedSetter 32 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_33/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 33 get_blend_point_node,
             wrapIndexedSetter 33 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_33/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 33 get_blend_point_position,
             wrapIndexedSetter 33 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_34/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 34 get_blend_point_node,
             wrapIndexedSetter 34 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_34/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 34 get_blend_point_position,
             wrapIndexedSetter 34 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_35/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 35 get_blend_point_node,
             wrapIndexedSetter 35 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_35/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 35 get_blend_point_position,
             wrapIndexedSetter 35 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_36/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 36 get_blend_point_node,
             wrapIndexedSetter 36 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_36/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 36 get_blend_point_position,
             wrapIndexedSetter 36 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_37/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 37 get_blend_point_node,
             wrapIndexedSetter 37 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_37/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 37 get_blend_point_position,
             wrapIndexedSetter 37 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_38/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 38 get_blend_point_node,
             wrapIndexedSetter 38 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_38/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 38 get_blend_point_position,
             wrapIndexedSetter 38 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_39/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 39 get_blend_point_node,
             wrapIndexedSetter 39 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_39/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 39 get_blend_point_position,
             wrapIndexedSetter 39 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_4/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_blend_point_node,
             wrapIndexedSetter 4 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_4/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_blend_point_position,
             wrapIndexedSetter 4 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_40/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 40 get_blend_point_node,
             wrapIndexedSetter 40 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_40/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 40 get_blend_point_position,
             wrapIndexedSetter 40 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_41/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 41 get_blend_point_node,
             wrapIndexedSetter 41 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_41/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 41 get_blend_point_position,
             wrapIndexedSetter 41 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_42/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 42 get_blend_point_node,
             wrapIndexedSetter 42 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_42/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 42 get_blend_point_position,
             wrapIndexedSetter 42 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_43/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 43 get_blend_point_node,
             wrapIndexedSetter 43 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_43/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 43 get_blend_point_position,
             wrapIndexedSetter 43 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_44/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 44 get_blend_point_node,
             wrapIndexedSetter 44 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_44/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 44 get_blend_point_position,
             wrapIndexedSetter 44 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_45/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 45 get_blend_point_node,
             wrapIndexedSetter 45 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_45/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 45 get_blend_point_position,
             wrapIndexedSetter 45 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_46/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 46 get_blend_point_node,
             wrapIndexedSetter 46 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_46/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 46 get_blend_point_position,
             wrapIndexedSetter 46 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_47/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 47 get_blend_point_node,
             wrapIndexedSetter 47 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_47/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 47 get_blend_point_position,
             wrapIndexedSetter 47 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_48/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 48 get_blend_point_node,
             wrapIndexedSetter 48 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_48/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 48 get_blend_point_position,
             wrapIndexedSetter 48 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_49/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 49 get_blend_point_node,
             wrapIndexedSetter 49 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_49/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 49 get_blend_point_position,
             wrapIndexedSetter 49 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_5/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_blend_point_node,
             wrapIndexedSetter 5 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_5/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_blend_point_position,
             wrapIndexedSetter 5 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_50/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 50 get_blend_point_node,
             wrapIndexedSetter 50 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_50/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 50 get_blend_point_position,
             wrapIndexedSetter 50 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_51/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 51 get_blend_point_node,
             wrapIndexedSetter 51 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_51/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 51 get_blend_point_position,
             wrapIndexedSetter 51 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_52/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 52 get_blend_point_node,
             wrapIndexedSetter 52 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_52/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 52 get_blend_point_position,
             wrapIndexedSetter 52 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_53/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 53 get_blend_point_node,
             wrapIndexedSetter 53 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_53/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 53 get_blend_point_position,
             wrapIndexedSetter 53 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_54/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 54 get_blend_point_node,
             wrapIndexedSetter 54 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_54/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 54 get_blend_point_position,
             wrapIndexedSetter 54 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_55/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 55 get_blend_point_node,
             wrapIndexedSetter 55 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_55/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 55 get_blend_point_position,
             wrapIndexedSetter 55 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_56/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 56 get_blend_point_node,
             wrapIndexedSetter 56 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_56/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 56 get_blend_point_position,
             wrapIndexedSetter 56 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_57/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 57 get_blend_point_node,
             wrapIndexedSetter 57 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_57/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 57 get_blend_point_position,
             wrapIndexedSetter 57 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_58/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 58 get_blend_point_node,
             wrapIndexedSetter 58 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_58/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 58 get_blend_point_position,
             wrapIndexedSetter 58 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_59/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 59 get_blend_point_node,
             wrapIndexedSetter 59 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_59/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 59 get_blend_point_position,
             wrapIndexedSetter 59 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_6/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_blend_point_node,
             wrapIndexedSetter 6 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_6/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_blend_point_position,
             wrapIndexedSetter 6 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_60/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 60 get_blend_point_node,
             wrapIndexedSetter 60 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_60/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 60 get_blend_point_position,
             wrapIndexedSetter 60 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_61/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 61 get_blend_point_node,
             wrapIndexedSetter 61 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_61/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 61 get_blend_point_position,
             wrapIndexedSetter 61 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_62/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 62 get_blend_point_node,
             wrapIndexedSetter 62 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_62/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 62 get_blend_point_position,
             wrapIndexedSetter 62 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_63/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 63 get_blend_point_node,
             wrapIndexedSetter 63 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_63/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 63 get_blend_point_position,
             wrapIndexedSetter 63 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_7/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_blend_point_node,
             wrapIndexedSetter 7 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_7/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_blend_point_position,
             wrapIndexedSetter 7 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_8/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_blend_point_node,
             wrapIndexedSetter 8 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_8/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_blend_point_position,
             wrapIndexedSetter 8 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D
           "blend_point_9/node"
           AnimationRootNode
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_blend_point_node,
             wrapIndexedSetter 9 _add_blend_point, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "blend_point_9/pos"
           Vector2
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_blend_point_position,
             wrapIndexedSetter 9 set_blend_point_position, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "max_space" Vector2
           'False
         where
        nodeProperty
          = (get_max_space, wrapDroppingSetter set_max_space, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "min_space" Vector2
           'False
         where
        nodeProperty
          = (get_min_space, wrapDroppingSetter set_min_space, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "snap" Vector2
           'False
         where
        nodeProperty = (get_snap, wrapDroppingSetter set_snap, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "triangles"
           PoolIntArray
           'False
         where
        nodeProperty
          = (_get_triangles, wrapDroppingSetter _set_triangles, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "x_label"
           GodotString
           'False
         where
        nodeProperty
          = (get_x_label, wrapDroppingSetter set_x_label, Nothing)

instance NodeProperty AnimationNodeBlendSpace2D "y_label"
           GodotString
           'False
         where
        nodeProperty
          = (get_y_label, wrapDroppingSetter set_y_label, Nothing)

{-# NOINLINE bindAnimationNodeBlendSpace2D__add_blend_point #-}

bindAnimationNodeBlendSpace2D__add_blend_point :: MethodBind
bindAnimationNodeBlendSpace2D__add_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_add_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_add_blend_point ::
                   (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                   cls -> Int -> AnimationRootNode -> IO ()
_add_blend_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D__add_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "_add_blend_point"
           '[Int, AnimationRootNode]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D._add_blend_point

{-# NOINLINE bindAnimationNodeBlendSpace2D__get_triangles #-}

bindAnimationNodeBlendSpace2D__get_triangles :: MethodBind
bindAnimationNodeBlendSpace2D__get_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_get_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_triangles ::
                 (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                 cls -> IO PoolIntArray
_get_triangles cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D__get_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "_get_triangles" '[]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D._get_triangles

{-# NOINLINE bindAnimationNodeBlendSpace2D__set_triangles #-}

bindAnimationNodeBlendSpace2D__set_triangles :: MethodBind
bindAnimationNodeBlendSpace2D__set_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_set_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_triangles ::
                 (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                 cls -> PoolIntArray -> IO ()
_set_triangles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D__set_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "_set_triangles"
           '[PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D._set_triangles

{-# NOINLINE bindAnimationNodeBlendSpace2D__tree_changed #-}

bindAnimationNodeBlendSpace2D__tree_changed :: MethodBind
bindAnimationNodeBlendSpace2D__tree_changed
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_tree_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_tree_changed ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO ()
_tree_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D__tree_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "_tree_changed" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D._tree_changed

{-# NOINLINE bindAnimationNodeBlendSpace2D__update_triangles #-}

bindAnimationNodeBlendSpace2D__update_triangles :: MethodBind
bindAnimationNodeBlendSpace2D__update_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "_update_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_triangles ::
                    (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO ()
_update_triangles cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D__update_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "_update_triangles"
           '[]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D._update_triangles

{-# NOINLINE bindAnimationNodeBlendSpace2D_add_blend_point #-}

-- | Adds a new point that represents a @node@ at the position set by @pos@. You can insert it at a specific index using the @at_index@ argument. If you use the default value for @at_index@, the point is inserted at the end of the blend points array.
bindAnimationNodeBlendSpace2D_add_blend_point :: MethodBind
bindAnimationNodeBlendSpace2D_add_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "add_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a new point that represents a @node@ at the position set by @pos@. You can insert it at a specific index using the @at_index@ argument. If you use the default value for @at_index@, the point is inserted at the end of the blend points array.
add_blend_point ::
                  (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                  cls -> AnimationRootNode -> Vector2 -> Maybe Int -> IO ()
add_blend_point cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (-1)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_add_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "add_blend_point"
           '[AnimationRootNode, Vector2, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.add_blend_point

{-# NOINLINE bindAnimationNodeBlendSpace2D_add_triangle #-}

-- | Creates a new triangle using three points @x@, @y@, and @z@. Triangles can overlap. You can insert the triangle at a specific index using the @at_index@ argument. If you use the default value for @at_index@, the point is inserted at the end of the blend points array.
bindAnimationNodeBlendSpace2D_add_triangle :: MethodBind
bindAnimationNodeBlendSpace2D_add_triangle
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "add_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new triangle using three points @x@, @y@, and @z@. Triangles can overlap. You can insert the triangle at a specific index using the @at_index@ argument. If you use the default value for @at_index@, the point is inserted at the end of the blend points array.
add_triangle ::
               (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
               cls -> Int -> Int -> Int -> Maybe Int -> IO ()
add_triangle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantInt (-1)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_add_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "add_triangle"
           '[Int, Int, Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.add_triangle

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_auto_triangles #-}

-- | If @true@, the blend space is triangulated automatically. The mesh updates every time you add or remove points with @method add_blend_point@ and @method remove_blend_point@.
bindAnimationNodeBlendSpace2D_get_auto_triangles :: MethodBind
bindAnimationNodeBlendSpace2D_get_auto_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_auto_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the blend space is triangulated automatically. The mesh updates every time you add or remove points with @method add_blend_point@ and @method remove_blend_point@.
get_auto_triangles ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO Bool
get_auto_triangles cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_auto_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_auto_triangles"
           '[]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.get_auto_triangles

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_blend_mode #-}

-- | Controls the interpolation between animations. See @enum BlendMode@ constants.
bindAnimationNodeBlendSpace2D_get_blend_mode :: MethodBind
bindAnimationNodeBlendSpace2D_get_blend_mode
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the interpolation between animations. See @enum BlendMode@ constants.
get_blend_mode ::
                 (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO Int
get_blend_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_blend_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.get_blend_mode

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_blend_point_count
             #-}

-- | Returns the number of points in the blend space.
bindAnimationNodeBlendSpace2D_get_blend_point_count :: MethodBind
bindAnimationNodeBlendSpace2D_get_blend_point_count
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_blend_point_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of points in the blend space.
get_blend_point_count ::
                        (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO Int
get_blend_point_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_blend_point_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D
           "get_blend_point_count"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_count

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_blend_point_node #-}

-- | Returns the @AnimationRootNode@ referenced by the point at index @point@.
bindAnimationNodeBlendSpace2D_get_blend_point_node :: MethodBind
bindAnimationNodeBlendSpace2D_get_blend_point_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_blend_point_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @AnimationRootNode@ referenced by the point at index @point@.
get_blend_point_node ::
                       (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                       cls -> Int -> IO AnimationRootNode
get_blend_point_node cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_blend_point_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D
           "get_blend_point_node"
           '[Int]
           (IO AnimationRootNode)
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_node

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_blend_point_position
             #-}

-- | Returns the position of the point at index @point@.
bindAnimationNodeBlendSpace2D_get_blend_point_position ::
                                                       MethodBind
bindAnimationNodeBlendSpace2D_get_blend_point_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_blend_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the point at index @point@.
get_blend_point_position ::
                           (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                           cls -> Int -> IO Vector2
get_blend_point_position cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_blend_point_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D
           "get_blend_point_position"
           '[Int]
           (IO Vector2)
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.get_blend_point_position

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_max_space #-}

-- | The blend space's X and Y axes' upper limit for the points' position. See @method add_blend_point@.
bindAnimationNodeBlendSpace2D_get_max_space :: MethodBind
bindAnimationNodeBlendSpace2D_get_max_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_max_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The blend space's X and Y axes' upper limit for the points' position. See @method add_blend_point@.
get_max_space ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                cls -> IO Vector2
get_max_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_max_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_max_space" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.get_max_space

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_min_space #-}

-- | The blend space's X and Y axes' lower limit for the points' position. See @method add_blend_point@.
bindAnimationNodeBlendSpace2D_get_min_space :: MethodBind
bindAnimationNodeBlendSpace2D_get_min_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_min_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The blend space's X and Y axes' lower limit for the points' position. See @method add_blend_point@.
get_min_space ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                cls -> IO Vector2
get_min_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_min_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_min_space" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.get_min_space

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_snap #-}

-- | Position increment to snap to when moving a point.
bindAnimationNodeBlendSpace2D_get_snap :: MethodBind
bindAnimationNodeBlendSpace2D_get_snap
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Position increment to snap to when moving a point.
get_snap ::
           (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
           cls -> IO Vector2
get_snap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_snap" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.get_snap

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_triangle_count #-}

-- | Returns the number of triangles in the blend space.
bindAnimationNodeBlendSpace2D_get_triangle_count :: MethodBind
bindAnimationNodeBlendSpace2D_get_triangle_count
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_triangle_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of triangles in the blend space.
get_triangle_count ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) => cls -> IO Int
get_triangle_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_triangle_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_triangle_count"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.get_triangle_count

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_triangle_point #-}

-- | Returns the position of the point at index @point@ in the triangle of index @triangle@.
bindAnimationNodeBlendSpace2D_get_triangle_point :: MethodBind
bindAnimationNodeBlendSpace2D_get_triangle_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_triangle_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the position of the point at index @point@ in the triangle of index @triangle@.
get_triangle_point ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                     cls -> Int -> Int -> IO Int
get_triangle_point cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_get_triangle_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_triangle_point"
           '[Int, Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.get_triangle_point

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_x_label #-}

-- | Name of the blend space's X axis.
bindAnimationNodeBlendSpace2D_get_x_label :: MethodBind
bindAnimationNodeBlendSpace2D_get_x_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_x_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the blend space's X axis.
get_x_label ::
              (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
              cls -> IO GodotString
get_x_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_x_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_x_label" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.get_x_label

{-# NOINLINE bindAnimationNodeBlendSpace2D_get_y_label #-}

-- | Name of the blend space's Y axis.
bindAnimationNodeBlendSpace2D_get_y_label :: MethodBind
bindAnimationNodeBlendSpace2D_get_y_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "get_y_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the blend space's Y axis.
get_y_label ::
              (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
              cls -> IO GodotString
get_y_label cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_get_y_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "get_y_label" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.get_y_label

{-# NOINLINE bindAnimationNodeBlendSpace2D_remove_blend_point #-}

-- | Removes the point at index @point@ from the blend space.
bindAnimationNodeBlendSpace2D_remove_blend_point :: MethodBind
bindAnimationNodeBlendSpace2D_remove_blend_point
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "remove_blend_point" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the point at index @point@ from the blend space.
remove_blend_point ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                     cls -> Int -> IO ()
remove_blend_point cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_remove_blend_point
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "remove_blend_point"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.remove_blend_point

{-# NOINLINE bindAnimationNodeBlendSpace2D_remove_triangle #-}

-- | Removes the triangle at index @triangle@ from the blend space.
bindAnimationNodeBlendSpace2D_remove_triangle :: MethodBind
bindAnimationNodeBlendSpace2D_remove_triangle
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "remove_triangle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the triangle at index @triangle@ from the blend space.
remove_triangle ::
                  (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                  cls -> Int -> IO ()
remove_triangle cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_remove_triangle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "remove_triangle"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.remove_triangle

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_auto_triangles #-}

-- | If @true@, the blend space is triangulated automatically. The mesh updates every time you add or remove points with @method add_blend_point@ and @method remove_blend_point@.
bindAnimationNodeBlendSpace2D_set_auto_triangles :: MethodBind
bindAnimationNodeBlendSpace2D_set_auto_triangles
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_auto_triangles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the blend space is triangulated automatically. The mesh updates every time you add or remove points with @method add_blend_point@ and @method remove_blend_point@.
set_auto_triangles ::
                     (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                     cls -> Bool -> IO ()
set_auto_triangles cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_set_auto_triangles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "set_auto_triangles"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.set_auto_triangles

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_blend_mode #-}

-- | Controls the interpolation between animations. See @enum BlendMode@ constants.
bindAnimationNodeBlendSpace2D_set_blend_mode :: MethodBind
bindAnimationNodeBlendSpace2D_set_blend_mode
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_blend_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls the interpolation between animations. See @enum BlendMode@ constants.
set_blend_mode ::
                 (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                 cls -> Int -> IO ()
set_blend_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_blend_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "set_blend_mode"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.set_blend_mode

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_blend_point_node #-}

-- | Changes the @AnimationNode@ referenced by the point at index @point@.
bindAnimationNodeBlendSpace2D_set_blend_point_node :: MethodBind
bindAnimationNodeBlendSpace2D_set_blend_point_node
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_blend_point_node" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Changes the @AnimationNode@ referenced by the point at index @point@.
set_blend_point_node ::
                       (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                       cls -> Int -> AnimationRootNode -> IO ()
set_blend_point_node cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_set_blend_point_node
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D
           "set_blend_point_node"
           '[Int, AnimationRootNode]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.set_blend_point_node

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_blend_point_position
             #-}

-- | Updates the position of the point at index @point@ on the blend axis.
bindAnimationNodeBlendSpace2D_set_blend_point_position ::
                                                       MethodBind
bindAnimationNodeBlendSpace2D_set_blend_point_position
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_blend_point_position" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates the position of the point at index @point@ on the blend axis.
set_blend_point_position ::
                           (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                           cls -> Int -> Vector2 -> IO ()
set_blend_point_position cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeBlendSpace2D_set_blend_point_position
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D
           "set_blend_point_position"
           '[Int, Vector2]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeBlendSpace2D.set_blend_point_position

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_max_space #-}

-- | The blend space's X and Y axes' upper limit for the points' position. See @method add_blend_point@.
bindAnimationNodeBlendSpace2D_set_max_space :: MethodBind
bindAnimationNodeBlendSpace2D_set_max_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_max_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The blend space's X and Y axes' upper limit for the points' position. See @method add_blend_point@.
set_max_space ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                cls -> Vector2 -> IO ()
set_max_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_max_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "set_max_space"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.set_max_space

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_min_space #-}

-- | The blend space's X and Y axes' lower limit for the points' position. See @method add_blend_point@.
bindAnimationNodeBlendSpace2D_set_min_space :: MethodBind
bindAnimationNodeBlendSpace2D_set_min_space
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_min_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The blend space's X and Y axes' lower limit for the points' position. See @method add_blend_point@.
set_min_space ::
                (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
                cls -> Vector2 -> IO ()
set_min_space cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_min_space
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "set_min_space"
           '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.set_min_space

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_snap #-}

-- | Position increment to snap to when moving a point.
bindAnimationNodeBlendSpace2D_set_snap :: MethodBind
bindAnimationNodeBlendSpace2D_set_snap
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_snap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Position increment to snap to when moving a point.
set_snap ::
           (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
           cls -> Vector2 -> IO ()
set_snap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_snap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "set_snap" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.set_snap

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_x_label #-}

-- | Name of the blend space's X axis.
bindAnimationNodeBlendSpace2D_set_x_label :: MethodBind
bindAnimationNodeBlendSpace2D_set_x_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_x_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the blend space's X axis.
set_x_label ::
              (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
set_x_label cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_x_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "set_x_label"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.set_x_label

{-# NOINLINE bindAnimationNodeBlendSpace2D_set_y_label #-}

-- | Name of the blend space's Y axis.
bindAnimationNodeBlendSpace2D_set_y_label :: MethodBind
bindAnimationNodeBlendSpace2D_set_y_label
  = unsafePerformIO $
      withCString "AnimationNodeBlendSpace2D" $
        \ clsNamePtr ->
          withCString "set_y_label" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Name of the blend space's Y axis.
set_y_label ::
              (AnimationNodeBlendSpace2D :< cls, Object :< cls) =>
              cls -> GodotString -> IO ()
set_y_label cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlendSpace2D_set_y_label
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlendSpace2D "set_y_label"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlendSpace2D.set_y_label