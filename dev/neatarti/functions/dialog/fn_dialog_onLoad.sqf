#include "script_component.hpp"

disableSerialization;
params ["_display"];

[_display, GVAR(attackType), false] call FUNC(switchPage);