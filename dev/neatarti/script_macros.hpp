#include "\x\cba\addons\main\script_macros_common.hpp"
#include "\x\cba\addons\xeh\script_xeh.hpp"

#include "ui_macros.hpp"


// Functional macros
#define DATAPATH(FILE) PATHTOF(data\FILE)
#define QDATAPATH(FILE) QUOTE(DATAPATH(FILE))
#define FUNCFILE(CLASS) PATHTOF(functions\CLASS)