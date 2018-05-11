{-# LANGUAGE TemplateHaskell, GeneralizedNewtypeDeriving, OverloadedStrings #-}
{-# OPTIONS_GHC -Wno-orphans #-}
module Classgen.Spec where

import Control.Applicative
import Control.Lens

import Data.Aeson
import Data.Aeson.TH
import Data.Monoid
import Data.Text (Text)
import qualified Data.Text as T
import Data.Vector (Vector)
import Data.HashMap.Strict (HashMap)
import qualified Data.Set as S

import Text.Casing
import Classgen.Utils

type GodotClasses = Vector GodotClass

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
  deriving (Show, Eq)

instance FromJSON GType where
  parseJSON v = PrimitiveType <$> parseJSON v
                <|> withText "type" (\t ->
                  if isCoreType t
                    then pure $ CoreType t
                    else pure $ CustomType t) v
   where
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
        "Quat",
        "Rect2",
        "RID",
        "String",
        "Transform",
        "Transform2D",
        "Variant",
        "Vector2",
        "Vector3" ]

data GodotClass = GodotClass
  { _gcName :: !Text
  , _gcBaseClass :: !Text
  , _gcApiType :: !Text
  , _gcSingleton ::  !Bool
  , _gcInstanciable :: !Bool
  , _gcIsReference :: !Bool
  , _gcConstants :: !(HashMap Text Int)
  , _gcProperties:: !(Vector GodotProperty)
  , _gcSignals :: !(Vector GodotSignal)
  , _gcMethods :: !(Vector GodotMethod)
  , _gcEnums :: !(Vector GodotEnum)
  } deriving (Show, Eq)

data GodotProperty = GodotProperty
  { _gpName :: !Text
  , _gcType :: !GType
  , _gcGetter :: !Text
  , _gcSetter :: !Text
  , _gcIndex :: !Int
  } deriving (Show, Eq)

data GodotSignal = GodotSignal
  { _gsName :: !Text
  , _gsArguments :: !(Vector GodotArgument)
  } deriving (Show, Eq)

data GodotArgument = GodotArgument
  { _gaName :: !Text
  , _gaType :: !GType
  , _gaDefaultValue :: !(Maybe Text)
  } deriving (Show, Eq)

instance FromJSON GodotArgument where
  parseJSON = withObject "argument" $ \v ->
    do
      hasDefault <- v .:? "has_default_value"
      maybeDefault <- case hasDefault of
        Just False -> pure Nothing
        _ -> Just <$> v .: "default_value"
      GodotArgument 
        <$> v .: "name"
        <*> v .: "type"
        <*> pure maybeDefault

data GodotMethod = GodotMethod
  { _gmName :: !Text
  , _gmReturnType :: !GType
  , _gmIsEditor :: !Bool
  , _gmIsNoscript :: !Bool
  , _gmIsConst :: !Bool
  , _gmIsReverse :: !Bool
  , _gmIsVirtual :: !Bool
  , _gmHasVarargs :: !Bool
  , _gmIsFromScript :: !Bool
  , _gmArguments :: !(Vector GodotArgument)
  } deriving (Show, Eq)

data GodotEnum = GodotEnum
  { _geName :: !GType
  , _geValues :: !(HashMap Text Int)
  } deriving (Show, Eq)

makeLensesWith fixedTypeFields ''GodotClass
makeLensesWith fixedTypeFields ''GodotProperty
makeLensesWith fixedTypeFields ''GodotSignal
makeLensesWith fixedTypeFields ''GodotArgument
makeLensesWith fixedTypeFields ''GodotMethod
makeLensesWith fixedTypeFields ''GodotEnum

makePrisms ''GType
makePrisms ''GPrimType

concat <$> mapM (deriveFromJSON defaultOptions { fieldLabelModifier = quietSnake . drop 3 })
  [ ''GodotClass
  , ''GodotProperty
  , ''GodotSignal
  , ''GodotMethod
  , ''GodotEnum ]