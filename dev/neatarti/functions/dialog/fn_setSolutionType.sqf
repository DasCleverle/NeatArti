#include "script_component.hpp"

disableSerialization;

params ["_control", "_index"];

private ["_display"];
_display = ctrlParent _control;

GVAR(solutionType) = SOLUTIONTYPES select _index;
GVAR(solutionTypeIndex) = _index;

[_display displayCtrl IDC_LNB_SOLUTIONS, GVAR(solutionType)] call FUNC(setSolutions);