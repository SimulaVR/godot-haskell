{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.GrooveJoint2D
       (Godot.Core.GrooveJoint2D.get_initial_offset,
        Godot.Core.GrooveJoint2D.get_length,
        Godot.Core.GrooveJoint2D.set_initial_offset,
        Godot.Core.GrooveJoint2D.set_length)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindGrooveJoint2D_get_initial_offset #-}

-- | The body B's initial anchor position defined by the joint's origin and a local offset [member initial_offset] along the joint's y axis (along the groove). Default value: [code]25[/code]
bindGrooveJoint2D_get_initial_offset :: MethodBind
bindGrooveJoint2D_get_initial_offset
  = unsafePerformIO $
      withCString "GrooveJoint2D" $
        \ clsNamePtr ->
          withCString "get_initial_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body B's initial anchor position defined by the joint's origin and a local offset [member initial_offset] along the joint's y axis (along the groove). Default value: [code]25[/code]
get_initial_offset ::
                     (GrooveJoint2D :< cls, Object :< cls) => cls -> IO Float
get_initial_offset cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGrooveJoint2D_get_initial_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGrooveJoint2D_get_length #-}

-- | The groove's length. The groove is from the joint's origin towards [member length] along the joint's local y axis. Default value: [code]50[/code]
bindGrooveJoint2D_get_length :: MethodBind
bindGrooveJoint2D_get_length
  = unsafePerformIO $
      withCString "GrooveJoint2D" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The groove's length. The groove is from the joint's origin towards [member length] along the joint's local y axis. Default value: [code]50[/code]
get_length ::
             (GrooveJoint2D :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGrooveJoint2D_get_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGrooveJoint2D_set_initial_offset #-}

-- | The body B's initial anchor position defined by the joint's origin and a local offset [member initial_offset] along the joint's y axis (along the groove). Default value: [code]25[/code]
bindGrooveJoint2D_set_initial_offset :: MethodBind
bindGrooveJoint2D_set_initial_offset
  = unsafePerformIO $
      withCString "GrooveJoint2D" $
        \ clsNamePtr ->
          withCString "set_initial_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body B's initial anchor position defined by the joint's origin and a local offset [member initial_offset] along the joint's y axis (along the groove). Default value: [code]25[/code]
set_initial_offset ::
                     (GrooveJoint2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_initial_offset cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGrooveJoint2D_set_initial_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindGrooveJoint2D_set_length #-}

-- | The groove's length. The groove is from the joint's origin towards [member length] along the joint's local y axis. Default value: [code]50[/code]
bindGrooveJoint2D_set_length :: MethodBind
bindGrooveJoint2D_set_length
  = unsafePerformIO $
      withCString "GrooveJoint2D" $
        \ clsNamePtr ->
          withCString "set_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The groove's length. The groove is from the joint's origin towards [member length] along the joint's local y axis. Default value: [code]50[/code]
set_length ::
             (GrooveJoint2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGrooveJoint2D_set_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)