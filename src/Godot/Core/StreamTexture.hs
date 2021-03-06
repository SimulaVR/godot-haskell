{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.StreamTexture
       (Godot.Core.StreamTexture.get_load_path,
        Godot.Core.StreamTexture.load)
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
import Godot.Core.Texture()

instance NodeProperty StreamTexture "load_path" GodotString 'False
         where
        nodeProperty = (get_load_path, wrapDroppingSetter load, Nothing)

{-# NOINLINE bindStreamTexture_get_load_path #-}

-- | The StreamTexture's file path to a @.stex@ file.
bindStreamTexture_get_load_path :: MethodBind
bindStreamTexture_get_load_path
  = unsafePerformIO $
      withCString "StreamTexture" $
        \ clsNamePtr ->
          withCString "get_load_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The StreamTexture's file path to a @.stex@ file.
get_load_path ::
                (StreamTexture :< cls, Object :< cls) => cls -> IO GodotString
get_load_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamTexture_get_load_path (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamTexture "get_load_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.StreamTexture.get_load_path

{-# NOINLINE bindStreamTexture_load #-}

-- | Loads the texture from the given path.
bindStreamTexture_load :: MethodBind
bindStreamTexture_load
  = unsafePerformIO $
      withCString "StreamTexture" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads the texture from the given path.
load ::
       (StreamTexture :< cls, Object :< cls) =>
       cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindStreamTexture_load (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod StreamTexture "load" '[GodotString] (IO Int)
         where
        nodeMethod = Godot.Core.StreamTexture.load