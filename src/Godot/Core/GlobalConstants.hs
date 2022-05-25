{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.GlobalConstants
       (Godot.Core.GlobalConstants._KEY_6,
        Godot.Core.GlobalConstants._KEY_LAUNCH1,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_STORAGE,
        Godot.Core.GlobalConstants._KEY_MASK_SHIFT,
        Godot.Core.GlobalConstants._KEY_DIRECTION_R,
        Godot.Core.GlobalConstants._KEY_KP_MULTIPLY,
        Godot.Core.GlobalConstants._FAILED,
        Godot.Core.GlobalConstants._JOY_SONY_X,
        Godot.Core.GlobalConstants._KEY_V,
        Godot.Core.GlobalConstants._KEY_SUPER_R,
        Godot.Core.GlobalConstants._ERR_UNAVAILABLE,
        Godot.Core.GlobalConstants._KEY_IACUTE,
        Godot.Core.GlobalConstants._KEY_BROKENBAR,
        Godot.Core.GlobalConstants._BUTTON_MASK_RIGHT,
        Godot.Core.GlobalConstants._KEY_OTILDE,
        Godot.Core.GlobalConstants._ERR_PARSE_ERROR,
        Godot.Core.GlobalConstants._KEY_MASK_META,
        Godot.Core.GlobalConstants._MIDI_MESSAGE_CONTROL_CHANGE,
        Godot.Core.GlobalConstants._BUTTON_RIGHT,
        Godot.Core.GlobalConstants._KEY_F14,
        Godot.Core.GlobalConstants._KEY_COLON,
        Godot.Core.GlobalConstants._OP_STRING_CONCAT,
        Godot.Core.GlobalConstants._OP_OR,
        Godot.Core.GlobalConstants._JOY_VR_ANALOG_TRIGGER,
        Godot.Core.GlobalConstants._KEY_OPENURL,
        Godot.Core.GlobalConstants._ERR_CANT_FORK,
        Godot.Core.GlobalConstants._JOY_BUTTON_8,
        Godot.Core.GlobalConstants._KEY_MU,
        Godot.Core.GlobalConstants._KEY_BRACKETLEFT,
        Godot.Core.GlobalConstants._JOY_AXIS_3,
        Godot.Core.GlobalConstants._MIDI_MESSAGE_PROGRAM_CHANGE,
        Godot.Core.GlobalConstants._KEY_M,
        Godot.Core.GlobalConstants._ERR_FILE_UNRECOGNIZED,
        Godot.Core.GlobalConstants._KEY_OACUTE,
        Godot.Core.GlobalConstants._KEY_DELETE,
        Godot.Core.GlobalConstants._JOY_ANALOG_L2,
        Godot.Core.GlobalConstants._KEY_KP_7,
        Godot.Core.GlobalConstants._ERR_FILE_EOF,
        Godot.Core.GlobalConstants._JOY_L2,
        Godot.Core.GlobalConstants._JOY_XBOX_X,
        Godot.Core.GlobalConstants._JOY_BUTTON_5,
        Godot.Core.GlobalConstants._JOY_DPAD_RIGHT,
        Godot.Core.GlobalConstants._KEY_AT,
        Godot.Core.GlobalConstants._KEY_MODIFIER_MASK,
        Godot.Core.GlobalConstants._TYPE_STRING_ARRAY,
        Godot.Core.GlobalConstants._TYPE_STRING,
        Godot.Core.GlobalConstants._PROPERTY_HINT_LAYERS_2D_PHYSICS,
        Godot.Core.GlobalConstants._JOY_START,
        Godot.Core.GlobalConstants._KEY_KP_0,
        Godot.Core.GlobalConstants._PROPERTY_HINT_EXP_RANGE,
        Godot.Core.GlobalConstants._ERR_FILE_ALREADY_IN_USE,
        Godot.Core.GlobalConstants._JOY_BUTTON_2,
        Godot.Core.GlobalConstants._OP_IN,
        Godot.Core.GlobalConstants._JOY_AXIS_9,
        Godot.Core.GlobalConstants._KEY_G,
        Godot.Core.GlobalConstants._HORIZONTAL,
        Godot.Core.GlobalConstants._KEY_ECIRCUMFLEX,
        Godot.Core.GlobalConstants._JOY_L,
        Godot.Core.GlobalConstants._KEY_QUESTIONDOWN,
        Godot.Core.GlobalConstants._TYPE_INT_ARRAY,
        Godot.Core.GlobalConstants._PROPERTY_HINT_DIR,
        Godot.Core.GlobalConstants._BUTTON_MASK_XBUTTON1,
        Godot.Core.GlobalConstants._KEY_BRACERIGHT,
        Godot.Core.GlobalConstants._JOY_XBOX_B,
        Godot.Core.GlobalConstants._KEY_UACUTE,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_GROUP,
        Godot.Core.GlobalConstants._TYPE_VECTOR3,
        Godot.Core.GlobalConstants._BUTTON_WHEEL_LEFT,
        Godot.Core.GlobalConstants._ERR_INVALID_DECLARATION,
        Godot.Core.GlobalConstants._KEY_Z,
        Godot.Core.GlobalConstants._KEY_F1,
        Godot.Core.GlobalConstants._OP_GREATER_EQUAL,
        Godot.Core.GlobalConstants._ERR_ALREADY_EXISTS,
        Godot.Core.GlobalConstants._CORNER_BOTTOM_RIGHT,
        Godot.Core.GlobalConstants._KEY_1,
        Godot.Core.GlobalConstants._ERR_FILE_MISSING_DEPENDENCIES,
        Godot.Core.GlobalConstants._KEY_LAUNCH6,
        Godot.Core.GlobalConstants._TYPE_REAL,
        Godot.Core.GlobalConstants._KEY_HYPER_R,
        Godot.Core.GlobalConstants._KEY_AE,
        Godot.Core.GlobalConstants._KEY_SLASH,
        Godot.Core.GlobalConstants._KEY_Q,
        Godot.Core.GlobalConstants._KEY_QUOTELEFT,
        Godot.Core.GlobalConstants._ERR_FILE_CANT_OPEN,
        Godot.Core.GlobalConstants._KEY_MASK_GROUP_SWITCH,
        Godot.Core.GlobalConstants._METHOD_FLAG_REVERSE,
        Godot.Core.GlobalConstants._OP_BIT_OR,
        Godot.Core.GlobalConstants._JOY_DS_A,
        Godot.Core.GlobalConstants._KEY_PLUS,
        Godot.Core.GlobalConstants._KEY_LAUNCH3,
        Godot.Core.GlobalConstants._OP_SHIFT_LEFT,
        Godot.Core.GlobalConstants._JOY_AXIS_MAX,
        Godot.Core.GlobalConstants._TYPE_RECT2,
        Godot.Core.GlobalConstants._BUTTON_MIDDLE,
        Godot.Core.GlobalConstants._KEY_T,
        Godot.Core.GlobalConstants._KEY_MEDIASTOP,
        Godot.Core.GlobalConstants._JOY_VR_PAD,
        Godot.Core.GlobalConstants._SPKEY,
        Godot.Core.GlobalConstants._KEY_APOSTROPHE,
        Godot.Core.GlobalConstants._BUTTON_WHEEL_RIGHT,
        Godot.Core.GlobalConstants._KEY_HOME,
        Godot.Core.GlobalConstants._KEY_VOLUMEMUTE,
        Godot.Core.GlobalConstants._ERR_CONNECTION_ERROR,
        Godot.Core.GlobalConstants._KEY_ORDFEMININE,
        Godot.Core.GlobalConstants._TYPE_BASIS,
        Godot.Core.GlobalConstants._KEY_4,
        Godot.Core.GlobalConstants._ERR_TIMEOUT,
        Godot.Core.GlobalConstants._JOY_BUTTON_10,
        Godot.Core.GlobalConstants._KEY_SECTION,
        Godot.Core.GlobalConstants._KEY_BRACKETRIGHT,
        Godot.Core.GlobalConstants._KEY_MEDIANEXT,
        Godot.Core.GlobalConstants._KEY_KP_ENTER,
        Godot.Core.GlobalConstants._TYPE_AABB,
        Godot.Core.GlobalConstants._JOY_ANALOG_LY,
        Godot.Core.GlobalConstants._JOY_AXIS_5,
        Godot.Core.GlobalConstants._MARGIN_TOP,
        Godot.Core.GlobalConstants._KEY_K,
        Godot.Core.GlobalConstants._KEY_F12,
        Godot.Core.GlobalConstants._JOY_OPENVR_TOUCHPADX,
        Godot.Core.GlobalConstants._KEY_SEMICOLON,
        Godot.Core.GlobalConstants._KEY_KP_9,
        Godot.Core.GlobalConstants._KEY_AACUTE,
        Godot.Core.GlobalConstants._KEY_BASSBOOST,
        Godot.Core.GlobalConstants._BUTTON_MASK_MIDDLE,
        Godot.Core.GlobalConstants._JOY_ANALOG_R2,
        Godot.Core.GlobalConstants._KEY_SYSREQ,
        Godot.Core.GlobalConstants._ERR_UNCONFIGURED,
        Godot.Core.GlobalConstants._KEY_CCEDILLA,
        Godot.Core.GlobalConstants._TYPE_TRANSFORM,
        Godot.Core.GlobalConstants._KEY_KP_SUBTRACT,
        Godot.Core.GlobalConstants._JOY_R2,
        Godot.Core.GlobalConstants._JOY_AXIS_0,
        Godot.Core.GlobalConstants._ERR_FILE_BAD_DRIVE,
        Godot.Core.GlobalConstants._KEY_BACKSLASH,
        Godot.Core.GlobalConstants._PROPERTY_HINT_LAYERS_3D_PHYSICS,
        Godot.Core.GlobalConstants._KEY_N,
        Godot.Core.GlobalConstants._JOY_VR_GRIP,
        Godot.Core.GlobalConstants._KEY_CODE_MASK,
        Godot.Core.GlobalConstants._KEY_MASK_CMD,
        Godot.Core.GlobalConstants._JOY_BUTTON_15,
        Godot.Core.GlobalConstants._ERR_UNAUTHORIZED,
        Godot.Core.GlobalConstants._HALIGN_RIGHT,
        Godot.Core.GlobalConstants._ERR_FILE_CORRUPT,
        Godot.Core.GlobalConstants._KEY_THREEQUARTERS,
        Godot.Core.GlobalConstants._PROPERTY_HINT_LAYERS_2D_RENDER,
        Godot.Core.GlobalConstants._JOY_BUTTON_0,
        Godot.Core.GlobalConstants._KEY_PARENRIGHT,
        Godot.Core.GlobalConstants._JOY_ANALOG_RY,
        Godot.Core.GlobalConstants._KEY_ODIAERESIS,
        Godot.Core.GlobalConstants._KEY_E,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_EDITOR_HELPER,
        Godot.Core.GlobalConstants._MIDI_MESSAGE_AFTERTOUCH,
        Godot.Core.GlobalConstants._KEY_LAUNCHB,
        Godot.Core.GlobalConstants._KEY_COPYRIGHT,
        Godot.Core.GlobalConstants._KEY_UNDERSCORE,
        Godot.Core.GlobalConstants._KEY_CAPSLOCK,
        Godot.Core.GlobalConstants._KEY_KP_2,
        Godot.Core.GlobalConstants._KEY_ONEHALF,
        Godot.Core.GlobalConstants._KEY_MASK_ALT,
        Godot.Core.GlobalConstants._ERR_CANT_CONNECT,
        Godot.Core.GlobalConstants._KEY_8,
        Godot.Core.GlobalConstants._TYPE_MAX,
        Godot.Core.GlobalConstants._KEY_X,
        Godot.Core.GlobalConstants._ERR_SKIP,
        Godot.Core.GlobalConstants._TYPE_PLANE,
        Godot.Core.GlobalConstants._OP_NOT,
        Godot.Core.GlobalConstants._KEY_F3,
        Godot.Core.GlobalConstants._ERR_HELP,
        Godot.Core.GlobalConstants._KEY_CEDILLA,
        Godot.Core.GlobalConstants._KEY_ATILDE,
        Godot.Core.GlobalConstants._MIDI_MESSAGE_PITCH_BEND,
        Godot.Core.GlobalConstants._KEY_LAUNCH8,
        Godot.Core.GlobalConstants._OP_LESS,
        Godot.Core.GlobalConstants._KEY_NTILDE,
        Godot.Core.GlobalConstants._KEY_TWOSUPERIOR,
        Godot.Core.GlobalConstants._KEY_BASSUP,
        Godot.Core.GlobalConstants._KEY_PAGEUP,
        Godot.Core.GlobalConstants._ERR_PRINTER_ON_FIRE,
        Godot.Core.GlobalConstants._KEY_SEARCH,
        Godot.Core.GlobalConstants._CORNER_TOP_RIGHT,
        Godot.Core.GlobalConstants._KEY_EDIAERESIS,
        Godot.Core.GlobalConstants._KEY_ALT,
        Godot.Core.GlobalConstants._KEY_KP_DIVIDE,
        Godot.Core.GlobalConstants._ERR_QUERY_FAILED,
        Godot.Core.GlobalConstants._KEY_IGRAVE,
        Godot.Core.GlobalConstants._KEY_F4,
        Godot.Core.GlobalConstants._KEY_BACKSPACE,
        Godot.Core.GlobalConstants._KEY_NUMLOCK,
        Godot.Core.GlobalConstants._KEY_ASTERISK,
        Godot.Core.GlobalConstants._KEY_TREBLEDOWN,
        Godot.Core.GlobalConstants._KEY_BAR,
        Godot.Core.GlobalConstants._VALIGN_CENTER,
        Godot.Core.GlobalConstants._PROPERTY_HINT_LENGTH,
        Godot.Core.GlobalConstants._PROPERTY_HINT_NONE,
        Godot.Core.GlobalConstants._TYPE_ARRAY,
        Godot.Core.GlobalConstants._KEY_HELP,
        Godot.Core.GlobalConstants._CORNER_BOTTOM_LEFT,
        Godot.Core.GlobalConstants._KEY_R,
        Godot.Core.GlobalConstants._OP_SHIFT_RIGHT,
        Godot.Core.GlobalConstants._KEY_F9,
        Godot.Core.GlobalConstants._KEY_TREBLEUP,
        Godot.Core.GlobalConstants._TYPE_VECTOR3_ARRAY,
        Godot.Core.GlobalConstants._JOY_DS_B,
        Godot.Core.GlobalConstants._ERR_CANT_RESOLVE,
        Godot.Core.GlobalConstants._KEY_MASK_CTRL,
        Godot.Core.GlobalConstants._KEY_2,
        Godot.Core.GlobalConstants._METHOD_FLAG_CONST,
        Godot.Core.GlobalConstants._KEY_LAUNCH5,
        Godot.Core.GlobalConstants._ERR_FILE_BAD_PATH,
        Godot.Core.GlobalConstants._KEY_ACUTE,
        Godot.Core.GlobalConstants._JOY_DS_Y,
        Godot.Core.GlobalConstants._VERTICAL,
        Godot.Core.GlobalConstants._KEY_OGRAVE,
        Godot.Core.GlobalConstants._KEY_QUESTION,
        Godot.Core.GlobalConstants._OP_POSITIVE,
        Godot.Core.GlobalConstants._CORNER_TOP_LEFT,
        Godot.Core.GlobalConstants._PROPERTY_HINT_FLAGS,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_NETWORK,
        Godot.Core.GlobalConstants._JOY_AXIS_7,
        Godot.Core.GlobalConstants._KEY_MEDIAPREVIOUS,
        Godot.Core.GlobalConstants._KEY_EXCLAMDOWN,
        Godot.Core.GlobalConstants._KEY_I,
        Godot.Core.GlobalConstants._KEY_NOBREAKSPACE,
        Godot.Core.GlobalConstants._KEY_F10,
        Godot.Core.GlobalConstants._OP_MAX,
        Godot.Core.GlobalConstants._ERR_CANT_OPEN,
        Godot.Core.GlobalConstants._JOY_BUTTON_12,
        Godot.Core.GlobalConstants._KEY_DOWN,
        Godot.Core.GlobalConstants._JOY_BUTTON_9,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_CATEGORY,
        Godot.Core.GlobalConstants._KEY_KP_ADD,
        Godot.Core.GlobalConstants._KEY_NOTSIGN,
        Godot.Core.GlobalConstants._ERR_CANT_ACQUIRE_RESOURCE,
        Godot.Core.GlobalConstants._JOY_AXIS_2,
        Godot.Core.GlobalConstants._KEY_L,
        Godot.Core.GlobalConstants._KEY_YEN,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_RESTART_IF_CHANGED,
        Godot.Core.GlobalConstants._KEY_F15,
        Godot.Core.GlobalConstants._JOY_BUTTON_6,
        Godot.Core.GlobalConstants._KEY_STERLING,
        Godot.Core.GlobalConstants._KEY_AMPERSAND,
        Godot.Core.GlobalConstants._KEY_C,
        Godot.Core.GlobalConstants._KEY_UGRAVE,
        Godot.Core.GlobalConstants._KEY_LAUNCHD,
        Godot.Core.GlobalConstants._PROPERTY_HINT_RESOURCE_TYPE,
        Godot.Core.GlobalConstants._OP_GREATER,
        Godot.Core.GlobalConstants._KEY_ACIRCUMFLEX,
        Godot.Core.GlobalConstants._KEY_YDIAERESIS,
        Godot.Core.GlobalConstants._KEY_SCROLLLOCK,
        Godot.Core.GlobalConstants._KEY_KP_4,
        Godot.Core.GlobalConstants._ERR_FILE_CANT_WRITE,
        Godot.Core.GlobalConstants._KEY_THORN,
        Godot.Core.GlobalConstants._TYPE_COLOR,
        Godot.Core.GlobalConstants._VALIGN_TOP,
        Godot.Core.GlobalConstants._KEY_PARAGRAPH,
        Godot.Core.GlobalConstants._JOY_AXIS_8,
        Godot.Core.GlobalConstants._MARGIN_BOTTOM,
        Godot.Core.GlobalConstants._KEY_F,
        Godot.Core.GlobalConstants._KEY_YACUTE,
        Godot.Core.GlobalConstants._KEY_BACKTAB,
        Godot.Core.GlobalConstants._PROPERTY_HINT_IMAGE_COMPRESS_LOSSY,
        Godot.Core.GlobalConstants._KEY_META,
        Godot.Core.GlobalConstants._KEY_LAUNCHA,
        Godot.Core.GlobalConstants._TYPE_TRANSFORM2D,
        Godot.Core.GlobalConstants._KEY_DIVISION,
        Godot.Core.GlobalConstants._MARGIN_RIGHT,
        Godot.Core.GlobalConstants._OP_MULTIPLY,
        Godot.Core.GlobalConstants._PROPERTY_HINT_ENUM,
        Godot.Core.GlobalConstants._KEY_KP_1,
        Godot.Core.GlobalConstants._OP_MODULE,
        Godot.Core.GlobalConstants._BUTTON_WHEEL_UP,
        Godot.Core.GlobalConstants._JOY_BUTTON_3,
        Godot.Core.GlobalConstants._KEY_PLUSMINUS,
        Godot.Core.GlobalConstants._JOY_DPAD_LEFT,
        Godot.Core.GlobalConstants._KEY_DEGREE,
        Godot.Core.GlobalConstants._JOY_SONY_TRIANGLE,
        Godot.Core.GlobalConstants._KEY_MACRON,
        Godot.Core.GlobalConstants._KEY_CLEAR,
        Godot.Core.GlobalConstants._KEY_F6,
        Godot.Core.GlobalConstants._KEY_PRINT,
        Godot.Core.GlobalConstants._KEY_OCIRCUMFLEX,
        Godot.Core.GlobalConstants._KEY_MASK_KPAD,
        Godot.Core.GlobalConstants._JOY_VR_TRIGGER,
        Godot.Core.GlobalConstants._KEY_REGISTERED,
        Godot.Core.GlobalConstants._ERR_SCRIPT_FAILED,
        Godot.Core.GlobalConstants._KEY_P,
        Godot.Core.GlobalConstants._ERR_PARAMETER_RANGE_ERROR,
        Godot.Core.GlobalConstants._TYPE_NODE_PATH,
        Godot.Core.GlobalConstants._KEY_EQUAL,
        Godot.Core.GlobalConstants._KEY_MEDIAPLAY,
        Godot.Core.GlobalConstants._JOY_VR_ANALOG_GRIP,
        Godot.Core.GlobalConstants._MARGIN_LEFT,
        Godot.Core.GlobalConstants._BUTTON_LEFT,
        Godot.Core.GlobalConstants._KEY_UP,
        Godot.Core.GlobalConstants._OP_NEGATE,
        Godot.Core.GlobalConstants._KEY_CURRENCY,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_CHECKED,
        Godot.Core.GlobalConstants._KEY_0,
        Godot.Core.GlobalConstants._KEY_GREATER,
        Godot.Core.GlobalConstants._KEY_SPACE,
        Godot.Core.GlobalConstants._KEY_LAUNCH7,
        Godot.Core.GlobalConstants._KEY_MINUS,
        Godot.Core.GlobalConstants._BUTTON_XBUTTON1,
        Godot.Core.GlobalConstants._JOY_SONY_SQUARE,
        Godot.Core.GlobalConstants._KEY_BACK,
        Godot.Core.GlobalConstants._TYPE_INT,
        Godot.Core.GlobalConstants._KEY_THREESUPERIOR,
        Godot.Core.GlobalConstants._KEY_AGRAVE,
        Godot.Core.GlobalConstants._KEY_QUOTEDBL,
        Godot.Core.GlobalConstants._TYPE_NIL,
        Godot.Core.GlobalConstants._KEY_UCIRCUMFLEX,
        Godot.Core.GlobalConstants._KEY_7,
        Godot.Core.GlobalConstants._JOY_DPAD_DOWN,
        Godot.Core.GlobalConstants._KEY_LAUNCH0,
        Godot.Core.GlobalConstants._ERR_INVALID_DATA,
        Godot.Core.GlobalConstants._OP_DIVIDE,
        Godot.Core.GlobalConstants._TYPE_COLOR_ARRAY,
        Godot.Core.GlobalConstants._KEY_W,
        Godot.Core.GlobalConstants._KEY_CENT,
        Godot.Core.GlobalConstants._OP_EQUAL,
        Godot.Core.GlobalConstants._JOY_DPAD_UP,
        Godot.Core.GlobalConstants._JOY_ANALOG_LX,
        Godot.Core.GlobalConstants._JOY_AXIS_4,
        Godot.Core.GlobalConstants._KEY_J,
        Godot.Core.GlobalConstants._BUTTON_MASK_LEFT,
        Godot.Core.GlobalConstants._ERR_COMPILATION_FAILED,
        Godot.Core.GlobalConstants._KEY_F13,
        Godot.Core.GlobalConstants._JOY_OPENVR_TOUCHPADY,
        Godot.Core.GlobalConstants._KEY_SSHARP,
        Godot.Core.GlobalConstants._PROPERTY_HINT_GLOBAL_FILE,
        Godot.Core.GlobalConstants._JOY_BUTTON_11,
        Godot.Core.GlobalConstants._OP_LESS_EQUAL,
        Godot.Core.GlobalConstants._METHOD_FLAG_NOSCRIPT,
        Godot.Core.GlobalConstants._OP_BIT_AND,
        Godot.Core.GlobalConstants._PROPERTY_HINT_EXP_EASING,
        Godot.Core.GlobalConstants._KEY_EACUTE,
        Godot.Core.GlobalConstants._ERR_METHOD_NOT_FOUND,
        Godot.Core.GlobalConstants._KEY_COMMA,
        Godot.Core.GlobalConstants._PROPERTY_HINT_RANGE,
        Godot.Core.GlobalConstants._KEY_A,
        Godot.Core.GlobalConstants._KEY_KP_PERIOD,
        Godot.Core.GlobalConstants._METHOD_FLAG_NORMAL,
        Godot.Core.GlobalConstants._KEY_LAUNCHF,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_INTERNATIONALIZED,
        Godot.Core.GlobalConstants._HALIGN_CENTER,
        Godot.Core.GlobalConstants._JOY_OPENVR_MENU,
        Godot.Core.GlobalConstants._OP_NOT_EQUAL,
        Godot.Core.GlobalConstants._KEY_KP_6,
        Godot.Core.GlobalConstants._KEY_LAUNCHMAIL,
        Godot.Core.GlobalConstants._JOY_L3,
        Godot.Core.GlobalConstants._JOY_XBOX_Y,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_SCRIPT_VARIABLE,
        Godot.Core.GlobalConstants._KEY_OOBLIQUE,
        Godot.Core.GlobalConstants._JOY_BUTTON_4,
        Godot.Core.GlobalConstants._ERR_BUG,
        Godot.Core.GlobalConstants._OP_ADD,
        Godot.Core.GlobalConstants._KEY_D,
        Godot.Core.GlobalConstants._JOY_OCULUS_BY,
        Godot.Core.GlobalConstants._PROPERTY_HINT_GLOBAL_DIR,
        Godot.Core.GlobalConstants._KEY_LAUNCHC,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_NOEDITOR,
        Godot.Core.GlobalConstants._KEY_PERIOD,
        Godot.Core.GlobalConstants._OP_BIT_NEGATE,
        Godot.Core.GlobalConstants._KEY_KP_3,
        Godot.Core.GlobalConstants._PROPERTY_HINT_LAYERS_3D_RENDER,
        Godot.Core.GlobalConstants._KEY_ASCIITILDE,
        Godot.Core.GlobalConstants._KEY_RIGHT,
        Godot.Core.GlobalConstants._ERR_CYCLIC_LINK,
        Godot.Core.GlobalConstants._JOY_BUTTON_1,
        Godot.Core.GlobalConstants._JOY_ANALOG_RX,
        Godot.Core.GlobalConstants._BUTTON_WHEEL_DOWN,
        Godot.Core.GlobalConstants._KEY_ICIRCUMFLEX,
        Godot.Core.GlobalConstants._JOY_SONY_CIRCLE,
        Godot.Core.GlobalConstants._MIDI_MESSAGE_NOTE_ON,
        Godot.Core.GlobalConstants._KEY_ADIAERESIS,
        Godot.Core.GlobalConstants._MIDI_MESSAGE_CHANNEL_PRESSURE,
        Godot.Core.GlobalConstants._KEY_STOP,
        Godot.Core.GlobalConstants._HALIGN_LEFT,
        Godot.Core.GlobalConstants._KEY_PARENLEFT,
        Godot.Core.GlobalConstants._TYPE_VECTOR2,
        Godot.Core.GlobalConstants._KEY_F5,
        Godot.Core.GlobalConstants._OP_AND,
        Godot.Core.GlobalConstants._KEY_PAUSE,
        Godot.Core.GlobalConstants._KEY_INSERT,
        Godot.Core.GlobalConstants._OP_SUBTRACT,
        Godot.Core.GlobalConstants._KEY_BASSDOWN,
        Godot.Core.GlobalConstants._KEY_PERIODCENTERED,
        Godot.Core.GlobalConstants._KEY_LAUNCH9,
        Godot.Core.GlobalConstants._PROPERTY_HINT_MULTILINE_TEXT,
        Godot.Core.GlobalConstants._KEY_PAGEDOWN,
        Godot.Core.GlobalConstants._JOY_OCULUS_AX,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_NO_INSTANCE_STATE,
        Godot.Core.GlobalConstants._ERR_FILE_NOT_FOUND,
        Godot.Core.GlobalConstants._TYPE_REAL_ARRAY,
        Godot.Core.GlobalConstants._KEY_NUMBERSIGN,
        Godot.Core.GlobalConstants._KEY_ONEQUARTER,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_CHECKABLE,
        Godot.Core.GlobalConstants._KEY_5,
        Godot.Core.GlobalConstants._TYPE_BOOL,
        Godot.Core.GlobalConstants._KEY_LAUNCH2,
        Godot.Core.GlobalConstants._OK,
        Godot.Core.GlobalConstants._KEY_STANDBY,
        Godot.Core.GlobalConstants._KEY_CONTROL,
        Godot.Core.GlobalConstants._KEY_U,
        Godot.Core.GlobalConstants._ERR_INVALID_PARAMETER,
        Godot.Core.GlobalConstants._KEY_DIRECTION_L,
        Godot.Core.GlobalConstants._PROPERTY_HINT_PLACEHOLDER_TEXT,
        Godot.Core.GlobalConstants._JOY_AXIS_6,
        Godot.Core.GlobalConstants._OP_XOR,
        Godot.Core.GlobalConstants._KEY_H,
        Godot.Core.GlobalConstants._ERR_LINK_FAILED,
        Godot.Core.GlobalConstants._KEY_F11,
        Godot.Core.GlobalConstants._KEY_SUPER_L,
        Godot.Core.GlobalConstants._METHOD_FLAG_VIRTUAL,
        Godot.Core.GlobalConstants._JOY_BUTTON_13,
        Godot.Core.GlobalConstants._ERR_DOES_NOT_EXIST,
        Godot.Core.GlobalConstants._KEY_MENU,
        Godot.Core.GlobalConstants._KEY_LEFT,
        Godot.Core.GlobalConstants._TYPE_OBJECT,
        Godot.Core.GlobalConstants._JOY_DS_X,
        Godot.Core.GlobalConstants._ERR_DATABASE_CANT_READ,
        Godot.Core.GlobalConstants._KEY_ESCAPE,
        Godot.Core.GlobalConstants._TYPE_RAW_ARRAY,
        Godot.Core.GlobalConstants._ERR_OUT_OF_MEMORY,
        Godot.Core.GlobalConstants._ERR_CANT_CREATE,
        Godot.Core.GlobalConstants._KEY_VOLUMEDOWN,
        Godot.Core.GlobalConstants._KEY_O,
        Godot.Core.GlobalConstants._KEY_F16,
        Godot.Core.GlobalConstants._KEY_MEDIARECORD,
        Godot.Core.GlobalConstants._KEY_GUILLEMOTLEFT,
        Godot.Core.GlobalConstants._KEY_ETH,
        Godot.Core.GlobalConstants._KEY_DIAERESIS,
        Godot.Core.GlobalConstants._KEY_REFRESH,
        Godot.Core.GlobalConstants._KEY_LAUNCHMEDIA,
        Godot.Core.GlobalConstants._JOY_BUTTON_14,
        Godot.Core.GlobalConstants._KEY_FAVORITES,
        Godot.Core.GlobalConstants._KEY_EXCLAM,
        Godot.Core.GlobalConstants._KEY_KP_8,
        Godot.Core.GlobalConstants._ERR_FILE_CANT_READ,
        Godot.Core.GlobalConstants._PROPERTY_HINT_IMAGE_COMPRESS_LOSSLESS,
        Godot.Core.GlobalConstants._KEY_ONESUPERIOR,
        Godot.Core.GlobalConstants._KEY_UDIAERESIS,
        Godot.Core.GlobalConstants._JOY_R3,
        Godot.Core.GlobalConstants._KEY_ARING,
        Godot.Core.GlobalConstants._KEY_MASCULINE,
        Godot.Core.GlobalConstants._KEY_HYPER_L,
        Godot.Core.GlobalConstants._JOY_AXIS_1,
        Godot.Core.GlobalConstants._KEY_LAUNCHE,
        Godot.Core.GlobalConstants._KEY_UNKNOWN,
        Godot.Core.GlobalConstants._KEY_KP_5,
        Godot.Core.GlobalConstants._JOY_OCULUS_MENU,
        Godot.Core.GlobalConstants._TYPE_QUAT,
        Godot.Core.GlobalConstants._JOY_BUTTON_7,
        Godot.Core.GlobalConstants._KEY_VOLUMEUP,
        Godot.Core.GlobalConstants._PROPERTY_HINT_KEY_ACCEL,
        Godot.Core.GlobalConstants._JOY_SELECT,
        Godot.Core.GlobalConstants._KEY_LESS,
        Godot.Core.GlobalConstants._MIDI_MESSAGE_NOTE_OFF,
        Godot.Core.GlobalConstants._KEY_B,
        Godot.Core.GlobalConstants._KEY_F2,
        Godot.Core.GlobalConstants._JOY_R,
        Godot.Core.GlobalConstants._KEY_TAB,
        Godot.Core.GlobalConstants._BUTTON_MASK_XBUTTON2,
        Godot.Core.GlobalConstants._KEY_PERCENT,
        Godot.Core.GlobalConstants._JOY_XBOX_A,
        Godot.Core.GlobalConstants._KEY_9,
        Godot.Core.GlobalConstants._ERR_ALREADY_IN_USE,
        Godot.Core.GlobalConstants._KEY_END,
        Godot.Core.GlobalConstants._TYPE_DICTIONARY,
        Godot.Core.GlobalConstants._KEY_GUILLEMOTRIGHT,
        Godot.Core.GlobalConstants._KEY_FORWARD,
        Godot.Core.GlobalConstants._KEY_DOLLAR,
        Godot.Core.GlobalConstants._KEY_Y,
        Godot.Core.GlobalConstants._ERR_LOCKED,
        Godot.Core.GlobalConstants._METHOD_FLAGS_DEFAULT,
        Godot.Core.GlobalConstants._KEY_ASCIICIRCUM,
        Godot.Core.GlobalConstants._OP_BIT_XOR,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_DEFAULT,
        Godot.Core.GlobalConstants._KEY_BRACELEFT,
        Godot.Core.GlobalConstants._ERR_BUSY,
        Godot.Core.GlobalConstants._KEY_SHIFT,
        Godot.Core.GlobalConstants._ERR_DATABASE_CANT_WRITE,
        Godot.Core.GlobalConstants._KEY_F7,
        Godot.Core.GlobalConstants._KEY_ENTER,
        Godot.Core.GlobalConstants._JOY_BUTTON_MAX,
        Godot.Core.GlobalConstants._KEY_MULTIPLY,
        Godot.Core.GlobalConstants._VALIGN_BOTTOM,
        Godot.Core.GlobalConstants._KEY_IDIAERESIS,
        Godot.Core.GlobalConstants._PROPERTY_HINT_COLOR_NO_ALPHA,
        Godot.Core.GlobalConstants._METHOD_FLAG_EDITOR,
        Godot.Core.GlobalConstants._KEY_3,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_EDITOR,
        Godot.Core.GlobalConstants._METHOD_FLAG_FROM_SCRIPT,
        Godot.Core.GlobalConstants._KEY_LAUNCH4,
        Godot.Core.GlobalConstants._TYPE_VECTOR2_ARRAY,
        Godot.Core.GlobalConstants._KEY_EGRAVE,
        Godot.Core.GlobalConstants._BUTTON_XBUTTON2,
        Godot.Core.GlobalConstants._KEY_S,
        Godot.Core.GlobalConstants._TYPE_RID,
        Godot.Core.GlobalConstants._PROPERTY_USAGE_DEFAULT_INTL,
        Godot.Core.GlobalConstants._PROPERTY_HINT_FILE,
        Godot.Core.GlobalConstants._KEY_HYPHEN,
        Godot.Core.GlobalConstants._KEY_F8,
        Godot.Core.GlobalConstants._ERR_DUPLICATE_SYMBOL,
        Godot.Core.GlobalConstants._ERR_FILE_NO_PERMISSION,
        Godot.Core.GlobalConstants._KEY_HOMEPAGE)
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

_KEY_6 :: Int
_KEY_6 = 54

_KEY_LAUNCH1 :: Int
_KEY_LAUNCH1 = 16777305

_PROPERTY_USAGE_STORAGE :: Int
_PROPERTY_USAGE_STORAGE = 1

_KEY_MASK_SHIFT :: Int
_KEY_MASK_SHIFT = 33554432

_KEY_DIRECTION_R :: Int
_KEY_DIRECTION_R = 16777267

_KEY_KP_MULTIPLY :: Int
_KEY_KP_MULTIPLY = 16777345

_FAILED :: Int
_FAILED = 1

_JOY_SONY_X :: Int
_JOY_SONY_X = 0

_KEY_V :: Int
_KEY_V = 86

_KEY_SUPER_R :: Int
_KEY_SUPER_R = 16777261

_ERR_UNAVAILABLE :: Int
_ERR_UNAVAILABLE = 2

_KEY_IACUTE :: Int
_KEY_IACUTE = 205

_KEY_BROKENBAR :: Int
_KEY_BROKENBAR = 166

_BUTTON_MASK_RIGHT :: Int
_BUTTON_MASK_RIGHT = 2

_KEY_OTILDE :: Int
_KEY_OTILDE = 213

_ERR_PARSE_ERROR :: Int
_ERR_PARSE_ERROR = 43

_KEY_MASK_META :: Int
_KEY_MASK_META = 134217728

_MIDI_MESSAGE_CONTROL_CHANGE :: Int
_MIDI_MESSAGE_CONTROL_CHANGE = 11

_BUTTON_RIGHT :: Int
_BUTTON_RIGHT = 2

_KEY_F14 :: Int
_KEY_F14 = 16777257

_KEY_COLON :: Int
_KEY_COLON = 58

_OP_STRING_CONCAT :: Int
_OP_STRING_CONCAT = 13

_OP_OR :: Int
_OP_OR = 21

_JOY_VR_ANALOG_TRIGGER :: Int
_JOY_VR_ANALOG_TRIGGER = 2

_KEY_OPENURL :: Int
_KEY_OPENURL = 16777301

_ERR_CANT_FORK :: Int
_ERR_CANT_FORK = 29

_JOY_BUTTON_8 :: Int
_JOY_BUTTON_8 = 8

_KEY_MU :: Int
_KEY_MU = 181

_KEY_BRACKETLEFT :: Int
_KEY_BRACKETLEFT = 91

_JOY_AXIS_3 :: Int
_JOY_AXIS_3 = 3

_MIDI_MESSAGE_PROGRAM_CHANGE :: Int
_MIDI_MESSAGE_PROGRAM_CHANGE = 12

_KEY_M :: Int
_KEY_M = 77

_ERR_FILE_UNRECOGNIZED :: Int
_ERR_FILE_UNRECOGNIZED = 15

_KEY_OACUTE :: Int
_KEY_OACUTE = 211

_KEY_DELETE :: Int
_KEY_DELETE = 16777224

_JOY_ANALOG_L2 :: Int
_JOY_ANALOG_L2 = 6

_KEY_KP_7 :: Int
_KEY_KP_7 = 16777357

_ERR_FILE_EOF :: Int
_ERR_FILE_EOF = 18

_JOY_L2 :: Int
_JOY_L2 = 6

_JOY_XBOX_X :: Int
_JOY_XBOX_X = 2

_JOY_BUTTON_5 :: Int
_JOY_BUTTON_5 = 5

_JOY_DPAD_RIGHT :: Int
_JOY_DPAD_RIGHT = 15

_KEY_AT :: Int
_KEY_AT = 64

_KEY_MODIFIER_MASK :: Int
_KEY_MODIFIER_MASK = -16777216

_TYPE_STRING_ARRAY :: Int
_TYPE_STRING_ARRAY = 23

_TYPE_STRING :: Int
_TYPE_STRING = 4

_PROPERTY_HINT_LAYERS_2D_PHYSICS :: Int
_PROPERTY_HINT_LAYERS_2D_PHYSICS = 10

_JOY_START :: Int
_JOY_START = 11

_KEY_KP_0 :: Int
_KEY_KP_0 = 16777350

_PROPERTY_HINT_EXP_RANGE :: Int
_PROPERTY_HINT_EXP_RANGE = 2

_ERR_FILE_ALREADY_IN_USE :: Int
_ERR_FILE_ALREADY_IN_USE = 11

_JOY_BUTTON_2 :: Int
_JOY_BUTTON_2 = 2

_OP_IN :: Int
_OP_IN = 24

_JOY_AXIS_9 :: Int
_JOY_AXIS_9 = 9

_KEY_G :: Int
_KEY_G = 71

_HORIZONTAL :: Int
_HORIZONTAL = 0

_KEY_ECIRCUMFLEX :: Int
_KEY_ECIRCUMFLEX = 202

_JOY_L :: Int
_JOY_L = 4

_KEY_QUESTIONDOWN :: Int
_KEY_QUESTIONDOWN = 191

_TYPE_INT_ARRAY :: Int
_TYPE_INT_ARRAY = 21

_PROPERTY_HINT_DIR :: Int
_PROPERTY_HINT_DIR = 14

_BUTTON_MASK_XBUTTON1 :: Int
_BUTTON_MASK_XBUTTON1 = 128

_KEY_BRACERIGHT :: Int
_KEY_BRACERIGHT = 125

_JOY_XBOX_B :: Int
_JOY_XBOX_B = 1

_KEY_UACUTE :: Int
_KEY_UACUTE = 218

_PROPERTY_USAGE_GROUP :: Int
_PROPERTY_USAGE_GROUP = 128

_TYPE_VECTOR3 :: Int
_TYPE_VECTOR3 = 7

_BUTTON_WHEEL_LEFT :: Int
_BUTTON_WHEEL_LEFT = 6

_ERR_INVALID_DECLARATION :: Int
_ERR_INVALID_DECLARATION = 41

_KEY_Z :: Int
_KEY_Z = 90

_KEY_F1 :: Int
_KEY_F1 = 16777244

_OP_GREATER_EQUAL :: Int
_OP_GREATER_EQUAL = 5

_ERR_ALREADY_EXISTS :: Int
_ERR_ALREADY_EXISTS = 32

_CORNER_BOTTOM_RIGHT :: Int
_CORNER_BOTTOM_RIGHT = 2

_KEY_1 :: Int
_KEY_1 = 49

_ERR_FILE_MISSING_DEPENDENCIES :: Int
_ERR_FILE_MISSING_DEPENDENCIES = 17

_KEY_LAUNCH6 :: Int
_KEY_LAUNCH6 = 16777310

_TYPE_REAL :: Int
_TYPE_REAL = 3

_KEY_HYPER_R :: Int
_KEY_HYPER_R = 16777264

_KEY_AE :: Int
_KEY_AE = 198

_KEY_SLASH :: Int
_KEY_SLASH = 47

_KEY_Q :: Int
_KEY_Q = 81

_KEY_QUOTELEFT :: Int
_KEY_QUOTELEFT = 96

_ERR_FILE_CANT_OPEN :: Int
_ERR_FILE_CANT_OPEN = 12

_KEY_MASK_GROUP_SWITCH :: Int
_KEY_MASK_GROUP_SWITCH = 1073741824

_METHOD_FLAG_REVERSE :: Int
_METHOD_FLAG_REVERSE = 16

_OP_BIT_OR :: Int
_OP_BIT_OR = 17

_JOY_DS_A :: Int
_JOY_DS_A = 1

_KEY_PLUS :: Int
_KEY_PLUS = 43

_KEY_LAUNCH3 :: Int
_KEY_LAUNCH3 = 16777307

_OP_SHIFT_LEFT :: Int
_OP_SHIFT_LEFT = 14

_JOY_AXIS_MAX :: Int
_JOY_AXIS_MAX = 10

_TYPE_RECT2 :: Int
_TYPE_RECT2 = 6

_BUTTON_MIDDLE :: Int
_BUTTON_MIDDLE = 3

_KEY_T :: Int
_KEY_T = 84

_KEY_MEDIASTOP :: Int
_KEY_MEDIASTOP = 16777293

_JOY_VR_PAD :: Int
_JOY_VR_PAD = 14

_SPKEY :: Int
_SPKEY = 16777216

_KEY_APOSTROPHE :: Int
_KEY_APOSTROPHE = 39

_BUTTON_WHEEL_RIGHT :: Int
_BUTTON_WHEEL_RIGHT = 7

_KEY_HOME :: Int
_KEY_HOME = 16777229

_KEY_VOLUMEMUTE :: Int
_KEY_VOLUMEMUTE = 16777285

_ERR_CONNECTION_ERROR :: Int
_ERR_CONNECTION_ERROR = 27

_KEY_ORDFEMININE :: Int
_KEY_ORDFEMININE = 170

_TYPE_BASIS :: Int
_TYPE_BASIS = 12

_KEY_4 :: Int
_KEY_4 = 52

_ERR_TIMEOUT :: Int
_ERR_TIMEOUT = 24

_JOY_BUTTON_10 :: Int
_JOY_BUTTON_10 = 10

_KEY_SECTION :: Int
_KEY_SECTION = 167

_KEY_BRACKETRIGHT :: Int
_KEY_BRACKETRIGHT = 93

_KEY_MEDIANEXT :: Int
_KEY_MEDIANEXT = 16777295

_KEY_KP_ENTER :: Int
_KEY_KP_ENTER = 16777222

_TYPE_AABB :: Int
_TYPE_AABB = 11

_JOY_ANALOG_LY :: Int
_JOY_ANALOG_LY = 1

_JOY_AXIS_5 :: Int
_JOY_AXIS_5 = 5

_MARGIN_TOP :: Int
_MARGIN_TOP = 1

_KEY_K :: Int
_KEY_K = 75

_KEY_F12 :: Int
_KEY_F12 = 16777255

_JOY_OPENVR_TOUCHPADX :: Int
_JOY_OPENVR_TOUCHPADX = 0

_KEY_SEMICOLON :: Int
_KEY_SEMICOLON = 59

_KEY_KP_9 :: Int
_KEY_KP_9 = 16777359

_KEY_AACUTE :: Int
_KEY_AACUTE = 193

_KEY_BASSBOOST :: Int
_KEY_BASSBOOST = 16777287

_BUTTON_MASK_MIDDLE :: Int
_BUTTON_MASK_MIDDLE = 4

_JOY_ANALOG_R2 :: Int
_JOY_ANALOG_R2 = 7

_KEY_SYSREQ :: Int
_KEY_SYSREQ = 16777227

_ERR_UNCONFIGURED :: Int
_ERR_UNCONFIGURED = 3

_KEY_CCEDILLA :: Int
_KEY_CCEDILLA = 199

_TYPE_TRANSFORM :: Int
_TYPE_TRANSFORM = 13

_KEY_KP_SUBTRACT :: Int
_KEY_KP_SUBTRACT = 16777347

_JOY_R2 :: Int
_JOY_R2 = 7

_JOY_AXIS_0 :: Int
_JOY_AXIS_0 = 0

_ERR_FILE_BAD_DRIVE :: Int
_ERR_FILE_BAD_DRIVE = 8

_KEY_BACKSLASH :: Int
_KEY_BACKSLASH = 92

_PROPERTY_HINT_LAYERS_3D_PHYSICS :: Int
_PROPERTY_HINT_LAYERS_3D_PHYSICS = 12

_KEY_N :: Int
_KEY_N = 78

_JOY_VR_GRIP :: Int
_JOY_VR_GRIP = 2

_KEY_CODE_MASK :: Int
_KEY_CODE_MASK = 33554431

_KEY_MASK_CMD :: Int
_KEY_MASK_CMD = 268435456

_JOY_BUTTON_15 :: Int
_JOY_BUTTON_15 = 15

_ERR_UNAUTHORIZED :: Int
_ERR_UNAUTHORIZED = 4

_HALIGN_RIGHT :: Int
_HALIGN_RIGHT = 2

_ERR_FILE_CORRUPT :: Int
_ERR_FILE_CORRUPT = 16

_KEY_THREEQUARTERS :: Int
_KEY_THREEQUARTERS = 190

_PROPERTY_HINT_LAYERS_2D_RENDER :: Int
_PROPERTY_HINT_LAYERS_2D_RENDER = 9

_JOY_BUTTON_0 :: Int
_JOY_BUTTON_0 = 0

_KEY_PARENRIGHT :: Int
_KEY_PARENRIGHT = 41

_JOY_ANALOG_RY :: Int
_JOY_ANALOG_RY = 3

_KEY_ODIAERESIS :: Int
_KEY_ODIAERESIS = 214

_KEY_E :: Int
_KEY_E = 69

_PROPERTY_USAGE_EDITOR_HELPER :: Int
_PROPERTY_USAGE_EDITOR_HELPER = 8

_MIDI_MESSAGE_AFTERTOUCH :: Int
_MIDI_MESSAGE_AFTERTOUCH = 10

_KEY_LAUNCHB :: Int
_KEY_LAUNCHB = 16777315

_KEY_COPYRIGHT :: Int
_KEY_COPYRIGHT = 169

_KEY_UNDERSCORE :: Int
_KEY_UNDERSCORE = 95

_KEY_CAPSLOCK :: Int
_KEY_CAPSLOCK = 16777241

_KEY_KP_2 :: Int
_KEY_KP_2 = 16777352

_KEY_ONEHALF :: Int
_KEY_ONEHALF = 189

_KEY_MASK_ALT :: Int
_KEY_MASK_ALT = 67108864

_ERR_CANT_CONNECT :: Int
_ERR_CANT_CONNECT = 25

_KEY_8 :: Int
_KEY_8 = 56

_TYPE_MAX :: Int
_TYPE_MAX = 27

_KEY_X :: Int
_KEY_X = 88

_ERR_SKIP :: Int
_ERR_SKIP = 45

_TYPE_PLANE :: Int
_TYPE_PLANE = 9

_OP_NOT :: Int
_OP_NOT = 23

_KEY_F3 :: Int
_KEY_F3 = 16777246

_ERR_HELP :: Int
_ERR_HELP = 46

_KEY_CEDILLA :: Int
_KEY_CEDILLA = 184

_KEY_ATILDE :: Int
_KEY_ATILDE = 195

_MIDI_MESSAGE_PITCH_BEND :: Int
_MIDI_MESSAGE_PITCH_BEND = 14

_KEY_LAUNCH8 :: Int
_KEY_LAUNCH8 = 16777312

_OP_LESS :: Int
_OP_LESS = 2

_KEY_NTILDE :: Int
_KEY_NTILDE = 209

_KEY_TWOSUPERIOR :: Int
_KEY_TWOSUPERIOR = 178

_KEY_BASSUP :: Int
_KEY_BASSUP = 16777288

_KEY_PAGEUP :: Int
_KEY_PAGEUP = 16777235

_ERR_PRINTER_ON_FIRE :: Int
_ERR_PRINTER_ON_FIRE = 48

_KEY_SEARCH :: Int
_KEY_SEARCH = 16777299

_CORNER_TOP_RIGHT :: Int
_CORNER_TOP_RIGHT = 1

_KEY_EDIAERESIS :: Int
_KEY_EDIAERESIS = 203

_KEY_ALT :: Int
_KEY_ALT = 16777240

_KEY_KP_DIVIDE :: Int
_KEY_KP_DIVIDE = 16777346

_ERR_QUERY_FAILED :: Int
_ERR_QUERY_FAILED = 21

_KEY_IGRAVE :: Int
_KEY_IGRAVE = 204

_KEY_F4 :: Int
_KEY_F4 = 16777247

_KEY_BACKSPACE :: Int
_KEY_BACKSPACE = 16777220

_KEY_NUMLOCK :: Int
_KEY_NUMLOCK = 16777242

_KEY_ASTERISK :: Int
_KEY_ASTERISK = 42

_KEY_TREBLEDOWN :: Int
_KEY_TREBLEDOWN = 16777291

_KEY_BAR :: Int
_KEY_BAR = 124

_VALIGN_CENTER :: Int
_VALIGN_CENTER = 1

_PROPERTY_HINT_LENGTH :: Int
_PROPERTY_HINT_LENGTH = 5

_PROPERTY_HINT_NONE :: Int
_PROPERTY_HINT_NONE = 0

_TYPE_ARRAY :: Int
_TYPE_ARRAY = 19

_KEY_HELP :: Int
_KEY_HELP = 16777265

_CORNER_BOTTOM_LEFT :: Int
_CORNER_BOTTOM_LEFT = 3

_KEY_R :: Int
_KEY_R = 82

_OP_SHIFT_RIGHT :: Int
_OP_SHIFT_RIGHT = 15

_KEY_F9 :: Int
_KEY_F9 = 16777252

_KEY_TREBLEUP :: Int
_KEY_TREBLEUP = 16777290

_TYPE_VECTOR3_ARRAY :: Int
_TYPE_VECTOR3_ARRAY = 25

_JOY_DS_B :: Int
_JOY_DS_B = 0

_ERR_CANT_RESOLVE :: Int
_ERR_CANT_RESOLVE = 26

_KEY_MASK_CTRL :: Int
_KEY_MASK_CTRL = 268435456

_KEY_2 :: Int
_KEY_2 = 50

_METHOD_FLAG_CONST :: Int
_METHOD_FLAG_CONST = 8

_KEY_LAUNCH5 :: Int
_KEY_LAUNCH5 = 16777309

_ERR_FILE_BAD_PATH :: Int
_ERR_FILE_BAD_PATH = 9

_KEY_ACUTE :: Int
_KEY_ACUTE = 180

_JOY_DS_Y :: Int
_JOY_DS_Y = 2

_VERTICAL :: Int
_VERTICAL = 1

_KEY_OGRAVE :: Int
_KEY_OGRAVE = 210

_KEY_QUESTION :: Int
_KEY_QUESTION = 63

_OP_POSITIVE :: Int
_OP_POSITIVE = 11

_CORNER_TOP_LEFT :: Int
_CORNER_TOP_LEFT = 0

_PROPERTY_HINT_FLAGS :: Int
_PROPERTY_HINT_FLAGS = 8

_PROPERTY_USAGE_NETWORK :: Int
_PROPERTY_USAGE_NETWORK = 4

_JOY_AXIS_7 :: Int
_JOY_AXIS_7 = 7

_KEY_MEDIAPREVIOUS :: Int
_KEY_MEDIAPREVIOUS = 16777294

_KEY_EXCLAMDOWN :: Int
_KEY_EXCLAMDOWN = 161

_KEY_I :: Int
_KEY_I = 73

_KEY_NOBREAKSPACE :: Int
_KEY_NOBREAKSPACE = 160

_KEY_F10 :: Int
_KEY_F10 = 16777253

_OP_MAX :: Int
_OP_MAX = 25

_ERR_CANT_OPEN :: Int
_ERR_CANT_OPEN = 19

_JOY_BUTTON_12 :: Int
_JOY_BUTTON_12 = 12

_KEY_DOWN :: Int
_KEY_DOWN = 16777234

_JOY_BUTTON_9 :: Int
_JOY_BUTTON_9 = 9

_PROPERTY_USAGE_CATEGORY :: Int
_PROPERTY_USAGE_CATEGORY = 256

_KEY_KP_ADD :: Int
_KEY_KP_ADD = 16777349

_KEY_NOTSIGN :: Int
_KEY_NOTSIGN = 172

_ERR_CANT_ACQUIRE_RESOURCE :: Int
_ERR_CANT_ACQUIRE_RESOURCE = 28

_JOY_AXIS_2 :: Int
_JOY_AXIS_2 = 2

_KEY_L :: Int
_KEY_L = 76

_KEY_YEN :: Int
_KEY_YEN = 165

_PROPERTY_USAGE_RESTART_IF_CHANGED :: Int
_PROPERTY_USAGE_RESTART_IF_CHANGED = 4096

_KEY_F15 :: Int
_KEY_F15 = 16777258

_JOY_BUTTON_6 :: Int
_JOY_BUTTON_6 = 6

_KEY_STERLING :: Int
_KEY_STERLING = 163

_KEY_AMPERSAND :: Int
_KEY_AMPERSAND = 38

_KEY_C :: Int
_KEY_C = 67

_KEY_UGRAVE :: Int
_KEY_UGRAVE = 217

_KEY_LAUNCHD :: Int
_KEY_LAUNCHD = 16777317

_PROPERTY_HINT_RESOURCE_TYPE :: Int
_PROPERTY_HINT_RESOURCE_TYPE = 17

_OP_GREATER :: Int
_OP_GREATER = 4

_KEY_ACIRCUMFLEX :: Int
_KEY_ACIRCUMFLEX = 194

_KEY_YDIAERESIS :: Int
_KEY_YDIAERESIS = 255

_KEY_SCROLLLOCK :: Int
_KEY_SCROLLLOCK = 16777243

_KEY_KP_4 :: Int
_KEY_KP_4 = 16777354

_ERR_FILE_CANT_WRITE :: Int
_ERR_FILE_CANT_WRITE = 13

_KEY_THORN :: Int
_KEY_THORN = 222

_TYPE_COLOR :: Int
_TYPE_COLOR = 14

_VALIGN_TOP :: Int
_VALIGN_TOP = 0

_KEY_PARAGRAPH :: Int
_KEY_PARAGRAPH = 182

_JOY_AXIS_8 :: Int
_JOY_AXIS_8 = 8

_MARGIN_BOTTOM :: Int
_MARGIN_BOTTOM = 3

_KEY_F :: Int
_KEY_F = 70

_KEY_YACUTE :: Int
_KEY_YACUTE = 221

_KEY_BACKTAB :: Int
_KEY_BACKTAB = 16777219

_PROPERTY_HINT_IMAGE_COMPRESS_LOSSY :: Int
_PROPERTY_HINT_IMAGE_COMPRESS_LOSSY = 21

_KEY_META :: Int
_KEY_META = 16777239

_KEY_LAUNCHA :: Int
_KEY_LAUNCHA = 16777314

_TYPE_TRANSFORM2D :: Int
_TYPE_TRANSFORM2D = 8

_KEY_DIVISION :: Int
_KEY_DIVISION = 247

_MARGIN_RIGHT :: Int
_MARGIN_RIGHT = 2

_OP_MULTIPLY :: Int
_OP_MULTIPLY = 8

_PROPERTY_HINT_ENUM :: Int
_PROPERTY_HINT_ENUM = 3

_KEY_KP_1 :: Int
_KEY_KP_1 = 16777351

_OP_MODULE :: Int
_OP_MODULE = 12

_BUTTON_WHEEL_UP :: Int
_BUTTON_WHEEL_UP = 4

_JOY_BUTTON_3 :: Int
_JOY_BUTTON_3 = 3

_KEY_PLUSMINUS :: Int
_KEY_PLUSMINUS = 177

_JOY_DPAD_LEFT :: Int
_JOY_DPAD_LEFT = 14

_KEY_DEGREE :: Int
_KEY_DEGREE = 176

_JOY_SONY_TRIANGLE :: Int
_JOY_SONY_TRIANGLE = 3

_KEY_MACRON :: Int
_KEY_MACRON = 175

_KEY_CLEAR :: Int
_KEY_CLEAR = 16777228

_KEY_F6 :: Int
_KEY_F6 = 16777249

_KEY_PRINT :: Int
_KEY_PRINT = 16777226

_KEY_OCIRCUMFLEX :: Int
_KEY_OCIRCUMFLEX = 212

_KEY_MASK_KPAD :: Int
_KEY_MASK_KPAD = 536870912

_JOY_VR_TRIGGER :: Int
_JOY_VR_TRIGGER = 15

_KEY_REGISTERED :: Int
_KEY_REGISTERED = 174

_ERR_SCRIPT_FAILED :: Int
_ERR_SCRIPT_FAILED = 39

_KEY_P :: Int
_KEY_P = 80

_ERR_PARAMETER_RANGE_ERROR :: Int
_ERR_PARAMETER_RANGE_ERROR = 5

_TYPE_NODE_PATH :: Int
_TYPE_NODE_PATH = 15

_KEY_EQUAL :: Int
_KEY_EQUAL = 61

_KEY_MEDIAPLAY :: Int
_KEY_MEDIAPLAY = 16777292

_JOY_VR_ANALOG_GRIP :: Int
_JOY_VR_ANALOG_GRIP = 4

_MARGIN_LEFT :: Int
_MARGIN_LEFT = 0

_BUTTON_LEFT :: Int
_BUTTON_LEFT = 1

_KEY_UP :: Int
_KEY_UP = 16777232

_OP_NEGATE :: Int
_OP_NEGATE = 10

_KEY_CURRENCY :: Int
_KEY_CURRENCY = 164

_PROPERTY_USAGE_CHECKED :: Int
_PROPERTY_USAGE_CHECKED = 32

_KEY_0 :: Int
_KEY_0 = 48

_KEY_GREATER :: Int
_KEY_GREATER = 62

_KEY_SPACE :: Int
_KEY_SPACE = 32

_KEY_LAUNCH7 :: Int
_KEY_LAUNCH7 = 16777311

_KEY_MINUS :: Int
_KEY_MINUS = 45

_BUTTON_XBUTTON1 :: Int
_BUTTON_XBUTTON1 = 8

_JOY_SONY_SQUARE :: Int
_JOY_SONY_SQUARE = 2

_KEY_BACK :: Int
_KEY_BACK = 16777280

_TYPE_INT :: Int
_TYPE_INT = 2

_KEY_THREESUPERIOR :: Int
_KEY_THREESUPERIOR = 179

_KEY_AGRAVE :: Int
_KEY_AGRAVE = 192

_KEY_QUOTEDBL :: Int
_KEY_QUOTEDBL = 34

_TYPE_NIL :: Int
_TYPE_NIL = 0

_KEY_UCIRCUMFLEX :: Int
_KEY_UCIRCUMFLEX = 219

_KEY_7 :: Int
_KEY_7 = 55

_JOY_DPAD_DOWN :: Int
_JOY_DPAD_DOWN = 13

_KEY_LAUNCH0 :: Int
_KEY_LAUNCH0 = 16777304

_ERR_INVALID_DATA :: Int
_ERR_INVALID_DATA = 30

_OP_DIVIDE :: Int
_OP_DIVIDE = 9

_TYPE_COLOR_ARRAY :: Int
_TYPE_COLOR_ARRAY = 26

_KEY_W :: Int
_KEY_W = 87

_KEY_CENT :: Int
_KEY_CENT = 162

_OP_EQUAL :: Int
_OP_EQUAL = 0

_JOY_DPAD_UP :: Int
_JOY_DPAD_UP = 12

_JOY_ANALOG_LX :: Int
_JOY_ANALOG_LX = 0

_JOY_AXIS_4 :: Int
_JOY_AXIS_4 = 4

_KEY_J :: Int
_KEY_J = 74

_BUTTON_MASK_LEFT :: Int
_BUTTON_MASK_LEFT = 1

_ERR_COMPILATION_FAILED :: Int
_ERR_COMPILATION_FAILED = 36

_KEY_F13 :: Int
_KEY_F13 = 16777256

_JOY_OPENVR_TOUCHPADY :: Int
_JOY_OPENVR_TOUCHPADY = 1

_KEY_SSHARP :: Int
_KEY_SSHARP = 223

_PROPERTY_HINT_GLOBAL_FILE :: Int
_PROPERTY_HINT_GLOBAL_FILE = 15

_JOY_BUTTON_11 :: Int
_JOY_BUTTON_11 = 11

_OP_LESS_EQUAL :: Int
_OP_LESS_EQUAL = 3

_METHOD_FLAG_NOSCRIPT :: Int
_METHOD_FLAG_NOSCRIPT = 4

_OP_BIT_AND :: Int
_OP_BIT_AND = 16

_PROPERTY_HINT_EXP_EASING :: Int
_PROPERTY_HINT_EXP_EASING = 4

_KEY_EACUTE :: Int
_KEY_EACUTE = 201

_ERR_METHOD_NOT_FOUND :: Int
_ERR_METHOD_NOT_FOUND = 37

_KEY_COMMA :: Int
_KEY_COMMA = 44

_PROPERTY_HINT_RANGE :: Int
_PROPERTY_HINT_RANGE = 1

_KEY_A :: Int
_KEY_A = 65

_KEY_KP_PERIOD :: Int
_KEY_KP_PERIOD = 16777348

_METHOD_FLAG_NORMAL :: Int
_METHOD_FLAG_NORMAL = 1

_KEY_LAUNCHF :: Int
_KEY_LAUNCHF = 16777319

_PROPERTY_USAGE_INTERNATIONALIZED :: Int
_PROPERTY_USAGE_INTERNATIONALIZED = 64

_HALIGN_CENTER :: Int
_HALIGN_CENTER = 1

_JOY_OPENVR_MENU :: Int
_JOY_OPENVR_MENU = 1

_OP_NOT_EQUAL :: Int
_OP_NOT_EQUAL = 1

_KEY_KP_6 :: Int
_KEY_KP_6 = 16777356

_KEY_LAUNCHMAIL :: Int
_KEY_LAUNCHMAIL = 16777302

_JOY_L3 :: Int
_JOY_L3 = 8

_JOY_XBOX_Y :: Int
_JOY_XBOX_Y = 3

_PROPERTY_USAGE_SCRIPT_VARIABLE :: Int
_PROPERTY_USAGE_SCRIPT_VARIABLE = 8192

_KEY_OOBLIQUE :: Int
_KEY_OOBLIQUE = 216

_JOY_BUTTON_4 :: Int
_JOY_BUTTON_4 = 4

_ERR_BUG :: Int
_ERR_BUG = 47

_OP_ADD :: Int
_OP_ADD = 6

_KEY_D :: Int
_KEY_D = 68

_JOY_OCULUS_BY :: Int
_JOY_OCULUS_BY = 1

_PROPERTY_HINT_GLOBAL_DIR :: Int
_PROPERTY_HINT_GLOBAL_DIR = 16

_KEY_LAUNCHC :: Int
_KEY_LAUNCHC = 16777316

_PROPERTY_USAGE_NOEDITOR :: Int
_PROPERTY_USAGE_NOEDITOR = 5

_KEY_PERIOD :: Int
_KEY_PERIOD = 46

_OP_BIT_NEGATE :: Int
_OP_BIT_NEGATE = 19

_KEY_KP_3 :: Int
_KEY_KP_3 = 16777353

_PROPERTY_HINT_LAYERS_3D_RENDER :: Int
_PROPERTY_HINT_LAYERS_3D_RENDER = 11

_KEY_ASCIITILDE :: Int
_KEY_ASCIITILDE = 126

_KEY_RIGHT :: Int
_KEY_RIGHT = 16777233

_ERR_CYCLIC_LINK :: Int
_ERR_CYCLIC_LINK = 40

_JOY_BUTTON_1 :: Int
_JOY_BUTTON_1 = 1

_JOY_ANALOG_RX :: Int
_JOY_ANALOG_RX = 2

_BUTTON_WHEEL_DOWN :: Int
_BUTTON_WHEEL_DOWN = 5

_KEY_ICIRCUMFLEX :: Int
_KEY_ICIRCUMFLEX = 206

_JOY_SONY_CIRCLE :: Int
_JOY_SONY_CIRCLE = 1

_MIDI_MESSAGE_NOTE_ON :: Int
_MIDI_MESSAGE_NOTE_ON = 9

_KEY_ADIAERESIS :: Int
_KEY_ADIAERESIS = 196

_MIDI_MESSAGE_CHANNEL_PRESSURE :: Int
_MIDI_MESSAGE_CHANNEL_PRESSURE = 13

_KEY_STOP :: Int
_KEY_STOP = 16777282

_HALIGN_LEFT :: Int
_HALIGN_LEFT = 0

_KEY_PARENLEFT :: Int
_KEY_PARENLEFT = 40

_TYPE_VECTOR2 :: Int
_TYPE_VECTOR2 = 5

_KEY_F5 :: Int
_KEY_F5 = 16777248

_OP_AND :: Int
_OP_AND = 20

_KEY_PAUSE :: Int
_KEY_PAUSE = 16777225

_KEY_INSERT :: Int
_KEY_INSERT = 16777223

_OP_SUBTRACT :: Int
_OP_SUBTRACT = 7

_KEY_BASSDOWN :: Int
_KEY_BASSDOWN = 16777289

_KEY_PERIODCENTERED :: Int
_KEY_PERIODCENTERED = 183

_KEY_LAUNCH9 :: Int
_KEY_LAUNCH9 = 16777313

_PROPERTY_HINT_MULTILINE_TEXT :: Int
_PROPERTY_HINT_MULTILINE_TEXT = 18

_KEY_PAGEDOWN :: Int
_KEY_PAGEDOWN = 16777236

_JOY_OCULUS_AX :: Int
_JOY_OCULUS_AX = 7

_PROPERTY_USAGE_NO_INSTANCE_STATE :: Int
_PROPERTY_USAGE_NO_INSTANCE_STATE = 2048

_ERR_FILE_NOT_FOUND :: Int
_ERR_FILE_NOT_FOUND = 7

_TYPE_REAL_ARRAY :: Int
_TYPE_REAL_ARRAY = 22

_KEY_NUMBERSIGN :: Int
_KEY_NUMBERSIGN = 35

_KEY_ONEQUARTER :: Int
_KEY_ONEQUARTER = 188

_PROPERTY_USAGE_CHECKABLE :: Int
_PROPERTY_USAGE_CHECKABLE = 16

_KEY_5 :: Int
_KEY_5 = 53

_TYPE_BOOL :: Int
_TYPE_BOOL = 1

_KEY_LAUNCH2 :: Int
_KEY_LAUNCH2 = 16777306

_OK :: Int
_OK = 0

_KEY_STANDBY :: Int
_KEY_STANDBY = 16777300

_KEY_CONTROL :: Int
_KEY_CONTROL = 16777238

_KEY_U :: Int
_KEY_U = 85

_ERR_INVALID_PARAMETER :: Int
_ERR_INVALID_PARAMETER = 31

_KEY_DIRECTION_L :: Int
_KEY_DIRECTION_L = 16777266

_PROPERTY_HINT_PLACEHOLDER_TEXT :: Int
_PROPERTY_HINT_PLACEHOLDER_TEXT = 19

_JOY_AXIS_6 :: Int
_JOY_AXIS_6 = 6

_OP_XOR :: Int
_OP_XOR = 22

_KEY_H :: Int
_KEY_H = 72

_ERR_LINK_FAILED :: Int
_ERR_LINK_FAILED = 38

_KEY_F11 :: Int
_KEY_F11 = 16777254

_KEY_SUPER_L :: Int
_KEY_SUPER_L = 16777260

_METHOD_FLAG_VIRTUAL :: Int
_METHOD_FLAG_VIRTUAL = 32

_JOY_BUTTON_13 :: Int
_JOY_BUTTON_13 = 13

_ERR_DOES_NOT_EXIST :: Int
_ERR_DOES_NOT_EXIST = 33

_KEY_MENU :: Int
_KEY_MENU = 16777262

_KEY_LEFT :: Int
_KEY_LEFT = 16777231

_TYPE_OBJECT :: Int
_TYPE_OBJECT = 17

_JOY_DS_X :: Int
_JOY_DS_X = 3

_ERR_DATABASE_CANT_READ :: Int
_ERR_DATABASE_CANT_READ = 34

_KEY_ESCAPE :: Int
_KEY_ESCAPE = 16777217

_TYPE_RAW_ARRAY :: Int
_TYPE_RAW_ARRAY = 20

_ERR_OUT_OF_MEMORY :: Int
_ERR_OUT_OF_MEMORY = 6

_ERR_CANT_CREATE :: Int
_ERR_CANT_CREATE = 20

_KEY_VOLUMEDOWN :: Int
_KEY_VOLUMEDOWN = 16777284

_KEY_O :: Int
_KEY_O = 79

_KEY_F16 :: Int
_KEY_F16 = 16777259

_KEY_MEDIARECORD :: Int
_KEY_MEDIARECORD = 16777296

_KEY_GUILLEMOTLEFT :: Int
_KEY_GUILLEMOTLEFT = 171

_KEY_ETH :: Int
_KEY_ETH = 208

_KEY_DIAERESIS :: Int
_KEY_DIAERESIS = 168

_KEY_REFRESH :: Int
_KEY_REFRESH = 16777283

_KEY_LAUNCHMEDIA :: Int
_KEY_LAUNCHMEDIA = 16777303

_JOY_BUTTON_14 :: Int
_JOY_BUTTON_14 = 14

_KEY_FAVORITES :: Int
_KEY_FAVORITES = 16777298

_KEY_EXCLAM :: Int
_KEY_EXCLAM = 33

_KEY_KP_8 :: Int
_KEY_KP_8 = 16777358

_ERR_FILE_CANT_READ :: Int
_ERR_FILE_CANT_READ = 14

_PROPERTY_HINT_IMAGE_COMPRESS_LOSSLESS :: Int
_PROPERTY_HINT_IMAGE_COMPRESS_LOSSLESS = 22

_KEY_ONESUPERIOR :: Int
_KEY_ONESUPERIOR = 185

_KEY_UDIAERESIS :: Int
_KEY_UDIAERESIS = 220

_JOY_R3 :: Int
_JOY_R3 = 9

_KEY_ARING :: Int
_KEY_ARING = 197

_KEY_MASCULINE :: Int
_KEY_MASCULINE = 186

_KEY_HYPER_L :: Int
_KEY_HYPER_L = 16777263

_JOY_AXIS_1 :: Int
_JOY_AXIS_1 = 1

_KEY_LAUNCHE :: Int
_KEY_LAUNCHE = 16777318

_KEY_UNKNOWN :: Int
_KEY_UNKNOWN = 33554431

_KEY_KP_5 :: Int
_KEY_KP_5 = 16777355

_JOY_OCULUS_MENU :: Int
_JOY_OCULUS_MENU = 3

_TYPE_QUAT :: Int
_TYPE_QUAT = 10

_JOY_BUTTON_7 :: Int
_JOY_BUTTON_7 = 7

_KEY_VOLUMEUP :: Int
_KEY_VOLUMEUP = 16777286

_PROPERTY_HINT_KEY_ACCEL :: Int
_PROPERTY_HINT_KEY_ACCEL = 7

_JOY_SELECT :: Int
_JOY_SELECT = 10

_KEY_LESS :: Int
_KEY_LESS = 60

_MIDI_MESSAGE_NOTE_OFF :: Int
_MIDI_MESSAGE_NOTE_OFF = 8

_KEY_B :: Int
_KEY_B = 66

_KEY_F2 :: Int
_KEY_F2 = 16777245

_JOY_R :: Int
_JOY_R = 5

_KEY_TAB :: Int
_KEY_TAB = 16777218

_BUTTON_MASK_XBUTTON2 :: Int
_BUTTON_MASK_XBUTTON2 = 256

_KEY_PERCENT :: Int
_KEY_PERCENT = 37

_JOY_XBOX_A :: Int
_JOY_XBOX_A = 0

_KEY_9 :: Int
_KEY_9 = 57

_ERR_ALREADY_IN_USE :: Int
_ERR_ALREADY_IN_USE = 22

_KEY_END :: Int
_KEY_END = 16777230

_TYPE_DICTIONARY :: Int
_TYPE_DICTIONARY = 18

_KEY_GUILLEMOTRIGHT :: Int
_KEY_GUILLEMOTRIGHT = 187

_KEY_FORWARD :: Int
_KEY_FORWARD = 16777281

_KEY_DOLLAR :: Int
_KEY_DOLLAR = 36

_KEY_Y :: Int
_KEY_Y = 89

_ERR_LOCKED :: Int
_ERR_LOCKED = 23

_METHOD_FLAGS_DEFAULT :: Int
_METHOD_FLAGS_DEFAULT = 1

_KEY_ASCIICIRCUM :: Int
_KEY_ASCIICIRCUM = 94

_OP_BIT_XOR :: Int
_OP_BIT_XOR = 18

_PROPERTY_USAGE_DEFAULT :: Int
_PROPERTY_USAGE_DEFAULT = 7

_KEY_BRACELEFT :: Int
_KEY_BRACELEFT = 123

_ERR_BUSY :: Int
_ERR_BUSY = 44

_KEY_SHIFT :: Int
_KEY_SHIFT = 16777237

_ERR_DATABASE_CANT_WRITE :: Int
_ERR_DATABASE_CANT_WRITE = 35

_KEY_F7 :: Int
_KEY_F7 = 16777250

_KEY_ENTER :: Int
_KEY_ENTER = 16777221

_JOY_BUTTON_MAX :: Int
_JOY_BUTTON_MAX = 16

_KEY_MULTIPLY :: Int
_KEY_MULTIPLY = 215

_VALIGN_BOTTOM :: Int
_VALIGN_BOTTOM = 2

_KEY_IDIAERESIS :: Int
_KEY_IDIAERESIS = 207

_PROPERTY_HINT_COLOR_NO_ALPHA :: Int
_PROPERTY_HINT_COLOR_NO_ALPHA = 20

_METHOD_FLAG_EDITOR :: Int
_METHOD_FLAG_EDITOR = 2

_KEY_3 :: Int
_KEY_3 = 51

_PROPERTY_USAGE_EDITOR :: Int
_PROPERTY_USAGE_EDITOR = 2

_METHOD_FLAG_FROM_SCRIPT :: Int
_METHOD_FLAG_FROM_SCRIPT = 64

_KEY_LAUNCH4 :: Int
_KEY_LAUNCH4 = 16777308

_TYPE_VECTOR2_ARRAY :: Int
_TYPE_VECTOR2_ARRAY = 24

_KEY_EGRAVE :: Int
_KEY_EGRAVE = 200

_BUTTON_XBUTTON2 :: Int
_BUTTON_XBUTTON2 = 9

_KEY_S :: Int
_KEY_S = 83

_TYPE_RID :: Int
_TYPE_RID = 16

_PROPERTY_USAGE_DEFAULT_INTL :: Int
_PROPERTY_USAGE_DEFAULT_INTL = 71

_PROPERTY_HINT_FILE :: Int
_PROPERTY_HINT_FILE = 13

_KEY_HYPHEN :: Int
_KEY_HYPHEN = 173

_KEY_F8 :: Int
_KEY_F8 = 16777251

_ERR_DUPLICATE_SYMBOL :: Int
_ERR_DUPLICATE_SYMBOL = 42

_ERR_FILE_NO_PERMISSION :: Int
_ERR_FILE_NO_PERMISSION = 10

_KEY_HOMEPAGE :: Int
_KEY_HOMEPAGE = 16777297