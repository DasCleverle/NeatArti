#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

GVAR(artyConfigs) = configProperties [configFile >> "CfgVehicles", 'isClass _x && { getNumber(_x >> "artilleryScanner") != 0 }', false];
GVAR(artyNames) = [];

GVAR(weaponConfigs) = [];
GVAR(weaponNames) = [];

GVAR(magazineConfigs) = [];
GVAR(magazineNames) = ["MISSING SETTING"];

GVAR(modeConfigs) = [];

{
    _displayName = getText(_x >> "displayName");
    if !(_displayName in GVAR(artyNames)) then {
        GVAR(artyNames) pushBack _displayName;
    };

    _weapons = getArray(_x >> "Turrets" >> "MainTurret" >> "weapons");
    {
        _config = configFile >> "CfgWeapons" >> _x;
        if !(_config in GVAR(weaponConfigs)) then {
            GVAR(weaponConfigs) pushBack _config;
            GVAR(weaponNames) pushBack getText(_config >> "displayName");
        };
    } foreach _weapons;
} foreach GVAR(artyConfigs);

GVAR(settingsSaved) = false;
GVAR(settingsPos) = [0,0];
GVAR(settingsHeight) = 0;
GVAR(settingsWeapon) = 0;

GVAR(attackType) = PAGES select 0;

GVAR(solutionType) = SOLUTIONTYPES select 0;
GVAR(solutionTypeIndex) = 0;
GVAR(solutionsHigh) = [];
GVAR(solutionsLow) = [];

GVAR(hudSolutionsScrolling) = false;
GVAR(hudSolutionsVisible) = false;

private ["_gridOrigin", "_gridStep", "_yOrigin", "_yStep"];
_gridOrigin = mapGridPosition [0,0];
_gridStep = mapGridPosition [0,100];

_yOrigin = _gridOrigin select [3,5];
_yStep = _gridStep select [3,5];

GVAR(YInvertionWeight) = 0;

if((parseNumber _yOrigin) > (parseNumber _yStep)) then {
    _mapSize = getNumber(configFile >> "CfgWorlds" >> worldName >> "mapSize");

    _mapSize = _mapSize / 100;
    _mapSize = round(_mapSize);
    _mapSize = _mapSize * 100;

    GVAR(YInvertionWeight) = _mapSize;
};

private ["_addonName"];
_addonName = "Neat Artillery";
[_addonName, QUOTE(GVAR(openArtyCalc)), "Open Artillery Calculator", { true }, FUNC(openArtyCalc), [DIK_J, [false, false, true]]] call CBA_fnc_addKeybind;
[_addonName, QUOTE(GVAR(toggleHudSolutions)), "Toggle Solution-Info", { true }, FUNC(toggleHudSolutions), [DIK_H, [false, false, true]]] call CBA_fnc_addKeybind;
[_addonName, QUOTE(GVAR(toggleHudSolutionsScroll)), "Toggle Solution-Info scrolling", { true }, FUNC(toggleHudSolutionsScroll), [DIK_H, [false, true, false]]] call CBA_fnc_addKeybind;