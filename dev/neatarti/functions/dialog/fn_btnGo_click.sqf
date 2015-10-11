#include "script_component.hpp"

disableSerialization;
params ["_control"];

private ["_display", "_inputs", "_solutions"];
_display = ctrlParent _control;

_inputs = [_display] call FUNC(getInputs);
_solutions = _inputs call (missionNamespace getVariable format ["%1_fnc_%2Attack", QUOTE(ADDON), GVAR(attackType)]);

GVAR(solutionsHigh) = _solutions select 0;
GVAR(solutionsLow) =  _solutions select 1;

[_display displayCtrl IDC_LNB_SOLUTIONS, GVAR(solutionType)] call FUNC(setSolutions);

[_display] call FUNC(saveInputs);