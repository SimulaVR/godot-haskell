module Godot.Core.GodotGlobalConstants where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Gdnative.Types
import Godot.Api.Auto

pattern KEY_BACKTAB :: Int

pattern KEY_BACKTAB = 16777219

pattern KEY_BRACELEFT :: Int

pattern KEY_BRACELEFT = 123

pattern OP_MULTIPLY :: Int

pattern OP_MULTIPLY = 8

pattern KEY_LAUNCH1 :: Int

pattern KEY_LAUNCH1 = 16777305

pattern KEY_F2 :: Int

pattern KEY_F2 = 16777245

pattern TYPE_NIL :: Int

pattern TYPE_NIL = 0

pattern PROPERTY_USAGE_SCRIPT_VARIABLE :: Int

pattern PROPERTY_USAGE_SCRIPT_VARIABLE = 8192

pattern KEY_KP_ENTER :: Int

pattern KEY_KP_ENTER = 16777222

pattern KEY_LAUNCHA :: Int

pattern KEY_LAUNCHA = 16777314

pattern OP_EQUAL :: Int

pattern OP_EQUAL = 0

pattern TYPE_INT :: Int

pattern TYPE_INT = 2

pattern KEY_T :: Int

pattern KEY_T = 84

pattern KEY_MACRON :: Int

pattern KEY_MACRON = 175

pattern TYPE_VECTOR2 :: Int

pattern TYPE_VECTOR2 = 5

pattern OK :: Int

pattern OK = 0

pattern PROPERTY_USAGE_NETWORK :: Int

pattern PROPERTY_USAGE_NETWORK = 4

pattern PROPERTY_HINT_KEY_ACCEL :: Int

pattern PROPERTY_HINT_KEY_ACCEL = 7

pattern MIDI_MESSAGE_CONTROL_CHANGE :: Int

pattern MIDI_MESSAGE_CONTROL_CHANGE = 11

pattern KEY_D :: Int

pattern KEY_D = 68

pattern KEY_MODIFIER_MASK :: Int

pattern KEY_MODIFIER_MASK = -16777216

pattern KEY_KP_0 :: Int

pattern KEY_KP_0 = 16777350

pattern JOY_AXIS_3 :: Int

pattern JOY_AXIS_3 = 3

pattern KEY_CENT :: Int

pattern KEY_CENT = 162

pattern KEY_LAUNCHMAIL :: Int

pattern KEY_LAUNCHMAIL = 16777302

pattern CORNER_TOP_RIGHT :: Int

pattern CORNER_TOP_RIGHT = 1

pattern OP_MAX :: Int

pattern OP_MAX = 25

pattern SPKEY :: Int

pattern SPKEY = 16777216

pattern KEY_4 :: Int

pattern KEY_4 = 52

pattern TYPE_STRING_ARRAY :: Int

pattern TYPE_STRING_ARRAY = 23

pattern KEY_SUPER_R :: Int

pattern KEY_SUPER_R = 16777261

pattern KEY_DEGREE :: Int

pattern KEY_DEGREE = 176

pattern ERR_QUERY_FAILED :: Int

pattern ERR_QUERY_FAILED = 21

pattern JOY_BUTTON_5 :: Int

pattern JOY_BUTTON_5 = 5

pattern KEY_CURRENCY :: Int

pattern KEY_CURRENCY = 164

pattern PROPERTY_HINT_IMAGE_COMPRESS_LOSSLESS :: Int

pattern PROPERTY_HINT_IMAGE_COMPRESS_LOSSLESS = 22

pattern BUTTON_WHEEL_DOWN :: Int

pattern BUTTON_WHEEL_DOWN = 5

pattern VALIGN_TOP :: Int

pattern VALIGN_TOP = 0

pattern KEY_OPENURL :: Int

pattern KEY_OPENURL = 16777301

pattern KEY_F10 :: Int

pattern KEY_F10 = 16777253

pattern ERR_FILE_NOT_FOUND :: Int

pattern ERR_FILE_NOT_FOUND = 7

pattern KEY_IACUTE :: Int

pattern KEY_IACUTE = 205

pattern KEY_F9 :: Int

pattern KEY_F9 = 16777252

pattern MIDI_MESSAGE_PROGRAM_CHANGE :: Int

pattern MIDI_MESSAGE_PROGRAM_CHANGE = 12

pattern JOY_SONY_X :: Int

pattern JOY_SONY_X = 0

pattern ERR_BUSY :: Int

pattern ERR_BUSY = 44

pattern ERR_FILE_EOF :: Int

pattern ERR_FILE_EOF = 18

pattern KEY_BRACERIGHT :: Int

pattern KEY_BRACERIGHT = 125

pattern KEY_THORN :: Int

pattern KEY_THORN = 222

pattern BUTTON_MASK_MIDDLE :: Int

pattern BUTTON_MASK_MIDDLE = 4

pattern KEY_TAB :: Int

pattern KEY_TAB = 16777218

pattern KEY_YACUTE :: Int

pattern KEY_YACUTE = 221

pattern JOY_DPAD_DOWN :: Int

pattern JOY_DPAD_DOWN = 13

pattern KEY_PERIODCENTERED :: Int

pattern KEY_PERIODCENTERED = 183

pattern JOY_AXIS_8 :: Int

pattern JOY_AXIS_8 = 8

pattern KEY_O :: Int

pattern KEY_O = 79

pattern KEY_OTILDE :: Int

pattern KEY_OTILDE = 213

pattern ERR_FILE_BAD_DRIVE :: Int

pattern ERR_FILE_BAD_DRIVE = 8

pattern KEY_END :: Int

pattern KEY_END = 16777230

pattern KEY_PLUS :: Int

pattern KEY_PLUS = 43

pattern MARGIN_TOP :: Int

pattern MARGIN_TOP = 1

pattern KEY_GREATER :: Int

pattern KEY_GREATER = 62

pattern KEY_KP_6 :: Int

pattern KEY_KP_6 = 16777356

pattern JOY_AXIS_5 :: Int

pattern JOY_AXIS_5 = 5

pattern KEY_B :: Int

pattern KEY_B = 66

pattern KEY_NOBREAKSPACE :: Int

pattern KEY_NOBREAKSPACE = 160

pattern METHOD_FLAG_VIRTUAL :: Int

pattern METHOD_FLAG_VIRTUAL = 32

pattern JOY_R3 :: Int

pattern JOY_R3 = 9

pattern JOY_BUTTON_8 :: Int

pattern JOY_BUTTON_8 = 8

pattern KEY_2 :: Int

pattern KEY_2 = 50

pattern TYPE_INT_ARRAY :: Int

pattern TYPE_INT_ARRAY = 21

pattern PROPERTY_HINT_FILE :: Int

pattern PROPERTY_HINT_FILE = 13

pattern JOY_ANALOG_LX :: Int

pattern JOY_ANALOG_LX = 0

pattern MIDI_MESSAGE_NOTE_OFF :: Int

pattern MIDI_MESSAGE_NOTE_OFF = 8

pattern TYPE_VECTOR2_ARRAY :: Int

pattern TYPE_VECTOR2_ARRAY = 24

pattern OP_LESS_EQUAL :: Int

pattern OP_LESS_EQUAL = 3

pattern KEY_PAUSE :: Int

pattern KEY_PAUSE = 16777225

pattern JOY_BUTTON_11 :: Int

pattern JOY_BUTTON_11 = 11

pattern PROPERTY_USAGE_NOEDITOR :: Int

pattern PROPERTY_USAGE_NOEDITOR = 5

pattern BUTTON_LEFT :: Int

pattern BUTTON_LEFT = 1

pattern KEY_LAUNCH7 :: Int

pattern KEY_LAUNCH7 = 16777311

pattern MARGIN_LEFT :: Int

pattern MARGIN_LEFT = 0

pattern KEY_F4 :: Int

pattern KEY_F4 = 16777247

pattern METHOD_FLAG_EDITOR :: Int

pattern METHOD_FLAG_EDITOR = 2

pattern BUTTON_MASK_RIGHT :: Int

pattern BUTTON_MASK_RIGHT = 2

pattern TYPE_STRING :: Int

pattern TYPE_STRING = 4

pattern ERR_BUG :: Int

pattern ERR_BUG = 47

pattern KEY_ASCIICIRCUM :: Int

pattern KEY_ASCIICIRCUM = 94

pattern JOY_DS_A :: Int

pattern JOY_DS_A = 1

pattern KEY_R :: Int

pattern KEY_R = 82

pattern JOY_DPAD_RIGHT :: Int

pattern JOY_DPAD_RIGHT = 15

pattern TYPE_VECTOR3 :: Int

pattern TYPE_VECTOR3 = 7

pattern ERR_DATABASE_CANT_READ :: Int

pattern ERR_DATABASE_CANT_READ = 34

pattern KEY_ICIRCUMFLEX :: Int

pattern KEY_ICIRCUMFLEX = 206

pattern JOY_SONY_CIRCLE :: Int

pattern JOY_SONY_CIRCLE = 1

pattern JOY_AXIS_2 :: Int

pattern JOY_AXIS_2 = 2

pattern KEY_E :: Int

pattern KEY_E = 69

pattern KEY_KP_1 :: Int

pattern KEY_KP_1 = 16777351

pattern PROPERTY_USAGE_NO_INSTANCE_STATE :: Int

pattern PROPERTY_USAGE_NO_INSTANCE_STATE = 2048

pattern KEY_5 :: Int

pattern KEY_5 = 53

pattern OP_NOT :: Int

pattern OP_NOT = 23

pattern KEY_MASK_KPAD :: Int

pattern KEY_MASK_KPAD = 536870912

pattern OP_XOR :: Int

pattern OP_XOR = 22

pattern KEY_META :: Int

pattern KEY_META = 16777239

pattern ERR_INVALID_PARAMETER :: Int

pattern ERR_INVALID_PARAMETER = 31

pattern KEY_LAUNCH0 :: Int

pattern KEY_LAUNCH0 = 16777304

pattern KEY_F3 :: Int

pattern KEY_F3 = 16777246

pattern OP_BIT_XOR :: Int

pattern OP_BIT_XOR = 18

pattern METHOD_FLAG_FROM_SCRIPT :: Int

pattern METHOD_FLAG_FROM_SCRIPT = 64

pattern KEY_KP_ADD :: Int

pattern KEY_KP_ADD = 16777349

pattern BUTTON_WHEEL_RIGHT :: Int

pattern BUTTON_WHEEL_RIGHT = 7

pattern TYPE_NODE_PATH :: Int

pattern TYPE_NODE_PATH = 15

pattern KEY_U :: Int

pattern KEY_U = 85

pattern ERR_UNCONFIGURED :: Int

pattern ERR_UNCONFIGURED = 3

pattern JOY_XBOX_Y :: Int

pattern JOY_XBOX_Y = 3

pattern PROPERTY_HINT_LENGTH :: Int

pattern PROPERTY_HINT_LENGTH = 5

pattern KEY_STOP :: Int

pattern KEY_STOP = 16777282

pattern ERR_UNAVAILABLE :: Int

pattern ERR_UNAVAILABLE = 2

pattern ERR_ALREADY_IN_USE :: Int

pattern ERR_ALREADY_IN_USE = 22

pattern JOY_DPAD_UP :: Int

pattern JOY_DPAD_UP = 12

pattern KEY_X :: Int

pattern KEY_X = 88

pattern KEY_QUOTEDBL :: Int

pattern KEY_QUOTEDBL = 34

pattern KEY_REGISTERED :: Int

pattern KEY_REGISTERED = 174

pattern KEY_H :: Int

pattern KEY_H = 72

pattern KEY_DIRECTION_R :: Int

pattern KEY_DIRECTION_R = 16777267

pattern KEY_RIGHT :: Int

pattern KEY_RIGHT = 16777233

pattern JOY_ANALOG_L2 :: Int

pattern JOY_ANALOG_L2 = 6

pattern JOY_BUTTON_2 :: Int

pattern JOY_BUTTON_2 = 2

pattern KEY_GUILLEMOTRIGHT :: Int

pattern KEY_GUILLEMOTRIGHT = 187

pattern PROPERTY_USAGE_RESTART_IF_CHANGED :: Int

pattern PROPERTY_USAGE_RESTART_IF_CHANGED = 4096

pattern KEY_MEDIAPLAY :: Int

pattern KEY_MEDIAPLAY = 16777292

pattern BUTTON_WHEEL_UP :: Int

pattern BUTTON_WHEEL_UP = 4

pattern KEY_8 :: Int

pattern KEY_8 = 56

pattern ERR_PARSE_ERROR :: Int

pattern ERR_PARSE_ERROR = 43

pattern KEY_KP_MULTIPLY :: Int

pattern KEY_KP_MULTIPLY = 16777345

pattern JOY_BUTTON_10 :: Int

pattern JOY_BUTTON_10 = 10

pattern KEY_EACUTE :: Int

pattern KEY_EACUTE = 201

pattern KEY_LAUNCH6 :: Int

pattern KEY_LAUNCH6 = 16777310

pattern KEY_F5 :: Int

pattern KEY_F5 = 16777248

pattern MIDI_MESSAGE_AFTERTOUCH :: Int

pattern MIDI_MESSAGE_AFTERTOUCH = 10

pattern KEY_UACUTE :: Int

pattern KEY_UACUTE = 218

pattern KEY_THREESUPERIOR :: Int

pattern KEY_THREESUPERIOR = 179

pattern TYPE_VECTOR3_ARRAY :: Int

pattern TYPE_VECTOR3_ARRAY = 25

pattern KEY_OCIRCUMFLEX :: Int

pattern KEY_OCIRCUMFLEX = 212

pattern KEY_LAUNCHF :: Int

pattern KEY_LAUNCHF = 16777319

pattern CORNER_BOTTOM_LEFT :: Int

pattern CORNER_BOTTOM_LEFT = 3

pattern PROPERTY_HINT_DIR :: Int

pattern PROPERTY_HINT_DIR = 14

pattern JOY_XBOX_B :: Int

pattern JOY_XBOX_B = 1

pattern KEY_ARING :: Int

pattern KEY_ARING = 197

pattern KEY_S :: Int

pattern KEY_S = 83

pattern KEY_SEMICOLON :: Int

pattern KEY_SEMICOLON = 59

pattern MIDI_MESSAGE_CHANNEL_PRESSURE :: Int

pattern MIDI_MESSAGE_CHANNEL_PRESSURE = 13

pattern KEY_BRACKETLEFT :: Int

pattern KEY_BRACKETLEFT = 91

pattern PROPERTY_HINT_FLAGS :: Int

pattern PROPERTY_HINT_FLAGS = 8

pattern OP_AND :: Int

pattern OP_AND = 20

pattern KEY_PARENLEFT :: Int

pattern KEY_PARENLEFT = 40

pattern PROPERTY_USAGE_EDITOR :: Int

pattern PROPERTY_USAGE_EDITOR = 2

pattern KEY_KP_7 :: Int

pattern KEY_KP_7 = 16777357

pattern JOY_AXIS_4 :: Int

pattern JOY_AXIS_4 = 4

pattern KEY_HYPER_R :: Int

pattern KEY_HYPER_R = 16777264

pattern KEY_C :: Int

pattern KEY_C = 67

pattern OP_BIT_AND :: Int

pattern OP_BIT_AND = 16

pattern JOY_R2 :: Int

pattern JOY_R2 = 7

pattern KEY_MEDIANEXT :: Int

pattern KEY_MEDIANEXT = 16777295

pattern KEY_BACK :: Int

pattern KEY_BACK = 16777280

pattern JOY_BUTTON_9 :: Int

pattern JOY_BUTTON_9 = 9

pattern KEY_MASK_SHIFT :: Int

pattern KEY_MASK_SHIFT = 33554432

pattern KEY_3 :: Int

pattern KEY_3 = 51

pattern KEY_SSHARP :: Int

pattern KEY_SSHARP = 223

pattern JOY_ANALOG_LY :: Int

pattern JOY_ANALOG_LY = 1

pattern KEY_SCROLLLOCK :: Int

pattern KEY_SCROLLLOCK = 16777243

pattern PROPERTY_HINT_GLOBAL_FILE :: Int

pattern PROPERTY_HINT_GLOBAL_FILE = 15

pattern KEY_CODE_MASK :: Int

pattern KEY_CODE_MASK = 33554431

pattern JOY_ANALOG_R2 :: Int

pattern JOY_ANALOG_R2 = 7

pattern ERR_LINK_FAILED :: Int

pattern ERR_LINK_FAILED = 38

pattern JOY_BUTTON_15 :: Int

pattern JOY_BUTTON_15 = 15

pattern KEY_LAUNCH3 :: Int

pattern KEY_LAUNCH3 = 16777307

pattern JOY_BUTTON_MAX :: Int

pattern JOY_BUTTON_MAX = 16

pattern PROPERTY_USAGE_CHECKABLE :: Int

pattern PROPERTY_USAGE_CHECKABLE = 16

pattern KEY_PAGEUP :: Int

pattern KEY_PAGEUP = 16777235

pattern METHOD_FLAG_CONST :: Int

pattern METHOD_FLAG_CONST = 8

pattern OP_STRING_CONCAT :: Int

pattern OP_STRING_CONCAT = 13

pattern TYPE_ARRAY :: Int

pattern TYPE_ARRAY = 19

pattern ERR_FILE_BAD_PATH :: Int

pattern ERR_FILE_BAD_PATH = 9

pattern KEY_LAUNCHC :: Int

pattern KEY_LAUNCHC = 16777316

pattern KEY_SEARCH :: Int

pattern KEY_SEARCH = 16777299

pattern KEY_IDIAERESIS :: Int

pattern KEY_IDIAERESIS = 207

pattern KEY_BACKSLASH :: Int

pattern KEY_BACKSLASH = 92

pattern KEY_DIRECTION_L :: Int

pattern KEY_DIRECTION_L = 16777266

pattern KEY_V :: Int

pattern KEY_V = 86

pattern KEY_YDIAERESIS :: Int

pattern KEY_YDIAERESIS = 255

pattern KEY_KP_2 :: Int

pattern KEY_KP_2 = 16777352

pattern JOY_AXIS_1 :: Int

pattern JOY_AXIS_1 = 1

pattern KEY_F :: Int

pattern KEY_F = 70

pattern KEY_BASSUP :: Int

pattern KEY_BASSUP = 16777288

pattern KEY_BASSBOOST :: Int

pattern KEY_BASSBOOST = 16777287

pattern KEY_NTILDE :: Int

pattern KEY_NTILDE = 209

pattern ERR_METHOD_NOT_FOUND :: Int

pattern ERR_METHOD_NOT_FOUND = 37

pattern KEY_IGRAVE :: Int

pattern KEY_IGRAVE = 204

pattern KEY_QUESTION :: Int

pattern KEY_QUESTION = 63

pattern KEY_6 :: Int

pattern KEY_6 = 54

pattern KEY_EXCLAM :: Int

pattern KEY_EXCLAM = 33

pattern KEY_KP_PERIOD :: Int

pattern KEY_KP_PERIOD = 16777348

pattern KEY_I :: Int

pattern KEY_I = 73

pattern KEY_ECIRCUMFLEX :: Int

pattern KEY_ECIRCUMFLEX = 202

pattern OP_ADD :: Int

pattern OP_ADD = 6

pattern ERR_FILE_MISSING_DEPENDENCIES :: Int

pattern ERR_FILE_MISSING_DEPENDENCIES = 17

pattern PROPERTY_HINT_LAYERS_2D_PHYSICS :: Int

pattern PROPERTY_HINT_LAYERS_2D_PHYSICS = 10

pattern JOY_BUTTON_3 :: Int

pattern JOY_BUTTON_3 = 3

pattern KEY_QUOTELEFT :: Int

pattern KEY_QUOTELEFT = 96

pattern ERR_FILE_CANT_WRITE :: Int

pattern ERR_FILE_CANT_WRITE = 13

pattern KEY_9 :: Int

pattern KEY_9 = 57

pattern HALIGN_CENTER :: Int

pattern HALIGN_CENTER = 1

pattern ERR_DOES_NOT_EXIST :: Int

pattern ERR_DOES_NOT_EXIST = 33

pattern TYPE_BOOL :: Int

pattern TYPE_BOOL = 1

pattern PROPERTY_USAGE_STORE_IF_NONONE :: Int

pattern PROPERTY_USAGE_STORE_IF_NONONE = 1024

pattern KEY_F16 :: Int

pattern KEY_F16 = 16777259

pattern PROPERTY_HINT_EXP_EASING :: Int

pattern PROPERTY_HINT_EXP_EASING = 4

pattern KEY_DIVISION :: Int

pattern KEY_DIVISION = 247

pattern KEY_DELETE :: Int

pattern KEY_DELETE = 16777224

pattern JOY_XBOX_X :: Int

pattern JOY_XBOX_X = 2

pattern KEY_BAR :: Int

pattern KEY_BAR = 124

pattern HALIGN_LEFT :: Int

pattern HALIGN_LEFT = 0

pattern JOY_SONY_TRIANGLE :: Int

pattern JOY_SONY_TRIANGLE = 3

pattern KEY_OACUTE :: Int

pattern KEY_OACUTE = 211

pattern MARGIN_RIGHT :: Int

pattern MARGIN_RIGHT = 2

pattern KEY_SECTION :: Int

pattern KEY_SECTION = 167

pattern ERR_TIMEOUT :: Int

pattern ERR_TIMEOUT = 24

pattern BUTTON_RIGHT :: Int

pattern BUTTON_RIGHT = 2

pattern KEY_Y :: Int

pattern KEY_Y = 89

pattern ERR_SCRIPT_FAILED :: Int

pattern ERR_SCRIPT_FAILED = 39

pattern KEY_ETH :: Int

pattern KEY_ETH = 208

pattern KEY_ALT :: Int

pattern KEY_ALT = 16777240

pattern JOY_R :: Int

pattern JOY_R = 5

pattern KEY_UCIRCUMFLEX :: Int

pattern KEY_UCIRCUMFLEX = 219

pattern OP_LESS :: Int

pattern OP_LESS = 2

pattern ERR_INVALID_DATA :: Int

pattern ERR_INVALID_DATA = 30

pattern ERR_OUT_OF_MEMORY :: Int

pattern ERR_OUT_OF_MEMORY = 6

pattern KEY_HOMEPAGE :: Int

pattern KEY_HOMEPAGE = 16777297

pattern OP_SUBTRACT :: Int

pattern OP_SUBTRACT = 7

pattern KEY_KP_8 :: Int

pattern KEY_KP_8 = 16777358

pattern JOY_ANALOG_RX :: Int

pattern JOY_ANALOG_RX = 2

pattern KEY_L :: Int

pattern KEY_L = 76

pattern KEY_MEDIASTOP :: Int

pattern KEY_MEDIASTOP = 16777293

pattern MIDI_MESSAGE_NOTE_ON :: Int

pattern MIDI_MESSAGE_NOTE_ON = 9

pattern KEY_MULTIPLY :: Int

pattern KEY_MULTIPLY = 215

pattern KEY_STERLING :: Int

pattern KEY_STERLING = 163

pattern OP_NEGATE :: Int

pattern OP_NEGATE = 10

pattern JOY_BUTTON_6 :: Int

pattern JOY_BUTTON_6 = 6

pattern PROPERTY_HINT_COLOR_NO_ALPHA :: Int

pattern PROPERTY_HINT_COLOR_NO_ALPHA = 20

pattern KEY_AE :: Int

pattern KEY_AE = 198

pattern KEY_MINUS :: Int

pattern KEY_MINUS = 45

pattern BUTTON_MIDDLE :: Int

pattern BUTTON_MIDDLE = 3

pattern KEY_F13 :: Int

pattern KEY_F13 = 16777256

pattern KEY_LAUNCH9 :: Int

pattern KEY_LAUNCH9 = 16777313

pattern KEY_EXCLAMDOWN :: Int

pattern KEY_EXCLAMDOWN = 161

pattern ERR_PARAMETER_RANGE_ERROR :: Int

pattern ERR_PARAMETER_RANGE_ERROR = 5

pattern KEY_QUESTIONDOWN :: Int

pattern KEY_QUESTIONDOWN = 191

pattern TYPE_COLOR_ARRAY :: Int

pattern TYPE_COLOR_ARRAY = 26

pattern KEY_EQUAL :: Int

pattern KEY_EQUAL = 61

pattern OP_BIT_NEGATE :: Int

pattern OP_BIT_NEGATE = 19

pattern JOY_L3 :: Int

pattern JOY_L3 = 8

pattern OP_SHIFT_LEFT :: Int

pattern OP_SHIFT_LEFT = 14

pattern KEY_SPACE :: Int

pattern KEY_SPACE = 32

pattern PROPERTY_USAGE_STORE_IF_NONZERO :: Int

pattern PROPERTY_USAGE_STORE_IF_NONZERO = 512

pattern CORNER_TOP_LEFT :: Int

pattern CORNER_TOP_LEFT = 0

pattern KEY_HOME :: Int

pattern KEY_HOME = 16777229

pattern KEY_MASCULINE :: Int

pattern KEY_MASCULINE = 186

pattern ERR_COMPILATION_FAILED :: Int

pattern ERR_COMPILATION_FAILED = 36

pattern KEY_W :: Int

pattern KEY_W = 87

pattern VALIGN_CENTER :: Int

pattern VALIGN_CENTER = 1

pattern KEY_KP_3 :: Int

pattern KEY_KP_3 = 16777353

pattern PROPERTY_HINT_GLOBAL_DIR :: Int

pattern PROPERTY_HINT_GLOBAL_DIR = 16

pattern JOY_AXIS_0 :: Int

pattern JOY_AXIS_0 = 0

pattern KEY_G :: Int

pattern KEY_G = 71

pattern TYPE_DICTIONARY :: Int

pattern TYPE_DICTIONARY = 18

pattern KEY_FAVORITES :: Int

pattern KEY_FAVORITES = 16777298

pattern JOY_L :: Int

pattern JOY_L = 4

pattern KEY_DIAERESIS :: Int

pattern KEY_DIAERESIS = 168

pattern PROPERTY_HINT_IMAGE_COMPRESS_LOSSY :: Int

pattern PROPERTY_HINT_IMAGE_COMPRESS_LOSSY = 21

pattern KEY_ONEHALF :: Int

pattern KEY_ONEHALF = 189

pattern KEY_7 :: Int

pattern KEY_7 = 55

pattern KEY_INSERT :: Int

pattern KEY_INSERT = 16777223

pattern KEY_STANDBY :: Int

pattern KEY_STANDBY = 16777300

pattern OP_IN :: Int

pattern OP_IN = 24

pattern PROPERTY_HINT_ENUM :: Int

pattern PROPERTY_HINT_ENUM = 3

pattern KEY_BACKSPACE :: Int

pattern KEY_BACKSPACE = 16777220

pattern TYPE_AABB :: Int

pattern TYPE_AABB = 11

pattern KEY_KP_DIVIDE :: Int

pattern KEY_KP_DIVIDE = 16777346

pattern JOY_BUTTON_14 :: Int

pattern JOY_BUTTON_14 = 14

pattern OP_SHIFT_RIGHT :: Int

pattern OP_SHIFT_RIGHT = 15

pattern KEY_LAUNCH2 :: Int

pattern KEY_LAUNCH2 = 16777306

pattern KEY_F1 :: Int

pattern KEY_F1 = 16777244

pattern KEY_CONTROL :: Int

pattern KEY_CONTROL = 16777238

pattern KEY_AACUTE :: Int

pattern KEY_AACUTE = 193

pattern KEY_SYSREQ :: Int

pattern KEY_SYSREQ = 16777227

pattern KEY_LAUNCHB :: Int

pattern KEY_LAUNCHB = 16777315

pattern PROPERTY_USAGE_CATEGORY :: Int

pattern PROPERTY_USAGE_CATEGORY = 256

pattern PROPERTY_USAGE_INTERNATIONALIZED :: Int

pattern PROPERTY_USAGE_INTERNATIONALIZED = 64

pattern TYPE_OBJECT :: Int

pattern TYPE_OBJECT = 17

pattern KEY_CAPSLOCK :: Int

pattern KEY_CAPSLOCK = 16777241

pattern KEY_UGRAVE :: Int

pattern KEY_UGRAVE = 217

pattern JOY_DS_Y :: Int

pattern JOY_DS_Y = 2

pattern KEY_CEDILLA :: Int

pattern KEY_CEDILLA = 184

pattern KEY_ORDFEMININE :: Int

pattern KEY_ORDFEMININE = 170

pattern KEY_Z :: Int

pattern KEY_Z = 90

pattern PROPERTY_USAGE_EDITOR_HELPER :: Int

pattern PROPERTY_USAGE_EDITOR_HELPER = 8

pattern ERR_CYCLIC_LINK :: Int

pattern ERR_CYCLIC_LINK = 40

pattern KEY_EGRAVE :: Int

pattern KEY_EGRAVE = 200

pattern KEY_DOWN :: Int

pattern KEY_DOWN = 16777234

pattern OP_MODULE :: Int

pattern OP_MODULE = 12

pattern KEY_MASK_ALT :: Int

pattern KEY_MASK_ALT = 67108864

pattern KEY_J :: Int

pattern KEY_J = 74

pattern KEY_SUPER_L :: Int

pattern KEY_SUPER_L = 16777260

pattern HALIGN_RIGHT :: Int

pattern HALIGN_RIGHT = 2

pattern JOY_BUTTON_0 :: Int

pattern JOY_BUTTON_0 = 0

pattern KEY_TREBLEDOWN :: Int

pattern KEY_TREBLEDOWN = 16777291

pattern KEY_EDIAERESIS :: Int

pattern KEY_EDIAERESIS = 203

pattern KEY_MASK_CTRL :: Int

pattern KEY_MASK_CTRL = 268435456

pattern OP_GREATER :: Int

pattern OP_GREATER = 4

pattern KEY_HYPHEN :: Int

pattern KEY_HYPHEN = 173

pattern KEY_YEN :: Int

pattern KEY_YEN = 165

pattern ERR_DATABASE_CANT_WRITE :: Int

pattern ERR_DATABASE_CANT_WRITE = 35

pattern TYPE_COLOR :: Int

pattern TYPE_COLOR = 14

pattern VERTICAL :: Int

pattern VERTICAL = 1

pattern KEY_VOLUMEDOWN :: Int

pattern KEY_VOLUMEDOWN = 16777284

pattern KEY_F15 :: Int

pattern KEY_F15 = 16777258

pattern KEY_UDIAERESIS :: Int

pattern KEY_UDIAERESIS = 220

pattern KEY_REFRESH :: Int

pattern KEY_REFRESH = 16777283

pattern KEY_SLASH :: Int

pattern KEY_SLASH = 47

pattern PROPERTY_HINT_PLACEHOLDER_TEXT :: Int

pattern PROPERTY_HINT_PLACEHOLDER_TEXT = 19

pattern KEY_F12 :: Int

pattern KEY_F12 = 16777255

pattern PROPERTY_USAGE_GROUP :: Int

pattern PROPERTY_USAGE_GROUP = 128

pattern OP_OR :: Int

pattern OP_OR = 21

pattern KEY_COPYRIGHT :: Int

pattern KEY_COPYRIGHT = 169

pattern KEY_LAUNCH8 :: Int

pattern KEY_LAUNCH8 = 16777312

pattern PROPERTY_USAGE_CHECKED :: Int

pattern PROPERTY_USAGE_CHECKED = 32

pattern OP_BIT_OR :: Int

pattern OP_BIT_OR = 17

pattern KEY_COMMA :: Int

pattern KEY_COMMA = 44

pattern TYPE_BASIS :: Int

pattern TYPE_BASIS = 12

pattern KEY_NUMLOCK :: Int

pattern KEY_NUMLOCK = 16777242

pattern KEY_VOLUMEUP :: Int

pattern KEY_VOLUMEUP = 16777286

pattern METHOD_FLAG_NOSCRIPT :: Int

pattern METHOD_FLAG_NOSCRIPT = 4

pattern JOY_L2 :: Int

pattern JOY_L2 = 6

pattern TYPE_REAL :: Int

pattern TYPE_REAL = 3

pattern TYPE_TRANSFORM2D :: Int

pattern TYPE_TRANSFORM2D = 8

pattern KEY_HYPER_L :: Int

pattern KEY_HYPER_L = 16777263

pattern KEY_UP :: Int

pattern KEY_UP = 16777232

pattern TYPE_RAW_ARRAY :: Int

pattern TYPE_RAW_ARRAY = 20

pattern KEY_PERIOD :: Int

pattern KEY_PERIOD = 46

pattern KEY_ACIRCUMFLEX :: Int

pattern KEY_ACIRCUMFLEX = 194

pattern TYPE_RECT2 :: Int

pattern TYPE_RECT2 = 6

pattern KEY_KP_9 :: Int

pattern KEY_KP_9 = 16777359

pattern JOY_ANALOG_RY :: Int

pattern JOY_ANALOG_RY = 3

pattern KEY_M :: Int

pattern KEY_M = 77

pattern KEY_MEDIAPREVIOUS :: Int

pattern KEY_MEDIAPREVIOUS = 16777294

pattern KEY_AT :: Int

pattern KEY_AT = 64

pattern KEY_TREBLEUP :: Int

pattern KEY_TREBLEUP = 16777290

pattern JOY_BUTTON_7 :: Int

pattern JOY_BUTTON_7 = 7

pattern BUTTON_MASK_XBUTTON1 :: Int

pattern BUTTON_MASK_XBUTTON1 = 128

pattern BUTTON_XBUTTON2 :: Int

pattern BUTTON_XBUTTON2 = 9

pattern KEY_0 :: Int

pattern KEY_0 = 48

pattern KEY_UNDERSCORE :: Int

pattern KEY_UNDERSCORE = 95

pattern PROPERTY_HINT_LAYERS_2D_RENDER :: Int

pattern PROPERTY_HINT_LAYERS_2D_RENDER = 9

pattern KEY_ENTER :: Int

pattern KEY_ENTER = 16777221

pattern KEY_ASTERISK :: Int

pattern KEY_ASTERISK = 42

pattern KEY_UNKNOWN :: Int

pattern KEY_UNKNOWN = 33554431

pattern KEY_PARENRIGHT :: Int

pattern KEY_PARENRIGHT = 41

pattern JOY_BUTTON_13 :: Int

pattern JOY_BUTTON_13 = 13

pattern PROPERTY_HINT_LAYERS_3D_PHYSICS :: Int

pattern PROPERTY_HINT_LAYERS_3D_PHYSICS = 12

pattern KEY_LAUNCH5 :: Int

pattern KEY_LAUNCH5 = 16777309

pattern KEY_F6 :: Int

pattern KEY_F6 = 16777249

pattern CORNER_BOTTOM_RIGHT :: Int

pattern CORNER_BOTTOM_RIGHT = 2

pattern ERR_FILE_CANT_OPEN :: Int

pattern ERR_FILE_CANT_OPEN = 12

pattern KEY_LAUNCHE :: Int

pattern KEY_LAUNCHE = 16777318

pattern KEY_NUMBERSIGN :: Int

pattern KEY_NUMBERSIGN = 35

pattern JOY_XBOX_A :: Int

pattern JOY_XBOX_A = 0

pattern KEY_KP_SUBTRACT :: Int

pattern KEY_KP_SUBTRACT = 16777347

pattern KEY_SHIFT :: Int

pattern KEY_SHIFT = 16777237

pattern KEY_P :: Int

pattern KEY_P = 80

pattern ERR_CANT_ACQUIRE_RESOURCE :: Int

pattern ERR_CANT_ACQUIRE_RESOURCE = 28

pattern METHOD_FLAG_NORMAL :: Int

pattern METHOD_FLAG_NORMAL = 1

pattern KEY_OGRAVE :: Int

pattern KEY_OGRAVE = 210

pattern TYPE_RID :: Int

pattern TYPE_RID = 16

pattern KEY_ODIAERESIS :: Int

pattern KEY_ODIAERESIS = 214

pattern ERR_FILE_UNRECOGNIZED :: Int

pattern ERR_FILE_UNRECOGNIZED = 15

pattern KEY_DOLLAR :: Int

pattern KEY_DOLLAR = 36

pattern KEY_KP_4 :: Int

pattern KEY_KP_4 = 16777354

pattern JOY_AXIS_7 :: Int

pattern JOY_AXIS_7 = 7

pattern KEY_BRACKETRIGHT :: Int

pattern KEY_BRACKETRIGHT = 93

pattern KEY_MU :: Int

pattern KEY_MU = 181

pattern KEY_ONEQUARTER :: Int

pattern KEY_ONEQUARTER = 188

pattern ERR_LOCKED :: Int

pattern ERR_LOCKED = 23

pattern TYPE_REAL_ARRAY :: Int

pattern TYPE_REAL_ARRAY = 22

pattern ERR_ALREADY_EXISTS :: Int

pattern ERR_ALREADY_EXISTS = 32

pattern ERR_HELP :: Int

pattern ERR_HELP = 46

pattern PROPERTY_USAGE_STORAGE :: Int

pattern PROPERTY_USAGE_STORAGE = 1

pattern JOY_START :: Int

pattern JOY_START = 11

pattern KEY_K :: Int

pattern KEY_K = 75

pattern OP_DIVIDE :: Int

pattern OP_DIVIDE = 9

pattern FAILED :: Int

pattern FAILED = 1

pattern JOY_BUTTON_1 :: Int

pattern JOY_BUTTON_1 = 1

pattern KEY_PERCENT :: Int

pattern KEY_PERCENT = 37

pattern PROPERTY_HINT_RANGE :: Int

pattern PROPERTY_HINT_RANGE = 1

pattern KEY_LEFT :: Int

pattern KEY_LEFT = 16777231

pattern KEY_F14 :: Int

pattern KEY_F14 = 16777257

pattern METHOD_FLAGS_DEFAULT :: Int

pattern METHOD_FLAGS_DEFAULT = 1

pattern JOY_AXIS_MAX :: Int

pattern JOY_AXIS_MAX = 10

pattern METHOD_FLAG_REVERSE :: Int

pattern METHOD_FLAG_REVERSE = 16

pattern KEY_GUILLEMOTLEFT :: Int

pattern KEY_GUILLEMOTLEFT = 171

pattern TYPE_TRANSFORM :: Int

pattern TYPE_TRANSFORM = 13

pattern JOY_DS_X :: Int

pattern JOY_DS_X = 3

pattern OP_POSITIVE :: Int

pattern OP_POSITIVE = 11

pattern KEY_FORWARD :: Int

pattern KEY_FORWARD = 16777281

pattern KEY_AMPERSAND :: Int

pattern KEY_AMPERSAND = 38

pattern TYPE_MAX :: Int

pattern TYPE_MAX = 27

pattern KEY_MENU :: Int

pattern KEY_MENU = 16777262

pattern JOY_SELECT :: Int

pattern JOY_SELECT = 10

pattern VALIGN_BOTTOM :: Int

pattern VALIGN_BOTTOM = 2

pattern ERR_UNAUTHORIZED :: Int

pattern ERR_UNAUTHORIZED = 4

pattern JOY_DPAD_LEFT :: Int

pattern JOY_DPAD_LEFT = 14

pattern KEY_PARAGRAPH :: Int

pattern KEY_PARAGRAPH = 182

pattern KEY_NOTSIGN :: Int

pattern KEY_NOTSIGN = 172

pattern TYPE_QUAT :: Int

pattern TYPE_QUAT = 10

pattern KEY_N :: Int

pattern KEY_N = 78

pattern ERR_FILE_CANT_READ :: Int

pattern ERR_FILE_CANT_READ = 14

pattern JOY_AXIS_9 :: Int

pattern JOY_AXIS_9 = 9

pattern KEY_AGRAVE :: Int

pattern KEY_AGRAVE = 192

pattern JOY_BUTTON_4 :: Int

pattern JOY_BUTTON_4 = 4

pattern KEY_BROKENBAR :: Int

pattern KEY_BROKENBAR = 166

pattern ERR_FILE_NO_PERMISSION :: Int

pattern ERR_FILE_NO_PERMISSION = 10

pattern BUTTON_WHEEL_LEFT :: Int

pattern BUTTON_WHEEL_LEFT = 6

pattern BUTTON_MASK_XBUTTON2 :: Int

pattern BUTTON_MASK_XBUTTON2 = 256

pattern KEY_PLUSMINUS :: Int

pattern KEY_PLUSMINUS = 177

pattern JOY_SONY_SQUARE :: Int

pattern JOY_SONY_SQUARE = 2

pattern ERR_FILE_CORRUPT :: Int

pattern ERR_FILE_CORRUPT = 16

pattern BUTTON_XBUTTON1 :: Int

pattern BUTTON_XBUTTON1 = 8

pattern KEY_F11 :: Int

pattern KEY_F11 = 16777254

pattern OP_NOT_EQUAL :: Int

pattern OP_NOT_EQUAL = 1

pattern KEY_OOBLIQUE :: Int

pattern KEY_OOBLIQUE = 216

pattern MIDI_MESSAGE_PITCH_BEND :: Int

pattern MIDI_MESSAGE_PITCH_BEND = 14

pattern HORIZONTAL :: Int

pattern HORIZONTAL = 0

pattern KEY_ACUTE :: Int

pattern KEY_ACUTE = 180

pattern KEY_F8 :: Int

pattern KEY_F8 = 16777251

pattern KEY_ADIAERESIS :: Int

pattern KEY_ADIAERESIS = 196

pattern MARGIN_BOTTOM :: Int

pattern MARGIN_BOTTOM = 3

pattern PROPERTY_HINT_NONE :: Int

pattern PROPERTY_HINT_NONE = 0

pattern KEY_MASK_META :: Int

pattern KEY_MASK_META = 134217728

pattern KEY_MASK_GROUP_SWITCH :: Int

pattern KEY_MASK_GROUP_SWITCH = 1073741824

pattern KEY_COLON :: Int

pattern KEY_COLON = 58

pattern KEY_HELP :: Int

pattern KEY_HELP = 16777265

pattern KEY_LAUNCHD :: Int

pattern KEY_LAUNCHD = 16777317

pattern KEY_ONESUPERIOR :: Int

pattern KEY_ONESUPERIOR = 185

pattern KEY_BASSDOWN :: Int

pattern KEY_BASSDOWN = 16777289

pattern KEY_ATILDE :: Int

pattern KEY_ATILDE = 195

pattern PROPERTY_HINT_MULTILINE_TEXT :: Int

pattern PROPERTY_HINT_MULTILINE_TEXT = 18

pattern KEY_LAUNCHMEDIA :: Int

pattern KEY_LAUNCHMEDIA = 16777303

pattern JOY_DS_B :: Int

pattern JOY_DS_B = 0

pattern KEY_MEDIARECORD :: Int

pattern KEY_MEDIARECORD = 16777296

pattern KEY_Q :: Int

pattern KEY_Q = 81

pattern BUTTON_MASK_LEFT :: Int

pattern BUTTON_MASK_LEFT = 1

pattern KEY_CCEDILLA :: Int

pattern KEY_CCEDILLA = 199

pattern ERR_CANT_CREATE :: Int

pattern ERR_CANT_CREATE = 20

pattern PROPERTY_HINT_EXP_RANGE :: Int

pattern PROPERTY_HINT_EXP_RANGE = 2

pattern OP_GREATER_EQUAL :: Int

pattern OP_GREATER_EQUAL = 5

pattern KEY_KP_5 :: Int

pattern KEY_KP_5 = 16777355

pattern KEY_APOSTROPHE :: Int

pattern KEY_APOSTROPHE = 39

pattern JOY_AXIS_6 :: Int

pattern JOY_AXIS_6 = 6

pattern KEY_A :: Int

pattern KEY_A = 65

pattern KEY_THREEQUARTERS :: Int

pattern KEY_THREEQUARTERS = 190

pattern PROPERTY_USAGE_DEFAULT :: Int

pattern PROPERTY_USAGE_DEFAULT = 7

pattern KEY_LESS :: Int

pattern KEY_LESS = 60

pattern KEY_CLEAR :: Int

pattern KEY_CLEAR = 16777228

pattern PROPERTY_HINT_RESOURCE_TYPE :: Int

pattern PROPERTY_HINT_RESOURCE_TYPE = 17

pattern KEY_ESCAPE :: Int

pattern KEY_ESCAPE = 16777217

pattern KEY_1 :: Int

pattern KEY_1 = 49

pattern KEY_PAGEDOWN :: Int

pattern KEY_PAGEDOWN = 16777236

pattern KEY_TWOSUPERIOR :: Int

pattern KEY_TWOSUPERIOR = 178

pattern PROPERTY_HINT_LAYERS_3D_RENDER :: Int

pattern PROPERTY_HINT_LAYERS_3D_RENDER = 11

pattern PROPERTY_USAGE_DEFAULT_INTL :: Int

pattern PROPERTY_USAGE_DEFAULT_INTL = 71

pattern TYPE_PLANE :: Int

pattern TYPE_PLANE = 9

pattern JOY_BUTTON_12 :: Int

pattern JOY_BUTTON_12 = 12

pattern KEY_PRINT :: Int

pattern KEY_PRINT = 16777226

pattern ERR_FILE_ALREADY_IN_USE :: Int

pattern ERR_FILE_ALREADY_IN_USE = 11

pattern KEY_LAUNCH4 :: Int

pattern KEY_LAUNCH4 = 16777308

pattern KEY_F7 :: Int

pattern KEY_F7 = 16777250

pattern KEY_ASCIITILDE :: Int

pattern KEY_ASCIITILDE = 126

pattern KEY_MASK_CMD :: Int

pattern KEY_MASK_CMD = 268435456

pattern KEY_VOLUMEMUTE :: Int

pattern KEY_VOLUMEMUTE = 16777285

pattern ERR_CANT_OPEN :: Int

pattern ERR_CANT_OPEN = 19