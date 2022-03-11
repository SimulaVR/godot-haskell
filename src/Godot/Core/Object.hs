{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Object
       (Godot.Core.Object._CONNECT_REFERENCE_COUNTED,
        Godot.Core.Object._CONNECT_DEFERRED,
        Godot.Core.Object._NOTIFICATION_POSTINITIALIZE,
        Godot.Core.Object._CONNECT_ONESHOT,
        Godot.Core.Object._CONNECT_PERSIST,
        Godot.Core.Object._NOTIFICATION_PREDELETE,
        Godot.Core.Object.sig_script_changed, Godot.Core.Object._get,
        Godot.Core.Object._get_property_list, Godot.Core.Object._init,
        Godot.Core.Object._notification, Godot.Core.Object._set,
        Godot.Core.Object._to_string, Godot.Core.Object.add_user_signal,
        Godot.Core.Object.call, Godot.Core.Object.call_deferred,
        Godot.Core.Object.callv, Godot.Core.Object.can_translate_messages,
        Godot.Core.Object.connect, Godot.Core.Object.disconnect,
        Godot.Core.Object.emit_signal, Godot.Core.Object.free,
        Godot.Core.Object.get, Godot.Core.Object.get_class,
        Godot.Core.Object.get_incoming_connections,
        Godot.Core.Object.get_indexed, Godot.Core.Object.get_instance_id,
        Godot.Core.Object.get_meta, Godot.Core.Object.get_meta_list,
        Godot.Core.Object.get_method_list,
        Godot.Core.Object.get_property_list, Godot.Core.Object.get_script,
        Godot.Core.Object.get_signal_connection_list,
        Godot.Core.Object.get_signal_list, Godot.Core.Object.has_meta,
        Godot.Core.Object.has_method, Godot.Core.Object.has_user_signal,
        Godot.Core.Object.is_blocking_signals, Godot.Core.Object.is_class,
        Godot.Core.Object.is_connected,
        Godot.Core.Object.is_queued_for_deletion,
        Godot.Core.Object.notification,
        Godot.Core.Object.property_list_changed_notify,
        Godot.Core.Object.remove_meta, Godot.Core.Object.set,
        Godot.Core.Object.set_block_signals,
        Godot.Core.Object.set_deferred, Godot.Core.Object.set_indexed,
        Godot.Core.Object.set_message_translation,
        Godot.Core.Object.set_meta, Godot.Core.Object.set_script,
        Godot.Core.Object.to_string, Godot.Core.Object.tr)
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

_CONNECT_REFERENCE_COUNTED :: Int
_CONNECT_REFERENCE_COUNTED = 8

_CONNECT_DEFERRED :: Int
_CONNECT_DEFERRED = 1

_NOTIFICATION_POSTINITIALIZE :: Int
_NOTIFICATION_POSTINITIALIZE = 0

_CONNECT_ONESHOT :: Int
_CONNECT_ONESHOT = 4

_CONNECT_PERSIST :: Int
_CONNECT_PERSIST = 2

_NOTIFICATION_PREDELETE :: Int
_NOTIFICATION_PREDELETE = 1

-- | Emitted whenever the object's script is changed.
sig_script_changed :: Godot.Internal.Dispatch.Signal Object
sig_script_changed
  = Godot.Internal.Dispatch.Signal "script_changed"

instance NodeSignal Object "script_changed" '[]

{-# NOINLINE bindObject__get #-}

-- | Virtual method which can be overridden to customize the return value of @method get@.
--   				Returns the given property. Returns @null@ if the @property@ does not exist.
bindObject__get :: MethodBind
bindObject__get
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_get" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Virtual method which can be overridden to customize the return value of @method get@.
--   				Returns the given property. Returns @null@ if the @property@ does not exist.
_get ::
       (Object :< cls, Object :< cls) =>
       cls -> GodotString -> IO GodotVariant
_get cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__get (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "_get" '[GodotString] (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Object._get

{-# NOINLINE bindObject__get_property_list #-}

-- | Virtual method which can be overridden to customize the return value of @method get_property_list@.
--   				Returns the object's property list as an @Array@ of dictionaries.
--   				Each property's @Dictionary@ must contain at least @name: String@ and @type: int@ (see @enum Variant.Type@) entries. Optionally, it can also include @hint: int@ (see @enum PropertyHint@), @hint_string: String@, and @usage: int@ (see @enum PropertyUsageFlags@).
bindObject__get_property_list :: MethodBind
bindObject__get_property_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_get_property_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Virtual method which can be overridden to customize the return value of @method get_property_list@.
--   				Returns the object's property list as an @Array@ of dictionaries.
--   				Each property's @Dictionary@ must contain at least @name: String@ and @type: int@ (see @enum Variant.Type@) entries. Optionally, it can also include @hint: int@ (see @enum PropertyHint@), @hint_string: String@, and @usage: int@ (see @enum PropertyUsageFlags@).
_get_property_list ::
                     (Object :< cls, Object :< cls) => cls -> IO Array
_get_property_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__get_property_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "_get_property_list" '[] (IO Array)
         where
        nodeMethod = Godot.Core.Object._get_property_list

{-# NOINLINE bindObject__init #-}

-- | Called when the object is initialized.
bindObject__init :: MethodBind
bindObject__init
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_init" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called when the object is initialized.
_init :: (Object :< cls, Object :< cls) => cls -> IO ()
_init cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__init (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "_init" '[] (IO ()) where
        nodeMethod = Godot.Core.Object._init

{-# NOINLINE bindObject__notification #-}

-- | Called whenever the object receives a notification, which is identified in @what@ by a constant. The base @Object@ has two constants @NOTIFICATION_POSTINITIALIZE@ and @NOTIFICATION_PREDELETE@, but subclasses such as @Node@ define a lot more notifications which are also received by this method.
bindObject__notification :: MethodBind
bindObject__notification
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called whenever the object receives a notification, which is identified in @what@ by a constant. The base @Object@ has two constants @NOTIFICATION_POSTINITIALIZE@ and @NOTIFICATION_PREDELETE@, but subclasses such as @Node@ define a lot more notifications which are also received by this method.
_notification ::
                (Object :< cls, Object :< cls) => cls -> Int -> IO ()
_notification cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__notification (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "_notification" '[Int] (IO ()) where
        nodeMethod = Godot.Core.Object._notification

{-# NOINLINE bindObject__set #-}

-- | Virtual method which can be overridden to customize the return value of @method set@.
--   				Sets a property. Returns @true@ if the @property@ exists.
bindObject__set :: MethodBind
bindObject__set
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_set" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Virtual method which can be overridden to customize the return value of @method set@.
--   				Sets a property. Returns @true@ if the @property@ exists.
_set ::
       (Object :< cls, Object :< cls) =>
       cls -> GodotString -> GodotVariant -> IO Bool
_set cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__set (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "_set" '[GodotString, GodotVariant]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Object._set

{-# NOINLINE bindObject__to_string #-}

-- | Virtual method which can be overridden to customize the return value of @method to_string@, and thus the object's representation where it is converted to a string, e.g. with @print(obj)@.
--   				Returns a @String@ representing the object. If not overridden, defaults to @"@ClassName:RID@"@.
bindObject__to_string :: MethodBind
bindObject__to_string
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_to_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Virtual method which can be overridden to customize the return value of @method to_string@, and thus the object's representation where it is converted to a string, e.g. with @print(obj)@.
--   				Returns a @String@ representing the object. If not overridden, defaults to @"@ClassName:RID@"@.
_to_string ::
             (Object :< cls, Object :< cls) => cls -> IO GodotString
_to_string cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__to_string (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "_to_string" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Object._to_string

{-# NOINLINE bindObject_add_user_signal #-}

-- | Adds a user-defined @signal@. Arguments are optional, but can be added as an @Array@ of dictionaries, each containing @name: String@ and @type: int@ (see @enum Variant.Type@) entries.
bindObject_add_user_signal :: MethodBind
bindObject_add_user_signal
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "add_user_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a user-defined @signal@. Arguments are optional, but can be added as an @Array@ of dictionaries, each containing @name: String@ and @type: int@ (see @enum Variant.Type@) entries.
add_user_signal ::
                  (Object :< cls, Object :< cls) =>
                  cls -> GodotString -> Maybe Array -> IO ()
add_user_signal cls arg1 arg2
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantArray V.empty arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_add_user_signal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "add_user_signal"
           '[GodotString, Maybe Array]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.add_user_signal

{-# NOINLINE bindObject_call #-}

-- | Calls the @method@ on the object and returns the result. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				
--   @
--   
--   				call("set", "position", Vector2(42.0, 0.0))
--   				
--   @
--   
--   				__Note:__ In C#, the method name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined methods where you should use the same convention as in the C# source (typically PascalCase).
bindObject_call :: MethodBind
bindObject_call
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "call" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the @method@ on the object and returns the result. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				
--   @
--   
--   				call("set", "position", Vector2(42.0, 0.0))
--   				
--   @
--   
--   				__Note:__ In C#, the method name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined methods where you should use the same convention as in the C# source (typically PascalCase).
call ::
       (Object :< cls, Object :< cls) =>
       cls -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
call cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_call (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "call"
           '[GodotString, [Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Object.call

{-# NOINLINE bindObject_call_deferred #-}

-- | Calls the @method@ on the object during idle time. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				
--   @
--   
--   				call_deferred("set", "position", Vector2(42.0, 0.0))
--   				
--   @
--   
--   				__Note:__ In C#, the method name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined methods where you should use the same convention as in the C# source (typically PascalCase).
bindObject_call_deferred :: MethodBind
bindObject_call_deferred
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "call_deferred" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the @method@ on the object during idle time. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				
--   @
--   
--   				call_deferred("set", "position", Vector2(42.0, 0.0))
--   				
--   @
--   
--   				__Note:__ In C#, the method name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined methods where you should use the same convention as in the C# source (typically PascalCase).
call_deferred ::
                (Object :< cls, Object :< cls) =>
                cls -> GodotString -> [Variant 'GodotTy] -> IO ()
call_deferred cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_call_deferred (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "call_deferred"
           '[GodotString, [Variant 'GodotTy]]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.call_deferred

{-# NOINLINE bindObject_callv #-}

-- | Calls the @method@ on the object and returns the result. Contrarily to @method call@, this method does not support a variable number of arguments but expects all parameters to be via a single @Array@.
--   				
--   @
--   
--   				callv("set", @ "position", Vector2(42.0, 0.0) @)
--   				
--   @
bindObject_callv :: MethodBind
bindObject_callv
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "callv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the @method@ on the object and returns the result. Contrarily to @method call@, this method does not support a variable number of arguments but expects all parameters to be via a single @Array@.
--   				
--   @
--   
--   				callv("set", @ "position", Vector2(42.0, 0.0) @)
--   				
--   @
callv ::
        (Object :< cls, Object :< cls) =>
        cls -> GodotString -> Array -> IO GodotVariant
callv cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_callv (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "callv" '[GodotString, Array]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Object.callv

{-# NOINLINE bindObject_can_translate_messages #-}

-- | Returns @true@ if the object can translate strings. See @method set_message_translation@ and @method tr@.
bindObject_can_translate_messages :: MethodBind
bindObject_can_translate_messages
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "can_translate_messages" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the object can translate strings. See @method set_message_translation@ and @method tr@.
can_translate_messages ::
                         (Object :< cls, Object :< cls) => cls -> IO Bool
can_translate_messages cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_can_translate_messages
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "can_translate_messages" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Object.can_translate_messages

{-# NOINLINE bindObject_connect #-}

-- | Connects a @signal@ to a @method@ on a @target@ object. Pass optional @binds@ to the call as an @Array@ of parameters. These parameters will be passed to the method after any parameter used in the call to @method emit_signal@. Use @flags@ to set deferred or one-shot connections. See @enum ConnectFlags@ constants.
--   				A @signal@ can only be connected once to a @method@. It will throw an error if already connected, unless the signal was connected with @CONNECT_REFERENCE_COUNTED@. To avoid this, first, use @method is_connected@ to check for existing connections.
--   				If the @target@ is destroyed in the game's lifecycle, the connection will be lost.
--   				Examples:
--   				
--   @
--   
--   				connect("pressed", self, "_on_Button_pressed") # BaseButton signal
--   				connect("text_entered", self, "_on_LineEdit_text_entered") # LineEdit signal
--   				connect("hit", self, "_on_Player_hit", @ weapon_type, damage @) # User-defined signal
--   				
--   @
--   
--   				An example of the relationship between @binds@ passed to @method connect@ and parameters used when calling @method emit_signal@:
--   				
--   @
--   
--   				connect("hit", self, "_on_Player_hit", @ weapon_type, damage @) # weapon_type and damage are passed last
--   				emit_signal("hit", "Dark lord", 5) # "Dark lord" and 5 are passed first
--   				func _on_Player_hit(hit_by, level, weapon_type, damage):
--   				    print("Hit by %s (lvl %d) with weapon %s for %d damage" % @hit_by, level, weapon_type, damage@)
--   				
--   @
bindObject_connect :: MethodBind
bindObject_connect
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "connect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects a @signal@ to a @method@ on a @target@ object. Pass optional @binds@ to the call as an @Array@ of parameters. These parameters will be passed to the method after any parameter used in the call to @method emit_signal@. Use @flags@ to set deferred or one-shot connections. See @enum ConnectFlags@ constants.
--   				A @signal@ can only be connected once to a @method@. It will throw an error if already connected, unless the signal was connected with @CONNECT_REFERENCE_COUNTED@. To avoid this, first, use @method is_connected@ to check for existing connections.
--   				If the @target@ is destroyed in the game's lifecycle, the connection will be lost.
--   				Examples:
--   				
--   @
--   
--   				connect("pressed", self, "_on_Button_pressed") # BaseButton signal
--   				connect("text_entered", self, "_on_LineEdit_text_entered") # LineEdit signal
--   				connect("hit", self, "_on_Player_hit", @ weapon_type, damage @) # User-defined signal
--   				
--   @
--   
--   				An example of the relationship between @binds@ passed to @method connect@ and parameters used when calling @method emit_signal@:
--   				
--   @
--   
--   				connect("hit", self, "_on_Player_hit", @ weapon_type, damage @) # weapon_type and damage are passed last
--   				emit_signal("hit", "Dark lord", 5) # "Dark lord" and 5 are passed first
--   				func _on_Player_hit(hit_by, level, weapon_type, damage):
--   				    print("Hit by %s (lvl %d) with weapon %s for %d damage" % @hit_by, level, weapon_type, damage@)
--   				
--   @
connect ::
          (Object :< cls, Object :< cls) =>
          cls ->
            GodotString ->
              Object -> GodotString -> Maybe Array -> Maybe Int -> IO Int
connect cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       defaultedVariant VariantArray V.empty arg4,
       maybe (VariantInt (0)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_connect (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "connect"
           '[GodotString, Object, GodotString, Maybe Array, Maybe Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.Object.connect

{-# NOINLINE bindObject_disconnect #-}

-- | Disconnects a @signal@ from a @method@ on the given @target@.
--   				If you try to disconnect a connection that does not exist, the method will throw an error. Use @method is_connected@ to ensure that the connection exists.
bindObject_disconnect :: MethodBind
bindObject_disconnect
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "disconnect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disconnects a @signal@ from a @method@ on the given @target@.
--   				If you try to disconnect a connection that does not exist, the method will throw an error. Use @method is_connected@ to ensure that the connection exists.
disconnect ::
             (Object :< cls, Object :< cls) =>
             cls -> GodotString -> Object -> GodotString -> IO ()
disconnect cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_disconnect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "disconnect"
           '[GodotString, Object, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.disconnect

{-# NOINLINE bindObject_emit_signal #-}

-- | Emits the given @signal@. The signal must exist, so it should be a built-in signal of this class or one of its parent classes, or a user-defined signal. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				
--   @
--   
--   				emit_signal("hit", weapon_type, damage)
--   				emit_signal("game_over")
--   				
--   @
bindObject_emit_signal :: MethodBind
bindObject_emit_signal
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "emit_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emits the given @signal@. The signal must exist, so it should be a built-in signal of this class or one of its parent classes, or a user-defined signal. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				
--   @
--   
--   				emit_signal("hit", weapon_type, damage)
--   				emit_signal("game_over")
--   				
--   @
emit_signal ::
              (Object :< cls, Object :< cls) =>
              cls -> GodotString -> [Variant 'GodotTy] -> IO ()
emit_signal cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_emit_signal (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "emit_signal"
           '[GodotString, [Variant 'GodotTy]]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.emit_signal

{-# NOINLINE bindObject_free #-}

-- | Deletes the object from memory immediately. For @Node@s, you may want to use @method Node.queue_free@ to queue the node for safe deletion at the end of the current frame.
--   				__Important:__ If you have a variable pointing to an object, it will @i@not@/i@ be assigned to @null@ once the object is freed. Instead, it will point to a @i@previously freed instance@/i@ and you should validate it with @method @GDScript.is_instance_valid@ before attempting to call its methods or access its properties.
bindObject_free :: MethodBind
bindObject_free
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "free" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the object from memory immediately. For @Node@s, you may want to use @method Node.queue_free@ to queue the node for safe deletion at the end of the current frame.
--   				__Important:__ If you have a variable pointing to an object, it will @i@not@/i@ be assigned to @null@ once the object is freed. Instead, it will point to a @i@previously freed instance@/i@ and you should validate it with @method @GDScript.is_instance_valid@ before attempting to call its methods or access its properties.
free :: (Object :< cls, Object :< cls) => cls -> IO ()
free cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_free (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "free" '[] (IO ()) where
        nodeMethod = Godot.Core.Object.free

{-# NOINLINE bindObject_get #-}

-- | Returns the @Variant@ value of the given @property@. If the @property@ doesn't exist, this will return @null@.
--   				__Note:__ In C#, the property name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined properties where you should use the same convention as in the C# source (typically PascalCase).
bindObject_get :: MethodBind
bindObject_get
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Variant@ value of the given @property@. If the @property@ doesn't exist, this will return @null@.
--   				__Note:__ In C#, the property name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined properties where you should use the same convention as in the C# source (typically PascalCase).
get ::
      (Object :< cls, Object :< cls) =>
      cls -> GodotString -> IO GodotVariant
get cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get" '[GodotString] (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Object.get

{-# NOINLINE bindObject_get_class #-}

-- | Returns the object's class as a @String@. See also @method is_class@.
--   				__Note:__ @method get_class@ does not take @class_name@ declarations into account. If the object has a @class_name@ defined, the base class name will be returned instead.
bindObject_get_class :: MethodBind
bindObject_get_class
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's class as a @String@. See also @method is_class@.
--   				__Note:__ @method get_class@ does not take @class_name@ declarations into account. If the object has a @class_name@ defined, the base class name will be returned instead.
get_class ::
            (Object :< cls, Object :< cls) => cls -> IO GodotString
get_class cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_class (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_class" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Object.get_class

{-# NOINLINE bindObject_get_incoming_connections #-}

-- | Returns an @Array@ of dictionaries with information about signals that are connected to the object.
--   				Each @Dictionary@ contains three String entries:
--   				- @source@ is a reference to the signal emitter.
--   				- @signal_name@ is the name of the connected signal.
--   				- @method_name@ is the name of the method to which the signal is connected.
bindObject_get_incoming_connections :: MethodBind
bindObject_get_incoming_connections
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_incoming_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of dictionaries with information about signals that are connected to the object.
--   				Each @Dictionary@ contains three String entries:
--   				- @source@ is a reference to the signal emitter.
--   				- @signal_name@ is the name of the connected signal.
--   				- @method_name@ is the name of the method to which the signal is connected.
get_incoming_connections ::
                           (Object :< cls, Object :< cls) => cls -> IO Array
get_incoming_connections cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_incoming_connections
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_incoming_connections" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.Object.get_incoming_connections

{-# NOINLINE bindObject_get_indexed #-}

-- | Gets the object's property indexed by the given @NodePath@. The node path should be relative to the current object and can use the colon character (@:@) to access nested properties. Examples: @"position:x"@ or @"material:next_pass:blend_mode"@.
--   				__Note:__ Even though the method takes @NodePath@ argument, it doesn't support actual paths to @Node@s in the scene tree, only colon-separated sub-property paths. For the purpose of nodes, use @method Node.get_node_and_resource@ instead.
bindObject_get_indexed :: MethodBind
bindObject_get_indexed
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_indexed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the object's property indexed by the given @NodePath@. The node path should be relative to the current object and can use the colon character (@:@) to access nested properties. Examples: @"position:x"@ or @"material:next_pass:blend_mode"@.
--   				__Note:__ Even though the method takes @NodePath@ argument, it doesn't support actual paths to @Node@s in the scene tree, only colon-separated sub-property paths. For the purpose of nodes, use @method Node.get_node_and_resource@ instead.
get_indexed ::
              (Object :< cls, Object :< cls) =>
              cls -> NodePath -> IO GodotVariant
get_indexed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_indexed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_indexed" '[NodePath]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Object.get_indexed

{-# NOINLINE bindObject_get_instance_id #-}

-- | Returns the object's unique instance ID.
--   				This ID can be saved in @EncodedObjectAsID@, and can be used to retrieve the object instance with @method @GDScript.instance_from_id@.
bindObject_get_instance_id :: MethodBind
bindObject_get_instance_id
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's unique instance ID.
--   				This ID can be saved in @EncodedObjectAsID@, and can be used to retrieve the object instance with @method @GDScript.instance_from_id@.
get_instance_id :: (Object :< cls, Object :< cls) => cls -> IO Int
get_instance_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_instance_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_instance_id" '[] (IO Int) where
        nodeMethod = Godot.Core.Object.get_instance_id

{-# NOINLINE bindObject_get_meta #-}

-- | Returns the object's metadata entry for the given @name@.
bindObject_get_meta :: MethodBind
bindObject_get_meta
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's metadata entry for the given @name@.
get_meta ::
           (Object :< cls, Object :< cls) =>
           cls -> GodotString -> IO GodotVariant
get_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_meta (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_meta" '[GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Object.get_meta

{-# NOINLINE bindObject_get_meta_list #-}

-- | Returns the object's metadata as a @PoolStringArray@.
bindObject_get_meta_list :: MethodBind
bindObject_get_meta_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_meta_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's metadata as a @PoolStringArray@.
get_meta_list ::
                (Object :< cls, Object :< cls) => cls -> IO PoolStringArray
get_meta_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_meta_list (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_meta_list" '[] (IO PoolStringArray)
         where
        nodeMethod = Godot.Core.Object.get_meta_list

{-# NOINLINE bindObject_get_method_list #-}

-- | Returns the object's methods and their signatures as an @Array@.
bindObject_get_method_list :: MethodBind
bindObject_get_method_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_method_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's methods and their signatures as an @Array@.
get_method_list ::
                  (Object :< cls, Object :< cls) => cls -> IO Array
get_method_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_method_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_method_list" '[] (IO Array) where
        nodeMethod = Godot.Core.Object.get_method_list

{-# NOINLINE bindObject_get_property_list #-}

-- | Returns the object's property list as an @Array@ of dictionaries.
--   				Each property's @Dictionary@ contain at least @name: String@ and @type: int@ (see @enum Variant.Type@) entries. Optionally, it can also include @hint: int@ (see @enum PropertyHint@), @hint_string: String@, and @usage: int@ (see @enum PropertyUsageFlags@).
bindObject_get_property_list :: MethodBind
bindObject_get_property_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_property_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's property list as an @Array@ of dictionaries.
--   				Each property's @Dictionary@ contain at least @name: String@ and @type: int@ (see @enum Variant.Type@) entries. Optionally, it can also include @hint: int@ (see @enum PropertyHint@), @hint_string: String@, and @usage: int@ (see @enum PropertyUsageFlags@).
get_property_list ::
                    (Object :< cls, Object :< cls) => cls -> IO Array
get_property_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_property_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_property_list" '[] (IO Array) where
        nodeMethod = Godot.Core.Object.get_property_list

{-# NOINLINE bindObject_get_script #-}

-- | Returns the object's @Script@ instance, or @null@ if none is assigned.
bindObject_get_script :: MethodBind
bindObject_get_script
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's @Script@ instance, or @null@ if none is assigned.
get_script :: (Object :< cls, Object :< cls) => cls -> IO Reference
get_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_script (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_script" '[] (IO Reference) where
        nodeMethod = Godot.Core.Object.get_script

{-# NOINLINE bindObject_get_signal_connection_list #-}

-- | Returns an @Array@ of connections for the given @signal@.
bindObject_get_signal_connection_list :: MethodBind
bindObject_get_signal_connection_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_signal_connection_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Array@ of connections for the given @signal@.
get_signal_connection_list ::
                             (Object :< cls, Object :< cls) => cls -> GodotString -> IO Array
get_signal_connection_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_signal_connection_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_signal_connection_list"
           '[GodotString]
           (IO Array)
         where
        nodeMethod = Godot.Core.Object.get_signal_connection_list

{-# NOINLINE bindObject_get_signal_list #-}

-- | Returns the list of signals as an @Array@ of dictionaries.
bindObject_get_signal_list :: MethodBind
bindObject_get_signal_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_signal_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of signals as an @Array@ of dictionaries.
get_signal_list ::
                  (Object :< cls, Object :< cls) => cls -> IO Array
get_signal_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_signal_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "get_signal_list" '[] (IO Array) where
        nodeMethod = Godot.Core.Object.get_signal_list

{-# NOINLINE bindObject_has_meta #-}

-- | Returns @true@ if a metadata entry is found with the given @name@.
bindObject_has_meta :: MethodBind
bindObject_has_meta
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "has_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a metadata entry is found with the given @name@.
has_meta ::
           (Object :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_has_meta (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "has_meta" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.Object.has_meta

{-# NOINLINE bindObject_has_method #-}

-- | Returns @true@ if the object contains the given @method@.
bindObject_has_method :: MethodBind
bindObject_has_method
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "has_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the object contains the given @method@.
has_method ::
             (Object :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_method cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_has_method (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "has_method" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.Object.has_method

{-# NOINLINE bindObject_has_user_signal #-}

-- | Returns @true@ if the given user-defined @signal@ exists. Only signals added using @method add_user_signal@ are taken into account.
bindObject_has_user_signal :: MethodBind
bindObject_has_user_signal
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "has_user_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the given user-defined @signal@ exists. Only signals added using @method add_user_signal@ are taken into account.
has_user_signal ::
                  (Object :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_user_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_has_user_signal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "has_user_signal" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Object.has_user_signal

{-# NOINLINE bindObject_is_blocking_signals #-}

-- | Returns @true@ if signal emission blocking is enabled.
bindObject_is_blocking_signals :: MethodBind
bindObject_is_blocking_signals
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "is_blocking_signals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if signal emission blocking is enabled.
is_blocking_signals ::
                      (Object :< cls, Object :< cls) => cls -> IO Bool
is_blocking_signals cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_is_blocking_signals (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "is_blocking_signals" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Object.is_blocking_signals

{-# NOINLINE bindObject_is_class #-}

-- | Returns @true@ if the object inherits from the given @class@. See also @method get_class@.
--   				__Note:__ @method is_class@ does not take @class_name@ declarations into account. If the object has a @class_name@ defined, @method is_class@ will return @false@ for that name.
bindObject_is_class :: MethodBind
bindObject_is_class
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "is_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the object inherits from the given @class@. See also @method get_class@.
--   				__Note:__ @method is_class@ does not take @class_name@ declarations into account. If the object has a @class_name@ defined, @method is_class@ will return @false@ for that name.
is_class ::
           (Object :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_class cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_is_class (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "is_class" '[GodotString] (IO Bool)
         where
        nodeMethod = Godot.Core.Object.is_class

{-# NOINLINE bindObject_is_connected #-}

-- | Returns @true@ if a connection exists for a given @signal@, @target@, and @method@.
bindObject_is_connected :: MethodBind
bindObject_is_connected
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "is_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if a connection exists for a given @signal@, @target@, and @method@.
is_connected ::
               (Object :< cls, Object :< cls) =>
               cls -> GodotString -> Object -> GodotString -> IO Bool
is_connected cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_is_connected (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "is_connected"
           '[GodotString, Object, GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.Object.is_connected

{-# NOINLINE bindObject_is_queued_for_deletion #-}

-- | Returns @true@ if the @method Node.queue_free@ method was called for the object.
bindObject_is_queued_for_deletion :: MethodBind
bindObject_is_queued_for_deletion
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "is_queued_for_deletion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the @method Node.queue_free@ method was called for the object.
is_queued_for_deletion ::
                         (Object :< cls, Object :< cls) => cls -> IO Bool
is_queued_for_deletion cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_is_queued_for_deletion
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "is_queued_for_deletion" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Object.is_queued_for_deletion

{-# NOINLINE bindObject_notification #-}

-- | Send a given notification to the object, which will also trigger a call to the @method _notification@ method of all classes that the object inherits from.
--   				If @reversed@ is @true@, @method _notification@ is called first on the object's own class, and then up to its successive parent classes. If @reversed@ is @false@, @method _notification@ is called first on the highest ancestor (@Object@ itself), and then down to its successive inheriting classes.
bindObject_notification :: MethodBind
bindObject_notification
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Send a given notification to the object, which will also trigger a call to the @method _notification@ method of all classes that the object inherits from.
--   				If @reversed@ is @true@, @method _notification@ is called first on the object's own class, and then up to its successive parent classes. If @reversed@ is @false@, @method _notification@ is called first on the highest ancestor (@Object@ itself), and then down to its successive inheriting classes.
notification ::
               (Object :< cls, Object :< cls) => cls -> Int -> Maybe Bool -> IO ()
notification cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantBool False) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_notification (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "notification" '[Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.notification

{-# NOINLINE bindObject_property_list_changed_notify #-}

-- | Notify the editor that the property list has changed, so that editor plugins can take the new values into account. Does nothing on export builds.
bindObject_property_list_changed_notify :: MethodBind
bindObject_property_list_changed_notify
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "property_list_changed_notify" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Notify the editor that the property list has changed, so that editor plugins can take the new values into account. Does nothing on export builds.
property_list_changed_notify ::
                               (Object :< cls, Object :< cls) => cls -> IO ()
property_list_changed_notify cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_property_list_changed_notify
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "property_list_changed_notify" '[]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.property_list_changed_notify

{-# NOINLINE bindObject_remove_meta #-}

-- | Removes a given entry from the object's metadata. See also @method set_meta@.
bindObject_remove_meta :: MethodBind
bindObject_remove_meta
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "remove_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a given entry from the object's metadata. See also @method set_meta@.
remove_meta ::
              (Object :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_remove_meta (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "remove_meta" '[GodotString] (IO ())
         where
        nodeMethod = Godot.Core.Object.remove_meta

{-# NOINLINE bindObject_set #-}

-- | Assigns a new value to the given property. If the @property@ does not exist or the given value's type doesn't match, nothing will happen.
--   				__Note:__ In C#, the property name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined properties where you should use the same convention as in the C# source (typically PascalCase).
bindObject_set :: MethodBind
bindObject_set
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a new value to the given property. If the @property@ does not exist or the given value's type doesn't match, nothing will happen.
--   				__Note:__ In C#, the property name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined properties where you should use the same convention as in the C# source (typically PascalCase).
set ::
      (Object :< cls, Object :< cls) =>
      cls -> GodotString -> GodotVariant -> IO ()
set cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "set" '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.set

{-# NOINLINE bindObject_set_block_signals #-}

-- | If set to @true@, signal emission is blocked.
bindObject_set_block_signals :: MethodBind
bindObject_set_block_signals
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_block_signals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set to @true@, signal emission is blocked.
set_block_signals ::
                    (Object :< cls, Object :< cls) => cls -> Bool -> IO ()
set_block_signals cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_block_signals (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "set_block_signals" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Object.set_block_signals

{-# NOINLINE bindObject_set_deferred #-}

-- | Assigns a new value to the given property, after the current frame's physics step. This is equivalent to calling @method set@ via @method call_deferred@, i.e. @call_deferred("set", property, value)@.
--   				__Note:__ In C#, the property name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined properties where you should use the same convention as in the C# source (typically PascalCase).
bindObject_set_deferred :: MethodBind
bindObject_set_deferred
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_deferred" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a new value to the given property, after the current frame's physics step. This is equivalent to calling @method set@ via @method call_deferred@, i.e. @call_deferred("set", property, value)@.
--   				__Note:__ In C#, the property name must be specified as snake_case if it is defined by a built-in Godot node. This doesn't apply to user-defined properties where you should use the same convention as in the C# source (typically PascalCase).
set_deferred ::
               (Object :< cls, Object :< cls) =>
               cls -> GodotString -> GodotVariant -> IO ()
set_deferred cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_deferred (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "set_deferred"
           '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.set_deferred

{-# NOINLINE bindObject_set_indexed #-}

-- | Assigns a new value to the property identified by the @NodePath@. The node path should be relative to the current object and can use the colon character (@:@) to access nested properties. Example:
--   				
--   @
--   
--   				set_indexed("position", Vector2(42, 0))
--   				set_indexed("position:y", -10)
--   				print(position) # (42, -10)
--   				
--   @
bindObject_set_indexed :: MethodBind
bindObject_set_indexed
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_indexed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a new value to the property identified by the @NodePath@. The node path should be relative to the current object and can use the colon character (@:@) to access nested properties. Example:
--   				
--   @
--   
--   				set_indexed("position", Vector2(42, 0))
--   				set_indexed("position:y", -10)
--   				print(position) # (42, -10)
--   				
--   @
set_indexed ::
              (Object :< cls, Object :< cls) =>
              cls -> NodePath -> GodotVariant -> IO ()
set_indexed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_indexed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "set_indexed" '[NodePath, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.set_indexed

{-# NOINLINE bindObject_set_message_translation #-}

-- | Defines whether the object can translate strings (with calls to @method tr@). Enabled by default.
bindObject_set_message_translation :: MethodBind
bindObject_set_message_translation
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_message_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines whether the object can translate strings (with calls to @method tr@). Enabled by default.
set_message_translation ::
                          (Object :< cls, Object :< cls) => cls -> Bool -> IO ()
set_message_translation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_message_translation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "set_message_translation" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.set_message_translation

{-# NOINLINE bindObject_set_meta #-}

-- | Adds, changes or removes a given entry in the object's metadata. Metadata are serialized and can take any @Variant@ value.
--   				To remove a given entry from the object's metadata, use @method remove_meta@. Metadata is also removed if its value is set to @null@. This means you can also use @set_meta("name", null)@ to remove metadata for @"name"@.
bindObject_set_meta :: MethodBind
bindObject_set_meta
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds, changes or removes a given entry in the object's metadata. Metadata are serialized and can take any @Variant@ value.
--   				To remove a given entry from the object's metadata, use @method remove_meta@. Metadata is also removed if its value is set to @null@. This means you can also use @set_meta("name", null)@ to remove metadata for @"name"@.
set_meta ::
           (Object :< cls, Object :< cls) =>
           cls -> GodotString -> GodotVariant -> IO ()
set_meta cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_meta (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "set_meta" '[GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.Object.set_meta

{-# NOINLINE bindObject_set_script #-}

-- | Assigns a script to the object. Each object can have a single script assigned to it, which are used to extend its functionality.
--   				If the object already had a script, the previous script instance will be freed and its variables and state will be lost. The new script's @method _init@ method will be called.
bindObject_set_script :: MethodBind
bindObject_set_script
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a script to the object. Each object can have a single script assigned to it, which are used to extend its functionality.
--   				If the object already had a script, the previous script instance will be freed and its variables and state will be lost. The new script's @method _init@ method will be called.
set_script ::
             (Object :< cls, Object :< cls) => cls -> Reference -> IO ()
set_script cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_script (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "set_script" '[Reference] (IO ()) where
        nodeMethod = Godot.Core.Object.set_script

{-# NOINLINE bindObject_to_string #-}

-- | Returns a @String@ representing the object. If not overridden, defaults to @"@ClassName:RID@"@.
--   				Override the method @method _to_string@ to customize the @String@ representation.
bindObject_to_string :: MethodBind
bindObject_to_string
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "to_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a @String@ representing the object. If not overridden, defaults to @"@ClassName:RID@"@.
--   				Override the method @method _to_string@ to customize the @String@ representation.
to_string ::
            (Object :< cls, Object :< cls) => cls -> IO GodotString
to_string cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_to_string (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "to_string" '[] (IO GodotString) where
        nodeMethod = Godot.Core.Object.to_string

{-# NOINLINE bindObject_tr #-}

-- | Translates a message using translation catalogs configured in the Project Settings.
--   				Only works if message translation is enabled (which it is by default), otherwise it returns the @message@ unchanged. See @method set_message_translation@.
bindObject_tr :: MethodBind
bindObject_tr
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "tr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Translates a message using translation catalogs configured in the Project Settings.
--   				Only works if message translation is enabled (which it is by default), otherwise it returns the @message@ unchanged. See @method set_message_translation@.
tr ::
     (Object :< cls, Object :< cls) =>
     cls -> GodotString -> IO GodotString
tr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_tr (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Object "tr" '[GodotString] (IO GodotString)
         where
        nodeMethod = Godot.Core.Object.tr