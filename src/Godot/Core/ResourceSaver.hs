{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ResourceSaver
       (Godot.Core.ResourceSaver._FLAG_REPLACE_SUBRESOURCE_PATHS,
        Godot.Core.ResourceSaver._FLAG_RELATIVE_PATHS,
        Godot.Core.ResourceSaver._FLAG_OMIT_EDITOR_PROPERTIES,
        Godot.Core.ResourceSaver._FLAG_SAVE_BIG_ENDIAN,
        Godot.Core.ResourceSaver._FLAG_CHANGE_PATH,
        Godot.Core.ResourceSaver._FLAG_COMPRESS,
        Godot.Core.ResourceSaver._FLAG_BUNDLE_RESOURCES,
        Godot.Core.ResourceSaver.get_recognized_extensions,
        Godot.Core.ResourceSaver.save)
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
import Godot.Core.Object()

_FLAG_REPLACE_SUBRESOURCE_PATHS :: Int
_FLAG_REPLACE_SUBRESOURCE_PATHS = 64

_FLAG_RELATIVE_PATHS :: Int
_FLAG_RELATIVE_PATHS = 1

_FLAG_OMIT_EDITOR_PROPERTIES :: Int
_FLAG_OMIT_EDITOR_PROPERTIES = 8

_FLAG_SAVE_BIG_ENDIAN :: Int
_FLAG_SAVE_BIG_ENDIAN = 16

_FLAG_CHANGE_PATH :: Int
_FLAG_CHANGE_PATH = 4

_FLAG_COMPRESS :: Int
_FLAG_COMPRESS = 32

_FLAG_BUNDLE_RESOURCES :: Int
_FLAG_BUNDLE_RESOURCES = 2

{-# NOINLINE bindResourceSaver_get_recognized_extensions #-}

-- | Returns the list of extensions available for saving a resource of a given type.
bindResourceSaver_get_recognized_extensions :: MethodBind
bindResourceSaver_get_recognized_extensions
  = unsafePerformIO $
      withCString "_ResourceSaver" $
        \ clsNamePtr ->
          withCString "get_recognized_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of extensions available for saving a resource of a given type.
get_recognized_extensions ::
                            (ResourceSaver :< cls, Object :< cls) =>
                            cls -> Resource -> IO PoolStringArray
get_recognized_extensions cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceSaver_get_recognized_extensions
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceSaver "get_recognized_extensions"
           '[Resource]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.ResourceSaver.get_recognized_extensions

{-# NOINLINE bindResourceSaver_save #-}

-- | Saves a resource to disk to the given path, using a @ResourceFormatSaver@ that recognizes the resource object.
--   				The @flags@ bitmask can be specified to customize the save behavior.
--   				Returns @OK@ on success.
bindResourceSaver_save :: MethodBind
bindResourceSaver_save
  = unsafePerformIO $
      withCString "_ResourceSaver" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves a resource to disk to the given path, using a @ResourceFormatSaver@ that recognizes the resource object.
--   				The @flags@ bitmask can be specified to customize the save behavior.
--   				Returns @OK@ on success.
save ::
       (ResourceSaver :< cls, Object :< cls) =>
       cls -> GodotString -> Resource -> Maybe Int -> IO Int
save cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceSaver_save (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ResourceSaver "save"
           '[GodotString, Resource, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.ResourceSaver.save