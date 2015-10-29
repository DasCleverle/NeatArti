#include "script_component.hpp"
disableSerialization;

params ["_control"];

private ["_lnbSolutions"];
_lnbSolutions = (ctrlParent _control) displayCtrl IDC_LNB_SOLUTIONS;

[_lnbSolutions, GVAR(solutionType)] call FUNC(setSolutions);

_lnbSolutions ctrlSetAutoScrollDelay 3;
_lnbSolutions ctrlSetAutoScrollSpeed 0.5;
_lnbSolutions ctrlSetAutoScrollRewind true;
GVAR(hudScrolling) = true;