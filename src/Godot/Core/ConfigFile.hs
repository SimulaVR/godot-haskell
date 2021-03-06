{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ConfigFile
       (Godot.Core.ConfigFile.erase_section,
        Godot.Core.ConfigFile.erase_section_key,
        Godot.Core.ConfigFile.get_section_keys,
        Godot.Core.ConfigFile.get_sections,
        Godot.Core.ConfigFile.get_value, Godot.Core.ConfigFile.has_section,
        Godot.Core.ConfigFile.has_section_key, Godot.Core.ConfigFile.load,
        Godot.Core.ConfigFile.load_encrypted,
        Godot.Core.ConfigFile.load_encrypted_pass,
        Godot.Core.ConfigFile.save, Godot.Core.ConfigFile.save_encrypted,
        Godot.Core.ConfigFile.save_encrypted_pass,
        Godot.Core.ConfigFile.set_value)
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

{-# NOINLINE bindConfigFile_erase_section #-}

-- | Deletes the specified section along with all the key-value pairs inside. Raises an error if the section does not exist.
bindConfigFile_erase_section :: MethodBind
bindConfigFile_erase_section
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "erase_section" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the specified section along with all the key-value pairs inside. Raises an error if the section does not exist.
erase_section ::
                (ConfigFile :< cls, Object :< cls) => cls -> GodotString -> IO ()
erase_section cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_erase_section (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "erase_section" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.ConfigFile.erase_section

{-# NOINLINE bindConfigFile_erase_section_key #-}

-- | Deletes the specified key in a section. Raises an error if either the section or the key do not exist.
bindConfigFile_erase_section_key :: MethodBind
bindConfigFile_erase_section_key
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "erase_section_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the specified key in a section. Raises an error if either the section or the key do not exist.
erase_section_key ::
                    (ConfigFile :< cls, Object :< cls) =>
                    cls -> GodotString -> GodotString -> IO ()
erase_section_key cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_erase_section_key
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "erase_section_key"
           '[GodotString, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.ConfigFile.erase_section_key

{-# NOINLINE bindConfigFile_get_section_keys #-}

-- | Returns an array of all defined key identifiers in the specified section. Raises an error and returns an empty array if the section does not exist.
bindConfigFile_get_section_keys :: MethodBind
bindConfigFile_get_section_keys
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "get_section_keys" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of all defined key identifiers in the specified section. Raises an error and returns an empty array if the section does not exist.
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

instance NodeMethod ConfigFile "get_section_keys" '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.ConfigFile.get_section_keys

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

instance NodeMethod ConfigFile "get_sections" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.ConfigFile.get_sections

{-# NOINLINE bindConfigFile_get_value #-}

-- | Returns the current value for the specified section and key. If either the section or the key do not exist, the method returns the fallback @default@ value. If @default@ is not specified or set to @null@, an error is also raised.
bindConfigFile_get_value :: MethodBind
bindConfigFile_get_value
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "get_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current value for the specified section and key. If either the section or the key do not exist, the method returns the fallback @default@ value. If @default@ is not specified or set to @null@, an error is also raised.
get_value ::
            (ConfigFile :< cls, Object :< cls) =>
            cls ->
              GodotString -> GodotString -> Maybe GodotVariant -> IO GodotVariant
get_value cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_get_value (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "get_value"
           '[GodotString, GodotString, Maybe GodotVariant]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.ConfigFile.get_value

{-# NOINLINE bindConfigFile_has_section #-}

-- | Returns @true@ if the specified section exists.
bindConfigFile_has_section :: MethodBind
bindConfigFile_has_section
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "has_section" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified section exists.
has_section ::
              (ConfigFile :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_section cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_has_section (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "has_section" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ConfigFile.has_section

{-# NOINLINE bindConfigFile_has_section_key #-}

-- | Returns @true@ if the specified section-key pair exists.
bindConfigFile_has_section_key :: MethodBind
bindConfigFile_has_section_key
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "has_section_key" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the specified section-key pair exists.
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

instance NodeMethod ConfigFile "has_section_key"
           '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ConfigFile.has_section_key

{-# NOINLINE bindConfigFile_load #-}

-- | Loads the config file specified as a parameter. The file's contents are parsed and loaded in the @ConfigFile@ object which the method was called on.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindConfigFile_load :: MethodBind
bindConfigFile_load
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "load" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads the config file specified as a parameter. The file's contents are parsed and loaded in the @ConfigFile@ object which the method was called on.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
load ::
       (ConfigFile :< cls, Object :< cls) => cls -> GodotString -> IO Int
load cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_load (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "load" '[GodotString] (IO Int) where
        nodeMethod = Godot.Core.ConfigFile.load

{-# NOINLINE bindConfigFile_load_encrypted #-}

-- | Loads the encrypted config file specified as a parameter, using the provided @key@ to decrypt it. The file's contents are parsed and loaded in the @ConfigFile@ object which the method was called on.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindConfigFile_load_encrypted :: MethodBind
bindConfigFile_load_encrypted
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "load_encrypted" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads the encrypted config file specified as a parameter, using the provided @key@ to decrypt it. The file's contents are parsed and loaded in the @ConfigFile@ object which the method was called on.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
load_encrypted ::
                 (ConfigFile :< cls, Object :< cls) =>
                 cls -> GodotString -> PoolByteArray -> IO Int
load_encrypted cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_load_encrypted (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "load_encrypted"
           '[GodotString, PoolByteArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.ConfigFile.load_encrypted

{-# NOINLINE bindConfigFile_load_encrypted_pass #-}

-- | Loads the encrypted config file specified as a parameter, using the provided @password@ to decrypt it. The file's contents are parsed and loaded in the @ConfigFile@ object which the method was called on.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindConfigFile_load_encrypted_pass :: MethodBind
bindConfigFile_load_encrypted_pass
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "load_encrypted_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Loads the encrypted config file specified as a parameter, using the provided @password@ to decrypt it. The file's contents are parsed and loaded in the @ConfigFile@ object which the method was called on.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
load_encrypted_pass ::
                      (ConfigFile :< cls, Object :< cls) =>
                      cls -> GodotString -> GodotString -> IO Int
load_encrypted_pass cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_load_encrypted_pass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "load_encrypted_pass"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.ConfigFile.load_encrypted_pass

{-# NOINLINE bindConfigFile_save #-}

-- | Saves the contents of the @ConfigFile@ object to the file specified as a parameter. The output file uses an INI-style structure.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindConfigFile_save :: MethodBind
bindConfigFile_save
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "save" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the contents of the @ConfigFile@ object to the file specified as a parameter. The output file uses an INI-style structure.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
save ::
       (ConfigFile :< cls, Object :< cls) => cls -> GodotString -> IO Int
save cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_save (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "save" '[GodotString] (IO Int) where
        nodeMethod = Godot.Core.ConfigFile.save

{-# NOINLINE bindConfigFile_save_encrypted #-}

-- | Saves the contents of the @ConfigFile@ object to the AES-256 encrypted file specified as a parameter, using the provided @key@ to encrypt it. The output file uses an INI-style structure.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindConfigFile_save_encrypted :: MethodBind
bindConfigFile_save_encrypted
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "save_encrypted" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the contents of the @ConfigFile@ object to the AES-256 encrypted file specified as a parameter, using the provided @key@ to encrypt it. The output file uses an INI-style structure.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
save_encrypted ::
                 (ConfigFile :< cls, Object :< cls) =>
                 cls -> GodotString -> PoolByteArray -> IO Int
save_encrypted cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_save_encrypted (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "save_encrypted"
           '[GodotString, PoolByteArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.ConfigFile.save_encrypted

{-# NOINLINE bindConfigFile_save_encrypted_pass #-}

-- | Saves the contents of the @ConfigFile@ object to the AES-256 encrypted file specified as a parameter, using the provided @password@ to encrypt it. The output file uses an INI-style structure.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
bindConfigFile_save_encrypted_pass :: MethodBind
bindConfigFile_save_encrypted_pass
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "save_encrypted_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Saves the contents of the @ConfigFile@ object to the AES-256 encrypted file specified as a parameter, using the provided @password@ to encrypt it. The output file uses an INI-style structure.
--   				Returns one of the @enum Error@ code constants (@OK@ on success).
save_encrypted_pass ::
                      (ConfigFile :< cls, Object :< cls) =>
                      cls -> GodotString -> GodotString -> IO Int
save_encrypted_pass cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_save_encrypted_pass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "save_encrypted_pass"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.ConfigFile.save_encrypted_pass

{-# NOINLINE bindConfigFile_set_value #-}

-- | Assigns a value to the specified key of the specified section. If either the section or the key do not exist, they are created. Passing a @null@ value deletes the specified key if it exists, and deletes the section if it ends up empty once the key has been removed.
bindConfigFile_set_value :: MethodBind
bindConfigFile_set_value
  = unsafePerformIO $
      withCString "ConfigFile" $
        \ clsNamePtr ->
          withCString "set_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a value to the specified key of the specified section. If either the section or the key do not exist, they are created. Passing a @null@ value deletes the specified key if it exists, and deletes the section if it ends up empty once the key has been removed.
set_value ::
            (ConfigFile :< cls, Object :< cls) =>
            cls -> GodotString -> GodotString -> GodotVariant -> IO ()
set_value cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindConfigFile_set_value (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ConfigFile "set_value"
           '[GodotString, GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.ConfigFile.set_value