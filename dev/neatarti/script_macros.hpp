#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#include "ui_macros.hpp"

// Functional macros
#define DATAPATH(FILE) PATHTOF(data\FILE)
#define QDATAPATH(FILE) QUOTE(DATAPATH(FILE))
#define FUNCFILE(CLASS) PATHTOF(functions\CLASS)

// Colors
#define COLOR_TR 0,0,0,0

#define COLOR_BLACK_TR25 0,0,0,0.25
#define COLOR_BLACK_TR50 0,0,0,0.5
#define COLOR_BLACK_TR80 0,0,0,0.8
#define COLOR_BLACK 0,0,0,1

#define COLOR_WHITE_TR25 1,1,1,0.25
#define COLOR_WHITE_TR50 1,1,1,0.5
#define COLOR_WHITE 1,1,1,1
