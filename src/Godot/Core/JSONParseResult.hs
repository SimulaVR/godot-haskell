{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.JSONParseResult
       (Godot.Core.JSONParseResult.get_error,
        Godot.Core.JSONParseResult.get_error_line,
        Godot.Core.JSONParseResult.get_error_string,
        Godot.Core.JSONParseResult.get_result,
        Godot.Core.JSONParseResult.set_error,
        Godot.Core.JSONParseResult.set_error_line,
        Godot.Core.JSONParseResult.set_error_string,
        Godot.Core.JSONParseResult.set_result)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindJSONParseResult_get_error #-}

-- | The error type if JSON source was not successfully parsed. See [@GlobalScope] ERR_* constants.
bindJSONParseResult_get_error :: MethodBind
bindJSONParseResult_get_error
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "get_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The error type if JSON source was not successfully parsed. See [@GlobalScope] ERR_* constants.
get_error ::
            (JSONParseResult :< cls, Object :< cls) => cls -> IO Int
get_error cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_get_error (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONParseResult_get_error_line #-}

-- | The line number where the error occurred if JSON source was not successfully parsed.
bindJSONParseResult_get_error_line :: MethodBind
bindJSONParseResult_get_error_line
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "get_error_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line number where the error occurred if JSON source was not successfully parsed.
get_error_line ::
                 (JSONParseResult :< cls, Object :< cls) => cls -> IO Int
get_error_line cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_get_error_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONParseResult_get_error_string #-}

-- | The error message if JSON source was not successfully parsed. See [@GlobalScope] ERR_* constants.
bindJSONParseResult_get_error_string :: MethodBind
bindJSONParseResult_get_error_string
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "get_error_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The error message if JSON source was not successfully parsed. See [@GlobalScope] ERR_* constants.
get_error_string ::
                   (JSONParseResult :< cls, Object :< cls) => cls -> IO GodotString
get_error_string cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_get_error_string
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONParseResult_get_result #-}

-- | A [Variant] containing the parsed JSON. Use typeof() to check if it is what you expect. For example, if JSON source starts with curly braces ([code]{}[/code]) a [Dictionary] will be returned, if JSON source starts with braces ([code][][/code]) an [Array] will be returned.
--   			[i]Be aware that the JSON specification does not define integer or float types, but only a number type. Therefore, parsing a JSON text will convert all numerical values to float types.[/i]
--   			Note that JSON objects do not preserve key order like Godot dictionaries, thus you should not rely on keys being in a certain order if a dictionary is constructed from JSON. In contrast, JSON arrays retain the order of their elements:[/i]
--   			[codeblock]
--   			var p = JSON.parse('["hello", "world", "!"]')
--   			if typeof(p.result) == TYPE_ARRAY:
--   			    print(p.result[0]) # prints 'hello'
--   			else:
--   			    print("unexpected results")
--   			[/codeblock]
bindJSONParseResult_get_result :: MethodBind
bindJSONParseResult_get_result
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "get_result" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A [Variant] containing the parsed JSON. Use typeof() to check if it is what you expect. For example, if JSON source starts with curly braces ([code]{}[/code]) a [Dictionary] will be returned, if JSON source starts with braces ([code][][/code]) an [Array] will be returned.
--   			[i]Be aware that the JSON specification does not define integer or float types, but only a number type. Therefore, parsing a JSON text will convert all numerical values to float types.[/i]
--   			Note that JSON objects do not preserve key order like Godot dictionaries, thus you should not rely on keys being in a certain order if a dictionary is constructed from JSON. In contrast, JSON arrays retain the order of their elements:[/i]
--   			[codeblock]
--   			var p = JSON.parse('["hello", "world", "!"]')
--   			if typeof(p.result) == TYPE_ARRAY:
--   			    print(p.result[0]) # prints 'hello'
--   			else:
--   			    print("unexpected results")
--   			[/codeblock]
get_result ::
             (JSONParseResult :< cls, Object :< cls) => cls -> IO GodotVariant
get_result cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_get_result (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONParseResult_set_error #-}

-- | The error type if JSON source was not successfully parsed. See [@GlobalScope] ERR_* constants.
bindJSONParseResult_set_error :: MethodBind
bindJSONParseResult_set_error
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "set_error" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The error type if JSON source was not successfully parsed. See [@GlobalScope] ERR_* constants.
set_error ::
            (JSONParseResult :< cls, Object :< cls) => cls -> Int -> IO ()
set_error cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_set_error (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONParseResult_set_error_line #-}

-- | The line number where the error occurred if JSON source was not successfully parsed.
bindJSONParseResult_set_error_line :: MethodBind
bindJSONParseResult_set_error_line
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "set_error_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The line number where the error occurred if JSON source was not successfully parsed.
set_error_line ::
                 (JSONParseResult :< cls, Object :< cls) => cls -> Int -> IO ()
set_error_line cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_set_error_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONParseResult_set_error_string #-}

-- | The error message if JSON source was not successfully parsed. See [@GlobalScope] ERR_* constants.
bindJSONParseResult_set_error_string :: MethodBind
bindJSONParseResult_set_error_string
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "set_error_string" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The error message if JSON source was not successfully parsed. See [@GlobalScope] ERR_* constants.
set_error_string ::
                   (JSONParseResult :< cls, Object :< cls) =>
                   cls -> GodotString -> IO ()
set_error_string cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_set_error_string
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSONParseResult_set_result #-}

-- | A [Variant] containing the parsed JSON. Use typeof() to check if it is what you expect. For example, if JSON source starts with curly braces ([code]{}[/code]) a [Dictionary] will be returned, if JSON source starts with braces ([code][][/code]) an [Array] will be returned.
--   			[i]Be aware that the JSON specification does not define integer or float types, but only a number type. Therefore, parsing a JSON text will convert all numerical values to float types.[/i]
--   			Note that JSON objects do not preserve key order like Godot dictionaries, thus you should not rely on keys being in a certain order if a dictionary is constructed from JSON. In contrast, JSON arrays retain the order of their elements:[/i]
--   			[codeblock]
--   			var p = JSON.parse('["hello", "world", "!"]')
--   			if typeof(p.result) == TYPE_ARRAY:
--   			    print(p.result[0]) # prints 'hello'
--   			else:
--   			    print("unexpected results")
--   			[/codeblock]
bindJSONParseResult_set_result :: MethodBind
bindJSONParseResult_set_result
  = unsafePerformIO $
      withCString "JSONParseResult" $
        \ clsNamePtr ->
          withCString "set_result" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A [Variant] containing the parsed JSON. Use typeof() to check if it is what you expect. For example, if JSON source starts with curly braces ([code]{}[/code]) a [Dictionary] will be returned, if JSON source starts with braces ([code][][/code]) an [Array] will be returned.
--   			[i]Be aware that the JSON specification does not define integer or float types, but only a number type. Therefore, parsing a JSON text will convert all numerical values to float types.[/i]
--   			Note that JSON objects do not preserve key order like Godot dictionaries, thus you should not rely on keys being in a certain order if a dictionary is constructed from JSON. In contrast, JSON arrays retain the order of their elements:[/i]
--   			[codeblock]
--   			var p = JSON.parse('["hello", "world", "!"]')
--   			if typeof(p.result) == TYPE_ARRAY:
--   			    print(p.result[0]) # prints 'hello'
--   			else:
--   			    print("unexpected results")
--   			[/codeblock]
set_result ::
             (JSONParseResult :< cls, Object :< cls) =>
             cls -> GodotVariant -> IO ()
set_result cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSONParseResult_set_result (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)