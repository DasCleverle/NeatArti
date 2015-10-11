#include "script_component.hpp"

disableSerialization;
params ["_control"];

[ctrlParent _control] call FUNC(saveInputs);
[_control, "main"] call FUNC(switchPage);