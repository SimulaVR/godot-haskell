{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeCompare
       (Godot.Core.VisualShaderNodeCompare._FUNC_GREATER_THAN_EQUAL,
        Godot.Core.VisualShaderNodeCompare._FUNC_GREATER_THAN,
        Godot.Core.VisualShaderNodeCompare._CTYPE_SCALAR,
        Godot.Core.VisualShaderNodeCompare._CTYPE_TRANSFORM,
        Godot.Core.VisualShaderNodeCompare._FUNC_LESS_THAN,
        Godot.Core.VisualShaderNodeCompare._FUNC_NOT_EQUAL,
        Godot.Core.VisualShaderNodeCompare._COND_ANY,
        Godot.Core.VisualShaderNodeCompare._FUNC_LESS_THAN_EQUAL,
        Godot.Core.VisualShaderNodeCompare._CTYPE_VECTOR,
        Godot.Core.VisualShaderNodeCompare._FUNC_EQUAL,
        Godot.Core.VisualShaderNodeCompare._COND_ALL,
        Godot.Core.VisualShaderNodeCompare._CTYPE_BOOLEAN,
        Godot.Core.VisualShaderNodeCompare.get_comparison_type,
        Godot.Core.VisualShaderNodeCompare.get_condition,
        Godot.Core.VisualShaderNodeCompare.get_function,
        Godot.Core.VisualShaderNodeCompare.set_comparison_type,
        Godot.Core.VisualShaderNodeCompare.set_condition,
        Godot.Core.VisualShaderNodeCompare.set_function)
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
import Godot.Core.VisualShaderNode()

_FUNC_GREATER_THAN_EQUAL :: Int
_FUNC_GREATER_THAN_EQUAL = 3

_FUNC_GREATER_THAN :: Int
_FUNC_GREATER_THAN = 2

_CTYPE_SCALAR :: Int
_CTYPE_SCALAR = 0

_CTYPE_TRANSFORM :: Int
_CTYPE_TRANSFORM = 3

_FUNC_LESS_THAN :: Int
_FUNC_LESS_THAN = 4

_FUNC_NOT_EQUAL :: Int
_FUNC_NOT_EQUAL = 1

_COND_ANY :: Int
_COND_ANY = 1

_FUNC_LESS_THAN_EQUAL :: Int
_FUNC_LESS_THAN_EQUAL = 5

_CTYPE_VECTOR :: Int
_CTYPE_VECTOR = 1

_FUNC_EQUAL :: Int
_FUNC_EQUAL = 0

_COND_ALL :: Int
_COND_ALL = 0

_CTYPE_BOOLEAN :: Int
_CTYPE_BOOLEAN = 2

instance NodeProperty VisualShaderNodeCompare "condition" Int
           'False
         where
        nodeProperty
          = (get_condition, wrapDroppingSetter set_condition, Nothing)

instance NodeProperty VisualShaderNodeCompare "function" Int 'False
         where
        nodeProperty
          = (get_function, wrapDroppingSetter set_function, Nothing)

instance NodeProperty VisualShaderNodeCompare "type" Int 'False
         where
        nodeProperty
          = (get_comparison_type, wrapDroppingSetter set_comparison_type,
             Nothing)

{-# NOINLINE bindVisualShaderNodeCompare_get_comparison_type #-}

-- | The type to be used in the comparison. See @enum ComparisonType@ for options.
bindVisualShaderNodeCompare_get_comparison_type :: MethodBind
bindVisualShaderNodeCompare_get_comparison_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCompare" $
        \ clsNamePtr ->
          withCString "get_comparison_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The type to be used in the comparison. See @enum ComparisonType@ for options.
get_comparison_type ::
                      (VisualShaderNodeCompare :< cls, Object :< cls) => cls -> IO Int
get_comparison_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCompare_get_comparison_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCompare "get_comparison_type"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeCompare.get_comparison_type

{-# NOINLINE bindVisualShaderNodeCompare_get_condition #-}

-- | Extra condition which is applied if @type@ is set to @CTYPE_VECTOR@.
bindVisualShaderNodeCompare_get_condition :: MethodBind
bindVisualShaderNodeCompare_get_condition
  = unsafePerformIO $
      withCString "VisualShaderNodeCompare" $
        \ clsNamePtr ->
          withCString "get_condition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Extra condition which is applied if @type@ is set to @CTYPE_VECTOR@.
get_condition ::
                (VisualShaderNodeCompare :< cls, Object :< cls) => cls -> IO Int
get_condition cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCompare_get_condition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCompare "get_condition" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeCompare.get_condition

{-# NOINLINE bindVisualShaderNodeCompare_get_function #-}

-- | A comparison function. See @enum Function@ for options.
bindVisualShaderNodeCompare_get_function :: MethodBind
bindVisualShaderNodeCompare_get_function
  = unsafePerformIO $
      withCString "VisualShaderNodeCompare" $
        \ clsNamePtr ->
          withCString "get_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A comparison function. See @enum Function@ for options.
get_function ::
               (VisualShaderNodeCompare :< cls, Object :< cls) => cls -> IO Int
get_function cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCompare_get_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCompare "get_function" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualShaderNodeCompare.get_function

{-# NOINLINE bindVisualShaderNodeCompare_set_comparison_type #-}

-- | The type to be used in the comparison. See @enum ComparisonType@ for options.
bindVisualShaderNodeCompare_set_comparison_type :: MethodBind
bindVisualShaderNodeCompare_set_comparison_type
  = unsafePerformIO $
      withCString "VisualShaderNodeCompare" $
        \ clsNamePtr ->
          withCString "set_comparison_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The type to be used in the comparison. See @enum ComparisonType@ for options.
set_comparison_type ::
                      (VisualShaderNodeCompare :< cls, Object :< cls) =>
                      cls -> Int -> IO ()
set_comparison_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeCompare_set_comparison_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCompare "set_comparison_type"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeCompare.set_comparison_type

{-# NOINLINE bindVisualShaderNodeCompare_set_condition #-}

-- | Extra condition which is applied if @type@ is set to @CTYPE_VECTOR@.
bindVisualShaderNodeCompare_set_condition :: MethodBind
bindVisualShaderNodeCompare_set_condition
  = unsafePerformIO $
      withCString "VisualShaderNodeCompare" $
        \ clsNamePtr ->
          withCString "set_condition" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Extra condition which is applied if @type@ is set to @CTYPE_VECTOR@.
set_condition ::
                (VisualShaderNodeCompare :< cls, Object :< cls) =>
                cls -> Int -> IO ()
set_condition cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCompare_set_condition
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCompare "set_condition" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeCompare.set_condition

{-# NOINLINE bindVisualShaderNodeCompare_set_function #-}

-- | A comparison function. See @enum Function@ for options.
bindVisualShaderNodeCompare_set_function :: MethodBind
bindVisualShaderNodeCompare_set_function
  = unsafePerformIO $
      withCString "VisualShaderNodeCompare" $
        \ clsNamePtr ->
          withCString "set_function" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A comparison function. See @enum Function@ for options.
set_function ::
               (VisualShaderNodeCompare :< cls, Object :< cls) =>
               cls -> Int -> IO ()
set_function cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeCompare_set_function
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeCompare "set_function" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeCompare.set_function