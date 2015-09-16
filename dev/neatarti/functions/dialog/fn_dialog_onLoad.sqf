#include "script_component.hpp"

disableSerialization;
params ["_display"];

[_display, GVAR(currentAttackType), false] call FUNC(switchPage);