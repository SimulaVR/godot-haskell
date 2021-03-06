{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Control()

-- | Emitted when @min_value@, @max_value@, @page@, or @step@ change.
sig_changed :: Godot.Internal.Dispatch.Signal Range
sig_changed = Godot.Internal.Dispatch.Signal "changed"

instance NodeSignal Range "changed" '[]

-- | Emitted when @value@ changes.
sig_value_changed :: Godot.Internal.Dispatch.Signal Range
sig_value_changed = Godot.Internal.Dispatch.Signal "value_changed"

instance NodeSignal Range "value_changed" '[Float]

instance NodeProperty Range "allow_greater" Bool 'False where
        nodeProperty
          = (is_greater_allowed, wrapDroppingSetter set_allow_greater,
             Nothing)

instance NodeProperty Range "allow_lesser" Bool 'False where
        nodeProperty
          = (is_lesser_allowed, wrapDroppingSetter set_allow_lesser, Nothing)

instance NodeProperty Range "exp_edit" Bool 'False where
        nodeProperty
          = (is_ratio_exp, wrapDroppingSetter set_exp_ratio, Nothing)

instance NodeProperty Range "max_value" Float 'False where
        nodeProperty = (get_max, wrapDroppingSetter set_max, Nothing)

instance NodeProperty Range "min_value" Float 'False where
        nodeProperty = (get_min, wrapDroppingSetter set_min, Nothing)

instance NodeProperty Range "page" Float 'False where
        nodeProperty = (get_page, wrapDroppingSetter set_page, Nothing)

instance NodeProperty Range "ratio" Float 'False where
        nodeProperty
          = (get_as_ratio, wrapDroppingSetter set_as_ratio, Nothing)

instance NodeProperty Range "rounded" Bool 'False where
        nodeProperty
          = (is_using_rounded_values,
             wrapDroppingSetter set_use_rounded_values, Nothing)

instance NodeProperty Range "step" Float 'False where
        nodeProperty = (get_step, wrapDroppingSetter set_step, Nothing)

instance NodeProperty Range "value" Float 'False where
        nodeProperty = (get_value, wrapDroppingSetter set_value, Nothing)

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

instance NodeMethod Range "get_as_ratio" '[] (IO Float) where
        nodeMethod = Godot.Core.Range.get_as_ratio

{-# NOINLINE bindRange_get_max #-}

-- | Maximum value. Range is clamped if @value@ is greater than @max_value@.
bindRange_get_max :: MethodBind
bindRange_get_max
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum value. Range is clamped if @value@ is greater than @max_value@.
get_max :: (Range :< cls, Object :< cls) => cls -> IO Float
get_max cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_max (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "get_max" '[] (IO Float) where
        nodeMethod = Godot.Core.Range.get_max

{-# NOINLINE bindRange_get_min #-}

-- | Minimum value. Range is clamped if @value@ is less than @min_value@.
bindRange_get_min :: MethodBind
bindRange_get_min
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum value. Range is clamped if @value@ is less than @min_value@.
get_min :: (Range :< cls, Object :< cls) => cls -> IO Float
get_min cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_min (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "get_min" '[] (IO Float) where
        nodeMethod = Godot.Core.Range.get_min

{-# NOINLINE bindRange_get_page #-}

-- | Page size. Used mainly for @ScrollBar@. ScrollBar's length is its size multiplied by @page@ over the difference between @min_value@ and @max_value@.
bindRange_get_page :: MethodBind
bindRange_get_page
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_page" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Page size. Used mainly for @ScrollBar@. ScrollBar's length is its size multiplied by @page@ over the difference between @min_value@ and @max_value@.
get_page :: (Range :< cls, Object :< cls) => cls -> IO Float
get_page cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_page (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "get_page" '[] (IO Float) where
        nodeMethod = Godot.Core.Range.get_page

{-# NOINLINE bindRange_get_step #-}

-- | If greater than 0, @value@ will always be rounded to a multiple of @step@. If @rounded@ is also @true@, @value@ will first be rounded to a multiple of @step@ then rounded to the nearest integer.
bindRange_get_step :: MethodBind
bindRange_get_step
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "get_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If greater than 0, @value@ will always be rounded to a multiple of @step@. If @rounded@ is also @true@, @value@ will first be rounded to a multiple of @step@ then rounded to the nearest integer.
get_step :: (Range :< cls, Object :< cls) => cls -> IO Float
get_step cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_get_step (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "get_step" '[] (IO Float) where
        nodeMethod = Godot.Core.Range.get_step

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

instance NodeMethod Range "get_value" '[] (IO Float) where
        nodeMethod = Godot.Core.Range.get_value

{-# NOINLINE bindRange_is_greater_allowed #-}

-- | If @true@, @value@ may be greater than @max_value@.
bindRange_is_greater_allowed :: MethodBind
bindRange_is_greater_allowed
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "is_greater_allowed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @value@ may be greater than @max_value@.
is_greater_allowed ::
                     (Range :< cls, Object :< cls) => cls -> IO Bool
is_greater_allowed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_is_greater_allowed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "is_greater_allowed" '[] (IO Bool) where
        nodeMethod = Godot.Core.Range.is_greater_allowed

{-# NOINLINE bindRange_is_lesser_allowed #-}

-- | If @true@, @value@ may be less than @min_value@.
bindRange_is_lesser_allowed :: MethodBind
bindRange_is_lesser_allowed
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "is_lesser_allowed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @value@ may be less than @min_value@.
is_lesser_allowed ::
                    (Range :< cls, Object :< cls) => cls -> IO Bool
is_lesser_allowed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_is_lesser_allowed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "is_lesser_allowed" '[] (IO Bool) where
        nodeMethod = Godot.Core.Range.is_lesser_allowed

{-# NOINLINE bindRange_is_ratio_exp #-}

-- | If @true@, and @min_value@ is greater than 0, @value@ will be represented exponentially rather than linearly.
bindRange_is_ratio_exp :: MethodBind
bindRange_is_ratio_exp
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "is_ratio_exp" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, and @min_value@ is greater than 0, @value@ will be represented exponentially rather than linearly.
is_ratio_exp :: (Range :< cls, Object :< cls) => cls -> IO Bool
is_ratio_exp cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_is_ratio_exp (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "is_ratio_exp" '[] (IO Bool) where
        nodeMethod = Godot.Core.Range.is_ratio_exp

{-# NOINLINE bindRange_is_using_rounded_values #-}

-- | If @true@, @value@ will always be rounded to the nearest integer.
bindRange_is_using_rounded_values :: MethodBind
bindRange_is_using_rounded_values
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "is_using_rounded_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @value@ will always be rounded to the nearest integer.
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

instance NodeMethod Range "is_using_rounded_values" '[] (IO Bool)
         where
        nodeMethod = Godot.Core.Range.is_using_rounded_values

{-# NOINLINE bindRange_set_allow_greater #-}

-- | If @true@, @value@ may be greater than @max_value@.
bindRange_set_allow_greater :: MethodBind
bindRange_set_allow_greater
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_allow_greater" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @value@ may be greater than @max_value@.
set_allow_greater ::
                    (Range :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_greater cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_allow_greater (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "set_allow_greater" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Range.set_allow_greater

{-# NOINLINE bindRange_set_allow_lesser #-}

-- | If @true@, @value@ may be less than @min_value@.
bindRange_set_allow_lesser :: MethodBind
bindRange_set_allow_lesser
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_allow_lesser" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @value@ may be less than @min_value@.
set_allow_lesser ::
                   (Range :< cls, Object :< cls) => cls -> Bool -> IO ()
set_allow_lesser cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_allow_lesser (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "set_allow_lesser" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Range.set_allow_lesser

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

instance NodeMethod Range "set_as_ratio" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Range.set_as_ratio

{-# NOINLINE bindRange_set_exp_ratio #-}

-- | If @true@, and @min_value@ is greater than 0, @value@ will be represented exponentially rather than linearly.
bindRange_set_exp_ratio :: MethodBind
bindRange_set_exp_ratio
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_exp_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, and @min_value@ is greater than 0, @value@ will be represented exponentially rather than linearly.
set_exp_ratio ::
                (Range :< cls, Object :< cls) => cls -> Bool -> IO ()
set_exp_ratio cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_exp_ratio (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "set_exp_ratio" '[Bool] (IO ()) where
        nodeMethod = Godot.Core.Range.set_exp_ratio

{-# NOINLINE bindRange_set_max #-}

-- | Maximum value. Range is clamped if @value@ is greater than @max_value@.
bindRange_set_max :: MethodBind
bindRange_set_max
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_max" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Maximum value. Range is clamped if @value@ is greater than @max_value@.
set_max :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_max cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_max (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "set_max" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Range.set_max

{-# NOINLINE bindRange_set_min #-}

-- | Minimum value. Range is clamped if @value@ is less than @min_value@.
bindRange_set_min :: MethodBind
bindRange_set_min
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_min" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Minimum value. Range is clamped if @value@ is less than @min_value@.
set_min :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_min cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_min (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "set_min" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Range.set_min

{-# NOINLINE bindRange_set_page #-}

-- | Page size. Used mainly for @ScrollBar@. ScrollBar's length is its size multiplied by @page@ over the difference between @min_value@ and @max_value@.
bindRange_set_page :: MethodBind
bindRange_set_page
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_page" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Page size. Used mainly for @ScrollBar@. ScrollBar's length is its size multiplied by @page@ over the difference between @min_value@ and @max_value@.
set_page :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_page cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_page (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "set_page" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Range.set_page

{-# NOINLINE bindRange_set_step #-}

-- | If greater than 0, @value@ will always be rounded to a multiple of @step@. If @rounded@ is also @true@, @value@ will first be rounded to a multiple of @step@ then rounded to the nearest integer.
bindRange_set_step :: MethodBind
bindRange_set_step
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_step" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If greater than 0, @value@ will always be rounded to a multiple of @step@. If @rounded@ is also @true@, @value@ will first be rounded to a multiple of @step@ then rounded to the nearest integer.
set_step :: (Range :< cls, Object :< cls) => cls -> Float -> IO ()
set_step cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_set_step (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "set_step" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Range.set_step

{-# NOINLINE bindRange_set_use_rounded_values #-}

-- | If @true@, @value@ will always be rounded to the nearest integer.
bindRange_set_use_rounded_values :: MethodBind
bindRange_set_use_rounded_values
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "set_use_rounded_values" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, @value@ will always be rounded to the nearest integer.
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

instance NodeMethod Range "set_use_rounded_values" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.Range.set_use_rounded_values

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

instance NodeMethod Range "set_value" '[Float] (IO ()) where
        nodeMethod = Godot.Core.Range.set_value

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

instance NodeMethod Range "share" '[Node] (IO ()) where
        nodeMethod = Godot.Core.Range.share

{-# NOINLINE bindRange_unshare #-}

-- | Stops range from sharing its member variables with any other.
bindRange_unshare :: MethodBind
bindRange_unshare
  = unsafePerformIO $
      withCString "Range" $
        \ clsNamePtr ->
          withCString "unshare" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Stops range from sharing its member variables with any other.
unshare :: (Range :< cls, Object :< cls) => cls -> IO ()
unshare cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRange_unshare (upcast cls) arrPtr len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod Range "unshare" '[] (IO ()) where
        nodeMethod = Godot.Core.Range.unshare