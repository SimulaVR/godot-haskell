{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.WorldEnvironment
       (Godot.Core.WorldEnvironment.get_environment,
        Godot.Core.WorldEnvironment.set_environment)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindWorldEnvironment_get_environment #-}

-- | The [Environment] resource used by this [code]WorldEnvironment[/code], defining the default properties.
bindWorldEnvironment_get_environment :: MethodBind
bindWorldEnvironment_get_environment
  = unsafePerformIO $
      withCString "WorldEnvironment" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Environment] resource used by this [code]WorldEnvironment[/code], defining the default properties.
get_environment ::
                  (WorldEnvironment :< cls, Object :< cls) => cls -> IO Environment
get_environment cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorldEnvironment_get_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindWorldEnvironment_set_environment #-}

-- | The [Environment] resource used by this [code]WorldEnvironment[/code], defining the default properties.
bindWorldEnvironment_set_environment :: MethodBind
bindWorldEnvironment_set_environment
  = unsafePerformIO $
      withCString "WorldEnvironment" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The [Environment] resource used by this [code]WorldEnvironment[/code], defining the default properties.
set_environment ::
                  (WorldEnvironment :< cls, Object :< cls) =>
                  cls -> Environment -> IO ()
set_environment cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindWorldEnvironment_set_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)