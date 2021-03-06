{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptDeconstruct
       (Godot.Core.VisualScriptDeconstruct._get_elem_cache,
        Godot.Core.VisualScriptDeconstruct._set_elem_cache,
        Godot.Core.VisualScriptDeconstruct.get_deconstruct_type,
        Godot.Core.VisualScriptDeconstruct.set_deconstruct_type)
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

instance NodeProperty VisualScriptDeconstruct "elem_cache" Array
           'False
         where
        nodeProperty
          = (_get_elem_cache, wrapDroppingSetter _set_elem_cache, Nothing)

instance NodeProperty VisualScriptDeconstruct "type" Int 'False
         where
        nodeProperty
          = (get_deconstruct_type, wrapDroppingSetter set_deconstruct_type,
             Nothing)

{-# NOINLINE bindVisualScriptDeconstruct__get_elem_cache #-}

bindVisualScriptDeconstruct__get_elem_cache :: MethodBind
bindVisualScriptDeconstruct__get_elem_cache
  = unsafePerformIO $
      withCString "VisualScriptDeconstruct" $
        \ clsNamePtr ->
          withCString "_get_elem_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_elem_cache ::
                  (VisualScriptDeconstruct :< cls, Object :< cls) => cls -> IO Array
_get_elem_cache cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptDeconstruct__get_elem_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptDeconstruct "_get_elem_cache" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualScriptDeconstruct._get_elem_cache

{-# NOINLINE bindVisualScriptDeconstruct__set_elem_cache #-}

bindVisualScriptDeconstruct__set_elem_cache :: MethodBind
bindVisualScriptDeconstruct__set_elem_cache
  = unsafePerformIO $
      withCString "VisualScriptDeconstruct" $
        \ clsNamePtr ->
          withCString "_set_elem_cache" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_elem_cache ::
                  (VisualScriptDeconstruct :< cls, Object :< cls) =>
                  cls -> Array -> IO ()
_set_elem_cache cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptDeconstruct__set_elem_cache
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptDeconstruct "_set_elem_cache"
           '[Array]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptDeconstruct._set_elem_cache

{-# NOINLINE bindVisualScriptDeconstruct_get_deconstruct_type #-}

bindVisualScriptDeconstruct_get_deconstruct_type :: MethodBind
bindVisualScriptDeconstruct_get_deconstruct_type
  = unsafePerformIO $
      withCString "VisualScriptDeconstruct" $
        \ clsNamePtr ->
          withCString "get_deconstruct_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_deconstruct_type ::
                       (VisualScriptDeconstruct :< cls, Object :< cls) => cls -> IO Int
get_deconstruct_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptDeconstruct_get_deconstruct_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptDeconstruct "get_deconstruct_type"
           '[]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualScriptDeconstruct.get_deconstruct_type

{-# NOINLINE bindVisualScriptDeconstruct_set_deconstruct_type #-}

bindVisualScriptDeconstruct_set_deconstruct_type :: MethodBind
bindVisualScriptDeconstruct_set_deconstruct_type
  = unsafePerformIO $
      withCString "VisualScriptDeconstruct" $
        \ clsNamePtr ->
          withCString "set_deconstruct_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_deconstruct_type ::
                       (VisualScriptDeconstruct :< cls, Object :< cls) =>
                       cls -> Int -> IO ()
set_deconstruct_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualScriptDeconstruct_set_deconstruct_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptDeconstruct "set_deconstruct_type"
           '[Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualScriptDeconstruct.set_deconstruct_type