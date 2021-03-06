{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptReturn
       (Godot.Core.VisualScriptReturn.get_return_type,
        Godot.Core.VisualScriptReturn.is_return_value_enabled,
        Godot.Core.VisualScriptReturn.set_enable_return_value,
        Godot.Core.VisualScriptReturn.set_return_type)
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

instance NodeProperty VisualScriptReturn "return_enabled" Bool
           'False
         where
        nodeProperty
          = (is_return_value_enabled,
             wrapDroppingSetter set_enable_return_value, Nothing)

instance NodeProperty VisualScriptReturn "return_type" Int 'False
         where
        nodeProperty
          = (get_return_type, wrapDroppingSetter set_return_type, Nothing)

{-# NOINLINE bindVisualScriptReturn_get_return_type #-}

bindVisualScriptReturn_get_return_type :: MethodBind
bindVisualScriptReturn_get_return_type
  = unsafePerformIO $
      withCString "VisualScriptReturn" $
        \ clsNamePtr ->
          withCString "get_return_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_return_type ::
                  (VisualScriptReturn :< cls, Object :< cls) => cls -> IO Int
get_return_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptReturn_get_return_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptReturn "get_return_type" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptReturn.get_return_type

{-# NOINLINE bindVisualScriptReturn_is_return_value_enabled #-}

bindVisualScriptReturn_is_return_value_enabled :: MethodBind
bindVisualScriptReturn_is_return_value_enabled
  = unsafePerformIO $
      withCString "VisualScriptReturn" $
        \ clsNamePtr ->
          withCString "is_return_value_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_return_value_enabled ::
                          (VisualScriptReturn :< cls, Object :< cls) => cls -> IO Bool
is_return_value_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptReturn_is_return_value_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptReturn "is_return_value_enabled"
           '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualScriptReturn.is_return_value_enabled

{-# NOINLINE bindVisualScriptReturn_set_enable_return_value #-}

bindVisualScriptReturn_set_enable_return_value :: MethodBind
bindVisualScriptReturn_set_enable_return_value
  = unsafePerformIO $
      withCString "VisualScriptReturn" $
        \ clsNamePtr ->
          withCString "set_enable_return_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_enable_return_value ::
                          (VisualScriptReturn :< cls, Object :< cls) => cls -> Bool -> IO ()
set_enable_return_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptReturn_set_enable_return_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptReturn "set_enable_return_value"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptReturn.set_enable_return_value

{-# NOINLINE bindVisualScriptReturn_set_return_type #-}

bindVisualScriptReturn_set_return_type :: MethodBind
bindVisualScriptReturn_set_return_type
  = unsafePerformIO $
      withCString "VisualScriptReturn" $
        \ clsNamePtr ->
          withCString "set_return_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_return_type ::
                  (VisualScriptReturn :< cls, Object :< cls) => cls -> Int -> IO ()
set_return_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptReturn_set_return_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptReturn "set_return_type" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptReturn.set_return_type