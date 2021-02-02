{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Tools.EditorExportPlugin
       (Godot.Tools.EditorExportPlugin._export_begin,
        Godot.Tools.EditorExportPlugin._export_end,
        Godot.Tools.EditorExportPlugin._export_file,
        Godot.Tools.EditorExportPlugin.add_file,
        Godot.Tools.EditorExportPlugin.add_ios_bundle_file,
        Godot.Tools.EditorExportPlugin.add_ios_cpp_code,
        Godot.Tools.EditorExportPlugin.add_ios_framework,
        Godot.Tools.EditorExportPlugin.add_ios_linker_flags,
        Godot.Tools.EditorExportPlugin.add_ios_plist_content,
        Godot.Tools.EditorExportPlugin.add_shared_object,
        Godot.Tools.EditorExportPlugin.skip)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEditorExportPlugin__export_begin #-}

bindEditorExportPlugin__export_begin :: MethodBind
bindEditorExportPlugin__export_begin
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "_export_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_export_begin ::
                (EditorExportPlugin :< cls, Object :< cls) =>
                cls -> PoolStringArray -> Bool -> GodotString -> Int -> IO ()
_export_begin cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin__export_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin__export_end #-}

bindEditorExportPlugin__export_end :: MethodBind
bindEditorExportPlugin__export_end
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "_export_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_export_end ::
              (EditorExportPlugin :< cls, Object :< cls) => cls -> IO ()
_export_end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin__export_end
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin__export_file #-}

bindEditorExportPlugin__export_file :: MethodBind
bindEditorExportPlugin__export_file
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "_export_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_export_file ::
               (EditorExportPlugin :< cls, Object :< cls) =>
               cls -> GodotString -> GodotString -> PoolStringArray -> IO ()
_export_file cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin__export_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin_add_file #-}

bindEditorExportPlugin_add_file :: MethodBind
bindEditorExportPlugin_add_file
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "add_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_file ::
           (EditorExportPlugin :< cls, Object :< cls) =>
           cls -> GodotString -> PoolByteArray -> Bool -> IO ()
add_file cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin_add_file (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin_add_ios_bundle_file #-}

bindEditorExportPlugin_add_ios_bundle_file :: MethodBind
bindEditorExportPlugin_add_ios_bundle_file
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "add_ios_bundle_file" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_ios_bundle_file ::
                      (EditorExportPlugin :< cls, Object :< cls) =>
                      cls -> GodotString -> IO ()
add_ios_bundle_file cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin_add_ios_bundle_file
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin_add_ios_cpp_code #-}

bindEditorExportPlugin_add_ios_cpp_code :: MethodBind
bindEditorExportPlugin_add_ios_cpp_code
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "add_ios_cpp_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_ios_cpp_code ::
                   (EditorExportPlugin :< cls, Object :< cls) =>
                   cls -> GodotString -> IO ()
add_ios_cpp_code cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin_add_ios_cpp_code
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin_add_ios_framework #-}

bindEditorExportPlugin_add_ios_framework :: MethodBind
bindEditorExportPlugin_add_ios_framework
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "add_ios_framework" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_ios_framework ::
                    (EditorExportPlugin :< cls, Object :< cls) =>
                    cls -> GodotString -> IO ()
add_ios_framework cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin_add_ios_framework
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin_add_ios_linker_flags #-}

bindEditorExportPlugin_add_ios_linker_flags :: MethodBind
bindEditorExportPlugin_add_ios_linker_flags
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "add_ios_linker_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_ios_linker_flags ::
                       (EditorExportPlugin :< cls, Object :< cls) =>
                       cls -> GodotString -> IO ()
add_ios_linker_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin_add_ios_linker_flags
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin_add_ios_plist_content #-}

bindEditorExportPlugin_add_ios_plist_content :: MethodBind
bindEditorExportPlugin_add_ios_plist_content
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "add_ios_plist_content" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_ios_plist_content ::
                        (EditorExportPlugin :< cls, Object :< cls) =>
                        cls -> GodotString -> IO ()
add_ios_plist_content cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin_add_ios_plist_content
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin_add_shared_object #-}

bindEditorExportPlugin_add_shared_object :: MethodBind
bindEditorExportPlugin_add_shared_object
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "add_shared_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_shared_object ::
                    (EditorExportPlugin :< cls, Object :< cls) =>
                    cls -> GodotString -> PoolStringArray -> IO ()
add_shared_object cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin_add_shared_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindEditorExportPlugin_skip #-}

bindEditorExportPlugin_skip :: MethodBind
bindEditorExportPlugin_skip
  = unsafePerformIO $
      withCString "EditorExportPlugin" $
        \ clsNamePtr ->
          withCString "skip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

skip :: (EditorExportPlugin :< cls, Object :< cls) => cls -> IO ()
skip cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorExportPlugin_skip (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)