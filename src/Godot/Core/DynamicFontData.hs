{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.DynamicFontData
       (Godot.Core.DynamicFontData._HINTING_NONE,
        Godot.Core.DynamicFontData._HINTING_NORMAL,
        Godot.Core.DynamicFontData._HINTING_LIGHT,
        Godot.Core.DynamicFontData.get_font_path,
        Godot.Core.DynamicFontData.get_hinting,
        Godot.Core.DynamicFontData.is_antialiased,
        Godot.Core.DynamicFontData.set_antialiased,
        Godot.Core.DynamicFontData.set_font_path,
        Godot.Core.DynamicFontData.set_hinting)
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

_HINTING_NONE :: Int
_HINTING_NONE = 0

_HINTING_NORMAL :: Int
_HINTING_NORMAL = 2

_HINTING_LIGHT :: Int
_HINTING_LIGHT = 1

instance NodeProperty DynamicFontData "antialiased" Bool 'False
         where
        nodeProperty
          = (is_antialiased, wrapDroppingSetter set_antialiased, Nothing)

instance NodeProperty DynamicFontData "font_path" GodotString
           'False
         where
        nodeProperty
          = (get_font_path, wrapDroppingSetter set_font_path, Nothing)

instance NodeProperty DynamicFontData "hinting" Int 'False where
        nodeProperty
          = (get_hinting, wrapDroppingSetter set_hinting, Nothing)

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

instance NodeMethod DynamicFontData "get_font_path" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.DynamicFontData.get_font_path

{-# NOINLINE bindDynamicFontData_get_hinting #-}

-- | The font hinting mode used by FreeType. See @enum Hinting@ for options.
bindDynamicFontData_get_hinting :: MethodBind
bindDynamicFontData_get_hinting
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "get_hinting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font hinting mode used by FreeType. See @enum Hinting@ for options.
get_hinting ::
              (DynamicFontData :< cls, Object :< cls) => cls -> IO Int
get_hinting cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFontData_get_hinting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DynamicFontData "get_hinting" '[] (IO Int)
         where
        nodeMethod = Godot.Core.DynamicFontData.get_hinting

{-# NOINLINE bindDynamicFontData_is_antialiased #-}

-- | If @true@, the font is rendered with anti-aliasing. This property applies both to the main font and its outline (if it has one).
bindDynamicFontData_is_antialiased :: MethodBind
bindDynamicFontData_is_antialiased
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "is_antialiased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the font is rendered with anti-aliasing. This property applies both to the main font and its outline (if it has one).
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

instance NodeMethod DynamicFontData "is_antialiased" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.DynamicFontData.is_antialiased

{-# NOINLINE bindDynamicFontData_set_antialiased #-}

-- | If @true@, the font is rendered with anti-aliasing. This property applies both to the main font and its outline (if it has one).
bindDynamicFontData_set_antialiased :: MethodBind
bindDynamicFontData_set_antialiased
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "set_antialiased" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the font is rendered with anti-aliasing. This property applies both to the main font and its outline (if it has one).
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

instance NodeMethod DynamicFontData "set_antialiased" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.DynamicFontData.set_antialiased

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

instance NodeMethod DynamicFontData "set_font_path" '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.DynamicFontData.set_font_path

{-# NOINLINE bindDynamicFontData_set_hinting #-}

-- | The font hinting mode used by FreeType. See @enum Hinting@ for options.
bindDynamicFontData_set_hinting :: MethodBind
bindDynamicFontData_set_hinting
  = unsafePerformIO $
      withCString "DynamicFontData" $
        \ clsNamePtr ->
          withCString "set_hinting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The font hinting mode used by FreeType. See @enum Hinting@ for options.
set_hinting ::
              (DynamicFontData :< cls, Object :< cls) => cls -> Int -> IO ()
set_hinting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDynamicFontData_set_hinting (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod DynamicFontData "set_hinting" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.DynamicFontData.set_hinting