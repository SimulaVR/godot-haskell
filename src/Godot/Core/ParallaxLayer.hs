{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ParallaxLayer
       (Godot.Core.ParallaxLayer.get_mirroring,
        Godot.Core.ParallaxLayer.get_motion_offset,
        Godot.Core.ParallaxLayer.get_motion_scale,
        Godot.Core.ParallaxLayer.set_mirroring,
        Godot.Core.ParallaxLayer.set_motion_offset,
        Godot.Core.ParallaxLayer.set_motion_scale)
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
import Godot.Core.Node2D()

instance NodeProperty ParallaxLayer "motion_mirroring" Vector2
           'False
         where
        nodeProperty
          = (get_mirroring, wrapDroppingSetter set_mirroring, Nothing)

instance NodeProperty ParallaxLayer "motion_offset" Vector2 'False
         where
        nodeProperty
          = (get_motion_offset, wrapDroppingSetter set_motion_offset,
             Nothing)

instance NodeProperty ParallaxLayer "motion_scale" Vector2 'False
         where
        nodeProperty
          = (get_motion_scale, wrapDroppingSetter set_motion_scale, Nothing)

{-# NOINLINE bindParallaxLayer_get_mirroring #-}

-- | The ParallaxLayer's @Texture@ mirroring. Useful for creating an infinite scrolling background. If an axis is set to @0@, the @Texture@ will not be mirrored.
bindParallaxLayer_get_mirroring :: MethodBind
bindParallaxLayer_get_mirroring
  = unsafePerformIO $
      withCString "ParallaxLayer" $
        \ clsNamePtr ->
          withCString "get_mirroring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ParallaxLayer's @Texture@ mirroring. Useful for creating an infinite scrolling background. If an axis is set to @0@, the @Texture@ will not be mirrored.
get_mirroring ::
                (ParallaxLayer :< cls, Object :< cls) => cls -> IO Vector2
get_mirroring cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxLayer_get_mirroring (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParallaxLayer "get_mirroring" '[] (IO Vector2)
         where
        nodeMethod = Godot.Core.ParallaxLayer.get_mirroring

{-# NOINLINE bindParallaxLayer_get_motion_offset #-}

-- | The ParallaxLayer's offset relative to the parent ParallaxBackground's @ParallaxBackground.scroll_offset@.
bindParallaxLayer_get_motion_offset :: MethodBind
bindParallaxLayer_get_motion_offset
  = unsafePerformIO $
      withCString "ParallaxLayer" $
        \ clsNamePtr ->
          withCString "get_motion_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ParallaxLayer's offset relative to the parent ParallaxBackground's @ParallaxBackground.scroll_offset@.
get_motion_offset ::
                    (ParallaxLayer :< cls, Object :< cls) => cls -> IO Vector2
get_motion_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxLayer_get_motion_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParallaxLayer "get_motion_offset" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ParallaxLayer.get_motion_offset

{-# NOINLINE bindParallaxLayer_get_motion_scale #-}

-- | Multiplies the ParallaxLayer's motion. If an axis is set to @0@, it will not scroll.
bindParallaxLayer_get_motion_scale :: MethodBind
bindParallaxLayer_get_motion_scale
  = unsafePerformIO $
      withCString "ParallaxLayer" $
        \ clsNamePtr ->
          withCString "get_motion_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the ParallaxLayer's motion. If an axis is set to @0@, it will not scroll.
get_motion_scale ::
                   (ParallaxLayer :< cls, Object :< cls) => cls -> IO Vector2
get_motion_scale cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxLayer_get_motion_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParallaxLayer "get_motion_scale" '[]
           (IO Vector2)
         where
        nodeMethod = Godot.Core.ParallaxLayer.get_motion_scale

{-# NOINLINE bindParallaxLayer_set_mirroring #-}

-- | The ParallaxLayer's @Texture@ mirroring. Useful for creating an infinite scrolling background. If an axis is set to @0@, the @Texture@ will not be mirrored.
bindParallaxLayer_set_mirroring :: MethodBind
bindParallaxLayer_set_mirroring
  = unsafePerformIO $
      withCString "ParallaxLayer" $
        \ clsNamePtr ->
          withCString "set_mirroring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ParallaxLayer's @Texture@ mirroring. Useful for creating an infinite scrolling background. If an axis is set to @0@, the @Texture@ will not be mirrored.
set_mirroring ::
                (ParallaxLayer :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_mirroring cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxLayer_set_mirroring (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParallaxLayer "set_mirroring" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxLayer.set_mirroring

{-# NOINLINE bindParallaxLayer_set_motion_offset #-}

-- | The ParallaxLayer's offset relative to the parent ParallaxBackground's @ParallaxBackground.scroll_offset@.
bindParallaxLayer_set_motion_offset :: MethodBind
bindParallaxLayer_set_motion_offset
  = unsafePerformIO $
      withCString "ParallaxLayer" $
        \ clsNamePtr ->
          withCString "set_motion_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ParallaxLayer's offset relative to the parent ParallaxBackground's @ParallaxBackground.scroll_offset@.
set_motion_offset ::
                    (ParallaxLayer :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_motion_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxLayer_set_motion_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParallaxLayer "set_motion_offset" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxLayer.set_motion_offset

{-# NOINLINE bindParallaxLayer_set_motion_scale #-}

-- | Multiplies the ParallaxLayer's motion. If an axis is set to @0@, it will not scroll.
bindParallaxLayer_set_motion_scale :: MethodBind
bindParallaxLayer_set_motion_scale
  = unsafePerformIO $
      withCString "ParallaxLayer" $
        \ clsNamePtr ->
          withCString "set_motion_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Multiplies the ParallaxLayer's motion. If an axis is set to @0@, it will not scroll.
set_motion_scale ::
                   (ParallaxLayer :< cls, Object :< cls) => cls -> Vector2 -> IO ()
set_motion_scale cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindParallaxLayer_set_motion_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ParallaxLayer "set_motion_scale" '[Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.ParallaxLayer.set_motion_scale