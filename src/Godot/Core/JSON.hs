{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.JSON
       (Godot.Core.JSON.parse, Godot.Core.JSON.print) where
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
import Godot.Core.Object()

{-# NOINLINE bindJSON_parse #-}

-- | Parses a JSON-encoded string and returns a @JSONParseResult@ containing the result.
bindJSON_parse :: MethodBind
bindJSON_parse
  = unsafePerformIO $
      withCString "_JSON" $
        \ clsNamePtr ->
          withCString "parse" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Parses a JSON-encoded string and returns a @JSONParseResult@ containing the result.
parse ::
        (JSON :< cls, Object :< cls) =>
        cls -> GodotString -> IO JSONParseResult
parse cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSON_parse (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSON "parse" '[GodotString]
           (IO JSONParseResult)
         where
        nodeMethod = Godot.Core.JSON.parse

{-# NOINLINE bindJSON_print #-}

-- | Converts a @Variant@ var to JSON text and returns the result. Useful for serializing data to store or send over the network.
--   				__Note:__ The JSON specification does not define integer or float types, but only a @i@number@/i@ type. Therefore, converting a Variant to JSON text will convert all numerical values to @float@ types.
--   				The @indent@ parameter controls if and how something is indented, the string used for this parameter will be used where there should be an indent in the output, even spaces like @"   "@ will work. @\t@ and @\n@ can also be used for a tab indent, or to make a newline for each indent respectively.
--   				__Example output:__
--   				
--   @
--   
--   				## JSON.print(my_dictionary)
--   				{"name":"my_dictionary","version":"1.0.0","entities":@{"name":"entity_0","value":"value_0"},{"name":"entity_1","value":"value_1"}@}
--   
--   				## JSON.print(my_dictionary, "\t")
--   				{
--   				    "name": "my_dictionary",
--   				    "version": "1.0.0",
--   				    "entities": @
--   				        {
--   				            "name": "entity_0",
--   				            "value": "value_0"
--   				        },
--   				        {
--   				            "name": "entity_1",
--   				            "value": "value_1"
--   				        }
--   				    @
--   				}
--   
--   				## JSON.print(my_dictionary, "...")
--   				{
--   				..."name": "my_dictionary",
--   				..."version": "1.0.0",
--   				..."entities": @
--   				......{
--   				........."name": "entity_0",
--   				........."value": "value_0"
--   				......},
--   				......{
--   				........."name": "entity_1",
--   				........."value": "value_1"
--   				......}
--   				...@
--   				}
--   				
--   @
bindJSON_print :: MethodBind
bindJSON_print
  = unsafePerformIO $
      withCString "_JSON" $
        \ clsNamePtr ->
          withCString "print" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Converts a @Variant@ var to JSON text and returns the result. Useful for serializing data to store or send over the network.
--   				__Note:__ The JSON specification does not define integer or float types, but only a @i@number@/i@ type. Therefore, converting a Variant to JSON text will convert all numerical values to @float@ types.
--   				The @indent@ parameter controls if and how something is indented, the string used for this parameter will be used where there should be an indent in the output, even spaces like @"   "@ will work. @\t@ and @\n@ can also be used for a tab indent, or to make a newline for each indent respectively.
--   				__Example output:__
--   				
--   @
--   
--   				## JSON.print(my_dictionary)
--   				{"name":"my_dictionary","version":"1.0.0","entities":@{"name":"entity_0","value":"value_0"},{"name":"entity_1","value":"value_1"}@}
--   
--   				## JSON.print(my_dictionary, "\t")
--   				{
--   				    "name": "my_dictionary",
--   				    "version": "1.0.0",
--   				    "entities": @
--   				        {
--   				            "name": "entity_0",
--   				            "value": "value_0"
--   				        },
--   				        {
--   				            "name": "entity_1",
--   				            "value": "value_1"
--   				        }
--   				    @
--   				}
--   
--   				## JSON.print(my_dictionary, "...")
--   				{
--   				..."name": "my_dictionary",
--   				..."version": "1.0.0",
--   				..."entities": @
--   				......{
--   				........."name": "entity_0",
--   				........."value": "value_0"
--   				......},
--   				......{
--   				........."name": "entity_1",
--   				........."value": "value_1"
--   				......}
--   				...@
--   				}
--   				
--   @
print ::
        (JSON :< cls, Object :< cls) =>
        cls ->
          GodotVariant -> Maybe GodotString -> Maybe Bool -> IO GodotString
print cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, defaultedVariant VariantString "" arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindJSON_print (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod JSON "print"
           '[GodotVariant, Maybe GodotString, Maybe Bool]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.JSON.print