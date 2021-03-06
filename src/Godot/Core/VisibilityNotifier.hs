{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisibilityNotifier
       (Godot.Core.VisibilityNotifier.sig_camera_entered,
        Godot.Core.VisibilityNotifier.sig_camera_exited,
        Godot.Core.VisibilityNotifier.sig_screen_entered,
        Godot.Core.VisibilityNotifier.sig_screen_exited,
        Godot.Core.VisibilityNotifier.get_aabb,
        Godot.Core.VisibilityNotifier.is_on_screen,
        Godot.Core.VisibilityNotifier.set_aabb)
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

-- | Emitted when the VisibilityNotifier enters a @Camera@'s view.
sig_camera_entered ::
                   Godot.Internal.Dispatch.Signal VisibilityNotifier
sig_camera_entered
  = Godot.Internal.Dispatch.Signal "camera_entered"

instance NodeSignal VisibilityNotifier "camera_entered" '[Camera]

-- | Emitted when the VisibilityNotifier exits a @Camera@'s view.
sig_camera_exited ::
                  Godot.Internal.Dispatch.Signal VisibilityNotifier
sig_camera_exited = Godot.Internal.Dispatch.Signal "camera_exited"

instance NodeSignal VisibilityNotifier "camera_exited" '[Camera]

-- | Emitted when the VisibilityNotifier enters the screen.
sig_screen_entered ::
                   Godot.Internal.Dispatch.Signal VisibilityNotifier
sig_screen_entered
  = Godot.Internal.Dispatch.Signal "screen_entered"

instance NodeSignal VisibilityNotifier "screen_entered" '[]

-- | Emitted when the VisibilityNotifier exits the screen.
sig_screen_exited ::
                  Godot.Internal.Dispatch.Signal VisibilityNotifier
sig_screen_exited = Godot.Internal.Dispatch.Signal "screen_exited"

instance NodeSignal VisibilityNotifier "screen_exited" '[]

instance NodeProperty VisibilityNotifier "aabb" Aabb 'False where
        nodeProperty = (get_aabb, wrapDroppingSetter set_aabb, Nothing)

{-# NOINLINE bindVisibilityNotifier_get_aabb #-}

-- | The VisibilityNotifier's bounding box.
bindVisibilityNotifier_get_aabb :: MethodBind
bindVisibilityNotifier_get_aabb
  = unsafePerformIO $
      withCString "VisibilityNotifier" $
        \ clsNamePtr ->
          withCString "get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The VisibilityNotifier's bounding box.
get_aabb ::
           (VisibilityNotifier :< cls, Object :< cls) => cls -> IO Aabb
get_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier_get_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier "get_aabb" '[] (IO Aabb)
         where
        nodeMethod = Godot.Core.VisibilityNotifier.get_aabb

{-# NOINLINE bindVisibilityNotifier_is_on_screen #-}

-- | If @true@, the bounding box is on the screen.
--   				__Note:__ It takes one frame for the node's visibility to be assessed once added to the scene tree, so this method will return @false@ right after it is instantiated, even if it will be on screen in the draw pass.
bindVisibilityNotifier_is_on_screen :: MethodBind
bindVisibilityNotifier_is_on_screen
  = unsafePerformIO $
      withCString "VisibilityNotifier" $
        \ clsNamePtr ->
          withCString "is_on_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the bounding box is on the screen.
--   				__Note:__ It takes one frame for the node's visibility to be assessed once added to the scene tree, so this method will return @false@ right after it is instantiated, even if it will be on screen in the draw pass.
is_on_screen ::
               (VisibilityNotifier :< cls, Object :< cls) => cls -> IO Bool
is_on_screen cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier_is_on_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier "is_on_screen" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.VisibilityNotifier.is_on_screen

{-# NOINLINE bindVisibilityNotifier_set_aabb #-}

-- | The VisibilityNotifier's bounding box.
bindVisibilityNotifier_set_aabb :: MethodBind
bindVisibilityNotifier_set_aabb
  = unsafePerformIO $
      withCString "VisibilityNotifier" $
        \ clsNamePtr ->
          withCString "set_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The VisibilityNotifier's bounding box.
set_aabb ::
           (VisibilityNotifier :< cls, Object :< cls) => cls -> Aabb -> IO ()
set_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisibilityNotifier_set_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisibilityNotifier "set_aabb" '[Aabb] (IO ())
         where
        nodeMethod = Godot.Core.VisibilityNotifier.set_aabb