{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.NoiseTexture
       (Godot.Core.NoiseTexture.get_height,
        Godot.Core.NoiseTexture.get_width,
        Godot.Core.NoiseTexture._generate_texture,
        Godot.Core.NoiseTexture._queue_update,
        Godot.Core.NoiseTexture._thread_done,
        Godot.Core.NoiseTexture._update_texture,
        Godot.Core.NoiseTexture.get_bump_strength,
        Godot.Core.NoiseTexture.get_noise,
        Godot.Core.NoiseTexture.get_seamless,
        Godot.Core.NoiseTexture.is_normalmap,
        Godot.Core.NoiseTexture.set_as_normalmap,
        Godot.Core.NoiseTexture.set_bump_strength,
        Godot.Core.NoiseTexture.set_height,
        Godot.Core.NoiseTexture.set_noise,
        Godot.Core.NoiseTexture.set_seamless,
        Godot.Core.NoiseTexture.set_width)
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
import Godot.Core.Texture()

instance NodeProperty NoiseTexture "as_normalmap" Bool 'False where
        nodeProperty
          = (is_normalmap, wrapDroppingSetter set_as_normalmap, Nothing)

instance NodeProperty NoiseTexture "bump_strength" Float 'False
         where
        nodeProperty
          = (get_bump_strength, wrapDroppingSetter set_bump_strength,
             Nothing)

{-# NOINLINE bindNoiseTexture_get_height #-}

bindNoiseTexture_get_height :: MethodBind
bindNoiseTexture_get_height
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_height :: (NoiseTexture :< cls, Object :< cls) => cls -> IO Int
get_height cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_get_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "get_height" '[] (IO Int) where
        nodeMethod = Godot.Core.NoiseTexture.get_height

instance NodeProperty NoiseTexture "height" Int 'False where
        nodeProperty = (get_height, wrapDroppingSetter set_height, Nothing)

instance NodeProperty NoiseTexture "noise" OpenSimplexNoise 'False
         where
        nodeProperty = (get_noise, wrapDroppingSetter set_noise, Nothing)

instance NodeProperty NoiseTexture "seamless" Bool 'False where
        nodeProperty
          = (get_seamless, wrapDroppingSetter set_seamless, Nothing)

{-# NOINLINE bindNoiseTexture_get_width #-}

bindNoiseTexture_get_width :: MethodBind
bindNoiseTexture_get_width
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_width :: (NoiseTexture :< cls, Object :< cls) => cls -> IO Int
get_width cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_get_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "get_width" '[] (IO Int) where
        nodeMethod = Godot.Core.NoiseTexture.get_width

instance NodeProperty NoiseTexture "width" Int 'False where
        nodeProperty = (get_width, wrapDroppingSetter set_width, Nothing)

{-# NOINLINE bindNoiseTexture__generate_texture #-}

bindNoiseTexture__generate_texture :: MethodBind
bindNoiseTexture__generate_texture
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "_generate_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_generate_texture ::
                    (NoiseTexture :< cls, Object :< cls) => cls -> IO Image
_generate_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture__generate_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "_generate_texture" '[] (IO Image)
         where
        nodeMethod = Godot.Core.NoiseTexture._generate_texture

{-# NOINLINE bindNoiseTexture__queue_update #-}

bindNoiseTexture__queue_update :: MethodBind
bindNoiseTexture__queue_update
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "_queue_update" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_queue_update ::
                (NoiseTexture :< cls, Object :< cls) => cls -> IO ()
_queue_update cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture__queue_update (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "_queue_update" '[] (IO ()) where
        nodeMethod = Godot.Core.NoiseTexture._queue_update

{-# NOINLINE bindNoiseTexture__thread_done #-}

bindNoiseTexture__thread_done :: MethodBind
bindNoiseTexture__thread_done
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "_thread_done" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_thread_done ::
               (NoiseTexture :< cls, Object :< cls) => cls -> Image -> IO ()
_thread_done cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture__thread_done (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "_thread_done" '[Image] (IO ())
         where
        nodeMethod = Godot.Core.NoiseTexture._thread_done

{-# NOINLINE bindNoiseTexture__update_texture #-}

bindNoiseTexture__update_texture :: MethodBind
bindNoiseTexture__update_texture
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "_update_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_texture ::
                  (NoiseTexture :< cls, Object :< cls) => cls -> IO ()
_update_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture__update_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "_update_texture" '[] (IO ())
         where
        nodeMethod = Godot.Core.NoiseTexture._update_texture

{-# NOINLINE bindNoiseTexture_get_bump_strength #-}

bindNoiseTexture_get_bump_strength :: MethodBind
bindNoiseTexture_get_bump_strength
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "get_bump_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_bump_strength ::
                    (NoiseTexture :< cls, Object :< cls) => cls -> IO Float
get_bump_strength cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_get_bump_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "get_bump_strength" '[] (IO Float)
         where
        nodeMethod = Godot.Core.NoiseTexture.get_bump_strength

{-# NOINLINE bindNoiseTexture_get_noise #-}

bindNoiseTexture_get_noise :: MethodBind
bindNoiseTexture_get_noise
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "get_noise" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_noise ::
            (NoiseTexture :< cls, Object :< cls) => cls -> IO OpenSimplexNoise
get_noise cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_get_noise (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "get_noise" '[]
           (IO OpenSimplexNoise)
         where
        nodeMethod = Godot.Core.NoiseTexture.get_noise

{-# NOINLINE bindNoiseTexture_get_seamless #-}

bindNoiseTexture_get_seamless :: MethodBind
bindNoiseTexture_get_seamless
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "get_seamless" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_seamless ::
               (NoiseTexture :< cls, Object :< cls) => cls -> IO Bool
get_seamless cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_get_seamless (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "get_seamless" '[] (IO Bool) where
        nodeMethod = Godot.Core.NoiseTexture.get_seamless

{-# NOINLINE bindNoiseTexture_is_normalmap #-}

bindNoiseTexture_is_normalmap :: MethodBind
bindNoiseTexture_is_normalmap
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "is_normalmap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

is_normalmap ::
               (NoiseTexture :< cls, Object :< cls) => cls -> IO Bool
is_normalmap cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_is_normalmap (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "is_normalmap" '[] (IO Bool) where
        nodeMethod = Godot.Core.NoiseTexture.is_normalmap

{-# NOINLINE bindNoiseTexture_set_as_normalmap #-}

bindNoiseTexture_set_as_normalmap :: MethodBind
bindNoiseTexture_set_as_normalmap
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "set_as_normalmap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_as_normalmap ::
                   (NoiseTexture :< cls, Object :< cls) => cls -> Bool -> IO ()
set_as_normalmap cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_set_as_normalmap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "set_as_normalmap" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.NoiseTexture.set_as_normalmap

{-# NOINLINE bindNoiseTexture_set_bump_strength #-}

bindNoiseTexture_set_bump_strength :: MethodBind
bindNoiseTexture_set_bump_strength
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "set_bump_strength" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_bump_strength ::
                    (NoiseTexture :< cls, Object :< cls) => cls -> Float -> IO ()
set_bump_strength cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_set_bump_strength
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "set_bump_strength" '[Float]
           (IO ())
         where
        nodeMethod = Godot.Core.NoiseTexture.set_bump_strength

{-# NOINLINE bindNoiseTexture_set_height #-}

bindNoiseTexture_set_height :: MethodBind
bindNoiseTexture_set_height
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_height ::
             (NoiseTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_set_height (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "set_height" '[Int] (IO ()) where
        nodeMethod = Godot.Core.NoiseTexture.set_height

{-# NOINLINE bindNoiseTexture_set_noise #-}

bindNoiseTexture_set_noise :: MethodBind
bindNoiseTexture_set_noise
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "set_noise" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_noise ::
            (NoiseTexture :< cls, Object :< cls) =>
            cls -> OpenSimplexNoise -> IO ()
set_noise cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_set_noise (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "set_noise" '[OpenSimplexNoise]
           (IO ())
         where
        nodeMethod = Godot.Core.NoiseTexture.set_noise

{-# NOINLINE bindNoiseTexture_set_seamless #-}

bindNoiseTexture_set_seamless :: MethodBind
bindNoiseTexture_set_seamless
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "set_seamless" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_seamless ::
               (NoiseTexture :< cls, Object :< cls) => cls -> Bool -> IO ()
set_seamless cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_set_seamless (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "set_seamless" '[Bool] (IO ())
         where
        nodeMethod = Godot.Core.NoiseTexture.set_seamless

{-# NOINLINE bindNoiseTexture_set_width #-}

bindNoiseTexture_set_width :: MethodBind
bindNoiseTexture_set_width
  = unsafePerformIO $
      withCString "NoiseTexture" $
        \ clsNamePtr ->
          withCString "set_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_width ::
            (NoiseTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindNoiseTexture_set_width (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod NoiseTexture "set_width" '[Int] (IO ()) where
        nodeMethod = Godot.Core.NoiseTexture.set_width