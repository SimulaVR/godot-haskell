module Godot.Core.GodotPopup where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern NOTIFICATION_POPUP_HIDE :: Int

pattern NOTIFICATION_POPUP_HIDE = 81

pattern NOTIFICATION_POST_POPUP :: Int

pattern NOTIFICATION_POST_POPUP = 80

about_to_show :: Signal GodotPopup
about_to_show = Signal "about_to_show"

popup_hide :: Signal GodotPopup
popup_hide = Signal "popup_hide"