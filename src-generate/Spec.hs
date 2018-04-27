{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-orphans #-}
module Spec where

import Data.Aeson
import Data.Aeson.TH
import Data.Char
import Data.Monoid
import Data.Text (Text)
import Data.Vector (Vector)
import qualified Data.Vector as V
import Data.HashMap.Strict (HashMap)
import qualified Data.HashMap.Strict as HM
import Data.Set (Set)
import qualified Data.Set as S

import Types

-- this is incredibly ad hoc.
instance FromJSON Type where
  parseJSON = withText "C type" $ \str ->
    case runCParser (const True) "" str parseType of
      Left err -> fail $ show err
      Right val -> return val

data GdnativeApis = GdnativeApis
  { core :: !GdnativeApi
  , extensions :: !(HashMap Text GdnativeApi)
  } deriving (Show, Eq)

data Ver = Ver { major :: !Int, minor :: !Int}
  deriving (Show, Eq)

data GdnativeApi = GdnativeApi
  { apiType :: !Text
  , apiVersion :: !Ver
  , apiApi :: !(Vector GdnativeApiEntry)
  } deriving (Show, Eq)

data GdnativeApiEntry = GdnativeApiEntry
  { name :: !Text
  , return_type :: !Type
  , arguments :: !(Vector (Type, Text))
  } deriving (Show, Eq)

deriveFromJSON defaultOptions ''Ver
deriveFromJSON defaultOptions ''GdnativeApiEntry
deriveFromJSON defaultOptions { fieldLabelModifier = map toLower . drop 3 } ''GdnativeApi
deriveFromJSON defaultOptions ''GdnativeApis


collectTypes :: GdnativeApis -> Set Type
collectTypes apis = collectFromApi (core apis) <> mconcat (HM.elems $ fmap collectFromApi $ extensions apis)
  where
    collectFromApi api = mconcat $ V.toList $ fmap collectFromEntry (apiApi api)
    collectFromEntry entry = S.singleton (return_type entry) <> (S.fromList $ V.toList $ fmap fst $ arguments entry)

collectNames :: GdnativeApis -> Set Text
collectNames apis = collectFromApi (core apis) <> mconcat (HM.elems $ fmap collectFromApi $ extensions apis)
  where
    collectFromApi api = mconcat $ V.toList $ fmap collectFromEntry (apiApi api)
    collectFromEntry entry = S.fromList $ V.toList $ fmap snd $ arguments entry
