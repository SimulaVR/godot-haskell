{-# LANGUAGE FlexibleContexts, FunctionalDependencies, MultiParamTypeClasses,
  UndecidableInstances, OverloadedStrings, TemplateHaskell, TypeApplications,
  TypeFamilies, DataKinds, TypeOperators, FlexibleInstances, RankNTypes,
  AllowAmbiguousTypes, ScopedTypeVariables #-}

module Project.Support where
import Godot
import GHC.TypeLits
import Godot.Nativescript
import Godot.Core.Object
import Godot.Internal.Dispatch
import Godot.Gdnative.Internal.Types
import Data.Typeable
import qualified Data.Text as T

-- * Scene information
--
-- This keeps your Haskell types in sync with the Godot project

-- | A node in the scene, we know its type and its name, @s@ is the path relate
-- to the scene
class (Typeable (SceneNodeType scene s), AsVariant (SceneNodeType scene s)) => SceneNode (scene :: Symbol) (s :: Symbol) where
  type SceneNodeType scene s :: *
  type SceneNodeName scene s :: Symbol
  type SceneNodeIsHaskell scene s :: Maybe (Symbol, Symbol)

-- | You declare this for your types. You offer up a haskell type, @n, for the
-- node. This class verifies that your base class is correct.
class (HasBaseClass n, BaseClass n ~ SceneNodeType scene s) =>
      NodeInScene (scene :: Symbol) (s :: Symbol) n | scene s -> n, n -> scene s

-- | Internal, just for convenience
data OneSceneNode (scene :: Symbol) (name :: Symbol)

registerOne :: forall ty. (NativeScript ty, AsVariant (BaseClass ty)) => GdnativeHandle -> IO ()
registerOne desc = registerClass $ RegClass desc $ classInit @ty

-- | Internal. Don't touch this and don't make instances of it. It's the
-- workhorse for making sure that you are implementing all of the classes that
-- Godot needs, nothing more and nothing less.
class ImplementedInHaskell (a :: [*]) (b :: [*]) where
  fill :: GdnativeHandle -> IO ()

instance ImplementedInHaskell '[] '[] where
  fill _ = pure ()

instance (NodeInScene scene name n,
          NativeScript n, AsVariant (BaseClass n),
          ImplementedInHaskell t t')
          => ImplementedInHaskell (OneSceneNode scene name ': t) (n ': t') where
  fill handle = do
    registerOne @n handle
    fill @t @t' handle

-- | You will use this in your exports
-- exports :: GdnativeHandle -> IO ()
-- exports desc = registerAll' @Nodes @'[HUD, Main, Mob, Player] desc
registerAll' :: forall (res :: [*]) (ns :: [*]). ImplementedInHaskell res ns => GdnativeHandle -> IO ()
registerAll' = fill @res @ns

getNode' :: forall label b cls scene name. (Object :< cls, Node :< cls,
                                      Node :< b,
                                      NodeInScene scene name cls,
                                      SceneNode scene label,
                                      SceneNodeType scene label ~ b,
                                      KnownSymbol label)
         => cls -> IO b
getNode' o = getNode @(SceneNodeType scene label) o (T.pack $ symbolVal (Proxy @label))

getNodeNativeScript' :: forall label b cls scene name scene' label'.
                        (NativeScript b, Node :< cls, Object :< cls, NodeInScene scene name cls,
                         SceneNodeIsHaskell scene label ~ 'Just '(scene', label'),
                         NodeInScene scene' label' b,
                         KnownSymbol label)
                     => cls -> IO b
getNodeNativeScript' cls = getNodeNativeScript @b cls (T.pack $ symbolVal (Proxy @label))

-- TODO We don't check arguments! We need singletons for args.
emit_signal' :: forall label args cls.
               (Object :< cls, Object :< cls, NodeSignal cls label args, KnownSymbol label)
             => cls -> [Variant 'GodotTy] -> IO ()
emit_signal' cls args = do
  name <- toLowLevel (T.pack $ symbolVal (Proxy @label))
  emit_signal cls name args

-- TODO args ~ '[] is temproary, we need signeltons to reflect this into a runtime value
signal' :: forall cls label args.
          (NodeSignal cls label args, KnownSymbol label, args ~ '[])
        => (Text, [SignalArgument])
signal' = signal (T.pack $ symbolVal (Proxy @label)) []
