{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SplitContainer
       (Godot.Core.SplitContainer._DRAGGER_HIDDEN,
        Godot.Core.SplitContainer._DRAGGER_HIDDEN_COLLAPSED,
        Godot.Core.SplitContainer._DRAGGER_VISIBLE,
        Godot.Core.SplitContainer.sig_dragged,
        Godot.Core.SplitContainer._gui_input,
        Godot.Core.SplitContainer.clamp_split_offset,
        Godot.Core.SplitContainer.get_dragger_visibility,
        Godot.Core.SplitContainer.get_split_offset,
        Godot.Core.SplitContainer.is_collapsed,
        Godot.Core.SplitContainer.set_collapsed,
        Godot.Core.SplitContainer.set_dragger_visibility,
        Godot.Core.SplitContainer.set_split_offset)
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
import Godot.Core.Container()

_DRAGGER_HIDDEN :: Int
_DRAGGER_HIDDEN = 1

_DRAGGER_HIDDEN_COLLAPSED :: Int
_DRAGGER_HIDDEN_COLLAPSED = 2

_DRAGGER_VISIBLE :: Int
_DRAGGER_VISIBLE = 0

-- | Emitted when the dragger is dragged by user.
sig_dragged :: Godot.Internal.Dispatch.Signal SplitContainer
sig_dragged = Godot.Internal.Dispatch.Signal "dragged"

instance NodeSignal SplitContainer "dragged" '[Int]

instance NodeProperty SplitContainer "collapsed" Bool 'False where
        nodeProperty
          = (is_collapsed, wrapDroppingSetter set_collapsed, Nothing)

instance NodeProperty SplitContainer "dragger_visibility" Int
           'False
         where
        nodeProperty
          = (get_dragger_visibility,
             wrapDroppingSetter set_dragger_visibility, Nothing)

instance NodeProperty SplitContainer "split_offset" Int 'False
         where
        nodeProperty
          = (get_split_offset, wrapDroppingSetter set_split_offset, Nothing)

{-# NOINLINE bindSplitContainer__gui_input #-}

bindSplitContainer__gui_input :: MethodBind
bindSplitContainer__gui_input
  = unsafePerformIO $
      withCString "SplitContainer" $
        \ clsNamePtr ->
          withCString "_gui_input" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_gui_input ::
             (SplitContainer :< cls, Object :< cls) =>
             cls -> InputEvent -> IO ()
_gui_input cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSplitContainer__gui_input (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SplitContainer "_gui_input" '[InputEvent]
           (IO ())
         where
        nodeMethod = Godot.Core.SplitContainer._gui_input

{-# NOINLINE bindSplitContainer_clamp_split_offset #-}

-- | Clamps the @split_offset@ value to not go outside the currently possible minimal and maximum values.
bindSplitContainer_clamp_split_offset :: MethodBind
bindSplitContainer_clamp_split_offset
  = unsafePerformIO $
      withCString "SplitContainer" $
        \ clsNamePtr ->
          withCString "clamp_split_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clamps the @split_offset@ value to not go outside the currently possible minimal and maximum values.
clamp_split_offset ::
                     (SplitContainer :< cls, Object :< cls) => cls -> IO ()
clamp_split_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSplitContainer_clamp_split_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SplitContainer "clamp_split_offset" '[] (IO ())
         where
        nodeMethod = Godot.Core.SplitContainer.clamp_split_offset

{-# NOINLINE bindSplitContainer_get_dragger_visibility #-}

-- | Determines the dragger's visibility. See @enum DraggerVisibility@ for details.
bindSplitContainer_get_dragger_visibility :: MethodBind
bindSplitContainer_get_dragger_visibility
  = unsafePerformIO $
      withCString "SplitContainer" $
        \ clsNamePtr ->
          withCString "get_dragger_visibility" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the dragger's visibility. See @enum DraggerVisibility@ for details.
get_dragger_visibility ::
                         (SplitContainer :< cls, Object :< cls) => cls -> IO Int
get_dragger_visibility cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSplitContainer_get_dragger_visibility
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SplitContainer "get_dragger_visibility" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.SplitContainer.get_dragger_visibility

{-# NOINLINE bindSplitContainer_get_split_offset #-}

-- | The initial offset of the splitting between the two @Control@s, with @0@ being at the end of the first @Control@.
bindSplitContainer_get_split_offset :: MethodBind
bindSplitContainer_get_split_offset
  = unsafePerformIO $
      withCString "SplitContainer" $
        \ clsNamePtr ->
          withCString "get_split_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The initial offset of the splitting between the two @Control@s, with @0@ being at the end of the first @Control@.
get_split_offset ::
                   (SplitContainer :< cls, Object :< cls) => cls -> IO Int
get_split_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSplitContainer_get_split_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SplitContainer "get_split_offset" '[] (IO Int)
         where
        nodeMethod = Godot.Core.SplitContainer.get_split_offset

{-# NOINLINE bindSplitContainer_is_collapsed #-}

-- | If @true@, the area of the first @Control@ will be collapsed and the dragger will be disabled.
bindSplitContainer_is_collapsed :: MethodBind
bindSplitContainer_is_collapsed
  = unsafePerformIO $
      withCString "SplitContainer" $
        \ clsNamePtr ->
          withCString "is_collapsed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area of the first @Control@ will be collapsed and the dragger will be disabled.
is_collapsed ::
               (SplitContainer :< cls, Object :< cls) => cls -> IO Bool
is_collapsed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSplitContainer_is_collapsed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SplitContainer "is_collapsed" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.SplitContainer.is_collapsed

{-# NOINLINE bindSplitContainer_set_collapsed #-}

-- | If @true@, the area of the first @Control@ will be collapsed and the dragger will be disabled.
bindSplitContainer_set_collapsed :: MethodBind
bindSplitContainer_set_collapsed
  = unsafePerformIO $
      withCString "SplitContainer" $
        \ clsNamePtr ->
          withCString "set_collapsed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the area of the first @Control@ will be collapsed and the dragger will be disabled.
set_collapsed ::
                (SplitContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_collapsed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSplitContainer_set_collapsed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SplitContainer "set_collapsed" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.SplitContainer.set_collapsed

{-# NOINLINE bindSplitContainer_set_dragger_visibility #-}

-- | Determines the dragger's visibility. See @enum DraggerVisibility@ for details.
bindSplitContainer_set_dragger_visibility :: MethodBind
bindSplitContainer_set_dragger_visibility
  = unsafePerformIO $
      withCString "SplitContainer" $
        \ clsNamePtr ->
          withCString "set_dragger_visibility" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Determines the dragger's visibility. See @enum DraggerVisibility@ for details.
set_dragger_visibility ::
                         (SplitContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_dragger_visibility cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSplitContainer_set_dragger_visibility
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SplitContainer "set_dragger_visibility" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SplitContainer.set_dragger_visibility

{-# NOINLINE bindSplitContainer_set_split_offset #-}

-- | The initial offset of the splitting between the two @Control@s, with @0@ being at the end of the first @Control@.
bindSplitContainer_set_split_offset :: MethodBind
bindSplitContainer_set_split_offset
  = unsafePerformIO $
      withCString "SplitContainer" $
        \ clsNamePtr ->
          withCString "set_split_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The initial offset of the splitting between the two @Control@s, with @0@ being at the end of the first @Control@.
set_split_offset ::
                   (SplitContainer :< cls, Object :< cls) => cls -> Int -> IO ()
set_split_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSplitContainer_set_split_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SplitContainer "set_split_offset" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.SplitContainer.set_split_offset