#include "script_component.hpp"

params ["_targetPos", "_targetHeight", "_magazine"];

private ["_velocity", "_initSpeed", "_artilleryCharge", "_height", "_solutions"];

_height = _targetHeight - GVAR(settingsHeight);
_velocity = [RANGE(GVAR(settingsPos), _targetPos), _height, _magazine] call FUNC(getVelocity);
_solutions = [_velocity, GVAR(settingsPos), _targetPos, _height] call FUNC(calculate);

_solutions;