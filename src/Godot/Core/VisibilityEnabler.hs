{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisibilityEnabler
       (Godot.Core.VisibilityEnabler._ENABLER_MAX,
        Godot.Core.VisibilityEnabler._ENABLER_FREEZE_BODIES,
        Godot.Core.VisibilityEnabler._ENABLER_PAUSE_ANIMATIONS,
        Godot.Core.VisibilityEnabler._node_removed,
        Godot.Core.VisibilityEnabler.is_enabler_enabled,
        Godot.Core.VisibilityEnabler.set_enabler)
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
import Godot.Core.VisibilityNotifier()

_ENABLER_MAX :: Int
_ENABLER_MAX = 2

_ENABLER_FREEZE_BODIES :: Int
_ENABLER_FREEZE_BODIES = 1

_ENABLER_PAUSE_ANIMATIONS :: Int
_ENABLER_PAUSE_ANIMATIONS = 0

instance NodeProperty VisibilityEnabler "freeze_bodies" Bool 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 is_enabler_enabled,
             wrapIndexedSetter 1 set_enabler, Nothing)

instance NodeProperty VisibilityEnabler "pause_animations" Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 is_enabler_enabled,
             wrapIndexedSetter 0 set_enabler, Nothing)

{-# NOINLINE bindVisibilityEnabler__node_removed #-}

bindVisibilityEnabler__node_removed :: MethodBind
bindVisibilityEnabler__node_removed
  = unsafePerformIO $
      withCString "VisibilityEnabler" $
        \ clsNamePtr ->
          withCString "_node_removed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_node_removed ::
                (VisibilityEnabler :< cls, Object :< cls) => cls -> Node -> IO ()
_node_removed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler__node_removed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityEnabler "_node_removed" '[Node]
           (IO ())
         where
        nodeMethod = Godot.Core.VisibilityEnabler._node_removed

{-# NOINLINE bindVisibilityEnabler_is_enabler_enabled #-}

-- | Returns whether the enabler identified by given @enum Enabler@ constant is active.
bindVisibilityEnabler_is_enabler_enabled :: MethodBind
bindVisibilityEnabler_is_enabler_enabled
  = unsafePerformIO $
      withCString "VisibilityEnabler" $
        \ clsNamePtr ->
          withCString "is_enabler_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the enabler identified by given @enum Enabler@ constant is active.
is_enabler_enabled ::
                     (VisibilityEnabler :< cls, Object :< cls) => cls -> Int -> IO Bool
is_enabler_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler_is_enabler_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityEnabler "is_enabler_enabled" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisibilityEnabler.is_enabler_enabled

{-# NOINLINE bindVisibilityEnabler_set_enabler #-}

-- | Sets active state of the enabler identified by given @enum Enabler@ constant.
bindVisibilityEnabler_set_enabler :: MethodBind
bindVisibilityEnabler_set_enabler
  = unsafePerformIO $
      withCString "VisibilityEnabler" $
        \ clsNamePtr ->
          withCString "set_enabler" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets active state of the enabler identified by given @enum Enabler@ constant.
set_enabler ::
              (VisibilityEnabler :< cls, Object :< cls) =>
              cls -> Int -> Bool -> IO ()
set_enabler cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityEnabler_set_enabler
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityEnabler "set_enabler" '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisibilityEnabler.set_enabler