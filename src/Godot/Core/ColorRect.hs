{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.ColorRect
       (Godot.Core.ColorRect.get_frame_color,
        Godot.Core.ColorRect.set_frame_color)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindColorRect_get_frame_color #-}

-- | The fill color.
--   			[codeblock]
--   			$ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
--   			[/codeblock]
bindColorRect_get_frame_color :: MethodBind
bindColorRect_get_frame_color
  = unsafePerformIO $
      withCString "ColorRect" $
        \ clsNamePtr ->
          withCString "get_frame_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fill color.
--   			[codeblock]
--   			$ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
--   			[/codeblock]
get_frame_color ::
                  (ColorRect :< cls, Object :< cls) => cls -> IO Color
get_frame_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorRect_get_frame_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindColorRect_set_frame_color #-}

-- | The fill color.
--   			[codeblock]
--   			$ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
--   			[/codeblock]
bindColorRect_set_frame_color :: MethodBind
bindColorRect_set_frame_color
  = unsafePerformIO $
      withCString "ColorRect" $
        \ clsNamePtr ->
          withCString "set_frame_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fill color.
--   			[codeblock]
--   			$ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
--   			[/codeblock]
set_frame_color ::
                  (ColorRect :< cls, Object :< cls) => cls -> Color -> IO ()
set_frame_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorRect_set_frame_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)