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
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindWorld2D_get_canvas #-}

-- | The [RID] of this world's canvas resource. Used by the [VisualServer] for 2D drawing.
bindWorld2D_get_canvas :: MethodBind
bindWorld2D_get_canvas
  = unsafePerformIO $
      withCString "World2D" $
        \ clsNamePtr ->
          withCString "get_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [RID] of this world's canvas resource. Used by the [VisualServer] for 2D drawing.
get_canvas :: (World2D :< cls, Object :< cls) => cls -> IO Rid
get_canvas cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld2D_get_canvas (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWorld2D_get_direct_space_state #-}

-- | Direct access to the world's physics 2D space state. Used for querying current and potential collisions. Must only be accessed from the main thread within [code]_physics_process(delta)[/code].
bindWorld2D_get_direct_space_state :: MethodBind
bindWorld2D_get_direct_space_state
  = unsafePerformIO $
      withCString "World2D" $
        \ clsNamePtr ->
          withCString "get_direct_space_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Direct access to the world's physics 2D space state. Used for querying current and potential collisions. Must only be accessed from the main thread within [code]_physics_process(delta)[/code].
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

{-# NOINLINE bindWorld2D_get_space #-}

-- | The [RID] of this world's physics space resource. Used by the [Physics2DServer] for 2D physics, treating it as both a space and an area.
bindWorld2D_get_space :: MethodBind
bindWorld2D_get_space
  = unsafePerformIO $
      withCString "World2D" $
        \ clsNamePtr ->
          withCString "get_space" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [RID] of this world's physics space resource. Used by the [Physics2DServer] for 2D physics, treating it as both a space and an area.
get_space :: (World2D :< cls, Object :< cls) => cls -> IO Rid
get_space cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorld2D_get_space (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)