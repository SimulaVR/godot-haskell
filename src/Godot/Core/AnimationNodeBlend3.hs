{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNodeBlend3
       (Godot.Core.AnimationNodeBlend3.is_using_sync,
        Godot.Core.AnimationNodeBlend3.set_use_sync)
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
import Godot.Core.AnimationNode()

instance NodeProperty AnimationNodeBlend3 "sync" Bool 'False where
        nodeProperty
          = (is_using_sync, wrapDroppingSetter set_use_sync, Nothing)

{-# NOINLINE bindAnimationNodeBlend3_is_using_sync #-}

-- | If @true@, sets the @optimization@ to @false@ when calling @method AnimationNode.blend_input@, forcing the blended animations to update every frame.
bindAnimationNodeBlend3_is_using_sync :: MethodBind
bindAnimationNodeBlend3_is_using_sync
  = unsafePerformIO $
      withCString "AnimationNodeBlend3" $
        \ clsNamePtr ->
          withCString "is_using_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, sets the @optimization@ to @false@ when calling @method AnimationNode.blend_input@, forcing the blended animations to update every frame.
is_using_sync ::
                (AnimationNodeBlend3 :< cls, Object :< cls) => cls -> IO Bool
is_using_sync cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlend3_is_using_sync
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlend3 "is_using_sync" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.AnimationNodeBlend3.is_using_sync

{-# NOINLINE bindAnimationNodeBlend3_set_use_sync #-}

-- | If @true@, sets the @optimization@ to @false@ when calling @method AnimationNode.blend_input@, forcing the blended animations to update every frame.
bindAnimationNodeBlend3_set_use_sync :: MethodBind
bindAnimationNodeBlend3_set_use_sync
  = unsafePerformIO $
      withCString "AnimationNodeBlend3" $
        \ clsNamePtr ->
          withCString "set_use_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, sets the @optimization@ to @false@ when calling @method AnimationNode.blend_input@, forcing the blended animations to update every frame.
set_use_sync ::
               (AnimationNodeBlend3 :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_sync cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimationNodeBlend3_set_use_sync
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeBlend3 "set_use_sync" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeBlend3.set_use_sync