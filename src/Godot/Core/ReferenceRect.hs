{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ReferenceRect
       (Godot.Core.ReferenceRect.get_border_color,
        Godot.Core.ReferenceRect.set_border_color)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindReferenceRect_get_border_color #-}

bindReferenceRect_get_border_color :: MethodBind
bindReferenceRect_get_border_color
  = unsafePerformIO $
      withCString "ReferenceRect" $
        \ clsNamePtr ->
          withCString "get_border_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_border_color ::
                   (ReferenceRect :< cls, Object :< cls) => cls -> IO Color
get_border_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReferenceRect_get_border_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReferenceRect_set_border_color #-}

bindReferenceRect_set_border_color :: MethodBind
bindReferenceRect_set_border_color
  = unsafePerformIO $
      withCString "ReferenceRect" $
        \ clsNamePtr ->
          withCString "set_border_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_border_color ::
                   (ReferenceRect :< cls, Object :< cls) => cls -> Color -> IO ()
set_border_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReferenceRect_set_border_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)