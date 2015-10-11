#include "script_component.hpp"

disableSerialization;
params ["_control"];

private ["_display", "_inputs"];
_display = ctrlParent _control;

_inputs = [_display] call FUNC(getInputs);
_solutions = _inputs call (missionNamespace getVariable format ["%1_fnc_%2Attack", QUOTE(ADDON), GVAR(attackType)]);

[_display displayCtrl IDC_LNB_SOLUTIONS, "H", _solutions] call FUNC(setSolutions);