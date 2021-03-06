{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.MultiMeshInstance
       (Godot.Core.MultiMeshInstance.get_multimesh,
        Godot.Core.MultiMeshInstance.set_multimesh)
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
import Godot.Core.GeometryInstance()

instance NodeProperty MultiMeshInstance "multimesh" MultiMesh
           'False
         where
        nodeProperty
          = (get_multimesh, wrapDroppingSetter set_multimesh, Nothing)

{-# NOINLINE bindMultiMeshInstance_get_multimesh #-}

-- | The @MultiMesh@ resource that will be used and shared among all instances of the @MultiMeshInstance@.
bindMultiMeshInstance_get_multimesh :: MethodBind
bindMultiMeshInstance_get_multimesh
  = unsafePerformIO $
      withCString "MultiMeshInstance" $
        \ clsNamePtr ->
          withCString "get_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @MultiMesh@ resource that will be used and shared among all instances of the @MultiMeshInstance@.
get_multimesh ::
                (MultiMeshInstance :< cls, Object :< cls) => cls -> IO MultiMesh
get_multimesh cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMeshInstance_get_multimesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMeshInstance "get_multimesh" '[]
           (IO MultiMesh)
         where
        nodeMethod = Godot.Core.MultiMeshInstance.get_multimesh

{-# NOINLINE bindMultiMeshInstance_set_multimesh #-}

-- | The @MultiMesh@ resource that will be used and shared among all instances of the @MultiMeshInstance@.
bindMultiMeshInstance_set_multimesh :: MethodBind
bindMultiMeshInstance_set_multimesh
  = unsafePerformIO $
      withCString "MultiMeshInstance" $
        \ clsNamePtr ->
          withCString "set_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @MultiMesh@ resource that will be used and shared among all instances of the @MultiMeshInstance@.
set_multimesh ::
                (MultiMeshInstance :< cls, Object :< cls) =>
                cls -> MultiMesh -> IO ()
set_multimesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMultiMeshInstance_set_multimesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod MultiMeshInstance "set_multimesh" '[MultiMesh]
           (IO ())
         where
        nodeMethod = Godot.Core.MultiMeshInstance.set_multimesh