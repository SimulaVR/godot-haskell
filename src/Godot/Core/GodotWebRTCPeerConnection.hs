module Godot.Core.GodotWebRTCPeerConnection where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern STATE_CONNECTED :: Int

pattern STATE_CONNECTED = 2

pattern STATE_FAILED :: Int

pattern STATE_FAILED = 4

pattern STATE_DISCONNECTED :: Int

pattern STATE_DISCONNECTED = 3

pattern STATE_CLOSED :: Int

pattern STATE_CLOSED = 5

pattern STATE_CONNECTING :: Int

pattern STATE_CONNECTING = 1

pattern STATE_NEW :: Int

pattern STATE_NEW = 0

data_channel_received :: Signal GodotWebRTCPeerConnection
data_channel_received = Signal "data_channel_received"

ice_candidate_created :: Signal GodotWebRTCPeerConnection
ice_candidate_created = Signal "ice_candidate_created"

session_description_created :: Signal GodotWebRTCPeerConnection
session_description_created = Signal "session_description_created"