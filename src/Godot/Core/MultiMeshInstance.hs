{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.MultiMeshInstance
       (Godot.Core.MultiMeshInstance.set_multimesh,
        Godot.Core.MultiMeshInstance.get_multimesh)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMultiMeshInstance_set_multimesh #-}

-- | The [MultiMesh] resource that will be used and shared among all instances of the [code]MultiMeshInstance[/code].
bindMultiMeshInstance_set_multimesh :: MethodBind
bindMultiMeshInstance_set_multimesh
  = unsafePerformIO $
      withCString "MultiMeshInstance" $
        \ clsNamePtr ->
          withCString "set_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [MultiMesh] resource that will be used and shared among all instances of the [code]MultiMeshInstance[/code].
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

{-# NOINLINE bindMultiMeshInstance_get_multimesh #-}

-- | The [MultiMesh] resource that will be used and shared among all instances of the [code]MultiMeshInstance[/code].
bindMultiMeshInstance_get_multimesh :: MethodBind
bindMultiMeshInstance_get_multimesh
  = unsafePerformIO $
      withCString "MultiMeshInstance" $
        \ clsNamePtr ->
          withCString "get_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [MultiMesh] resource that will be used and shared among all instances of the [code]MultiMeshInstance[/code].
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