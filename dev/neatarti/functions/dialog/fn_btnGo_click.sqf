#include "script_component.hpp"

disableSerialization;
params ["_control"];

private ["_display", "_inputs", "_solutions", "_mode"];
_display = ctrlParent _control;

_inputs = [_display] call FUNC(getInputs);
if(isNil "_inputs") exitWith {};

_solutions = _inputs call (missionNamespace getVariable format ["%1_fnc_%2Attack", QUOTE(ADDON), GVAR(attackType)]);

GVAR(solutionsHigh) = _solutions select 0;
GVAR(solutionsLow) =  _solutions select 1;

[_display displayCtrl IDC_LNB_SOLUTIONS, GVAR(solutionType)] call FUNC(setSolutions);

_mode = [RANGE(_inputs select 0, GVAR(settingsPos)), (_inputs select 1) - GVAR(settingsHeight), _inputs select 2] call FUNC(getMode);
(_display displayCtrl IDC_LBL_MODE) ctrlSetText ("Mode: " + _mode);

[_display] call FUNC(saveInputs);