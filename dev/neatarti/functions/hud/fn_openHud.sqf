#include "script_component.hpp"

params ["_hudName", "_idc"];

if(_hudName in GVAR(visibleHuds)) exitWith {};

(findDisplay IDD_DISPLAYMISSION) ctrlCreate [_hudName, _idc];
GVAR(visibleHuds) pushBack _hudName;