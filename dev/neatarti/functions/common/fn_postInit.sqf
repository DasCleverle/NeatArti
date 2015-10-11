#include "script_component.hpp"

GVAR(artyConfigs) = configProperties [configFile >> "CfgVehicles", 'isClass _x && { getNumber(_x >> "artilleryScanner") != 0 }', false];
GVAR(artyNames) = [];

GVAR(weaponConfigs) = [];
GVAR(weaponNames) = [];

GVAR(magazineConfigs) = [];
GVAR(magazineNames) = ["MISSING SETTING"];

GVAR(modeConfigs) = [];
GVAR(modesHash) = [] call CBA_fnc_hashCreate;

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

GVAR(settingsPos) = [0,0];
GVAR(settingsHeight) = 0;
GVAR(settingsWeapon) = 0;

GVAR(attackType) = PAGES select 0;

GVAR(solutionType) = SOLUTIONTYPES select 0;
GVAR(solutionsHigh) = [];
GVAR(solutionsLow) = [];