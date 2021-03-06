{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.WorldEnvironment
       (Godot.Core.WorldEnvironment.get_environment,
        Godot.Core.WorldEnvironment.set_environment)
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
import Godot.Core.Node()

instance NodeProperty WorldEnvironment "environment" Environment
           'False
         where
        nodeProperty
          = (get_environment, wrapDroppingSetter set_environment, Nothing)

{-# NOINLINE bindWorldEnvironment_get_environment #-}

-- | The @Environment@ resource used by this @WorldEnvironment@, defining the default properties.
bindWorldEnvironment_get_environment :: MethodBind
bindWorldEnvironment_get_environment
  = unsafePerformIO $
      withCString "WorldEnvironment" $
        \ clsNamePtr ->
          withCString "get_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Environment@ resource used by this @WorldEnvironment@, defining the default properties.
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

instance NodeMethod WorldEnvironment "get_environment" '[]
           (IO Environment)
         where
        nodeMethod = Godot.Core.WorldEnvironment.get_environment

{-# NOINLINE bindWorldEnvironment_set_environment #-}

-- | The @Environment@ resource used by this @WorldEnvironment@, defining the default properties.
bindWorldEnvironment_set_environment :: MethodBind
bindWorldEnvironment_set_environment
  = unsafePerformIO $
      withCString "WorldEnvironment" $
        \ clsNamePtr ->
          withCString "set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Environment@ resource used by this @WorldEnvironment@, defining the default properties.
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

instance NodeMethod WorldEnvironment "set_environment"
           '[Environment]
           (IO ())
         where
        nodeMethod = Godot.Core.WorldEnvironment.set_environment