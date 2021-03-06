{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Tools.EditorResourceConversionPlugin
       (Godot.Tools.EditorResourceConversionPlugin._convert,
        Godot.Tools.EditorResourceConversionPlugin._converts_to)
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

{-# NOINLINE bindEditorResourceConversionPlugin__convert #-}

bindEditorResourceConversionPlugin__convert :: MethodBind
bindEditorResourceConversionPlugin__convert
  = unsafePerformIO $
      withCString "EditorResourceConversionPlugin" $
        \ clsNamePtr ->
          withCString "_convert" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_convert ::
           (EditorResourceConversionPlugin :< cls, Object :< cls) =>
           cls -> Resource -> IO Resource
_convert cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEditorResourceConversionPlugin__convert
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorResourceConversionPlugin "_convert"
           '[Resource]
           (IO Resource)
         where
        nodeMethod = Godot.Tools.EditorResourceConversionPlugin._convert

{-# NOINLINE bindEditorResourceConversionPlugin__converts_to #-}

bindEditorResourceConversionPlugin__converts_to :: MethodBind
bindEditorResourceConversionPlugin__converts_to
  = unsafePerformIO $
      withCString "EditorResourceConversionPlugin" $
        \ clsNamePtr ->
          withCString "_converts_to" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_converts_to ::
               (EditorResourceConversionPlugin :< cls, Object :< cls) =>
               cls -> IO GodotString
_converts_to cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindEditorResourceConversionPlugin__converts_to
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EditorResourceConversionPlugin "_converts_to"
           '[]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Tools.EditorResourceConversionPlugin._converts_to