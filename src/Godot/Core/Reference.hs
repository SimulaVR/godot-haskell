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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Object()

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

instance NodeMethod Reference "init_ref" '[] (IO Bool) where
        nodeMethod = Godot.Core.Reference.init_ref

{-# NOINLINE bindReference_reference #-}

-- | Increments the internal reference counter. Use this only if you really know what you are doing.
--   				Returns @true@ if the increment was successful, @false@ otherwise.
bindReference_reference :: MethodBind
bindReference_reference
  = unsafePerformIO $
      withCString "Reference" $
        \ clsNamePtr ->
          withCString "reference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Increments the internal reference counter. Use this only if you really know what you are doing.
--   				Returns @true@ if the increment was successful, @false@ otherwise.
reference :: (Reference :< cls, Object :< cls) => cls -> IO Bool
reference cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReference_reference (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Reference "reference" '[] (IO Bool) where
        nodeMethod = Godot.Core.Reference.reference

{-# NOINLINE bindReference_unreference #-}

-- | Decrements the internal reference counter. Use this only if you really know what you are doing.
--   				Returns @true@ if the decrement was successful, @false@ otherwise.
bindReference_unreference :: MethodBind
bindReference_unreference
  = unsafePerformIO $
      withCString "Reference" $
        \ clsNamePtr ->
          withCString "unreference" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Decrements the internal reference counter. Use this only if you really know what you are doing.
--   				Returns @true@ if the decrement was successful, @false@ otherwise.
unreference :: (Reference :< cls, Object :< cls) => cls -> IO Bool
unreference cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindReference_unreference (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Reference "unreference" '[] (IO Bool) where
        nodeMethod = Godot.Core.Reference.unreference