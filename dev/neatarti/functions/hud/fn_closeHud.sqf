#include "script_component.hpp"

params ["_hudName", "_idc"];

ctrlDelete ((findDisplay IDD_DISPLAYMISSION) displayCtrl _idc);
GVAR(visibleHuds) = GVAR(visibleHuds) - [_hudName];