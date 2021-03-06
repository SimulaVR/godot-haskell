{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualShaderNodeInput
       (Godot.Core.VisualShaderNodeInput.sig_input_type_changed,
        Godot.Core.VisualShaderNodeInput.get_input_name,
        Godot.Core.VisualShaderNodeInput.get_input_real_name,
        Godot.Core.VisualShaderNodeInput.set_input_name)
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
import Godot.Core.VisualShaderNode()

sig_input_type_changed ::
                       Godot.Internal.Dispatch.Signal VisualShaderNodeInput
sig_input_type_changed
  = Godot.Internal.Dispatch.Signal "input_type_changed"

instance NodeSignal VisualShaderNodeInput "input_type_changed" '[]

instance NodeProperty VisualShaderNodeInput "input_name"
           GodotString
           'False
         where
        nodeProperty
          = (get_input_name, wrapDroppingSetter set_input_name, Nothing)

{-# NOINLINE bindVisualShaderNodeInput_get_input_name #-}

-- | One of the several input constants in lower-case style like: "vertex"(@VERTEX@) or "point_size"(@POINT_SIZE@).
bindVisualShaderNodeInput_get_input_name :: MethodBind
bindVisualShaderNodeInput_get_input_name
  = unsafePerformIO $
      withCString "VisualShaderNodeInput" $
        \ clsNamePtr ->
          withCString "get_input_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | One of the several input constants in lower-case style like: "vertex"(@VERTEX@) or "point_size"(@POINT_SIZE@).
get_input_name ::
                 (VisualShaderNodeInput :< cls, Object :< cls) =>
                 cls -> IO GodotString
get_input_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeInput_get_input_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeInput "get_input_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualShaderNodeInput.get_input_name

{-# NOINLINE bindVisualShaderNodeInput_get_input_real_name #-}

bindVisualShaderNodeInput_get_input_real_name :: MethodBind
bindVisualShaderNodeInput_get_input_real_name
  = unsafePerformIO $
      withCString "VisualShaderNodeInput" $
        \ clsNamePtr ->
          withCString "get_input_real_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_input_real_name ::
                      (VisualShaderNodeInput :< cls, Object :< cls) =>
                      cls -> IO GodotString
get_input_real_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualShaderNodeInput_get_input_real_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeInput "get_input_real_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualShaderNodeInput.get_input_real_name

{-# NOINLINE bindVisualShaderNodeInput_set_input_name #-}

-- | One of the several input constants in lower-case style like: "vertex"(@VERTEX@) or "point_size"(@POINT_SIZE@).
bindVisualShaderNodeInput_set_input_name :: MethodBind
bindVisualShaderNodeInput_set_input_name
  = unsafePerformIO $
      withCString "VisualShaderNodeInput" $
        \ clsNamePtr ->
          withCString "set_input_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | One of the several input constants in lower-case style like: "vertex"(@VERTEX@) or "point_size"(@POINT_SIZE@).
set_input_name ::
                 (VisualShaderNodeInput :< cls, Object :< cls) =>
                 cls -> GodotString -> IO ()
set_input_name cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualShaderNodeInput_set_input_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualShaderNodeInput "set_input_name"
           '[GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualShaderNodeInput.set_input_name