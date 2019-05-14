{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.BackBufferCopy
       (Godot.Core.BackBufferCopy._COPY_MODE_VIEWPORT,
        Godot.Core.BackBufferCopy._COPY_MODE_RECT,
        Godot.Core.BackBufferCopy._COPY_MODE_DISABLED,
        Godot.Core.BackBufferCopy.set_rect,
        Godot.Core.BackBufferCopy.get_rect,
        Godot.Core.BackBufferCopy.set_copy_mode,
        Godot.Core.BackBufferCopy.get_copy_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_COPY_MODE_VIEWPORT :: Int
_COPY_MODE_VIEWPORT = 2

_COPY_MODE_RECT :: Int
_COPY_MODE_RECT = 1

_COPY_MODE_DISABLED :: Int
_COPY_MODE_DISABLED = 0

{-# NOINLINE bindBackBufferCopy_set_rect #-}

-- | The area covered by the BackBufferCopy. Only used if [code]copy_mode[/code] is [code]COPY_MODE_RECT[/code].
bindBackBufferCopy_set_rect :: MethodBind
bindBackBufferCopy_set_rect
  = unsafePerformIO $
      withCString "BackBufferCopy" $
        \ clsNamePtr ->
          withCString "set_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area covered by the BackBufferCopy. Only used if [code]copy_mode[/code] is [code]COPY_MODE_RECT[/code].
set_rect ::
           (BackBufferCopy :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBackBufferCopy_set_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBackBufferCopy_get_rect #-}

-- | The area covered by the BackBufferCopy. Only used if [code]copy_mode[/code] is [code]COPY_MODE_RECT[/code].
bindBackBufferCopy_get_rect :: MethodBind
bindBackBufferCopy_get_rect
  = unsafePerformIO $
      withCString "BackBufferCopy" $
        \ clsNamePtr ->
          withCString "get_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The area covered by the BackBufferCopy. Only used if [code]copy_mode[/code] is [code]COPY_MODE_RECT[/code].
get_rect ::
           (BackBufferCopy :< cls, Object :< cls) => cls -> IO Rect2
get_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBackBufferCopy_get_rect (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBackBufferCopy_set_copy_mode #-}

-- | Buffer mode. See [code]COPY_MODE_*[/code] constants.
bindBackBufferCopy_set_copy_mode :: MethodBind
bindBackBufferCopy_set_copy_mode
  = unsafePerformIO $
      withCString "BackBufferCopy" $
        \ clsNamePtr ->
          withCString "set_copy_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Buffer mode. See [code]COPY_MODE_*[/code] constants.
set_copy_mode ::
                (BackBufferCopy :< cls, Object :< cls) => cls -> Int -> IO ()
set_copy_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBackBufferCopy_set_copy_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindBackBufferCopy_get_copy_mode #-}

-- | Buffer mode. See [code]COPY_MODE_*[/code] constants.
bindBackBufferCopy_get_copy_mode :: MethodBind
bindBackBufferCopy_get_copy_mode
  = unsafePerformIO $
      withCString "BackBufferCopy" $
        \ clsNamePtr ->
          withCString "get_copy_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Buffer mode. See [code]COPY_MODE_*[/code] constants.
get_copy_mode ::
                (BackBufferCopy :< cls, Object :< cls) => cls -> IO Int
get_copy_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindBackBufferCopy_get_copy_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)