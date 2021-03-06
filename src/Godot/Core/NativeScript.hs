{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NativeScript
       (Godot.Core.NativeScript.get_class_documentation,
        Godot.Core.NativeScript.get_class_name,
        Godot.Core.NativeScript.get_library,
        Godot.Core.NativeScript.get_method_documentation,
        Godot.Core.NativeScript.get_property_documentation,
        Godot.Core.NativeScript.get_script_class_icon_path,
        Godot.Core.NativeScript.get_script_class_name,
        Godot.Core.NativeScript.get_signal_documentation,
        Godot.Core.NativeScript.new,
        Godot.Core.NativeScript.set_class_name,
        Godot.Core.NativeScript.set_library,
        Godot.Core.NativeScript.set_script_class_icon_path,
        Godot.Core.NativeScript.set_script_class_name)
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
import Godot.Core.Script()

instance NodeProperty NativeScript "class_name" GodotString 'False
         where
        nodeProperty
          = (get_class_name, wrapDroppingSetter set_class_name, Nothing)

instance NodeProperty NativeScript "library" GDNativeLibrary 'False
         where
        nodeProperty
          = (get_library, wrapDroppingSetter set_library, Nothing)

instance NodeProperty NativeScript "script_class_icon_path"
           GodotString
           'False
         where
        nodeProperty
          = (get_script_class_icon_path,
             wrapDroppingSetter set_script_class_icon_path, Nothing)

instance NodeProperty NativeScript "script_class_name" GodotString
           'False
         where
        nodeProperty
          = (get_script_class_name, wrapDroppingSetter set_script_class_name,
             Nothing)

{-# NOINLINE bindNativeScript_get_class_documentation #-}

bindNativeScript_get_class_documentation :: MethodBind
bindNativeScript_get_class_documentation
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "get_class_documentation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_class_documentation ::
                          (NativeScript :< cls, Object :< cls) => cls -> IO GodotString
get_class_documentation cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_get_class_documentation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "get_class_documentation" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.NativeScript.get_class_documentation

{-# NOINLINE bindNativeScript_get_class_name #-}

bindNativeScript_get_class_name :: MethodBind
bindNativeScript_get_class_name
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "get_class_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_class_name ::
                 (NativeScript :< cls, Object :< cls) => cls -> IO GodotString
get_class_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_get_class_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "get_class_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.NativeScript.get_class_name

{-# NOINLINE bindNativeScript_get_library #-}

bindNativeScript_get_library :: MethodBind
bindNativeScript_get_library
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "get_library" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_library ::
              (NativeScript :< cls, Object :< cls) => cls -> IO GDNativeLibrary
get_library cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_get_library (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "get_library" '[]
           (IO GDNativeLibrary)
         where
        nodeMethod = Godot.Core.NativeScript.get_library

{-# NOINLINE bindNativeScript_get_method_documentation #-}

bindNativeScript_get_method_documentation :: MethodBind
bindNativeScript_get_method_documentation
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "get_method_documentation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_method_documentation ::
                           (NativeScript :< cls, Object :< cls) =>
                           cls -> GodotString -> IO GodotString
get_method_documentation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_get_method_documentation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "get_method_documentation"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.NativeScript.get_method_documentation

{-# NOINLINE bindNativeScript_get_property_documentation #-}

bindNativeScript_get_property_documentation :: MethodBind
bindNativeScript_get_property_documentation
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "get_property_documentation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_property_documentation ::
                             (NativeScript :< cls, Object :< cls) =>
                             cls -> GodotString -> IO GodotString
get_property_documentation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_get_property_documentation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "get_property_documentation"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.NativeScript.get_property_documentation

{-# NOINLINE bindNativeScript_get_script_class_icon_path #-}

bindNativeScript_get_script_class_icon_path :: MethodBind
bindNativeScript_get_script_class_icon_path
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "get_script_class_icon_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_script_class_icon_path ::
                             (NativeScript :< cls, Object :< cls) => cls -> IO GodotString
get_script_class_icon_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_get_script_class_icon_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "get_script_class_icon_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.NativeScript.get_script_class_icon_path

{-# NOINLINE bindNativeScript_get_script_class_name #-}

bindNativeScript_get_script_class_name :: MethodBind
bindNativeScript_get_script_class_name
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "get_script_class_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_script_class_name ::
                        (NativeScript :< cls, Object :< cls) => cls -> IO GodotString
get_script_class_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_get_script_class_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "get_script_class_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.NativeScript.get_script_class_name

{-# NOINLINE bindNativeScript_get_signal_documentation #-}

bindNativeScript_get_signal_documentation :: MethodBind
bindNativeScript_get_signal_documentation
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "get_signal_documentation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_signal_documentation ::
                           (NativeScript :< cls, Object :< cls) =>
                           cls -> GodotString -> IO GodotString
get_signal_documentation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_get_signal_documentation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "get_signal_documentation"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.NativeScript.get_signal_documentation

{-# NOINLINE bindNativeScript_new #-}

bindNativeScript_new :: MethodBind
bindNativeScript_new
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "new" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

new ::
      (NativeScript :< cls, Object :< cls) =>
      cls -> [Variant 'GodotTy] -> IO GodotVariant
new cls varargs
  = withVariantArray ([] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_new (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "new" '[[Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.NativeScript.new

{-# NOINLINE bindNativeScript_set_class_name #-}

bindNativeScript_set_class_name :: MethodBind
bindNativeScript_set_class_name
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "set_class_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_class_name ::
                 (NativeScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_class_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_set_class_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "set_class_name" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.NativeScript.set_class_name

{-# NOINLINE bindNativeScript_set_library #-}

bindNativeScript_set_library :: MethodBind
bindNativeScript_set_library
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "set_library" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_library ::
              (NativeScript :< cls, Object :< cls) =>
              cls -> GDNativeLibrary -> IO ()
set_library cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_set_library (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "set_library" '[GDNativeLibrary]
           (IO ())
         where
        nodeMethod = Godot.Core.NativeScript.set_library

{-# NOINLINE bindNativeScript_set_script_class_icon_path #-}

bindNativeScript_set_script_class_icon_path :: MethodBind
bindNativeScript_set_script_class_icon_path
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "set_script_class_icon_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_script_class_icon_path ::
                             (NativeScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_script_class_icon_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_set_script_class_icon_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "set_script_class_icon_path"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.NativeScript.set_script_class_icon_path

{-# NOINLINE bindNativeScript_set_script_class_name #-}

bindNativeScript_set_script_class_name :: MethodBind
bindNativeScript_set_script_class_name
  = unsafePerformIO $
      withCString "NativeScript" $
        \ clsNamePtr ->
          withCString "set_script_class_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_script_class_name ::
                        (NativeScript :< cls, Object :< cls) => cls -> GodotString -> IO ()
set_script_class_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNativeScript_set_script_class_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NativeScript "set_script_class_name"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.NativeScript.set_script_class_name