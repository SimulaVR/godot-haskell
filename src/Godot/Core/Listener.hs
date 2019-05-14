{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Listener
       (Godot.Core.Listener.make_current,
        Godot.Core.Listener.clear_current, Godot.Core.Listener.is_current,
        Godot.Core.Listener.get_listener_transform)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindListener_make_current #-}

bindListener_make_current :: MethodBind
bindListener_make_current
  = unsafePerformIO $
      withCString "Listener" $
        \ clsNamePtr ->
          withCString "make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

make_current :: (Listener :< cls, Object :< cls) => cls -> IO ()
make_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener_make_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindListener_clear_current #-}

bindListener_clear_current :: MethodBind
bindListener_clear_current
  = unsafePerformIO $
      withCString "Listener" $
        \ clsNamePtr ->
          withCString "clear_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_current :: (Listener :< cls, Object :< cls) => cls -> IO ()
clear_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener_clear_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindListener_is_current #-}

bindListener_is_current :: MethodBind
bindListener_is_current
  = unsafePerformIO $
      withCString "Listener" $
        \ clsNamePtr ->
          withCString "is_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_current :: (Listener :< cls, Object :< cls) => cls -> IO Bool
is_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener_is_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindListener_get_listener_transform #-}

bindListener_get_listener_transform :: MethodBind
bindListener_get_listener_transform
  = unsafePerformIO $
      withCString "Listener" $
        \ clsNamePtr ->
          withCString "get_listener_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_listener_transform ::
                         (Listener :< cls, Object :< cls) => cls -> IO Transform
get_listener_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener_get_listener_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)