{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.DampedSpringJoint2D
       (Godot.Core.DampedSpringJoint2D.get_damping,
        Godot.Core.DampedSpringJoint2D.get_length,
        Godot.Core.DampedSpringJoint2D.get_rest_length,
        Godot.Core.DampedSpringJoint2D.get_stiffness,
        Godot.Core.DampedSpringJoint2D.set_damping,
        Godot.Core.DampedSpringJoint2D.set_length,
        Godot.Core.DampedSpringJoint2D.set_rest_length,
        Godot.Core.DampedSpringJoint2D.set_stiffness)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindDampedSpringJoint2D_get_damping #-}

-- | The spring joint's damping ratio. A value between [code]0[/code] and [code]1[/code]. When the two bodies move into different directions the system tries to align them to the spring axis again. A high [code]damping[/code] value forces the attached bodies to align faster.
bindDampedSpringJoint2D_get_damping :: MethodBind
bindDampedSpringJoint2D_get_damping
  = unsafePerformIO $
      withCString "DampedSpringJoint2D" $
        \ clsNamePtr ->
          withCString "get_damping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The spring joint's damping ratio. A value between [code]0[/code] and [code]1[/code]. When the two bodies move into different directions the system tries to align them to the spring axis again. A high [code]damping[/code] value forces the attached bodies to align faster.
get_damping ::
              (DampedSpringJoint2D :< cls, Object :< cls) => cls -> IO Float
get_damping cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDampedSpringJoint2D_get_damping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDampedSpringJoint2D_get_length #-}

-- | The spring joint's maximum length. The two attached bodies cannot stretch it past this value.
bindDampedSpringJoint2D_get_length :: MethodBind
bindDampedSpringJoint2D_get_length
  = unsafePerformIO $
      withCString "DampedSpringJoint2D" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The spring joint's maximum length. The two attached bodies cannot stretch it past this value.
get_length ::
             (DampedSpringJoint2D :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDampedSpringJoint2D_get_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDampedSpringJoint2D_get_rest_length #-}

-- | When the bodies attached to the spring joint move they stretch or squash it. The joint always tries to resize towards this length.
bindDampedSpringJoint2D_get_rest_length :: MethodBind
bindDampedSpringJoint2D_get_rest_length
  = unsafePerformIO $
      withCString "DampedSpringJoint2D" $
        \ clsNamePtr ->
          withCString "get_rest_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When the bodies attached to the spring joint move they stretch or squash it. The joint always tries to resize towards this length.
get_rest_length ::
                  (DampedSpringJoint2D :< cls, Object :< cls) => cls -> IO Float
get_rest_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDampedSpringJoint2D_get_rest_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDampedSpringJoint2D_get_stiffness #-}

-- | The higher the value, the less the bodies attached to the joint will deform it. The joint applies an opposing force to the bodies, the product of the stiffness multiplied by the size difference from its resting length.
bindDampedSpringJoint2D_get_stiffness :: MethodBind
bindDampedSpringJoint2D_get_stiffness
  = unsafePerformIO $
      withCString "DampedSpringJoint2D" $
        \ clsNamePtr ->
          withCString "get_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The higher the value, the less the bodies attached to the joint will deform it. The joint applies an opposing force to the bodies, the product of the stiffness multiplied by the size difference from its resting length.
get_stiffness ::
                (DampedSpringJoint2D :< cls, Object :< cls) => cls -> IO Float
get_stiffness cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDampedSpringJoint2D_get_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDampedSpringJoint2D_set_damping #-}

-- | The spring joint's damping ratio. A value between [code]0[/code] and [code]1[/code]. When the two bodies move into different directions the system tries to align them to the spring axis again. A high [code]damping[/code] value forces the attached bodies to align faster.
bindDampedSpringJoint2D_set_damping :: MethodBind
bindDampedSpringJoint2D_set_damping
  = unsafePerformIO $
      withCString "DampedSpringJoint2D" $
        \ clsNamePtr ->
          withCString "set_damping" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The spring joint's damping ratio. A value between [code]0[/code] and [code]1[/code]. When the two bodies move into different directions the system tries to align them to the spring axis again. A high [code]damping[/code] value forces the attached bodies to align faster.
set_damping ::
              (DampedSpringJoint2D :< cls, Object :< cls) =>
              cls -> Float -> IO ()
set_damping cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDampedSpringJoint2D_set_damping
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDampedSpringJoint2D_set_length #-}

-- | The spring joint's maximum length. The two attached bodies cannot stretch it past this value.
bindDampedSpringJoint2D_set_length :: MethodBind
bindDampedSpringJoint2D_set_length
  = unsafePerformIO $
      withCString "DampedSpringJoint2D" $
        \ clsNamePtr ->
          withCString "set_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The spring joint's maximum length. The two attached bodies cannot stretch it past this value.
set_length ::
             (DampedSpringJoint2D :< cls, Object :< cls) =>
             cls -> Float -> IO ()
set_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDampedSpringJoint2D_set_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDampedSpringJoint2D_set_rest_length #-}

-- | When the bodies attached to the spring joint move they stretch or squash it. The joint always tries to resize towards this length.
bindDampedSpringJoint2D_set_rest_length :: MethodBind
bindDampedSpringJoint2D_set_rest_length
  = unsafePerformIO $
      withCString "DampedSpringJoint2D" $
        \ clsNamePtr ->
          withCString "set_rest_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | When the bodies attached to the spring joint move they stretch or squash it. The joint always tries to resize towards this length.
set_rest_length ::
                  (DampedSpringJoint2D :< cls, Object :< cls) =>
                  cls -> Float -> IO ()
set_rest_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDampedSpringJoint2D_set_rest_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindDampedSpringJoint2D_set_stiffness #-}

-- | The higher the value, the less the bodies attached to the joint will deform it. The joint applies an opposing force to the bodies, the product of the stiffness multiplied by the size difference from its resting length.
bindDampedSpringJoint2D_set_stiffness :: MethodBind
bindDampedSpringJoint2D_set_stiffness
  = unsafePerformIO $
      withCString "DampedSpringJoint2D" $
        \ clsNamePtr ->
          withCString "set_stiffness" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The higher the value, the less the bodies attached to the joint will deform it. The joint applies an opposing force to the bodies, the product of the stiffness multiplied by the size difference from its resting length.
set_stiffness ::
                (DampedSpringJoint2D :< cls, Object :< cls) =>
                cls -> Float -> IO ()
set_stiffness cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindDampedSpringJoint2D_set_stiffness
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)