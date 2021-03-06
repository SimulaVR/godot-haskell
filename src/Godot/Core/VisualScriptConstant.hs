{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptConstant
       (Godot.Core.VisualScriptConstant.get_constant_type,
        Godot.Core.VisualScriptConstant.get_constant_value,
        Godot.Core.VisualScriptConstant.set_constant_type,
        Godot.Core.VisualScriptConstant.set_constant_value)
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

instance NodeProperty VisualScriptConstant "type" Int 'False where
        nodeProperty
          = (get_constant_type, wrapDroppingSetter set_constant_type,
             Nothing)

instance NodeProperty VisualScriptConstant "value" GodotVariant
           'False
         where
        nodeProperty
          = (get_constant_value, wrapDroppingSetter set_constant_value,
             Nothing)

{-# NOINLINE bindVisualScriptConstant_get_constant_type #-}

bindVisualScriptConstant_get_constant_type :: MethodBind
bindVisualScriptConstant_get_constant_type
  = unsafePerformIO $
      withCString "VisualScriptConstant" $
        \ clsNamePtr ->
          withCString "get_constant_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant_type ::
                    (VisualScriptConstant :< cls, Object :< cls) => cls -> IO Int
get_constant_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstant_get_constant_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptConstant "get_constant_type" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptConstant.get_constant_type

{-# NOINLINE bindVisualScriptConstant_get_constant_value #-}

bindVisualScriptConstant_get_constant_value :: MethodBind
bindVisualScriptConstant_get_constant_value
  = unsafePerformIO $
      withCString "VisualScriptConstant" $
        \ clsNamePtr ->
          withCString "get_constant_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_constant_value ::
                     (VisualScriptConstant :< cls, Object :< cls) =>
                     cls -> IO GodotVariant
get_constant_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstant_get_constant_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptConstant "get_constant_value" '[]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.VisualScriptConstant.get_constant_value

{-# NOINLINE bindVisualScriptConstant_set_constant_type #-}

bindVisualScriptConstant_set_constant_type :: MethodBind
bindVisualScriptConstant_set_constant_type
  = unsafePerformIO $
      withCString "VisualScriptConstant" $
        \ clsNamePtr ->
          withCString "set_constant_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constant_type ::
                    (VisualScriptConstant :< cls, Object :< cls) => cls -> Int -> IO ()
set_constant_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstant_set_constant_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptConstant "set_constant_type" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptConstant.set_constant_type

{-# NOINLINE bindVisualScriptConstant_set_constant_value #-}

bindVisualScriptConstant_set_constant_value :: MethodBind
bindVisualScriptConstant_set_constant_value
  = unsafePerformIO $
      withCString "VisualScriptConstant" $
        \ clsNamePtr ->
          withCString "set_constant_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_constant_value ::
                     (VisualScriptConstant :< cls, Object :< cls) =>
                     cls -> GodotVariant -> IO ()
set_constant_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptConstant_set_constant_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptConstant "set_constant_value"
           '[GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptConstant.set_constant_value