#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#include "ui_macros.hpp"

// Constants
#define PAGES ["main", "point", "line", "area"]
#define SOLUTIONTYPES ["H", "L"]

#define COORDLEN 5
#define COORD_FACTOR 1

#define LOAD_INTERVAL 0.01

#define g 9.81

// Functional macros
#define DATAPATH(FILE) PATHTOF(data\FILE)
#define QDATAPATH(FILE) QUOTE(DATAPATH(FILE))
#define FUNCFILE(CLASS) PATHTOF(functions\CLASS)

#define COORDPAD(var1) ([var1, "0", COORDLEN] call FUNC(padLeft))
#define TOMILS(var1) (((round (var1 * 6400 / 360)) + 6400) % 6400)

#define UNICODE_ZERO 48
#define CAN_BE_PARSED(var1) (IS_STRING(var1) && { parseNumber var1 != 0 || { count var1 == ({ _x == UNICODE_ZERO } count toArray var1)}})
#define COORD_IS_VALID(var1) (CAN_BE_PARSED(var1) && { count var1 == COORDLEN })
#define ROUND_NUMBER(NUMBER, DIGITS) (round (NUMBER * 10 ^ DIGITS) / 10 ^ DIGITS)

#define RANGE(POS, TPOS) ((POS distance TPOS) * COORD_FACTOR)
#define ELEV_DISC(V, R, H)  (V^4 - g * (g * R^2 + 2 * H * V^2))

// Colors
#define COLOR_TR 0,0,0,0

#define COLOR_BLACK_TR25 0,0,0,0.25
#define COLOR_BLACK_TR50 0,0,0,0.5
#define COLOR_BLACK_TR80 0,0,0,0.8
#define COLOR_BLACK 0,0,0,1

#define COLOR_WHITE_TR25 1,1,1,0.25
#define COLOR_WHITE_TR50 1,1,1,0.5
#define COLOR_WHITE 1,1,1,1

// Control Types
#define CT_TEXTBOX       2
#define CT_COMBO         4
#define CT_TOOLBOX       6
#define CT_LISTNBOX      102