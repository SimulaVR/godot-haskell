{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.Range
       (Godot.Core.Range.sig_changed, Godot.Core.Range.sig_value_changed,
        Godot.Core.Range.get_as_ratio, Godot.Core.Range.get_max,
        Godot.Core.Range.get_min, Godot.Core.Range.get_page,
        Godot.Core.Range.get_step, Godot.Core.Range.get_value,
        Godot.Core.Range.is_greater_allowed,
        Godot.Core.Range.is_lesser_allowed, Godot.Core.Range.is_ratio_exp,
        Godot.Core.Range.is_using_rounded_values,
        Godot.Core.Range.set_allow_greater,
        Godot.Core.Range.set_allow_lesser, Godot.Core.Range.set_as_ratio,
        Godot.Core.Range.set_exp_ratio, Godot.Core.Range.set_max,
        Godot.Core.Range.set_min, Godot.Core.Range.set_page,
        Godot.Core.Range.set_step, Godot.Core.Range.set_use_rounded_values,
        Godot.Core.Range.set_value, Godot.Core.Range.share,
        Godot.Core.Range.unshare)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

-- | Emitted when [member min_value], [member max_value], [member page], or [member step] change.
sig_changed :: Godot.Internal.Dispatch.Signal Range
sig_changed = Godot.Internal.Dispatch.Signal "changed"

-- | Emitted when [member value] changes.
sig_value_changed :: Godot.Internal.Dispatch.Signal Range
sig_value_changed = Godot.Internal.Dispatch.Signal "value_changed"

{-# NOINLINE bindRange_get_as_ratio #-}

-- | The value mapped between 0 and 1.
bindRange_get_as_ratio :: MethodBind
bindRange_get_as_ratio
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_as_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The value mapped between 0 and 1.
get_as_ratio :: (Range :< cls, Object :< cls) => cls -> IO Float
get_as_ratio cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_as_ratio (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_get_max #-}

-- | Maximum value. Range is clamped if [code]value[/code] is greater than [code]max_value[/code]. Default value: [code]100[/code].
bindRange_get_max :: MethodBind
bindRange_get_max
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum value. Range is clamped if [code]value[/code] is greater than [code]max_value[/code]. Default value: [code]100[/code].
get_max :: (Range :< cls, Object :< cls) => cls -> IO Float
get_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_max (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_get_min #-}

-- | Minimum value. Range is clamped if [code]value[/code] is less than [code]min_value[/code]. Default value: [code]0[/code].
bindRange_get_min :: MethodBind
bindRange_get_min
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum value. Range is clamped if [code]value[/code] is less than [code]min_value[/code]. Default value: [code]0[/code].
get_min :: (Range :< cls, Object :< cls) => cls -> IO Float
get_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_min (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_get_page #-}

-- | Page size. Used mainly for [ScrollBar]. ScrollBar's length is its size multiplied by [code]page[/code] over the difference between [code]min_value[/code] and [code]max_value[/code].
bindRange_get_page :: MethodBind
bindRange_get_page
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_page" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Page size. Used mainly for [ScrollBar]. ScrollBar's length is its size multiplied by [code]page[/code] over the difference between [code]min_value[/code] and [code]max_value[/code].
get_page :: (Range :< cls, Object :< cls) => cls -> IO Float
get_page cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_page (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_get_step #-}

-- | If greater than 0, [code]value[/code] will always be rounded to a multiple of [code]step[/code]. If [code]rounded[/code] is also [code]true[/code], [code]value[/code] will first be rounded to a multiple of [code]step[/code] then rounded to the nearest integer.
bindRange_get_step :: MethodBind
bindRange_get_step
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If greater than 0, [code]value[/code] will always be rounded to a multiple of [code]step[/code]. If [code]rounded[/code] is also [code]true[/code], [code]value[/code] will first be rounded to a multiple of [code]step[/code] then rounded to the nearest integer.
get_step :: (Range :< cls, Object :< cls) => cls -> IO Float
get_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_step (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_get_value #-}

-- | Range's current value.
bindRange_get_value :: MethodBind
bindRange_get_value
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Range's current value.
get_value :: (Range :< cls, Object :< cls) => cls -> IO Float
get_value cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_value (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_is_greater_allowed #-}

-- | If [code]true[/code], [member value] may be greater than [member max_value]. Default value: [code]false[/code].
bindRange_is_greater_allowed :: MethodBind
bindRange_is_greater_allowed
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "is_greater_allowed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [member value] may be greater than [member max_value]. Default value: [code]false[/code].
is_greater_allowed ::
                     (Range :< cls, Object :< cls) => cls -> IO Bool
is_greater_allowed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_is_greater_allowed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_is_lesser_allowed #-}

-- | If [code]true[/code], [member value] may be less than [member min_value]. Default value: [code]false[/code].
bindRange_is_lesser_allowed :: MethodBind
bindRange_is_lesser_allowed
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "is_lesser_allowed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [member value] may be less than [member min_value]. Default value: [code]false[/code].
is_lesser_allowed ::
                    (Range :< cls, Object :< cls) => cls -> IO Bool
is_lesser_allowed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_is_lesser_allowed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_is_ratio_exp #-}

-- | If [code]true[/code], and [code]min_value[/code] is greater than 0, [code]value[/code] will be represented exponentially rather than linearly.
bindRange_is_ratio_exp :: MethodBind
bindRange_is_ratio_exp
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "is_ratio_exp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], and [code]min_value[/code] is greater than 0, [code]value[/code] will be represented exponentially rather than linearly.
is_ratio_exp :: (Range :< cls, Object :< cls) => cls -> IO Bool
is_ratio_exp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_is_ratio_exp (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_is_using_rounded_values #-}

-- | If [code]true[/code], [code]value[/code] will always be rounded to the nearest integer. Default value: [code]false[/code].
bindRange_is_using_rounded_values :: MethodBind
bindRange_is_using_rounded_values
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "is_using_rounded_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [code]value[/code] will always be rounded to the nearest integer. Default value: [code]false[/code].
is_using_rounded_values ::
                          (Range :< cls, Object :< cls) => cls -> IO Bool
is_using_rounded_values cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_is_using_rounded_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_allow_greater #-}

-- | If [code]true[/code], [member value] may be greater than [member max_value]. Default value: [code]false[/code].
bindRange_set_allow_greater :: MethodBind
bindRange_set_allow_greater
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_allow_greater" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [member value] may be greater than [member max_value]. Default value: [code]false[/code].
set_allow_greater ::
                    (Range :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_greater cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_allow_greater (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_allow_lesser #-}

-- | If [code]true[/code], [member value] may be less than [member min_value]. Default value: [code]false[/code].
bindRange_set_allow_lesser :: MethodBind
bindRange_set_allow_lesser
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_allow_lesser" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [member value] may be less than [member min_value]. Default value: [code]false[/code].
set_allow_lesser ::
                   (Range :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_lesser cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_allow_lesser (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_as_ratio #-}

-- | The value mapped between 0 and 1.
bindRange_set_as_ratio :: MethodBind
bindRange_set_as_ratio
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_as_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The value mapped between 0 and 1.
set_as_ratio ::
               (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_as_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_as_ratio (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_exp_ratio #-}

-- | If [code]true[/code], and [code]min_value[/code] is greater than 0, [code]value[/code] will be represented exponentially rather than linearly.
bindRange_set_exp_ratio :: MethodBind
bindRange_set_exp_ratio
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_exp_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], and [code]min_value[/code] is greater than 0, [code]value[/code] will be represented exponentially rather than linearly.
set_exp_ratio ::
                (Range :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exp_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_exp_ratio (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_max #-}

-- | Maximum value. Range is clamped if [code]value[/code] is greater than [code]max_value[/code]. Default value: [code]100[/code].
bindRange_set_max :: MethodBind
bindRange_set_max
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum value. Range is clamped if [code]value[/code] is greater than [code]max_value[/code]. Default value: [code]100[/code].
set_max :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_max (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_min #-}

-- | Minimum value. Range is clamped if [code]value[/code] is less than [code]min_value[/code]. Default value: [code]0[/code].
bindRange_set_min :: MethodBind
bindRange_set_min
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum value. Range is clamped if [code]value[/code] is less than [code]min_value[/code]. Default value: [code]0[/code].
set_min :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_min (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_page #-}

-- | Page size. Used mainly for [ScrollBar]. ScrollBar's length is its size multiplied by [code]page[/code] over the difference between [code]min_value[/code] and [code]max_value[/code].
bindRange_set_page :: MethodBind
bindRange_set_page
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_page" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Page size. Used mainly for [ScrollBar]. ScrollBar's length is its size multiplied by [code]page[/code] over the difference between [code]min_value[/code] and [code]max_value[/code].
set_page :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_page cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_page (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_step #-}

-- | If greater than 0, [code]value[/code] will always be rounded to a multiple of [code]step[/code]. If [code]rounded[/code] is also [code]true[/code], [code]value[/code] will first be rounded to a multiple of [code]step[/code] then rounded to the nearest integer.
bindRange_set_step :: MethodBind
bindRange_set_step
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If greater than 0, [code]value[/code] will always be rounded to a multiple of [code]step[/code]. If [code]rounded[/code] is also [code]true[/code], [code]value[/code] will first be rounded to a multiple of [code]step[/code] then rounded to the nearest integer.
set_step :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_step cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_step (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_use_rounded_values #-}

-- | If [code]true[/code], [code]value[/code] will always be rounded to the nearest integer. Default value: [code]false[/code].
bindRange_set_use_rounded_values :: MethodBind
bindRange_set_use_rounded_values
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_use_rounded_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], [code]value[/code] will always be rounded to the nearest integer. Default value: [code]false[/code].
set_use_rounded_values ::
                         (Range :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_rounded_values cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_use_rounded_values
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_set_value #-}

-- | Range's current value.
bindRange_set_value :: MethodBind
bindRange_set_value
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_value" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Range's current value.
set_value :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_value cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_value (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_share #-}

-- | Binds two ranges together along with any ranges previously grouped with either of them. When any of range's member variables change, it will share the new value with all other ranges in its group.
bindRange_share :: MethodBind
bindRange_share
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "share" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binds two ranges together along with any ranges previously grouped with either of them. When any of range's member variables change, it will share the new value with all other ranges in its group.
share :: (Range :< cls, Object :< cls) => cls -> Node -> IO ()
share cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_share (upcast cls) arrPtr len >>=
           \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRange_unshare #-}

-- | Stop range from sharing its member variables with any other.
bindRange_unshare :: MethodBind
bindRange_unshare
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "unshare" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stop range from sharing its member variables with any other.
unshare :: (Range :< cls, Object :< cls) => cls -> IO ()
unshare cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_unshare (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)