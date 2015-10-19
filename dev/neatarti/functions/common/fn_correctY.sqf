#include "script_component.hpp"

params ["_y"];

if(GVAR(YInvertionWeight) != 0) then {
    _y = GVAR(YInvertionWeight) - _y;
};

_y;