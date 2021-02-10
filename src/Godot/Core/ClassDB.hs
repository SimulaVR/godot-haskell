{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ClassDB
       (Godot.Core.ClassDB.can_instance, Godot.Core.ClassDB.class_exists,
        Godot.Core.ClassDB.class_get_category,
        Godot.Core.ClassDB.class_get_integer_constant,
        Godot.Core.ClassDB.class_get_integer_constant_list,
        Godot.Core.ClassDB.class_get_method_list,
        Godot.Core.ClassDB.class_get_property,
        Godot.Core.ClassDB.class_get_property_list,
        Godot.Core.ClassDB.class_get_signal,
        Godot.Core.ClassDB.class_get_signal_list,
        Godot.Core.ClassDB.class_has_integer_constant,
        Godot.Core.ClassDB.class_has_method,
        Godot.Core.ClassDB.class_has_signal,
        Godot.Core.ClassDB.class_set_property,
        Godot.Core.ClassDB.get_class_list,
        Godot.Core.ClassDB.get_inheriters_from_class,
        Godot.Core.ClassDB.get_parent_class, Godot.Core.ClassDB.instance',
        Godot.Core.ClassDB.is_class_enabled,
        Godot.Core.ClassDB.is_parent_class)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindClassDB_can_instance #-}

-- | Returns [code]true[/code] if you can instance objects from the specified [code]class[/code], [code]false[/code] in other case.
bindClassDB_can_instance :: MethodBind
bindClassDB_can_instance
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "can_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if you can instance objects from the specified [code]class[/code], [code]false[/code] in other case.
can_instance ::
               (ClassDB :< cls, Object :< cls) => cls -> GodotString -> IO Bool
can_instance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_can_instance (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_exists #-}

-- | Returns whether the specified [code]class[/code] is available or not.
bindClassDB_class_exists :: MethodBind
bindClassDB_class_exists
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the specified [code]class[/code] is available or not.
class_exists ::
               (ClassDB :< cls, Object :< cls) => cls -> GodotString -> IO Bool
class_exists cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_exists (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_get_category #-}

-- | Returns a category associated with the class for use in documentation and the Asset Library. Debug mode required.
bindClassDB_class_get_category :: MethodBind
bindClassDB_class_get_category
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_category" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a category associated with the class for use in documentation and the Asset Library. Debug mode required.
class_get_category ::
                     (ClassDB :< cls, Object :< cls) =>
                     cls -> GodotString -> IO GodotString
class_get_category cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_category (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_get_integer_constant #-}

-- | Returns the value of the integer constant [code]name[/code] of [code]class[/code] or its ancestry. Always returns 0 when the constant could not be found.
bindClassDB_class_get_integer_constant :: MethodBind
bindClassDB_class_get_integer_constant
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_integer_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the integer constant [code]name[/code] of [code]class[/code] or its ancestry. Always returns 0 when the constant could not be found.
class_get_integer_constant ::
                             (ClassDB :< cls, Object :< cls) =>
                             cls -> GodotString -> GodotString -> IO Int
class_get_integer_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_integer_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_get_integer_constant_list #-}

-- | Returns an array with the names all the integer constants of [code]class[/code] or its ancestry.
bindClassDB_class_get_integer_constant_list :: MethodBind
bindClassDB_class_get_integer_constant_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_integer_constant_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the names all the integer constants of [code]class[/code] or its ancestry.
class_get_integer_constant_list ::
                                  (ClassDB :< cls, Object :< cls) =>
                                  cls -> GodotString -> Bool -> IO PoolStringArray
class_get_integer_constant_list cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_integer_constant_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_get_method_list #-}

-- | Returns an array with all the methods of [code]class[/code] or its ancestry if [code]no_inheritance[/code] is [code]false[/code]. Every element of the array is a [Dictionary] with the following keys: [code]args[/code], [code]default_args[/code], [code]flags[/code], [code]id[/code], [code]name[/code], [code]return: (class_name, hint, hint_string, name, type, usage)[/code].
bindClassDB_class_get_method_list :: MethodBind
bindClassDB_class_get_method_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_method_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with all the methods of [code]class[/code] or its ancestry if [code]no_inheritance[/code] is [code]false[/code]. Every element of the array is a [Dictionary] with the following keys: [code]args[/code], [code]default_args[/code], [code]flags[/code], [code]id[/code], [code]name[/code], [code]return: (class_name, hint, hint_string, name, type, usage)[/code].
class_get_method_list ::
                        (ClassDB :< cls, Object :< cls) =>
                        cls -> GodotString -> Bool -> IO Array
class_get_method_list cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_method_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_get_property #-}

-- | Returns the value of [code]property[/code] of [code]class[/code] or its ancestry.
bindClassDB_class_get_property :: MethodBind
bindClassDB_class_get_property
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of [code]property[/code] of [code]class[/code] or its ancestry.
class_get_property ::
                     (ClassDB :< cls, Object :< cls) =>
                     cls -> Object -> GodotString -> IO GodotVariant
class_get_property cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_get_property_list #-}

-- | Returns an array with all the properties of [code]class[/code] or its ancestry if [code]no_inheritance[/code] is [code]false[/code].
bindClassDB_class_get_property_list :: MethodBind
bindClassDB_class_get_property_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_property_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with all the properties of [code]class[/code] or its ancestry if [code]no_inheritance[/code] is [code]false[/code].
class_get_property_list ::
                          (ClassDB :< cls, Object :< cls) =>
                          cls -> GodotString -> Bool -> IO Array
class_get_property_list cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_property_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_get_signal #-}

-- | Returns the [code]signal[/code] data of [code]class[/code] or its ancestry. The returned value is a [Dictionary] with the following keys: [code]args[/code], [code]default_args[/code], [code]flags[/code], [code]id[/code], [code]name[/code], [code]return: (class_name, hint, hint_string, name, type, usage)[/code].
bindClassDB_class_get_signal :: MethodBind
bindClassDB_class_get_signal
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [code]signal[/code] data of [code]class[/code] or its ancestry. The returned value is a [Dictionary] with the following keys: [code]args[/code], [code]default_args[/code], [code]flags[/code], [code]id[/code], [code]name[/code], [code]return: (class_name, hint, hint_string, name, type, usage)[/code].
class_get_signal ::
                   (ClassDB :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO Dictionary
class_get_signal cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_signal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_get_signal_list #-}

-- | Returns an array with all the signals of [code]class[/code] or its ancestry if [code]no_inheritance[/code] is [code]false[/code]. Every element of the array is a [Dictionary] as described in [method class_get_signal].
bindClassDB_class_get_signal_list :: MethodBind
bindClassDB_class_get_signal_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_signal_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with all the signals of [code]class[/code] or its ancestry if [code]no_inheritance[/code] is [code]false[/code]. Every element of the array is a [Dictionary] as described in [method class_get_signal].
class_get_signal_list ::
                        (ClassDB :< cls, Object :< cls) =>
                        cls -> GodotString -> Bool -> IO Array
class_get_signal_list cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_signal_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_has_integer_constant #-}

-- | Returns whether [code]class[/code] or its ancestry has an integer constant called [code]name[/code] or not.
bindClassDB_class_has_integer_constant :: MethodBind
bindClassDB_class_has_integer_constant
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_has_integer_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether [code]class[/code] or its ancestry has an integer constant called [code]name[/code] or not.
class_has_integer_constant ::
                             (ClassDB :< cls, Object :< cls) =>
                             cls -> GodotString -> GodotString -> IO Bool
class_has_integer_constant cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_has_integer_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_has_method #-}

-- | Returns whether [code]class[/code] (or its ancestry if [code]no_inheritance[/code] is [code]false[/code]) has a method called [code]method[/code] or not.
bindClassDB_class_has_method :: MethodBind
bindClassDB_class_has_method
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_has_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether [code]class[/code] (or its ancestry if [code]no_inheritance[/code] is [code]false[/code]) has a method called [code]method[/code] or not.
class_has_method ::
                   (ClassDB :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> Bool -> IO Bool
class_has_method cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_has_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_has_signal #-}

-- | Returns whether [code]class[/code] or its ancestry has a signal called [code]signal[/code] or not.
bindClassDB_class_has_signal :: MethodBind
bindClassDB_class_has_signal
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_has_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether [code]class[/code] or its ancestry has a signal called [code]signal[/code] or not.
class_has_signal ::
                   (ClassDB :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> IO Bool
class_has_signal cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_has_signal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_class_set_property #-}

-- | Sets [code]property[/code] value of [code]class[/code] to [code]value[/code].
bindClassDB_class_set_property :: MethodBind
bindClassDB_class_set_property
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_set_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets [code]property[/code] value of [code]class[/code] to [code]value[/code].
class_set_property ::
                     (ClassDB :< cls, Object :< cls) =>
                     cls -> Object -> GodotString -> GodotVariant -> IO Int
class_set_property cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_set_property (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_get_class_list #-}

-- | Returns the names of all the classes available.
bindClassDB_get_class_list :: MethodBind
bindClassDB_get_class_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "get_class_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the names of all the classes available.
get_class_list ::
                 (ClassDB :< cls, Object :< cls) => cls -> IO PoolStringArray
get_class_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_get_class_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_get_inheriters_from_class #-}

-- | Returns the names of all the classes that directly or indirectly inherit from [code]class[/code].
bindClassDB_get_inheriters_from_class :: MethodBind
bindClassDB_get_inheriters_from_class
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "get_inheriters_from_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the names of all the classes that directly or indirectly inherit from [code]class[/code].
get_inheriters_from_class ::
                            (ClassDB :< cls, Object :< cls) =>
                            cls -> GodotString -> IO PoolStringArray
get_inheriters_from_class cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_get_inheriters_from_class
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_get_parent_class #-}

-- | Returns the parent class of [code]class[/code].
bindClassDB_get_parent_class :: MethodBind
bindClassDB_get_parent_class
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "get_parent_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent class of [code]class[/code].
get_parent_class ::
                   (ClassDB :< cls, Object :< cls) =>
                   cls -> GodotString -> IO GodotString
get_parent_class cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_get_parent_class (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_instance' #-}

-- | Creates an instance of [code]class[/code].
bindClassDB_instance' :: MethodBind
bindClassDB_instance'
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an instance of [code]class[/code].
instance' ::
            (ClassDB :< cls, Object :< cls) =>
            cls -> GodotString -> IO GodotVariant
instance' cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_instance' (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_is_class_enabled #-}

-- | Returns whether this [code]class[/code] is enabled or not.
bindClassDB_is_class_enabled :: MethodBind
bindClassDB_is_class_enabled
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "is_class_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether this [code]class[/code] is enabled or not.
is_class_enabled ::
                   (ClassDB :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_class_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_is_class_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindClassDB_is_parent_class #-}

-- | Returns whether [code]inherits[/code] is an ancestor of [code]class[/code] or not.
bindClassDB_is_parent_class :: MethodBind
bindClassDB_is_parent_class
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "is_parent_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether [code]inherits[/code] is an ancestor of [code]class[/code] or not.
is_parent_class ::
                  (ClassDB :< cls, Object :< cls) =>
                  cls -> GodotString -> GodotString -> IO Bool
is_parent_class cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_is_parent_class (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)