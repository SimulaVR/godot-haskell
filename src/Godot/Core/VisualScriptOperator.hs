{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptOperator
       (Godot.Core.VisualScriptOperator.get_operator,
        Godot.Core.VisualScriptOperator.get_typed,
        Godot.Core.VisualScriptOperator.set_operator,
        Godot.Core.VisualScriptOperator.set_typed)
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

instance NodeProperty VisualScriptOperator "operator" Int 'False
         where
        nodeProperty
          = (get_operator, wrapDroppingSetter set_operator, Nothing)

instance NodeProperty VisualScriptOperator "type" Int 'False where
        nodeProperty = (get_typed, wrapDroppingSetter set_typed, Nothing)

{-# NOINLINE bindVisualScriptOperator_get_operator #-}

bindVisualScriptOperator_get_operator :: MethodBind
bindVisualScriptOperator_get_operator
  = unsafePerformIO $
      withCString "VisualScriptOperator" $
        \ clsNamePtr ->
          withCString "get_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_operator ::
               (VisualScriptOperator :< cls, Object :< cls) => cls -> IO Int
get_operator cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptOperator_get_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptOperator "get_operator" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptOperator.get_operator

{-# NOINLINE bindVisualScriptOperator_get_typed #-}

bindVisualScriptOperator_get_typed :: MethodBind
bindVisualScriptOperator_get_typed
  = unsafePerformIO $
      withCString "VisualScriptOperator" $
        \ clsNamePtr ->
          withCString "get_typed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_typed ::
            (VisualScriptOperator :< cls, Object :< cls) => cls -> IO Int
get_typed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptOperator_get_typed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptOperator "get_typed" '[] (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptOperator.get_typed

{-# NOINLINE bindVisualScriptOperator_set_operator #-}

bindVisualScriptOperator_set_operator :: MethodBind
bindVisualScriptOperator_set_operator
  = unsafePerformIO $
      withCString "VisualScriptOperator" $
        \ clsNamePtr ->
          withCString "set_operator" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_operator ::
               (VisualScriptOperator :< cls, Object :< cls) => cls -> Int -> IO ()
set_operator cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptOperator_set_operator
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptOperator "set_operator" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptOperator.set_operator

{-# NOINLINE bindVisualScriptOperator_set_typed #-}

bindVisualScriptOperator_set_typed :: MethodBind
bindVisualScriptOperator_set_typed
  = unsafePerformIO $
      withCString "VisualScriptOperator" $
        \ clsNamePtr ->
          withCString "set_typed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_typed ::
            (VisualScriptOperator :< cls, Object :< cls) => cls -> Int -> IO ()
set_typed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptOperator_set_typed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptOperator "set_typed" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptOperator.set_typed