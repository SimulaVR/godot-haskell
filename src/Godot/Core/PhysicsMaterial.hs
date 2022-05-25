{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.PhysicsMaterial
       (Godot.Core.PhysicsMaterial.get_bounce,
        Godot.Core.PhysicsMaterial.get_friction,
        Godot.Core.PhysicsMaterial.is_absorbent,
        Godot.Core.PhysicsMaterial.is_rough,
        Godot.Core.PhysicsMaterial.set_absorbent,
        Godot.Core.PhysicsMaterial.set_bounce,
        Godot.Core.PhysicsMaterial.set_friction,
        Godot.Core.PhysicsMaterial.set_rough)
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
import Godot.Core.Resource()

instance NodeProperty PhysicsMaterial "absorbent" Bool 'False where
        nodeProperty
          = (is_absorbent, wrapDroppingSetter set_absorbent, Nothing)

instance NodeProperty PhysicsMaterial "bounce" Float 'False where
        nodeProperty = (get_bounce, wrapDroppingSetter set_bounce, Nothing)

instance NodeProperty PhysicsMaterial "friction" Float 'False where
        nodeProperty
          = (get_friction, wrapDroppingSetter set_friction, Nothing)

instance NodeProperty PhysicsMaterial "rough" Bool 'False where
        nodeProperty = (is_rough, wrapDroppingSetter set_rough, Nothing)

{-# NOINLINE bindPhysicsMaterial_get_bounce #-}

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
bindPhysicsMaterial_get_bounce :: MethodBind
bindPhysicsMaterial_get_bounce
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "get_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
get_bounce ::
             (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Float
get_bounce cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_get_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsMaterial "get_bounce" '[] (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsMaterial.get_bounce

{-# NOINLINE bindPhysicsMaterial_get_friction #-}

-- | The body's friction. Values range from @0@ (frictionless) to @1@ (maximum friction).
bindPhysicsMaterial_get_friction :: MethodBind
bindPhysicsMaterial_get_friction
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "get_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from @0@ (frictionless) to @1@ (maximum friction).
get_friction ::
               (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Float
get_friction cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_get_friction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsMaterial "get_friction" '[] (IO Float)
         where
        nodeMethod = Godot.Core.PhysicsMaterial.get_friction

{-# NOINLINE bindPhysicsMaterial_is_absorbent #-}

bindPhysicsMaterial_is_absorbent :: MethodBind
bindPhysicsMaterial_is_absorbent
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "is_absorbent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_absorbent ::
               (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Bool
is_absorbent cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_is_absorbent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsMaterial "is_absorbent" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.PhysicsMaterial.is_absorbent

{-# NOINLINE bindPhysicsMaterial_is_rough #-}

bindPhysicsMaterial_is_rough :: MethodBind
bindPhysicsMaterial_is_rough
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "is_rough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_rough ::
           (PhysicsMaterial :< cls, Object :< cls) => cls -> IO Bool
is_rough cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_is_rough (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsMaterial "is_rough" '[] (IO Bool) where
        nodeMethod = Godot.Core.PhysicsMaterial.is_rough

{-# NOINLINE bindPhysicsMaterial_set_absorbent #-}

bindPhysicsMaterial_set_absorbent :: MethodBind
bindPhysicsMaterial_set_absorbent
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_absorbent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_absorbent ::
                (PhysicsMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_absorbent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_absorbent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsMaterial "set_absorbent" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.PhysicsMaterial.set_absorbent

{-# NOINLINE bindPhysicsMaterial_set_bounce #-}

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
bindPhysicsMaterial_set_bounce :: MethodBind
bindPhysicsMaterial_set_bounce
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_bounce" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's bounciness. Values range from @0@ (no bounce) to @1@ (full bounciness).
set_bounce ::
             (PhysicsMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_bounce cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_bounce (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsMaterial "set_bounce" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PhysicsMaterial.set_bounce

{-# NOINLINE bindPhysicsMaterial_set_friction #-}

-- | The body's friction. Values range from @0@ (frictionless) to @1@ (maximum friction).
bindPhysicsMaterial_set_friction :: MethodBind
bindPhysicsMaterial_set_friction
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_friction" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body's friction. Values range from @0@ (frictionless) to @1@ (maximum friction).
set_friction ::
               (PhysicsMaterial :< cls, Object :< cls) => cls -> Float -> IO ()
set_friction cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_friction
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsMaterial "set_friction" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.PhysicsMaterial.set_friction

{-# NOINLINE bindPhysicsMaterial_set_rough #-}

bindPhysicsMaterial_set_rough :: MethodBind
bindPhysicsMaterial_set_rough
  = unsafePerformIO $
      withCString "PhysicsMaterial" $
        \ clsNamePtr ->
          withCString "set_rough" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_rough ::
            (PhysicsMaterial :< cls, Object :< cls) => cls -> Bool -> IO ()
set_rough cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindPhysicsMaterial_set_rough (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod PhysicsMaterial "set_rough" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.PhysicsMaterial.set_rough