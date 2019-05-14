{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Expression
       (Godot.Core.Expression.parse, Godot.Core.Expression.execute,
        Godot.Core.Expression.has_execute_failed,
        Godot.Core.Expression.get_error_text)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindExpression_parse #-}

-- | Parses the expression and returns a [enum @GlobalScope.Error].
--   				You can optionally specify names of variables that may appear in the expression with [code]input_names[/code], so that you can bind them when it gets executed.
bindExpression_parse :: MethodBind
bindExpression_parse
  = unsafePerformIO $
      withCString "Expression" $
        \ clsNamePtr ->
          withCString "parse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Parses the expression and returns a [enum @GlobalScope.Error].
--   				You can optionally specify names of variables that may appear in the expression with [code]input_names[/code], so that you can bind them when it gets executed.
parse ::
        (Expression :< cls, Object :< cls) =>
        cls -> GodotString -> PoolStringArray -> IO Int
parse cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindExpression_parse (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindExpression_execute #-}

-- | Executes the expression that was previously parsed by [method parse] and returns the result. Before you use the returned object, you should check if the method failed by calling [method has_execute_failed].
--   				If you defined input variables in [method parse], you can specify their values in the inputs array, in the same order.
bindExpression_execute :: MethodBind
bindExpression_execute
  = unsafePerformIO $
      withCString "Expression" $
        \ clsNamePtr ->
          withCString "execute" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Executes the expression that was previously parsed by [method parse] and returns the result. Before you use the returned object, you should check if the method failed by calling [method has_execute_failed].
--   				If you defined input variables in [method parse], you can specify their values in the inputs array, in the same order.
execute ::
          (Expression :< cls, Object :< cls) =>
          cls -> Array -> Object -> Bool -> IO GodotVariant
execute cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindExpression_execute (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindExpression_has_execute_failed #-}

-- | Returns [code]true[/code] if [method execute] has failed.
bindExpression_has_execute_failed :: MethodBind
bindExpression_has_execute_failed
  = unsafePerformIO $
      withCString "Expression" $
        \ clsNamePtr ->
          withCString "has_execute_failed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if [method execute] has failed.
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

{-# NOINLINE bindExpression_get_error_text #-}

-- | Returns the error text if [method parse] has failed.
bindExpression_get_error_text :: MethodBind
bindExpression_get_error_text
  = unsafePerformIO $
      withCString "Expression" $
        \ clsNamePtr ->
          withCString "get_error_text" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the error text if [method parse] has failed.
get_error_text ::
                 (Expression :< cls, Object :< cls) => cls -> IO GodotString
get_error_text cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindExpression_get_error_text (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)