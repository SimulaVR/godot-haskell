{-# LANGUAGE TemplateHaskell, GeneralizedNewtypeDeriving, OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-orphans #-}
module Classgen.Docs where

import Control.Applicative
import Control.Lens

import Data.Aeson
import Data.Aeson.TH
import Data.Monoid
import Data.Text (Text)
import qualified Data.Text as T
import Data.Vector (Vector)
import qualified Data.Vector as V
import Data.HashMap.Strict (HashMap)
import qualified Data.Set as S
import qualified Data.ByteString.Lazy as BL
import qualified Data.HashMap.Strict as H

import Text.Casing
import Classgen.Utils

-- | One of the two values that has been parsed from JSON
data AlternativeJSON a b
  = FirstJSON a
  | SecondJSON b
  deriving (Eq, Ord, Show)

instance (FromJSON a, FromJSON b) => FromJSON (AlternativeJSON a b) where
  parseJSON v = FirstJSON <$> parseJSON v <|> SecondJSON <$> parseJSON v

alternative1 :: AlternativeJSON a b -> a -> a
alternative1 (FirstJSON a) _ = a
alternative1 _             a = a

alt1 :: AlternativeJSON a b -> Maybe a
alt1 (FirstJSON a) = Just a
alt1 _ = Nothing

type GodotDocTable = HashMap Text GodotDocClass

type GodotDocs = Vector GodotDoc

newtype Ref a = Ref Text
  deriving (Show, Eq, FromJSON, ToJSON)

data GPrimType = VoidType | BoolType | IntType | FloatType
  deriving (Show, Eq)

instance FromJSON GPrimType where
  parseJSON = withText "primitive type" $ \t ->
    case t of
      "void" -> pure VoidType
      "bool" -> pure BoolType
      "int" -> pure IntType
      "float" -> pure FloatType
      _ -> fail $ "Unknown type" <> T.unpack t

data GType
  = PrimitiveType !GPrimType
  | CoreType !Text
  | CustomType !Text
  | EnumType !Text
  deriving (Show, Eq)

isCoreType t = t `S.member` S.fromList 
      [ "AABB",
        "Array",
        "Basis",
        "Color",
        "Dictionary",
        "GodotError",
        "NodePath",
        "Plane",
        "PoolByteArray",
        "PoolIntArray",
        "PoolRealArray",
        "PoolStringArray",
        "PoolVector2Array",
        "PoolVector3Array",
        "PoolColorArray",
        "Object",
        "Quat",
        "Rect2",
        "RID",
        "String",
        "Transform",
        "Transform2D",
        "Variant",
        "Vector2",
        "Vector3" ]

instance FromJSON GType where
  parseJSON v = PrimitiveType <$> parseJSON v
                <|> withText "type" (\t ->
                  if isCoreType t
                    then pure $ CoreType t
                    else if "enum." `T.isPrefixOf` t
                         then pure $ EnumType t
                         else pure $ CustomType t) v

data GodotDoc = GodotDoc {
  _gdClass :: !GodotDocClass
  } deriving (Show, Eq)

data OptionalArray a = OptionalArray { unOption :: Vector a }
  deriving (Show, Eq)

instance FromJSON a => FromJSON (OptionalArray a) where
  parseJSON x@(Array _) = OptionalArray <$> parseJSON x
  parseJSON x = OptionalArray . V.singleton <$> parseJSON x

data GodotDocClass = GodotDocClass
  { _gdName :: !Text
  , _gdVersion :: !Text
  , _gdBrief_description :: !(AlternativeJSON Text Object)
  , _gdDescription ::  !(AlternativeJSON Text Object)
  , _gdCategory :: !(Maybe Text)
  , _gdInherits :: !(Maybe Text)
  , _gdMembers :: !(Maybe (HashMap Text (OptionalArray GodotProperty)))
  , _gdConstants :: !(HashMap Text (OptionalArray GodotConstant))
  , _gdSignals :: !(Maybe (HashMap Text (OptionalArray GodotSignal)))
  , _gdMethods :: !(HashMap Text (OptionalArray GodotMethod))
  } deriving (Show, Eq)

data GodotProperty = GodotProperty
  { _gpName :: !Text
  , _gcType :: !GType
  , _gcGetter :: !Text
  , _gcSetter :: !Text
  , _gcValue :: !(Maybe Text)
  } deriving (Show, Eq)

data GodotConstant = GodotConstant
  { _goName :: !Text
  , _goValue :: !Text
  , _goEnum :: !(Maybe Text)
  } deriving (Show, Eq)

data GodotSignal = GodotSignal
  { _gsName :: !Text
  , _gsDescription :: !(AlternativeJSON Text Object)
  , _gsArgument :: !(Maybe (OptionalArray GodotArgument))
  } deriving (Show, Eq)

data GodotArgument = GodotArgument
  { _gaName :: !Text
  , _gaType :: !GType
  , _gaIndex :: !Text
  , _gaDefault_ :: !(Maybe Text)
  } deriving (Show, Eq)

instance FromJSON GodotArgument where
  parseJSON (Object x) = GodotArgument <$> x .: "name" <*> x .: "type" <*> x .: "index" <*> x .:? "default"
  parseJSON _ = fail "Expected an Object"

data GodotMethod = GodotMethod
  { _gmName :: !Text
  , _gmDescription :: !(AlternativeJSON Text Object)
  , _gmReturn :: !(Maybe (HashMap Text GType))
  , _gmArgument :: !(Maybe (OptionalArray GodotArgument))
  } deriving (Show, Eq)

makeLensesWith fixedTypeFields ''GodotDoc
makeLensesWith fixedTypeFields ''GodotDocClass
makeLensesWith fixedTypeFields ''GodotProperty
makeLensesWith fixedTypeFields ''GodotSignal
makeLensesWith fixedTypeFields ''GodotArgument
makeLensesWith fixedTypeFields ''GodotMethod

toTable :: GodotDocs -> GodotDocTable
toTable = V.foldl' (\hm d -> H.insert (d ^. class' . name) (d ^. class') hm) H.empty 

makePrisms ''GType
makePrisms ''GPrimType

concat <$> mapM (deriveFromJSON defaultOptions { fieldLabelModifier = quietSnake . drop 3, omitNothingFields = True })
  [ ''GodotDocClass
  , ''GodotProperty
  , ''GodotConstant
  , ''GodotSignal
  , ''GodotMethod ]

convertDoc = T.replace "]" "@" . T.replace "[" "@"
           . T.replace "[/code]" "@" . T.replace "[code]" "@"
           . T.replace "[/codeblock]" "\n@\n" . T.replace "[codeblock]" "\n@\n"
           . T.replace "[b]" "__" . T.replace "[/b]" "__"
           . T.replace "[constant " "@"
           . T.replace "[member " "@"

instance FromJSON GodotDoc where
  parseJSON (Object x) = GodotDoc <$> x .: "class"
  parseJSON _ = fail "Expected an Object"
