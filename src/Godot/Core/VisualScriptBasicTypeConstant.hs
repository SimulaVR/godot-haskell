{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptBasicTypeConstant
       (Godot.Core.VisualScriptBasicTypeConstant.get_basic_type,
        Godot.Core.VisualScriptBasicTypeConstant.get_basic_type_constant,
        Godot.Core.VisualScriptBasicTypeConstant.set_basic_type,
        Godot.Core.VisualScriptBasicTypeConstant.set_basic_type_constant)
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

instance NodeProperty VisualScriptBasicTypeConstant "basic_type"
           Int
           'False
         where
        nodeProperty
          = (get_basic_type, wrapDroppingSetter set_basic_type, Nothing)

instance NodeProperty VisualScriptBasicTypeConstant "constant"
           GodotString
           'False
         where
        nodeProperty
          = (get_basic_type_constant,
             wrapDroppingSetter set_basic_type_constant, Nothing)

{-# NOINLINE bindVisualScriptBasicTypeConstant_get_basic_type #-}

bindVisualScriptBasicTypeConstant_get_basic_type :: MethodBind
bindVisualScriptBasicTypeConstant_get_basic_type
  = unsafePerformIO $
      withCString "VisualScriptBasicTypeConstant" $
        \ clsNamePtr ->
          withCString "get_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_basic_type ::
                 (VisualScriptBasicTypeConstant :< cls, Object :< cls) =>
                 cls -> IO Int
get_basic_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptBasicTypeConstant_get_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptBasicTypeConstant "get_basic_type"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualScriptBasicTypeConstant.get_basic_type

{-# NOINLINE bindVisualScriptBasicTypeConstant_get_basic_type_constant
             #-}

bindVisualScriptBasicTypeConstant_get_basic_type_constant ::
                                                          MethodBind
bindVisualScriptBasicTypeConstant_get_basic_type_constant
  = unsafePerformIO $
      withCString "VisualScriptBasicTypeConstant" $
        \ clsNamePtr ->
          withCString "get_basic_type_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_basic_type_constant ::
                          (VisualScriptBasicTypeConstant :< cls, Object :< cls) =>
                          cls -> IO GodotString
get_basic_type_constant cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptBasicTypeConstant_get_basic_type_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptBasicTypeConstant
           "get_basic_type_constant"
           '[]
           (IO GodotString)
         where
        nodeMethod
          = Godot.Core.VisualScriptBasicTypeConstant.get_basic_type_constant

{-# NOINLINE bindVisualScriptBasicTypeConstant_set_basic_type #-}

bindVisualScriptBasicTypeConstant_set_basic_type :: MethodBind
bindVisualScriptBasicTypeConstant_set_basic_type
  = unsafePerformIO $
      withCString "VisualScriptBasicTypeConstant" $
        \ clsNamePtr ->
          withCString "set_basic_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_basic_type ::
                 (VisualScriptBasicTypeConstant :< cls, Object :< cls) =>
                 cls -> Int -> IO ()
set_basic_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptBasicTypeConstant_set_basic_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptBasicTypeConstant "set_basic_type"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualScriptBasicTypeConstant.set_basic_type

{-# NOINLINE bindVisualScriptBasicTypeConstant_set_basic_type_constant
             #-}

bindVisualScriptBasicTypeConstant_set_basic_type_constant ::
                                                          MethodBind
bindVisualScriptBasicTypeConstant_set_basic_type_constant
  = unsafePerformIO $
      withCString "VisualScriptBasicTypeConstant" $
        \ clsNamePtr ->
          withCString "set_basic_type_constant" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_basic_type_constant ::
                          (VisualScriptBasicTypeConstant :< cls, Object :< cls) =>
                          cls -> GodotString -> IO ()
set_basic_type_constant cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptBasicTypeConstant_set_basic_type_constant
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptBasicTypeConstant
           "set_basic_type_constant"
           '[GodotString]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualScriptBasicTypeConstant.set_basic_type_constant