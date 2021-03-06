{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.EncodedObjectAsID
       (Godot.Core.EncodedObjectAsID.get_object_id,
        Godot.Core.EncodedObjectAsID.set_object_id)
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

instance NodeProperty EncodedObjectAsID "object_id" Int 'False
         where
        nodeProperty
          = (get_object_id, wrapDroppingSetter set_object_id, Nothing)

{-# NOINLINE bindEncodedObjectAsID_get_object_id #-}

-- | The @Object@ identifier stored in this @EncodedObjectAsID@ instance. The object instance can be retrieved with @method @GDScript.instance_from_id@.
bindEncodedObjectAsID_get_object_id :: MethodBind
bindEncodedObjectAsID_get_object_id
  = unsafePerformIO $
      withCString "EncodedObjectAsID" $
        \ clsNamePtr ->
          withCString "get_object_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Object@ identifier stored in this @EncodedObjectAsID@ instance. The object instance can be retrieved with @method @GDScript.instance_from_id@.
get_object_id ::
                (EncodedObjectAsID :< cls, Object :< cls) => cls -> IO Int
get_object_id cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEncodedObjectAsID_get_object_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EncodedObjectAsID "get_object_id" '[] (IO Int)
         where
        nodeMethod = Godot.Core.EncodedObjectAsID.get_object_id

{-# NOINLINE bindEncodedObjectAsID_set_object_id #-}

-- | The @Object@ identifier stored in this @EncodedObjectAsID@ instance. The object instance can be retrieved with @method @GDScript.instance_from_id@.
bindEncodedObjectAsID_set_object_id :: MethodBind
bindEncodedObjectAsID_set_object_id
  = unsafePerformIO $
      withCString "EncodedObjectAsID" $
        \ clsNamePtr ->
          withCString "set_object_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The @Object@ identifier stored in this @EncodedObjectAsID@ instance. The object instance can be retrieved with @method @GDScript.instance_from_id@.
set_object_id ::
                (EncodedObjectAsID :< cls, Object :< cls) => cls -> Int -> IO ()
set_object_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindEncodedObjectAsID_set_object_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod EncodedObjectAsID "set_object_id" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.EncodedObjectAsID.set_object_id