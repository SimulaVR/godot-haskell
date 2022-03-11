{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsShapeQueryResult
       (Godot.Core.PhysicsShapeQueryResult.get_result_count,
        Godot.Core.PhysicsShapeQueryResult.get_result_object,
        Godot.Core.PhysicsShapeQueryResult.get_result_object_id,
        Godot.Core.PhysicsShapeQueryResult.get_result_object_shape,
        Godot.Core.PhysicsShapeQueryResult.get_result_rid)
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

{-# NOINLINE bindPhysicsShapeQueryResult_get_result_count #-}

bindPhysicsShapeQueryResult_get_result_count :: MethodBind
bindPhysicsShapeQueryResult_get_result_count
  = unsafePerformIO $
      withCString "PhysicsShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_count ::
                   (PhysicsShapeQueryResult :< cls, Object :< cls) => cls -> IO Int
get_result_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsShapeQueryResult_get_result_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryResult "get_result_count" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryResult.get_result_count

{-# NOINLINE bindPhysicsShapeQueryResult_get_result_object #-}

bindPhysicsShapeQueryResult_get_result_object :: MethodBind
bindPhysicsShapeQueryResult_get_result_object
  = unsafePerformIO $
      withCString "PhysicsShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_object ::
                    (PhysicsShapeQueryResult :< cls, Object :< cls) =>
                    cls -> Int -> IO Object
get_result_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryResult_get_result_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryResult "get_result_object"
           '[Int]
           (IO Object)
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryResult.get_result_object

{-# NOINLINE bindPhysicsShapeQueryResult_get_result_object_id #-}

bindPhysicsShapeQueryResult_get_result_object_id :: MethodBind
bindPhysicsShapeQueryResult_get_result_object_id
  = unsafePerformIO $
      withCString "PhysicsShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_object_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_object_id ::
                       (PhysicsShapeQueryResult :< cls, Object :< cls) =>
                       cls -> Int -> IO Int
get_result_object_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryResult_get_result_object_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryResult "get_result_object_id"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.PhysicsShapeQueryResult.get_result_object_id

{-# NOINLINE bindPhysicsShapeQueryResult_get_result_object_shape
             #-}

bindPhysicsShapeQueryResult_get_result_object_shape :: MethodBind
bindPhysicsShapeQueryResult_get_result_object_shape
  = unsafePerformIO $
      withCString "PhysicsShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_object_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_object_shape ::
                          (PhysicsShapeQueryResult :< cls, Object :< cls) =>
                          cls -> Int -> IO Int
get_result_object_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysicsShapeQueryResult_get_result_object_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryResult
           "get_result_object_shape"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.PhysicsShapeQueryResult.get_result_object_shape

{-# NOINLINE bindPhysicsShapeQueryResult_get_result_rid #-}

bindPhysicsShapeQueryResult_get_result_rid :: MethodBind
bindPhysicsShapeQueryResult_get_result_rid
  = unsafePerformIO $
      withCString "PhysicsShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_rid ::
                 (PhysicsShapeQueryResult :< cls, Object :< cls) =>
                 cls -> Int -> IO Rid
get_result_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsShapeQueryResult_get_result_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsShapeQueryResult "get_result_rid" '[Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.PhysicsShapeQueryResult.get_result_rid