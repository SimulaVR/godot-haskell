{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ResourceInteractiveLoader
       (Godot.Core.ResourceInteractiveLoader.get_resource,
        Godot.Core.ResourceInteractiveLoader.get_stage,
        Godot.Core.ResourceInteractiveLoader.get_stage_count,
        Godot.Core.ResourceInteractiveLoader.poll,
        Godot.Core.ResourceInteractiveLoader.wait)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindResourceInteractiveLoader_get_resource #-}

-- | Returns the loaded resource if the load operation completed successfully, [code]null[/code] otherwise.
bindResourceInteractiveLoader_get_resource :: MethodBind
bindResourceInteractiveLoader_get_resource
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the loaded resource if the load operation completed successfully, [code]null[/code] otherwise.
get_resource ::
               (ResourceInteractiveLoader :< cls, Object :< cls) =>
               cls -> IO Resource
get_resource cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceInteractiveLoader_get_resource
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceInteractiveLoader_get_stage #-}

-- | Returns the load stage. The total amount of stages can be queried with [method get_stage_count].
bindResourceInteractiveLoader_get_stage :: MethodBind
bindResourceInteractiveLoader_get_stage
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_stage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the load stage. The total amount of stages can be queried with [method get_stage_count].
get_stage ::
            (ResourceInteractiveLoader :< cls, Object :< cls) => cls -> IO Int
get_stage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceInteractiveLoader_get_stage
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceInteractiveLoader_get_stage_count #-}

-- | Returns the total amount of stages (calls to [method poll]) needed to completely load this resource.
bindResourceInteractiveLoader_get_stage_count :: MethodBind
bindResourceInteractiveLoader_get_stage_count
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_stage_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the total amount of stages (calls to [method poll]) needed to completely load this resource.
get_stage_count ::
                  (ResourceInteractiveLoader :< cls, Object :< cls) => cls -> IO Int
get_stage_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindResourceInteractiveLoader_get_stage_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceInteractiveLoader_poll #-}

-- | Polls the loading operation, i.e. loads a data chunk up to the next stage.
--   				Returns [constant @GlobalScope.OK] if the poll is successful but the load operation has not finished yet (intermediate stage). This means [method poll] will have to be called again until the last stage is completed.
--   				Returns [constant @GlobalScope.ERR_FILE_EOF] if the load operation has completed successfully. The loaded resource can be obtained by calling [method get_resource].
--   				Returns another [enum @GlobalScope.Error] code if the poll has failed.
bindResourceInteractiveLoader_poll :: MethodBind
bindResourceInteractiveLoader_poll
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Polls the loading operation, i.e. loads a data chunk up to the next stage.
--   				Returns [constant @GlobalScope.OK] if the poll is successful but the load operation has not finished yet (intermediate stage). This means [method poll] will have to be called again until the last stage is completed.
--   				Returns [constant @GlobalScope.ERR_FILE_EOF] if the load operation has completed successfully. The loaded resource can be obtained by calling [method get_resource].
--   				Returns another [enum @GlobalScope.Error] code if the poll has failed.
poll ::
       (ResourceInteractiveLoader :< cls, Object :< cls) => cls -> IO Int
poll cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceInteractiveLoader_poll
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindResourceInteractiveLoader_wait #-}

-- | Polls the loading operation successively until the resource is completely loaded or a [method poll] fails.
--   				Returns [constant @GlobalScope.ERR_FILE_EOF] if the load operation has completed successfully. The loaded resource can be obtained by calling [method get_resource].
--   				Returns another [enum @GlobalScope.Error] code if a poll has failed, aborting the operation.
bindResourceInteractiveLoader_wait :: MethodBind
bindResourceInteractiveLoader_wait
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Polls the loading operation successively until the resource is completely loaded or a [method poll] fails.
--   				Returns [constant @GlobalScope.ERR_FILE_EOF] if the load operation has completed successfully. The loaded resource can be obtained by calling [method get_resource].
--   				Returns another [enum @GlobalScope.Error] code if a poll has failed, aborting the operation.
wait ::
       (ResourceInteractiveLoader :< cls, Object :< cls) => cls -> IO Int
wait cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindResourceInteractiveLoader_wait
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)