{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ResourceFormatSaver
       (Godot.Core.ResourceFormatSaver.save,
        Godot.Core.ResourceFormatSaver.get_recognized_extensions,
        Godot.Core.ResourceFormatSaver.recognize)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindResourceFormatSaver_save #-}

-- | Saves the given resource object to a file. [code]flags[/code] is a bitmask composed with [code]FLAG_*[/code] constants defined in [ResourceSaver]. Returns [code]OK[/code] on success, or an [code]ERR_*[/code] constant listed in [@GlobalScope] if it failed.
bindResourceFormatSaver_save :: MethodBind
bindResourceFormatSaver_save
  = unsafePerformIO $
      withCString "ResourceFormatSaver" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the given resource object to a file. [code]flags[/code] is a bitmask composed with [code]FLAG_*[/code] constants defined in [ResourceSaver]. Returns [code]OK[/code] on success, or an [code]ERR_*[/code] constant listed in [@GlobalScope] if it failed.
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

{-# NOINLINE bindResourceFormatSaver_get_recognized_extensions #-}

-- | Gets the list of extensions for files this saver is able to write.
bindResourceFormatSaver_get_recognized_extensions :: MethodBind
bindResourceFormatSaver_get_recognized_extensions
  = unsafePerformIO $
      withCString "ResourceFormatSaver" $
        \ clsNamePtr ->
          withCString "get_recognized_extensions" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the list of extensions for files this saver is able to write.
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

{-# NOINLINE bindResourceFormatSaver_recognize #-}

-- | Returns true if the given resource object can be saved by this saver.
bindResourceFormatSaver_recognize :: MethodBind
bindResourceFormatSaver_recognize
  = unsafePerformIO $
      withCString "ResourceFormatSaver" $
        \ clsNamePtr ->
          withCString "recognize" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns true if the given resource object can be saved by this saver.
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