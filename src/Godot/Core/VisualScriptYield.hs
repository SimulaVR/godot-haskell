{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualScriptYield
       (Godot.Core.VisualScriptYield._YIELD_WAIT,
        Godot.Core.VisualScriptYield._YIELD_FRAME,
        Godot.Core.VisualScriptYield._YIELD_PHYSICS_FRAME,
        Godot.Core.VisualScriptYield.get_wait_time,
        Godot.Core.VisualScriptYield.get_yield_mode,
        Godot.Core.VisualScriptYield.set_wait_time,
        Godot.Core.VisualScriptYield.set_yield_mode)
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
import Godot.Core.VisualScriptNode()

_YIELD_WAIT :: Int
_YIELD_WAIT = 3

_YIELD_FRAME :: Int
_YIELD_FRAME = 1

_YIELD_PHYSICS_FRAME :: Int
_YIELD_PHYSICS_FRAME = 2

instance NodeProperty VisualScriptYield "mode" Int 'False where
        nodeProperty
          = (get_yield_mode, wrapDroppingSetter set_yield_mode, Nothing)

instance NodeProperty VisualScriptYield "wait_time" Float 'False
         where
        nodeProperty
          = (get_wait_time, wrapDroppingSetter set_wait_time, Nothing)

{-# NOINLINE bindVisualScriptYield_get_wait_time #-}

bindVisualScriptYield_get_wait_time :: MethodBind
bindVisualScriptYield_get_wait_time
  = unsafePerformIO $
      withCString "VisualScriptYield" $
        \ clsNamePtr ->
          withCString "get_wait_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_wait_time ::
                (VisualScriptYield :< cls, Object :< cls) => cls -> IO Float
get_wait_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYield_get_wait_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptYield "get_wait_time" '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualScriptYield.get_wait_time

{-# NOINLINE bindVisualScriptYield_get_yield_mode #-}

bindVisualScriptYield_get_yield_mode :: MethodBind
bindVisualScriptYield_get_yield_mode
  = unsafePerformIO $
      withCString "VisualScriptYield" $
        \ clsNamePtr ->
          withCString "get_yield_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_yield_mode ::
                 (VisualScriptYield :< cls, Object :< cls) => cls -> IO Int
get_yield_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYield_get_yield_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptYield "get_yield_mode" '[] (IO Int)
         where
        nodeMethod = Godot.Core.VisualScriptYield.get_yield_mode

{-# NOINLINE bindVisualScriptYield_set_wait_time #-}

bindVisualScriptYield_set_wait_time :: MethodBind
bindVisualScriptYield_set_wait_time
  = unsafePerformIO $
      withCString "VisualScriptYield" $
        \ clsNamePtr ->
          withCString "set_wait_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_wait_time ::
                (VisualScriptYield :< cls, Object :< cls) => cls -> Float -> IO ()
set_wait_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYield_set_wait_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptYield "set_wait_time" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptYield.set_wait_time

{-# NOINLINE bindVisualScriptYield_set_yield_mode #-}

bindVisualScriptYield_set_yield_mode :: MethodBind
bindVisualScriptYield_set_yield_mode
  = unsafePerformIO $
      withCString "VisualScriptYield" $
        \ clsNamePtr ->
          withCString "set_yield_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_yield_mode ::
                 (VisualScriptYield :< cls, Object :< cls) => cls -> Int -> IO ()
set_yield_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualScriptYield_set_yield_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualScriptYield "set_yield_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualScriptYield.set_yield_mode