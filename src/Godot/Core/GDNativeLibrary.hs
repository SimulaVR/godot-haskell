{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GDNativeLibrary
       (Godot.Core.GDNativeLibrary.get_config_file,
        Godot.Core.GDNativeLibrary.get_current_dependencies,
        Godot.Core.GDNativeLibrary.get_current_library_path,
        Godot.Core.GDNativeLibrary.get_symbol_prefix,
        Godot.Core.GDNativeLibrary.is_reloadable,
        Godot.Core.GDNativeLibrary.is_singleton,
        Godot.Core.GDNativeLibrary.set_config_file,
        Godot.Core.GDNativeLibrary.set_load_once,
        Godot.Core.GDNativeLibrary.set_reloadable,
        Godot.Core.GDNativeLibrary.set_singleton,
        Godot.Core.GDNativeLibrary.set_symbol_prefix,
        Godot.Core.GDNativeLibrary.should_load_once)
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
import Godot.Core.Resource()

instance NodeProperty GDNativeLibrary "config_file" ConfigFile
           'False
         where
        nodeProperty
          = (get_config_file, wrapDroppingSetter set_config_file, Nothing)

instance NodeProperty GDNativeLibrary "load_once" Bool 'False where
        nodeProperty
          = (should_load_once, wrapDroppingSetter set_load_once, Nothing)

instance NodeProperty GDNativeLibrary "reloadable" Bool 'False
         where
        nodeProperty
          = (is_reloadable, wrapDroppingSetter set_reloadable, Nothing)

instance NodeProperty GDNativeLibrary "singleton" Bool 'False where
        nodeProperty
          = (is_singleton, wrapDroppingSetter set_singleton, Nothing)

instance NodeProperty GDNativeLibrary "symbol_prefix" GodotString
           'False
         where
        nodeProperty
          = (get_symbol_prefix, wrapDroppingSetter set_symbol_prefix,
             Nothing)

{-# NOINLINE bindGDNativeLibrary_get_config_file #-}

bindGDNativeLibrary_get_config_file :: MethodBind
bindGDNativeLibrary_get_config_file
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "get_config_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_config_file ::
                  (GDNativeLibrary :< cls, Object :< cls) => cls -> IO ConfigFile
get_config_file cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_get_config_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "get_config_file" '[]
           (IO ConfigFile)
         where
        nodeMethod = Godot.Core.GDNativeLibrary.get_config_file

{-# NOINLINE bindGDNativeLibrary_get_current_dependencies #-}

bindGDNativeLibrary_get_current_dependencies :: MethodBind
bindGDNativeLibrary_get_current_dependencies
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "get_current_dependencies" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_current_dependencies ::
                           (GDNativeLibrary :< cls, Object :< cls) =>
                           cls -> IO PoolStringArray
get_current_dependencies cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_get_current_dependencies
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "get_current_dependencies" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.GDNativeLibrary.get_current_dependencies

{-# NOINLINE bindGDNativeLibrary_get_current_library_path #-}

bindGDNativeLibrary_get_current_library_path :: MethodBind
bindGDNativeLibrary_get_current_library_path
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "get_current_library_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_current_library_path ::
                           (GDNativeLibrary :< cls, Object :< cls) => cls -> IO GodotString
get_current_library_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_get_current_library_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "get_current_library_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.GDNativeLibrary.get_current_library_path

{-# NOINLINE bindGDNativeLibrary_get_symbol_prefix #-}

bindGDNativeLibrary_get_symbol_prefix :: MethodBind
bindGDNativeLibrary_get_symbol_prefix
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "get_symbol_prefix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_symbol_prefix ::
                    (GDNativeLibrary :< cls, Object :< cls) => cls -> IO GodotString
get_symbol_prefix cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_get_symbol_prefix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "get_symbol_prefix" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.GDNativeLibrary.get_symbol_prefix

{-# NOINLINE bindGDNativeLibrary_is_reloadable #-}

bindGDNativeLibrary_is_reloadable :: MethodBind
bindGDNativeLibrary_is_reloadable
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "is_reloadable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_reloadable ::
                (GDNativeLibrary :< cls, Object :< cls) => cls -> IO Bool
is_reloadable cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_is_reloadable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "is_reloadable" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.GDNativeLibrary.is_reloadable

{-# NOINLINE bindGDNativeLibrary_is_singleton #-}

bindGDNativeLibrary_is_singleton :: MethodBind
bindGDNativeLibrary_is_singleton
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "is_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_singleton ::
               (GDNativeLibrary :< cls, Object :< cls) => cls -> IO Bool
is_singleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_is_singleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "is_singleton" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.GDNativeLibrary.is_singleton

{-# NOINLINE bindGDNativeLibrary_set_config_file #-}

bindGDNativeLibrary_set_config_file :: MethodBind
bindGDNativeLibrary_set_config_file
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "set_config_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_config_file ::
                  (GDNativeLibrary :< cls, Object :< cls) =>
                  cls -> ConfigFile -> IO ()
set_config_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_set_config_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "set_config_file" '[ConfigFile]
           (IO ())
         where
        nodeMethod = Godot.Core.GDNativeLibrary.set_config_file

{-# NOINLINE bindGDNativeLibrary_set_load_once #-}

bindGDNativeLibrary_set_load_once :: MethodBind
bindGDNativeLibrary_set_load_once
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "set_load_once" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_load_once ::
                (GDNativeLibrary :< cls, Object :< cls) => cls -> Bool -> IO ()
set_load_once cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_set_load_once
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "set_load_once" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.GDNativeLibrary.set_load_once

{-# NOINLINE bindGDNativeLibrary_set_reloadable #-}

bindGDNativeLibrary_set_reloadable :: MethodBind
bindGDNativeLibrary_set_reloadable
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "set_reloadable" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_reloadable ::
                 (GDNativeLibrary :< cls, Object :< cls) => cls -> Bool -> IO ()
set_reloadable cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_set_reloadable
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "set_reloadable" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.GDNativeLibrary.set_reloadable

{-# NOINLINE bindGDNativeLibrary_set_singleton #-}

bindGDNativeLibrary_set_singleton :: MethodBind
bindGDNativeLibrary_set_singleton
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "set_singleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_singleton ::
                (GDNativeLibrary :< cls, Object :< cls) => cls -> Bool -> IO ()
set_singleton cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_set_singleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "set_singleton" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.GDNativeLibrary.set_singleton

{-# NOINLINE bindGDNativeLibrary_set_symbol_prefix #-}

bindGDNativeLibrary_set_symbol_prefix :: MethodBind
bindGDNativeLibrary_set_symbol_prefix
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "set_symbol_prefix" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_symbol_prefix ::
                    (GDNativeLibrary :< cls, Object :< cls) =>
                    cls -> GodotString -> IO ()
set_symbol_prefix cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_set_symbol_prefix
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "set_symbol_prefix"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.GDNativeLibrary.set_symbol_prefix

{-# NOINLINE bindGDNativeLibrary_should_load_once #-}

bindGDNativeLibrary_should_load_once :: MethodBind
bindGDNativeLibrary_should_load_once
  = unsafePerformIO $
      withCString "GDNativeLibrary" $
        \ clsNamePtr ->
          withCString "should_load_once" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

should_load_once ::
                   (GDNativeLibrary :< cls, Object :< cls) => cls -> IO Bool
should_load_once cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDNativeLibrary_should_load_once
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDNativeLibrary "should_load_once" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GDNativeLibrary.should_load_once