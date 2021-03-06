{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.AnimatedTexture
       (Godot.Core.AnimatedTexture._MAX_FRAMES,
        Godot.Core.AnimatedTexture._update_proxy,
        Godot.Core.AnimatedTexture.get_fps,
        Godot.Core.AnimatedTexture.get_frame_delay,
        Godot.Core.AnimatedTexture.get_frame_texture,
        Godot.Core.AnimatedTexture.get_frames,
        Godot.Core.AnimatedTexture.set_fps,
        Godot.Core.AnimatedTexture.set_frame_delay,
        Godot.Core.AnimatedTexture.set_frame_texture,
        Godot.Core.AnimatedTexture.set_frames)
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

_MAX_FRAMES :: Int
_MAX_FRAMES = 256

instance NodeProperty AnimatedTexture "fps" Float 'False where
        nodeProperty = (get_fps, wrapDroppingSetter set_fps, Nothing)

instance NodeProperty AnimatedTexture "frame_0/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_frame_delay,
             wrapIndexedSetter 0 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_0/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 0 get_frame_texture,
             wrapIndexedSetter 0 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_1/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_frame_delay,
             wrapIndexedSetter 1 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_1/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 1 get_frame_texture,
             wrapIndexedSetter 1 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_10/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_frame_delay,
             wrapIndexedSetter 10 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_10/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 10 get_frame_texture,
             wrapIndexedSetter 10 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_100/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 100 get_frame_delay,
             wrapIndexedSetter 100 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_100/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 100 get_frame_texture,
             wrapIndexedSetter 100 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_101/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 101 get_frame_delay,
             wrapIndexedSetter 101 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_101/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 101 get_frame_texture,
             wrapIndexedSetter 101 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_102/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 102 get_frame_delay,
             wrapIndexedSetter 102 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_102/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 102 get_frame_texture,
             wrapIndexedSetter 102 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_103/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 103 get_frame_delay,
             wrapIndexedSetter 103 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_103/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 103 get_frame_texture,
             wrapIndexedSetter 103 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_104/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 104 get_frame_delay,
             wrapIndexedSetter 104 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_104/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 104 get_frame_texture,
             wrapIndexedSetter 104 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_105/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 105 get_frame_delay,
             wrapIndexedSetter 105 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_105/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 105 get_frame_texture,
             wrapIndexedSetter 105 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_106/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 106 get_frame_delay,
             wrapIndexedSetter 106 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_106/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 106 get_frame_texture,
             wrapIndexedSetter 106 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_107/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 107 get_frame_delay,
             wrapIndexedSetter 107 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_107/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 107 get_frame_texture,
             wrapIndexedSetter 107 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_108/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 108 get_frame_delay,
             wrapIndexedSetter 108 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_108/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 108 get_frame_texture,
             wrapIndexedSetter 108 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_109/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 109 get_frame_delay,
             wrapIndexedSetter 109 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_109/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 109 get_frame_texture,
             wrapIndexedSetter 109 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_11/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_frame_delay,
             wrapIndexedSetter 11 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_11/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 11 get_frame_texture,
             wrapIndexedSetter 11 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_110/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 110 get_frame_delay,
             wrapIndexedSetter 110 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_110/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 110 get_frame_texture,
             wrapIndexedSetter 110 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_111/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 111 get_frame_delay,
             wrapIndexedSetter 111 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_111/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 111 get_frame_texture,
             wrapIndexedSetter 111 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_112/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 112 get_frame_delay,
             wrapIndexedSetter 112 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_112/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 112 get_frame_texture,
             wrapIndexedSetter 112 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_113/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 113 get_frame_delay,
             wrapIndexedSetter 113 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_113/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 113 get_frame_texture,
             wrapIndexedSetter 113 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_114/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 114 get_frame_delay,
             wrapIndexedSetter 114 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_114/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 114 get_frame_texture,
             wrapIndexedSetter 114 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_115/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 115 get_frame_delay,
             wrapIndexedSetter 115 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_115/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 115 get_frame_texture,
             wrapIndexedSetter 115 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_116/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 116 get_frame_delay,
             wrapIndexedSetter 116 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_116/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 116 get_frame_texture,
             wrapIndexedSetter 116 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_117/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 117 get_frame_delay,
             wrapIndexedSetter 117 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_117/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 117 get_frame_texture,
             wrapIndexedSetter 117 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_118/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 118 get_frame_delay,
             wrapIndexedSetter 118 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_118/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 118 get_frame_texture,
             wrapIndexedSetter 118 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_119/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 119 get_frame_delay,
             wrapIndexedSetter 119 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_119/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 119 get_frame_texture,
             wrapIndexedSetter 119 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_12/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_frame_delay,
             wrapIndexedSetter 12 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_12/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 12 get_frame_texture,
             wrapIndexedSetter 12 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_120/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 120 get_frame_delay,
             wrapIndexedSetter 120 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_120/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 120 get_frame_texture,
             wrapIndexedSetter 120 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_121/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 121 get_frame_delay,
             wrapIndexedSetter 121 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_121/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 121 get_frame_texture,
             wrapIndexedSetter 121 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_122/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 122 get_frame_delay,
             wrapIndexedSetter 122 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_122/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 122 get_frame_texture,
             wrapIndexedSetter 122 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_123/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 123 get_frame_delay,
             wrapIndexedSetter 123 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_123/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 123 get_frame_texture,
             wrapIndexedSetter 123 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_124/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 124 get_frame_delay,
             wrapIndexedSetter 124 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_124/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 124 get_frame_texture,
             wrapIndexedSetter 124 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_125/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 125 get_frame_delay,
             wrapIndexedSetter 125 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_125/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 125 get_frame_texture,
             wrapIndexedSetter 125 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_126/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 126 get_frame_delay,
             wrapIndexedSetter 126 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_126/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 126 get_frame_texture,
             wrapIndexedSetter 126 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_127/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 127 get_frame_delay,
             wrapIndexedSetter 127 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_127/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 127 get_frame_texture,
             wrapIndexedSetter 127 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_128/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 128 get_frame_delay,
             wrapIndexedSetter 128 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_128/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 128 get_frame_texture,
             wrapIndexedSetter 128 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_129/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 129 get_frame_delay,
             wrapIndexedSetter 129 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_129/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 129 get_frame_texture,
             wrapIndexedSetter 129 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_13/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_frame_delay,
             wrapIndexedSetter 13 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_13/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 13 get_frame_texture,
             wrapIndexedSetter 13 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_130/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 130 get_frame_delay,
             wrapIndexedSetter 130 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_130/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 130 get_frame_texture,
             wrapIndexedSetter 130 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_131/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 131 get_frame_delay,
             wrapIndexedSetter 131 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_131/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 131 get_frame_texture,
             wrapIndexedSetter 131 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_132/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 132 get_frame_delay,
             wrapIndexedSetter 132 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_132/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 132 get_frame_texture,
             wrapIndexedSetter 132 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_133/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 133 get_frame_delay,
             wrapIndexedSetter 133 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_133/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 133 get_frame_texture,
             wrapIndexedSetter 133 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_134/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 134 get_frame_delay,
             wrapIndexedSetter 134 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_134/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 134 get_frame_texture,
             wrapIndexedSetter 134 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_135/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 135 get_frame_delay,
             wrapIndexedSetter 135 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_135/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 135 get_frame_texture,
             wrapIndexedSetter 135 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_136/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 136 get_frame_delay,
             wrapIndexedSetter 136 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_136/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 136 get_frame_texture,
             wrapIndexedSetter 136 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_137/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 137 get_frame_delay,
             wrapIndexedSetter 137 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_137/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 137 get_frame_texture,
             wrapIndexedSetter 137 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_138/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 138 get_frame_delay,
             wrapIndexedSetter 138 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_138/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 138 get_frame_texture,
             wrapIndexedSetter 138 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_139/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 139 get_frame_delay,
             wrapIndexedSetter 139 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_139/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 139 get_frame_texture,
             wrapIndexedSetter 139 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_14/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_frame_delay,
             wrapIndexedSetter 14 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_14/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 14 get_frame_texture,
             wrapIndexedSetter 14 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_140/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 140 get_frame_delay,
             wrapIndexedSetter 140 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_140/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 140 get_frame_texture,
             wrapIndexedSetter 140 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_141/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 141 get_frame_delay,
             wrapIndexedSetter 141 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_141/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 141 get_frame_texture,
             wrapIndexedSetter 141 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_142/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 142 get_frame_delay,
             wrapIndexedSetter 142 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_142/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 142 get_frame_texture,
             wrapIndexedSetter 142 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_143/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 143 get_frame_delay,
             wrapIndexedSetter 143 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_143/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 143 get_frame_texture,
             wrapIndexedSetter 143 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_144/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 144 get_frame_delay,
             wrapIndexedSetter 144 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_144/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 144 get_frame_texture,
             wrapIndexedSetter 144 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_145/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 145 get_frame_delay,
             wrapIndexedSetter 145 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_145/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 145 get_frame_texture,
             wrapIndexedSetter 145 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_146/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 146 get_frame_delay,
             wrapIndexedSetter 146 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_146/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 146 get_frame_texture,
             wrapIndexedSetter 146 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_147/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 147 get_frame_delay,
             wrapIndexedSetter 147 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_147/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 147 get_frame_texture,
             wrapIndexedSetter 147 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_148/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 148 get_frame_delay,
             wrapIndexedSetter 148 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_148/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 148 get_frame_texture,
             wrapIndexedSetter 148 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_149/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 149 get_frame_delay,
             wrapIndexedSetter 149 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_149/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 149 get_frame_texture,
             wrapIndexedSetter 149 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_15/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_frame_delay,
             wrapIndexedSetter 15 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_15/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 15 get_frame_texture,
             wrapIndexedSetter 15 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_150/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 150 get_frame_delay,
             wrapIndexedSetter 150 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_150/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 150 get_frame_texture,
             wrapIndexedSetter 150 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_151/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 151 get_frame_delay,
             wrapIndexedSetter 151 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_151/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 151 get_frame_texture,
             wrapIndexedSetter 151 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_152/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 152 get_frame_delay,
             wrapIndexedSetter 152 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_152/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 152 get_frame_texture,
             wrapIndexedSetter 152 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_153/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 153 get_frame_delay,
             wrapIndexedSetter 153 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_153/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 153 get_frame_texture,
             wrapIndexedSetter 153 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_154/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 154 get_frame_delay,
             wrapIndexedSetter 154 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_154/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 154 get_frame_texture,
             wrapIndexedSetter 154 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_155/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 155 get_frame_delay,
             wrapIndexedSetter 155 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_155/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 155 get_frame_texture,
             wrapIndexedSetter 155 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_156/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 156 get_frame_delay,
             wrapIndexedSetter 156 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_156/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 156 get_frame_texture,
             wrapIndexedSetter 156 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_157/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 157 get_frame_delay,
             wrapIndexedSetter 157 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_157/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 157 get_frame_texture,
             wrapIndexedSetter 157 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_158/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 158 get_frame_delay,
             wrapIndexedSetter 158 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_158/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 158 get_frame_texture,
             wrapIndexedSetter 158 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_159/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 159 get_frame_delay,
             wrapIndexedSetter 159 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_159/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 159 get_frame_texture,
             wrapIndexedSetter 159 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_16/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_frame_delay,
             wrapIndexedSetter 16 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_16/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 16 get_frame_texture,
             wrapIndexedSetter 16 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_160/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 160 get_frame_delay,
             wrapIndexedSetter 160 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_160/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 160 get_frame_texture,
             wrapIndexedSetter 160 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_161/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 161 get_frame_delay,
             wrapIndexedSetter 161 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_161/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 161 get_frame_texture,
             wrapIndexedSetter 161 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_162/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 162 get_frame_delay,
             wrapIndexedSetter 162 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_162/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 162 get_frame_texture,
             wrapIndexedSetter 162 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_163/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 163 get_frame_delay,
             wrapIndexedSetter 163 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_163/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 163 get_frame_texture,
             wrapIndexedSetter 163 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_164/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 164 get_frame_delay,
             wrapIndexedSetter 164 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_164/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 164 get_frame_texture,
             wrapIndexedSetter 164 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_165/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 165 get_frame_delay,
             wrapIndexedSetter 165 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_165/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 165 get_frame_texture,
             wrapIndexedSetter 165 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_166/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 166 get_frame_delay,
             wrapIndexedSetter 166 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_166/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 166 get_frame_texture,
             wrapIndexedSetter 166 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_167/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 167 get_frame_delay,
             wrapIndexedSetter 167 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_167/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 167 get_frame_texture,
             wrapIndexedSetter 167 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_168/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 168 get_frame_delay,
             wrapIndexedSetter 168 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_168/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 168 get_frame_texture,
             wrapIndexedSetter 168 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_169/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 169 get_frame_delay,
             wrapIndexedSetter 169 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_169/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 169 get_frame_texture,
             wrapIndexedSetter 169 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_17/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_frame_delay,
             wrapIndexedSetter 17 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_17/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 17 get_frame_texture,
             wrapIndexedSetter 17 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_170/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 170 get_frame_delay,
             wrapIndexedSetter 170 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_170/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 170 get_frame_texture,
             wrapIndexedSetter 170 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_171/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 171 get_frame_delay,
             wrapIndexedSetter 171 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_171/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 171 get_frame_texture,
             wrapIndexedSetter 171 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_172/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 172 get_frame_delay,
             wrapIndexedSetter 172 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_172/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 172 get_frame_texture,
             wrapIndexedSetter 172 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_173/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 173 get_frame_delay,
             wrapIndexedSetter 173 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_173/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 173 get_frame_texture,
             wrapIndexedSetter 173 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_174/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 174 get_frame_delay,
             wrapIndexedSetter 174 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_174/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 174 get_frame_texture,
             wrapIndexedSetter 174 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_175/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 175 get_frame_delay,
             wrapIndexedSetter 175 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_175/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 175 get_frame_texture,
             wrapIndexedSetter 175 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_176/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 176 get_frame_delay,
             wrapIndexedSetter 176 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_176/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 176 get_frame_texture,
             wrapIndexedSetter 176 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_177/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 177 get_frame_delay,
             wrapIndexedSetter 177 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_177/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 177 get_frame_texture,
             wrapIndexedSetter 177 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_178/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 178 get_frame_delay,
             wrapIndexedSetter 178 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_178/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 178 get_frame_texture,
             wrapIndexedSetter 178 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_179/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 179 get_frame_delay,
             wrapIndexedSetter 179 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_179/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 179 get_frame_texture,
             wrapIndexedSetter 179 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_18/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_frame_delay,
             wrapIndexedSetter 18 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_18/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 18 get_frame_texture,
             wrapIndexedSetter 18 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_180/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 180 get_frame_delay,
             wrapIndexedSetter 180 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_180/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 180 get_frame_texture,
             wrapIndexedSetter 180 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_181/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 181 get_frame_delay,
             wrapIndexedSetter 181 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_181/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 181 get_frame_texture,
             wrapIndexedSetter 181 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_182/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 182 get_frame_delay,
             wrapIndexedSetter 182 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_182/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 182 get_frame_texture,
             wrapIndexedSetter 182 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_183/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 183 get_frame_delay,
             wrapIndexedSetter 183 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_183/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 183 get_frame_texture,
             wrapIndexedSetter 183 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_184/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 184 get_frame_delay,
             wrapIndexedSetter 184 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_184/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 184 get_frame_texture,
             wrapIndexedSetter 184 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_185/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 185 get_frame_delay,
             wrapIndexedSetter 185 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_185/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 185 get_frame_texture,
             wrapIndexedSetter 185 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_186/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 186 get_frame_delay,
             wrapIndexedSetter 186 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_186/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 186 get_frame_texture,
             wrapIndexedSetter 186 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_187/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 187 get_frame_delay,
             wrapIndexedSetter 187 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_187/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 187 get_frame_texture,
             wrapIndexedSetter 187 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_188/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 188 get_frame_delay,
             wrapIndexedSetter 188 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_188/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 188 get_frame_texture,
             wrapIndexedSetter 188 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_189/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 189 get_frame_delay,
             wrapIndexedSetter 189 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_189/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 189 get_frame_texture,
             wrapIndexedSetter 189 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_19/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 get_frame_delay,
             wrapIndexedSetter 19 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_19/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 19 get_frame_texture,
             wrapIndexedSetter 19 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_190/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 190 get_frame_delay,
             wrapIndexedSetter 190 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_190/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 190 get_frame_texture,
             wrapIndexedSetter 190 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_191/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 191 get_frame_delay,
             wrapIndexedSetter 191 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_191/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 191 get_frame_texture,
             wrapIndexedSetter 191 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_192/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 192 get_frame_delay,
             wrapIndexedSetter 192 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_192/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 192 get_frame_texture,
             wrapIndexedSetter 192 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_193/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 193 get_frame_delay,
             wrapIndexedSetter 193 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_193/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 193 get_frame_texture,
             wrapIndexedSetter 193 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_194/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 194 get_frame_delay,
             wrapIndexedSetter 194 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_194/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 194 get_frame_texture,
             wrapIndexedSetter 194 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_195/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 195 get_frame_delay,
             wrapIndexedSetter 195 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_195/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 195 get_frame_texture,
             wrapIndexedSetter 195 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_196/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 196 get_frame_delay,
             wrapIndexedSetter 196 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_196/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 196 get_frame_texture,
             wrapIndexedSetter 196 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_197/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 197 get_frame_delay,
             wrapIndexedSetter 197 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_197/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 197 get_frame_texture,
             wrapIndexedSetter 197 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_198/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 198 get_frame_delay,
             wrapIndexedSetter 198 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_198/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 198 get_frame_texture,
             wrapIndexedSetter 198 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_199/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 199 get_frame_delay,
             wrapIndexedSetter 199 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_199/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 199 get_frame_texture,
             wrapIndexedSetter 199 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_2/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_frame_delay,
             wrapIndexedSetter 2 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_2/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 2 get_frame_texture,
             wrapIndexedSetter 2 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_20/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 get_frame_delay,
             wrapIndexedSetter 20 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_20/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 20 get_frame_texture,
             wrapIndexedSetter 20 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_200/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 200 get_frame_delay,
             wrapIndexedSetter 200 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_200/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 200 get_frame_texture,
             wrapIndexedSetter 200 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_201/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 201 get_frame_delay,
             wrapIndexedSetter 201 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_201/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 201 get_frame_texture,
             wrapIndexedSetter 201 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_202/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 202 get_frame_delay,
             wrapIndexedSetter 202 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_202/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 202 get_frame_texture,
             wrapIndexedSetter 202 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_203/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 203 get_frame_delay,
             wrapIndexedSetter 203 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_203/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 203 get_frame_texture,
             wrapIndexedSetter 203 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_204/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 204 get_frame_delay,
             wrapIndexedSetter 204 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_204/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 204 get_frame_texture,
             wrapIndexedSetter 204 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_205/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 205 get_frame_delay,
             wrapIndexedSetter 205 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_205/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 205 get_frame_texture,
             wrapIndexedSetter 205 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_206/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 206 get_frame_delay,
             wrapIndexedSetter 206 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_206/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 206 get_frame_texture,
             wrapIndexedSetter 206 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_207/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 207 get_frame_delay,
             wrapIndexedSetter 207 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_207/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 207 get_frame_texture,
             wrapIndexedSetter 207 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_208/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 208 get_frame_delay,
             wrapIndexedSetter 208 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_208/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 208 get_frame_texture,
             wrapIndexedSetter 208 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_209/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 209 get_frame_delay,
             wrapIndexedSetter 209 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_209/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 209 get_frame_texture,
             wrapIndexedSetter 209 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_21/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 get_frame_delay,
             wrapIndexedSetter 21 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_21/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 21 get_frame_texture,
             wrapIndexedSetter 21 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_210/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 210 get_frame_delay,
             wrapIndexedSetter 210 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_210/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 210 get_frame_texture,
             wrapIndexedSetter 210 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_211/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 211 get_frame_delay,
             wrapIndexedSetter 211 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_211/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 211 get_frame_texture,
             wrapIndexedSetter 211 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_212/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 212 get_frame_delay,
             wrapIndexedSetter 212 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_212/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 212 get_frame_texture,
             wrapIndexedSetter 212 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_213/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 213 get_frame_delay,
             wrapIndexedSetter 213 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_213/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 213 get_frame_texture,
             wrapIndexedSetter 213 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_214/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 214 get_frame_delay,
             wrapIndexedSetter 214 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_214/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 214 get_frame_texture,
             wrapIndexedSetter 214 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_215/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 215 get_frame_delay,
             wrapIndexedSetter 215 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_215/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 215 get_frame_texture,
             wrapIndexedSetter 215 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_216/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 216 get_frame_delay,
             wrapIndexedSetter 216 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_216/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 216 get_frame_texture,
             wrapIndexedSetter 216 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_217/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 217 get_frame_delay,
             wrapIndexedSetter 217 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_217/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 217 get_frame_texture,
             wrapIndexedSetter 217 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_218/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 218 get_frame_delay,
             wrapIndexedSetter 218 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_218/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 218 get_frame_texture,
             wrapIndexedSetter 218 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_219/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 219 get_frame_delay,
             wrapIndexedSetter 219 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_219/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 219 get_frame_texture,
             wrapIndexedSetter 219 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_22/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 22 get_frame_delay,
             wrapIndexedSetter 22 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_22/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 22 get_frame_texture,
             wrapIndexedSetter 22 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_220/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 220 get_frame_delay,
             wrapIndexedSetter 220 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_220/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 220 get_frame_texture,
             wrapIndexedSetter 220 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_221/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 221 get_frame_delay,
             wrapIndexedSetter 221 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_221/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 221 get_frame_texture,
             wrapIndexedSetter 221 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_222/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 222 get_frame_delay,
             wrapIndexedSetter 222 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_222/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 222 get_frame_texture,
             wrapIndexedSetter 222 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_223/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 223 get_frame_delay,
             wrapIndexedSetter 223 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_223/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 223 get_frame_texture,
             wrapIndexedSetter 223 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_224/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 224 get_frame_delay,
             wrapIndexedSetter 224 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_224/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 224 get_frame_texture,
             wrapIndexedSetter 224 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_225/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 225 get_frame_delay,
             wrapIndexedSetter 225 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_225/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 225 get_frame_texture,
             wrapIndexedSetter 225 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_226/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 226 get_frame_delay,
             wrapIndexedSetter 226 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_226/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 226 get_frame_texture,
             wrapIndexedSetter 226 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_227/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 227 get_frame_delay,
             wrapIndexedSetter 227 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_227/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 227 get_frame_texture,
             wrapIndexedSetter 227 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_228/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 228 get_frame_delay,
             wrapIndexedSetter 228 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_228/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 228 get_frame_texture,
             wrapIndexedSetter 228 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_229/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 229 get_frame_delay,
             wrapIndexedSetter 229 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_229/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 229 get_frame_texture,
             wrapIndexedSetter 229 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_23/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 23 get_frame_delay,
             wrapIndexedSetter 23 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_23/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 23 get_frame_texture,
             wrapIndexedSetter 23 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_230/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 230 get_frame_delay,
             wrapIndexedSetter 230 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_230/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 230 get_frame_texture,
             wrapIndexedSetter 230 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_231/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 231 get_frame_delay,
             wrapIndexedSetter 231 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_231/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 231 get_frame_texture,
             wrapIndexedSetter 231 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_232/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 232 get_frame_delay,
             wrapIndexedSetter 232 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_232/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 232 get_frame_texture,
             wrapIndexedSetter 232 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_233/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 233 get_frame_delay,
             wrapIndexedSetter 233 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_233/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 233 get_frame_texture,
             wrapIndexedSetter 233 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_234/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 234 get_frame_delay,
             wrapIndexedSetter 234 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_234/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 234 get_frame_texture,
             wrapIndexedSetter 234 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_235/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 235 get_frame_delay,
             wrapIndexedSetter 235 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_235/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 235 get_frame_texture,
             wrapIndexedSetter 235 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_236/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 236 get_frame_delay,
             wrapIndexedSetter 236 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_236/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 236 get_frame_texture,
             wrapIndexedSetter 236 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_237/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 237 get_frame_delay,
             wrapIndexedSetter 237 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_237/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 237 get_frame_texture,
             wrapIndexedSetter 237 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_238/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 238 get_frame_delay,
             wrapIndexedSetter 238 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_238/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 238 get_frame_texture,
             wrapIndexedSetter 238 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_239/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 239 get_frame_delay,
             wrapIndexedSetter 239 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_239/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 239 get_frame_texture,
             wrapIndexedSetter 239 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_24/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 24 get_frame_delay,
             wrapIndexedSetter 24 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_24/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 24 get_frame_texture,
             wrapIndexedSetter 24 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_240/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 240 get_frame_delay,
             wrapIndexedSetter 240 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_240/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 240 get_frame_texture,
             wrapIndexedSetter 240 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_241/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 241 get_frame_delay,
             wrapIndexedSetter 241 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_241/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 241 get_frame_texture,
             wrapIndexedSetter 241 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_242/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 242 get_frame_delay,
             wrapIndexedSetter 242 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_242/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 242 get_frame_texture,
             wrapIndexedSetter 242 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_243/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 243 get_frame_delay,
             wrapIndexedSetter 243 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_243/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 243 get_frame_texture,
             wrapIndexedSetter 243 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_244/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 244 get_frame_delay,
             wrapIndexedSetter 244 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_244/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 244 get_frame_texture,
             wrapIndexedSetter 244 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_245/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 245 get_frame_delay,
             wrapIndexedSetter 245 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_245/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 245 get_frame_texture,
             wrapIndexedSetter 245 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_246/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 246 get_frame_delay,
             wrapIndexedSetter 246 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_246/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 246 get_frame_texture,
             wrapIndexedSetter 246 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_247/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 247 get_frame_delay,
             wrapIndexedSetter 247 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_247/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 247 get_frame_texture,
             wrapIndexedSetter 247 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_248/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 248 get_frame_delay,
             wrapIndexedSetter 248 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_248/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 248 get_frame_texture,
             wrapIndexedSetter 248 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_249/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 249 get_frame_delay,
             wrapIndexedSetter 249 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_249/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 249 get_frame_texture,
             wrapIndexedSetter 249 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_25/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 25 get_frame_delay,
             wrapIndexedSetter 25 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_25/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 25 get_frame_texture,
             wrapIndexedSetter 25 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_250/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 250 get_frame_delay,
             wrapIndexedSetter 250 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_250/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 250 get_frame_texture,
             wrapIndexedSetter 250 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_251/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 251 get_frame_delay,
             wrapIndexedSetter 251 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_251/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 251 get_frame_texture,
             wrapIndexedSetter 251 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_252/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 252 get_frame_delay,
             wrapIndexedSetter 252 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_252/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 252 get_frame_texture,
             wrapIndexedSetter 252 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_253/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 253 get_frame_delay,
             wrapIndexedSetter 253 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_253/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 253 get_frame_texture,
             wrapIndexedSetter 253 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_254/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 254 get_frame_delay,
             wrapIndexedSetter 254 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_254/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 254 get_frame_texture,
             wrapIndexedSetter 254 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_255/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 255 get_frame_delay,
             wrapIndexedSetter 255 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_255/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 255 get_frame_texture,
             wrapIndexedSetter 255 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_26/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 26 get_frame_delay,
             wrapIndexedSetter 26 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_26/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 26 get_frame_texture,
             wrapIndexedSetter 26 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_27/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 27 get_frame_delay,
             wrapIndexedSetter 27 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_27/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 27 get_frame_texture,
             wrapIndexedSetter 27 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_28/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 28 get_frame_delay,
             wrapIndexedSetter 28 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_28/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 28 get_frame_texture,
             wrapIndexedSetter 28 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_29/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 29 get_frame_delay,
             wrapIndexedSetter 29 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_29/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 29 get_frame_texture,
             wrapIndexedSetter 29 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_3/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_frame_delay,
             wrapIndexedSetter 3 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_3/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 3 get_frame_texture,
             wrapIndexedSetter 3 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_30/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 30 get_frame_delay,
             wrapIndexedSetter 30 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_30/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 30 get_frame_texture,
             wrapIndexedSetter 30 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_31/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 31 get_frame_delay,
             wrapIndexedSetter 31 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_31/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 31 get_frame_texture,
             wrapIndexedSetter 31 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_32/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 32 get_frame_delay,
             wrapIndexedSetter 32 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_32/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 32 get_frame_texture,
             wrapIndexedSetter 32 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_33/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 33 get_frame_delay,
             wrapIndexedSetter 33 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_33/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 33 get_frame_texture,
             wrapIndexedSetter 33 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_34/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 34 get_frame_delay,
             wrapIndexedSetter 34 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_34/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 34 get_frame_texture,
             wrapIndexedSetter 34 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_35/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 35 get_frame_delay,
             wrapIndexedSetter 35 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_35/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 35 get_frame_texture,
             wrapIndexedSetter 35 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_36/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 36 get_frame_delay,
             wrapIndexedSetter 36 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_36/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 36 get_frame_texture,
             wrapIndexedSetter 36 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_37/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 37 get_frame_delay,
             wrapIndexedSetter 37 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_37/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 37 get_frame_texture,
             wrapIndexedSetter 37 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_38/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 38 get_frame_delay,
             wrapIndexedSetter 38 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_38/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 38 get_frame_texture,
             wrapIndexedSetter 38 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_39/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 39 get_frame_delay,
             wrapIndexedSetter 39 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_39/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 39 get_frame_texture,
             wrapIndexedSetter 39 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_4/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_frame_delay,
             wrapIndexedSetter 4 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_4/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 4 get_frame_texture,
             wrapIndexedSetter 4 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_40/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 40 get_frame_delay,
             wrapIndexedSetter 40 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_40/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 40 get_frame_texture,
             wrapIndexedSetter 40 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_41/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 41 get_frame_delay,
             wrapIndexedSetter 41 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_41/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 41 get_frame_texture,
             wrapIndexedSetter 41 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_42/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 42 get_frame_delay,
             wrapIndexedSetter 42 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_42/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 42 get_frame_texture,
             wrapIndexedSetter 42 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_43/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 43 get_frame_delay,
             wrapIndexedSetter 43 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_43/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 43 get_frame_texture,
             wrapIndexedSetter 43 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_44/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 44 get_frame_delay,
             wrapIndexedSetter 44 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_44/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 44 get_frame_texture,
             wrapIndexedSetter 44 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_45/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 45 get_frame_delay,
             wrapIndexedSetter 45 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_45/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 45 get_frame_texture,
             wrapIndexedSetter 45 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_46/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 46 get_frame_delay,
             wrapIndexedSetter 46 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_46/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 46 get_frame_texture,
             wrapIndexedSetter 46 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_47/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 47 get_frame_delay,
             wrapIndexedSetter 47 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_47/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 47 get_frame_texture,
             wrapIndexedSetter 47 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_48/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 48 get_frame_delay,
             wrapIndexedSetter 48 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_48/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 48 get_frame_texture,
             wrapIndexedSetter 48 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_49/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 49 get_frame_delay,
             wrapIndexedSetter 49 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_49/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 49 get_frame_texture,
             wrapIndexedSetter 49 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_5/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_frame_delay,
             wrapIndexedSetter 5 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_5/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 5 get_frame_texture,
             wrapIndexedSetter 5 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_50/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 50 get_frame_delay,
             wrapIndexedSetter 50 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_50/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 50 get_frame_texture,
             wrapIndexedSetter 50 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_51/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 51 get_frame_delay,
             wrapIndexedSetter 51 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_51/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 51 get_frame_texture,
             wrapIndexedSetter 51 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_52/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 52 get_frame_delay,
             wrapIndexedSetter 52 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_52/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 52 get_frame_texture,
             wrapIndexedSetter 52 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_53/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 53 get_frame_delay,
             wrapIndexedSetter 53 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_53/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 53 get_frame_texture,
             wrapIndexedSetter 53 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_54/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 54 get_frame_delay,
             wrapIndexedSetter 54 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_54/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 54 get_frame_texture,
             wrapIndexedSetter 54 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_55/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 55 get_frame_delay,
             wrapIndexedSetter 55 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_55/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 55 get_frame_texture,
             wrapIndexedSetter 55 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_56/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 56 get_frame_delay,
             wrapIndexedSetter 56 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_56/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 56 get_frame_texture,
             wrapIndexedSetter 56 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_57/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 57 get_frame_delay,
             wrapIndexedSetter 57 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_57/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 57 get_frame_texture,
             wrapIndexedSetter 57 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_58/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 58 get_frame_delay,
             wrapIndexedSetter 58 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_58/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 58 get_frame_texture,
             wrapIndexedSetter 58 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_59/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 59 get_frame_delay,
             wrapIndexedSetter 59 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_59/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 59 get_frame_texture,
             wrapIndexedSetter 59 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_6/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_frame_delay,
             wrapIndexedSetter 6 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_6/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 6 get_frame_texture,
             wrapIndexedSetter 6 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_60/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 60 get_frame_delay,
             wrapIndexedSetter 60 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_60/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 60 get_frame_texture,
             wrapIndexedSetter 60 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_61/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 61 get_frame_delay,
             wrapIndexedSetter 61 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_61/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 61 get_frame_texture,
             wrapIndexedSetter 61 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_62/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 62 get_frame_delay,
             wrapIndexedSetter 62 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_62/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 62 get_frame_texture,
             wrapIndexedSetter 62 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_63/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 63 get_frame_delay,
             wrapIndexedSetter 63 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_63/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 63 get_frame_texture,
             wrapIndexedSetter 63 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_64/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 64 get_frame_delay,
             wrapIndexedSetter 64 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_64/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 64 get_frame_texture,
             wrapIndexedSetter 64 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_65/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 65 get_frame_delay,
             wrapIndexedSetter 65 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_65/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 65 get_frame_texture,
             wrapIndexedSetter 65 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_66/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 66 get_frame_delay,
             wrapIndexedSetter 66 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_66/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 66 get_frame_texture,
             wrapIndexedSetter 66 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_67/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 67 get_frame_delay,
             wrapIndexedSetter 67 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_67/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 67 get_frame_texture,
             wrapIndexedSetter 67 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_68/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 68 get_frame_delay,
             wrapIndexedSetter 68 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_68/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 68 get_frame_texture,
             wrapIndexedSetter 68 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_69/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 69 get_frame_delay,
             wrapIndexedSetter 69 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_69/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 69 get_frame_texture,
             wrapIndexedSetter 69 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_7/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_frame_delay,
             wrapIndexedSetter 7 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_7/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 7 get_frame_texture,
             wrapIndexedSetter 7 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_70/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 70 get_frame_delay,
             wrapIndexedSetter 70 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_70/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 70 get_frame_texture,
             wrapIndexedSetter 70 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_71/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 71 get_frame_delay,
             wrapIndexedSetter 71 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_71/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 71 get_frame_texture,
             wrapIndexedSetter 71 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_72/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 72 get_frame_delay,
             wrapIndexedSetter 72 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_72/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 72 get_frame_texture,
             wrapIndexedSetter 72 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_73/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 73 get_frame_delay,
             wrapIndexedSetter 73 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_73/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 73 get_frame_texture,
             wrapIndexedSetter 73 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_74/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 74 get_frame_delay,
             wrapIndexedSetter 74 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_74/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 74 get_frame_texture,
             wrapIndexedSetter 74 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_75/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 75 get_frame_delay,
             wrapIndexedSetter 75 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_75/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 75 get_frame_texture,
             wrapIndexedSetter 75 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_76/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 76 get_frame_delay,
             wrapIndexedSetter 76 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_76/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 76 get_frame_texture,
             wrapIndexedSetter 76 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_77/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 77 get_frame_delay,
             wrapIndexedSetter 77 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_77/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 77 get_frame_texture,
             wrapIndexedSetter 77 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_78/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 78 get_frame_delay,
             wrapIndexedSetter 78 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_78/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 78 get_frame_texture,
             wrapIndexedSetter 78 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_79/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 79 get_frame_delay,
             wrapIndexedSetter 79 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_79/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 79 get_frame_texture,
             wrapIndexedSetter 79 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_8/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_frame_delay,
             wrapIndexedSetter 8 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_8/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 8 get_frame_texture,
             wrapIndexedSetter 8 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_80/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 80 get_frame_delay,
             wrapIndexedSetter 80 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_80/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 80 get_frame_texture,
             wrapIndexedSetter 80 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_81/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 81 get_frame_delay,
             wrapIndexedSetter 81 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_81/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 81 get_frame_texture,
             wrapIndexedSetter 81 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_82/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 82 get_frame_delay,
             wrapIndexedSetter 82 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_82/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 82 get_frame_texture,
             wrapIndexedSetter 82 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_83/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 83 get_frame_delay,
             wrapIndexedSetter 83 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_83/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 83 get_frame_texture,
             wrapIndexedSetter 83 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_84/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 84 get_frame_delay,
             wrapIndexedSetter 84 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_84/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 84 get_frame_texture,
             wrapIndexedSetter 84 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_85/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 85 get_frame_delay,
             wrapIndexedSetter 85 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_85/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 85 get_frame_texture,
             wrapIndexedSetter 85 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_86/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 86 get_frame_delay,
             wrapIndexedSetter 86 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_86/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 86 get_frame_texture,
             wrapIndexedSetter 86 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_87/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 87 get_frame_delay,
             wrapIndexedSetter 87 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_87/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 87 get_frame_texture,
             wrapIndexedSetter 87 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_88/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 88 get_frame_delay,
             wrapIndexedSetter 88 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_88/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 88 get_frame_texture,
             wrapIndexedSetter 88 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_89/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 89 get_frame_delay,
             wrapIndexedSetter 89 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_89/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 89 get_frame_texture,
             wrapIndexedSetter 89 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_9/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_frame_delay,
             wrapIndexedSetter 9 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_9/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 9 get_frame_texture,
             wrapIndexedSetter 9 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_90/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 90 get_frame_delay,
             wrapIndexedSetter 90 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_90/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 90 get_frame_texture,
             wrapIndexedSetter 90 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_91/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 91 get_frame_delay,
             wrapIndexedSetter 91 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_91/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 91 get_frame_texture,
             wrapIndexedSetter 91 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_92/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 92 get_frame_delay,
             wrapIndexedSetter 92 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_92/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 92 get_frame_texture,
             wrapIndexedSetter 92 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_93/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 93 get_frame_delay,
             wrapIndexedSetter 93 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_93/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 93 get_frame_texture,
             wrapIndexedSetter 93 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_94/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 94 get_frame_delay,
             wrapIndexedSetter 94 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_94/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 94 get_frame_texture,
             wrapIndexedSetter 94 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_95/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 95 get_frame_delay,
             wrapIndexedSetter 95 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_95/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 95 get_frame_texture,
             wrapIndexedSetter 95 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_96/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 96 get_frame_delay,
             wrapIndexedSetter 96 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_96/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 96 get_frame_texture,
             wrapIndexedSetter 96 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_97/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 97 get_frame_delay,
             wrapIndexedSetter 97 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_97/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 97 get_frame_texture,
             wrapIndexedSetter 97 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_98/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 98 get_frame_delay,
             wrapIndexedSetter 98 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_98/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 98 get_frame_texture,
             wrapIndexedSetter 98 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frame_99/delay_sec" Float
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 99 get_frame_delay,
             wrapIndexedSetter 99 set_frame_delay, Nothing)

instance NodeProperty AnimatedTexture "frame_99/texture" Texture
           'False
         where
        nodeProperty
          = (wrapIndexedGetter 99 get_frame_texture,
             wrapIndexedSetter 99 set_frame_texture, Nothing)

instance NodeProperty AnimatedTexture "frames" Int 'False where
        nodeProperty = (get_frames, wrapDroppingSetter set_frames, Nothing)

{-# NOINLINE bindAnimatedTexture__update_proxy #-}

bindAnimatedTexture__update_proxy :: MethodBind
bindAnimatedTexture__update_proxy
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "_update_proxy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

_update_proxy ::
                (AnimatedTexture :< cls, Object :< cls) => cls -> IO ()
_update_proxy cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture__update_proxy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "_update_proxy" '[] (IO ())
         where
        nodeMethod = Godot.Core.AnimatedTexture._update_proxy

{-# NOINLINE bindAnimatedTexture_get_fps #-}

-- | Animation speed in frames per second. This value defines the default time interval between two frames of the animation, and thus the overall duration of the animation loop based on the @frames@ property. A value of 0 means no predefined number of frames per second, the animation will play according to each frame's frame delay (see @method set_frame_delay@).
--   			For example, an animation with 8 frames, no frame delay and a @fps@ value of 2 will run for 4 seconds, with each frame lasting 0.5 seconds.
bindAnimatedTexture_get_fps :: MethodBind
bindAnimatedTexture_get_fps
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "get_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animation speed in frames per second. This value defines the default time interval between two frames of the animation, and thus the overall duration of the animation loop based on the @frames@ property. A value of 0 means no predefined number of frames per second, the animation will play according to each frame's frame delay (see @method set_frame_delay@).
--   			For example, an animation with 8 frames, no frame delay and a @fps@ value of 2 will run for 4 seconds, with each frame lasting 0.5 seconds.
get_fps ::
          (AnimatedTexture :< cls, Object :< cls) => cls -> IO Float
get_fps cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_get_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "get_fps" '[] (IO Float) where
        nodeMethod = Godot.Core.AnimatedTexture.get_fps

{-# NOINLINE bindAnimatedTexture_get_frame_delay #-}

-- | Returns the given frame's delay value.
bindAnimatedTexture_get_frame_delay :: MethodBind
bindAnimatedTexture_get_frame_delay
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "get_frame_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given frame's delay value.
get_frame_delay ::
                  (AnimatedTexture :< cls, Object :< cls) => cls -> Int -> IO Float
get_frame_delay cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_get_frame_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "get_frame_delay" '[Int]
           (IO Float)
         where
        nodeMethod = Godot.Core.AnimatedTexture.get_frame_delay

{-# NOINLINE bindAnimatedTexture_get_frame_texture #-}

-- | Returns the given frame's @Texture@.
bindAnimatedTexture_get_frame_texture :: MethodBind
bindAnimatedTexture_get_frame_texture
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "get_frame_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the given frame's @Texture@.
get_frame_texture ::
                    (AnimatedTexture :< cls, Object :< cls) => cls -> Int -> IO Texture
get_frame_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_get_frame_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "get_frame_texture" '[Int]
           (IO Texture)
         where
        nodeMethod = Godot.Core.AnimatedTexture.get_frame_texture

{-# NOINLINE bindAnimatedTexture_get_frames #-}

-- | Number of frames to use in the animation. While you can create the frames independently with @method set_frame_texture@, you need to set this value for the animation to take new frames into account. The maximum number of frames is @MAX_FRAMES@.
bindAnimatedTexture_get_frames :: MethodBind
bindAnimatedTexture_get_frames
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "get_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of frames to use in the animation. While you can create the frames independently with @method set_frame_texture@, you need to set this value for the animation to take new frames into account. The maximum number of frames is @MAX_FRAMES@.
get_frames ::
             (AnimatedTexture :< cls, Object :< cls) => cls -> IO Int
get_frames cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_get_frames (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "get_frames" '[] (IO Int) where
        nodeMethod = Godot.Core.AnimatedTexture.get_frames

{-# NOINLINE bindAnimatedTexture_set_fps #-}

-- | Animation speed in frames per second. This value defines the default time interval between two frames of the animation, and thus the overall duration of the animation loop based on the @frames@ property. A value of 0 means no predefined number of frames per second, the animation will play according to each frame's frame delay (see @method set_frame_delay@).
--   			For example, an animation with 8 frames, no frame delay and a @fps@ value of 2 will run for 4 seconds, with each frame lasting 0.5 seconds.
bindAnimatedTexture_set_fps :: MethodBind
bindAnimatedTexture_set_fps
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "set_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Animation speed in frames per second. This value defines the default time interval between two frames of the animation, and thus the overall duration of the animation loop based on the @frames@ property. A value of 0 means no predefined number of frames per second, the animation will play according to each frame's frame delay (see @method set_frame_delay@).
--   			For example, an animation with 8 frames, no frame delay and a @fps@ value of 2 will run for 4 seconds, with each frame lasting 0.5 seconds.
set_fps ::
          (AnimatedTexture :< cls, Object :< cls) => cls -> Float -> IO ()
set_fps cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_set_fps (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "set_fps" '[Float] (IO ())
         where
        nodeMethod = Godot.Core.AnimatedTexture.set_fps

{-# NOINLINE bindAnimatedTexture_set_frame_delay #-}

-- | Sets an additional delay (in seconds) between this frame and the next one, that will be added to the time interval defined by @fps@. By default, frames have no delay defined. If a delay value is defined, the final time interval between this frame and the next will be @1.0 / fps + delay@.
--   				For example, for an animation with 3 frames, 2 FPS and a frame delay on the second frame of 1.2, the resulting playback will be:
--   				
--   @
--   
--   				Frame 0: 0.5 s (1 / fps)
--   				Frame 1: 1.7 s (1 / fps + 1.2)
--   				Frame 2: 0.5 s (1 / fps)
--   				Total duration: 2.7 s
--   				
--   @
bindAnimatedTexture_set_frame_delay :: MethodBind
bindAnimatedTexture_set_frame_delay
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "set_frame_delay" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an additional delay (in seconds) between this frame and the next one, that will be added to the time interval defined by @fps@. By default, frames have no delay defined. If a delay value is defined, the final time interval between this frame and the next will be @1.0 / fps + delay@.
--   				For example, for an animation with 3 frames, 2 FPS and a frame delay on the second frame of 1.2, the resulting playback will be:
--   				
--   @
--   
--   				Frame 0: 0.5 s (1 / fps)
--   				Frame 1: 1.7 s (1 / fps + 1.2)
--   				Frame 2: 0.5 s (1 / fps)
--   				Total duration: 2.7 s
--   				
--   @
set_frame_delay ::
                  (AnimatedTexture :< cls, Object :< cls) =>
                  cls -> Int -> Float -> IO ()
set_frame_delay cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_set_frame_delay
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "set_frame_delay" '[Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimatedTexture.set_frame_delay

{-# NOINLINE bindAnimatedTexture_set_frame_texture #-}

-- | Assigns a @Texture@ to the given frame. Frame IDs start at 0, so the first frame has ID 0, and the last frame of the animation has ID @frames@ - 1.
--   				You can define any number of textures up to @MAX_FRAMES@, but keep in mind that only frames from 0 to @frames@ - 1 will be part of the animation.
bindAnimatedTexture_set_frame_texture :: MethodBind
bindAnimatedTexture_set_frame_texture
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "set_frame_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Assigns a @Texture@ to the given frame. Frame IDs start at 0, so the first frame has ID 0, and the last frame of the animation has ID @frames@ - 1.
--   				You can define any number of textures up to @MAX_FRAMES@, but keep in mind that only frames from 0 to @frames@ - 1 will be part of the animation.
set_frame_texture ::
                    (AnimatedTexture :< cls, Object :< cls) =>
                    cls -> Int -> Texture -> IO ()
set_frame_texture cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_set_frame_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "set_frame_texture"
           '[Int, Texture]
           (IO ())
         where
        nodeMethod = Godot.Core.AnimatedTexture.set_frame_texture

{-# NOINLINE bindAnimatedTexture_set_frames #-}

-- | Number of frames to use in the animation. While you can create the frames independently with @method set_frame_texture@, you need to set this value for the animation to take new frames into account. The maximum number of frames is @MAX_FRAMES@.
bindAnimatedTexture_set_frames :: MethodBind
bindAnimatedTexture_set_frames
  = unsafePerformIO $
      withCString "AnimatedTexture" $
        \ clsNamePtr ->
          withCString "set_frames" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Number of frames to use in the animation. While you can create the frames independently with @method set_frame_texture@, you need to set this value for the animation to take new frames into account. The maximum number of frames is @MAX_FRAMES@.
set_frames ::
             (AnimatedTexture :< cls, Object :< cls) => cls -> Int -> IO ()
set_frames cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindAnimatedTexture_set_frames (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod AnimatedTexture "set_frames" '[Int] (IO ())
         where
        nodeMethod = Godot.Core.AnimatedTexture.set_frames