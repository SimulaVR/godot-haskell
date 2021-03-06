{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ResourceFormatSaver
       (Godot.Core.ResourceFormatSaver.get_recognized_extensions,
        Godot.Core.ResourceFormatSaver.recognize,
        Godot.Core.ResourceFormatSaver.save)
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
import Godot.Core.Reference()

{-# NOINLINE bindResourceFormatSaver_get_recognized_extensions #-}

-- | Returns the list of extensions available for saving the resource object, provided it is recognized (see @method recognize@).
bindResourceFormatSaver_get_recognized_extensions :: MethodBind
bindResourceFormatSaver_get_recognized_extensions
  = unsafePerformIO $
      withCString "ResourceFormatSaver" $
        \ clsNamePtr ->
          withCString "get_recognized_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of extensions available for saving the resource object, provided it is recognized (see @method recognize@).
get_recognized_extensions ::
                            (ResourceFormatSaver :< cls, Object :< cls) =>
                            cls -> Resource -> IO PoolStringArray
get_recognized_extensions cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindResourceFormatSaver_get_recognized_extensions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatSaver "get_recognized_extensions"
           '[Resource]
           (IO PoolStringArray)
         where
        nodeMethod
          = Godot.Core.ResourceFormatSaver.get_recognized_extensions

{-# NOINLINE bindResourceFormatSaver_recognize #-}

-- | Returns whether the given resource object can be saved by this saver.
bindResourceFormatSaver_recognize :: MethodBind
bindResourceFormatSaver_recognize
  = unsafePerformIO $
      withCString "ResourceFormatSaver" $
        \ clsNamePtr ->
          withCString "recognize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the given resource object can be saved by this saver.
recognize ::
            (ResourceFormatSaver :< cls, Object :< cls) =>
            cls -> Resource -> IO Bool
recognize cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatSaver_recognize
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatSaver "recognize" '[Resource]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ResourceFormatSaver.recognize

{-# NOINLINE bindResourceFormatSaver_save #-}

-- | Saves the given resource object to a file at the target @path@. @flags@ is a bitmask composed with @enum ResourceSaver.SaverFlags@ constants.
--   				Returns @OK@ on success, or an @enum Error@ constant in case of failure.
bindResourceFormatSaver_save :: MethodBind
bindResourceFormatSaver_save
  = unsafePerformIO $
      withCString "ResourceFormatSaver" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the given resource object to a file at the target @path@. @flags@ is a bitmask composed with @enum ResourceSaver.SaverFlags@ constants.
--   				Returns @OK@ on success, or an @enum Error@ constant in case of failure.
save ::
       (ResourceFormatSaver :< cls, Object :< cls) =>
       cls -> GodotString -> Resource -> Int -> IO Int
save cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceFormatSaver_save (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceFormatSaver "save"
           '[GodotString, Resource, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.ResourceFormatSaver.save