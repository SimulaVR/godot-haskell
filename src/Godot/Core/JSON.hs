{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.JSON
       (Godot.Core.JSON.parse, Godot.Core.JSON.print) where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindJSON_parse #-}

-- | Parses a JSON-encoded string and returns a [JSONParseResult] containing the result.
bindJSON_parse :: MethodBind
bindJSON_parse
  = unsafePerformIO $
      withCString "_JSON" $
        \ clsNamePtr ->
          withCString "parse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Parses a JSON-encoded string and returns a [JSONParseResult] containing the result.
parse ::
        (JSON :< cls, Object :< cls) =>
        cls -> GodotString -> IO JSONParseResult
parse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSON_parse (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindJSON_print #-}

-- | Converts a [Variant] var to JSON text and returns the result. Useful for serializing data to store or send over the network.
--   				[b]Note:[/b] The JSON specification does not define integer or float types, but only a [i]number[/i] type. Therefore, converting a Variant to JSON text will convert all numerical values to [float] types.
--   				Use [code]indent[/code] parameter to pretty print the output.
--   				[b]Example output:[/b]
--   				[codeblock]
--   				## JSON.print(my_dictionary)
--   				{"name":"my_dictionary","version":"1.0.0","entities":[{"name":"entity_0","value":"value_0"},{"name":"entity_1","value":"value_1"}]}
--   
--   				## JSON.print(my_dictionary, "\t")
--   				{
--   				        "name": "my_dictionary",
--   				        "version": "1.0.0",
--   				        "entities": [
--   				                {
--   				                        "name": "entity_0",
--   				                        "value": "value_0"
--   				                },
--   				                {
--   				                        "name": "entity_1",
--   				                        "value": "value_1"
--   				                }
--   				        ]
--   				}
--   				[/codeblock]
bindJSON_print :: MethodBind
bindJSON_print
  = unsafePerformIO $
      withCString "_JSON" $
        \ clsNamePtr ->
          withCString "print" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts a [Variant] var to JSON text and returns the result. Useful for serializing data to store or send over the network.
--   				[b]Note:[/b] The JSON specification does not define integer or float types, but only a [i]number[/i] type. Therefore, converting a Variant to JSON text will convert all numerical values to [float] types.
--   				Use [code]indent[/code] parameter to pretty print the output.
--   				[b]Example output:[/b]
--   				[codeblock]
--   				## JSON.print(my_dictionary)
--   				{"name":"my_dictionary","version":"1.0.0","entities":[{"name":"entity_0","value":"value_0"},{"name":"entity_1","value":"value_1"}]}
--   
--   				## JSON.print(my_dictionary, "\t")
--   				{
--   				        "name": "my_dictionary",
--   				        "version": "1.0.0",
--   				        "entities": [
--   				                {
--   				                        "name": "entity_0",
--   				                        "value": "value_0"
--   				                },
--   				                {
--   				                        "name": "entity_1",
--   				                        "value": "value_1"
--   				                }
--   				        ]
--   				}
--   				[/codeblock]
print ::
        (JSON :< cls, Object :< cls) =>
        cls -> GodotVariant -> GodotString -> Bool -> IO GodotString
print cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSON_print (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)