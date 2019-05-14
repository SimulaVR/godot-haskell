{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ResourceInteractiveLoader
       (Godot.Core.ResourceInteractiveLoader.get_resource,
        Godot.Core.ResourceInteractiveLoader.poll,
        Godot.Core.ResourceInteractiveLoader.wait,
        Godot.Core.ResourceInteractiveLoader.get_stage,
        Godot.Core.ResourceInteractiveLoader.get_stage_count)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindResourceInteractiveLoader_get_resource #-}

-- | Return the loaded resource (only if loaded). Otherwise, returns null.
bindResourceInteractiveLoader_get_resource :: MethodBind
bindResourceInteractiveLoader_get_resource
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_resource" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the loaded resource (only if loaded). Otherwise, returns null.
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

{-# NOINLINE bindResourceInteractiveLoader_poll #-}

-- | Poll the load. If OK is returned, this means poll will have to be called again. If ERR_FILE_EOF is returned, them the load has finished and the resource can be obtained by calling [method get_resource].
bindResourceInteractiveLoader_poll :: MethodBind
bindResourceInteractiveLoader_poll
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "poll" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Poll the load. If OK is returned, this means poll will have to be called again. If ERR_FILE_EOF is returned, them the load has finished and the resource can be obtained by calling [method get_resource].
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

bindResourceInteractiveLoader_wait :: MethodBind
bindResourceInteractiveLoader_wait
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "wait" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

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

{-# NOINLINE bindResourceInteractiveLoader_get_stage #-}

-- | Return the load stage. The total amount of stages can be queried with [method get_stage_count]
bindResourceInteractiveLoader_get_stage :: MethodBind
bindResourceInteractiveLoader_get_stage
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_stage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the load stage. The total amount of stages can be queried with [method get_stage_count]
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

-- | Return the total amount of stages (calls to [method poll]) needed to completely load this resource.
bindResourceInteractiveLoader_get_stage_count :: MethodBind
bindResourceInteractiveLoader_get_stage_count
  = unsafePerformIO $
      withCString "ResourceInteractiveLoader" $
        \ clsNamePtr ->
          withCString "get_stage_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Return the total amount of stages (calls to [method poll]) needed to completely load this resource.
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