{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisibilityEnabler2D
       (Godot.Core.VisibilityEnabler2D._ENABLER_PARENT_PHYSICS_PROCESS,
        Godot.Core.VisibilityEnabler2D._ENABLER_PAUSE_PARTICLES,
        Godot.Core.VisibilityEnabler2D._ENABLER_MAX,
        Godot.Core.VisibilityEnabler2D._ENABLER_FREEZE_BODIES,
        Godot.Core.VisibilityEnabler2D._ENABLER_PAUSE_ANIMATED_SPRITES,
        Godot.Core.VisibilityEnabler2D._ENABLER_PAUSE_ANIMATIONS,
        Godot.Core.VisibilityEnabler2D._ENABLER_PARENT_PROCESS,
        Godot.Core.VisibilityEnabler2D._node_removed,
        Godot.Core.VisibilityEnabler2D.is_enabler_enabled,
        Godot.Core.VisibilityEnabler2D.set_enabler)
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
import Godot.Core.VisibilityNotifier2D()

_ENABLER_PARENT_PHYSICS_PROCESS :: Int
_ENABLER_PARENT_PHYSICS_PROCESS = 4

_ENABLER_PAUSE_PARTICLES :: Int
_ENABLER_PAUSE_PARTICLES = 2

_ENABLER_MAX :: Int
_ENABLER_MAX = 6

_ENABLER_FREEZE_BODIES :: Int
_ENABLER_FREEZE_BODIES = 1

_ENABLER_PAUSE_ANIMATED_SPRITES :: Int
_ENABLER_PAUSE_ANIMATED_SPRITES = 5

_ENABLER_PAUSE_ANIMATIONS :: Int
_ENABLER_PAUSE_ANIMATIONS = 0

_ENABLER_PARENT_PROCESS :: Int
_ENABLER_PARENT_PROCESS = 3

instance NodeProperty VisibilityEnabler2D "freeze_bodies" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 is_enabler_enabled,
             wrapIndexedSetter 1 set_enabler, Nothing)

instance NodeProperty VisibilityEnabler2D "pause_animated_sprites"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 is_enabler_enabled,
             wrapIndexedSetter 5 set_enabler, Nothing)

instance NodeProperty VisibilityEnabler2D "pause_animations" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 is_enabler_enabled,
             wrapIndexedSetter 0 set_enabler, Nothing)

instance NodeProperty VisibilityEnabler2D "pause_particles" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 is_enabler_enabled,
             wrapIndexedSetter 2 set_enabler, Nothing)

instance NodeProperty VisibilityEnabler2D "physics_process_parent"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 is_enabler_enabled,
             wrapIndexedSetter 4 set_enabler, Nothing)

instance NodeProperty VisibilityEnabler2D "process_parent" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 is_enabler_enabled,
             wrapIndexedSetter 3 set_enabler, Nothing)

{-# NOINLINE bindVisibilityEnabler2D__node_removed #-}

bindVisibilityEnabler2D__node_removed :: MethodBind
bindVisibilityEnabler2D__node_removed
  = unsafePerformIO $
      withCString "VisibilityEnabler2D" $
        \ clsNamePtr ->
          withCString "_node_removed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_removed ::
                (VisibilityEnabler2D :< cls, Object :< cls) => cls -> Node -> IO ()
_node_removed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler2D__node_removed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityEnabler2D "_node_removed" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.VisibilityEnabler2D._node_removed

{-# NOINLINE bindVisibilityEnabler2D_is_enabler_enabled #-}

-- | Returns whether the enabler identified by given @enum Enabler@ constant is active.
bindVisibilityEnabler2D_is_enabler_enabled :: MethodBind
bindVisibilityEnabler2D_is_enabler_enabled
  = unsafePerformIO $
      withCString "VisibilityEnabler2D" $
        \ clsNamePtr ->
          withCString "is_enabler_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the enabler identified by given @enum Enabler@ constant is active.
is_enabler_enabled ::
                     (VisibilityEnabler2D :< cls, Object :< cls) =>
                     cls -> Int -> IO Bool
is_enabler_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler2D_is_enabler_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityEnabler2D "is_enabler_enabled" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisibilityEnabler2D.is_enabler_enabled

{-# NOINLINE bindVisibilityEnabler2D_set_enabler #-}

-- | Sets active state of the enabler identified by given @enum Enabler@ constant.
bindVisibilityEnabler2D_set_enabler :: MethodBind
bindVisibilityEnabler2D_set_enabler
  = unsafePerformIO $
      withCString "VisibilityEnabler2D" $
        \ clsNamePtr ->
          withCString "set_enabler" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets active state of the enabler identified by given @enum Enabler@ constant.
set_enabler ::
              (VisibilityEnabler2D :< cls, Object :< cls) =>
              cls -> Int -> Bool -> IO ()
set_enabler cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler2D_set_enabler
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityEnabler2D "set_enabler" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisibilityEnabler2D.set_enabler