{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Spatial()

instance NodeProperty VisualInstance "layers" Int 'False where
        nodeProperty
          = (get_layer_mask, wrapDroppingSetter set_layer_mask, Nothing)

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

instance NodeMethod VisualInstance "_get_visual_instance_rid" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualInstance._get_visual_instance_rid

{-# NOINLINE bindVisualInstance_get_aabb #-}

-- | Returns the @AABB@ (also known as the bounding box) for this @VisualInstance@.
bindVisualInstance_get_aabb :: MethodBind
bindVisualInstance_get_aabb
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @AABB@ (also known as the bounding box) for this @VisualInstance@.
get_aabb ::
           (VisualInstance :< cls, Object :< cls) => cls -> IO Aabb
get_aabb cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_aabb (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualInstance "get_aabb" '[] (IO Aabb) where
        nodeMethod = Godot.Core.VisualInstance.get_aabb

{-# NOINLINE bindVisualInstance_get_base #-}

-- | Returns the RID of the resource associated with this @VisualInstance@. For example, if the Node is a @MeshInstance@, this will return the RID of the associated @Mesh@.
bindVisualInstance_get_base :: MethodBind
bindVisualInstance_get_base
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the RID of the resource associated with this @VisualInstance@. For example, if the Node is a @MeshInstance@, this will return the RID of the associated @Mesh@.
get_base :: (VisualInstance :< cls, Object :< cls) => cls -> IO Rid
get_base cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_base (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualInstance "get_base" '[] (IO Rid) where
        nodeMethod = Godot.Core.VisualInstance.get_base

{-# NOINLINE bindVisualInstance_get_instance #-}

-- | Returns the RID of this instance. This RID is the same as the RID returned by @method VisualServer.instance_create@. This RID is needed if you want to call @VisualServer@ functions directly on this @VisualInstance@.
bindVisualInstance_get_instance :: MethodBind
bindVisualInstance_get_instance
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the RID of this instance. This RID is the same as the RID returned by @method VisualServer.instance_create@. This RID is needed if you want to call @VisualServer@ functions directly on this @VisualInstance@.
get_instance ::
               (VisualInstance :< cls, Object :< cls) => cls -> IO Rid
get_instance cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_get_instance (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualInstance "get_instance" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualInstance.get_instance

{-# NOINLINE bindVisualInstance_get_layer_mask #-}

-- | The render layer(s) this @VisualInstance@ is drawn on.
--   			This object will only be visible for @Camera@s whose cull mask includes the render object this @VisualInstance@ is set to.
bindVisualInstance_get_layer_mask :: MethodBind
bindVisualInstance_get_layer_mask
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_layer_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The render layer(s) this @VisualInstance@ is drawn on.
--   			This object will only be visible for @Camera@s whose cull mask includes the render object this @VisualInstance@ is set to.
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

instance NodeMethod VisualInstance "get_layer_mask" '[] (IO Int)
         where
        nodeMethod = Godot.Core.VisualInstance.get_layer_mask

{-# NOINLINE bindVisualInstance_get_layer_mask_bit #-}

-- | Returns @true@ when the specified layer is enabled in @layers@ and @false@ otherwise.
bindVisualInstance_get_layer_mask_bit :: MethodBind
bindVisualInstance_get_layer_mask_bit
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_layer_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ when the specified layer is enabled in @layers@ and @false@ otherwise.
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

instance NodeMethod VisualInstance "get_layer_mask_bit" '[Int]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualInstance.get_layer_mask_bit

{-# NOINLINE bindVisualInstance_get_transformed_aabb #-}

-- | Returns the transformed @AABB@ (also known as the bounding box) for this @VisualInstance@.
--   				Transformed in this case means the @AABB@ plus the position, rotation, and scale of the @Spatial@'s @Transform@.
bindVisualInstance_get_transformed_aabb :: MethodBind
bindVisualInstance_get_transformed_aabb
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "get_transformed_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the transformed @AABB@ (also known as the bounding box) for this @VisualInstance@.
--   				Transformed in this case means the @AABB@ plus the position, rotation, and scale of the @Spatial@'s @Transform@.
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

instance NodeMethod VisualInstance "get_transformed_aabb" '[]
           (IO Aabb)
         where
        nodeMethod = Godot.Core.VisualInstance.get_transformed_aabb

{-# NOINLINE bindVisualInstance_set_base #-}

-- | Sets the resource that is instantiated by this @VisualInstance@, which changes how the engine handles the @VisualInstance@ under the hood. Equivalent to @method VisualServer.instance_set_base@.
bindVisualInstance_set_base :: MethodBind
bindVisualInstance_set_base
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "set_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the resource that is instantiated by this @VisualInstance@, which changes how the engine handles the @VisualInstance@ under the hood. Equivalent to @method VisualServer.instance_set_base@.
set_base ::
           (VisualInstance :< cls, Object :< cls) => cls -> Rid -> IO ()
set_base cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualInstance_set_base (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualInstance "set_base" '[Rid] (IO ()) where
        nodeMethod = Godot.Core.VisualInstance.set_base

{-# NOINLINE bindVisualInstance_set_layer_mask #-}

-- | The render layer(s) this @VisualInstance@ is drawn on.
--   			This object will only be visible for @Camera@s whose cull mask includes the render object this @VisualInstance@ is set to.
bindVisualInstance_set_layer_mask :: MethodBind
bindVisualInstance_set_layer_mask
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "set_layer_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The render layer(s) this @VisualInstance@ is drawn on.
--   			This object will only be visible for @Camera@s whose cull mask includes the render object this @VisualInstance@ is set to.
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

instance NodeMethod VisualInstance "set_layer_mask" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.VisualInstance.set_layer_mask

{-# NOINLINE bindVisualInstance_set_layer_mask_bit #-}

-- | Enables a particular layer in @layers@.
bindVisualInstance_set_layer_mask_bit :: MethodBind
bindVisualInstance_set_layer_mask_bit
  = unsafePerformIO $
      withCString "VisualInstance" $
        \ clsNamePtr ->
          withCString "set_layer_mask_bit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables a particular layer in @layers@.
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

instance NodeMethod VisualInstance "set_layer_mask_bit"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualInstance.set_layer_mask_bit