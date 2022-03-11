{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.Physics2DShapeQueryResult
       (Godot.Core.Physics2DShapeQueryResult.get_result_count,
        Godot.Core.Physics2DShapeQueryResult.get_result_object,
        Godot.Core.Physics2DShapeQueryResult.get_result_object_id,
        Godot.Core.Physics2DShapeQueryResult.get_result_object_shape,
        Godot.Core.Physics2DShapeQueryResult.get_result_rid)
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

{-# NOINLINE bindPhysics2DShapeQueryResult_get_result_count #-}

bindPhysics2DShapeQueryResult_get_result_count :: MethodBind
bindPhysics2DShapeQueryResult_get_result_count
  = unsafePerformIO $
      withCString "Physics2DShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_count ::
                   (Physics2DShapeQueryResult :< cls, Object :< cls) => cls -> IO Int
get_result_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryResult_get_result_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DShapeQueryResult "get_result_count"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryResult.get_result_count

{-# NOINLINE bindPhysics2DShapeQueryResult_get_result_object #-}

bindPhysics2DShapeQueryResult_get_result_object :: MethodBind
bindPhysics2DShapeQueryResult_get_result_object
  = unsafePerformIO $
      withCString "Physics2DShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_object" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_object ::
                    (Physics2DShapeQueryResult :< cls, Object :< cls) =>
                    cls -> Int -> IO Object
get_result_object cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryResult_get_result_object
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DShapeQueryResult "get_result_object"
           '[Int]
           (IO Object)
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryResult.get_result_object

{-# NOINLINE bindPhysics2DShapeQueryResult_get_result_object_id #-}

bindPhysics2DShapeQueryResult_get_result_object_id :: MethodBind
bindPhysics2DShapeQueryResult_get_result_object_id
  = unsafePerformIO $
      withCString "Physics2DShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_object_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_object_id ::
                       (Physics2DShapeQueryResult :< cls, Object :< cls) =>
                       cls -> Int -> IO Int
get_result_object_id cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryResult_get_result_object_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DShapeQueryResult
           "get_result_object_id"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DShapeQueryResult.get_result_object_id

{-# NOINLINE bindPhysics2DShapeQueryResult_get_result_object_shape
             #-}

bindPhysics2DShapeQueryResult_get_result_object_shape :: MethodBind
bindPhysics2DShapeQueryResult_get_result_object_shape
  = unsafePerformIO $
      withCString "Physics2DShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_object_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_object_shape ::
                          (Physics2DShapeQueryResult :< cls, Object :< cls) =>
                          cls -> Int -> IO Int
get_result_object_shape cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindPhysics2DShapeQueryResult_get_result_object_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DShapeQueryResult
           "get_result_object_shape"
           '[Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.Physics2DShapeQueryResult.get_result_object_shape

{-# NOINLINE bindPhysics2DShapeQueryResult_get_result_rid #-}

bindPhysics2DShapeQueryResult_get_result_rid :: MethodBind
bindPhysics2DShapeQueryResult_get_result_rid
  = unsafePerformIO $
      withCString "Physics2DShapeQueryResult" $
        \ clsNamePtr ->
          withCString "get_result_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_result_rid ::
                 (Physics2DShapeQueryResult :< cls, Object :< cls) =>
                 cls -> Int -> IO Rid
get_result_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysics2DShapeQueryResult_get_result_rid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Physics2DShapeQueryResult "get_result_rid"
           '[Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.Physics2DShapeQueryResult.get_result_rid