{-# LANGUAGE TemplateHaskell #-}
module Godot.Internal.Dispatch(HasBaseClass(..),(:<)(..),Signal(..),deriveBase) where
import Data.Text (Text)
import GHC.TypeLits as T
import Godot.Gdnative.Internal.Gdnative hiding (Signal)
import Language.Haskell.TH
import Language.Haskell.TH.Datatype
import Control.Monad
import Data.List

-- | Establishes 'child` as a child of BaseClass child`
class HasBaseClass child where
  type BaseClass child
  super :: child -> BaseClass child

-- | You should use this as @deriveBase ''Ty@ to create all the required parent
-- instances of '(:<)' for upcasting your data.
deriveBase :: Name -> Q [Dec]
deriveBase ty = do
  rdt <- reifyDatatype ty
  let appliedTy = appsT (ConT ty)
        [ case typeBinder of
            PlainTV n -> VarT n
            KindedTV n _ -> VarT n
        | typeBinder <- datatypeVars rdt
        ]
  r <- reify ''BaseClass
  case r of
    FamilyI _ instDecs -> do
      liftM nub $ concatQ (\(child,parent) -> do
                 liftM2 (++) [d|instance $(pure appliedTy) :< $(pure appliedTy) where upcast = id|]
                            (parentInstaces instDecs child child))
          $ relevantTySynEqns (map (\(TySynInstD eqn) -> eqn) instDecs) (ConT ty)

-- | Subclass relation. Instances should be automatically derived with
-- 'deriveBase'. You can define instances yourself, but you should ensure that
-- they are transitive (if A :< B and B :< C then you should also define A :<
-- C).
class parent :< child where
  upcast :: child -> parent

instance Object :< Object where
  upcast = id

newtype Signal a = Signal Text
  deriving (Show, Eq)

appsT :: Type -> [Type] -> Type
appsT t [] = t
appsT t (x:xs) = appsT (AppT t x) xs

relevantTySynEqns :: [TySynEqn] -> Type -> [(Type,Type)]
relevantTySynEqns [] _ = []
relevantTySynEqns (TySynEqn Nothing (AppT _ child) parent:ts) ty
  | isRelevant child ty = (child,parent):relevantTySynEqns ts ty
  | otherwise = relevantTySynEqns ts ty
  where isRelevant (AppT t _) ty = isRelevant t ty
        isRelevant t@(ConT _) ty = t == ty
        isRelevant t ty = error $ "Unhandled type family member "
                          ++ show t ++ " when making parent instances for type "
                          ++ show ty

compatible :: Type -> Type -> Bool
compatible (AppT at at') (AppT bt bt') = compatible at bt && compatible at' bt'
compatible a@(ConT _) b@(ConT _) = a == b
-- NB Only true because we don't handle foralls
compatible (VarT _) (VarT _) = True
compatible a b = a == b

parentInstaces :: [InstanceDec] -> Type -> Type -> Q [Dec]
parentInstaces instDecs superType targetType =
     concat <$> (mapM (\(child,parent) ->
                         if parent == targetType then
                           pure [] else
                           (liftM2 (++) [d|instance $(pure parent) :< $(pure targetType) where upcast = upcast . super|]
                                                    (if parent == superType then
                                                       pure [] else
                                                       (parentInstaces instDecs parent targetType))))
                          $ filter (\(child,parent) -> compatible superType child)
                          $ map (\(TySynInstD (TySynEqn Nothing (AppT _ child) parent)) -> (child,parent)) instDecs)

concatQ f l = concat <$> (sequence $ map f l)
