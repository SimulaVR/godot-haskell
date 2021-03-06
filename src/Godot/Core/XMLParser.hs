{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.XMLParser
       (Godot.Core.XMLParser._NODE_UNKNOWN,
        Godot.Core.XMLParser._NODE_ELEMENT,
        Godot.Core.XMLParser._NODE_CDATA,
        Godot.Core.XMLParser._NODE_COMMENT,
        Godot.Core.XMLParser._NODE_TEXT, Godot.Core.XMLParser._NODE_NONE,
        Godot.Core.XMLParser._NODE_ELEMENT_END,
        Godot.Core.XMLParser.get_attribute_count,
        Godot.Core.XMLParser.get_attribute_name,
        Godot.Core.XMLParser.get_attribute_value,
        Godot.Core.XMLParser.get_current_line,
        Godot.Core.XMLParser.get_named_attribute_value,
        Godot.Core.XMLParser.get_named_attribute_value_safe,
        Godot.Core.XMLParser.get_node_data,
        Godot.Core.XMLParser.get_node_name,
        Godot.Core.XMLParser.get_node_offset,
        Godot.Core.XMLParser.get_node_type,
        Godot.Core.XMLParser.has_attribute, Godot.Core.XMLParser.is_empty,
        Godot.Core.XMLParser.open, Godot.Core.XMLParser.open_buffer,
        Godot.Core.XMLParser.read, Godot.Core.XMLParser.seek,
        Godot.Core.XMLParser.skip_section)
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

_NODE_UNKNOWN :: Int
_NODE_UNKNOWN = 6

_NODE_ELEMENT :: Int
_NODE_ELEMENT = 1

_NODE_CDATA :: Int
_NODE_CDATA = 5

_NODE_COMMENT :: Int
_NODE_COMMENT = 4

_NODE_TEXT :: Int
_NODE_TEXT = 3

_NODE_NONE :: Int
_NODE_NONE = 0

_NODE_ELEMENT_END :: Int
_NODE_ELEMENT_END = 2

{-# NOINLINE bindXMLParser_get_attribute_count #-}

-- | Gets the amount of attributes in the current element.
bindXMLParser_get_attribute_count :: MethodBind
bindXMLParser_get_attribute_count
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_attribute_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the amount of attributes in the current element.
get_attribute_count ::
                      (XMLParser :< cls, Object :< cls) => cls -> IO Int
get_attribute_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_attribute_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_attribute_count" '[] (IO Int)
         where
        nodeMethod = Godot.Core.XMLParser.get_attribute_count

{-# NOINLINE bindXMLParser_get_attribute_name #-}

-- | Gets the name of the attribute specified by the index in @idx@ argument.
bindXMLParser_get_attribute_name :: MethodBind
bindXMLParser_get_attribute_name
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_attribute_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the name of the attribute specified by the index in @idx@ argument.
get_attribute_name ::
                     (XMLParser :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_attribute_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_attribute_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_attribute_name" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.XMLParser.get_attribute_name

{-# NOINLINE bindXMLParser_get_attribute_value #-}

-- | Gets the value of the attribute specified by the index in @idx@ argument.
bindXMLParser_get_attribute_value :: MethodBind
bindXMLParser_get_attribute_value
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_attribute_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the value of the attribute specified by the index in @idx@ argument.
get_attribute_value ::
                      (XMLParser :< cls, Object :< cls) => cls -> Int -> IO GodotString
get_attribute_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_attribute_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_attribute_value" '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.XMLParser.get_attribute_value

{-# NOINLINE bindXMLParser_get_current_line #-}

-- | Gets the current line in the parsed file (currently not implemented).
bindXMLParser_get_current_line :: MethodBind
bindXMLParser_get_current_line
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_current_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the current line in the parsed file (currently not implemented).
get_current_line ::
                   (XMLParser :< cls, Object :< cls) => cls -> IO Int
get_current_line cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_current_line (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_current_line" '[] (IO Int) where
        nodeMethod = Godot.Core.XMLParser.get_current_line

{-# NOINLINE bindXMLParser_get_named_attribute_value #-}

-- | Gets the value of a certain attribute of the current element by name. This will raise an error if the element has no such attribute.
bindXMLParser_get_named_attribute_value :: MethodBind
bindXMLParser_get_named_attribute_value
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_named_attribute_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the value of a certain attribute of the current element by name. This will raise an error if the element has no such attribute.
get_named_attribute_value ::
                            (XMLParser :< cls, Object :< cls) =>
                            cls -> GodotString -> IO GodotString
get_named_attribute_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_named_attribute_value
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_named_attribute_value"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.XMLParser.get_named_attribute_value

{-# NOINLINE bindXMLParser_get_named_attribute_value_safe #-}

-- | Gets the value of a certain attribute of the current element by name. This will return an empty @String@ if the attribute is not found.
bindXMLParser_get_named_attribute_value_safe :: MethodBind
bindXMLParser_get_named_attribute_value_safe
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_named_attribute_value_safe" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the value of a certain attribute of the current element by name. This will return an empty @String@ if the attribute is not found.
get_named_attribute_value_safe ::
                                 (XMLParser :< cls, Object :< cls) =>
                                 cls -> GodotString -> IO GodotString
get_named_attribute_value_safe cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_named_attribute_value_safe
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_named_attribute_value_safe"
           '[GodotString]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.XMLParser.get_named_attribute_value_safe

{-# NOINLINE bindXMLParser_get_node_data #-}

-- | Gets the contents of a text node. This will raise an error in any other type of node.
bindXMLParser_get_node_data :: MethodBind
bindXMLParser_get_node_data
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_node_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the contents of a text node. This will raise an error in any other type of node.
get_node_data ::
                (XMLParser :< cls, Object :< cls) => cls -> IO GodotString
get_node_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_node_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_node_data" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.XMLParser.get_node_data

{-# NOINLINE bindXMLParser_get_node_name #-}

-- | Gets the name of the current element node. This will raise an error if the current node type is neither @NODE_ELEMENT@ nor @NODE_ELEMENT_END@.
bindXMLParser_get_node_name :: MethodBind
bindXMLParser_get_node_name
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_node_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the name of the current element node. This will raise an error if the current node type is neither @NODE_ELEMENT@ nor @NODE_ELEMENT_END@.
get_node_name ::
                (XMLParser :< cls, Object :< cls) => cls -> IO GodotString
get_node_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_node_name (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_node_name" '[] (IO GodotString)
         where
        nodeMethod = Godot.Core.XMLParser.get_node_name

{-# NOINLINE bindXMLParser_get_node_offset #-}

-- | Gets the byte offset of the current node since the beginning of the file or buffer.
bindXMLParser_get_node_offset :: MethodBind
bindXMLParser_get_node_offset
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_node_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the byte offset of the current node since the beginning of the file or buffer.
get_node_offset ::
                  (XMLParser :< cls, Object :< cls) => cls -> IO Int
get_node_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_node_offset (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_node_offset" '[] (IO Int) where
        nodeMethod = Godot.Core.XMLParser.get_node_offset

{-# NOINLINE bindXMLParser_get_node_type #-}

-- | Gets the type of the current node. Compare with @enum NodeType@ constants.
bindXMLParser_get_node_type :: MethodBind
bindXMLParser_get_node_type
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "get_node_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Gets the type of the current node. Compare with @enum NodeType@ constants.
get_node_type :: (XMLParser :< cls, Object :< cls) => cls -> IO Int
get_node_type cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_get_node_type (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "get_node_type" '[] (IO Int) where
        nodeMethod = Godot.Core.XMLParser.get_node_type

{-# NOINLINE bindXMLParser_has_attribute #-}

-- | Check whether the current element has a certain attribute.
bindXMLParser_has_attribute :: MethodBind
bindXMLParser_has_attribute
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "has_attribute" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Check whether the current element has a certain attribute.
has_attribute ::
                (XMLParser :< cls, Object :< cls) => cls -> GodotString -> IO Bool
has_attribute cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_has_attribute (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "has_attribute" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.XMLParser.has_attribute

{-# NOINLINE bindXMLParser_is_empty #-}

-- | Check whether the current element is empty (this only works for completely empty tags, e.g. @<element \>@).
bindXMLParser_is_empty :: MethodBind
bindXMLParser_is_empty
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "is_empty" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Check whether the current element is empty (this only works for completely empty tags, e.g. @<element \>@).
is_empty :: (XMLParser :< cls, Object :< cls) => cls -> IO Bool
is_empty cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_is_empty (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "is_empty" '[] (IO Bool) where
        nodeMethod = Godot.Core.XMLParser.is_empty

{-# NOINLINE bindXMLParser_open #-}

-- | Opens an XML file for parsing. This returns an error code.
bindXMLParser_open :: MethodBind
bindXMLParser_open
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "open" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opens an XML file for parsing. This returns an error code.
open ::
       (XMLParser :< cls, Object :< cls) => cls -> GodotString -> IO Int
open cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_open (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "open" '[GodotString] (IO Int) where
        nodeMethod = Godot.Core.XMLParser.open

{-# NOINLINE bindXMLParser_open_buffer #-}

-- | Opens an XML raw buffer for parsing. This returns an error code.
bindXMLParser_open_buffer :: MethodBind
bindXMLParser_open_buffer
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "open_buffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Opens an XML raw buffer for parsing. This returns an error code.
open_buffer ::
              (XMLParser :< cls, Object :< cls) => cls -> PoolByteArray -> IO Int
open_buffer cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_open_buffer (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "open_buffer" '[PoolByteArray]
           (IO Int)
         where
        nodeMethod = Godot.Core.XMLParser.open_buffer

{-# NOINLINE bindXMLParser_read #-}

-- | Reads the next node of the file. This returns an error code.
bindXMLParser_read :: MethodBind
bindXMLParser_read
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "read" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reads the next node of the file. This returns an error code.
read :: (XMLParser :< cls, Object :< cls) => cls -> IO Int
read cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_read (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "read" '[] (IO Int) where
        nodeMethod = Godot.Core.XMLParser.read

{-# NOINLINE bindXMLParser_seek #-}

-- | Moves the buffer cursor to a certain offset (since the beginning) and read the next node there. This returns an error code.
bindXMLParser_seek :: MethodBind
bindXMLParser_seek
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "seek" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Moves the buffer cursor to a certain offset (since the beginning) and read the next node there. This returns an error code.
seek :: (XMLParser :< cls, Object :< cls) => cls -> Int -> IO Int
seek cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_seek (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "seek" '[Int] (IO Int) where
        nodeMethod = Godot.Core.XMLParser.seek

{-# NOINLINE bindXMLParser_skip_section #-}

-- | Skips the current section. If the node contains other elements, they will be ignored and the cursor will go to the closing of the current element.
bindXMLParser_skip_section :: MethodBind
bindXMLParser_skip_section
  = unsafePerformIO $
      withCString "XMLParser" $
        \ clsNamePtr ->
          withCString "skip_section" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Skips the current section. If the node contains other elements, they will be ignored and the cursor will go to the closing of the current element.
skip_section :: (XMLParser :< cls, Object :< cls) => cls -> IO ()
skip_section cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindXMLParser_skip_section (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod XMLParser "skip_section" '[] (IO ()) where
        nodeMethod = Godot.Core.XMLParser.skip_section