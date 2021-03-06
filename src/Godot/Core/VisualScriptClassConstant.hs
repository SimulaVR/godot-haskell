{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptClassConstant
       (Godot.Core.VisualScriptClassConstant.get_base_type,
        Godot.Core.VisualScriptClassConstant.get_class_constant,
        Godot.Core.VisualScriptClassConstant.set_base_type,
        Godot.Core.VisualScriptClassConstant.set_class_constant)
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
import Godot.Core.VisualScriptNode()

instance NodeProperty VisualScriptClassConstant "base_type"
           GodotString
           'False
         where
        nodeProperty
          = (get_base_type, wrapDroppingSetter set_base_type, Nothing)

instance NodeProperty VisualScriptClassConstant "constant"
           GodotString
           'False
         where
        nodeProperty
          = (get_class_constant, wrapDroppingSetter set_class_constant,
             Nothing)

{-# NOINLINE bindVisualScriptClassConstant_get_base_type #-}

bindVisualScriptClassConstant_get_base_type :: MethodBind
bindVisualScriptClassConstant_get_base_type
  = unsafePerformIO $
      withCString "VisualScriptClassConstant" $
        \ clsNamePtr ->
          withCString "get_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_base_type ::
                (VisualScriptClassConstant :< cls, Object :< cls) =>
                cls -> IO GodotString
get_base_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptClassConstant_get_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptClassConstant "get_base_type" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualScriptClassConstant.get_base_type

{-# NOINLINE bindVisualScriptClassConstant_get_class_constant #-}

bindVisualScriptClassConstant_get_class_constant :: MethodBind
bindVisualScriptClassConstant_get_class_constant
  = unsafePerformIO $
      withCString "VisualScriptClassConstant" $
        \ clsNamePtr ->
          withCString "get_class_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_class_constant ::
                     (VisualScriptClassConstant :< cls, Object :< cls) =>
                     cls -> IO GodotString
get_class_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptClassConstant_get_class_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptClassConstant "get_class_constant"
           '[]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Core.VisualScriptClassConstant.get_class_constant

{-# NOINLINE bindVisualScriptClassConstant_set_base_type #-}

bindVisualScriptClassConstant_set_base_type :: MethodBind
bindVisualScriptClassConstant_set_base_type
  = unsafePerformIO $
      withCString "VisualScriptClassConstant" $
        \ clsNamePtr ->
          withCString "set_base_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_base_type ::
                (VisualScriptClassConstant :< cls, Object :< cls) =>
                cls -> GodotString -> IO ()
set_base_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptClassConstant_set_base_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptClassConstant "set_base_type"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptClassConstant.set_base_type

{-# NOINLINE bindVisualScriptClassConstant_set_class_constant #-}

bindVisualScriptClassConstant_set_class_constant :: MethodBind
bindVisualScriptClassConstant_set_class_constant
  = unsafePerformIO $
      withCString "VisualScriptClassConstant" $
        \ clsNamePtr ->
          withCString "set_class_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_class_constant ::
                     (VisualScriptClassConstant :< cls, Object :< cls) =>
                     cls -> GodotString -> IO ()
set_class_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptClassConstant_set_class_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptClassConstant "set_class_constant"
           '[GodotString]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualScriptClassConstant.set_class_constant