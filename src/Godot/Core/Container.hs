{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Container
       (Godot.Core.Container._NOTIFICATION_SORT_CHILDREN,
        Godot.Core.Container.sig_sort_children,
        Godot.Core.Container._sort_children,
        Godot.Core.Container._child_minsize_changed,
        Godot.Core.Container.queue_sort,
        Godot.Core.Container.fit_child_in_rect)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_NOTIFICATION_SORT_CHILDREN :: Int
_NOTIFICATION_SORT_CHILDREN = 50

-- | Emitted when sorting the children is needed.
sig_sort_children :: Godot.Internal.Dispatch.Signal Container
sig_sort_children = Godot.Internal.Dispatch.Signal "sort_children"

{-# NOINLINE bindContainer__sort_children #-}

bindContainer__sort_children :: MethodBind
bindContainer__sort_children
  = unsafePerformIO $
      withCString "Container" $
        \ clsNamePtr ->
          withCString "_sort_children" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_sort_children :: (Container :< cls, Object :< cls) => cls -> IO ()
_sort_children cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindContainer__sort_children (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindContainer__child_minsize_changed #-}

bindContainer__child_minsize_changed :: MethodBind
bindContainer__child_minsize_changed
  = unsafePerformIO $
      withCString "Container" $
        \ clsNamePtr ->
          withCString "_child_minsize_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_child_minsize_changed ::
                         (Container :< cls, Object :< cls) => cls -> IO ()
_child_minsize_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindContainer__child_minsize_changed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindContainer_queue_sort #-}

-- | Queue resort of the contained children. This is called automatically anyway, but can be called upon request.
bindContainer_queue_sort :: MethodBind
bindContainer_queue_sort
  = unsafePerformIO $
      withCString "Container" $
        \ clsNamePtr ->
          withCString "queue_sort" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Queue resort of the contained children. This is called automatically anyway, but can be called upon request.
queue_sort :: (Container :< cls, Object :< cls) => cls -> IO ()
queue_sort cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindContainer_queue_sort (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindContainer_fit_child_in_rect #-}

-- | Fit a child control in a given rect. This is mainly a helper for creating custom container classes.
bindContainer_fit_child_in_rect :: MethodBind
bindContainer_fit_child_in_rect
  = unsafePerformIO $
      withCString "Container" $
        \ clsNamePtr ->
          withCString "fit_child_in_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Fit a child control in a given rect. This is mainly a helper for creating custom container classes.
fit_child_in_rect ::
                    (Container :< cls, Object :< cls) =>
                    cls -> Control -> Rect2 -> IO ()
fit_child_in_rect cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindContainer_fit_child_in_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)