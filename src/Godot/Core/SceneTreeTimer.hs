{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SceneTreeTimer
       (Godot.Core.SceneTreeTimer.sig_timeout,
        Godot.Core.SceneTreeTimer.get_time_left,
        Godot.Core.SceneTreeTimer.set_time_left)
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
import Godot.Core.Reference()

-- | Emitted when the timer reaches 0.
sig_timeout :: Godot.Internal.Dispatch.Signal SceneTreeTimer
sig_timeout = Godot.Internal.Dispatch.Signal "timeout"

instance NodeSignal SceneTreeTimer "timeout" '[]

instance NodeProperty SceneTreeTimer "time_left" Float 'False where
        nodeProperty
          = (get_time_left, wrapDroppingSetter set_time_left, Nothing)

{-# NOINLINE bindSceneTreeTimer_get_time_left #-}

-- | The time remaining.
bindSceneTreeTimer_get_time_left :: MethodBind
bindSceneTreeTimer_get_time_left
  = unsafePerformIO $
      withCString "SceneTreeTimer" $
        \ clsNamePtr ->
          withCString "get_time_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time remaining.
get_time_left ::
                (SceneTreeTimer :< cls, Object :< cls) => cls -> IO Float
get_time_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTimer_get_time_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTreeTimer "get_time_left" '[] (IO Float)
         where
        nodeMethod = Godot.Core.SceneTreeTimer.get_time_left

{-# NOINLINE bindSceneTreeTimer_set_time_left #-}

-- | The time remaining.
bindSceneTreeTimer_set_time_left :: MethodBind
bindSceneTreeTimer_set_time_left
  = unsafePerformIO $
      withCString "SceneTreeTimer" $
        \ clsNamePtr ->
          withCString "set_time_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The time remaining.
set_time_left ::
                (SceneTreeTimer :< cls, Object :< cls) => cls -> Float -> IO ()
set_time_left cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSceneTreeTimer_set_time_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SceneTreeTimer "set_time_left" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.SceneTreeTimer.set_time_left