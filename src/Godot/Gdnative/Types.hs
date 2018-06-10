{-# LANGUAGE FunctionalDependencies, TypeFamilies, TypeInType, LambdaCase #-}
module Godot.Gdnative.Types where

import Control.Exception

import qualified Data.ByteString as B
import qualified Data.ByteString.Unsafe as B

import Data.Text (Text)
import qualified Data.Text.Encoding as T

import Foreign
import Foreign.C

import Linear

import Godot.Gdnative.Internal
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

type instance TypeOf 'HaskellTy GodotVector2 = V2 Float
instance GodotFFI GodotVector2 (V2 Float) where
  fromLowLevel v = V2 
                   <$> (realToFrac <$> godot_vector2_get_x v)
                   <*> (realToFrac <$> godot_vector2_get_y v)
  toLowLevel (V2 x y) = godot_vector2_new (realToFrac x) (realToFrac y)


type instance TypeOf 'HaskellTy GodotVector3 = V3 Float
instance GodotFFI GodotVector3 (V3 Float) where
  fromLowLevel v = V3 
                   <$> (realToFrac <$> godot_vector3_get_axis v GodotVector3AxisX)
                   <*> (realToFrac <$> godot_vector3_get_axis v GodotVector3AxisY)
                   <*> (realToFrac <$> godot_vector3_get_axis v GodotVector3AxisZ)
  toLowLevel (V3 x y z) = godot_vector3_new (realToFrac x) (realToFrac y) (realToFrac z)

type instance TypeOf 'HaskellTy GodotQuat = Quaternion Float
instance GodotFFI GodotQuat (Quaternion Float) where
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
type instance TypeOf 'HaskellTy GodotRect2 = Rect2
instance GodotFFI GodotRect2 Rect2 where
  fromLowLevel r = V2
                   <$> (fromLowLevel =<< godot_rect2_get_position r)
                   <*> (fromLowLevel =<< godot_rect2_get_size r)
  toLowLevel (V2 pos size) = do pos' <- toLowLevel pos
                                size' <- toLowLevel size
                                godot_rect2_new_with_position_and_size pos' size'

type AABB = M23 Float
type instance TypeOf 'HaskellTy GodotAabb = AABB
instance GodotFFI GodotAabb AABB where
  fromLowLevel aabb = V2
                      <$> (fromLowLevel =<< godot_aabb_get_position aabb)
                      <*> (fromLowLevel =<< godot_aabb_get_size aabb)
  toLowLevel (V2 pos size) = do pos'  <- toLowLevel pos
                                size' <- toLowLevel size
                                godot_aabb_new pos' size'

-- Axes X, Y and Z are represented by the int constants 0, 1 and 2 respectively (at least for Vector3):
-- https://godot.readthedocs.io/en/latest/classes/class_vector3.html?highlight=axis#numeric-constants
type Basis = M33 Float
type instance TypeOf 'HaskellTy GodotBasis = Basis
instance GodotFFI GodotBasis Basis where
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
type instance TypeOf 'HaskellTy GodotTransform = Transform
instance GodotFFI GodotTransform Transform where
  fromLowLevel tf = TF
                    <$> (fromLowLevel =<< godot_transform_get_basis tf)
                    <*> (fromLowLevel =<< godot_transform_get_origin tf)
  toLowLevel (TF basis orig) = do basis' <- toLowLevel basis
                                  orig'  <- toLowLevel orig
                                  godot_transform_new basis' orig'

-- This should perhaps be better modeled - FilePath?
type NodePath = Text
type instance TypeOf 'HaskellTy GodotNodePath = NodePath
instance GodotFFI GodotNodePath NodePath where
  fromLowLevel np = fromLowLevel =<< godot_node_path_get_name np 0
  toLowLevel np = godot_node_path_new =<< toLowLevel np


-- Variants

data Variant (ty :: LibType)
  = VariantNil
  | VariantBool !Bool
  | VariantInt !Int
  | VariantReal !Float
  | VariantString !(TypeOf ty GodotString)
  | VariantVector2 !(TypeOf ty GodotVector2)
  | VariantRect2 !(TypeOf ty GodotRect2)
  | VariantVector3 !(TypeOf ty GodotVector3)
  | VariantTransform2d !(TypeOf ty GodotTransform2d)
  | VariantPlane !(TypeOf ty GodotPlane)
  | VariantQuat !(TypeOf ty GodotQuat)
  | VariantAabb !(TypeOf ty GodotAabb)
  | VariantBasis !(TypeOf ty GodotBasis)
  | VariantTransform !(TypeOf ty GodotTransform)
  | VariantColor !(TypeOf ty GodotColor)
  | VariantNodePath !(TypeOf ty GodotNodePath)
  | VariantRid !(TypeOf ty GodotRid)
  | VariantObject !(TypeOf ty GodotObject)
  | VariantDictionary !(TypeOf ty GodotDictionary)
  | VariantArray !(TypeOf ty GodotArray)
  | VariantPoolByteArray !(TypeOf ty GodotPoolByteArray)
  | VariantPoolIntArray !(TypeOf ty GodotPoolIntArray)
  | VariantPoolRealArray !(TypeOf ty GodotPoolRealArray)
  | VariantPoolStringArray !(TypeOf ty GodotPoolStringArray)
  | VariantPoolVector2Array !(TypeOf ty GodotPoolVector2Array)
  | VariantPoolVector3Array !(TypeOf ty GodotPoolVector3Array)
  | VariantPoolColorArray !(TypeOf ty GodotPoolColorArray)

instance GodotFFI GodotVariant (Variant 'GodotTy) where
  fromLowLevel var = godot_variant_get_type var >>= \case
      GodotVariantTypeNil -> return VariantNil
      GodotVariantTypeBool -> (VariantBool . (/= 0)) <$> godot_variant_as_bool var
      GodotVariantTypeInt -> (VariantInt . fromIntegral) <$> godot_variant_as_int var
      GodotVariantTypeReal -> (VariantReal . realToFrac) <$> godot_variant_as_real var
      GodotVariantTypeString -> VariantString <$> godot_variant_as_string var
      GodotVariantTypeVector2 -> VariantVector2 <$> godot_variant_as_vector2 var
      GodotVariantTypeRect2 -> VariantRect2 <$> godot_variant_as_rect2 var
      GodotVariantTypeVector3 -> VariantVector3 <$> godot_variant_as_vector3 var
      GodotVariantTypeTransform2d -> VariantTransform2d <$> godot_variant_as_transform2d var
      GodotVariantTypePlane -> VariantPlane <$> godot_variant_as_plane var
      GodotVariantTypeQuat -> VariantQuat <$> godot_variant_as_quat var
      GodotVariantTypeAabb -> VariantAabb <$> godot_variant_as_aabb var
      GodotVariantTypeBasis -> VariantBasis <$> godot_variant_as_basis var
      GodotVariantTypeTransform -> VariantTransform <$> godot_variant_as_transform var
      GodotVariantTypeColor -> VariantColor <$> godot_variant_as_color var
      GodotVariantTypeNodePath -> VariantNodePath <$> godot_variant_as_node_path var
      GodotVariantTypeRid -> VariantRid <$> godot_variant_as_rid var
      GodotVariantTypeObject -> VariantObject <$> godot_variant_as_object var
      GodotVariantTypeDictionary -> VariantDictionary <$> godot_variant_as_dictionary var
      GodotVariantTypeArray -> VariantArray <$> godot_variant_as_array var
      GodotVariantTypePoolByteArray -> VariantPoolByteArray <$> godot_variant_as_pool_byte_array var
      GodotVariantTypePoolIntArray -> VariantPoolIntArray <$> godot_variant_as_pool_int_array var
      GodotVariantTypePoolRealArray -> VariantPoolRealArray <$> godot_variant_as_pool_real_array var
      GodotVariantTypePoolStringArray -> VariantPoolStringArray <$> godot_variant_as_pool_string_array var
      GodotVariantTypePoolVector2Array -> VariantPoolVector2Array <$> godot_variant_as_pool_vector2_array var
      GodotVariantTypePoolVector3Array -> VariantPoolVector3Array <$> godot_variant_as_pool_vector3_array var
      GodotVariantTypePoolColorArray -> VariantPoolColorArray <$> godot_variant_as_pool_color_array var
  
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
      withGodotVariant vt $ \vtPtr -> do
        poke (advancePtr arrPtr n) vtPtr 
        withVars xs (n+1) arrPtr mtd
    withVars [] n arrPtr mtd = mtd (arrPtr, fromIntegral n)

throwIfErr :: GodotVariantCallError -> IO ()
throwIfErr err = case variantCallErrorError err of
  GodotCallErrorCallOk -> return ()
  _ -> throwIO err
  

class AsVariant a where
  toVariant :: a -> Variant 'GodotTy
  fromVariant :: Variant 'GodotTy -> Maybe a

instance AsVariant () where
  toVariant _ = VariantNil
  fromVariant VariantNil = Just ()
  fromVariant _ = Nothing

instance AsVariant GodotVariant where
  toVariant v = let !res = unsafePerformIO $ fromLowLevel v in res
  fromVariant v = let !res = unsafePerformIO $ toLowLevel v in Just res

$(generateAsVariantInstances)


fromGodotVariant :: AsVariant a => GodotVariant -> IO a
fromGodotVariant var = do
  res <- fromVariant <$> fromLowLevel var
  case res of
    Just x -> x `seq` return x
    Nothing -> error "Error in API: couldn't fromVariant"
