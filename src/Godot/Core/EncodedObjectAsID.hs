{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.EncodedObjectAsID
       (Godot.Core.EncodedObjectAsID.set_object_id,
        Godot.Core.EncodedObjectAsID.get_object_id)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindEncodedObjectAsID_set_object_id #-}

bindEncodedObjectAsID_set_object_id :: MethodBind
bindEncodedObjectAsID_set_object_id
  = unsafePerformIO $
      withCString "EncodedObjectAsID" $
        \ clsNamePtr ->
          withCString "set_object_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindEncodedObjectAsID_get_object_id #-}

bindEncodedObjectAsID_get_object_id :: MethodBind
bindEncodedObjectAsID_get_object_id
  = unsafePerformIO $
      withCString "EncodedObjectAsID" $
        \ clsNamePtr ->
          withCString "get_object_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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