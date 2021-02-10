{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NinePatchRect
       (Godot.Core.NinePatchRect._AXIS_STRETCH_MODE_TILE_FIT,
        Godot.Core.NinePatchRect._AXIS_STRETCH_MODE_TILE,
        Godot.Core.NinePatchRect._AXIS_STRETCH_MODE_STRETCH,
        Godot.Core.NinePatchRect.sig_texture_changed,
        Godot.Core.NinePatchRect.get_h_axis_stretch_mode,
        Godot.Core.NinePatchRect.get_patch_margin,
        Godot.Core.NinePatchRect.get_region_rect,
        Godot.Core.NinePatchRect.get_texture,
        Godot.Core.NinePatchRect.get_v_axis_stretch_mode,
        Godot.Core.NinePatchRect.is_draw_center_enabled,
        Godot.Core.NinePatchRect.set_draw_center,
        Godot.Core.NinePatchRect.set_h_axis_stretch_mode,
        Godot.Core.NinePatchRect.set_patch_margin,
        Godot.Core.NinePatchRect.set_region_rect,
        Godot.Core.NinePatchRect.set_texture,
        Godot.Core.NinePatchRect.set_v_axis_stretch_mode)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_AXIS_STRETCH_MODE_TILE_FIT :: Int
_AXIS_STRETCH_MODE_TILE_FIT = 2

_AXIS_STRETCH_MODE_TILE :: Int
_AXIS_STRETCH_MODE_TILE = 1

_AXIS_STRETCH_MODE_STRETCH :: Int
_AXIS_STRETCH_MODE_STRETCH = 0

-- | Emitted when the node's texture changes.
sig_texture_changed :: Godot.Internal.Dispatch.Signal NinePatchRect
sig_texture_changed
  = Godot.Internal.Dispatch.Signal "texture_changed"

instance NodeSignal NinePatchRect "texture_changed" '[]

{-# NOINLINE bindNinePatchRect_get_h_axis_stretch_mode #-}

-- | Doesn't do anything at the time of writing.
bindNinePatchRect_get_h_axis_stretch_mode :: MethodBind
bindNinePatchRect_get_h_axis_stretch_mode
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "get_h_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Doesn't do anything at the time of writing.
get_h_axis_stretch_mode ::
                          (NinePatchRect :< cls, Object :< cls) => cls -> IO Int
get_h_axis_stretch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_get_h_axis_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_get_patch_margin #-}

-- | Returns the size of the margin identified by the given [enum Margin] constant.
bindNinePatchRect_get_patch_margin :: MethodBind
bindNinePatchRect_get_patch_margin
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "get_patch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size of the margin identified by the given [enum Margin] constant.
get_patch_margin ::
                   (NinePatchRect :< cls, Object :< cls) => cls -> Int -> IO Int
get_patch_margin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_get_patch_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_get_region_rect #-}

-- | Rectangular region of the texture to sample from. If you're working with an atlas, use this property to define the area the 9-slice should use. All other properties are relative to this one. If the rect is empty, NinePatchRect will use the whole texture.
bindNinePatchRect_get_region_rect :: MethodBind
bindNinePatchRect_get_region_rect
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "get_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rectangular region of the texture to sample from. If you're working with an atlas, use this property to define the area the 9-slice should use. All other properties are relative to this one. If the rect is empty, NinePatchRect will use the whole texture.
get_region_rect ::
                  (NinePatchRect :< cls, Object :< cls) => cls -> IO Rect2
get_region_rect cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_get_region_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_get_texture #-}

-- | The node's texture resource.
bindNinePatchRect_get_texture :: MethodBind
bindNinePatchRect_get_texture
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's texture resource.
get_texture ::
              (NinePatchRect :< cls, Object :< cls) => cls -> IO Texture
get_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_get_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_get_v_axis_stretch_mode #-}

-- | Doesn't do anything at the time of writing.
bindNinePatchRect_get_v_axis_stretch_mode :: MethodBind
bindNinePatchRect_get_v_axis_stretch_mode
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "get_v_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Doesn't do anything at the time of writing.
get_v_axis_stretch_mode ::
                          (NinePatchRect :< cls, Object :< cls) => cls -> IO Int
get_v_axis_stretch_mode cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_get_v_axis_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_is_draw_center_enabled #-}

-- | If [code]true[/code], draw the panel's center. Else, only draw the 9-slice's borders.
bindNinePatchRect_is_draw_center_enabled :: MethodBind
bindNinePatchRect_is_draw_center_enabled
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "is_draw_center_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], draw the panel's center. Else, only draw the 9-slice's borders.
is_draw_center_enabled ::
                         (NinePatchRect :< cls, Object :< cls) => cls -> IO Bool
is_draw_center_enabled cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_is_draw_center_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_set_draw_center #-}

-- | If [code]true[/code], draw the panel's center. Else, only draw the 9-slice's borders.
bindNinePatchRect_set_draw_center :: MethodBind
bindNinePatchRect_set_draw_center
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_draw_center" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], draw the panel's center. Else, only draw the 9-slice's borders.
set_draw_center ::
                  (NinePatchRect :< cls, Object :< cls) => cls -> Bool -> IO ()
set_draw_center cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_set_draw_center
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_set_h_axis_stretch_mode #-}

-- | Doesn't do anything at the time of writing.
bindNinePatchRect_set_h_axis_stretch_mode :: MethodBind
bindNinePatchRect_set_h_axis_stretch_mode
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_h_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Doesn't do anything at the time of writing.
set_h_axis_stretch_mode ::
                          (NinePatchRect :< cls, Object :< cls) => cls -> Int -> IO ()
set_h_axis_stretch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_set_h_axis_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_set_patch_margin #-}

-- | Sets the size of the margin identified by the given [enum Margin] constant to [code]value[/code] in pixels.
bindNinePatchRect_set_patch_margin :: MethodBind
bindNinePatchRect_set_patch_margin
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_patch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the margin identified by the given [enum Margin] constant to [code]value[/code] in pixels.
set_patch_margin ::
                   (NinePatchRect :< cls, Object :< cls) => cls -> Int -> Int -> IO ()
set_patch_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_set_patch_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_set_region_rect #-}

-- | Rectangular region of the texture to sample from. If you're working with an atlas, use this property to define the area the 9-slice should use. All other properties are relative to this one. If the rect is empty, NinePatchRect will use the whole texture.
bindNinePatchRect_set_region_rect :: MethodBind
bindNinePatchRect_set_region_rect
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_region_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Rectangular region of the texture to sample from. If you're working with an atlas, use this property to define the area the 9-slice should use. All other properties are relative to this one. If the rect is empty, NinePatchRect will use the whole texture.
set_region_rect ::
                  (NinePatchRect :< cls, Object :< cls) => cls -> Rect2 -> IO ()
set_region_rect cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_set_region_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_set_texture #-}

-- | The node's texture resource.
bindNinePatchRect_set_texture :: MethodBind
bindNinePatchRect_set_texture
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The node's texture resource.
set_texture ::
              (NinePatchRect :< cls, Object :< cls) => cls -> Texture -> IO ()
set_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_set_texture (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindNinePatchRect_set_v_axis_stretch_mode #-}

-- | Doesn't do anything at the time of writing.
bindNinePatchRect_set_v_axis_stretch_mode :: MethodBind
bindNinePatchRect_set_v_axis_stretch_mode
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_v_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Doesn't do anything at the time of writing.
set_v_axis_stretch_mode ::
                          (NinePatchRect :< cls, Object :< cls) => cls -> Int -> IO ()
set_v_axis_stretch_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNinePatchRect_set_v_axis_stretch_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)