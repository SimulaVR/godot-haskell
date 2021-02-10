{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.BakedLightmapData
       (Godot.Core.BakedLightmapData._get_user_data,
        Godot.Core.BakedLightmapData._set_user_data,
        Godot.Core.BakedLightmapData.add_user,
        Godot.Core.BakedLightmapData.clear_users,
        Godot.Core.BakedLightmapData.get_bounds,
        Godot.Core.BakedLightmapData.get_cell_space_transform,
        Godot.Core.BakedLightmapData.get_cell_subdiv,
        Godot.Core.BakedLightmapData.get_energy,
        Godot.Core.BakedLightmapData.get_octree,
        Godot.Core.BakedLightmapData.get_user_count,
        Godot.Core.BakedLightmapData.get_user_lightmap,
        Godot.Core.BakedLightmapData.get_user_path,
        Godot.Core.BakedLightmapData.set_bounds,
        Godot.Core.BakedLightmapData.set_cell_space_transform,
        Godot.Core.BakedLightmapData.set_cell_subdiv,
        Godot.Core.BakedLightmapData.set_energy,
        Godot.Core.BakedLightmapData.set_octree)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindBakedLightmapData__get_user_data #-}

bindBakedLightmapData__get_user_data :: MethodBind
bindBakedLightmapData__get_user_data
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "_get_user_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_get_user_data ::
                 (BakedLightmapData :< cls, Object :< cls) => cls -> IO Array
_get_user_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData__get_user_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData__set_user_data #-}

bindBakedLightmapData__set_user_data :: MethodBind
bindBakedLightmapData__set_user_data
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "_set_user_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_set_user_data ::
                 (BakedLightmapData :< cls, Object :< cls) => cls -> Array -> IO ()
_set_user_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData__set_user_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_add_user #-}

bindBakedLightmapData_add_user :: MethodBind
bindBakedLightmapData_add_user
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "add_user" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

add_user ::
           (BakedLightmapData :< cls, Object :< cls) =>
           cls -> NodePath -> Texture -> Int -> IO ()
add_user cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_add_user (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_clear_users #-}

bindBakedLightmapData_clear_users :: MethodBind
bindBakedLightmapData_clear_users
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "clear_users" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

clear_users ::
              (BakedLightmapData :< cls, Object :< cls) => cls -> IO ()
clear_users cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_clear_users
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_get_bounds #-}

bindBakedLightmapData_get_bounds :: MethodBind
bindBakedLightmapData_get_bounds
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "get_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bounds ::
             (BakedLightmapData :< cls, Object :< cls) => cls -> IO Aabb
get_bounds cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_get_bounds
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_get_cell_space_transform #-}

bindBakedLightmapData_get_cell_space_transform :: MethodBind
bindBakedLightmapData_get_cell_space_transform
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "get_cell_space_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_space_transform ::
                           (BakedLightmapData :< cls, Object :< cls) => cls -> IO Transform
get_cell_space_transform cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindBakedLightmapData_get_cell_space_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_get_cell_subdiv #-}

bindBakedLightmapData_get_cell_subdiv :: MethodBind
bindBakedLightmapData_get_cell_subdiv
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "get_cell_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_cell_subdiv ::
                  (BakedLightmapData :< cls, Object :< cls) => cls -> IO Int
get_cell_subdiv cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_get_cell_subdiv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_get_energy #-}

bindBakedLightmapData_get_energy :: MethodBind
bindBakedLightmapData_get_energy
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_energy ::
             (BakedLightmapData :< cls, Object :< cls) => cls -> IO Float
get_energy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_get_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_get_octree #-}

bindBakedLightmapData_get_octree :: MethodBind
bindBakedLightmapData_get_octree
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "get_octree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_octree ::
             (BakedLightmapData :< cls, Object :< cls) =>
             cls -> IO PoolByteArray
get_octree cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_get_octree
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_get_user_count #-}

bindBakedLightmapData_get_user_count :: MethodBind
bindBakedLightmapData_get_user_count
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "get_user_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_user_count ::
                 (BakedLightmapData :< cls, Object :< cls) => cls -> IO Int
get_user_count cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_get_user_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_get_user_lightmap #-}

bindBakedLightmapData_get_user_lightmap :: MethodBind
bindBakedLightmapData_get_user_lightmap
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "get_user_lightmap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_user_lightmap ::
                    (BakedLightmapData :< cls, Object :< cls) =>
                    cls -> Int -> IO Texture
get_user_lightmap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_get_user_lightmap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_get_user_path #-}

bindBakedLightmapData_get_user_path :: MethodBind
bindBakedLightmapData_get_user_path
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "get_user_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_user_path ::
                (BakedLightmapData :< cls, Object :< cls) =>
                cls -> Int -> IO NodePath
get_user_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_get_user_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_set_bounds #-}

bindBakedLightmapData_set_bounds :: MethodBind
bindBakedLightmapData_set_bounds
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "set_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bounds ::
             (BakedLightmapData :< cls, Object :< cls) => cls -> Aabb -> IO ()
set_bounds cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_set_bounds
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_set_cell_space_transform #-}

bindBakedLightmapData_set_cell_space_transform :: MethodBind
bindBakedLightmapData_set_cell_space_transform
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "set_cell_space_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cell_space_transform ::
                           (BakedLightmapData :< cls, Object :< cls) =>
                           cls -> Transform -> IO ()
set_cell_space_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindBakedLightmapData_set_cell_space_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_set_cell_subdiv #-}

bindBakedLightmapData_set_cell_subdiv :: MethodBind
bindBakedLightmapData_set_cell_subdiv
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "set_cell_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_cell_subdiv ::
                  (BakedLightmapData :< cls, Object :< cls) => cls -> Int -> IO ()
set_cell_subdiv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_set_cell_subdiv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_set_energy #-}

bindBakedLightmapData_set_energy :: MethodBind
bindBakedLightmapData_set_energy
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_energy ::
             (BakedLightmapData :< cls, Object :< cls) => cls -> Float -> IO ()
set_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_set_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBakedLightmapData_set_octree #-}

bindBakedLightmapData_set_octree :: MethodBind
bindBakedLightmapData_set_octree
  = unsafePerformIO $
      withCString "BakedLightmapData" $
        \ clsNamePtr ->
          withCString "set_octree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_octree ::
             (BakedLightmapData :< cls, Object :< cls) =>
             cls -> PoolByteArray -> IO ()
set_octree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBakedLightmapData_set_octree
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)