{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.CenterContainer
       (Godot.Core.CenterContainer.is_using_top_left,
        Godot.Core.CenterContainer.set_use_top_left)
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
import Godot.Core.Container()

instance NodeProperty CenterContainer "use_top_left" Bool 'False
         where
        nodeProperty
          = (is_using_top_left, wrapDroppingSetter set_use_top_left, Nothing)

{-# NOINLINE bindCenterContainer_is_using_top_left #-}

-- | If @true@, centers children relative to the @CenterContainer@'s top left corner.
bindCenterContainer_is_using_top_left :: MethodBind
bindCenterContainer_is_using_top_left
  = unsafePerformIO $
      withCString "CenterContainer" $
        \ clsNamePtr ->
          withCString "is_using_top_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, centers children relative to the @CenterContainer@'s top left corner.
is_using_top_left ::
                    (CenterContainer :< cls, Object :< cls) => cls -> IO Bool
is_using_top_left cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCenterContainer_is_using_top_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CenterContainer "is_using_top_left" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.CenterContainer.is_using_top_left

{-# NOINLINE bindCenterContainer_set_use_top_left #-}

-- | If @true@, centers children relative to the @CenterContainer@'s top left corner.
bindCenterContainer_set_use_top_left :: MethodBind
bindCenterContainer_set_use_top_left
  = unsafePerformIO $
      withCString "CenterContainer" $
        \ clsNamePtr ->
          withCString "set_use_top_left" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, centers children relative to the @CenterContainer@'s top left corner.
set_use_top_left ::
                   (CenterContainer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_use_top_left cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindCenterContainer_set_use_top_left
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod CenterContainer "set_use_top_left" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.CenterContainer.set_use_top_left