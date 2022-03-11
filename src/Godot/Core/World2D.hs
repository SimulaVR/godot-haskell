{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.World2D
       (Godot.Core.World2D.get_canvas,
        Godot.Core.World2D.get_direct_space_state,
        Godot.Core.World2D.get_space)
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
import Godot.Core.Resource()

instance NodeProperty World2D "canvas" Rid 'True where
        nodeProperty = (get_canvas, (), Nothing)

instance NodeProperty World2D "direct_space_state"
           Physics2DDirectSpaceState
           'True
         where
        nodeProperty = (get_direct_space_state, (), Nothing)

instance NodeProperty World2D "space" Rid 'True where
        nodeProperty = (get_space, (), Nothing)

{-# NOINLINE bindWorld2D_get_canvas #-}

-- | The @RID@ of this world's canvas resource. Used by the @VisualServer@ for 2D drawing.
bindWorld2D_get_canvas :: MethodBind
bindWorld2D_get_canvas
  = unsafePerformIO $
      withCString "World2D" $
        \ clsNamePtr ->
          withCString "get_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @RID@ of this world's canvas resource. Used by the @VisualServer@ for 2D drawing.
get_canvas :: (World2D :< cls, Object :< cls) => cls -> IO Rid
get_canvas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld2D_get_canvas (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod World2D "get_canvas" '[] (IO Rid) where
        nodeMethod = Godot.Core.World2D.get_canvas

{-# NOINLINE bindWorld2D_get_direct_space_state #-}

-- | Direct access to the world's physics 2D space state. Used for querying current and potential collisions. When using multi-threaded physics, access is limited to @_physics_process(delta)@ in the main thread.
bindWorld2D_get_direct_space_state :: MethodBind
bindWorld2D_get_direct_space_state
  = unsafePerformIO $
      withCString "World2D" $
        \ clsNamePtr ->
          withCString "get_direct_space_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Direct access to the world's physics 2D space state. Used for querying current and potential collisions. When using multi-threaded physics, access is limited to @_physics_process(delta)@ in the main thread.
get_direct_space_state ::
                         (World2D :< cls, Object :< cls) =>
                         cls -> IO Physics2DDirectSpaceState
get_direct_space_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld2D_get_direct_space_state
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod World2D "get_direct_space_state" '[]
           (IO Physics2DDirectSpaceState)
         where
        nodeMethod = Godot.Core.World2D.get_direct_space_state

{-# NOINLINE bindWorld2D_get_space #-}

-- | The @RID@ of this world's physics space resource. Used by the @Physics2DServer@ for 2D physics, treating it as both a space and an area.
bindWorld2D_get_space :: MethodBind
bindWorld2D_get_space
  = unsafePerformIO $
      withCString "World2D" $
        \ clsNamePtr ->
          withCString "get_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @RID@ of this world's physics space resource. Used by the @Physics2DServer@ for 2D physics, treating it as both a space and an area.
get_space :: (World2D :< cls, Object :< cls) => cls -> IO Rid
get_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld2D_get_space (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod World2D "get_space" '[] (IO Rid) where
        nodeMethod = Godot.Core.World2D.get_space