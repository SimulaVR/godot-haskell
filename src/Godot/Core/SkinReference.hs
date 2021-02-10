{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SkinReference
       (Godot.Core.SkinReference._skin_changed,
        Godot.Core.SkinReference.get_skeleton,
        Godot.Core.SkinReference.get_skin)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindSkinReference__skin_changed #-}

bindSkinReference__skin_changed :: MethodBind
bindSkinReference__skin_changed
  = unsafePerformIO $
      withCString "SkinReference" $
        \ clsNamePtr ->
          withCString "_skin_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_skin_changed ::
                (SkinReference :< cls, Object :< cls) => cls -> IO ()
_skin_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkinReference__skin_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkinReference_get_skeleton #-}

bindSkinReference_get_skeleton :: MethodBind
bindSkinReference_get_skeleton
  = unsafePerformIO $
      withCString "SkinReference" $
        \ clsNamePtr ->
          withCString "get_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skeleton ::
               (SkinReference :< cls, Object :< cls) => cls -> IO Rid
get_skeleton cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkinReference_get_skeleton (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindSkinReference_get_skin #-}

bindSkinReference_get_skin :: MethodBind
bindSkinReference_get_skin
  = unsafePerformIO $
      withCString "SkinReference" $
        \ clsNamePtr ->
          withCString "get_skin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_skin :: (SkinReference :< cls, Object :< cls) => cls -> IO Skin
get_skin cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSkinReference_get_skin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)