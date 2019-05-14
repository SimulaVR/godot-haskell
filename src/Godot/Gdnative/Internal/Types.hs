{-# LANGUAGE BangPatterns, FunctionalDependencies, TypeFamilies, TypeInType, LambdaCase, TypeApplications, AllowAmbiguousTypes #-}
module Godot.Gdnative.Internal.Types where

import Control.Exception

import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B

import Data.Text (Text)
import qualified Data.Text.Encoding as T
import Data.Colour
import Data.Colour.SRGB
import Data.Function ((&))

import Data.Typeable

import Foreign
import Foreign.C

import Linear
import qualified Data.Vector as V

import Godot.Gdnative.Internal.Api as I hiding (Rect2,Basis,Transform,Color) 
import Godot.Gdnative.Internal.Gdnative as I hiding (Rect2,Basis,Transform,Color) 
import qualified Godot.Gdnative.Internal.Api as G
import qualified Godot.Gdnative.Internal.Gdnative as G
import Godot.Gdnative.Internal.TH

import System.IO.Unsafe

data LibType = GodotTy | HaskellTy

type family TypeOf (x :: LibType) a
-- I'm torn about this instance. Need TH if not using this
type instance TypeOf 'GodotTy a = a

-- |GodotFFI is a relation between low-level and high-level
-- |Godot types, and conversions between them.
class GodotFFI low high | low -> high where
  fromLowLevel :: low -> IO high
  toLowLevel :: high -> IO low

type instance TypeOf 'HaskellTy Array = V.Vector GodotVariant
instance GodotFFI Array (V.Vector GodotVariant) where
  fromLowLevel arr = do
    len <- fromIntegral <$> godot_array_size arr
    V.generateM len (\i -> godot_array_get arr (fromIntegral i))
  toLowLevel vec = do
    arr <- godot_array_new
    V.mapM_ (\e -> godot_array_append arr e) vec
    pure arr

type instance TypeOf 'HaskellTy GodotString = Text
instance GodotFFI GodotString Text where
  fromLowLevel str = godot_string_utf8 str >>= \cstr -> T.decodeUtf8 <$> fromCharString cstr
    where
      fromCharString cstr = do
        len <- godot_char_string_length cstr
        sptr <- godot_char_string_get_data cstr
        B.packCStringLen (sptr, fromIntegral len)
  toLowLevel txt = B.unsafeUseAsCStringLen bstr $ \(ptr, len) ->
    godot_string_chars_to_utf8_with_len ptr (fromIntegral len)
    where
      bstr = T.encodeUtf8 txt

type instance TypeOf 'HaskellTy Vector2 = V2 Float
instance GodotFFI Vector2 (V2 Float) where
  fromLowLevel v = V2 
                   <$> (realToFrac <$> godot_vector2_get_x v)
                   <*> (realToFrac <$> godot_vector2_get_y v)
  toLowLevel (V2 x y) = godot_vector2_new (realToFrac x) (realToFrac y)


type instance TypeOf 'HaskellTy Vector3 = V3 Float
instance GodotFFI Vector3 (V3 Float) where
  fromLowLevel v = V3 
                   <$> (realToFrac <$> godot_vector3_get_axis v Vector3AxisX)
                   <*> (realToFrac <$> godot_vector3_get_axis v Vector3AxisY)
                   <*> (realToFrac <$> godot_vector3_get_axis v Vector3AxisZ)
  toLowLevel (V3 x y z) = godot_vector3_new (realToFrac x) (realToFrac y) (realToFrac z)

type instance TypeOf 'HaskellTy Quat = Quaternion Float
instance GodotFFI Quat (Quaternion Float) where
  fromLowLevel q = Quaternion
                   <$> (realToFrac <$> godot_quat_get_w q)
                   <*> (V3
                        <$> (realToFrac <$> godot_quat_get_x q)
                        <*> (realToFrac <$> godot_quat_get_y q)
                        <*> (realToFrac <$> godot_quat_get_z q))
  toLowLevel (Quaternion w (V3 x y z)) = godot_quat_new (realToFrac x)
                                                        (realToFrac y)
                                                        (realToFrac z)
                                                        (realToFrac w)

type Rect2 = M22 Float
type instance TypeOf 'HaskellTy G.Rect2 = Rect2
instance GodotFFI G.Rect2 Rect2 where
  fromLowLevel r = V2
                   <$> (fromLowLevel =<< godot_rect2_get_position r)
                   <*> (fromLowLevel =<< godot_rect2_get_size r)
  toLowLevel (V2 pos size) = do pos' <- toLowLevel pos
                                size' <- toLowLevel size
                                godot_rect2_new_with_position_and_size pos' size'

type AABB = M23 Float
type instance TypeOf 'HaskellTy Aabb = AABB
instance GodotFFI Aabb AABB where
  fromLowLevel aabb = V2
                      <$> (fromLowLevel =<< godot_aabb_get_position aabb)
                      <*> (fromLowLevel =<< godot_aabb_get_size aabb)
  toLowLevel (V2 pos size) = do pos'  <- toLowLevel pos
                                size' <- toLowLevel size
                                godot_aabb_new pos' size'

-- Axes X, Y and Z are represented by the int constants 0, 1 and 2 respectively (at least for Vector3):
-- https://godot.readthedocs.io/en/latest/classes/class_vector3.html?highlight=axis#numeric-constants
type Basis = M33 Float
type instance TypeOf 'HaskellTy G.Basis = Basis
instance GodotFFI G.Basis Basis where
  fromLowLevel b = V3
                   <$> (llAxis 0)
                   <*> (llAxis 1)
                   <*> (llAxis 2)
                 where llAxis axis = fromLowLevel =<< godot_basis_get_axis b axis
  toLowLevel (V3 x y z) = do x' <- toLowLevel x
                             y' <- toLowLevel y
                             z' <- toLowLevel z
                             godot_basis_new_with_rows x' y' z'

data Transform = TF { _tfBasis :: Basis, _tfPosition :: V3 Float }
type instance TypeOf 'HaskellTy G.Transform = Transform
instance GodotFFI G.Transform Transform where
  fromLowLevel tf = TF
                    <$> (fromLowLevel =<< godot_transform_get_basis tf)
                    <*> (fromLowLevel =<< godot_transform_get_origin tf)
  toLowLevel (TF basis orig) = do basis' <- toLowLevel basis
                                  orig'  <- toLowLevel orig
                                  godot_transform_new basis' orig'

-- This should perhaps be better modeled - FilePath?
type instance TypeOf 'HaskellTy G.NodePath = Text
instance GodotFFI G.NodePath Text where
  fromLowLevel np = fromLowLevel =<< godot_node_path_get_name np 0
  toLowLevel np = godot_node_path_new =<< toLowLevel np

type instance TypeOf 'HaskellTy G.Color = AlphaColour Double
instance GodotFFI G.Color (AlphaColour Double) where
  fromLowLevel c = withOpacity
                   <$> (sRGB
                        <$> (realToFrac <$> godot_color_get_r c)
                        <*> (realToFrac <$> godot_color_get_g c)
                        <*> (realToFrac <$> godot_color_get_b c))
                   <*> (realToFrac <$> godot_color_get_a c)
  toLowLevel rgba = toSRGB (rgba `over` black)
                    & \(RGB r g b) ->
                        godot_color_new_rgba
                          (realToFrac r)
                          (realToFrac g)
                          (realToFrac b)
                          (realToFrac $ alphaChannel rgba)


-- Variants

data Variant (ty :: LibType)
  = VariantNil
  | VariantBool !Bool
  | VariantInt !Int
  | VariantReal !Float
  | VariantString !(TypeOf ty GodotString)
  | VariantVector2 !(TypeOf ty G.Vector2)
  | VariantRect2 !(TypeOf ty G.Rect2)
  | VariantVector3 !(TypeOf ty G.Vector3)
  | VariantTransform2d !(TypeOf ty G.Transform2d)
  | VariantPlane !(TypeOf ty G.Plane)
  | VariantQuat !(TypeOf ty G.Quat)
  | VariantAabb !(TypeOf ty Aabb)
  | VariantBasis !(TypeOf ty G.Basis)
  | VariantTransform !(TypeOf ty G.Transform)
  | VariantColor !(TypeOf ty G.Color)
  | VariantNodePath !(TypeOf ty G.NodePath)
  | VariantRid !(TypeOf ty G.Rid)
  | VariantObject !(TypeOf ty G.Object)
  | VariantDictionary !(TypeOf ty G.Dictionary)
  | VariantArray !(TypeOf ty G.Array)
  | VariantPoolByteArray !(TypeOf ty G.PoolByteArray)
  | VariantPoolIntArray !(TypeOf ty G.PoolIntArray)
  | VariantPoolRealArray !(TypeOf ty G.PoolRealArray)
  | VariantPoolStringArray !(TypeOf ty G.PoolStringArray)
  | VariantPoolVector2Array !(TypeOf ty G.PoolVector2Array)
  | VariantPoolVector3Array !(TypeOf ty G.PoolVector3Array)
  | VariantPoolColorArray !(TypeOf ty G.PoolColorArray)

instance GodotFFI GodotVariant (Variant 'GodotTy) where
  fromLowLevel var = godot_variant_get_type var >>= \case
      VariantTypeNil -> return VariantNil
      VariantTypeBool -> (VariantBool . (/= 0)) <$> godot_variant_as_bool var
      VariantTypeInt -> (VariantInt . fromIntegral) <$> godot_variant_as_int var
      VariantTypeReal -> (VariantReal . realToFrac) <$> godot_variant_as_real var
      VariantTypeString -> VariantString <$> godot_variant_as_string var
      VariantTypeVector2 -> VariantVector2 <$> godot_variant_as_vector2 var
      VariantTypeRect2 -> VariantRect2 <$> godot_variant_as_rect2 var
      VariantTypeVector3 -> VariantVector3 <$> godot_variant_as_vector3 var
      VariantTypeTransform2d -> VariantTransform2d <$> godot_variant_as_transform2d var
      VariantTypePlane -> VariantPlane <$> godot_variant_as_plane var
      VariantTypeQuat -> VariantQuat <$> godot_variant_as_quat var
      VariantTypeAabb -> VariantAabb <$> godot_variant_as_aabb var
      VariantTypeBasis -> VariantBasis <$> godot_variant_as_basis var
      VariantTypeTransform -> VariantTransform <$> godot_variant_as_transform var
      VariantTypeColor -> VariantColor <$> godot_variant_as_color var
      VariantTypeNodePath -> VariantNodePath <$> godot_variant_as_node_path var
      VariantTypeRid -> VariantRid <$> godot_variant_as_rid var
      VariantTypeObject -> VariantObject <$> godot_variant_as_object var
      VariantTypeDictionary -> VariantDictionary <$> godot_variant_as_dictionary var
      VariantTypeArray -> VariantArray <$> godot_variant_as_array var
      VariantTypePoolByteArray -> VariantPoolByteArray <$> godot_variant_as_pool_byte_array var
      VariantTypePoolIntArray -> VariantPoolIntArray <$> godot_variant_as_pool_int_array var
      VariantTypePoolRealArray -> VariantPoolRealArray <$> godot_variant_as_pool_real_array var
      VariantTypePoolStringArray -> VariantPoolStringArray <$> godot_variant_as_pool_string_array var
      VariantTypePoolVector2Array -> VariantPoolVector2Array <$> godot_variant_as_pool_vector2_array var
      VariantTypePoolVector3Array -> VariantPoolVector3Array <$> godot_variant_as_pool_vector3_array var
      VariantTypePoolColorArray -> VariantPoolColorArray <$> godot_variant_as_pool_color_array var
  
  toLowLevel VariantNil = godot_variant_new_nil
  toLowLevel (VariantBool b) = godot_variant_new_bool . fromIntegral $ fromEnum b
  toLowLevel (VariantInt i) = godot_variant_new_int (fromIntegral i)
  toLowLevel (VariantReal r) = godot_variant_new_real (realToFrac r)
  toLowLevel (VariantString x) = godot_variant_new_string x
  toLowLevel (VariantVector2 x) = godot_variant_new_vector2 x
  toLowLevel (VariantRect2 x) = godot_variant_new_rect2 x
  toLowLevel (VariantVector3 x) = godot_variant_new_vector3 x
  toLowLevel (VariantTransform2d x) = godot_variant_new_transform2d x
  toLowLevel (VariantPlane x) = godot_variant_new_plane x
  toLowLevel (VariantQuat x) = godot_variant_new_quat x
  toLowLevel (VariantAabb x) = godot_variant_new_aabb x
  toLowLevel (VariantBasis x) = godot_variant_new_basis x
  toLowLevel (VariantTransform x) = godot_variant_new_transform x
  toLowLevel (VariantColor x) = godot_variant_new_color x
  toLowLevel (VariantNodePath x) = godot_variant_new_node_path x
  toLowLevel (VariantRid x) = godot_variant_new_rid x
  toLowLevel (VariantObject x) = godot_variant_new_object x
  toLowLevel (VariantDictionary x) = godot_variant_new_dictionary x
  toLowLevel (VariantArray x) = godot_variant_new_array x
  toLowLevel (VariantPoolByteArray x) = godot_variant_new_pool_byte_array x
  toLowLevel (VariantPoolIntArray x) = godot_variant_new_pool_int_array x
  toLowLevel (VariantPoolRealArray x) = godot_variant_new_pool_real_array x
  toLowLevel (VariantPoolStringArray x) = godot_variant_new_pool_string_array x
  toLowLevel (VariantPoolVector2Array x) = godot_variant_new_pool_vector2_array x
  toLowLevel (VariantPoolVector3Array x) = godot_variant_new_pool_vector3_array x
  toLowLevel (VariantPoolColorArray x) = godot_variant_new_pool_color_array x

withVariantArray :: [Variant 'GodotTy] -> ((Ptr (Ptr GodotVariant), CInt) -> IO a) -> IO a
withVariantArray vars mtd =  allocaArray (length vars) $
  \arrPtr ->  withVars vars 0 arrPtr mtd
  where
    withVars (x:xs) n arrPtr mtd = do
      vt <- toLowLevel x
      res <- withGodotVariant vt $ \vtPtr -> do
        poke (advancePtr arrPtr n) vtPtr 
        withVars xs (n+1) arrPtr mtd
      godot_variant_destroy vt
      return res
    withVars [] n arrPtr mtd = mtd (arrPtr, fromIntegral n)

throwIfErr :: VariantCallError -> IO ()
throwIfErr err = case variantCallErrorError err of
  CallErrorCallOk -> return ()
  _ -> throwIO err
  

class AsVariant a where
  toVariant :: a -> Variant 'GodotTy
  fromVariant :: Variant 'GodotTy -> Maybe a
  variantType :: a -> VariantType

instance AsVariant () where
  toVariant _ = VariantNil
  fromVariant VariantNil = Just ()
  fromVariant _ = Nothing
  variantType _ = VariantTypeNil

instance AsVariant GodotVariant where
  toVariant v = let !res = unsafePerformIO $ fromLowLevel v in res
  fromVariant v = let !res = unsafePerformIO $ toLowLevel v in Just res
  variantType v = let !res = unsafePerformIO $ godot_variant_get_type v in res

$(generateAsVariantInstances)

toGodotVariant :: forall a. (Typeable a, AsVariant a) => a -> IO GodotVariant
toGodotVariant = toLowLevel . toVariant

fromGodotVariant :: forall a. (Typeable a, AsVariant a) => GodotVariant -> IO a
fromGodotVariant var = do
  res <- fromVariant <$> fromLowLevel var
  case res of
    Just x -> x `seq` return x
    Nothing -> do
      haveTy <-  godot_variant_get_type var 
      let expTy = typeOf (undefined :: a)
      error $ "Error in API: couldn't fromVariant. have: " ++ show haveTy ++ ", expected: " ++ show expTy
