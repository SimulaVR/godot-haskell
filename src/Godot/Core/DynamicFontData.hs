{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.DynamicFontData
       (Godot.Core.DynamicFontData._HINTING_NONE,
        Godot.Core.DynamicFontData._HINTING_NORMAL,
        Godot.Core.DynamicFontData._HINTING_LIGHT,
        Godot.Core.DynamicFontData.set_antialiased,
        Godot.Core.DynamicFontData.is_antialiased,
        Godot.Core.DynamicFontData.set_font_path,
        Godot.Core.DynamicFontData.get_font_path,
        Godot.Core.DynamicFontData.set_hinting,
        Godot.Core.DynamicFontData.get_hinting)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_HINTING_NONE :: Int
_HINTING_NONE = 0

_HINTING_NORMAL :: Int
_HINTING_NORMAL = 2

_HINTING_LIGHT :: Int
_HINTING_LIGHT = 1

{-# NOINLINE bindDynamicFontData_set_antialiased #-}

-- | Controls whether the font should be rendered with anti-aliasing.
bindDynamicFontData_set_antialiased :: MethodBind
bindDynamicFontData_set_antialiased
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "set_antialiased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls whether the font should be rendered with anti-aliasing.
set_antialiased ::
                  (DynamicFontData :< cls, Object :< cls) => cls -> Bool -> IO ()
set_antialiased cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFontData_set_antialiased
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFontData_is_antialiased #-}

-- | Controls whether the font should be rendered with anti-aliasing.
bindDynamicFontData_is_antialiased :: MethodBind
bindDynamicFontData_is_antialiased
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "is_antialiased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Controls whether the font should be rendered with anti-aliasing.
is_antialiased ::
                 (DynamicFontData :< cls, Object :< cls) => cls -> IO Bool
is_antialiased cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFontData_is_antialiased
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFontData_set_font_path #-}

-- | The path to the vector font file.
bindDynamicFontData_set_font_path :: MethodBind
bindDynamicFontData_set_font_path
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "set_font_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the vector font file.
set_font_path ::
                (DynamicFontData :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_font_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFontData_set_font_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFontData_get_font_path #-}

-- | The path to the vector font file.
bindDynamicFontData_get_font_path :: MethodBind
bindDynamicFontData_get_font_path
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "get_font_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The path to the vector font file.
get_font_path ::
                (DynamicFontData :< cls, Object :< cls) => cls -> IO GodotString
get_font_path cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFontData_get_font_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFontData_set_hinting #-}

-- | The font hinting mode used by FreeType.
bindDynamicFontData_set_hinting :: MethodBind
bindDynamicFontData_set_hinting
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "set_hinting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font hinting mode used by FreeType.
set_hinting ::
              (DynamicFontData :< cls, Object :< cls) => cls -> Int -> IO ()
set_hinting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFontData_set_hinting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDynamicFontData_get_hinting #-}

-- | The font hinting mode used by FreeType.
bindDynamicFontData_get_hinting :: MethodBind
bindDynamicFontData_get_hinting
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "get_hinting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font hinting mode used by FreeType.
get_hinting ::
              (DynamicFontData :< cls, Object :< cls) => cls -> IO Int
get_hinting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFontData_get_hinting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)