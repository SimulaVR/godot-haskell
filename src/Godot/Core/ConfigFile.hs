{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ConfigFile
       (Godot.Core.ConfigFile.set_value, Godot.Core.ConfigFile.get_value,
        Godot.Core.ConfigFile.has_section,
        Godot.Core.ConfigFile.has_section_key,
        Godot.Core.ConfigFile.get_sections,
        Godot.Core.ConfigFile.get_section_keys,
        Godot.Core.ConfigFile.erase_section, Godot.Core.ConfigFile.load,
        Godot.Core.ConfigFile.save)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindConfigFile_set_value #-}

-- | Assigns a value to the specified key of the specified section. If the section and/or the key do not exist, they are created. Passing a [code]null[/code] value deletes the specified key if it exists, and deletes the section if it ends up empty once the key has been removed.
bindConfigFile_set_value :: MethodBind
bindConfigFile_set_value
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "set_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a value to the specified key of the specified section. If the section and/or the key do not exist, they are created. Passing a [code]null[/code] value deletes the specified key if it exists, and deletes the section if it ends up empty once the key has been removed.
set_value ::
            (ConfigFile :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> GodotVariant -> IO ()
set_value cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_set_value (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConfigFile_get_value #-}

-- | Returns the current value for the specified section and key. If the section and/or the key do not exist, the method returns the value of the optional [code]default[/code] argument, or [code]null[/code] if it is omitted.
bindConfigFile_get_value :: MethodBind
bindConfigFile_get_value
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "get_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current value for the specified section and key. If the section and/or the key do not exist, the method returns the value of the optional [code]default[/code] argument, or [code]null[/code] if it is omitted.
get_value ::
            (ConfigFile :< cls, Object :< cls) =>
            cls ->
              GodotString -> GodotString -> GodotVariant -> IO GodotVariant
get_value cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_get_value (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConfigFile_has_section #-}

-- | Returns [code]true[/code] if the specified section exists.
bindConfigFile_has_section :: MethodBind
bindConfigFile_has_section
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "has_section" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the specified section exists.
has_section ::
              (ConfigFile :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_section cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_has_section (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConfigFile_has_section_key #-}

-- | Returns [code]true[/code] if the specified section-key pair exists.
bindConfigFile_has_section_key :: MethodBind
bindConfigFile_has_section_key
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "has_section_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the specified section-key pair exists.
has_section_key ::
                  (ConfigFile :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> IO Bool
has_section_key cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_has_section_key (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConfigFile_get_sections #-}

-- | Returns an array of all defined section identifiers.
bindConfigFile_get_sections :: MethodBind
bindConfigFile_get_sections
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "get_sections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all defined section identifiers.
get_sections ::
               (ConfigFile :< cls, Object :< cls) => cls -> IO PoolStringArray
get_sections cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_get_sections (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConfigFile_get_section_keys #-}

-- | Returns an array of all defined key identifiers in the specified section.
bindConfigFile_get_section_keys :: MethodBind
bindConfigFile_get_section_keys
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "get_section_keys" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all defined key identifiers in the specified section.
get_section_keys ::
                   (ConfigFile :< cls, Object :< cls) =>
                   cls -> GodotString -> IO PoolStringArray
get_section_keys cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_get_section_keys (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConfigFile_erase_section #-}

-- | Deletes the specified section along with all the key-value pairs inside.
bindConfigFile_erase_section :: MethodBind
bindConfigFile_erase_section
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "erase_section" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the specified section along with all the key-value pairs inside.
erase_section ::
                (ConfigFile :< cls, Object :< cls) => cls -> GodotString -> IO ()
erase_section cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_erase_section (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConfigFile_load #-}

-- | Loads the config file specified as a parameter. The file's contents are parsed and loaded in the ConfigFile object which the method was called on. Returns one of the [code]OK[/code], [code]FAILED[/code] or [code]ERR_*[/code] constants listed in [@GlobalScope]. If the load was successful, the return value is [code]OK[/code].
bindConfigFile_load :: MethodBind
bindConfigFile_load
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads the config file specified as a parameter. The file's contents are parsed and loaded in the ConfigFile object which the method was called on. Returns one of the [code]OK[/code], [code]FAILED[/code] or [code]ERR_*[/code] constants listed in [@GlobalScope]. If the load was successful, the return value is [code]OK[/code].
load ::
       (ConfigFile :< cls, Object :< cls) => cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_load (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindConfigFile_save #-}

-- | Saves the contents of the ConfigFile object to the file specified as a parameter. The output file uses an INI-style structure. Returns one of the [code]OK[/code], [code]FAILED[/code] or [code]ERR_*[/code] constants listed in [@GlobalScope]. If the load was successful, the return value is [code]OK[/code].
bindConfigFile_save :: MethodBind
bindConfigFile_save
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the contents of the ConfigFile object to the file specified as a parameter. The output file uses an INI-style structure. Returns one of the [code]OK[/code], [code]FAILED[/code] or [code]ERR_*[/code] constants listed in [@GlobalScope]. If the load was successful, the return value is [code]OK[/code].
save ::
       (ConfigFile :< cls, Object :< cls) => cls -> GodotString -> IO Int
save cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_save (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)