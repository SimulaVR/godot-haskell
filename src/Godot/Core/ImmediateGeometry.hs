{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.ImmediateGeometry
       (Godot.Core.ImmediateGeometry.add_sphere,
        Godot.Core.ImmediateGeometry.add_vertex,
        Godot.Core.ImmediateGeometry.begin,
        Godot.Core.ImmediateGeometry.clear,
        Godot.Core.ImmediateGeometry.end,
        Godot.Core.ImmediateGeometry.set_color,
        Godot.Core.ImmediateGeometry.set_normal,
        Godot.Core.ImmediateGeometry.set_tangent,
        Godot.Core.ImmediateGeometry.set_uv,
        Godot.Core.ImmediateGeometry.set_uv2)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

{-# NOINLINE bindImmediateGeometry_add_sphere #-}

-- | Simple helper to draw an UV sphere with given latitude, longitude and radius.
bindImmediateGeometry_add_sphere :: MethodBind
bindImmediateGeometry_add_sphere
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "add_sphere" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Simple helper to draw an UV sphere with given latitude, longitude and radius.
add_sphere ::
             (ImmediateGeometry :< cls, Object :< cls) =>
             cls -> Int -> Int -> Float -> Bool -> IO ()
add_sphere cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_add_sphere
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_add_vertex #-}

-- | Adds a vertex in local coordinate space with the currently set color/uv/etc.
bindImmediateGeometry_add_vertex :: MethodBind
bindImmediateGeometry_add_vertex
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "add_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a vertex in local coordinate space with the currently set color/uv/etc.
add_vertex ::
             (ImmediateGeometry :< cls, Object :< cls) =>
             cls -> Vector3 -> IO ()
add_vertex cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_add_vertex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_begin #-}

-- | Begin drawing (and optionally pass a texture override). When done call [method end]. For more information on how this works, search for [code]glBegin()[/code] and [code]glEnd()[/code] references.
--   				For the type of primitive, see the [enum Mesh.PrimitiveType] enum.
bindImmediateGeometry_begin :: MethodBind
bindImmediateGeometry_begin
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Begin drawing (and optionally pass a texture override). When done call [method end]. For more information on how this works, search for [code]glBegin()[/code] and [code]glEnd()[/code] references.
--   				For the type of primitive, see the [enum Mesh.PrimitiveType] enum.
begin ::
        (ImmediateGeometry :< cls, Object :< cls) =>
        cls -> Int -> Texture -> IO ()
begin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_begin (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_clear #-}

-- | Clears everything that was drawn using begin/end.
bindImmediateGeometry_clear :: MethodBind
bindImmediateGeometry_clear
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears everything that was drawn using begin/end.
clear :: (ImmediateGeometry :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_end #-}

-- | Ends a drawing context and displays the results.
bindImmediateGeometry_end :: MethodBind
bindImmediateGeometry_end
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ends a drawing context and displays the results.
end :: (ImmediateGeometry :< cls, Object :< cls) => cls -> IO ()
end cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_end (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_set_color #-}

-- | The current drawing color.
bindImmediateGeometry_set_color :: MethodBind
bindImmediateGeometry_set_color
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The current drawing color.
set_color ::
            (ImmediateGeometry :< cls, Object :< cls) => cls -> Color -> IO ()
set_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_set_normal #-}

-- | The next vertex's normal.
bindImmediateGeometry_set_normal :: MethodBind
bindImmediateGeometry_set_normal
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The next vertex's normal.
set_normal ::
             (ImmediateGeometry :< cls, Object :< cls) =>
             cls -> Vector3 -> IO ()
set_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_set_tangent #-}

-- | The next vertex's tangent (and binormal facing).
bindImmediateGeometry_set_tangent :: MethodBind
bindImmediateGeometry_set_tangent
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The next vertex's tangent (and binormal facing).
set_tangent ::
              (ImmediateGeometry :< cls, Object :< cls) => cls -> Plane -> IO ()
set_tangent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_set_uv #-}

-- | The next vertex's UV.
bindImmediateGeometry_set_uv :: MethodBind
bindImmediateGeometry_set_uv
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The next vertex's UV.
set_uv ::
         (ImmediateGeometry :< cls, Object :< cls) =>
         cls -> Vector2 -> IO ()
set_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_uv (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindImmediateGeometry_set_uv2 #-}

-- | The next vertex's second layer UV.
bindImmediateGeometry_set_uv2 :: MethodBind
bindImmediateGeometry_set_uv2
  = unsafePerformIO $
      withCString "ImmediateGeometry" $
        \ clsNamePtr ->
          withCString "set_uv2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The next vertex's second layer UV.
set_uv2 ::
          (ImmediateGeometry :< cls, Object :< cls) =>
          cls -> Vector2 -> IO ()
set_uv2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindImmediateGeometry_set_uv2 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)