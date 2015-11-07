#include "script_component.hpp"
disableSerialization;

params ["_control"];

[ctrlParent _control, true] call FUNC(loadInputs);