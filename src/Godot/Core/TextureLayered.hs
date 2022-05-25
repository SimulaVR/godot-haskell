{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.TextureLayered
       (Godot.Core.TextureLayered._FLAGS_DEFAULT,
        Godot.Core.TextureLayered._FLAG_FILTER,
        Godot.Core.TextureLayered._FLAG_REPEAT,
        Godot.Core.TextureLayered._FLAG_MIPMAPS,
        Godot.Core.TextureLayered._get_data,
        Godot.Core.TextureLayered._set_data,
        Godot.Core.TextureLayered.create,
        Godot.Core.TextureLayered.get_depth,
        Godot.Core.TextureLayered.get_flags,
        Godot.Core.TextureLayered.get_format,
        Godot.Core.TextureLayered.get_height,
        Godot.Core.TextureLayered.get_layer_data,
        Godot.Core.TextureLayered.get_width,
        Godot.Core.TextureLayered.set_data_partial,
        Godot.Core.TextureLayered.set_flags,
        Godot.Core.TextureLayered.set_layer_data)
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
import Godot.Core.Resource()

_FLAGS_DEFAULT :: Int
_FLAGS_DEFAULT = 4

_FLAG_FILTER :: Int
_FLAG_FILTER = 4

_FLAG_REPEAT :: Int
_FLAG_REPEAT = 2

_FLAG_MIPMAPS :: Int
_FLAG_MIPMAPS = 1

instance NodeProperty TextureLayered "data" Dictionary 'False where
        nodeProperty = (_get_data, wrapDroppingSetter _set_data, Nothing)

instance NodeProperty TextureLayered "flags" Int 'False where
        nodeProperty = (get_flags, wrapDroppingSetter set_flags, Nothing)

{-# NOINLINE bindTextureLayered__get_data #-}

-- | Returns a dictionary with all the data used by this texture.
bindTextureLayered__get_data :: MethodBind
bindTextureLayered__get_data
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a dictionary with all the data used by this texture.
_get_data ::
            (TextureLayered :< cls, Object :< cls) => cls -> IO Dictionary
_get_data cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered__get_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "_get_data" '[] (IO Dictionary)
         where
        nodeMethod = Godot.Core.TextureLayered._get_data

{-# NOINLINE bindTextureLayered__set_data #-}

-- | Returns a dictionary with all the data used by this texture.
bindTextureLayered__set_data :: MethodBind
bindTextureLayered__set_data
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a dictionary with all the data used by this texture.
_set_data ::
            (TextureLayered :< cls, Object :< cls) =>
            cls -> Dictionary -> IO ()
_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered__set_data (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "_set_data" '[Dictionary]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureLayered._set_data

{-# NOINLINE bindTextureLayered_create #-}

-- | Creates the @Texture3D@ or @TextureArray@ with specified @width@, @height@, and @depth@. See @enum Image.Format@ for @format@ options. See @enum Flags@ enumerator for @flags@ options.
bindTextureLayered_create :: MethodBind
bindTextureLayered_create
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates the @Texture3D@ or @TextureArray@ with specified @width@, @height@, and @depth@. See @enum Image.Format@ for @format@ options. See @enum Flags@ enumerator for @flags@ options.
create ::
         (TextureLayered :< cls, Object :< cls) =>
         cls -> Int -> Int -> Int -> Int -> Maybe Int -> IO ()
create cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (4)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "create"
           '[Int, Int, Int, Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureLayered.create

{-# NOINLINE bindTextureLayered_get_depth #-}

-- | Returns the depth of the texture. Depth is the 3rd dimension (typically Z-axis).
bindTextureLayered_get_depth :: MethodBind
bindTextureLayered_get_depth
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the depth of the texture. Depth is the 3rd dimension (typically Z-axis).
get_depth ::
            (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_depth cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_depth (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "get_depth" '[] (IO Int) where
        nodeMethod = Godot.Core.TextureLayered.get_depth

{-# NOINLINE bindTextureLayered_get_flags #-}

-- | Specifies which @enum Flags@ apply to this texture.
bindTextureLayered_get_flags :: MethodBind
bindTextureLayered_get_flags
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies which @enum Flags@ apply to this texture.
get_flags ::
            (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_flags cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "get_flags" '[] (IO Int) where
        nodeMethod = Godot.Core.TextureLayered.get_flags

{-# NOINLINE bindTextureLayered_get_format #-}

-- | Returns the current format being used by this texture. See @enum Image.Format@ for details.
bindTextureLayered_get_format :: MethodBind
bindTextureLayered_get_format
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the current format being used by this texture. See @enum Image.Format@ for details.
get_format ::
             (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_format cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_format (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "get_format" '[] (IO Int) where
        nodeMethod = Godot.Core.TextureLayered.get_format

{-# NOINLINE bindTextureLayered_get_height #-}

-- | Returns the height of the texture. Height is typically represented by the Y-axis.
bindTextureLayered_get_height :: MethodBind
bindTextureLayered_get_height
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the height of the texture. Height is typically represented by the Y-axis.
get_height ::
             (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "get_height" '[] (IO Int) where
        nodeMethod = Godot.Core.TextureLayered.get_height

{-# NOINLINE bindTextureLayered_get_layer_data #-}

-- | Returns an @Image@ resource with the data from specified @layer@.
bindTextureLayered_get_layer_data :: MethodBind
bindTextureLayered_get_layer_data
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_layer_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an @Image@ resource with the data from specified @layer@.
get_layer_data ::
                 (TextureLayered :< cls, Object :< cls) => cls -> Int -> IO Image
get_layer_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_layer_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "get_layer_data" '[Int]
           (IO Image)
         where
        nodeMethod = Godot.Core.TextureLayered.get_layer_data

{-# NOINLINE bindTextureLayered_get_width #-}

-- | Returns the width of the texture. Width is typically represented by the X-axis.
bindTextureLayered_get_width :: MethodBind
bindTextureLayered_get_width
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the width of the texture. Width is typically represented by the X-axis.
get_width ::
            (TextureLayered :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_get_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "get_width" '[] (IO Int) where
        nodeMethod = Godot.Core.TextureLayered.get_width

{-# NOINLINE bindTextureLayered_set_data_partial #-}

-- | Partially sets the data for a specified @layer@ by overwriting using the data of the specified @image@. @x_offset@ and @y_offset@ determine where the @Image@ is "stamped" over the texture. The @image@ must fit within the texture.
bindTextureLayered_set_data_partial :: MethodBind
bindTextureLayered_set_data_partial
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "set_data_partial" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Partially sets the data for a specified @layer@ by overwriting using the data of the specified @image@. @x_offset@ and @y_offset@ determine where the @Image@ is "stamped" over the texture. The @image@ must fit within the texture.
set_data_partial ::
                   (TextureLayered :< cls, Object :< cls) =>
                   cls -> Image -> Int -> Int -> Int -> Maybe Int -> IO ()
set_data_partial cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (0)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_set_data_partial
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "set_data_partial"
           '[Image, Int, Int, Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureLayered.set_data_partial

{-# NOINLINE bindTextureLayered_set_flags #-}

-- | Specifies which @enum Flags@ apply to this texture.
bindTextureLayered_set_flags :: MethodBind
bindTextureLayered_set_flags
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "set_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Specifies which @enum Flags@ apply to this texture.
set_flags ::
            (TextureLayered :< cls, Object :< cls) => cls -> Int -> IO ()
set_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_set_flags (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "set_flags" '[Int] (IO ()) where
        nodeMethod = Godot.Core.TextureLayered.set_flags

{-# NOINLINE bindTextureLayered_set_layer_data #-}

-- | Sets the data for the specified layer. Data takes the form of a 2-dimensional @Image@ resource.
bindTextureLayered_set_layer_data :: MethodBind
bindTextureLayered_set_layer_data
  = unsafePerformIO $
      withCString "TextureLayered" $
        \ clsNamePtr ->
          withCString "set_layer_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the data for the specified layer. Data takes the form of a 2-dimensional @Image@ resource.
set_layer_data ::
                 (TextureLayered :< cls, Object :< cls) =>
                 cls -> Image -> Int -> IO ()
set_layer_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindTextureLayered_set_layer_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod TextureLayered "set_layer_data" '[Image, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.TextureLayered.set_layer_data