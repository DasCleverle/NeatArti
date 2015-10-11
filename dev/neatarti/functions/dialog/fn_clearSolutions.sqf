#include "script_component.hpp"

params ["_lnbSolutions"];

lnbClear _lnbSolutions;
_lnbSolutions lnbAddRow ["", "DIST", "ELEV", "DIR", "TIME"];