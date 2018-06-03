{-#LANGUAGE TemplateHaskell#-}
module Godot.Gdnative.Internal.TH where

import Data.Maybe
import Godot.Gdnative.Internal.Gdnative
import Language.Haskell.TH
import Language.Haskell.TH.Syntax
import Foreign

generateAsVariantInstances :: Q [Dec]
generateAsVariantInstances = do
  (TyConI (DataD _ _ bndrs _ cons _)) <- lookupTypeName "Variant" >>= \(Just x) -> reify x
  let tys = mapMaybe getCon cons
  mapM mkInstance tys

  where
    getCon (NormalC name [(_, AppT (AppT _ _) ty)]) = Just (name, ty)
    getCon (NormalC name [(_, ty)]) = Just (name, ty)
    getCon _ = Nothing
    mkInstance (name, ty)
      = instanceD (cxt []) (appT (conT $ mkName "AsVariant") (return ty))
          [ valD (varP $ mkName "toVariant") (normalB $ conE $ mkName $ nameBase name) []
          , valD (varP $ mkName "fromVariant") (normalB
              [| \var -> case var of
                   $(conP (mkName $ nameBase name) [varP $ mkName "x"]) -> Just x
                   _ -> Nothing |]) [] ]
      

