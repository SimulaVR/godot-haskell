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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Object()

{-# NOINLINE bindClassDB_can_instance #-}

-- | Returns @true@ if you can instance objects from the specified @class@, @false@ in other case.
bindClassDB_can_instance :: MethodBind
bindClassDB_can_instance
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "can_instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if you can instance objects from the specified @class@, @false@ in other case.
can_instance ::
               (ClassDB :< cls, Object :< cls) => cls -> GodotString -> IO Bool
can_instance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_can_instance (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "can_instance" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.ClassDB.can_instance

{-# NOINLINE bindClassDB_class_exists #-}

-- | Returns whether the specified @class@ is available or not.
bindClassDB_class_exists :: MethodBind
bindClassDB_class_exists
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_exists" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether the specified @class@ is available or not.
class_exists ::
               (ClassDB :< cls, Object :< cls) => cls -> GodotString -> IO Bool
class_exists cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_exists (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "class_exists" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.ClassDB.class_exists

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

instance NodeMethod ClassDB "class_get_category" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ClassDB.class_get_category

{-# NOINLINE bindClassDB_class_get_integer_constant #-}

-- | Returns the value of the integer constant @name@ of @class@ or its ancestry. Always returns 0 when the constant could not be found.
bindClassDB_class_get_integer_constant :: MethodBind
bindClassDB_class_get_integer_constant
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_integer_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of the integer constant @name@ of @class@ or its ancestry. Always returns 0 when the constant could not be found.
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

instance NodeMethod ClassDB "class_get_integer_constant"
           '[GodotString, GodotString]
           (IO Int)
         where
        nodeMethod = Godot.Core.ClassDB.class_get_integer_constant

{-# NOINLINE bindClassDB_class_get_integer_constant_list #-}

-- | Returns an array with the names all the integer constants of @class@ or its ancestry.
bindClassDB_class_get_integer_constant_list :: MethodBind
bindClassDB_class_get_integer_constant_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_integer_constant_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with the names all the integer constants of @class@ or its ancestry.
class_get_integer_constant_list ::
                                  (ClassDB :< cls, Object :< cls) =>
                                  cls -> GodotString -> Maybe Bool -> IO PoolStringArray
class_get_integer_constant_list cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_integer_constant_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "class_get_integer_constant_list"
           '[GodotString, Maybe Bool]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.ClassDB.class_get_integer_constant_list

{-# NOINLINE bindClassDB_class_get_method_list #-}

-- | Returns an array with all the methods of @class@ or its ancestry if @no_inheritance@ is @false@. Every element of the array is a @Dictionary@ with the following keys: @args@, @default_args@, @flags@, @id@, @name@, @return: (class_name, hint, hint_string, name, type, usage)@.
--   				__Note:__ In exported release builds the debug info is not available, so the returned dictionaries will contain only method names.
bindClassDB_class_get_method_list :: MethodBind
bindClassDB_class_get_method_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_method_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with all the methods of @class@ or its ancestry if @no_inheritance@ is @false@. Every element of the array is a @Dictionary@ with the following keys: @args@, @default_args@, @flags@, @id@, @name@, @return: (class_name, hint, hint_string, name, type, usage)@.
--   				__Note:__ In exported release builds the debug info is not available, so the returned dictionaries will contain only method names.
class_get_method_list ::
                        (ClassDB :< cls, Object :< cls) =>
                        cls -> GodotString -> Maybe Bool -> IO Array
class_get_method_list cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_method_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "class_get_method_list"
           '[GodotString, Maybe Bool]
           (IO Array)
         where
        nodeMethod = Godot.Core.ClassDB.class_get_method_list

{-# NOINLINE bindClassDB_class_get_property #-}

-- | Returns the value of @property@ of @class@ or its ancestry.
bindClassDB_class_get_property :: MethodBind
bindClassDB_class_get_property
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of @property@ of @class@ or its ancestry.
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

instance NodeMethod ClassDB "class_get_property"
           '[Object, GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.ClassDB.class_get_property

{-# NOINLINE bindClassDB_class_get_property_list #-}

-- | Returns an array with all the properties of @class@ or its ancestry if @no_inheritance@ is @false@.
bindClassDB_class_get_property_list :: MethodBind
bindClassDB_class_get_property_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_property_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with all the properties of @class@ or its ancestry if @no_inheritance@ is @false@.
class_get_property_list ::
                          (ClassDB :< cls, Object :< cls) =>
                          cls -> GodotString -> Maybe Bool -> IO Array
class_get_property_list cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_property_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "class_get_property_list"
           '[GodotString, Maybe Bool]
           (IO Array)
         where
        nodeMethod = Godot.Core.ClassDB.class_get_property_list

{-# NOINLINE bindClassDB_class_get_signal #-}

-- | Returns the @signal@ data of @class@ or its ancestry. The returned value is a @Dictionary@ with the following keys: @args@, @default_args@, @flags@, @id@, @name@, @return: (class_name, hint, hint_string, name, type, usage)@.
bindClassDB_class_get_signal :: MethodBind
bindClassDB_class_get_signal
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @signal@ data of @class@ or its ancestry. The returned value is a @Dictionary@ with the following keys: @args@, @default_args@, @flags@, @id@, @name@, @return: (class_name, hint, hint_string, name, type, usage)@.
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

instance NodeMethod ClassDB "class_get_signal"
           '[GodotString, GodotString]
           (IO Dictionary)
         where
        nodeMethod = Godot.Core.ClassDB.class_get_signal

{-# NOINLINE bindClassDB_class_get_signal_list #-}

-- | Returns an array with all the signals of @class@ or its ancestry if @no_inheritance@ is @false@. Every element of the array is a @Dictionary@ as described in @method class_get_signal@.
bindClassDB_class_get_signal_list :: MethodBind
bindClassDB_class_get_signal_list
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_get_signal_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array with all the signals of @class@ or its ancestry if @no_inheritance@ is @false@. Every element of the array is a @Dictionary@ as described in @method class_get_signal@.
class_get_signal_list ::
                        (ClassDB :< cls, Object :< cls) =>
                        cls -> GodotString -> Maybe Bool -> IO Array
class_get_signal_list cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_get_signal_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "class_get_signal_list"
           '[GodotString, Maybe Bool]
           (IO Array)
         where
        nodeMethod = Godot.Core.ClassDB.class_get_signal_list

{-# NOINLINE bindClassDB_class_has_integer_constant #-}

-- | Returns whether @class@ or its ancestry has an integer constant called @name@ or not.
bindClassDB_class_has_integer_constant :: MethodBind
bindClassDB_class_has_integer_constant
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_has_integer_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether @class@ or its ancestry has an integer constant called @name@ or not.
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

instance NodeMethod ClassDB "class_has_integer_constant"
           '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ClassDB.class_has_integer_constant

{-# NOINLINE bindClassDB_class_has_method #-}

-- | Returns whether @class@ (or its ancestry if @no_inheritance@ is @false@) has a method called @method@ or not.
bindClassDB_class_has_method :: MethodBind
bindClassDB_class_has_method
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_has_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether @class@ (or its ancestry if @no_inheritance@ is @false@) has a method called @method@ or not.
class_has_method ::
                   (ClassDB :< cls, Object :< cls) =>
                   cls -> GodotString -> GodotString -> Maybe Bool -> IO Bool
class_has_method cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_class_has_method (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "class_has_method"
           '[GodotString, GodotString, Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ClassDB.class_has_method

{-# NOINLINE bindClassDB_class_has_signal #-}

-- | Returns whether @class@ or its ancestry has a signal called @signal@ or not.
bindClassDB_class_has_signal :: MethodBind
bindClassDB_class_has_signal
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_has_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether @class@ or its ancestry has a signal called @signal@ or not.
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

instance NodeMethod ClassDB "class_has_signal"
           '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ClassDB.class_has_signal

{-# NOINLINE bindClassDB_class_set_property #-}

-- | Sets @property@ value of @class@ to @value@.
bindClassDB_class_set_property :: MethodBind
bindClassDB_class_set_property
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "class_set_property" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets @property@ value of @class@ to @value@.
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

instance NodeMethod ClassDB "class_set_property"
           '[Object, GodotString, GodotVariant]
           (IO Int)
         where
        nodeMethod = Godot.Core.ClassDB.class_set_property

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

instance NodeMethod ClassDB "get_class_list" '[]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.ClassDB.get_class_list

{-# NOINLINE bindClassDB_get_inheriters_from_class #-}

-- | Returns the names of all the classes that directly or indirectly inherit from @class@.
bindClassDB_get_inheriters_from_class :: MethodBind
bindClassDB_get_inheriters_from_class
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "get_inheriters_from_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the names of all the classes that directly or indirectly inherit from @class@.
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

instance NodeMethod ClassDB "get_inheriters_from_class"
           '[GodotString]
           (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.ClassDB.get_inheriters_from_class

{-# NOINLINE bindClassDB_get_parent_class #-}

-- | Returns the parent class of @class@.
bindClassDB_get_parent_class :: MethodBind
bindClassDB_get_parent_class
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "get_parent_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parent class of @class@.
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

instance NodeMethod ClassDB "get_parent_class" '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.ClassDB.get_parent_class

{-# NOINLINE bindClassDB_instance' #-}

-- | Creates an instance of @class@.
bindClassDB_instance' :: MethodBind
bindClassDB_instance'
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "instance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an instance of @class@.
instance' ::
            (ClassDB :< cls, Object :< cls) =>
            cls -> GodotString -> IO GodotVariant
instance' cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_instance' (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "instance" '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.ClassDB.instance'

{-# NOINLINE bindClassDB_is_class_enabled #-}

-- | Returns whether this @class@ is enabled or not.
bindClassDB_is_class_enabled :: MethodBind
bindClassDB_is_class_enabled
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "is_class_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether this @class@ is enabled or not.
is_class_enabled ::
                   (ClassDB :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_class_enabled cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindClassDB_is_class_enabled (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ClassDB "is_class_enabled" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ClassDB.is_class_enabled

{-# NOINLINE bindClassDB_is_parent_class #-}

-- | Returns whether @inherits@ is an ancestor of @class@ or not.
bindClassDB_is_parent_class :: MethodBind
bindClassDB_is_parent_class
  = unsafePerformIO $
      withCString "_ClassDB" $
        \ clsNamePtr ->
          withCString "is_parent_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns whether @inherits@ is an ancestor of @class@ or not.
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

instance NodeMethod ClassDB "is_parent_class"
           '[GodotString, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.ClassDB.is_parent_class