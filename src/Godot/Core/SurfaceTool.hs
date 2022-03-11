{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.SurfaceTool
       (Godot.Core.SurfaceTool.add_bones,
        Godot.Core.SurfaceTool.add_color, Godot.Core.SurfaceTool.add_index,
        Godot.Core.SurfaceTool.add_normal,
        Godot.Core.SurfaceTool.add_smooth_group,
        Godot.Core.SurfaceTool.add_tangent,
        Godot.Core.SurfaceTool.add_triangle_fan,
        Godot.Core.SurfaceTool.add_uv, Godot.Core.SurfaceTool.add_uv2,
        Godot.Core.SurfaceTool.add_vertex,
        Godot.Core.SurfaceTool.add_weights,
        Godot.Core.SurfaceTool.append_from, Godot.Core.SurfaceTool.begin,
        Godot.Core.SurfaceTool.clear, Godot.Core.SurfaceTool.commit,
        Godot.Core.SurfaceTool.commit_to_arrays,
        Godot.Core.SurfaceTool.create_from,
        Godot.Core.SurfaceTool.create_from_blend_shape,
        Godot.Core.SurfaceTool.deindex,
        Godot.Core.SurfaceTool.generate_normals,
        Godot.Core.SurfaceTool.generate_tangents,
        Godot.Core.SurfaceTool.index, Godot.Core.SurfaceTool.set_material)
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
import Godot.Core.Reference()

{-# NOINLINE bindSurfaceTool_add_bones #-}

-- | Specifies an array of bones to use for the @i@next@/i@ vertex. @bones@ must contain 4 integers.
bindSurfaceTool_add_bones :: MethodBind
bindSurfaceTool_add_bones
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_bones" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies an array of bones to use for the @i@next@/i@ vertex. @bones@ must contain 4 integers.
add_bones ::
            (SurfaceTool :< cls, Object :< cls) => cls -> PoolIntArray -> IO ()
add_bones cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_bones (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_bones" '[PoolIntArray] (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.add_bones

{-# NOINLINE bindSurfaceTool_add_color #-}

-- | Specifies a @Color@ to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
--   				__Note:__ The material must have @SpatialMaterial.vertex_color_use_as_albedo@ enabled for the vertex color to be visible.
bindSurfaceTool_add_color :: MethodBind
bindSurfaceTool_add_color
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a @Color@ to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
--   				__Note:__ The material must have @SpatialMaterial.vertex_color_use_as_albedo@ enabled for the vertex color to be visible.
add_color ::
            (SurfaceTool :< cls, Object :< cls) => cls -> Color -> IO ()
add_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_color (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_color" '[Color] (IO ()) where
        nodeMethod = Godot.Core.SurfaceTool.add_color

{-# NOINLINE bindSurfaceTool_add_index #-}

-- | Adds an index to index array if you are using indexed vertices. Does not need to be called before adding vertices.
bindSurfaceTool_add_index :: MethodBind
bindSurfaceTool_add_index
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds an index to index array if you are using indexed vertices. Does not need to be called before adding vertices.
add_index ::
            (SurfaceTool :< cls, Object :< cls) => cls -> Int -> IO ()
add_index cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_index (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_index" '[Int] (IO ()) where
        nodeMethod = Godot.Core.SurfaceTool.add_index

{-# NOINLINE bindSurfaceTool_add_normal #-}

-- | Specifies a normal to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
bindSurfaceTool_add_normal :: MethodBind
bindSurfaceTool_add_normal
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a normal to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
add_normal ::
             (SurfaceTool :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_normal cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_normal (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_normal" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.add_normal

{-# NOINLINE bindSurfaceTool_add_smooth_group #-}

-- | Specifies whether the current vertex (if using only vertex arrays) or current index (if also using index arrays) should use smooth normals for normal calculation.
bindSurfaceTool_add_smooth_group :: MethodBind
bindSurfaceTool_add_smooth_group
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_smooth_group" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies whether the current vertex (if using only vertex arrays) or current index (if also using index arrays) should use smooth normals for normal calculation.
add_smooth_group ::
                   (SurfaceTool :< cls, Object :< cls) => cls -> Bool -> IO ()
add_smooth_group cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_smooth_group
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_smooth_group" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.add_smooth_group

{-# NOINLINE bindSurfaceTool_add_tangent #-}

-- | Specifies a tangent to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
bindSurfaceTool_add_tangent :: MethodBind
bindSurfaceTool_add_tangent
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a tangent to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
add_tangent ::
              (SurfaceTool :< cls, Object :< cls) => cls -> Plane -> IO ()
add_tangent cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_tangent (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_tangent" '[Plane] (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.add_tangent

{-# NOINLINE bindSurfaceTool_add_triangle_fan #-}

-- | Inserts a triangle fan made of array data into @Mesh@ being constructed.
--   				Requires the primitive type be set to @Mesh.PRIMITIVE_TRIANGLES@.
bindSurfaceTool_add_triangle_fan :: MethodBind
bindSurfaceTool_add_triangle_fan
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_triangle_fan" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Inserts a triangle fan made of array data into @Mesh@ being constructed.
--   				Requires the primitive type be set to @Mesh.PRIMITIVE_TRIANGLES@.
add_triangle_fan ::
                   (SurfaceTool :< cls, Object :< cls) =>
                   cls ->
                     PoolVector3Array ->
                       Maybe PoolVector2Array ->
                         Maybe PoolColorArray ->
                           Maybe PoolVector2Array ->
                             Maybe PoolVector3Array -> Maybe Array -> IO ()
add_triangle_fan cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1,
       defaultedVariant VariantPoolVector2Array V.empty arg2,
       defaultedVariant VariantPoolColorArray V.empty arg3,
       defaultedVariant VariantPoolVector2Array V.empty arg4,
       defaultedVariant VariantPoolVector3Array V.empty arg5,
       defaultedVariant VariantArray V.empty arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_triangle_fan
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_triangle_fan"
           '[PoolVector3Array, Maybe PoolVector2Array, Maybe PoolColorArray,
             Maybe PoolVector2Array, Maybe PoolVector3Array, Maybe Array]
           (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.add_triangle_fan

{-# NOINLINE bindSurfaceTool_add_uv #-}

-- | Specifies a set of UV coordinates to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
bindSurfaceTool_add_uv :: MethodBind
bindSurfaceTool_add_uv
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies a set of UV coordinates to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
add_uv ::
         (SurfaceTool :< cls, Object :< cls) => cls -> Vector2 -> IO ()
add_uv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_uv (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_uv" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.SurfaceTool.add_uv

{-# NOINLINE bindSurfaceTool_add_uv2 #-}

-- | Specifies an optional second set of UV coordinates to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
bindSurfaceTool_add_uv2 :: MethodBind
bindSurfaceTool_add_uv2
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_uv2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies an optional second set of UV coordinates to use for the @i@next@/i@ vertex. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
add_uv2 ::
          (SurfaceTool :< cls, Object :< cls) => cls -> Vector2 -> IO ()
add_uv2 cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_uv2 (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_uv2" '[Vector2] (IO ()) where
        nodeMethod = Godot.Core.SurfaceTool.add_uv2

{-# NOINLINE bindSurfaceTool_add_vertex #-}

-- | Specifies the position of current vertex. Should be called after specifying other vertex properties (e.g. Color, UV).
bindSurfaceTool_add_vertex :: MethodBind
bindSurfaceTool_add_vertex
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies the position of current vertex. Should be called after specifying other vertex properties (e.g. Color, UV).
add_vertex ::
             (SurfaceTool :< cls, Object :< cls) => cls -> Vector3 -> IO ()
add_vertex cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_vertex (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_vertex" '[Vector3] (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.add_vertex

{-# NOINLINE bindSurfaceTool_add_weights #-}

-- | Specifies weight values to use for the @i@next@/i@ vertex. @weights@ must contain 4 values. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
bindSurfaceTool_add_weights :: MethodBind
bindSurfaceTool_add_weights
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "add_weights" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies weight values to use for the @i@next@/i@ vertex. @weights@ must contain 4 values. If every vertex needs to have this information set and you fail to submit it for the first vertex, this information may not be used at all.
add_weights ::
              (SurfaceTool :< cls, Object :< cls) =>
              cls -> PoolRealArray -> IO ()
add_weights cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_add_weights (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "add_weights" '[PoolRealArray]
           (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.add_weights

{-# NOINLINE bindSurfaceTool_append_from #-}

-- | Append vertices from a given @Mesh@ surface onto the current vertex array with specified @Transform@.
--   				__Note:__ Using @method append_from@ on a @Thread@ is much slower as the GPU must communicate data back to the CPU, while also causing the main thread to stall (as OpenGL is not thread-safe). Consider requesting a copy of the mesh, converting it to an @ArrayMesh@ and adding vertices manually instead.
bindSurfaceTool_append_from :: MethodBind
bindSurfaceTool_append_from
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "append_from" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Append vertices from a given @Mesh@ surface onto the current vertex array with specified @Transform@.
--   				__Note:__ Using @method append_from@ on a @Thread@ is much slower as the GPU must communicate data back to the CPU, while also causing the main thread to stall (as OpenGL is not thread-safe). Consider requesting a copy of the mesh, converting it to an @ArrayMesh@ and adding vertices manually instead.
append_from ::
              (SurfaceTool :< cls, Object :< cls) =>
              cls -> Mesh -> Int -> Transform -> IO ()
append_from cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_append_from (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "append_from"
           '[Mesh, Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.append_from

{-# NOINLINE bindSurfaceTool_begin #-}

-- | Called before adding any vertices. Takes the primitive type as an argument (e.g. @Mesh.PRIMITIVE_TRIANGLES@).
bindSurfaceTool_begin :: MethodBind
bindSurfaceTool_begin
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Called before adding any vertices. Takes the primitive type as an argument (e.g. @Mesh.PRIMITIVE_TRIANGLES@).
begin :: (SurfaceTool :< cls, Object :< cls) => cls -> Int -> IO ()
begin cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_begin (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "begin" '[Int] (IO ()) where
        nodeMethod = Godot.Core.SurfaceTool.begin

{-# NOINLINE bindSurfaceTool_clear #-}

-- | Clear all information passed into the surface tool so far.
bindSurfaceTool_clear :: MethodBind
bindSurfaceTool_clear
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clear all information passed into the surface tool so far.
clear :: (SurfaceTool :< cls, Object :< cls) => cls -> IO ()
clear cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_clear (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "clear" '[] (IO ()) where
        nodeMethod = Godot.Core.SurfaceTool.clear

{-# NOINLINE bindSurfaceTool_commit #-}

-- | Returns a constructed @ArrayMesh@ from current information passed in. If an existing @ArrayMesh@ is passed in as an argument, will add an extra surface to the existing @ArrayMesh@.
--   				Default flag is @Mesh.ARRAY_COMPRESS_DEFAULT@ if compression is enabled. If compression is disabled the default flag is @Mesh.ARRAY_FLAG_USE_OCTAHEDRAL_COMPRESSION@. See @ARRAY_COMPRESS_*@ constants in @enum Mesh.ArrayFormat@ for other flags.
bindSurfaceTool_commit :: MethodBind
bindSurfaceTool_commit
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "commit" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a constructed @ArrayMesh@ from current information passed in. If an existing @ArrayMesh@ is passed in as an argument, will add an extra surface to the existing @ArrayMesh@.
--   				Default flag is @Mesh.ARRAY_COMPRESS_DEFAULT@ if compression is enabled. If compression is disabled the default flag is @Mesh.ARRAY_FLAG_USE_OCTAHEDRAL_COMPRESSION@. See @ARRAY_COMPRESS_*@ constants in @enum Mesh.ArrayFormat@ for other flags.
commit ::
         (SurfaceTool :< cls, Object :< cls) =>
         cls -> Maybe ArrayMesh -> Maybe Int -> IO ArrayMesh
commit cls arg1 arg2
  = withVariantArray
      [maybe VariantNil toVariant arg1,
       maybe (VariantInt (97280)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_commit (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "commit"
           '[Maybe ArrayMesh, Maybe Int]
           (IO ArrayMesh)
         where
        nodeMethod = Godot.Core.SurfaceTool.commit

{-# NOINLINE bindSurfaceTool_commit_to_arrays #-}

-- | Commits the data to the same format used by @method ArrayMesh.add_surface_from_arrays@. This way you can further process the mesh data using the @ArrayMesh@ API.
bindSurfaceTool_commit_to_arrays :: MethodBind
bindSurfaceTool_commit_to_arrays
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "commit_to_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Commits the data to the same format used by @method ArrayMesh.add_surface_from_arrays@. This way you can further process the mesh data using the @ArrayMesh@ API.
commit_to_arrays ::
                   (SurfaceTool :< cls, Object :< cls) => cls -> IO Array
commit_to_arrays cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_commit_to_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "commit_to_arrays" '[] (IO Array)
         where
        nodeMethod = Godot.Core.SurfaceTool.commit_to_arrays

{-# NOINLINE bindSurfaceTool_create_from #-}

-- | Creates a vertex array from an existing @Mesh@.
bindSurfaceTool_create_from :: MethodBind
bindSurfaceTool_create_from
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "create_from" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a vertex array from an existing @Mesh@.
create_from ::
              (SurfaceTool :< cls, Object :< cls) => cls -> Mesh -> Int -> IO ()
create_from cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_create_from (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "create_from" '[Mesh, Int] (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.create_from

{-# NOINLINE bindSurfaceTool_create_from_blend_shape #-}

-- | Creates a vertex array from the specified blend shape of an existing @Mesh@. This can be used to extract a specific pose from a blend shape.
bindSurfaceTool_create_from_blend_shape :: MethodBind
bindSurfaceTool_create_from_blend_shape
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "create_from_blend_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a vertex array from the specified blend shape of an existing @Mesh@. This can be used to extract a specific pose from a blend shape.
create_from_blend_shape ::
                          (SurfaceTool :< cls, Object :< cls) =>
                          cls -> Mesh -> Int -> GodotString -> IO ()
create_from_blend_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_create_from_blend_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "create_from_blend_shape"
           '[Mesh, Int, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.create_from_blend_shape

{-# NOINLINE bindSurfaceTool_deindex #-}

-- | Removes the index array by expanding the vertex array.
bindSurfaceTool_deindex :: MethodBind
bindSurfaceTool_deindex
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "deindex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes the index array by expanding the vertex array.
deindex :: (SurfaceTool :< cls, Object :< cls) => cls -> IO ()
deindex cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_deindex (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "deindex" '[] (IO ()) where
        nodeMethod = Godot.Core.SurfaceTool.deindex

{-# NOINLINE bindSurfaceTool_generate_normals #-}

-- | Generates normals from vertices so you do not have to do it manually. If @flip@ is @true@, the resulting normals will be inverted. @method generate_normals@ should be called @i@after@/i@ generating geometry and @i@before@/i@ committing the mesh using @method commit@ or @method commit_to_arrays@. For correct display of normal-mapped surfaces, you will also have to generate tangents using @method generate_tangents@.
--   				__Note:__ @method generate_normals@ only works if the primitive type to be set to @Mesh.PRIMITIVE_TRIANGLES@.
bindSurfaceTool_generate_normals :: MethodBind
bindSurfaceTool_generate_normals
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "generate_normals" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates normals from vertices so you do not have to do it manually. If @flip@ is @true@, the resulting normals will be inverted. @method generate_normals@ should be called @i@after@/i@ generating geometry and @i@before@/i@ committing the mesh using @method commit@ or @method commit_to_arrays@. For correct display of normal-mapped surfaces, you will also have to generate tangents using @method generate_tangents@.
--   				__Note:__ @method generate_normals@ only works if the primitive type to be set to @Mesh.PRIMITIVE_TRIANGLES@.
generate_normals ::
                   (SurfaceTool :< cls, Object :< cls) => cls -> Maybe Bool -> IO ()
generate_normals cls arg1
  = withVariantArray [maybe (VariantBool False) toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_generate_normals
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "generate_normals" '[Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.generate_normals

{-# NOINLINE bindSurfaceTool_generate_tangents #-}

-- | Generates a tangent vector for each vertex. Requires that each vertex have UVs and normals set already (see @method generate_normals@).
bindSurfaceTool_generate_tangents :: MethodBind
bindSurfaceTool_generate_tangents
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "generate_tangents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Generates a tangent vector for each vertex. Requires that each vertex have UVs and normals set already (see @method generate_normals@).
generate_tangents ::
                    (SurfaceTool :< cls, Object :< cls) => cls -> IO ()
generate_tangents cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_generate_tangents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "generate_tangents" '[] (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.generate_tangents

{-# NOINLINE bindSurfaceTool_index #-}

-- | Shrinks the vertex array by creating an index array. This can improve performance by avoiding vertex reuse.
bindSurfaceTool_index :: MethodBind
bindSurfaceTool_index
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Shrinks the vertex array by creating an index array. This can improve performance by avoiding vertex reuse.
index :: (SurfaceTool :< cls, Object :< cls) => cls -> IO ()
index cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_index (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "index" '[] (IO ()) where
        nodeMethod = Godot.Core.SurfaceTool.index

{-# NOINLINE bindSurfaceTool_set_material #-}

-- | Sets @Material@ to be used by the @Mesh@ you are constructing.
bindSurfaceTool_set_material :: MethodBind
bindSurfaceTool_set_material
  = unsafePerformIO $
      withCString "SurfaceTool" $
        \ clsNamePtr ->
          withCString "set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets @Material@ to be used by the @Mesh@ you are constructing.
set_material ::
               (SurfaceTool :< cls, Object :< cls) => cls -> Material -> IO ()
set_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindSurfaceTool_set_material (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod SurfaceTool "set_material" '[Material] (IO ())
         where
        nodeMethod = Godot.Core.SurfaceTool.set_material