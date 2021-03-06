{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Expression
       (Godot.Core.Expression.execute,
        Godot.Core.Expression.get_error_text,
        Godot.Core.Expression.has_execute_failed,
        Godot.Core.Expression.parse)
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

{-# NOINLINE bindExpression_execute #-}

-- | Executes the expression that was previously parsed by @method parse@ and returns the result. Before you use the returned object, you should check if the method failed by calling @method has_execute_failed@.
--   				If you defined input variables in @method parse@, you can specify their values in the inputs array, in the same order.
bindExpression_execute :: MethodBind
bindExpression_execute
  = unsafePerformIO $
      withCString "Expression" $
        \ clsNamePtr ->
          withCString "execute" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Executes the expression that was previously parsed by @method parse@ and returns the result. Before you use the returned object, you should check if the method failed by calling @method has_execute_failed@.
--   				If you defined input variables in @method parse@, you can specify their values in the inputs array, in the same order.
execute ::
          (Expression :< cls, Object :< cls) =>
          cls -> Maybe Array -> Maybe Object -> Maybe Bool -> IO GodotVariant
execute cls arg1 arg2 arg3
  = withVariantArray
      [defaultedVariant VariantArray V.empty arg1,
       maybe VariantNil toVariant arg2,
       maybe (VariantBool True) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindExpression_execute (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Expression "execute"
           '[Maybe Array, Maybe Object, Maybe Bool]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.Expression.execute

{-# NOINLINE bindExpression_get_error_text #-}

-- | Returns the error text if @method parse@ has failed.
bindExpression_get_error_text :: MethodBind
bindExpression_get_error_text
  = unsafePerformIO $
      withCString "Expression" $
        \ clsNamePtr ->
          withCString "get_error_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the error text if @method parse@ has failed.
get_error_text ::
                 (Expression :< cls, Object :< cls) => cls -> IO GodotString
get_error_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindExpression_get_error_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Expression "get_error_text" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.Expression.get_error_text

{-# NOINLINE bindExpression_has_execute_failed #-}

-- | Returns @true@ if @method execute@ has failed.
bindExpression_has_execute_failed :: MethodBind
bindExpression_has_execute_failed
  = unsafePerformIO $
      withCString "Expression" $
        \ clsNamePtr ->
          withCString "has_execute_failed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if @method execute@ has failed.
has_execute_failed ::
                     (Expression :< cls, Object :< cls) => cls -> IO Bool
has_execute_failed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindExpression_has_execute_failed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Expression "has_execute_failed" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Expression.has_execute_failed

{-# NOINLINE bindExpression_parse #-}

-- | Parses the expression and returns an @enum Error@ code.
--   				You can optionally specify names of variables that may appear in the expression with @input_names@, so that you can bind them when it gets executed.
bindExpression_parse :: MethodBind
bindExpression_parse
  = unsafePerformIO $
      withCString "Expression" $
        \ clsNamePtr ->
          withCString "parse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Parses the expression and returns an @enum Error@ code.
--   				You can optionally specify names of variables that may appear in the expression with @input_names@, so that you can bind them when it gets executed.
parse ::
        (Expression :< cls, Object :< cls) =>
        cls -> GodotString -> Maybe PoolStringArray -> IO Int
parse cls arg1 arg2
  = withVariantArray
      [toVariant arg1,
       defaultedVariant VariantPoolStringArray V.empty arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindExpression_parse (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Expression "parse"
           '[GodotString, Maybe PoolStringArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.Expression.parse