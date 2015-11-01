#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

private ["_addonName"];
_addonName = "Neat Artillery";
[_addonName, QGVAR(openArtyCalc), "Open Artillery Calculator", { true }, FUNC(openArtyCalc), [DIK_J, [false, false, true]]] call CBA_fnc_addKeybind;
[_addonName, QGVAR(toggleHudSolutions), "Toggle Solution-Info", { true }, FUNC(toggleHudSolutions), [DIK_H, [false, false, true]]] call CBA_fnc_addKeybind;
[_addonName, QGVAR(toggleHudSolutionsScroll), "Toggle Solution-Info scrolling", { true }, FUNC(toggleHudSolutionsScroll), [DIK_H, [false, true, false]]] call CBA_fnc_addKeybind;