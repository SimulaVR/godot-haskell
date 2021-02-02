{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
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

{-# NOINLINE bindObject__get #-}

-- | Virtual method which can be overridden to customize the return value of [method get].
--   				Returns the given property. Returns [code]null[/code] if the [code]property[/code] does not exist.
bindObject__get :: MethodBind
bindObject__get
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_get" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Virtual method which can be overridden to customize the return value of [method get].
--   				Returns the given property. Returns [code]null[/code] if the [code]property[/code] does not exist.
_get ::
       (Object :< cls, Object :< cls) =>
       cls -> GodotString -> IO GodotVariant
_get cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__get (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject__get_property_list #-}

-- | Virtual method which can be overridden to customize the return value of [method get_property_list].
--   				Returns the object's property list as an [Array] of dictionaries.
--   				Each property's [Dictionary] must contain at least [code]name: String[/code] and [code]type: int[/code] (see [enum @GlobalScope.Variant.Type]) entries. Optionally, it can also include [code]hint: int[/code] (see [enum @GlobalScope.PropertyHint]), [code]hint_string: String[/code], and [code]usage: int[/code] (see [enum @GlobalScope.PropertyUsageFlags]).
bindObject__get_property_list :: MethodBind
bindObject__get_property_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_get_property_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Virtual method which can be overridden to customize the return value of [method get_property_list].
--   				Returns the object's property list as an [Array] of dictionaries.
--   				Each property's [Dictionary] must contain at least [code]name: String[/code] and [code]type: int[/code] (see [enum @GlobalScope.Variant.Type]) entries. Optionally, it can also include [code]hint: int[/code] (see [enum @GlobalScope.PropertyHint]), [code]hint_string: String[/code], and [code]usage: int[/code] (see [enum @GlobalScope.PropertyUsageFlags]).
_get_property_list ::
                     (Object :< cls, Object :< cls) => cls -> IO Array
_get_property_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__get_property_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindObject__notification #-}

-- | Called whenever the object receives a notification, which is identified in [code]what[/code] by a constant. The base [Object] has two constants [constant NOTIFICATION_POSTINITIALIZE] and [constant NOTIFICATION_PREDELETE], but subclasses such as [Node] define a lot more notifications which are also received by this method.
bindObject__notification :: MethodBind
bindObject__notification
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called whenever the object receives a notification, which is identified in [code]what[/code] by a constant. The base [Object] has two constants [constant NOTIFICATION_POSTINITIALIZE] and [constant NOTIFICATION_PREDELETE], but subclasses such as [Node] define a lot more notifications which are also received by this method.
_notification ::
                (Object :< cls, Object :< cls) => cls -> Int -> IO ()
_notification cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__notification (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject__set #-}

-- | Virtual method which can be overridden to customize the return value of [method set].
--   				Sets a property. Returns [code]true[/code] if the [code]property[/code] exists.
bindObject__set :: MethodBind
bindObject__set
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_set" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Virtual method which can be overridden to customize the return value of [method set].
--   				Sets a property. Returns [code]true[/code] if the [code]property[/code] exists.
_set ::
       (Object :< cls, Object :< cls) =>
       cls -> GodotString -> GodotVariant -> IO Bool
_set cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__set (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject__to_string #-}

bindObject__to_string :: MethodBind
bindObject__to_string
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "_to_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_to_string ::
             (Object :< cls, Object :< cls) => cls -> IO GodotString
_to_string cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject__to_string (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_add_user_signal #-}

-- | Adds a user-defined [code]signal[/code]. Arguments are optional, but can be added as an [Array] of dictionaries, each containing [code]name: String[/code] and [code]type: int[/code] (see [enum @GlobalScope.Variant.Type]) entries.
bindObject_add_user_signal :: MethodBind
bindObject_add_user_signal
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "add_user_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a user-defined [code]signal[/code]. Arguments are optional, but can be added as an [Array] of dictionaries, each containing [code]name: String[/code] and [code]type: int[/code] (see [enum @GlobalScope.Variant.Type]) entries.
add_user_signal ::
                  (Object :< cls, Object :< cls) =>
                  cls -> GodotString -> Array -> IO ()
add_user_signal cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_add_user_signal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_call #-}

-- | Calls the [code]method[/code] on the object and returns the result. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				[codeblock]
--   				call("set", "position", Vector2(42.0, 0.0))
--   				[/codeblock]
bindObject_call :: MethodBind
bindObject_call
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "call" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the [code]method[/code] on the object and returns the result. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				[codeblock]
--   				call("set", "position", Vector2(42.0, 0.0))
--   				[/codeblock]
call ::
       (Object :< cls, Object :< cls) =>
       cls -> GodotString -> [Variant 'GodotTy] -> IO GodotVariant
call cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_call (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_call_deferred #-}

-- | Calls the [code]method[/code] on the object during idle time and returns the result. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				[codeblock]
--   				call_deferred("set", "position", Vector2(42.0, 0.0))
--   				[/codeblock]
bindObject_call_deferred :: MethodBind
bindObject_call_deferred
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "call_deferred" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the [code]method[/code] on the object during idle time and returns the result. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				[codeblock]
--   				call_deferred("set", "position", Vector2(42.0, 0.0))
--   				[/codeblock]
call_deferred ::
                (Object :< cls, Object :< cls) =>
                cls -> GodotString -> [Variant 'GodotTy] -> IO ()
call_deferred cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_call_deferred (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_callv #-}

-- | Calls the [code]method[/code] on the object and returns the result. Contrarily to [method call], this method does not support a variable number of arguments but expected all parameters passed via a single [Array].
--   				[codeblock]
--   				callv("set", [ "position", Vector2(42.0, 0.0) ])
--   				[/codeblock]
bindObject_callv :: MethodBind
bindObject_callv
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "callv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calls the [code]method[/code] on the object and returns the result. Contrarily to [method call], this method does not support a variable number of arguments but expected all parameters passed via a single [Array].
--   				[codeblock]
--   				callv("set", [ "position", Vector2(42.0, 0.0) ])
--   				[/codeblock]
callv ::
        (Object :< cls, Object :< cls) =>
        cls -> GodotString -> Array -> IO GodotVariant
callv cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_callv (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_can_translate_messages #-}

-- | Returns [code]true[/code] if the object can translate strings. See [method set_message_translation] and [method tr].
bindObject_can_translate_messages :: MethodBind
bindObject_can_translate_messages
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "can_translate_messages" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the object can translate strings. See [method set_message_translation] and [method tr].
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

{-# NOINLINE bindObject_connect #-}

-- | Connects a [code]signal[/code] to a [code]method[/code] on a [code]target[/code] object. Pass optional [code]binds[/code] to the call as an [Array] of parameters. Use [code]flags[/code] to set deferred or one shot connections. See [enum ConnectFlags] constants.
--   				A [code]signal[/code] can only be connected once to a [code]method[/code]. It will throw an error if already connected, unless the signal was connected with [constant CONNECT_REFERENCE_COUNTED]. To avoid this, first, use [method is_connected] to check for existing connections.
--   				If the [code]target[/code] is destroyed in the game's lifecycle, the connection will be lost.
--   				Examples:
--   				[codeblock]
--   				connect("pressed", self, "_on_Button_pressed") # BaseButton signal
--   				connect("text_entered", self, "_on_LineEdit_text_entered") # LineEdit signal
--   				connect("hit", self, "_on_Player_hit", [ weapon_type, damage ]) # User-defined signal
--   				[/codeblock]
bindObject_connect :: MethodBind
bindObject_connect
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "connect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Connects a [code]signal[/code] to a [code]method[/code] on a [code]target[/code] object. Pass optional [code]binds[/code] to the call as an [Array] of parameters. Use [code]flags[/code] to set deferred or one shot connections. See [enum ConnectFlags] constants.
--   				A [code]signal[/code] can only be connected once to a [code]method[/code]. It will throw an error if already connected, unless the signal was connected with [constant CONNECT_REFERENCE_COUNTED]. To avoid this, first, use [method is_connected] to check for existing connections.
--   				If the [code]target[/code] is destroyed in the game's lifecycle, the connection will be lost.
--   				Examples:
--   				[codeblock]
--   				connect("pressed", self, "_on_Button_pressed") # BaseButton signal
--   				connect("text_entered", self, "_on_LineEdit_text_entered") # LineEdit signal
--   				connect("hit", self, "_on_Player_hit", [ weapon_type, damage ]) # User-defined signal
--   				[/codeblock]
connect ::
          (Object :< cls, Object :< cls) =>
          cls ->
            GodotString -> Object -> GodotString -> Array -> Int -> IO Int
connect cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_connect (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_disconnect #-}

-- | Disconnects a [code]signal[/code] from a [code]method[/code] on the given [code]target[/code].
--   				If you try to disconnect a connection that does not exist, the method will throw an error. Use [method is_connected] to ensure that the connection exists.
bindObject_disconnect :: MethodBind
bindObject_disconnect
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "disconnect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Disconnects a [code]signal[/code] from a [code]method[/code] on the given [code]target[/code].
--   				If you try to disconnect a connection that does not exist, the method will throw an error. Use [method is_connected] to ensure that the connection exists.
disconnect ::
             (Object :< cls, Object :< cls) =>
             cls -> GodotString -> Object -> GodotString -> IO ()
disconnect cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_disconnect (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_emit_signal #-}

-- | Emits the given [code]signal[/code]. The signal must exist, so it should be a built-in signal of this class or one of its parent classes, or a user-defined signal. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				[codeblock]
--   				emit_signal("hit", weapon_type, damage)
--   				emit_signal("game_over")
--   				[/codeblock]
bindObject_emit_signal :: MethodBind
bindObject_emit_signal
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "emit_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Emits the given [code]signal[/code]. The signal must exist, so it should be a built-in signal of this class or one of its parent classes, or a user-defined signal. This method supports a variable number of arguments, so parameters are passed as a comma separated list. Example:
--   				[codeblock]
--   				emit_signal("hit", weapon_type, damage)
--   				emit_signal("game_over")
--   				[/codeblock]
emit_signal ::
              (Object :< cls, Object :< cls) =>
              cls -> GodotString -> [Variant 'GodotTy] -> IO ()
emit_signal cls arg1 varargs
  = withVariantArray ([toVariant arg1] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_emit_signal (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_free #-}

-- | Deletes the object from memory. Any pre-existing reference to the freed object will now return [code]null[/code].
bindObject_free :: MethodBind
bindObject_free
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "free" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Deletes the object from memory. Any pre-existing reference to the freed object will now return [code]null[/code].
free :: (Object :< cls, Object :< cls) => cls -> IO ()
free cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_free (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get #-}

-- | Returns the [Variant] value of the given [code]property[/code].
bindObject_get :: MethodBind
bindObject_get
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the [Variant] value of the given [code]property[/code].
get ::
      (Object :< cls, Object :< cls) =>
      cls -> GodotString -> IO GodotVariant
get cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_class #-}

-- | Returns the object's class as a [String].
bindObject_get_class :: MethodBind
bindObject_get_class
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's class as a [String].
get_class ::
            (Object :< cls, Object :< cls) => cls -> IO GodotString
get_class cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_class (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_incoming_connections #-}

-- | Returns an [Array] of dictionaries with information about signals that are connected to the object.
--   				Each [Dictionary] contains three String entries:
--   				- [code]source[/code] is a reference to the signal emitter.
--   				- [code]signal_name[/code] is the name of the connected signal.
--   				- [code]method_name[/code] is the name of the method to which the signal is connected.
bindObject_get_incoming_connections :: MethodBind
bindObject_get_incoming_connections
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_incoming_connections" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an [Array] of dictionaries with information about signals that are connected to the object.
--   				Each [Dictionary] contains three String entries:
--   				- [code]source[/code] is a reference to the signal emitter.
--   				- [code]signal_name[/code] is the name of the connected signal.
--   				- [code]method_name[/code] is the name of the method to which the signal is connected.
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

{-# NOINLINE bindObject_get_indexed #-}

-- | Get the object's property indexed by the given [NodePath]. The node path should be relative to the current object and can use the colon character ([code]:[/code]) to access nested properties. Examples: [code]"position:x"[/code] or [code]"material:next_pass:blend_mode"[/code].
bindObject_get_indexed :: MethodBind
bindObject_get_indexed
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_indexed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Get the object's property indexed by the given [NodePath]. The node path should be relative to the current object and can use the colon character ([code]:[/code]) to access nested properties. Examples: [code]"position:x"[/code] or [code]"material:next_pass:blend_mode"[/code].
get_indexed ::
              (Object :< cls, Object :< cls) =>
              cls -> NodePath -> IO GodotVariant
get_indexed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_indexed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_instance_id #-}

-- | Returns the object's unique instance ID.
--   				This ID can be saved in [EncodedObjectAsID], and can be used to retrieve the object instance with [method @GDScript.instance_from_id].
bindObject_get_instance_id :: MethodBind
bindObject_get_instance_id
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's unique instance ID.
--   				This ID can be saved in [EncodedObjectAsID], and can be used to retrieve the object instance with [method @GDScript.instance_from_id].
get_instance_id :: (Object :< cls, Object :< cls) => cls -> IO Int
get_instance_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_instance_id (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_meta #-}

-- | Returns the object's metadata entry for the given [code]name[/code].
bindObject_get_meta :: MethodBind
bindObject_get_meta
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's metadata entry for the given [code]name[/code].
get_meta ::
           (Object :< cls, Object :< cls) =>
           cls -> GodotString -> IO GodotVariant
get_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_meta (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_meta_list #-}

-- | Returns the object's metadata as a [PoolStringArray].
bindObject_get_meta_list :: MethodBind
bindObject_get_meta_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_meta_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's metadata as a [PoolStringArray].
get_meta_list ::
                (Object :< cls, Object :< cls) => cls -> IO PoolStringArray
get_meta_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_meta_list (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_method_list #-}

-- | Returns the object's methods and their signatures as an [Array].
bindObject_get_method_list :: MethodBind
bindObject_get_method_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_method_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's methods and their signatures as an [Array].
get_method_list ::
                  (Object :< cls, Object :< cls) => cls -> IO Array
get_method_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_method_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_property_list #-}

-- | Returns the object's property list as an [Array] of dictionaries.
--   				Each property's [Dictionary] contain at least [code]name: String[/code] and [code]type: int[/code] (see [enum @GlobalScope.Variant.Type]) entries. Optionally, it can also include [code]hint: int[/code] (see [enum @GlobalScope.PropertyHint]), [code]hint_string: String[/code], and [code]usage: int[/code] (see [enum @GlobalScope.PropertyUsageFlags]).
bindObject_get_property_list :: MethodBind
bindObject_get_property_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_property_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's property list as an [Array] of dictionaries.
--   				Each property's [Dictionary] contain at least [code]name: String[/code] and [code]type: int[/code] (see [enum @GlobalScope.Variant.Type]) entries. Optionally, it can also include [code]hint: int[/code] (see [enum @GlobalScope.PropertyHint]), [code]hint_string: String[/code], and [code]usage: int[/code] (see [enum @GlobalScope.PropertyUsageFlags]).
get_property_list ::
                    (Object :< cls, Object :< cls) => cls -> IO Array
get_property_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_property_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_script #-}

-- | Returns the object's [Script] instance, or [code]null[/code] if none is assigned.
bindObject_get_script :: MethodBind
bindObject_get_script
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the object's [Script] instance, or [code]null[/code] if none is assigned.
get_script :: (Object :< cls, Object :< cls) => cls -> IO Reference
get_script cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_script (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_get_signal_connection_list #-}

-- | Returns an [Array] of connections for the given [code]signal[/code].
bindObject_get_signal_connection_list :: MethodBind
bindObject_get_signal_connection_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_signal_connection_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an [Array] of connections for the given [code]signal[/code].
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

{-# NOINLINE bindObject_get_signal_list #-}

-- | Returns the list of signals as an [Array] of dictionaries.
bindObject_get_signal_list :: MethodBind
bindObject_get_signal_list
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "get_signal_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the list of signals as an [Array] of dictionaries.
get_signal_list ::
                  (Object :< cls, Object :< cls) => cls -> IO Array
get_signal_list cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_get_signal_list (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_has_meta #-}

-- | Returns [code]true[/code] if a metadata entry is found with the given [code]name[/code].
bindObject_has_meta :: MethodBind
bindObject_has_meta
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "has_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if a metadata entry is found with the given [code]name[/code].
has_meta ::
           (Object :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_has_meta (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_has_method #-}

-- | Returns [code]true[/code] if the object contains the given [code]method[/code].
bindObject_has_method :: MethodBind
bindObject_has_method
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "has_method" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the object contains the given [code]method[/code].
has_method ::
             (Object :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_method cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_has_method (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_has_user_signal #-}

-- | Returns [code]true[/code] if the given user-defined [code]signal[/code] exists.
bindObject_has_user_signal :: MethodBind
bindObject_has_user_signal
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "has_user_signal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the given user-defined [code]signal[/code] exists.
has_user_signal ::
                  (Object :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_user_signal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_has_user_signal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_is_blocking_signals #-}

-- | Returns [code]true[/code] if signal emission blocking is enabled.
bindObject_is_blocking_signals :: MethodBind
bindObject_is_blocking_signals
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "is_blocking_signals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if signal emission blocking is enabled.
is_blocking_signals ::
                      (Object :< cls, Object :< cls) => cls -> IO Bool
is_blocking_signals cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_is_blocking_signals (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_is_class #-}

-- | Returns [code]true[/code] if the object inherits from the given [code]class[/code].
bindObject_is_class :: MethodBind
bindObject_is_class
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "is_class" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the object inherits from the given [code]class[/code].
is_class ::
           (Object :< cls, Object :< cls) => cls -> GodotString -> IO Bool
is_class cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_is_class (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_is_connected #-}

-- | Returns [code]true[/code] if a connection exists for a given [code]signal[/code], [code]target[/code], and [code]method[/code].
bindObject_is_connected :: MethodBind
bindObject_is_connected
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "is_connected" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if a connection exists for a given [code]signal[/code], [code]target[/code], and [code]method[/code].
is_connected ::
               (Object :< cls, Object :< cls) =>
               cls -> GodotString -> Object -> GodotString -> IO Bool
is_connected cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_is_connected (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_is_queued_for_deletion #-}

-- | Returns [code]true[/code] if the [method Node.queue_free] method was called for the object.
bindObject_is_queued_for_deletion :: MethodBind
bindObject_is_queued_for_deletion
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "is_queued_for_deletion" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the [method Node.queue_free] method was called for the object.
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

{-# NOINLINE bindObject_notification #-}

-- | Send a given notification to the object, which will also trigger a call to the [method _notification] method of all classes that the object inherits from.
--   				If [code]reversed[/code] is [code]true[/code], [method _notification] is called first on the object's own class, and then up to its successive parent classes. If [code]reversed[/code] is [code]false[/code], [method _notification] is called first on the highest ancestor ([Object] itself), and then down to its successive inheriting classes.
bindObject_notification :: MethodBind
bindObject_notification
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "notification" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Send a given notification to the object, which will also trigger a call to the [method _notification] method of all classes that the object inherits from.
--   				If [code]reversed[/code] is [code]true[/code], [method _notification] is called first on the object's own class, and then up to its successive parent classes. If [code]reversed[/code] is [code]false[/code], [method _notification] is called first on the highest ancestor ([Object] itself), and then down to its successive inheriting classes.
notification ::
               (Object :< cls, Object :< cls) => cls -> Int -> Bool -> IO ()
notification cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_notification (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

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

{-# NOINLINE bindObject_remove_meta #-}

bindObject_remove_meta :: MethodBind
bindObject_remove_meta
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "remove_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

remove_meta ::
              (Object :< cls, Object :< cls) => cls -> GodotString -> IO ()
remove_meta cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_remove_meta (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_set #-}

-- | Assigns a new value to the given property. If the [code]property[/code] does not exist, nothing will happen.
bindObject_set :: MethodBind
bindObject_set
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a new value to the given property. If the [code]property[/code] does not exist, nothing will happen.
set ::
      (Object :< cls, Object :< cls) =>
      cls -> GodotString -> GodotVariant -> IO ()
set cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_set_block_signals #-}

-- | If set to [code]true[/code], signal emission is blocked.
bindObject_set_block_signals :: MethodBind
bindObject_set_block_signals
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_block_signals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If set to [code]true[/code], signal emission is blocked.
set_block_signals ::
                    (Object :< cls, Object :< cls) => cls -> Bool -> IO ()
set_block_signals cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_block_signals (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_set_deferred #-}

-- | Assigns a new value to the given property, after the current frame's physics step. This is equivalent to calling [method set] via [method call_deferred], i.e. [code]call_deferred("set", property, value)[/code].
bindObject_set_deferred :: MethodBind
bindObject_set_deferred
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_deferred" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a new value to the given property, after the current frame's physics step. This is equivalent to calling [method set] via [method call_deferred], i.e. [code]call_deferred("set", property, value)[/code].
set_deferred ::
               (Object :< cls, Object :< cls) =>
               cls -> GodotString -> GodotVariant -> IO ()
set_deferred cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_deferred (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_set_indexed #-}

-- | Assigns a new value to the property identified by the [NodePath]. The node path should be relative to the current object and can use the colon character ([code]:[/code]) to access nested properties. Example:
--   				[codeblock]
--   				set_indexed("position", Vector2(42, 0))
--   				set_indexed("position:y", -10)
--   				print(position) # (42, -10)
--   				[/codeblock]
bindObject_set_indexed :: MethodBind
bindObject_set_indexed
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_indexed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a new value to the property identified by the [NodePath]. The node path should be relative to the current object and can use the colon character ([code]:[/code]) to access nested properties. Example:
--   				[codeblock]
--   				set_indexed("position", Vector2(42, 0))
--   				set_indexed("position:y", -10)
--   				print(position) # (42, -10)
--   				[/codeblock]
set_indexed ::
              (Object :< cls, Object :< cls) =>
              cls -> NodePath -> GodotVariant -> IO ()
set_indexed cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_indexed (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_set_message_translation #-}

-- | Defines whether the object can translate strings (with calls to [method tr]). Default is [code]true[/code].
bindObject_set_message_translation :: MethodBind
bindObject_set_message_translation
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_message_translation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines whether the object can translate strings (with calls to [method tr]). Default is [code]true[/code].
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

{-# NOINLINE bindObject_set_meta #-}

-- | Adds or changes a given entry in the object's metadata. Metadata are serialized, and can take any [Variant] value.
bindObject_set_meta :: MethodBind
bindObject_set_meta
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_meta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds or changes a given entry in the object's metadata. Metadata are serialized, and can take any [Variant] value.
set_meta ::
           (Object :< cls, Object :< cls) =>
           cls -> GodotString -> GodotVariant -> IO ()
set_meta cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_meta (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_set_script #-}

-- | Assigns a script to the object. Each object can have a single script assigned to it, which are used to extend its functionality.
bindObject_set_script :: MethodBind
bindObject_set_script
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "set_script" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a script to the object. Each object can have a single script assigned to it, which are used to extend its functionality.
set_script ::
             (Object :< cls, Object :< cls) => cls -> Reference -> IO ()
set_script cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_set_script (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_to_string #-}

bindObject_to_string :: MethodBind
bindObject_to_string
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "to_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

to_string ::
            (Object :< cls, Object :< cls) => cls -> IO GodotString
to_string cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_to_string (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindObject_tr #-}

-- | Translates a message using translation catalogs configured in the Project Settings.
--   				Only works if message translation is enabled (which it is by default), otherwise it returns the [code]message[/code] unchanged. See [method set_message_translation].
bindObject_tr :: MethodBind
bindObject_tr
  = unsafePerformIO $
      withCString "Object" $
        \ clsNamePtr ->
          withCString "tr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Translates a message using translation catalogs configured in the Project Settings.
--   				Only works if message translation is enabled (which it is by default), otherwise it returns the [code]message[/code] unchanged. See [method set_message_translation].
tr ::
     (Object :< cls, Object :< cls) =>
     cls -> GodotString -> IO GodotString
tr cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindObject_tr (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)