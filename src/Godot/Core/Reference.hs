{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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

-- | Initializes the internal reference counter. Use this only if you really know what you are doing.
--   				Returns whether the initialization was successful.
bindReference_init_ref :: MethodBind
bindReference_init_ref
  = unsafePerformIO $
      withCString "Reference" $
        \ clsNamePtr ->
          withCString "init_ref" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the internal reference counter. Use this only if you really know what you are doing.
--   				Returns whether the initialization was successful.
init_ref :: (Reference :< cls, Object :< cls) => cls -> IO Bool
init_ref cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReference_init_ref (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReference_reference #-}

-- | Increments the internal reference counter. Use this only if you really know what you are doing.
--   				Returns [code]true[/code] if the increment was successful, [code]false[/code] otherwise.
bindReference_reference :: MethodBind
bindReference_reference
  = unsafePerformIO $
      withCString "Reference" $
        \ clsNamePtr ->
          withCString "reference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increments the internal reference counter. Use this only if you really know what you are doing.
--   				Returns [code]true[/code] if the increment was successful, [code]false[/code] otherwise.
reference :: (Reference :< cls, Object :< cls) => cls -> IO Bool
reference cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReference_reference (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindReference_unreference #-}

-- | Decrements the internal reference counter. Use this only if you really know what you are doing.
--   				Returns [code]true[/code] if the decrement was successful, [code]false[/code] otherwise.
bindReference_unreference :: MethodBind
bindReference_unreference
  = unsafePerformIO $
      withCString "Reference" $
        \ clsNamePtr ->
          withCString "unreference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decrements the internal reference counter. Use this only if you really know what you are doing.
--   				Returns [code]true[/code] if the decrement was successful, [code]false[/code] otherwise.
unreference :: (Reference :< cls, Object :< cls) => cls -> IO Bool
unreference cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReference_unreference (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)