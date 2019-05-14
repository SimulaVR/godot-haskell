{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.MobileVRInterface
       (Godot.Core.MobileVRInterface.set_iod,
        Godot.Core.MobileVRInterface.get_iod,
        Godot.Core.MobileVRInterface.set_display_width,
        Godot.Core.MobileVRInterface.get_display_width,
        Godot.Core.MobileVRInterface.set_display_to_lens,
        Godot.Core.MobileVRInterface.get_display_to_lens,
        Godot.Core.MobileVRInterface.set_oversample,
        Godot.Core.MobileVRInterface.get_oversample,
        Godot.Core.MobileVRInterface.set_k1,
        Godot.Core.MobileVRInterface.get_k1,
        Godot.Core.MobileVRInterface.set_k2,
        Godot.Core.MobileVRInterface.get_k2)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindMobileVRInterface_set_iod #-}

bindMobileVRInterface_set_iod :: MethodBind
bindMobileVRInterface_set_iod
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "set_iod" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_iod ::
          (MobileVRInterface :< cls, Object :< cls) => cls -> Float -> IO ()
set_iod cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_set_iod (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_get_iod #-}

bindMobileVRInterface_get_iod :: MethodBind
bindMobileVRInterface_get_iod
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "get_iod" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_iod ::
          (MobileVRInterface :< cls, Object :< cls) => cls -> IO Float
get_iod cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_get_iod (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_set_display_width #-}

bindMobileVRInterface_set_display_width :: MethodBind
bindMobileVRInterface_set_display_width
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "set_display_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_display_width ::
                    (MobileVRInterface :< cls, Object :< cls) => cls -> Float -> IO ()
set_display_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_set_display_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_get_display_width #-}

bindMobileVRInterface_get_display_width :: MethodBind
bindMobileVRInterface_get_display_width
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "get_display_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_display_width ::
                    (MobileVRInterface :< cls, Object :< cls) => cls -> IO Float
get_display_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_get_display_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_set_display_to_lens #-}

bindMobileVRInterface_set_display_to_lens :: MethodBind
bindMobileVRInterface_set_display_to_lens
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "set_display_to_lens" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_display_to_lens ::
                      (MobileVRInterface :< cls, Object :< cls) => cls -> Float -> IO ()
set_display_to_lens cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_set_display_to_lens
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_get_display_to_lens #-}

bindMobileVRInterface_get_display_to_lens :: MethodBind
bindMobileVRInterface_get_display_to_lens
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "get_display_to_lens" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_display_to_lens ::
                      (MobileVRInterface :< cls, Object :< cls) => cls -> IO Float
get_display_to_lens cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_get_display_to_lens
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_set_oversample #-}

bindMobileVRInterface_set_oversample :: MethodBind
bindMobileVRInterface_set_oversample
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "set_oversample" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_oversample ::
                 (MobileVRInterface :< cls, Object :< cls) => cls -> Float -> IO ()
set_oversample cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_set_oversample
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_get_oversample #-}

bindMobileVRInterface_get_oversample :: MethodBind
bindMobileVRInterface_get_oversample
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "get_oversample" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_oversample ::
                 (MobileVRInterface :< cls, Object :< cls) => cls -> IO Float
get_oversample cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_get_oversample
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_set_k1 #-}

bindMobileVRInterface_set_k1 :: MethodBind
bindMobileVRInterface_set_k1
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "set_k1" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_k1 ::
         (MobileVRInterface :< cls, Object :< cls) => cls -> Float -> IO ()
set_k1 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_set_k1 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_get_k1 #-}

bindMobileVRInterface_get_k1 :: MethodBind
bindMobileVRInterface_get_k1
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "get_k1" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_k1 ::
         (MobileVRInterface :< cls, Object :< cls) => cls -> IO Float
get_k1 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_get_k1 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_set_k2 #-}

bindMobileVRInterface_set_k2 :: MethodBind
bindMobileVRInterface_set_k2
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "set_k2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_k2 ::
         (MobileVRInterface :< cls, Object :< cls) => cls -> Float -> IO ()
set_k2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_set_k2 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindMobileVRInterface_get_k2 #-}

bindMobileVRInterface_get_k2 :: MethodBind
bindMobileVRInterface_get_k2
  = unsafePerformIO $
      withCString "MobileVRInterface" $
        \ clsNamePtr ->
          withCString "get_k2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_k2 ::
         (MobileVRInterface :< cls, Object :< cls) => cls -> IO Float
get_k2 cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindMobileVRInterface_get_k2 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)