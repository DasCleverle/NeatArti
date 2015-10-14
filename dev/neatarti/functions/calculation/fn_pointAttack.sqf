#include "script_component.hpp"

params ["_targetPos", "_height", "_magazine"];

private ["_modeVelocity", "_initSpeed", "_artilleryCharge", "_solutions"];

_modeVelocity = [RANGE(GVAR(settingsPos), _targetPos), _height, _magazine] call FUNC(getModeAndVelocity);
_solutions = [_modeVelocity select 1, GVAR(settingsPos), _targetPos, _height] call FUNC(calculate);

(_solutions select 0) pushBack (_modeVelocity select 0);
(_solutions select 1) pushBack (_modeVelocity select 0);

_solutions set [0, [_solutions select 0]];
_solutions set [1, [_solutions select 1]];

_solutions;