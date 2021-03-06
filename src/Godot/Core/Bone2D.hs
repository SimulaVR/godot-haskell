{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Bone2D
       (Godot.Core.Bone2D.apply_rest,
        Godot.Core.Bone2D.get_default_length,
        Godot.Core.Bone2D.get_index_in_skeleton,
        Godot.Core.Bone2D.get_rest, Godot.Core.Bone2D.get_skeleton_rest,
        Godot.Core.Bone2D.set_default_length, Godot.Core.Bone2D.set_rest)
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

instance NodeProperty Bone2D "default_length" Float 'False where
        nodeProperty
          = (get_default_length, wrapDroppingSetter set_default_length,
             Nothing)

instance NodeProperty Bone2D "rest" Transform2d 'False where
        nodeProperty = (get_rest, wrapDroppingSetter set_rest, Nothing)

{-# NOINLINE bindBone2D_apply_rest #-}

-- | Stores the node's current transforms in @rest@.
bindBone2D_apply_rest :: MethodBind
bindBone2D_apply_rest
  = unsafePerformIO $
      withCString "Bone2D" $
        \ clsNamePtr ->
          withCString "apply_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stores the node's current transforms in @rest@.
apply_rest :: (Bone2D :< cls, Object :< cls) => cls -> IO ()
apply_rest cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBone2D_apply_rest (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Bone2D "apply_rest" '[] (IO ()) where
        nodeMethod = Godot.Core.Bone2D.apply_rest

{-# NOINLINE bindBone2D_get_default_length #-}

-- | Length of the bone's representation drawn in the editor's viewport in pixels.
bindBone2D_get_default_length :: MethodBind
bindBone2D_get_default_length
  = unsafePerformIO $
      withCString "Bone2D" $
        \ clsNamePtr ->
          withCString "get_default_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Length of the bone's representation drawn in the editor's viewport in pixels.
get_default_length ::
                     (Bone2D :< cls, Object :< cls) => cls -> IO Float
get_default_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBone2D_get_default_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Bone2D "get_default_length" '[] (IO Float)
         where
        nodeMethod = Godot.Core.Bone2D.get_default_length

{-# NOINLINE bindBone2D_get_index_in_skeleton #-}

-- | Returns the node's index as part of the entire skeleton. See @Skeleton2D@.
bindBone2D_get_index_in_skeleton :: MethodBind
bindBone2D_get_index_in_skeleton
  = unsafePerformIO $
      withCString "Bone2D" $
        \ clsNamePtr ->
          withCString "get_index_in_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the node's index as part of the entire skeleton. See @Skeleton2D@.
get_index_in_skeleton ::
                        (Bone2D :< cls, Object :< cls) => cls -> IO Int
get_index_in_skeleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBone2D_get_index_in_skeleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Bone2D "get_index_in_skeleton" '[] (IO Int)
         where
        nodeMethod = Godot.Core.Bone2D.get_index_in_skeleton

{-# NOINLINE bindBone2D_get_rest #-}

-- | Rest transform of the bone. You can reset the node's transforms to this value using @method apply_rest@.
bindBone2D_get_rest :: MethodBind
bindBone2D_get_rest
  = unsafePerformIO $
      withCString "Bone2D" $
        \ clsNamePtr ->
          withCString "get_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rest transform of the bone. You can reset the node's transforms to this value using @method apply_rest@.
get_rest :: (Bone2D :< cls, Object :< cls) => cls -> IO Transform2d
get_rest cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBone2D_get_rest (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Bone2D "get_rest" '[] (IO Transform2d) where
        nodeMethod = Godot.Core.Bone2D.get_rest

{-# NOINLINE bindBone2D_get_skeleton_rest #-}

-- | Returns the node's @rest@ @Transform2D@ if it doesn't have a parent, or its rest pose relative to its parent.
bindBone2D_get_skeleton_rest :: MethodBind
bindBone2D_get_skeleton_rest
  = unsafePerformIO $
      withCString "Bone2D" $
        \ clsNamePtr ->
          withCString "get_skeleton_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the node's @rest@ @Transform2D@ if it doesn't have a parent, or its rest pose relative to its parent.
get_skeleton_rest ::
                    (Bone2D :< cls, Object :< cls) => cls -> IO Transform2d
get_skeleton_rest cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBone2D_get_skeleton_rest (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Bone2D "get_skeleton_rest" '[] (IO Transform2d)
         where
        nodeMethod = Godot.Core.Bone2D.get_skeleton_rest

{-# NOINLINE bindBone2D_set_default_length #-}

-- | Length of the bone's representation drawn in the editor's viewport in pixels.
bindBone2D_set_default_length :: MethodBind
bindBone2D_set_default_length
  = unsafePerformIO $
      withCString "Bone2D" $
        \ clsNamePtr ->
          withCString "set_default_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Length of the bone's representation drawn in the editor's viewport in pixels.
set_default_length ::
                     (Bone2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_default_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBone2D_set_default_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Bone2D "set_default_length" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.Bone2D.set_default_length

{-# NOINLINE bindBone2D_set_rest #-}

-- | Rest transform of the bone. You can reset the node's transforms to this value using @method apply_rest@.
bindBone2D_set_rest :: MethodBind
bindBone2D_set_rest
  = unsafePerformIO $
      withCString "Bone2D" $
        \ clsNamePtr ->
          withCString "set_rest" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rest transform of the bone. You can reset the node's transforms to this value using @method apply_rest@.
set_rest ::
           (Bone2D :< cls, Object :< cls) => cls -> Transform2d -> IO ()
set_rest cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBone2D_set_rest (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Bone2D "set_rest" '[Transform2d] (IO ()) where
        nodeMethod = Godot.Core.Bone2D.set_rest