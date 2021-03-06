{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.BoneAttachment
       (Godot.Core.BoneAttachment.get_bone_name,
        Godot.Core.BoneAttachment.set_bone_name)
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

instance NodeProperty BoneAttachment "bone_name" GodotString 'False
         where
        nodeProperty
          = (get_bone_name, wrapDroppingSetter set_bone_name, Nothing)

{-# NOINLINE bindBoneAttachment_get_bone_name #-}

-- | The name of the attached bone.
bindBoneAttachment_get_bone_name :: MethodBind
bindBoneAttachment_get_bone_name
  = unsafePerformIO $
      withCString "BoneAttachment" $
        \ clsNamePtr ->
          withCString "get_bone_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the attached bone.
get_bone_name ::
                (BoneAttachment :< cls, Object :< cls) => cls -> IO GodotString
get_bone_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoneAttachment_get_bone_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BoneAttachment "get_bone_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.BoneAttachment.get_bone_name

{-# NOINLINE bindBoneAttachment_set_bone_name #-}

-- | The name of the attached bone.
bindBoneAttachment_set_bone_name :: MethodBind
bindBoneAttachment_set_bone_name
  = unsafePerformIO $
      withCString "BoneAttachment" $
        \ clsNamePtr ->
          withCString "set_bone_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The name of the attached bone.
set_bone_name ::
                (BoneAttachment :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_bone_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBoneAttachment_set_bone_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod BoneAttachment "set_bone_name" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.BoneAttachment.set_bone_name