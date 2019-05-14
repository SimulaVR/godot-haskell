{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Reference
       (Godot.Core.Reference.init_ref, Godot.Core.Reference.reference,
        Godot.Core.Reference.unreference)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindReference_init_ref #-}

bindReference_init_ref :: MethodBind
bindReference_init_ref
  = unsafePerformIO $
      withCString "Reference" $
        \ clsNamePtr ->
          withCString "init_ref" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

init_ref :: (Reference :< cls, Object :< cls) => cls -> IO Bool
init_ref cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReference_init_ref (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReference_reference #-}

-- | Increase the internal reference counter. Use this only if you really know what you are doing.
bindReference_reference :: MethodBind
bindReference_reference
  = unsafePerformIO $
      withCString "Reference" $
        \ clsNamePtr ->
          withCString "reference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increase the internal reference counter. Use this only if you really know what you are doing.
reference :: (Reference :< cls, Object :< cls) => cls -> IO Bool
reference cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReference_reference (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReference_unreference #-}

-- | Decrease the internal reference counter. Use this only if you really know what you are doing.
bindReference_unreference :: MethodBind
bindReference_unreference
  = unsafePerformIO $
      withCString "Reference" $
        \ clsNamePtr ->
          withCString "unreference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decrease the internal reference counter. Use this only if you really know what you are doing.
unreference :: (Reference :< cls, Object :< cls) => cls -> IO Bool
unreference cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReference_unreference (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)