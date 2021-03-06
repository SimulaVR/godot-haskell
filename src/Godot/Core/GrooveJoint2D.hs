{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GrooveJoint2D
       (Godot.Core.GrooveJoint2D.get_initial_offset,
        Godot.Core.GrooveJoint2D.get_length,
        Godot.Core.GrooveJoint2D.set_initial_offset,
        Godot.Core.GrooveJoint2D.set_length)
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
import Godot.Core.Joint2D()

instance NodeProperty GrooveJoint2D "initial_offset" Float 'False
         where
        nodeProperty
          = (get_initial_offset, wrapDroppingSetter set_initial_offset,
             Nothing)

instance NodeProperty GrooveJoint2D "length" Float 'False where
        nodeProperty = (get_length, wrapDroppingSetter set_length, Nothing)

{-# NOINLINE bindGrooveJoint2D_get_initial_offset #-}

-- | The body B's initial anchor position defined by the joint's origin and a local offset @initial_offset@ along the joint's Y axis (along the groove).
bindGrooveJoint2D_get_initial_offset :: MethodBind
bindGrooveJoint2D_get_initial_offset
  = unsafePerformIO $
      withCString "GrooveJoint2D" $
        \ clsNamePtr ->
          withCString "get_initial_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body B's initial anchor position defined by the joint's origin and a local offset @initial_offset@ along the joint's Y axis (along the groove).
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

instance NodeMethod GrooveJoint2D "get_initial_offset" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.GrooveJoint2D.get_initial_offset

{-# NOINLINE bindGrooveJoint2D_get_length #-}

-- | The groove's length. The groove is from the joint's origin towards @length@ along the joint's local Y axis.
bindGrooveJoint2D_get_length :: MethodBind
bindGrooveJoint2D_get_length
  = unsafePerformIO $
      withCString "GrooveJoint2D" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The groove's length. The groove is from the joint's origin towards @length@ along the joint's local Y axis.
get_length ::
             (GrooveJoint2D :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGrooveJoint2D_get_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GrooveJoint2D "get_length" '[] (IO Float) where
        nodeMethod = Godot.Core.GrooveJoint2D.get_length

{-# NOINLINE bindGrooveJoint2D_set_initial_offset #-}

-- | The body B's initial anchor position defined by the joint's origin and a local offset @initial_offset@ along the joint's Y axis (along the groove).
bindGrooveJoint2D_set_initial_offset :: MethodBind
bindGrooveJoint2D_set_initial_offset
  = unsafePerformIO $
      withCString "GrooveJoint2D" $
        \ clsNamePtr ->
          withCString "set_initial_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The body B's initial anchor position defined by the joint's origin and a local offset @initial_offset@ along the joint's Y axis (along the groove).
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

instance NodeMethod GrooveJoint2D "set_initial_offset" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.GrooveJoint2D.set_initial_offset

{-# NOINLINE bindGrooveJoint2D_set_length #-}

-- | The groove's length. The groove is from the joint's origin towards @length@ along the joint's local Y axis.
bindGrooveJoint2D_set_length :: MethodBind
bindGrooveJoint2D_set_length
  = unsafePerformIO $
      withCString "GrooveJoint2D" $
        \ clsNamePtr ->
          withCString "set_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The groove's length. The groove is from the joint's origin towards @length@ along the joint's local Y axis.
set_length ::
             (GrooveJoint2D :< cls, Object :< cls) => cls -> Float -> IO ()
set_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGrooveJoint2D_set_length (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GrooveJoint2D "set_length" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.GrooveJoint2D.set_length