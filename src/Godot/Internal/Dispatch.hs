{-# LANGUAGE TemplateHaskell, AllowAmbiguousTypes #-}
module Godot.Internal.Dispatch(HasBaseClass(..),(:<)(..),Signal(..),deriveBase,NodeSignal,
                               NodeMethod(..),NodeProperty(..),ListToFun(..),OptionalSetter(..),
                               ClassProperty(..),PropertyAttributes(..),
                               wrapIndexedGetter,wrapIndexedSetter, wrapDroppingSetter) where
import Data.Text (Text)
import GHC.TypeLits as T
import Godot.Gdnative.Internal.Gdnative hiding (Signal,PropertyAttributes)
import Godot.Gdnative.Internal.Types
import Language.Haskell.TH
import Language.Haskell.TH.Datatype
import Control.Monad
import Data.List
import Data.Typeable

-- | Establishes 'child` as a child of BaseClass child`
class HasBaseClass child where
  type BaseClass child
  super :: child -> BaseClass child

-- | This is here to make signals accessible to the type system
-- You will have to define this for your own objects as well, eg:
--    instance NodeSignal Player "on_start" []
class NodeSignal node (name :: Symbol) (args :: [*]) | node name -> args

type family ListToFun (l :: [*]) ret where
  ListToFun (h:t) ret = h -> ListToFun t ret
  ListToFun '[] ret = ret

-- | This is here to make methods accessible to the type system
-- You will have to define this for your own objects as well, eg:
--    instance NodeMethod Player "on_start" [] Int where
--          nodeMethod = on_start
class NodeMethod node (name :: Symbol) (args :: [*]) (ret :: *) | node name -> args, node name -> ret where
  nodeMethod :: node -> ListToFun args ret

type family OptionalSetter (ro :: Bool) ty where
  OptionalSetter 'True ty = ()
  OptionalSetter 'False ty = ty

wrapIndexedGetter :: Int -> (node -> Int -> IO ty) -> (node -> IO ty)
wrapIndexedGetter i f node = f node i

wrapIndexedSetter :: Int -> (node -> Int -> ty -> IO a) -> (node -> ty -> IO ())
wrapIndexedSetter i f node ty = f node i ty >> pure ()

-- | This exists because one property in api.json StreamTexture load_path
-- doesn't obey the rules that al other functions do, its setter, @load@,
-- returns (IO Int) instead of (IO ())
wrapDroppingSetter :: (node -> ty -> IO a) -> (node -> ty -> IO ())
wrapDroppingSetter f node ty = f node ty >> pure ()

data PropertyAttributes = PropertyAttributes
  { propertySetType :: !MethodRpcMode
  , propertyType :: !VariantType
  , propertyHint :: !PropertyHint
  , propertyHintString :: !Text
  , propertyUsage :: !PropertyUsageFlags
  , propertyDefaultValue :: !(Variant 'GodotTy)
  }

data ClassProperty cls = ClassProperty
  { propertyName :: Text
  , propertyAttrs :: PropertyAttributes
  , propertySetter :: Object -> cls -> GodotVariant -> IO ()
  , propertyGetter :: Object -> cls -> IO GodotVariant
  }

-- | A setter and getter exposed to Haskell along with optional data need to implement this property in Godot.
-- User-defined attributes must have this additioanl data, but properties that already exist in Godot do not.
class (Typeable ty, AsVariant ty) => NodeProperty node (name :: Symbol) ty (ro :: Bool) | node name -> ty, node name -> ro where
  nodeProperty :: (node -> IO ty
                 ,OptionalSetter ro (node -> ty -> IO ())
                 ,Maybe (Object -> node -> IO GodotVariant
                        ,Object -> node -> GodotVariant -> IO ()
                        ,PropertyAttributes))

-- | You should use this as @deriveBase ''Ty@ to create all the required parent
-- instances of '(:<)' for upcasting your data.
deriveBase :: Name -> Q [Dec]
deriveBase ty = do
  rdt <- reifyDatatype ty
  let appliedTy = appsT (ConT ty)
        [ case typeBinder of
            PlainTV n _ -> VarT n
            KindedTV n _ _ -> VarT n
        | typeBinder <- datatypeVars rdt
        ]
  r <- reify ''BaseClass
  case r of
    FamilyI _ instDecs -> do
      liftM nub $ concatQ (\(child,parent) -> do
                 liftM2 (++) [d|instance $(pure appliedTy) :< $(pure appliedTy) where upcast = id|]
                            (parentInstances instDecs child child))
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
relevantTySynEqns (TySynEqn _ (AppT _ child) parent:ts) ty
  | isRelevant child ty = (child,parent):relevantTySynEqns ts ty
  | otherwise = relevantTySynEqns ts ty
  where isRelevant (AppT t _) ty = isRelevant t ty
        isRelevant t@(ConT _) ty = t == ty
        isRelevant t ty = error $ "Unhandled type family member "
                          ++ show t ++ " when making parent instances for type "
                          ++ show ty
relevantTySynEqns x ty = error $ "Unhandled type member "
                         ++ show x ++ " when deriving parent instances for type "
                         ++ show ty

compatible :: Type -> Type -> Bool
compatible (AppT at at') (AppT bt bt') = compatible at bt && compatible at' bt'
compatible a@(ConT _) b@(ConT _) = a == b
-- NB Only true because we don't handle foralls
compatible (VarT _) (VarT _) = True
compatible a b = a == b

parentInstances :: [InstanceDec] -> Type -> Type -> Q [Dec]
parentInstances instDecs superType targetType =
     concat <$> (mapM (\(child,parent) ->
                         if parent == targetType then
                           pure [] else
                           (liftM2 (++) [d|instance $(pure parent) :< $(pure targetType) where upcast = upcast . super|]
                                                    (if parent == superType then
                                                       pure [] else
                                                       (parentInstances instDecs parent targetType))))
                          $ filter (\(child,parent) -> compatible superType child)
                          $ map (\(TySynInstD (TySynEqn _ (AppT _ child) parent)) -> (child,parent)) instDecs)

concatQ f l = concat <$> mapM f l

