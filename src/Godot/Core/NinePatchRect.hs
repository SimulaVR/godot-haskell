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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Control()

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

instance NodeProperty NinePatchRect "axis_stretch_horizontal" Int
           'False
         where
        nodeProperty
          = (get_h_axis_stretch_mode,
             wrapDroppingSetter set_h_axis_stretch_mode, Nothing)

instance NodeProperty NinePatchRect "axis_stretch_vertical" Int
           'False
         where
        nodeProperty
          = (get_v_axis_stretch_mode,
             wrapDroppingSetter set_v_axis_stretch_mode, Nothing)

instance NodeProperty NinePatchRect "draw_center" Bool 'False where
        nodeProperty
          = (is_draw_center_enabled, wrapDroppingSetter set_draw_center,
             Nothing)

instance NodeProperty NinePatchRect "patch_margin_bottom" Int
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_patch_margin,
             wrapIndexedSetter 3 set_patch_margin, Nothing)

instance NodeProperty NinePatchRect "patch_margin_left" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_patch_margin,
             wrapIndexedSetter 0 set_patch_margin, Nothing)

instance NodeProperty NinePatchRect "patch_margin_right" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_patch_margin,
             wrapIndexedSetter 2 set_patch_margin, Nothing)

instance NodeProperty NinePatchRect "patch_margin_top" Int 'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_patch_margin,
             wrapIndexedSetter 1 set_patch_margin, Nothing)

instance NodeProperty NinePatchRect "region_rect" Rect2 'False
         where
        nodeProperty
          = (get_region_rect, wrapDroppingSetter set_region_rect, Nothing)

instance NodeProperty NinePatchRect "texture" Texture 'False where
        nodeProperty
          = (get_texture, wrapDroppingSetter set_texture, Nothing)

{-# NOINLINE bindNinePatchRect_get_h_axis_stretch_mode #-}

-- | The stretch mode to use for horizontal stretching/tiling. See @enum NinePatchRect.AxisStretchMode@ for possible values.
bindNinePatchRect_get_h_axis_stretch_mode :: MethodBind
bindNinePatchRect_get_h_axis_stretch_mode
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "get_h_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The stretch mode to use for horizontal stretching/tiling. See @enum NinePatchRect.AxisStretchMode@ for possible values.
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

instance NodeMethod NinePatchRect "get_h_axis_stretch_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NinePatchRect.get_h_axis_stretch_mode

{-# NOINLINE bindNinePatchRect_get_patch_margin #-}

-- | Returns the size of the margin identified by the given @enum Margin@ constant.
bindNinePatchRect_get_patch_margin :: MethodBind
bindNinePatchRect_get_patch_margin
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "get_patch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size of the margin identified by the given @enum Margin@ constant.
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

instance NodeMethod NinePatchRect "get_patch_margin" '[Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.NinePatchRect.get_patch_margin

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

instance NodeMethod NinePatchRect "get_region_rect" '[] (IO Rect2)
         where
        nodeMethod = Godot.Core.NinePatchRect.get_region_rect

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

instance NodeMethod NinePatchRect "get_texture" '[] (IO Texture)
         where
        nodeMethod = Godot.Core.NinePatchRect.get_texture

{-# NOINLINE bindNinePatchRect_get_v_axis_stretch_mode #-}

-- | The stretch mode to use for vertical stretching/tiling. See @enum NinePatchRect.AxisStretchMode@ for possible values.
bindNinePatchRect_get_v_axis_stretch_mode :: MethodBind
bindNinePatchRect_get_v_axis_stretch_mode
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "get_v_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The stretch mode to use for vertical stretching/tiling. See @enum NinePatchRect.AxisStretchMode@ for possible values.
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

instance NodeMethod NinePatchRect "get_v_axis_stretch_mode" '[]
           (IO Int)
         where
        nodeMethod = Godot.Core.NinePatchRect.get_v_axis_stretch_mode

{-# NOINLINE bindNinePatchRect_is_draw_center_enabled #-}

-- | If @true@, draw the panel's center. Else, only draw the 9-slice's borders.
bindNinePatchRect_is_draw_center_enabled :: MethodBind
bindNinePatchRect_is_draw_center_enabled
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "is_draw_center_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, draw the panel's center. Else, only draw the 9-slice's borders.
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

instance NodeMethod NinePatchRect "is_draw_center_enabled" '[]
           (IO Bool)
         where
        nodeMethod = Godot.Core.NinePatchRect.is_draw_center_enabled

{-# NOINLINE bindNinePatchRect_set_draw_center #-}

-- | If @true@, draw the panel's center. Else, only draw the 9-slice's borders.
bindNinePatchRect_set_draw_center :: MethodBind
bindNinePatchRect_set_draw_center
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_draw_center" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, draw the panel's center. Else, only draw the 9-slice's borders.
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

instance NodeMethod NinePatchRect "set_draw_center" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.NinePatchRect.set_draw_center

{-# NOINLINE bindNinePatchRect_set_h_axis_stretch_mode #-}

-- | The stretch mode to use for horizontal stretching/tiling. See @enum NinePatchRect.AxisStretchMode@ for possible values.
bindNinePatchRect_set_h_axis_stretch_mode :: MethodBind
bindNinePatchRect_set_h_axis_stretch_mode
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_h_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The stretch mode to use for horizontal stretching/tiling. See @enum NinePatchRect.AxisStretchMode@ for possible values.
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

instance NodeMethod NinePatchRect "set_h_axis_stretch_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NinePatchRect.set_h_axis_stretch_mode

{-# NOINLINE bindNinePatchRect_set_patch_margin #-}

-- | Sets the size of the margin identified by the given @enum Margin@ constant to @value@ in pixels.
bindNinePatchRect_set_patch_margin :: MethodBind
bindNinePatchRect_set_patch_margin
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_patch_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the margin identified by the given @enum Margin@ constant to @value@ in pixels.
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

instance NodeMethod NinePatchRect "set_patch_margin" '[Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NinePatchRect.set_patch_margin

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

instance NodeMethod NinePatchRect "set_region_rect" '[Rect2]
           (IO ())
         where
        nodeMethod = Godot.Core.NinePatchRect.set_region_rect

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

instance NodeMethod NinePatchRect "set_texture" '[Texture] (IO ())
         where
        nodeMethod = Godot.Core.NinePatchRect.set_texture

{-# NOINLINE bindNinePatchRect_set_v_axis_stretch_mode #-}

-- | The stretch mode to use for vertical stretching/tiling. See @enum NinePatchRect.AxisStretchMode@ for possible values.
bindNinePatchRect_set_v_axis_stretch_mode :: MethodBind
bindNinePatchRect_set_v_axis_stretch_mode
  = unsafePerformIO $
      withCString "NinePatchRect" $
        \ clsNamePtr ->
          withCString "set_v_axis_stretch_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The stretch mode to use for vertical stretching/tiling. See @enum NinePatchRect.AxisStretchMode@ for possible values.
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

instance NodeMethod NinePatchRect "set_v_axis_stretch_mode" '[Int]
           (IO ())
         where
        nodeMethod = Godot.Core.NinePatchRect.set_v_axis_stretch_mode