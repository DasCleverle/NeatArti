#include "script_component.hpp"

if(vehicle player == player || { getNumber(configFile >> "CfgVehicles" >> typeOf vehicle player >> "artilleryScanner") != 1 }) exitWith {
    [QGVAR(hudArtyInfo), IDC_HUD_ARTYINFO] call FUNC(closeHud);
};