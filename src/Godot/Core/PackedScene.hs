{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PackedScene
       (Godot.Core.PackedScene._GEN_EDIT_STATE_DISABLED,
        Godot.Core.PackedScene._GEN_EDIT_STATE_MAIN,
        Godot.Core.PackedScene._GEN_EDIT_STATE_INSTANCE,
        Godot.Core.PackedScene._get_bundled_scene,
        Godot.Core.PackedScene._set_bundled_scene,
        Godot.Core.PackedScene.can_instance,
        Godot.Core.PackedScene.get_state, Godot.Core.PackedScene.instance',
        Godot.Core.PackedScene.pack)
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

_GEN_EDIT_STATE_DISABLED :: Int
_GEN_EDIT_STATE_DISABLED = 0

_GEN_EDIT_STATE_MAIN :: Int
_GEN_EDIT_STATE_MAIN = 2

_GEN_EDIT_STATE_INSTANCE :: Int
_GEN_EDIT_STATE_INSTANCE = 1

instance NodeProperty PackedScene "_bundled" Dictionary 'False
         where
        nodeProperty
          = (_get_bundled_scene, wrapDroppingSetter _set_bundled_scene,
             Nothing)

{-# NOINLINE bindPackedScene__get_bundled_scene #-}

-- | A dictionary representation of the scene contents.
--   			Available keys include "rnames" and "variants" for resources, "node_count", "nodes", "node_paths" for nodes, "editable_instances" for base scene children overrides, "conn_count" and "conns" for signal connections, and "version" for the format style of the PackedScene.
bindPackedScene__get_bundled_scene :: MethodBind
bindPackedScene__get_bundled_scene
  = unsafePerformIO $
      withCString "PackedScene" $
        \ clsNamePtr ->
          withCString "_get_bundled_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A dictionary representation of the scene contents.
--   			Available keys include "rnames" and "variants" for resources, "node_count", "nodes", "node_paths" for nodes, "editable_instances" for base scene children overrides, "conn_count" and "conns" for signal connections, and "version" for the format style of the PackedScene.
_get_bundled_scene ::
                     (PackedScene :< cls, Object :< cls) => cls -> IO Dictionary
_get_bundled_scene cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedScene__get_bundled_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PackedScene "_get_bundled_scene" '[]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.PackedScene._get_bundled_scene

{-# NOINLINE bindPackedScene__set_bundled_scene #-}

-- | A dictionary representation of the scene contents.
--   			Available keys include "rnames" and "variants" for resources, "node_count", "nodes", "node_paths" for nodes, "editable_instances" for base scene children overrides, "conn_count" and "conns" for signal connections, and "version" for the format style of the PackedScene.
bindPackedScene__set_bundled_scene :: MethodBind
bindPackedScene__set_bundled_scene
  = unsafePerformIO $
      withCString "PackedScene" $
        \ clsNamePtr ->
          withCString "_set_bundled_scene" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A dictionary representation of the scene contents.
--   			Available keys include "rnames" and "variants" for resources, "node_count", "nodes", "node_paths" for nodes, "editable_instances" for base scene children overrides, "conn_count" and "conns" for signal connections, and "version" for the format style of the PackedScene.
_set_bundled_scene ::
                     (PackedScene :< cls, Object :< cls) => cls -> Dictionary -> IO ()
_set_bundled_scene cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedScene__set_bundled_scene
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PackedScene "_set_bundled_scene" '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.PackedScene._set_bundled_scene

{-# NOINLINE bindPackedScene_can_instance #-}

-- | Returns @true@ if the scene file has nodes.
bindPackedScene_can_instance :: MethodBind
bindPackedScene_can_instance
  = unsafePerformIO $
      withCString "PackedScene" $
        \ clsNamePtr ->
          withCString "can_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the scene file has nodes.
can_instance ::
               (PackedScene :< cls, Object :< cls) => cls -> IO Bool
can_instance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedScene_can_instance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PackedScene "can_instance" '[] (IO Bool) where
        nodeMethod = Godot.Core.PackedScene.can_instance

{-# NOINLINE bindPackedScene_get_state #-}

-- | Returns the @SceneState@ representing the scene file contents.
bindPackedScene_get_state :: MethodBind
bindPackedScene_get_state
  = unsafePerformIO $
      withCString "PackedScene" $
        \ clsNamePtr ->
          withCString "get_state" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @SceneState@ representing the scene file contents.
get_state ::
            (PackedScene :< cls, Object :< cls) => cls -> IO SceneState
get_state cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedScene_get_state (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PackedScene "get_state" '[] (IO SceneState)
         where
        nodeMethod = Godot.Core.PackedScene.get_state

{-# NOINLINE bindPackedScene_instance' #-}

-- | Instantiates the scene's node hierarchy. Triggers child scene instantiation(s). Triggers a @Node.NOTIFICATION_INSTANCED@ notification on the root node.
bindPackedScene_instance' :: MethodBind
bindPackedScene_instance'
  = unsafePerformIO $
      withCString "PackedScene" $
        \ clsNamePtr ->
          withCString "instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Instantiates the scene's node hierarchy. Triggers child scene instantiation(s). Triggers a @Node.NOTIFICATION_INSTANCED@ notification on the root node.
instance' ::
            (PackedScene :< cls, Object :< cls) => cls -> Maybe Int -> IO Node
instance' cls arg1
  = withVariantArray [maybe (VariantInt (0)) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedScene_instance' (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PackedScene "instance" '[Maybe Int] (IO Node)
         where
        nodeMethod = Godot.Core.PackedScene.instance'

{-# NOINLINE bindPackedScene_pack #-}

-- | Pack will ignore any sub-nodes not owned by given node. See @Node.owner@.
bindPackedScene_pack :: MethodBind
bindPackedScene_pack
  = unsafePerformIO $
      withCString "PackedScene" $
        \ clsNamePtr ->
          withCString "pack" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Pack will ignore any sub-nodes not owned by given node. See @Node.owner@.
pack ::
       (PackedScene :< cls, Object :< cls) => cls -> Node -> IO Int
pack cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPackedScene_pack (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PackedScene "pack" '[Node] (IO Int) where
        nodeMethod = Godot.Core.PackedScene.pack