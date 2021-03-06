{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimationNodeTransition
       (Godot.Core.AnimationNodeTransition.get_cross_fade_time,
        Godot.Core.AnimationNodeTransition.get_enabled_inputs,
        Godot.Core.AnimationNodeTransition.get_input_caption,
        Godot.Core.AnimationNodeTransition.is_input_set_as_auto_advance,
        Godot.Core.AnimationNodeTransition.set_cross_fade_time,
        Godot.Core.AnimationNodeTransition.set_enabled_inputs,
        Godot.Core.AnimationNodeTransition.set_input_as_auto_advance,
        Godot.Core.AnimationNodeTransition.set_input_caption)
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
import Godot.Core.AnimationNode()

instance NodeProperty AnimationNodeTransition
           "input_0/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 is_input_set_as_auto_advance,
             wrapIndexedSetter 0 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_0/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_input_caption,
             wrapIndexedSetter 0 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_1/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 is_input_set_as_auto_advance,
             wrapIndexedSetter 1 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_1/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_input_caption,
             wrapIndexedSetter 1 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_10/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 is_input_set_as_auto_advance,
             wrapIndexedSetter 10 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_10/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_input_caption,
             wrapIndexedSetter 10 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_11/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 is_input_set_as_auto_advance,
             wrapIndexedSetter 11 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_11/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_input_caption,
             wrapIndexedSetter 11 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_12/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 is_input_set_as_auto_advance,
             wrapIndexedSetter 12 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_12/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_input_caption,
             wrapIndexedSetter 12 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_13/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 is_input_set_as_auto_advance,
             wrapIndexedSetter 13 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_13/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_input_caption,
             wrapIndexedSetter 13 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_14/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 is_input_set_as_auto_advance,
             wrapIndexedSetter 14 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_14/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_input_caption,
             wrapIndexedSetter 14 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_15/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 is_input_set_as_auto_advance,
             wrapIndexedSetter 15 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_15/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_input_caption,
             wrapIndexedSetter 15 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_16/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 is_input_set_as_auto_advance,
             wrapIndexedSetter 16 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_16/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_input_caption,
             wrapIndexedSetter 16 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_17/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 is_input_set_as_auto_advance,
             wrapIndexedSetter 17 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_17/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_input_caption,
             wrapIndexedSetter 17 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_18/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 is_input_set_as_auto_advance,
             wrapIndexedSetter 18 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_18/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_input_caption,
             wrapIndexedSetter 18 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_19/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 is_input_set_as_auto_advance,
             wrapIndexedSetter 19 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_19/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 get_input_caption,
             wrapIndexedSetter 19 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_2/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 is_input_set_as_auto_advance,
             wrapIndexedSetter 2 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_2/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_input_caption,
             wrapIndexedSetter 2 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_20/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 is_input_set_as_auto_advance,
             wrapIndexedSetter 20 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_20/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 get_input_caption,
             wrapIndexedSetter 20 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_21/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 is_input_set_as_auto_advance,
             wrapIndexedSetter 21 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_21/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 get_input_caption,
             wrapIndexedSetter 21 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_22/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 22 is_input_set_as_auto_advance,
             wrapIndexedSetter 22 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_22/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 22 get_input_caption,
             wrapIndexedSetter 22 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_23/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 23 is_input_set_as_auto_advance,
             wrapIndexedSetter 23 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_23/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 23 get_input_caption,
             wrapIndexedSetter 23 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_24/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 24 is_input_set_as_auto_advance,
             wrapIndexedSetter 24 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_24/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 24 get_input_caption,
             wrapIndexedSetter 24 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_25/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 25 is_input_set_as_auto_advance,
             wrapIndexedSetter 25 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_25/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 25 get_input_caption,
             wrapIndexedSetter 25 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_26/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 26 is_input_set_as_auto_advance,
             wrapIndexedSetter 26 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_26/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 26 get_input_caption,
             wrapIndexedSetter 26 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_27/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 27 is_input_set_as_auto_advance,
             wrapIndexedSetter 27 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_27/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 27 get_input_caption,
             wrapIndexedSetter 27 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_28/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 28 is_input_set_as_auto_advance,
             wrapIndexedSetter 28 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_28/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 28 get_input_caption,
             wrapIndexedSetter 28 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_29/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 29 is_input_set_as_auto_advance,
             wrapIndexedSetter 29 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_29/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 29 get_input_caption,
             wrapIndexedSetter 29 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_3/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 is_input_set_as_auto_advance,
             wrapIndexedSetter 3 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_3/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_input_caption,
             wrapIndexedSetter 3 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_30/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 30 is_input_set_as_auto_advance,
             wrapIndexedSetter 30 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_30/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 30 get_input_caption,
             wrapIndexedSetter 30 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_31/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 31 is_input_set_as_auto_advance,
             wrapIndexedSetter 31 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_31/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 31 get_input_caption,
             wrapIndexedSetter 31 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_4/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 is_input_set_as_auto_advance,
             wrapIndexedSetter 4 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_4/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_input_caption,
             wrapIndexedSetter 4 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_5/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 is_input_set_as_auto_advance,
             wrapIndexedSetter 5 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_5/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_input_caption,
             wrapIndexedSetter 5 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_6/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 is_input_set_as_auto_advance,
             wrapIndexedSetter 6 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_6/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_input_caption,
             wrapIndexedSetter 6 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_7/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 is_input_set_as_auto_advance,
             wrapIndexedSetter 7 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_7/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_input_caption,
             wrapIndexedSetter 7 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_8/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 is_input_set_as_auto_advance,
             wrapIndexedSetter 8 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_8/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_input_caption,
             wrapIndexedSetter 8 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition
           "input_9/auto_advance"
           Bool
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 is_input_set_as_auto_advance,
             wrapIndexedSetter 9 set_input_as_auto_advance, Nothing)

instance NodeProperty AnimationNodeTransition "input_9/name"
           GodotString
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_input_caption,
             wrapIndexedSetter 9 set_input_caption, Nothing)

instance NodeProperty AnimationNodeTransition "input_count" Int
           'False
         where
        nodeProperty
          = (get_enabled_inputs, wrapDroppingSetter set_enabled_inputs,
             Nothing)

instance NodeProperty AnimationNodeTransition "xfade_time" Float
           'False
         where
        nodeProperty
          = (get_cross_fade_time, wrapDroppingSetter set_cross_fade_time,
             Nothing)

{-# NOINLINE bindAnimationNodeTransition_get_cross_fade_time #-}

-- | Cross-fading time (in seconds) between each animation connected to the inputs.
bindAnimationNodeTransition_get_cross_fade_time :: MethodBind
bindAnimationNodeTransition_get_cross_fade_time
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "get_cross_fade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Cross-fading time (in seconds) between each animation connected to the inputs.
get_cross_fade_time ::
                      (AnimationNodeTransition :< cls, Object :< cls) => cls -> IO Float
get_cross_fade_time cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_get_cross_fade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeTransition "get_cross_fade_time"
           '[]
           (IO Float)
         where
        nodeMethod = Godot.Core.AnimationNodeTransition.get_cross_fade_time

{-# NOINLINE bindAnimationNodeTransition_get_enabled_inputs #-}

-- | The number of available input ports for this node.
bindAnimationNodeTransition_get_enabled_inputs :: MethodBind
bindAnimationNodeTransition_get_enabled_inputs
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "get_enabled_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of available input ports for this node.
get_enabled_inputs ::
                     (AnimationNodeTransition :< cls, Object :< cls) => cls -> IO Int
get_enabled_inputs cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_get_enabled_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeTransition "get_enabled_inputs"
           '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.AnimationNodeTransition.get_enabled_inputs

{-# NOINLINE bindAnimationNodeTransition_get_input_caption #-}

bindAnimationNodeTransition_get_input_caption :: MethodBind
bindAnimationNodeTransition_get_input_caption
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "get_input_caption" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_input_caption ::
                    (AnimationNodeTransition :< cls, Object :< cls) =>
                    cls -> Int -> IO GodotString
get_input_caption cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_get_input_caption
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeTransition "get_input_caption"
           '[Int]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.AnimationNodeTransition.get_input_caption

{-# NOINLINE bindAnimationNodeTransition_is_input_set_as_auto_advance
             #-}

bindAnimationNodeTransition_is_input_set_as_auto_advance ::
                                                         MethodBind
bindAnimationNodeTransition_is_input_set_as_auto_advance
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "is_input_set_as_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_input_set_as_auto_advance ::
                               (AnimationNodeTransition :< cls, Object :< cls) =>
                               cls -> Int -> IO Bool
is_input_set_as_auto_advance cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_is_input_set_as_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeTransition
           "is_input_set_as_auto_advance"
           '[Int]
           (IO Bool)
         where
        nodeMethod
          = Godot.Core.AnimationNodeTransition.is_input_set_as_auto_advance

{-# NOINLINE bindAnimationNodeTransition_set_cross_fade_time #-}

-- | Cross-fading time (in seconds) between each animation connected to the inputs.
bindAnimationNodeTransition_set_cross_fade_time :: MethodBind
bindAnimationNodeTransition_set_cross_fade_time
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "set_cross_fade_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Cross-fading time (in seconds) between each animation connected to the inputs.
set_cross_fade_time ::
                      (AnimationNodeTransition :< cls, Object :< cls) =>
                      cls -> Float -> IO ()
set_cross_fade_time cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_set_cross_fade_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeTransition "set_cross_fade_time"
           '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeTransition.set_cross_fade_time

{-# NOINLINE bindAnimationNodeTransition_set_enabled_inputs #-}

-- | The number of available input ports for this node.
bindAnimationNodeTransition_set_enabled_inputs :: MethodBind
bindAnimationNodeTransition_set_enabled_inputs
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "set_enabled_inputs" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The number of available input ports for this node.
set_enabled_inputs ::
                     (AnimationNodeTransition :< cls, Object :< cls) =>
                     cls -> Int -> IO ()
set_enabled_inputs cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_set_enabled_inputs
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeTransition "set_enabled_inputs"
           '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeTransition.set_enabled_inputs

{-# NOINLINE bindAnimationNodeTransition_set_input_as_auto_advance
             #-}

bindAnimationNodeTransition_set_input_as_auto_advance :: MethodBind
bindAnimationNodeTransition_set_input_as_auto_advance
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "set_input_as_auto_advance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_as_auto_advance ::
                            (AnimationNodeTransition :< cls, Object :< cls) =>
                            cls -> Int -> Bool -> IO ()
set_input_as_auto_advance cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_set_input_as_auto_advance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeTransition
           "set_input_as_auto_advance"
           '[Int, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.AnimationNodeTransition.set_input_as_auto_advance

{-# NOINLINE bindAnimationNodeTransition_set_input_caption #-}

bindAnimationNodeTransition_set_input_caption :: MethodBind
bindAnimationNodeTransition_set_input_caption
  = unsafePerformIO $
      withCString "AnimationNodeTransition" $
        \ clsNamePtr ->
          withCString "set_input_caption" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_input_caption ::
                    (AnimationNodeTransition :< cls, Object :< cls) =>
                    cls -> Int -> GodotString -> IO ()
set_input_caption cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindAnimationNodeTransition_set_input_caption
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimationNodeTransition "set_input_caption"
           '[Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimationNodeTransition.set_input_caption