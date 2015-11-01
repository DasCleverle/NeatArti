#include "script_component.hpp"

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