{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualInstance
       (Godot.Core.VisualInstance._get_visual_instance_rid,
        Godot.Core.VisualInstance.get_aabb,
        Godot.Core.VisualInstance.get_base,
        Godot.Core.VisualInstance.get_instance,
        Godot.Core.VisualInstance.get_layer_mask,
        Godot.Core.VisualInstance.get_layer_mask_bit,
        Godot.Core.VisualInstance.get_transformed_aabb,
        Godot.Core.VisualInstance.set_base,
        Godot.Core.VisualInstance.set_layer_mask,
        Godot.Core.VisualInstance.set_layer_mask_bit)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindVisualInstance__get_visual_instance_rid #-}

bindVisualInstance__get_visual_instance_rid :: MethodBind
bindVisualInstance__get_visual_instance_rid
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "_get_visual_instance_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_visual_instance_rid ::
                           (VisualInstance :< cls, Object :< cls) => cls -> IO Rid
_get_visual_instance_rid cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance__get_visual_instance_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_get_aabb #-}

-- | Returns the [AABB] (also known as the bounding box) for this VisualInstance.
bindVisualInstance_get_aabb :: MethodBind
bindVisualInstance_get_aabb
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [AABB] (also known as the bounding box) for this VisualInstance.
get_aabb ::
           (VisualInstance :< cls, Object :< cls) => cls -> IO Aabb
get_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_get_base #-}

bindVisualInstance_get_base :: MethodBind
bindVisualInstance_get_base
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base :: (VisualInstance :< cls, Object :< cls) => cls -> IO Rid
get_base cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_base (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_get_instance #-}

bindVisualInstance_get_instance :: MethodBind
bindVisualInstance_get_instance
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_instance ::
               (VisualInstance :< cls, Object :< cls) => cls -> IO Rid
get_instance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_instance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_get_layer_mask #-}

-- | The render layer(s) this VisualInstance is drawn on.
--   			This object will only be visible for [Camera]s whose cull mask includes the render object this VisualInstance is set to.
bindVisualInstance_get_layer_mask :: MethodBind
bindVisualInstance_get_layer_mask
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_layer_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The render layer(s) this VisualInstance is drawn on.
--   			This object will only be visible for [Camera]s whose cull mask includes the render object this VisualInstance is set to.
get_layer_mask ::
                 (VisualInstance :< cls, Object :< cls) => cls -> IO Int
get_layer_mask cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_layer_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_get_layer_mask_bit #-}

bindVisualInstance_get_layer_mask_bit :: MethodBind
bindVisualInstance_get_layer_mask_bit
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_layer_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_layer_mask_bit ::
                     (VisualInstance :< cls, Object :< cls) => cls -> Int -> IO Bool
get_layer_mask_bit cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_layer_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_get_transformed_aabb #-}

-- | Returns the transformed [AABB] (also known as the bounding box) for this VisualInstance.
--   				Transformed in this case means the [AABB] plus the position, rotation, and scale of the [Spatial]s [Transform]
bindVisualInstance_get_transformed_aabb :: MethodBind
bindVisualInstance_get_transformed_aabb
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_transformed_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transformed [AABB] (also known as the bounding box) for this VisualInstance.
--   				Transformed in this case means the [AABB] plus the position, rotation, and scale of the [Spatial]s [Transform]
get_transformed_aabb ::
                       (VisualInstance :< cls, Object :< cls) => cls -> IO Aabb
get_transformed_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_transformed_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_set_base #-}

-- | Sets the base of the VisualInstance, which changes how the engine handles the VisualInstance under the hood.
--   				It is recommended to only use set_base if you know what you're doing.
bindVisualInstance_set_base :: MethodBind
bindVisualInstance_set_base
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "set_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the base of the VisualInstance, which changes how the engine handles the VisualInstance under the hood.
--   				It is recommended to only use set_base if you know what you're doing.
set_base ::
           (VisualInstance :< cls, Object :< cls) => cls -> Rid -> IO ()
set_base cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_set_base (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_set_layer_mask #-}

-- | The render layer(s) this VisualInstance is drawn on.
--   			This object will only be visible for [Camera]s whose cull mask includes the render object this VisualInstance is set to.
bindVisualInstance_set_layer_mask :: MethodBind
bindVisualInstance_set_layer_mask
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "set_layer_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The render layer(s) this VisualInstance is drawn on.
--   			This object will only be visible for [Camera]s whose cull mask includes the render object this VisualInstance is set to.
set_layer_mask ::
                 (VisualInstance :< cls, Object :< cls) => cls -> Int -> IO ()
set_layer_mask cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_set_layer_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualInstance_set_layer_mask_bit #-}

bindVisualInstance_set_layer_mask_bit :: MethodBind
bindVisualInstance_set_layer_mask_bit
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "set_layer_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_layer_mask_bit ::
                     (VisualInstance :< cls, Object :< cls) =>
                     cls -> Int -> Bool -> IO ()
set_layer_mask_bit cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_set_layer_mask_bit
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)