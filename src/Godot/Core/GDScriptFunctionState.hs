{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GDScriptFunctionState
       (Godot.Core.GDScriptFunctionState.sig_completed,
        Godot.Core.GDScriptFunctionState._signal_callback,
        Godot.Core.GDScriptFunctionState.is_valid,
        Godot.Core.GDScriptFunctionState.resume)
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
import Godot.Core.Reference()

sig_completed ::
              Godot.Internal.Dispatch.Signal GDScriptFunctionState
sig_completed = Godot.Internal.Dispatch.Signal "completed"

instance NodeSignal GDScriptFunctionState "completed"
           '[GodotVariant]

{-# NOINLINE bindGDScriptFunctionState__signal_callback #-}

bindGDScriptFunctionState__signal_callback :: MethodBind
bindGDScriptFunctionState__signal_callback
  = unsafePerformIO $
      withCString "GDScriptFunctionState" $
        \ clsNamePtr ->
          withCString "_signal_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_signal_callback ::
                   (GDScriptFunctionState :< cls, Object :< cls) =>
                   cls -> [Variant 'GodotTy] -> IO GodotVariant
_signal_callback cls varargs
  = withVariantArray ([] ++ varargs)
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDScriptFunctionState__signal_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDScriptFunctionState "_signal_callback"
           '[[Variant 'GodotTy]]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.GDScriptFunctionState._signal_callback

{-# NOINLINE bindGDScriptFunctionState_is_valid #-}

bindGDScriptFunctionState_is_valid :: MethodBind
bindGDScriptFunctionState_is_valid
  = unsafePerformIO $
      withCString "GDScriptFunctionState" $
        \ clsNamePtr ->
          withCString "is_valid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_valid ::
           (GDScriptFunctionState :< cls, Object :< cls) =>
           cls -> Maybe Bool -> IO Bool
is_valid cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDScriptFunctionState_is_valid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDScriptFunctionState "is_valid" '[Maybe Bool]
           (IO Bool)
         where
        nodeMethod = Godot.Core.GDScriptFunctionState.is_valid

{-# NOINLINE bindGDScriptFunctionState_resume #-}

bindGDScriptFunctionState_resume :: MethodBind
bindGDScriptFunctionState_resume
  = unsafePerformIO $
      withCString "GDScriptFunctionState" $
        \ clsNamePtr ->
          withCString "resume" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

resume ::
         (GDScriptFunctionState :< cls, Object :< cls) =>
         cls -> Maybe GodotVariant -> IO GodotVariant
resume cls arg1
  = withVariantArray [maybe VariantNil toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindGDScriptFunctionState_resume
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod GDScriptFunctionState "resume"
           '[Maybe GodotVariant]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.GDScriptFunctionState.resume