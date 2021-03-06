{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ColorRect
       (Godot.Core.ColorRect.get_frame_color,
        Godot.Core.ColorRect.set_frame_color)
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

instance NodeProperty ColorRect "color" Color 'False where
        nodeProperty
          = (get_frame_color, wrapDroppingSetter set_frame_color, Nothing)

{-# NOINLINE bindColorRect_get_frame_color #-}

-- | The fill color.
--   			
--   @
--   
--   			$ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
--   			
--   @
bindColorRect_get_frame_color :: MethodBind
bindColorRect_get_frame_color
  = unsafePerformIO $
      withCString "ColorRect" $
        \ clsNamePtr ->
          withCString "get_frame_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fill color.
--   			
--   @
--   
--   			$ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
--   			
--   @
get_frame_color ::
                  (ColorRect :< cls, Object :< cls) => cls -> IO Color
get_frame_color cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorRect_get_frame_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ColorRect "get_frame_color" '[] (IO Color)
         where
        nodeMethod = Godot.Core.ColorRect.get_frame_color

{-# NOINLINE bindColorRect_set_frame_color #-}

-- | The fill color.
--   			
--   @
--   
--   			$ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
--   			
--   @
bindColorRect_set_frame_color :: MethodBind
bindColorRect_set_frame_color
  = unsafePerformIO $
      withCString "ColorRect" $
        \ clsNamePtr ->
          withCString "set_frame_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The fill color.
--   			
--   @
--   
--   			$ColorRect.color = Color(1, 0, 0, 1) # Set ColorRect's color to red.
--   			
--   @
set_frame_color ::
                  (ColorRect :< cls, Object :< cls) => cls -> Color -> IO ()
set_frame_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindColorRect_set_frame_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod ColorRect "set_frame_color" '[Color] (IO ())
         where
        nodeMethod = Godot.Core.ColorRect.set_frame_color