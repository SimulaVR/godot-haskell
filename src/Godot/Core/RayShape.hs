{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.RayShape
       (Godot.Core.RayShape.get_length,
        Godot.Core.RayShape.get_slips_on_slope,
        Godot.Core.RayShape.set_length,
        Godot.Core.RayShape.set_slips_on_slope)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindRayShape_get_length #-}

-- | The ray's length.
bindRayShape_get_length :: MethodBind
bindRayShape_get_length
  = unsafePerformIO $
      withCString "RayShape" $
        \ clsNamePtr ->
          withCString "get_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's length.
get_length :: (RayShape :< cls, Object :< cls) => cls -> IO Float
get_length cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayShape_get_length (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayShape_get_slips_on_slope #-}

-- | If [code]true[/code], allow the shape to return the correct normal. Default value: [code]false[/code].
bindRayShape_get_slips_on_slope :: MethodBind
bindRayShape_get_slips_on_slope
  = unsafePerformIO $
      withCString "RayShape" $
        \ clsNamePtr ->
          withCString "get_slips_on_slope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], allow the shape to return the correct normal. Default value: [code]false[/code].
get_slips_on_slope ::
                     (RayShape :< cls, Object :< cls) => cls -> IO Bool
get_slips_on_slope cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayShape_get_slips_on_slope (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayShape_set_length #-}

-- | The ray's length.
bindRayShape_set_length :: MethodBind
bindRayShape_set_length
  = unsafePerformIO $
      withCString "RayShape" $
        \ clsNamePtr ->
          withCString "set_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The ray's length.
set_length ::
             (RayShape :< cls, Object :< cls) => cls -> Float -> IO ()
set_length cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayShape_set_length (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindRayShape_set_slips_on_slope #-}

-- | If [code]true[/code], allow the shape to return the correct normal. Default value: [code]false[/code].
bindRayShape_set_slips_on_slope :: MethodBind
bindRayShape_set_slips_on_slope
  = unsafePerformIO $
      withCString "RayShape" $
        \ clsNamePtr ->
          withCString "set_slips_on_slope" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], allow the shape to return the correct normal. Default value: [code]false[/code].
set_slips_on_slope ::
                     (RayShape :< cls, Object :< cls) => cls -> Bool -> IO ()
set_slips_on_slope cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindRayShape_set_slips_on_slope (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)