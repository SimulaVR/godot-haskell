{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Listener
       (Godot.Core.Listener.clear_current,
        Godot.Core.Listener.get_listener_transform,
        Godot.Core.Listener.is_current, Godot.Core.Listener.make_current)
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

{-# NOINLINE bindListener_clear_current #-}

-- | Disables the listener to use the current camera's listener instead.
bindListener_clear_current :: MethodBind
bindListener_clear_current
  = unsafePerformIO $
      withCString "Listener" $
        \ clsNamePtr ->
          withCString "clear_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disables the listener to use the current camera's listener instead.
clear_current :: (Listener :< cls, Object :< cls) => cls -> IO ()
clear_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener_clear_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Listener "clear_current" '[] (IO ()) where
        nodeMethod = Godot.Core.Listener.clear_current

{-# NOINLINE bindListener_get_listener_transform #-}

-- | Returns the listener's global orthonormalized @Transform@.
bindListener_get_listener_transform :: MethodBind
bindListener_get_listener_transform
  = unsafePerformIO $
      withCString "Listener" $
        \ clsNamePtr ->
          withCString "get_listener_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the listener's global orthonormalized @Transform@.
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

instance NodeMethod Listener "get_listener_transform" '[]
           (IO Transform)
         where
        nodeMethod = Godot.Core.Listener.get_listener_transform

{-# NOINLINE bindListener_is_current #-}

-- | Returns @true@ if the listener was made current using @method make_current@, @false@ otherwise.
--   				__Note:__ There may be more than one Listener marked as "current" in the scene tree, but only the one that was made current last will be used.
bindListener_is_current :: MethodBind
bindListener_is_current
  = unsafePerformIO $
      withCString "Listener" $
        \ clsNamePtr ->
          withCString "is_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the listener was made current using @method make_current@, @false@ otherwise.
--   				__Note:__ There may be more than one Listener marked as "current" in the scene tree, but only the one that was made current last will be used.
is_current :: (Listener :< cls, Object :< cls) => cls -> IO Bool
is_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener_is_current (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Listener "is_current" '[] (IO Bool) where
        nodeMethod = Godot.Core.Listener.is_current

{-# NOINLINE bindListener_make_current #-}

-- | Enables the listener. This will override the current camera's listener.
bindListener_make_current :: MethodBind
bindListener_make_current
  = unsafePerformIO $
      withCString "Listener" $
        \ clsNamePtr ->
          withCString "make_current" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables the listener. This will override the current camera's listener.
make_current :: (Listener :< cls, Object :< cls) => cls -> IO ()
make_current cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindListener_make_current (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Listener "make_current" '[] (IO ()) where
        nodeMethod = Godot.Core.Listener.make_current